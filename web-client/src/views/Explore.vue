<template>
<v-container fluid>
  <v-spacer/>
  <v-row
    dense
  >
    <v-col
      v-for="pres in presentations"
      :key="pres.id"
      cols="2"
    >
      <v-card>
        <router-link v-bind:to="'/edit/' + pres.id">
        <v-img
          :src="'data:image/jpeg;base64,'+pres.slides[0]"
          class="white--text align-end"
          height="200px"
        >
        </v-img>
        <v-card-title v-text="pres.title"></v-card-title>
        </router-link>
      </v-card>
    </v-col>
  </v-row>
</v-container>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Explore',
  data() {
    return {
      presentations: [],
    };
  },
  created() {
    const path = 'http://10.90.138.113:5000/';
    axios.get(path).then((res) => {
      this.presentations = res.data;
      console.log(this.presentations);
    });
  },
};
</script>
