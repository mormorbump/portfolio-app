<template>
  <div v-if="loading" class="loader-container">
    <div class="loaders">
      <div class="ball-clip-rotate">
        <div class="ball" />
      </div>
    </div>
  </div>
</template>

<script>
import "loaders.css"
export default {
  data() {
    return {}
  },
  computed: {
    loading() {
      return this.$store.state.loading //storeから読み込む
    }
  }
}
</script>

<style lang="scss" scoped>
$theme-color: #25b290;
.loader-container {
  position: fixed;
  top: 0;
  z-index: 999;
  width: 100%;
  height: 100vh;
  background: #eee;
  opacity: 0.7;
}

.ball-clip-rotate > div {
  border: 2px solid $theme-color;
  /* background-color: orange !important; */
  border-bottom-color: transparent !important;
}

.ball-clip-rotate {
  position: absolute;
  top: 50%;
  color: red;
  transform: translate(-50%, -50%);
  left: 50%;
}
</style>
