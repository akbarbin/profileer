<template>
  <div id="app">
    <TestPhoneValidation/>
  </div>
</template>

<script>
import TestPhoneValidation from './packs/components/test_phone_validation.vue';

export default {
  components: {
    TestPhoneValidation
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
