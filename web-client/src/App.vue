
<template>
  <v-app id="keep">
    <v-app-bar
      app
      clipped-left
      color="amber"
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

    <v-navigation-drawer
      v-model="drawer"
      app
      clipped
      color="grey lighten-4"
    >
      <v-list
        dense
        class="grey lighten-4"
      >
        <template v-for="(item, i) in items">
          <v-row
            v-if="item.heading"
            :key="i"
            align="center"
          >
            <v-col cols="6">
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-col>
            <v-col
              cols="6"
              class="text-right"
            >
              <v-btn
                small
                text
              >edit</v-btn>
            </v-col>
          </v-row>
          <v-divider
            v-else-if="item.divider"
            :key="i"
            dark
            class="my-4"
          />
          <v-list-item
            v-else
            :key="i"
            link
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title class="grey--text">
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>
    <v-content>
      <v-row>
        <v-col>
          <v-container
            fluid
            class="grey lighten-4 fill-height"
          >
            <v-carousel>
              <v-container fluid>
                <v-carousel-item
                v-for="(slide, i) in slides"
                :key="i"
                :src="'data:image/jpeg;base64,'+slide"
                reverse-transition="fade-transition"
                transition="fade-transition"
                ></v-carousel-item>
              </v-container>
            </v-carousel>
          </v-container>
        </v-col>
      </v-row>
      <input type="file" id="file" ref="file" @change="onFileChange"/>
    </v-content>
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
      const f = e.target.files[0];
      this.file = f;

      const path = `http://10.90.138.113:5000/edit/${this.id}`;

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
  },
};
</script>
