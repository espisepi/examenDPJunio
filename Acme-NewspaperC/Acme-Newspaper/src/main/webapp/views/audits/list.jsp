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
	name="auditsList" requestURI="${requestURI}" id="row">

	<spring:message code="audits.edit" var="edit" />
	<display:column title="${edit}" sortable="true">
		<jstl:if test="${row.draftMode==true}">
			<spring:url value="audits/admin/edit.do" var="editURL">
				<spring:param name="auditsId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="audits.edit" /></a>
		</jstl:if>
	</display:column>

	<spring:message code="audits.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}"
		sortable="true" />

	<spring:message code="audits.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="audits.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}"
		sortable="true" />

	<spring:message code="audits.gauge" var="gaugeHeader" />
	<display:column property="gauge" title="${gaugeHeader}" sortable="true" />

	<spring:message code="audits.format.moment" var="pattern"></spring:message>
	<spring:message code="audits.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}"
		sortable="true" format="${pattern}" />

	<spring:message code="audits.draftMode" var="draftMode" />
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

	<spring:message code="audits.newspaper" var="display" />
	<display:column title="${display}" sortable="true">
		<jstl:if test="${row.newspaper!=null}">
		<spring:url value="newspaper/admin/display.do" var="displayURL">
			<spring:param name="newspaperId" value="${row.newspaper.id}" />
		</spring:url>
		<a href="${displayURL}"><spring:message code="newspaper.display" /></a>
		</jstl:if>
	</display:column>

	<spring:message code="audits.delete" var="delete" />
	<display:column title="${delete}" sortable="true">
		<spring:url value="audits/admin/delete.do" var="editURL">
			<spring:param name="auditsId" value="${row.id}" />
		</spring:url>
		<a href="${editURL}"><spring:message code="audits.delete" /></a>
	</display:column>

</display:table>

<!-- Crear nuevo audits -->
<a href="audits/admin/create.do"> <spring:message
		code="audits.create" />
</a>