<template>
  <div>
    <Header/>
    <TestPhoneValidation/>
    <Stats/>
    <hr>
  </div>
</template>

<script>
import Header from './header'
import Stats from './stats'
import TestPhoneValidation from './test_phone_validation'

export default {
  components: {
    Header,
    Stats,
    TestPhoneValidation
  }
}
</script>
