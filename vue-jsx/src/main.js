import Vue from 'vue'
import App from './App.jsx'
import router from './router'
import store from './store'

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: function (h) {
    return (
      <div>
        <p>fuck</p>
        <App propMessage="mother fucker" />
      </div>
    )
  }
}).$mount('#app')
