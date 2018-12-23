<template>
  <div>
    <h2>MapState1</h2>
    <p>count is <span>{{ count }}</span></p> <!-- これは undefined -->
    <p>count1 is <span>{{ count1 }}</span></p>
    <p>countPlusLocalState is <span>{{ countPlusLocalState }}</span></p>
    <button v-on:click="click">MapState1</button>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "MapState1",
  props: {
    localCount: Number
  },
  computed: mapState({
    // state === this.$store.state となる
    count1: state => state.count,
    // 書き方の問題で、
    // 以下も `state => state.count` と同じ意味になる
    count2: "count",
    // 普通のメソッドと同じで、this使いたい時はアロー関数ではダメで function で書く
    countPlusLocalState (state) {
      return state.count + this.localCount;
    }
  }),
  methods: {
    click: function () {
      // computed に mapState しておくことで、
      // メソッドからも $store.state.count とすることなく呼び出せる
      alert('count is ' + this.count2);
    }
  }
};
</script>
