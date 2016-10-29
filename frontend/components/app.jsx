import React from 'react';
import Drawer from 'material-ui/Drawer';
import GreetingContainer from './greeting/greeting_container';

const App = ({ children }) => (
  <div>
    <Drawer open={true}>
      <h1>Benchie</h1>
    </Drawer>
    <GreetingContainer />
    <h1>This is some text!</h1>
    {children}
  </div>
);

export default App;
