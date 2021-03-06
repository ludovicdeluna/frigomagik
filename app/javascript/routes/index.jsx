import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/home";

export default (
  <Router>
    <Switch>
      <Route path="/with_react" exact component={Home} />
    </Switch>
  </Router>
);
