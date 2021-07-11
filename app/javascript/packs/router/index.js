import Vue from 'vue'
import VueRouter from 'vue-router'
import Signin from '../components/signin'
import Signup from '../components/signup'
import Welcome from '../components/welcome'

Vue.use(VueRouter)

export default new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Welcome',
      component: Welcome
    },
    {
      path: '/signin',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    }
  ]
})
