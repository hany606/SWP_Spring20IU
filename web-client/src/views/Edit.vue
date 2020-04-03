<template>
<v-container fluid>
  <v-row class="mb-6" justify="center">Here will be some toolbar</v-row>
  <v-row class="mb-6">
    <v-col lg="2">
    </v-col>
    <v-col>
      <h1>{{ title }}</h1>
      <img v-bind:src="'data:image/jpeg;base64,'+this.slides[0]" height="600" width="800" contain/>
      <imgUpload v-bind:pres="this.id"></imgUpload>
    </v-col>
    <v-col lg="2">
    </v-col>
  </v-row>
</v-container>
</template>

<script>
import axios from 'axios';
import ImageUploader from '@/views/ImageUploader.vue';


export default {
  name: 'Edit',
  data() {
    return {
      id: this.$route.params.id,
      title: '',
      slides: [],
      current: 0,
    };
  },
  components: {
    imgUpload: ImageUploader,
  },
  created() {
    const path = `http://localhost:5000/edit/${this.id}`;
    axios.get(path).then((response) => {
      this.title = response.data.title;
      this.slides = response.data.slides;
    });
  },
};
</script>
