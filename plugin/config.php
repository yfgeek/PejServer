<h3>配置信息</h3>
	<blockquote>
	<p>请预先设置您的信息</p>
	</blockquote>
	
	<div class="row">
        <div class="col-xs-3">
          <div class="tile">
            <img src="images/teamviewer.png" alt="Compas" class="tile-image big-illustration">
            <h3 class="tile-title">Teamviwer</h3>
            <p>Teamviewer路径</p>
            <a class="btn btn-info btn-large btn-block"  data-toggle="modal" data-target="#confteam" href="#confteam">立即设置</a>
          </div>
        </div>
        <div class="col-xs-3">
          <div class="tile">
            <img src="images/wifi.png" alt="Compas" class="tile-image big-illustration">
            <h3 class="tile-title">CCproxy</h3>
            <p>CCproxy路径</p>
            <a class="btn btn-info btn-large btn-block"  data-toggle="modal" data-target="#confproxy" href="#confproxy">立即配置</a>
          </div>
        </div>
        <div class="col-xs-3">
          <div class="tile">
            <img src="images/vmware.png" alt="Compas" class="tile-image big-illustration">
            <h3 class="tile-title">Vmware</h3>
            <p>Vmware路径</p>
            <a class="btn btn-info btn-large btn-block"  data-toggle="modal" data-target="#confvm" href="#confvm">立即配置</a>
          </div>
        </div>
        <div class="col-xs-3">
          <div class="tile">
            <img src="images/system.png" alt="Compas" class="tile-image big-illustration">
            <h3 class="tile-title">虚拟机</h3>
            <p>系统1,2,3路径</p>
            <a class="btn btn-info btn-large btn-block"  data-toggle="modal" data-target="#confsys" href="#confsys">立即配置</a>
          </div>
        </div>		

      </div>
<div class="modal fade" id="confteam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h6 class="modal-title" id="myModalLabel">Teamviewer路径配置</h4>
      </div>
	  <div class="modal-body">
		<div class="row">
		<div class="col-xs-4"><p>Teamviwer地址</p></div>
		<div class="col-xs-8"><input type="text" value="C:\Program Files (x86)\TeamViewer\Version9\TeamViewer.exe" class="form-control"></div>
		</div>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-info">保存配置</button>		  
         <button type="button" class="btn btn-primary" data-dismiss="modal">关闭窗口</button>
      </div>
      </div>
    </div>
</div>

<div class="modal fade" id="confproxy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h6 class="modal-title" id="myModalLabel">CCproxy路径配置</h4>
      </div>
	  <div class="modal-body">
		<div class="row">
		<div class="col-xs-4"><p>CCproxy地址</p></div>
		<div class="col-xs-8"><input type="text" value="C:\CCProxy\CCProxy.exe" class="form-control"></div>
		</div>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-info">保存配置</button>		  
         <button type="button" class="btn btn-primary" data-dismiss="modal">关闭窗口</button>
      </div>
      </div>
    </div>
</div>	

<div class="modal fade" id="confvm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h6 class="modal-title" id="myModalLabel">Vmware路径配置</h4>
      </div>
	  <div class="modal-body">
		<div class="row">
		<div class="col-xs-4"><p>Vmware地址</p></div>
		<div class="col-xs-8"><input type="text" value="C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe" class="form-control"></div>
		</div>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-info">保存配置</button>		  
         <button type="button" class="btn btn-primary" data-dismiss="modal">关闭窗口</button>
      </div>
      </div>
    </div>
</div>

<div class="modal fade" id="confsys" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h6 class="modal-title" id="myModalLabel">虚拟机文件路径配置</h4>
      </div>
	  <div class="modal-body">
		<div class="row">
		<div class="col-xs-4"><p>虚拟机系统1</p></div>
		<div class="col-xs-8"><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></div>
		<div class="col-xs-4"><p>虚拟机系统2</p></div>
		<div class="col-xs-8"><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></div>
		<div class="col-xs-4"><p>虚拟机系统3</p></div>
		<div class="col-xs-8"><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></div>
		</div>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-info">保存配置</button>		  
         <button type="button" class="btn btn-primary" data-dismiss="modal">关闭窗口</button>
      </div>
      </div>
    </div>
</div>

  
	<table class="table table-striped" style="display:none">
	<tr>
	<td>Teamviwer地址</td>
	<td><input type="text" value="C:\Program Files (x86)\TeamViewer\Version9\TeamViewer.exe" class="form-control"></td>
	</tr>
	<tr>
	<td>CCproxy地址</td>
	<td><input type="text" value="C:\CCProxy\CCProxy.exe" class="form-control"></td>
	</tr>
	<tr>
	<td>Vmware地址</td>
	<td><input type="text" value="C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe" class="form-control"></td>
	</tr>
	<tr>
	<td>虚拟机系统1</td>
	<td><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></td>
	</tr><tr>
	<td>虚拟机系统2</td>
	<td><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></td>
	</tr><tr>
	<td>虚拟机系统3</td>
	<td><input type="text" value="D:\CodeXP\CodeXP.vmx" class="form-control"></td>
	</tr>
	<tr>
	<td>功能</td>
	<td><input type="text" value="" class="form-control"></td>
	</tr>	
	</table>