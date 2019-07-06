import React from 'react';
import './App.css';
import { Layout, Menu } from 'antd';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux'
import createSagaMiddleware from 'redux-saga'
import reducer from './reducer'
import rootSaga from './sagas'
import C from './constants'

const { Header, Footer, Content } = Layout;
const sagaMiddleware = createSagaMiddleware()

export const store = createStore(reducer, applyMiddleware(sagaMiddleware))
sagaMiddleware.run(rootSaga)
window.store = store

class App extends React.Component {

  render() {
    store.dispatch({ type: C.INITIAL_LOAD })
    return (
      <Provider store={store}>
        <div className="App">
          <Layout>
            <Header style={{ position: 'fixed', zIndex: 1, width: '100%' }}>
              <div className="logo" />
              <Menu
                theme="dark"
                mode="horizontal"
                defaultSelectedKeys={['2']}
                style={{ lineHeight: '64px' }}
              >
                <Menu.Item key="1">Retail Store Shift Schedular</Menu.Item>
              </Menu>
            </Header>
            <Content style={{ padding: '0 50px', marginTop: 64 }}>
              <div style={{ background: '#fff', padding: 24, minHeight: 380 }}>
                Hello World
              </div>
            </Content>
            <Footer style={{ textAlign: 'center' }}>Retail Store Shift Schedular ©2019 Created by Team IIITA</Footer>
          </Layout>
        </div>
      </Provider>
    );
  }
}

export default App;
