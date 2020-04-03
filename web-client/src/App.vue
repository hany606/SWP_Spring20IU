<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
    <v-toolbar-title>Virtual Assistant<br> </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items>
      <v-btn text small href="../">Home</v-btn>
      <newPres></newPres>
    </v-toolbar-items>
    </v-app-bar>
    <v-content>
      <router-view/>
    </v-content>
  </v-app>
</template>

<script>
import Create from '@/views/Create.vue';

export default {
  name: 'App',

  data: () => ({
    //
  }),
  components: {
    newPres: Create,
  },
};
</script>
