group exabgpmon {
	local-as 34762;
	router-id 10.0.2.15;
	local-address 10.0.2.15;

	capability {
	    route-refresh;
	}

	process logtodb { 
		run {{ config['python-path'] }} {{ config['root-path'] }}/app/logtodb.py;
		encoder json;
		receive-routes;
		neighbor-changes;

	}

	process http-api { 
		run {{ config['python-path'] }} {{ config['root-path'] }}/app/http_api.py; 
		encoder json;
		receive-routes;
		neighbor-changes;
	} 

	{% for peer in peers %}
	{%- if peer['enabled'] -%}
	neighbor {{ peer['ip']}} { 
		peer-as {{ peer['asn'] }}; 
		local-as {{ peer['asn'] }};
	}
	{% endif %}
	{% endfor %}


	neighbor 217.21.191.38 {
		local-address 10.0.2.15;
		family {
			inet4 unicast;
		}
		peer-as 65534;
	}

}
