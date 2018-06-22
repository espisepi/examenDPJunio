<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div>
	<img src="images/logo.png" alt="Acme-Newspaper Co., Inc." />
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>			
					<li><a href="profile/admin/edit.do"><spring:message code="master.page.users.edit" /></a></li>
					<li><a href="admin/dashboard.do"><spring:message code="master.page.statistics" /></a>
				</ul>
			</li>
			
			
			<li><a class="fNiv"><spring:message	code="master.page.administrator.configurationSystem" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="configurationSystem/admin/tabooWord/list.do?d-16544-p=1"><spring:message code="master.page.administrator.tabooWords" /></a></li>				
				</ul>
			</li>
			<li><a class="fNiv"><spring:message	code="master.page.listArticles" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="article/admin/list.do?d-16544-p=1"><spring:message code="master.page.listArticles" /></a></li>
					<li><a href="article/admin/listTabooWord.do?d-16544-p=1"><spring:message code="master.page.listArticlesTabooWord" /></a></li>
					<li><a href="article/admin/search.do?d-16544-p=1&keyword="><spring:message code="master.page.articles.list" /></a></li>				
				</ul>
			</li>
			<li><a class="fNiv"><spring:message	code="master.page.newspaper.list" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="newspaper/admin/list.do?d-16544-p=1"><spring:message code="master.page.admin.newspaper.list" /></a></li>
					<li><a href="newspaper/admin/listTabooWord.do?d-16544-p=1"><spring:message code="master.page.listNewspaperTabooWord" /></a></li>
					<li><a href="newspaper/admin/search.do?d-16544-p=1&&keyword="><spring:message code="newspaper.search.keyword" /></a></li>				
				</ul>
			</li>
			
			
			<li><a class="fNiv"><spring:message code="master.page.user"/></a>
				<ul>
					<li><a href="user/admin/list.do?d-16544-p=1"><spring:message code="master.page.users.list" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message code="master.page.advertisement"/></a>
				<ul>
				<li><a href="advertisement/admin/list.do?d-16544-p=1"><spring:message code="master.page.advertisement.list" /></a></li>
				<li><a href="advertisement/admin/listAdvertisementWithTabooWord.do?d-16544-p=1"><spring:message code="master.page.advertisement.listAdvertisementWithTabooWord" /></a></li>
				</ul>
			</li>
			
			
		</security:authorize>
		
		
		
		<security:authorize access="hasRole('USER')">
		
			<li><a class="fNiv"><spring:message code="master.page.users.profile"/></a>
				<ul>
					<li><a href="profile/user/edit.do"><spring:message code="master.page.users.edit" /></a></li>
					
				</ul>
			
			
			
			<li><a class="fNiv"><spring:message	code="master.page.newspaper" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="newspaper/user/list.do?d-16544-p=1"><spring:message code="master.page.user.newspaper.list" /></a></li>
					<li><a href="newspaper/user/listb.do?d-16544-p=1"><spring:message code="master.page.user.newspaper.list1" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.user"/></a>
				<ul>
					<li><a href="profile/user/list.do?d-16544-p=1"><spring:message code="master.page.users.list" /></a></li>
				</ul>
				</li>
				<!-- BUSQUEDA DE ARTICULOS -->
			<li><a class="fNiv"><spring:message code="master.page.articles" /></a>
				<ul>
					<li class="arrow"></li>		
					<li><a href="article/user/search.do?d-16544-p=1&&keyword="><spring:message code="master.page.articles.list" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message code="master.page.myarticles" /></a>
				<ul>
					<li class="arrow"></li>		
					<li><a href="article/user/list.do?d-16544-p=1"><spring:message code="master.page.articles.mylist" /></a></li>
				</ul>
			</li>
		</security:authorize>
		
		
		
		
		<security:authorize access="hasRole('AGENT')">
			<li><a class="fNiv"><spring:message	code="master.page.agent" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/agent/edit.do"><spring:message code="master.page.users.edit" /></a></li>
				</ul>
			</li>
		
			<!-- LISTA DE PERIoDICOS SOBRE LOS QUE CREAR UN AVISO -->
				<li><a class="fNiv"><spring:message code="master.page.newspapers" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="newspaper/agent/list.do?d-16544-p=1"><spring:message code="master.page.create.advertisement" /></a></li>
					<li><a href="newspaper/agent/listNewspapersWithAdvertisement.do?d-16544-p=1"><spring:message code="master.page.newspaper.advertisement" /></a></li>
					<li><a href="newspaper/agent/listNewspapersWithCeroAdvertisement.do?d-16544-p=1"><spring:message code="master.page.newspaper.NOadvertisement" /></a></li>
				</ul>
				</li>
		</security:authorize>
		
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
					
			<!-- REGISTRO DE USUARIO -->			
			<li><a class="fNiv"><spring:message code="master.page.register" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="user/create.do"><spring:message code="master.page.user.register" /></a></li>
					<li><a href="agent/create.do"><spring:message code="master.page.agent.register" /></a></li>
				</ul>
			</li>
			
			<!-- LISTA DE PERIODICOS -->
			<li><a class="fNiv"><spring:message code="master.page.newspapers" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="newspaper/list.do?d-16544-p=1"><spring:message code="master.page.newspaper.list" /></a></li>
				</ul>
			</li>
			
			<!-- BUSQUEDA DE ARTICULOS -->
			<li><a class="fNiv"><spring:message code="master.page.articles" /></a>
				<ul>
					<li class="arrow"></li>
					
					<li><a href="article/search.do?d-16544-p=1&&keyword="><spring:message code="master.page.articles.list" /></a></li>
				</ul>
			</li>
			
			
			<!-- LISTA DE USUARIOS -->
				<li><a class="fNiv"><spring:message code="master.page.users" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="user/list.do?d-16544-p=1"><spring:message code="master.page.users.list" /></a></li>
				</ul>
			</li>
			
			
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>				
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>


