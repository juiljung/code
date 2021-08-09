<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
	.pagination{
			justify-content: center;
		}
	h3{
		text-align:center;
	}
	#search2{
			margin:auto;
			text-align:center;
		}
</style>
</head>

<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;"></svg>



	
	
	<div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
		<section id="content">

			<c:forEach items="${cartList}" var="cartList">
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="p_thumb">
							<img src="${cartList.p_thumb}" />
						</div>
						<div class="p_info">
							<p>
								<span>상품명 : </span>${cartList.p_no}<br /> <span>개당 가격 :</span>
								<fmt:formatNumber pattern="###,###,###"
									 value="${cartList.p_price}" />
								
								<br /> <span>구입 수량 : </span>${cartList.p_count}<br /> <span>최종가격 : </span>
								<fmt:formatNumber pattern="###,###,###" 
									value="${cartList.p_price * cartList.p_count}" />
								
								
								<a role="button" class="w-100 btn btn-lg btn-primary" 
            						onclick="location.href='${contextPath}/shop/prodInfo.do?p_no=${shopList.p_no }'">구매하기</a>
								
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
	</div>
	
	
	
</body>
</html>