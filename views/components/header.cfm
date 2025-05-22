

<cfif structKeyExists(prc, "oCurrentUser")>
	<cfdump var="#prc.oCurrentUser.getUsername()#" label = "PriReqCon - oCurrentUser.getUsername()">
</cfif>


<cfoutput>
<section id="header">
		<!--- Header: Top NavBar --->
		<div id="menu">
			<!--- Desktop View --->
			<nav class="navbar navbar-expand-lg navbar-light bg-dark text-light">
				<div class="container">
					<div>
						<div class="">
							<a class="navbar-brand" href="/">
								<img
									src="https://voge.s3.ap-southeast-1.amazonaws.com/images/app/header-logo-ph.png"
									alt="logo"
								/>
							</a>
						</div>
					</div>
					<div>
						<div class="show navbar-collapse" id="navbarColor03">
							<ul class="navbar-nav me-auto">
								<li class="nav-item">
									<a class="nav-link active text-light" href="#event.buildLink( to='')#">
										HOME
										<span class="visually-hidden">(current)</span>
									</a>
								</li>
								<li class="nav-item dropdown">
									<a
										class="nav-link dropdown-toggle text-light"
										id   ="navbarDropdown"
										role ="button"
										data-bs-toggle="dropdown"
										aria-expanded="false"
									>
										MODELS
									</a>
									<ul
										class="dropdown-menu bg-dark"
										aria-labelledby="navbarDropdown" style="min-width:6rem;"
									>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/model/650DS"
										>
											<small>650 DS</small>
										</a>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/model/500DSX"
										>
											<small>500 DSX</small>
										</a>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/model/500R"
										>
											<small>500 R</small>
										</a>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/model/500AC"
										>
											<small>500 AC</small>
										</a>
									</ul>
								</li>
								<li class="nav-item dropdown">
									<a
										class="nav-link dropdown-toggle text-light"
										href ="/" id="navbarDropdown"
										role ="button"
										data-bs-toggle="dropdown"
										aria-expanded="false"
									>
										EVENTS
									</a>
									<ul
										class="dropdown-menu bg-dark"
										aria-labelledby="navbarDropdown" style="min-width:6rem;"
									>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/events/boss-ironman"
										>
											<small>Boss Ironman</small>
										</a>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/events/enduro"
										>
											<small>FJMoto Enduro</small>
										</a>
									</ul>
								</li>
								<li class="nav-item dropdown">
									<a
										class="nav-link dropdown-toggle text-light"
										href ="/" id="navbarDropdown"
										role ="button"
										data-bs-toggle="dropdown"
										aria-expanded="false"
									>
										COMMUNITY
									</a>
									<ul
										class="dropdown-menu bg-dark"
										aria-labelledby="navbarDropdown" style="min-width:6rem;"
									>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/community/voyagers"
										>
											<small>Voyager Club</small>
										</a>
										<a
											class="dropdown-item nav-link text-center text-white background-gold-hover"
											href ="/community/rides"
										>
											<small>Fun Rides</small>
										</a>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link text-light" href="#event.buildLink( to='aboutus')#">ABOUT US</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-light" href="#event.buildLink( to='contactus')#">CONTACT US</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</section>
</cfoutput>