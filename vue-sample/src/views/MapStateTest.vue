<template>
  <div style="width: 300px; margin: 0 auto; text-align: left; font-size: 18px;">
    <p>$store.state.count is <span>{{ $store.state.count }}</span></p>
    <p>count is <span>{{ count }}</span></p> <!-- これは undefined。なぜなら、computed で count は定義されていないため -->
    <p>count1 is <span>{{ count1 }}</span></p> <!-- computed で count1 を定義しているため、これは表示される -->
    <button v-on:click="click1">this.count</button> <!-- これは undefined -->
    <button v-on:click="click2">this.count1</button>
    <!-- ここで v-bind を使っている理由は http://bit.ly/2ReGN0f を参照 -->
    <MapState1 :localCount="100" />
    <MapState2 />
  </div>
</template>

<script>
import MapState1 from "@/components/MapState1.vue";
import MapState2 from "@/components/MapState2.vue";

export default {
  name: "MapStateTest",
  components: {
    MapState1,
    MapState2
  },
  computed: {
    count1() {
      return this.$store.state.count;
    }
  },
  methods: {
    click1: function () {
      // これは undefined
      // なぜなら、this.count は computed の定義にないから
      alert('count is ' + this.count);
    },
    click2: function () {
      // computed で count1 を定義しておくことで、
      // いちいち this.$store.state.count と書かなくてよくなる
      alert('count is ' + this.count1);
    }
  }
};
</script>

<style>
  span {
    color: pink;
    font-size: 1.5em;
  }
</style>
