<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html lang="en">

<jsp:include page="../header.jsp"/>

<body>

  	<div class="container">
		<spring:url value="/resources/images/banner-graphic.png" var="banner"/>
		<img src="${banner}" />
		<c:choose>
			<c:when test="${pet['new']}"><c:set var="method" value="post"/></c:when>
			<c:otherwise><c:set var="method" value="put"/></c:otherwise>
		</c:choose>
		
		<h2><c:if test="${pet['new']}">New </c:if>Pet</h2>
		
		<b>Owner:</b> ${pet.owner.firstName} ${pet.owner.lastName}
		<br/>
		<form:form modelAttribute="pet" method="${method}">
		  <table>
		    <tr>
		      <th>
		        Name: <form:errors path="name" cssClass="errors"/>
		        <br/>
		        <form:input path="name" size="30" maxlength="30"/>
		      </th>
		    </tr>
		    <tr>
		      <th>
		        Birth Date: <form:errors path="birthDate" cssClass="errors"/>
		        <br/>
		        <form:input path="birthDate" size="10" maxlength="10"/> (yyyy-mm-dd)
		      </th>
		    </tr>
		    <tr>
		      <th>
		        Type: <form:errors path="type" cssClass="errors"/>
		        <br/>
		        <form:select path="type" items="${types}"/>
		      </th>
		    </tr>
		    <tr>
		      <td>
		        <c:choose>
		          <c:when test="${pet['new']}">
		            <p class="submit"><input type="submit" value="Add Pet"/></p>
		          </c:when>
		          <c:otherwise>
		            <p class="submit"><input type="submit" value="Update Pet"/></p>
		          </c:otherwise>
		        </c:choose>
		      </td>
		    </tr>
		  </table>
		</form:form>
		
		<c:if test="${!pet['new']}">
		  <form:form method="delete">
		    <p class="submit"><input type="submit" value="Delete Pet"/></p>
		  </form:form>
		</c:if>    

  	</div>
	<jsp:include page="../footer.jsp"/>
</body>

</html>