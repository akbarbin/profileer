<template>
  <div id="app">
    <Navigation/>
    <main>
      <router-view></router-view>
    </main>
  </div>
</template>

<script>
import Navigation from './packs/components/navigation'

export default {
  components: {
    Navigation
  }
}
</script>
