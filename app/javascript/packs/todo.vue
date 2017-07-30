<template>
  <li>
    {{ todo.title }}
  </li>
</template>

<script>
export default {
    props: ['todo'],
}
</script>
