import { combineReducers } from 'redux'
import C from './constants'

export const store_routines = (state = [], action) => {
  switch(action.type) {
    case C.ADD_STORE_ROUTINES : 
      return action.payload
  	default: 
  		return state
  }
}

export const current_day_of_week = (state = [], action) => {
  switch(action.type){
    case C.SELECT_DAY_OF_WEEK :
      return action.payload
    default:
      return state
  }
}

export const current_store_routine = (state = [], action) => {
  switch(action.type){
    case C.SELECT_STORE_ROUTINE :
      return action.payload
    default:
      return state
  }
}

export default combineReducers({
  store_routines,
  current_day_of_week,
  current_store_routine
})
