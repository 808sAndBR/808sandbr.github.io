---
layout: page
title: Portfolio
permalink: /portfolio/
---

<div class="home">

  <ul class="post-list">
    {% for post in site.posts %}
      {%  if post.categories contains 'Post' %}
      <li>
        <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        <p> {{post.description}}</p>
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
