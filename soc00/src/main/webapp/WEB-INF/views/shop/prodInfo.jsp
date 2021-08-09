<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	//치환 변수 선언합니다.
	//pageContext.setAttribute("crcn", "\r\n"); //개행문자
	pageContext.setAttribute("crcn", "\n"); //Ajax로 변경 시 개행 문자 
	pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/jumbotron/">

<style>

#h3{
	text-align:center;
	}
</style>

<script type="text/javascript">
	function add_cart(p_no) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/shop/addGoodsInCart.do",
			data : {
				p_no : p_no
				
			},
			success : function(data, textStatus) {
				//alert(data);
				//$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}
	
	

</script>

</head>
<body>
	<div class="container py-4">
		<h3 id="h3">상품페이지</h3>
		<hr/>
		
			<div class="row align-items-md-stretch">

				<div class="col-md-6">
					<div class="h-100 p-5 bg-light border rounded-3">
						<img src="${contextPath }/resources/image/${prodInfo.p_filename}" 
							style="max-width: 100%; height: auto;">
					</div>
				</div>
				<div class="col-md-6">
					<div class="h-100 p-5 bg-light border rounded-3">
						<h2>${prodInfo.p_name }</h2>
						<table>
							<tr>
									<td>&#8361;</td>
								<td>${prodInfo.p_price }</td>
							</tr>
						</table>
						<div id="set_option">
							<dl>
								<dd>
									<p></p>
									<h6>
										사이즈 ${prodInfo.p_option }
									</h6>
									<p></p>
									<h6>
										개수 <select name="goods_option2"><option value="">필수사항</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</h6>
									<table>
										<tr>
											<td>
												<!-- 기존 버튼 
												<button type="button" class="btn btn-primary" href="">장바구니</button><b></b>
												-->
												<!-- 새로 바뀐 -->
												<button type="button" class="btn btn-primary" href="javascript:add_cart('${products.p_no }')">장바구니</a></li>
												
												<button type="button" class="btn btn-primary" href="">바로구매</button>
											</td>
										</tr>
									</table>
								</dd>
							</dl>
						</div>
					</div>
				</div>


				<div class="p-3 mb-4 bg-white rounded-3">
					<div class="container-fluid py-1">
						<h3 class="display-5 fw-bold">상품소개</h3><p></p>
						<h6 class="col-md-8 fs-4">${prodInfo.p_content }</h6>
					</div>
				</div>

	
			</div>
		
	</div>
</body>
</html>
