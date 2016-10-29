export const signup = user => {
  $.ajax({
    url: '/api/users',
    type: 'POST',
    dataType: 'json',
    data: { user }
  });
};

export const login = user => {
  $.ajax({
    url: '/api/session',
    type: 'POST',
    dataType: 'json',
    data: { user }
  });
};

export const logout = user => {
  $.ajax({
    url: '/api/session',
    type: 'DELETE',
    dataType: 'json',
    data: { user }
  });
};
