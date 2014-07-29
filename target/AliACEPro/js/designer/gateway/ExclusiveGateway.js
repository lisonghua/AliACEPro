draw2d.ExclusiveGateway=function(_url){
	draw2d.ResizeImage.call(this,_url);
	this.rightOutputPort=null;
	this.leftOutputPort=null;
	this.topOutputPort=null;
	this.bottomOutputPort=null;
	this.gatewayId=this.id;
	this.gatewayName=null;
	this.setDimension(40,40);
};
draw2d.ExclusiveGateway.prototype=new draw2d.ResizeImage();
draw2d.ExclusiveGateway.prototype.type="draw2d.ExclusiveGateway";
draw2d.ExclusiveGateway.prototype.generateId=function(){
	this.id="exclusiveGateway"+Sequence.create();
	this.gatewayId=this.id;
};
draw2d.ExclusiveGateway.prototype.createHTMLElement=function(){
	var item = draw2d.ResizeImage.prototype.createHTMLElement.call(this);
	return item;
};
draw2d.ExclusiveGateway.prototype.setDimension=function(w, h){
	draw2d.ResizeImage.prototype.setDimension.call(this, w, h);
};
draw2d.ExclusiveGateway.prototype.setWorkflow=function(_4fe5){
	draw2d.ResizeImage.prototype.setWorkflow.call(this,_4fe5);
	if(_4fe5!==null&&this.rightOutputPort===null){
		this.rightOutputPort=new draw2d.MyOutputPort();
		this.rightOutputPort.setMaxFanOut(1);
		this.rightOutputPort.setWorkflow(_4fe5);
		this.rightOutputPort.setName("rightOutputPort");
		//this.rightOutputPort.setBackgroundColor(new draw2d.Color(245,115,115));
		this.addPort(this.rightOutputPort,this.width,this.height/2);
	}
	if(_4fe5!==null&&this.leftOutputPort===null){
		this.leftOutputPort=new draw2d.MyOutputPort();
		this.leftOutputPort.setMaxFanOut(1);
		this.leftOutputPort.setWorkflow(_4fe5);
		this.leftOutputPort.setName("leftOutputPort");
		//this.leftOutputPort.setBackgroundColor(new draw2d.Color(245,115,115));
		this.addPort(this.leftOutputPort,0,this.height/2);
	}
	if(_4fe5!==null&&this.topOutputPort===null){
		this.topOutputPort=new draw2d.MyOutputPort();
		this.topOutputPort.setMaxFanOut(1);
		this.topOutputPort.setWorkflow(_4fe5);
		this.topOutputPort.setName("topOutputPort");
		//this.topOutputPort.setBackgroundColor(new draw2d.Color(245,115,115));
		this.addPort(this.topOutputPort,this.width/2,0);
	}
	if(_4fe5!==null&&this.bottomOutputPort===null){
		this.bottomOutputPort=new draw2d.MyOutputPort();
		this.bottomOutputPort.setMaxFanOut(1);
		this.bottomOutputPort.setWorkflow(_4fe5);
		this.bottomOutputPort.setName("bottomOutputPort");
		//this.bottomOutputPort.setBackgroundColor(new draw2d.Color(245,115,115));
		this.addPort(this.bottomOutputPort,this.width/2,this.height);
	}
};
draw2d.ExclusiveGateway.prototype.getContextMenu=function(){
	if(this.workflow.disabled)return null;
	var menu =new draw2d.ContextMenu(100, 50);
	var data = {event:this};
	menu.appendMenuItem(new draw2d.ContextMenuItem("Properties", "properties-icon",data,function(x,y)
	{
		var data = this.getData();
		var event = data.event;
		var tid = event.getId();
		if(typeof openTaskProperties != "undefined"){
			openTaskProperties(tid);
		}
	}));
	
	return menu;
};
draw2d.ExclusiveGateway.prototype.toXML=function(){
	var name = this.gatewayId;
	var newName = trim(this.gatewayName);
	if(newName != null && newName != "")
		name = newName;
	var xml='<exclusiveGateway id="'+this.gatewayId+'" name="'+name+'"></exclusiveGateway>\n';
	return xml;
};
draw2d.ExclusiveGateway.prototype.toObject=function(jqObject){
	this.id=jq(jqObject).attr('id');
	this.gatewayId=jq(jqObject).attr('id');
	this.gatewayName=jq(jqObject).attr('name');
};	