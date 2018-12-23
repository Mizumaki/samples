<template>
  <div>
    <h2>MapState2</h2>
    <p>count is <span>{{ count }}</span></p>
    <p>count1 is <span>{{ count1 }}</span></p>
    <p>hello is <span>{{ hello }}</span></p>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "MapState2",
  props: {
    localCount: Number
  },
  computed: {
    ...mapState({
      count1: state => state.count,
    }),
    hello () {
      return "Hello" + this.count1;
    },
    ...mapState(["count"]),
  },
};
</script>
