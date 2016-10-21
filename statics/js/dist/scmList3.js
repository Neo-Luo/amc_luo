var queryConditions = {
	matchCon: ""
},
	SYSTEM = system = parent.SYSTEM,
	hiddenAmount = !1,
	billRequiredCheck = system.billRequiredCheck,
	THISPAGE = {
		init: function() {
			SYSTEM.isAdmin !== !1 || SYSTEM.rights.AMOUNT_OUTAMOUNT || (hiddenAmount = !0);
			this.initDom();
			this.loadGrid();
			this.addEvent()
		},
		initDom: function() {
			this.$_matchCon = $("#matchCon");
			this.$_beginDate = $("#beginDate").val(system.beginDate);
			this.$_endDate = $("#endDate").val(system.endDate);
			this.$_matchCon.placeholder();
			this.$_beginDate.datepicker();
			this.$_endDate.datepicker()
		},
		loadGrid: function() {
			function t(t, e, i) {
				var a = '<div class="operating" data-id="' + i.id + '"><a class="ui-icon ui-icon-pencil" title="修改"></a><a class="ui-icon ui-icon-trash" title="删除"></a></div>';
				return a
			}
			function e(t, e, i) {
				if (1 === t) return "销货";
				a.markRow.push(i.id);
				return "退货"
			}
			var i = Public.setGrid(),
				a = this;
			queryConditions.beginDate = this.$_beginDate.val();
			queryConditions.endDate = this.$_endDate.val();
			a.markRow = [];
			var r = [{
				name: "operating",
				label: "操作",
				width: 60,
				fixed: !0,
				formatter: t,
				align: "center"
			}, {
				name: "billDate",
				label: "单据日期",
				index: "billDate",
				width: 100,
				align: "center"
			}, {
				name: "billNo",
				label: "单据编号",
				index: "billNo",
				width: 150,
				align: "center"
			},  {
				name: "contactName",
				label: "客户",
				index: "contactName",
				width: 200
			}, {
				name: "needmoney",
				label: "应收款",
				hidden: hiddenAmount,
				index: "needmoney",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "paidmoney",
				label: "已收款",
				hidden: hiddenAmount,
				index: "paidmoney",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "payingmoney",
				label: "欠款",
				hidden: hiddenAmount,
				index: "payingmoney",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "description",
				label: "备注",
				index: "description",
				width: 365,
				title: !0,
				classes: "ui-ellipsis"
			}, {
				name: "disEditable",
				label: "不可编辑",
				index: "disEditable",
				hidden: !0
			}];
			$("#grid").jqGrid({
				//url: "/scm/invSa.do?action=list",
				url: scm_lists3,
				postData: queryConditions,
				datatype: "json",
				autowidth: !0,
				height: i.h,
				altRows: !0,
				gridview: !0,
				multiselect: !0,
				colModel: r,
				cmTemplate: {
					sortable: !1,
					title: !1
				},
				page: 1,
				sortname: "number",
				sortorder: "desc",
				pager: "#page",
				rowNum: 100,
				rowList: [100, 200, 500],
				viewrecords: !0,
				shrinkToFit: !1,
				forceFit: !1,
				jsonReader: {
					root: "data.rows",
					records: "data.records",
					total: "data.total",
					repeatitems: !1,
					id: "id"
				},
				loadComplete: function() {
					var t = a.markRow.length;
					if (t > 0) for (var e = 0; t > e; e++) $("#" + a.markRow[e]).addClass("red")
				},
				loadError: function() {},
				ondblClickRow: function(t) {
					$("#" + t).find(".ui-icon-pencil").trigger("click")
				}
			})
		},
		reloadData: function(t) {
			this.markRow = [];
			$("#grid").jqGrid("setGridParam", {
				//url: "/scm/invSa.do?action=list",
				url: scm_lists3,
				datatype: "json",
				postData: t
			}).trigger("reloadGrid")
		},
		addEvent: function() {
			var t = this;
			$(".grid-wrap").on("click", ".ui-icon-pencil", function(t) {
				t.preventDefault();
				var e = $(this).parent().data("id"),
					i = $("#grid").jqGrid("getRowData", e),
					a = 1 == i.disEditable ? "&disEditable=true" : "";
				parent.tab.addTabItem({
					tabid: "sales-sales",
					text: "销货单",
					//url: "/sales/sales.jsp?id=" + e + "&flag=list" + a
					url: scm_edit+"?id=" + e + "&flag=list"
				});
				$("#grid").jqGrid("getDataIDs");
				parent.cacheList.salesId = $("#grid").jqGrid("getDataIDs")
			});
			$(".grid-wrap").on("click", ".ui-icon-trash", function(t) {
				t.preventDefault();
				if (Business.verifyRight("SA_DELETE")) {
					var e = $(this).parent().data("id");
					$.dialog.confirm("您确定要删除该销货记录吗？", function() {
						//Public.ajaxGet("/scm/invSa.do?action=delete", {
						Public.ajaxGet(scm_del, { 			   
							id: e
						}, function(t) {
							if (200 === t.status) {
								$("#grid").jqGrid("delRowData", e);
								parent.Public.tips({
									content: "删除成功！"
								})
							} else parent.Public.tips({
								type: 1,
								content: t.msg
							})
						})
					})
				}
			});
			$(".wrapper").on("click", "#print", function(t) {
				t.preventDefault();
				Business.verifyRight("SA_PRINT") && Public.print({
					title: "购货单列表",
					$grid: $("#grid"),
					pdf: "/scm/invSa.do?action=toPdf",
					billType: 10201,
					filterConditions: queryConditions
				})
			});
			
			$(".wrapper").on("click", "#export", function(t) {
				if (Business.verifyRight("SA_EXPORT")) {
					var e = $("#grid").jqGrid("getGridParam", "selarrrow"),
						i = e.join();
					//if (i) $(this).attr("href", "/scm/invSa.do?action=exportInvSa&id=" + i);
					if (i) $(this).attr("href", scm_export+"?id=" + i);
					else {
						parent.Public.tips({
							type: 2,
							content: "请先选择需要导出的项！"
						});
						t.preventDefault()
					}
				} else t.preventDefault()
			});
			
			$(".wrapper").on("click", "#turning", function(t) {
				if (Business.verifyRight("SA_EXPORT")) {
					var e = $("#grid").jqGrid("getGridParam", "selarrrow"),
						i = e.join();
						var ls = {id:i};
					//if (i) $(this).attr("href", "/scm/invSa.do?action=exportInvSa&id=" + i);
					if (i){ //$(this).attr("href", scm_turning+"?id=" + i);
						$.ajax({
							 type: "POST",
							 url: scm_turningto4,
							 data: ls,
							 //success: function(msg){ alert( "Data Saved: " +   msg ); } 
						});
						parent.Public.tips({
							//type: 2,
							content: "转账成功！"
						});
						THISPAGE.reloadData(queryConditions) 
					}
					else {
						parent.Public.tips({
							type: 2,
							content: "请先选择需要转账的项！"
						});
						t.preventDefault()
					}
				} else t.preventDefault()

			});

			 
			if (billRequiredCheck) {
				{
					$("#audit").css("display", "inline-block"), $("#reAudit").css("display", "inline-block")
				}
				$(".wrapper").on("click", "#audit", function(t) {
					t.preventDefault();
					var e = $("#grid").jqGrid("getGridParam", "selarrrow"),
						i = e.join();
					i ? Public.ajaxPost("/scm/invSa.do?action=batchCheckInvSa", {
						id: i
					}, function(t) {
						if (200 === t.status) {
							for (var i = 0, a = e.length; a > i; i++) $("#grid").setCell(e[i], "checkName", system.realName);
							parent.Public.tips({
								content: "审核成功！"
							})
						} else parent.Public.tips({
							type: 1,
							content: t.msg
						})
					}) : parent.Public.tips({
						type: 2,
						content: "请先选择需要审核的项！"
					})
				});
				$(".wrapper").on("click", "#reAudit", function(t) {
					t.preventDefault();
					var e = $("#grid").jqGrid("getGridParam", "selarrrow"),
						i = e.join();
					i ? Public.ajaxPost("/scm/invSa.do?action=rsBatchCheckInvSa", {
						id: i
					}, function(t) {
						if (200 === t.status) {
							for (var i = 0, a = e.length; a > i; i++) $("#grid").setCell(e[i], "checkName", "&#160;");
							parent.Public.tips({
								content: "反审核成功！"
							})
						} else parent.Public.tips({
							type: 1,
							content: t.msg
						})
					}) : parent.Public.tips({
						type: 2,
						content: "请先选择需要反审核的项！"
					})
				})
			}
			$("#search").click(function() {
				queryConditions.matchCon = "请输入单据号或客户名或备注" === t.$_matchCon.val() ? "" : $.trim(t.$_matchCon.val());
				queryConditions.beginDate = t.$_beginDate.val();
				queryConditions.endDate = t.$_endDate.val();
				THISPAGE.reloadData(queryConditions)
			});
			$("#refresh").click(function() {
				THISPAGE.reloadData(queryConditions)
			});
			$("#add").click(function(t) {
				t.preventDefault();
				Business.verifyRight("SCM_ADD") && parent.tab.addTabItem({
					tabid: "sales-sales",
					text: "销货单",
					//url: "/scm/invSa.do?action=initSale"
					url: scm_add
				})
			});
			$(window).resize(function() {
				Public.resizeGrid()
			})
		}
	};
THISPAGE.init();