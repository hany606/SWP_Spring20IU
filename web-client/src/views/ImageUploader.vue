<template>
<v-row justify="center">
  <div id="uploader">
    <input type="file" id="file" ref="file" @change="onFileChange" />
    <div id="preview">
      <img v-if="url" :src="url" height="600" width="800" contain/>
    </div>
    <div id="btn">
      <button v-on:click="onSubmit()">Submit</button>
    </div>
  </div>
</v-row>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ImageUploader',
  props: ['pres'],
  data() {
    return {
      id: 0,
      url: null,
    };
  },
  methods: {
    onFileChange(e) {
      const f = e.target.files[0];
      this.file = f;
      this.url = URL.createObjectURL(this.file);
    },
    onSubmit() {
      const path = `http://localhost:5000/edit/${this.pres}`;

      const formData = new FormData();
      formData.append('image', this.file);
      const headers = {
        'Content-Type': 'multipart/form-data',
      };
      axios.post(path, formData, headers);
    },
  },
};
</script>
