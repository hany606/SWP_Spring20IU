<template>
  <v-btn text small v-on:click="onClick()">create</v-btn>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Create',
  methods: {
    onClick() {
      const path = 'http://localhost:5000/create';
      axios.post(path);
    },
  },
};

</script>
