---
layout: page
title: Portfolio
permalink: /portfolio/
---

<div class="home">

  <h1 class="page-heading">Portfolio</h1>

  <ul class="post-list">
    {% for post in site.posts %}
      {% if post.categories contains 'update' %}
      <li>
        <h2>
          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>
      </li>
      {% endif %}
    {% endfor %}
  </ul>

</div>
