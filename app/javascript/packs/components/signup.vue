<template>
  <section>
    <header>
      <h2>Sign Up</h2>
    </header>
    <form v-on:submit.prevent>
      <p v-if="success">{{ success }}</p>
      <label for="name">Name:</label>
      <input v-model="name" type="text" id="name" name="name" size="20" placeholder="Your name">
      <p v-if="errors['name']"><mark>{{ errors["name"][0] }}</mark></p>
      <label for="email">Email:</label>
      <input v-model="email" type="text" id="email" name="email" size="20" placeholder="email@example.com">
      <p v-if="errors['email']"><mark>{{ errors["email"][0] }}</mark></p>
      <label for="password">Password:</label>
      <input v-model="password" type="password" id="password" name="password" size="20" placeholder="password">
      <p v-if="errors['password']"><mark>{{ errors["password"][0] }}</mark></p>
      <button type="submit" v-on:click="signUp">Submit</button>
      <p>
        Do you have an account? Sign in <router-link to="/signin">here.</router-link>
      </p>
    </form>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Signup',
  data() {
    return {
      name: null,
      email: null,
      password: null,
      errors: {
        name: null,
        email: null,
        password: null
      },
      success: null
    }
  },
  methods: {
    signUp() {
      var vm = this;

      axios.post('/api/v1/users', {
        user: {
          name: this.name,
          email: this.email,
          password: this.password
        }
      })
        .then(function(response) {
          vm.success = response.data.message;
        })
        .catch(function(error) {
          vm.errors = error.response.data.errors
        })
    }
  }
}
</script>
