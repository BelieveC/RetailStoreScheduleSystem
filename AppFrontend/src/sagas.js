import { put, call, takeLatest } from 'redux-saga/effects'
import C from './constants'
import Ajax from 'ajax'

const Api = {
  fetchStoreRoutines() {
    return Ajax.get('http://localhost:8090/store_routines')
      .then((response) => ({ response }))
      .catch((error) => ({ error }))
  }
}

export function* fetchStoreRoutines() {
  const { response, error } = yield call(Api.fetchStoreRoutines)
  if (response) {
    yield put({ type: C.ADD_STORE_ROUTINES, payload: response })
  } else {
    console.log('Error ',error.message)
  }
}

export function* changeCurrentDayOfWeek({payload}) {
  yield put({ type: C.SELECT_DAY_OF_WEEK, payload: payload })
}

export function* changeCurrentStoreRoutine({payload}) {
  yield put({ type: C.SELECT_STORE_ROUTINE, payload: payload })
}

export default function* rootSaga() {
  yield [
    yield takeLatest(C.INITIAL_LOAD, fetchStoreRoutines),
    yield takeLatest(C.CHANGE_CURRENT_DAY_OF_WEEK, changeCurrentDayOfWeek),
    yield takeLatest(C.CHANGE_CURRENT_STORE_ROUTINE, changeCurrentStoreRoutine)
  ]
}
