---
layout: page
title: Projects
permalink: /projects/
---

<div class="home">

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
