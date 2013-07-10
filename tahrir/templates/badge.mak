<%inherit file="master.mak"/>
<div class="page">
	<!-- COLUMN 1 (Left)-->
	<div class="grid-50">
		<div class="shadow">
		<h1 class="section-header">Badge Info</h1>
		<div class="padded-content">
		${self.functions.badge_thumbnail(badge, 256, 100)}
		<p class="badge-name">${badge.name}</p>
		<p class="badge-description">${badge.description}</p>
		<div class="badge-metadata">
			<p>Tagged with: ${badge.tags}</p>
			<p>Issued by: ${badge.issuer_id}</p>
			<p>Criteria: ${badge.criteria}</p>
		</div>
		</div> <!-- End shadow. -->
		</div> <!-- End padded content. -->
	</div>
	<!-- COLUMN 2 (Right)-->
	<div class="grid-50">
		<div class="shadow">
		<h1 class="section-header">Badge Statistics</h1>
		<div class="padded-content">
		<ul class="pretty-list">
		<li>The ${badge.name} badge was created on
			${badge.created_on.strftime("%Y-%m-%d")}.</li>
		% if times_awarded == 0:
		<li>${badge.name} has <strong>never been awarded!</strong>
		% else:
		<li>${badge.name} has been awarded <strong>${times_awarded}</strong>
			% if times_awarded != 1:
				times.
			% else:
				time.
			% endif
		% endif
		</li>
		<li>${percent_earned * 100}% of people have earned this badge.</li>
		% if first_awarded and last_awarded:
			<li><a href="${request.route_url('user', id=first_awarded_person.id)}">
					<strong>${first_awarded_person.nickname}</a></strong>
					was the first to earn this badge,
					on <strong>${first_awarded.issued_on.strftime("%Y-%m-%d")}
					</strong>.</li>
		<li>This badge was last awarded to <strong>
			<a href="${request.route_url('user', id=last_awarded_person.id)}">
				${last_awarded_person.nickname}</a></strong>
				on <strong>${last_awarded.issued_on.strftime("%Y-%m-%d")}
				</strong>.</li>
		% endif
		</ul>
		</div> <!-- End shadow. -->
		</div> <!-- End padded content. -->
	</div>
    
	<div class="clear spacer"></div>
</div>
