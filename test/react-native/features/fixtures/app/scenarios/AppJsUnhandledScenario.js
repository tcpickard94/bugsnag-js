import Scenario from './Scenario'
import Bugsnag from '@bugsnag/react-native'

export class AppJsUnhandledScenario extends Scenario {
  constructor(configuration, extraData, jsConfig) {
    super()
    configuration.appVersion = '1.2.3'
    jsConfig.codeBundleId = '1.2.3-r00110011'
  }
  run() {
    throw new Error('AppJsUnhandledScenario')
  }
}
