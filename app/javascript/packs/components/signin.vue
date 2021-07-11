<template>
  <section>
    <header>
      <h2>Sign In</h2>
    </header>
    <form v-on:submit.prevent>
      <p v-if="success"><mark>{{ success }}</mark></p>
      <p v-if="error"><mark>{{ error }}</mark></p>
      <label for="email">Email:</label>
      <input v-model="email" type="text" id="email" name="email" size="20" placeholder="email@example.com">
      <label for="password">Password:</label>
      <input v-model="password" type="password" id="password" name="password" size="20" placeholder="password">
      <button type="submit" v-on:click="signIn">Submit</button>
      <p>
        Do you want to share video? Register <router-link to="/signup">here.</router-link>
      </p>
    </form>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Signin',
  data() {
    return {
      name: null,
      email: null,
      password: null,
      error: null,
      success: null
    }
  },
  methods: {
    signIn() {
      var vm = this;

      axios.post('/signin', {
        email: this.email,
        password: this.password
      })
        .then(function(response) {
          vm.success = response.data.message;
          vm.$router.replace('/phones');
        })
        .catch(function(error) {
          vm.error = error.response.data.error;
        })
    }
  }
}
</script>
