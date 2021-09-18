
// How to call from one arm of the match to the other
fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
    match msg {
        Msg::Payload(payload) => {
            if payload != self.payload {
                self.debugged_payload = format!("{:?}", payload);
                self.payload = payload;
                true
            } else {
                false
            }
        }
        Msg::AsyncPayload => {
            // From AsyncPayload to Payload
            let callback = ctx.link().callback(Msg::Payload);

            bindings::get_payload_later(Closure::once_into_js(move |payload: String| {
                callback.emit(payload)
            }));
            false
        }
    }
}


// Reducers take the previous state of the app and return a new state based on the action passed to it.

// reform use callback supplied from parent to communicate with parent from view
// your callback will call the parent callback(supplied to your props), the parent callback will call its update function

pub struct PropsChild {
    pub nr: i64,
    pub name: String,
    pub on_click_child: Callback<Msg>,
}

// view fc from parent supplies callback to child properties when declaring ChildComponent in view
<ChildComponent nr=33 name="Oscar" on_click_child=self.parent_callback.clone()/>
or
<ChildComponent nr=33 name="Oscar" on_click_child=self.link.callback(|msg: Msg| msg)/>

// view fc in child
fn view(&self) -> Html {
    // create our own callback through self.link.callback()
    let onclick = self.link.callback(|_| MsgChild::AddTen);

    // the callback is supplied by parent through PropsChild
    let onclick = self.props.on_click_child.reform(|_| Msg::AddNr(2));

    html! {
    <>
        <button onclick=onclick>{format!("Child name: {} nr: {}",self.props.name, self.props.nr)}</button>

        // sending callback from parent to second child nested inside child
        <ChildChildComponent name="Oscar Jr" nr=5 on_click_child_child=self.props.on_click_child.clone()/>
    </>
    }


// emit
// emit is used in update fc
// Callbacks

// Callbacks are used to communicate with services, agents, and parent components within Yew. They are
// just a Fn wrapped by an Rc to allow them to be cloned.
// They have an emit function that takes their <IN> type as an argument and converts that to a message
// expected by its destination. If a callback from a parent is provided in props to a child component,
// the
// child can call emit on the callback in its update lifecycle hook to send a message back to its parent.
// Closures or Functions provided as props inside the html! macro are automatically converted to Callbacks.

pub struct PropsChild {
    pub nr: i64,
    pub name: String,
    pub on_click_child: Callback<Msg>,
}

// view fc from parent supplies callback to child properties when declaring ChildComponent in view
<ChildComponent nr=33 name="Oscar" on_click_child=self.parent_callback.clone()/>
or
<ChildComponent nr=33 name="Oscar" on_click_child=self.link.callback(|msg: Msg| msg)/>

fn update(&mut self, _msg: Self::Message) -> ShouldRender {
    match _msg {
        MsgChild::AddTen => self.props.on_click_child.emit(Msg::AddTen),
    }
    true













