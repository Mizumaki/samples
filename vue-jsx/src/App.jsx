import Vue from 'vue';
import Component from 'vue-class-component';

@Component({
  props: {
    propMessage: String,
  }
})
export default class App extends Vue {
  // initial data
  msg = 123

  // use prop values for initial data
  helloMsg = 'Hello, ' + this.propMessage

  // lifecycle hook
  mounted() {
    //this.greet()
  }

  // method
  greet() {
    alert('greeting: ' + this.msg)
  }

  // computed
  get computedMsg() {
    return 'computed ' + this.msg
  }

  // "h" is injected automatically
  // https://github.com/vuejs/babel-plugin-transform-vue-jsx#h-auto-injection
  render() {
    return (
      <div>
        <input vModel={ this.msg } />
        <p>prop: { this.propMessage }</p>
        <p>msg: { this.msg }</p>
        <p>helloMsg: { this.helloMsg }</p>
        <p>computed msg: {this.computedMsg}</p>
        <router-link to="/about">Go About</router-link>
        <router-view />
      </div>
    )
  }
}