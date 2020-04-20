<template>
<v-container fluid>
  <v-row justify="center">
    <v-col cols="6">
      <v-container
        class="grey lighten-4"
      >
        <v-text-field
          label="Title"
          v-model="title"
          @change="onTitleChange">
        </v-text-field>
        <v-carousel v-model="current">
          <v-carousel-item
            v-for="(slide, i) in slides"
            :key="i"
            :src="'data:image/jpeg;base64,'+slide"
            align="middle"
            contain
          ></v-carousel-item>
        </v-carousel>
        <v-row>
          <v-col>
            <v-container fluid>
              <v-row>
                <v-col lg="1">
                  <v-btn dark color="green" @click="onAddSlide">
                    <v-icon dark>mdi-plus</v-icon>
                  </v-btn>
                </v-col>
                <v-col lg="1">
                  <v-btn dark color="green" @click="onDeleteSlide">
                    <v-icon dark>mdi-minus</v-icon>
                  </v-btn>
                </v-col>
                <v-col lg="8">
                  <v-file-input
                    type="file"
                    accept="image/*"
                    id="file"
                    ref="file"
                    label="Choose Image"
                    solo
                    dense
                    hide-details
                    @change="onFileChange"/>
                </v-col>
                <v-col lg="1">
                  <v-btn depressed color="error" @click="onDeletePres">Delete</v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-col>
        </v-row>
      </v-container>
    </v-col>
  </v-row>
</v-container>
</template>



<script>
import axios from 'axios';

export default {
  name: 'Edit',

  data() {
    return {
      id: this.$route.params.id,
      title: 'Untitled',
      slides: [],
      file: null,
      current: 0,
    };
  },
  created() {
    const path = `http://10.90.138.113:5000/edit/${this.id}/${this.current}`;
    axios.get(path).then((res) => {
      this.title = res.data.title;
      this.slides = res.data.slides;
    });
  },
  methods: {
    onFileChange(e) {
      const f = e;
      this.file = f;

      const path = `http://10.90.138.113:5000/edit/${this.id}/${this.current}`;

      const formData = new FormData();
      formData.append('image', this.file);
      const headers = {
        'Content-Type': 'multipart/form-data',
      };
      axios.post(path, formData, headers).then((response) => {
        this.title = response.data.title;
        this.slides = response.data.slides;
      });
    },
    onAddSlide() {
      const path = `http://10.90.138.113:5000/add_slide/${this.id}`;
      axios.post(path).then((response) => {
        this.title = response.data.title;
        this.slides = response.data.slides;
      });
    },
    onDeleteSlide() {
      const path = `http://10.90.138.113:5000/delete_slide/${this.id}/${this.current}`;
      axios.post(path).then((response) => {
        this.title = response.data.title;
        this.slides = response.data.slides;
      });
    },
    onDeletePres() {
      const path = `http://10.90.138.113:5000/delete_pres/${this.id}`;
      axios.post(path);
      this.$router.push('../');
    },
    onTitleChange() {
      const path = `http://10.90.138.113:5000/edit/${this.id}/${this.current}`;

      const formData = new FormData();
      formData.append('title', this.title);
      const headers = {
        'Content-Type': 'multipart/form-data',
      };
      axios.post(path, formData, headers).then((response) => {
        this.title = response.data.title;
        this.slides = response.data.slides;
      });
    },
  },
};
</script>
