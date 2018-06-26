<%--
 * edit.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="troblem/admin/edit.do" modelAttribute="troblem">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<!-- ATRIBUTOS -->
	<acme:textbox code="troblem.title" path="title" />
	<br />
	<acme:textbox code="troblem.description" path="description" />
	<br />
	<form:label path="gauge">
		<spring:message code="troblem.gauge" />
	</form:label>
	<form:input path="gauge" type="number" value = "${troblem.gauge}" max="3" min ="1"/>
	<br />
	<br />
	<acme:textbox code="troblem.moment" path="moment"
		placeHolder="yyyy/MM/dd HH:mm" />
	<br />
	<acme:booleanselect code="troblem.draftMode" path="draftMode" />
	<br />
	<acme:select items="${newspapers}" itemLabel="title"
		code="troblem.newspaper" path="newspaper" />
	<br />

	<!-- BOTONES -->

	<input type="submit" name="save"
		value="<spring:message code="troblem.save" />" />&nbsp; 

	<acme:cancel url="troblem/admin/list.do?d-16544-p=1"
		code="troblem.cancel" />

</form:form>