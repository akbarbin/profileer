<template>
  <section id="phone-stats-section">
    <header>
      <h2>Statistics</h2>
      <p>Total phone validation data</p>
    </header>
    <aside>
      <p v-if="loading">Loading...</p>
      <div v-for="stat in stats" :key="stat.type">
        <p><strong>{{ stat.type | capitalize }}:</strong> {{ stat.quantity }}</p>
      </div>
    </aside>
  </section>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      loading: false,
      stats: []
    }
  },
  filters: {
    capitalize: function (value) {
      if (!value) return ''
      value = value
        .replace(/[_\s]+/g, ' ')
        .toString()
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  },
  created() {
    this.getStats();
  },
  methods: {
    getStats() {
      var vm = this;
      this.loading = true;

      axios
        .get('/api/v1/stats.json')
        .then((response) => {
          vm.stats = response.data.rows
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
