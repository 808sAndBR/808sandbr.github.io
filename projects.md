---
layout: page
title: Projects
permalink: /projects/
---

<div class="home">
<h4>An under construction icon from the 90s would really be the most appropriate thing here.</h4>
<p>Hoping to finish up my backlog of posts about my finished projects in the near future, lot’s of work to get done for now though!</p>
<br>
  <ul class="post">
    {% for post in site.posts %}
      {%  if post.categories contains 'Post' %}
      <li>
        <p>
          <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}:</a>
          {{post.description}}
        </p>
      </li>
      {% endif %}
    {% endfor %}
  </ul>


  <h1 class="page-heading">Coursera Projects</h1>
  <ul class="posts">
    {% for post in site.posts %}
      {%  if post.categories contains 'Coursera' %}
      <li>
        <p>
          <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}:</a>
          {{post.description}}
        </p>
      </li>
      {% endif %}
    {% endfor %}
  </ul>

</div>
