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
export default {
  data: function () {
    return {
      message: 'Todoアプリ',
      todo_input: "",
      todos: [
        { title: 'TODOアイテム1' },
        { title: 'TODOアイテム2' },
      ],
    }
  },
  methods: {
    clicked: function() {
      console.log("ボタンクリック!!")
    },
  },
  components: { todo }
}
</script>
