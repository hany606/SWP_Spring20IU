<template>
  <v-btn text small v-on:click="onClick()">create</v-btn>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Create',
  data() {
    return {
      id: '',
    };
  },
  methods: {
    onClick() {
      const path = 'http://localhost:5000/create';
      axios.post(path).then((response) => {
        this.id = response.data.id;
        console.log(this.id);
        window.location.href = `../edit/${this.id}`;
      });
    },
  },
};

</script>
