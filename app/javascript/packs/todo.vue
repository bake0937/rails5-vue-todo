<template>
  <li>
    <span 
        @click="complete(todo.id)" 
        v-bind:class="{ completed: todo.completed }">
    {{ todo.title }}
    </span>
  </li>
</template>

<script>
import axios from 'axios'
export default {
    props: ['todo'],
    methods: {
        complete: function(index) {
          var todo_update = { 
            "todo" : { 
              "completed": !this.todo.completed 
              } 
          }
          axios.put('/api/v1/todos/' + this.todo.id, todo_update)
          .then(res => {
              this.$parent.fetchTodos()
            })
            .catch(error => {
              throw error
            })
        },
    }
}
</script>

<style scoped>
.completed {
  color: #ccc;
  text-decoration:line-through;
}
</style>
