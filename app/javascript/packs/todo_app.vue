<template>
  <div id="app">
    <p>{{ message }}</p>
    <input v-model="todo_input">
    <button @click="clicked">Todo追加</button>
    <ul>
      <todo v-for="item in todos" v-bind:todo="item"></todo>
    </ul>
  </div>
</template>

<script>
import todo from './todo.vue'
import axios from 'axios'
export default {
  created () {
    this.fetchTodos()
  },
  data: function () {
    return {
      message: 'Todoアプリ',
      todo_input: "",
      todos: [],
    }
  },
  methods: {
    clicked: function() {
      console.log("ボタンクリック!!")
    },
    fetchTodos: function(){
      axios.get('/api/v1/todos')
        .then(res => {
          this.todos = res.data
        })
        .catch(error => {
          throw error
        })
    },
  },
  components: { todo }
}
</script>
