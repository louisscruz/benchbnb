import { RECEIVE_CURRENT_USER, LOGOUT, RECEIVE_ERRORS } from '../actions/session_actions';
import { merge } from 'lodash';

const _nullUser = {
  currentUser: null,
  errors: []
};

export default (state = _nullUser, action) => {
  Object.freeze(state);
  let newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      newState['currentUser'] = action.user;
      return newState;
    case LOGOUT:
      return _nullUser;
    case RECEIVE_ERRORS:
      newState['errors'] = action.errors;
      return newState;
    default:
      return state;
  }
};
