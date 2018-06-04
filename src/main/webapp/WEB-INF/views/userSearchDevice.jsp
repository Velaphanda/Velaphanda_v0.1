<%@include file="templates/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Display Devices | Velaphanda Trading & Projects</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="templates/tableresizefont.jsp"></c:import>
<c:import url="templates/stylesheetlib.jsp"></c:import>
</head>
<body>
	<c:import url="templates/usernavbar.jsp"></c:import>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="userdashboard.html"><svg
							class="glyph stroked home"> <use xlink:href="#stroked-home"></use></svg></a></li>
				<div class="nav navbar-nav navbar-right" style="margin-top: -1%;">
					<a href="#" onclick="history.go(-1);"><span
						class="glyphicon glyphicon-circle-arrow-left btn-lg"
						title="Previous Page"></span></a> <a href="#" onclick="history.go(1);"><span
						class="glyphicon glyphicon-circle-arrow-right btn-lg"
						title="Go Forward"></span></a>
				</div>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading" align="center">Devices</div>
					<div class="panel-body">

						<a target="_blank"
							href="deviceListDownloadPDF?serialNumber=<c:out value='${device.serialNumber}' />">Download
							PDF </a>
						<table data-toggle="table" data-url="${deviceList}"
							data-show-refresh="true" data-show-toggle="true"
							data-search="true" data-select-item-name="toolbar1"
							data-pagination="true" data-sort-name="customername"
							data-sort-order="aesc">
							<thead>
								<tr>
									<th data-toggle="true" data-field="customername"
										data-sortable="true">Customer</th>
									<th data-field="seriano" data-sortable="true">Serial No</th>
									<th data-field="Address" data-sortable="true">Address</th>
									<th data-field="modelNo" data-sortable="true">Model No</th>
									<th data-field="brand" data-sortable="true">Brand</th>
									<th data-field="viewdetails" data-sortable="true">View
										Details</th>
									<th data-field="deviceHistory" data-sortable="true">Device
										History</th>
								</tr>
							</thead>
							<tbody>
								<!-- Iterating over the list sent from Controller -->
								<c:forEach var="list" items="${deviceList}">
									<tr>
										<td><a
											href="userViewCustomer?customerName=<c:out value='${list.customerDevice.customerName}'/>">${list.customerDevice.customerName}</a></td>
										<td><a
											href="userDetailedProduct?serialNumber=<c:out value='${list.serialNumber}'/>">${list.serialNumber}</a></td>
										<td>${list.buildingName }${list.streetNumber }
											${list.streetName }</td>
										<td>${list.modelNumber}</td>
										<td>${list.modelBrand}</td>
										<td><a
											href="userDetailedProduct?serialNumber=<c:out value='${list.serialNumber}'/>">Device
												Details</a></td>
										<td><a
											href="userDeviceHistory?serialNumber=<c:out value='${list.serialNumber}'/>">
												Device History</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- .panel-body -->
				</div>
				<!-- .panel panel-default -->
			</div>
			<!-- /.col-->
		</div>
		<!-- /.row -->
		<!-- footer -->
		<c:import url="templates/footer.jsp"></c:import>
		<!--/ footer -->
	</div>
	<!--/.main-->
	<c:import url="templates/javascriptslib.jsp"></c:import>
	<c:import url="templates/sidebar-collapse.jsp"></c:import>
	<!-- /Scripts -->
</body>
</html>