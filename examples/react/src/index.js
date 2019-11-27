import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'
import App from './App'

import bugsnagClient from './lib/bugsnag'

const ErrorBoundary = bugsnagClient.getPlugin('react')

const ErrorScreen = () =>
  <div>
    <h1>⚠️ Error ⚠️</h1>
    <p><strong>Uh oh, there was an error in the component tree!</strong></p>
    <p>This <code>FallbackComponent</code> prop can be used to show something useful to your users when such errors occur.</p>
  </div>

const onError = event => {
  // You can also provide an onError callback to run just on errors caught by
  // the error boundary. Maybe you want to attach some of the current state from
  // whatever model/store you're using (e.g redux)
  console.log('about to send this event', { event })
}

ReactDOM.render(
  <ErrorBoundary FallbackComponent={ErrorScreen} onError={onError}>
    <App />
  </ErrorBoundary>,
  document.getElementById('root')
)
