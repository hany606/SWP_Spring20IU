
<template>
  <v-app id="keep">
    <v-app-bar
      app
      clipped-left
      color="green"
    >
      <v-app-bar-nav-icon @click="drawer = !drawer" />
      <span class="title ml-3 mr-5">Virtual&nbsp;
        <span class="font-weight-light">Assistant
        </span>
      </span>
      <v-text-field
        solo-inverted
        flat
        hide-details
        label="Search"
      />
      <v-spacer />
      <v-toolbar-items>
      <v-btn text small href="../">Home</v-btn>
      <newPres></newPres>
    </v-toolbar-items>
    </v-app-bar>
    <v-row>
      <v-col>
        <v-content>
          <v-row justify="center">
            <v-col cols="6">
                <v-container
                  class="grey lighten-4"
                >
                  <v-carousel v-model="current">
                    <v-carousel-item
                    v-for="(slide, i) in slides"
                    :key="i"
                    :src="'data:image/jpeg;base64,'+slide"
                    align="middle"
                    contain
                    ></v-carousel-item>
                  </v-carousel>
                </v-container>
                <v-row justify="center">
                  <v-col cols="1">
                    <v-btn class="mx-2" fab dark color="green" @click="onAddSlide">
                      <v-icon dark>mdi-plus</v-icon>
                    </v-btn>
                  </v-col>
                  <v-col>
                  <v-file-input
                    type="file"
                    accept="image/*"
                    id="file"
                    ref="file"
                    label="Choose Image"
                    solo
                    hide-details
                    @change="onFileChange"/>
                  </v-col>
                </v-row>
            </v-col>
          </v-row>
        </v-content>
      </v-col>
    </v-row>
  </v-app>
</template>

<script>
import Create from '@/views/Create.vue';
import axios from 'axios';

export default {
  name: 'App',

  data() {
    return {
      id: '',
      title: '',
      slides: [],
      file: null,
      current: 0,
    };
  },
  components: {
    newPres: Create,
  },
  created() {
    const path = 'http://10.90.138.113:5000/create';
    axios.post(path).then((response) => {
      this.id = response.data.id;
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
  },
};
</script>
