var FizzBuzzForm = React.createClass({
  getInitialState: function() {
    return {number: ''};
  },
  handleNumberChange: function(e) {
    this.setState({number: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var number = this.state.number.trim();
    // typically, we might halt here if number is empty, but we want our error message
    this.props.onFizzBuzzSubmit({number: number,});
    this.setState({number: '',});
  },
  render: function() {
    return (
      <form onSubmit={this.handleSubmit}>
        <fieldset>
          <legend>Does your number Fizz!?  Find out?</legend>

          <div className="form-group">
            <label className="sr-only control-label" for="fizz_buzz">Your Number</label>
            <input
               type="text"
               placeholder="Your number"
               value={this.state.number}
               onChange={this.handleNumberChange}
               ref="fizz_buzz"
               name="fizz_buzz"
               className="form-control"
             />
          </div>

          <div className="form-group">
            <input className="btn btn-primary" type="submit" value="Fizz It!" />
          </div>
        </fieldset>
      </form>
    );
  }
});

window.FizzBuzzDisplay = React.createClass({
  render: function(){
    return(
      <p>{this.props.responseData}</p>
    )
  }
})

window.FizzBuzzErrors = React.createClass({
  render: function(){
    var errorNodes = this.props.errors.map(function(error) {
      return (
        <li>
          <strong>{error.field}</strong> {error.message}
        </li>
      );
    });
    return (
      <div className="panel panel-danger">
        <div className="panel-title">
          <h3>Your Submission had the following errors</h3>
        </div>
        <div className="panel-body">
          <ul>
            {errorNodes}
          </ul>
        </div>
      </div>
    );
  },
})


window.FizzBuzz = React.createClass({
  getInitialState: function() {
     return {responseData: [], responseErrors: []};
   },
  lookupFizzBuzz: function(query_body){
    console.log(query_body);
    var lookupUrl = cubaBackendOrigin+'/fizz_buzz.json';
    $.ajax({
      url: lookupUrl,
      data: query_body,
      type: 'POST'
    }).done(function(data) {
      this.setState({responseData: data});
    }.bind(this)).fail(function(xhr, status, err) {
      var responseData = JSON.parse(xhr.responseText)
      this.setState({responseErrors: responseData.errors});
    }.bind(this));
  },
  handleFizzBuzzSubmit: function(query_body) {
    this.setState(this.getInitialState())
    this.lookupFizzBuzz(query_body);
  },
  render: function() {
    return (
    <div className="petition-lookup">
      <FizzBuzzErrors errors={this.state.responseErrors}/>
      <FizzBuzzForm effortLookupRef="effort-lookup" onFizzBuzzSubmit={this.handleFizzBuzzSubmit} />
      <FizzBuzzDisplay responseData={this.state.responseData} />
    </div>
    );
  }
});






