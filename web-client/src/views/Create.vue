<template>
<v-image-input v-model="imageData" :image-quality="0.85" clearable image-format="jpeg" />
</template>

<script>
import VImageInput from 'vuetify-image-input';

export default {
  name: 'Create',
  components: {
    'v-image-input': VImageInput,
  },
};
</script>
