import Vue from 'vue';
import VueRouter from 'vue-router';
import Explore from '../views/Explore.vue';
import Edit from '../views/Edit.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Explore',
    component: Explore,
  },
  {
    path: '/edit/:id',
    name: 'Edit',
    component: Edit,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
