<template>
  <section id="phone-validator-section">
    <header>
      <h2>Test our phone validator</h2>
      <p>Enter any email, and we’ll show you how fast and accurate our phone validation system is.</p>
    </header>
    <aside>
      <label for="number">A phone number:</label>
      <input v-model="number" type="text" id="number" name="number" size="25" placeholder="Country code 6285188788761">
      <p v-if="errors['number']"><mark>{{ errors["number"][0] }}</mark></p>
      <button v-on:click="validatePhone">Submit</button>
      <p v-if="loading">Loading...</p>
      <br>
      <div v-if="phone">
        <p><strong>number:</strong> {{ phone.number }}</p>
        <p><strong>valid:</strong> <mark>{{ phone.status }}</mark></p>
        <p><strong>international format:</strong> {{ phone.format.international }}</p>
        <p><strong>local format:</strong> {{ phone.format.international }}</p>
        <p><strong>country code:</strong> {{ phone.country.code }}</p>
        <p><strong>country name:</strong> {{ phone.country.name }}</p>
        <p><strong>country prefix:</strong> {{ phone.country.prefix }}</p>
        <p><strong>location:</strong> {{ phone.location }}</p>
        <p><strong>phone_type:</strong> {{ phone.phone_type }}</p>
        <p><strong>carrier:</strong> {{ phone.carrier }}</p>
      </div>
    </aside>
  </section>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      number: null,
      loading: false,
      phone: null,
      errors: {
        number: null
      }
    }
  },
  methods: {
    validatePhone() {
      var vm = this;
      this.loading = true;
      this.phone = null;

      axios
        .get('/api/v1/phones/validate.json', {
          params: {
            number: vm.number
          }
        })
        .then((response) => {
          vm.phone = response.data.phone
        })
        .catch(function(error) {
          vm.errors = error.response.data.errors
        })
        .finally(() => {
          vm.loading = false;
        });
    }
  }
};
</script>
