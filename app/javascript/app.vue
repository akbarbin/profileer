<template>
  <div id="app">
    <TestPhoneValidation/>
    <hr>
    <Stats/>
  </div>
</template>

<script>
import TestPhoneValidation from './packs/components/test_phone_validation.vue';
import Stats from './packs/components/stats.vue';

export default {
  components: {
    TestPhoneValidation,
    Stats
  }
}
</script>
