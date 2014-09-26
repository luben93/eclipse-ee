<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="blog" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Relaxed Blog</title>
		<link href="/resources/styles/grid.css" type="text/css" rel="stylesheet" media="screen"/>
		<link href="/resources/styles/components.css" type="text/css" rel="stylesheet" media="screen"/>		
	</head>
	
	
	
	
	<body>
		<div class="row">
		<header id="blog_hd" class="column grid_9">
			<h1>Relaxed Blog</h1>
			<a href="new">New post</a>
		</header>
		</div>
		<div class="row">
			<div class="column grid_9">
				<c:choose>
					<c:when test="${empty page}">
						<p>This blog has no posts yet.</p>
						<h2><a href="new">Write Your First Blog Post</a></h2>
					</c:when>
					<c:otherwise>
						<c:forEach items="${page.rows}" var="blogPost">
							<blog:blogPost post="${blogPost}"/>
						</c:forEach>
						<c:if test="${page.hasPrevious or page.hasNext}">
							<table class="pagenav">
								<tr>
									<td style="text-align: left;">
										<c:if test="${page.hasPrevious}">
											<a href="/blog/posts/?p=${page.previousLink}">&lt; Previous page</a>
										</c:if>
									</td>
									<td style="text-align: right;">
										<c:if test="${page.hasNext}">
											<a href="/blog/posts/?p=${page.nextLink}">Next page &gt;</a>
										</c:if>
									</td>
								</tr>
							</table>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</body>
</html>