<template>
  <router-view/>
  <FooterScreen />
</template>

<script>
import FooterScreen from './components/Footer.vue'

export default {
  name: 'HomeView',
  components: {
    FooterScreen
  }
}
</script>

