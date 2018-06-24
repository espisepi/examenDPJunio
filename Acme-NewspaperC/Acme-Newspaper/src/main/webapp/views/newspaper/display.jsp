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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<jstl:if test="${!hideAttributes}">
	<display:table name="newspaper" class="displaytag"
		requestURI="${requestURI}" id="row">

		<!-- Attributes -->

		<jstl:if test="${row.picture==''}">
			<spring:message code="nothing.found.to.display" />
		</jstl:if>

		<jstl:if test="${!(row.picture=='') }">
			<spring:message code="newspaper.picture" var="pictuHeader" />
			<display:column title="${titleHeader}">

				<div
					style="position: relative; width: 500px; height: 300px; margin-left: auto; margin-right: auto;">

					<img src="${row.picture}" width="500" height="300">
				</div>
			</display:column>
		</jstl:if>
		<display:column>

			<B><spring:message code="newspaper.title" /></B>
			<jstl:out value="${row.title}"></jstl:out>
			<p>

				<B><spring:message code="newspaper.description" /></B>
				<jstl:out value="${row.description}"></jstl:out>
			<p>
		</display:column>
	</display:table>
</jstl:if>

<!-- ---------------------------TABLA DE CONTENIDO PARA USERS-------------------------------- -->

<security:authorize access="hasRole('USER')">
	<h2>
		<spring:message code="newspaper.articles" />
	</h2>
	<display:table name="articles" id="row" class="displaytag">

		<!-- Columna de Summary -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.summary" var="summary" />
			<display:column title="${summary}" sortable="false">
				<spring:url value="article/user/listSummary.do" var="articleURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${articleURL}"><B><jstl:out
							value="${row.preSummary}"></jstl:out></B></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.summary" var="summaryHeader" />
			<display:column property="summary" title="${summaryHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Article -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.articles" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/user/display.do" var="renURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.title}"></jstl:out></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.title" var="titleHeader" />
			<display:column property="title" title="${titleHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Writer -->
		<!-- CUANDO ESTÉ EL DISPLAY DE PROFILE LO PONGO AQUÍ -->
		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/user/displayUser.do" var="renURL">
					<spring:param name="userId" value="${row.writer.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.writer.name}" /></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writerHeader" />
			<display:column property="writer.name" title="${writerHeader}"
				sortable="false" />
		</jstl:if>


	</display:table>
</security:authorize>


<!-- ---------------------------TABLA DE CONTENIDO PARA CUSTOMERS-------------------------------- -->

<security:authorize access="hasRole('CUSTOMER')">
	<h2>
		<spring:message code="newspaper.articles" />
	</h2>
	<display:table name="articles" id="row" class="displaytag">

		<!-- Columna de Summary -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.summary" var="summary" />
			<display:column title="${summary}" sortable="false">
				<spring:url value="article/customer/listSummary.do" var="articleURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${articleURL}"><B><jstl:out
							value="${row.preSummary}"></jstl:out></B></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.summary" var="summaryHeader" />
			<display:column property="preSummary" title="${summaryHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Article -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.articles" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/customer/display.do" var="renURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.title}"></jstl:out></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.title" var="titleHeader" />
			<display:column property="title" title="${titleHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Writer -->
		<!-- CUANDO ESTÉ EL DISPLAY DE PROFILE LO PONGO AQUÍ -->
		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/customer/displayUser.do" var="renURL">
					<spring:param name="userId" value="${row.writer.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.writer.name}" /></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writerHeader" />
			<display:column property="writer.name" title="${writerHeader}"
				sortable="false" />
		</jstl:if>


	</display:table>
</security:authorize>

<!-- ---------------------------TABLA DE CONTENIDO PARA ADMIN-------------------------------- -->

<security:authorize access="hasRole('ADMIN')">
	<h2>
		<spring:message code="newspaper.articles" />
	</h2>
	<display:table name="articles" id="row" class="displaytag">

		<!-- Columna de Summary -->

		<spring:message code="newspaper.article.summary" var="summary" />
		<display:column title="${summary}" sortable="false">
			<spring:url value="article/admin/listSummary.do" var="articleURL">
				<spring:param name="articleId" value="${row.id}" />
			</spring:url>
			<a href="${articleURL}"><B><jstl:out
						value="${row.preSummary}"></jstl:out></B></a>
		</display:column>

		<!-- Columna de Article -->

		<spring:message code="newspaper.articles" var="writer" />
		<display:column title="${writer}" sortable="false">
			<spring:url value="article/admin/display.do" var="renURL">
				<spring:param name="articleId" value="${row.id}" />
			</spring:url>
			<a href="${renURL}"><jstl:out value="${row.title}"></jstl:out></a>
		</display:column>

		<!-- Columna de Writer -->
		<!-- CUANDO ESTÉ EL DISPLAY DE PROFILE LO PONGO AQUÍ -->
		<spring:message code="newspaper.article.writer" var="writer" />
		<display:column title="${writer}" sortable="false">
			<spring:url value="article/admin/displayUser.do" var="renURL">
				<spring:param name="userId" value="${row.writer.id}" />
			</spring:url>
			<a href="${renURL}"><jstl:out value="${row.writer.name}" /></a>
		</display:column>

	</display:table>
</security:authorize>



<security:authorize access="hasRole('AGENT')">
	<h2>
		<spring:message code="newspaper.articles" />
	</h2>
	<display:table name="articles" id="row" class="displaytag">

		<!-- Columna de Summary -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.summary" var="summary" />
			<display:column title="${summary}" sortable="false">
				<spring:url value="article/agent/listSummary.do" var="articleURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${articleURL}"><B><jstl:out
							value="${row.preSummary}"></jstl:out></B></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.summary" var="summaryHeader" />
			<display:column property="summary" title="${summaryHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Article -->

		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.articles" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/agent/display.do" var="renURL">
					<spring:param name="articleId" value="${row.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.title}"></jstl:out></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="article.title" var="titleHeader" />
			<display:column property="title" title="${titleHeader}"
				sortable="false" />
		</jstl:if>

		<!-- Columna de Writer -->
		<!-- CUANDO ESTÉ EL DISPLAY DE PROFILE LO PONGO AQUÍ -->
		<jstl:if test="${!hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writer" />
			<display:column title="${writer}" sortable="false">
				<spring:url value="article/agent/displayUser.do" var="renURL">
					<spring:param name="userId" value="${row.writer.id}" />
				</spring:url>
				<a href="${renURL}"><jstl:out value="${row.writer.name}" /></a>
			</display:column>
		</jstl:if>

		<jstl:if test="${hideAttributes}">
			<spring:message code="newspaper.article.writer" var="writerHeader" />
			<display:column property="writer.name" title="${writerHeader}"
				sortable="false" />
		</jstl:if>


	</display:table>
</security:authorize>

<h2>
	<spring:message code="master.page.administrator.audits.list" />
</h2>

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="auditsList" requestURI="${requestURI}" id="rowAudits">

	<spring:message code="audits.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}"
		sortable="true" />

	<spring:message code="audits.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="audits.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}"
		sortable="true" />

	<spring:message code="audits.gauge" var="gaugeHeader" />
	<jstl:if test="${rowAudits.gauge==1}">
		<display:column property="gauge" title="${gaugeHeader}"
			sortable="true" style="background-color: #ffffe0" />
	</jstl:if>
	<jstl:if test="${rowAudits.gauge==2}">
		<display:column property="gauge" title="${gaugeHeader}"
			sortable="true" style="background-color: #ffe4b5" />
	</jstl:if>
	<jstl:if test="${rowAudits.gauge==3}">
		<display:column property="gauge" title="${gaugeHeader}"
			sortable="true" style="background-color: #0000ff" />
	</jstl:if>

	<spring:message code="audits.format.moment" var="pattern"></spring:message>
	<spring:message code="audits.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}"
		sortable="true" format="${pattern}" />

</display:table>
