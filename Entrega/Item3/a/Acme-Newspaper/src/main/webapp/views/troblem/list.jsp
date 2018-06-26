<%--
 * list.jsp
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="troblemList" requestURI="${requestURI}" id="row">

	<spring:message code="troblem.edit" var="edit" />
	<display:column title="${edit}" sortable="true">
		<jstl:if test="${row.draftMode==true}">
			<spring:url value="troblem/admin/edit.do" var="editURL">
				<spring:param name="troblemId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="troblem.edit" /></a>
		</jstl:if>
	</display:column>

	<spring:message code="troblem.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}"
		sortable="true" />

	<spring:message code="troblem.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="troblem.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}"
		sortable="true" />

	<spring:message code="troblem.gauge" var="gaugeHeader" />
	<display:column property="gauge" title="${gaugeHeader}" sortable="true" />

	<spring:message code="troblem.format.moment" var="pattern"></spring:message>
	<spring:message code="troblem.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}"
		sortable="true" format="${pattern}" />

	<spring:message code="troblem.draftMode" var="draftMode" />
		<display:column title="${draftMode}" sortable="true">
			<jstl:if test="${row.draftMode==true}">
				<div style="width: 30px; height: 30px; margin-left: 20px;">

					<img src="images/yes.png" width="30" height="30">
				</div>
			</jstl:if>
			<jstl:if test="${row.draftMode==false}">
				<div style="width: 30px; height: 30px; margin-left: 20px;">

					<img src="images/no.png" width="30" height="30">
				</div>
			</jstl:if>
		</display:column>

	<spring:message code="troblem.newspaper" var="display" />
	<display:column title="${display}" sortable="true">
		<jstl:if test="${row.newspaper!=null}">
		<spring:url value="newspaper/admin/display.do" var="displayURL">
			<spring:param name="newspaperId" value="${row.newspaper.id}" />
		</spring:url>
		<a href="${displayURL}"><spring:message code="newspaper.display" /></a>
		</jstl:if>
	</display:column>

	<spring:message code="troblem.delete" var="delete" />
	<display:column title="${delete}" sortable="true">
		<spring:url value="troblem/admin/delete.do" var="editURL">
			<spring:param name="troblemId" value="${row.id}" />
		</spring:url>
		<a href="${editURL}"><spring:message code="troblem.delete" /></a>
	</display:column>

</display:table>