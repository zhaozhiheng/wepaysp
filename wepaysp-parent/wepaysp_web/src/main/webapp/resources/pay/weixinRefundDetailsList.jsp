<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="manage" uri="/permission-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>微信退款明细</title>
	<link href="<%=request.getContextPath()%>/css/zxbgstyle.css" rel="stylesheet" />
</head>
<body class="bgbj">
	<div class="rightbg">
		<s:if test="userLevel == 1 || userLevel == 2">
			<s:set name="navTag">分润计算</s:set>
		</s:if>
		<s:elseif test="userLevel == 3 || userLevel == 4 || userLevel == 5">
			<s:set name="navTag">资金结算</s:set>
		</s:elseif>
		<div class="bgposition">您现在的位置：<s:property value="#navTag" />&gt;微信退款明细</div>
		<s:form id="queryForm" method="post">
			<div class="bgtj">
				<ul class="tj_title">
					<li>查询条件</li>
				</ul>
				<ul class="bg_tjtab">
					<li>
						<div class="query_condition">
							<s:if test="userLevel  > 0 && userLevel  <= 4">
								<s:set name="resetFlag" value="true"/>
								<s:if test="userLevel  == 1">
									<s:if test="partnerVoListLevel == 2">
										<div class="condition_field">
											<span class="field_label">服务商</span>
		                                	<s:select list="partnerVoList" listKey="iwoid" listValue="company" name="weixinRefundDetailsVO.partner2Oid"  id="partner2Oid" headerKey="" headerValue="全部"/>
	                                	</div>
									</s:if>
									<s:elseif test="partnerVoListLevel == 3">
										<div class="condition_field">
											<span class="field_label">服务商</span>
		                                	<s:select list="partnerVoList" listKey="iwoid" listValue="company" name="weixinRefundDetailsVO.partner3Oid"  id="partner3Oid" headerKey="" headerValue="全部"/>
	                                	</div>
									</s:elseif>
									<div class="condition_field">
										<span class="field_label">业务员ID</span>
										<s:textfield name="weixinRefundDetailsVO.partnerEmployeeId" id="partnerEmployeeId" maxlength="10"/>
									</div>
								</s:if>
								<s:if test="userLevel  == 1 || userLevel  == 2">
									<div class="condition_field">
										<span class="field_label">商家ID</span>
										<s:textfield name="weixinRefundDetailsVO.dealerId" id="dealerId" maxlength="9"/>
									</div>
								</s:if>
								<s:if test="userLevel  == 1 || userLevel  == 2 || userLevel  == 3">
									<div class="condition_field">
										<span class="field_label">门店ID</span>
										<s:textfield name="weixinRefundDetailsVO.storeId" id="storeId" maxlength="9"/>
									</div>
								</s:if>
								<div class="condition_field">
									<span class="field_label">收银员ID</span>
									<s:textfield name="weixinRefundDetailsVO.dealerEmployeeId" id="dealerEmployeeId" maxlength="10"/>
								</div>
							</s:if>
							<div class="condition_field">
								<span class="field_label">交易开始时间</span>
								<input type="text" name="beginTime" id="beginTime" class="Wdate" readonly="readonly" value="<s:property value="beginTime"/>"
											onfocus="WdatePicker({isShowClear:false,lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:59:59'})"/>
								<span class="tj_bt">*</span>
							</div>
							<div class="condition_field">
								<span class="field_label">交易截止时间</span>
								<input type="text" name="endTime" id="endTime" class="Wdate" readonly="readonly" value="<s:property value="endTime"/>"
											onfocus="WdatePicker({isShowClear:false,lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:59:59'})"/>
								<span class="tj_bt">*</span>
							</div>
							<div class="condition_field">
								<span class="field_label">微信支付单号</span>
								<s:textfield name="weixinRefundDetailsVO.transactionId" id="transactionId" maxlength="28" cssStyle="width:200px;"/>
							</div>
							<div class="condition_field">
								<span class="field_label">商户订单号</span>
								<s:textfield name="weixinRefundDetailsVO.outTradeNo" id="outTradeNo" maxlength="18"/>
							</div>
						</div>
					</li>
					<li class="bg_button">
						<s:if test="userLevel  < 3">
							<a href="javascript:void(0);" onclick="query('list');">查询</a>
						</s:if>
						<s:elseif test="userLevel  >=3 && userLevel <=5">
							<a href="javascript:void(0);" onclick="query('list4Dealer');">查询</a>
						</s:elseif>
						<s:if test="resetFlag">
							<a href="javascript:void(0);" onclick="reset();" >重写</a>
						</s:if>
					</li>
				</ul>
			</div>
			<div class="bgtj_total">
				<span style="margin-left:20px;">总笔数：${totalVO.totalAmount }，退款总金额：				
					<s:if test="totalVO.totalMoney == 0">0元</s:if>	
					<s:else>
						<fmt:formatNumber value="${totalVO.totalMoney / 100}" pattern="###,###,###,##0.00"/>元
					</s:else>
				</span>
			</div>
	    	<div class="bgtable">
	            <ul class="bg_all">
	                <li class="bg_table bg_table1">
	                    <table class="bg_odd">
	                        <thead>
	                            <tr>
	                                <th class="six">序号</th>
	                                <th>商户订单号</th>
	                                <s:if test="userLevel  < 3">
		                                <th>服务商ID</th>
		                                <th>服务商名称</th>
		                                <th>业务员ID</th>
		                                <th>业务员名称</th>
		                            </s:if>
		                            <th>商家ID</th>
	                                <th>商家名称</th>
	                                <th>门店ID</th>
	                                <th>门店名称</th>
	                                <th>收银员ID</th>
	                                <th>收银员姓名</th>
	                                <th>退款人</th>
	                                <th>订单金额</th>
	                                <th>退款金额</th>
	                                <th>状态</th>
	                                <th>时间</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        <s:if test="weixinRefundDetailsVoList != null && weixinRefundDetailsVoList.size() > 0">
			  					<s:iterator value="weixinRefundDetailsVoList" var="weixinRefundDetailsVo" status="rowStatus">
						  		<tr>
						  			<td>
						  				<s:property value="pageRows*(currPage-1) + #rowStatus.index + 1" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.outTradeNo" />">
						  				<s:property value="#weixinRefundDetailsVo.outTradeNo" />
						  			</td>
						  			<s:if test="userLevel  < 3">
						  				<td title="<s:property value="#weixinRefundDetailsVo.partnerId" />">
							  				<s:property value="#weixinRefundDetailsVo.partnerId" />
							  			</td>
							  			<td title="<s:property value="#weixinRefundDetailsVo.partnerName" />">
							  				<s:property value="#weixinRefundDetailsVo.partnerName" />
							  			</td>
							  			<td title="<s:property value="#weixinRefundDetailsVo.partnerEmployeeId" />">
							  				<s:property value="#weixinRefundDetailsVo.partnerEmployeeId" />
							  			</td>
							  			<td title="<s:property value="#weixinRefundDetailsVo.partnerEmployeeName" />">
							  				<s:property value="#weixinRefundDetailsVo.partnerEmployeeName" />
							  			</td>
							  		</s:if>
						  			<td title="<s:property value="#weixinRefundDetailsVo.dealerId" />">
						  				<s:property value="#weixinRefundDetailsVo.dealerId" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.dealerName" />">
						  				<s:property value="#weixinRefundDetailsVo.dealerName" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.storeId" />">
						  				<s:property value="#weixinRefundDetailsVo.storeId" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.storeName" />">
						  				<s:property value="#weixinRefundDetailsVo.storeName" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.dealerEmployeeId" />">
						  				<s:property value="#weixinRefundDetailsVo.dealerEmployeeId" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.dealerEmployeeName" />">
						  				<s:property value="#weixinRefundDetailsVo.dealerEmployeeName" />
						  			</td>
						  			<td title="<s:property value="#weixinRefundDetailsVo.refundEmployeeName" />">
						  				<s:property value="#weixinRefundDetailsVo.refundEmployeeName" />
						  			</td>
						  			<td class="bgright" title="<fmt:formatNumber value="${weixinRefundDetailsVo.totalFee/100}" pattern="###,###,###,##0.00"/>">
						  				<fmt:formatNumber value="${weixinRefundDetailsVo.totalFee/100}" pattern="###,###,###,##0.00"/>
						  			</td>
						  			<td class="bgright" title="<fmt:formatNumber value="${weixinRefundDetailsVo.refundFee/100}" pattern="###,###,###,##0.00"/>">
						  				<fmt:formatNumber value="${weixinRefundDetailsVo.refundFee/100}" pattern="###,###,###,##0.00"/>
						  			</td>
						  			<s:if test="#weixinRefundDetailsVo.resultCode == 'SUCCESS'">
						  				<s:set var="resultCodeStr">交易成功</s:set>
						  			</s:if>
						  			<s:elseif test="#weixinRefundDetailsVo.resultCode == 'FAIL'">
						  				<s:set var="resultCodeStr">交易失败</s:set>
						  			</s:elseif>
						  			<s:elseif test="#weixinRefundDetailsVo.resultCode == NULL || #weixinRefundDetailsVo.resultCode == '' ">
						  				<s:set var="resultCodeStr">处理中</s:set>
									</s:elseif>
						  			<td title="<s:property value="resultCodeStr" />">
						  				<s:property value="#resultCodeStr" />
						  			</td>
						  			<td title="<s:date name="#weixinRefundDetailsVo.transBeginTime" format="yyyy-MM-dd HH:mm:ss"/>">
						  				<s:date name="#weixinRefundDetailsVo.transBeginTime" format="yyyy-MM-dd HH:mm:ss"/>
						  			</td>
						  		</tr>
						  		</s:iterator>
			  				</s:if>
					  		<s:else>
					  			<tr><td colspan="<s:property value='userLevel<3?17:13'/>">无符合条件的查询结果！</td></tr>
					  		</s:else>
	                    	</tbody>
	               		</table>
	                </li>
	            </ul>
	            <ul>
	            	<li class="t-center">
	                	<s:include value="/resources/include/page.jsp"></s:include>
	                </li>
	            </ul>
	    	</div>
	    </s:form>
	</div>
	<s:property value="#request.messageBean.alertMessage" escape="false" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/tools/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript">
		function query(method) {
			var beginTime = $("#beginTime").val();
			var endTime = $("#endTime").val();
			if(isBlank(beginTime)){
				alert('交易开始时间不能为空！');
				return false;
			}
			if(isBlank(endTime)){
				alert('交易截止时间不能为空！');
				return false;
			}
			if (compareDate(endTime, beginTime) == -1) {
				alert('交易开始时间不能大于交易截止时间！');
				return false;
			}
			if (beginTime.substring(0, 7) != endTime.substring(0, 7)) {
				alert("不能跨月查询");
				return;
			}
			invokeAction(method);
		}
	
		function reset() {
			$("#partner2Oid").val("");
			$("#partner3Oid").val("");
			$("#partnerEmployeeId").val("");
			$("#dealerId").val("");
			$("#storeId").val("");
			$("#dealerEmployeeId").val("");
			$("#transactionId").val("");
			$("#outTradeNo").val("");
			//$("#beginTime").val("");
			//$("#endTime").val("");
			//$("#queryForm")[0].reset();
		}
	</script>
</body>
</html>