Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF85844784
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 19:53:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F6DB60;
	Wed, 31 Jan 2024 19:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F6DB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706727186;
	bh=8zQgKe5ifbQ5rIqxPOQjyatCTnXh2bIwEYlKyLDty4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ns2A09vLouqwksS4gMfVRTc6LbvRLu5eQ+m45LC1SZecg3HreOvFE43h0gVLloWHm
	 t8Suuf0JW4J8XCw+7zYUh6wsrb6idx0BHLTxHZlFXk/DthsyjuOVVRnsOr2NhRlUIt
	 5gnXvu+CDqPXnkLDIqQ9hJdcWEO/ghxy+n0UjZvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1E79F8057E; Wed, 31 Jan 2024 19:52:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B662AF80578;
	Wed, 31 Jan 2024 19:52:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F2FEF8055C; Wed, 31 Jan 2024 19:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73814F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 19:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73814F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nBPJWwJE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51D2ECE224D;
	Wed, 31 Jan 2024 18:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F80BC433F1;
	Wed, 31 Jan 2024 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727141;
	bh=8zQgKe5ifbQ5rIqxPOQjyatCTnXh2bIwEYlKyLDty4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBPJWwJEbRCw9XGa9O/cOHCz2wJw2zlEBo7FPMIxL3v1TQGVfqcqBmegNDeZm9xS6
	 F8Y8nV522Hk0ZmC/wzTaR/0Z2mtkIMVEErdfNcwmTwK5QD4PY9XDympcKhdSI1vxwp
	 rsBgFNsNCVu6BaAuQmbFcyNPl7EVnUha+wsK9xJNcgB6jBeZuXNAa5TYaJ/iPapDgk
	 uIt5q6xAiyE7Pw1CA1cHa64FC0LbhGWP5rutIc7Bor+s04Fwqn5YxEKdm7PmpU6f+U
	 DZW50hpcTqkSt35R8ly3ng/Y0JcrZ+4k9xEzgh5CS6fITGxSKQw4R23ajzbKJTw795
	 AkXu9LmKDNg2g==
Date: Wed, 31 Jan 2024 12:52:19 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
Message-ID: <20240131185219.GB1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: KOPL6PUXSRNLJCHSISRHTDN4VGOBD7J5
X-Message-ID-Hash: KOPL6PUXSRNLJCHSISRHTDN4VGOBD7J5
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOPL6PUXSRNLJCHSISRHTDN4VGOBD7J5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 29, 2024 at 12:54:44AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()
> 
> Here, for_each_endpoint_of_node() loop finds each endpoints
> 
> 	ports {
> 		port@0 {
> (1)			endpoint {...};
> 		};
> 		port@1 {
> (2)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In above case, for_each_endpoint_of_node() loop finds endpoint as
> (1) -> (2) -> ...
> 
> Basically, user/driver knows which port is used for what, but not in
> all cases. For example on flexible/generic driver case, how many ports
> are used is not fixed.
> 
> For example Sound Generic Card driver which is used from many venders
> can't know how many ports are used. Because the driver is very
> flexible/generic, it is impossible to know how many ports are used,
> it depends on each vender SoC and/or its used board.
> 
> And more, the port can have multi endpoints. For example Generic Sound
> Card case, it supports many type of connection between CPU / Codec, and
> some of them uses multi endpoint in one port.
> Then, Generic Sound Card want to handle each connection via "port"
> instead of "endpoint".
> But, it is very difficult to handle each "port" by
> for_each_endpoint_of_node(). Getting "port" by using of_get_parent()
> from "endpoint" doesn't work. see below.
> 
> 	ports {
> 		port@0 {
> (1)			endpoint@0 {...};
> (2)			endpoint@1 {...};
> 		};
> 		port@1 {
> (3)			endpoint {...};
> 		};
> 		...
> 	};
> 
> Add "port" base functions.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 48 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_graph.h | 21 ++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index afdaefbd03f6..9e670e99dbbb 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -631,6 +631,42 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  }
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>  
> +/**
> + * of_graph_get_next_port() - get next port node
> + * @parent: pointer to the parent device node
> + * @port: current port node, or NULL to get first
> + *
> + * Return: An 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> +					   struct device_node *port)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!port) {
> +		struct device_node *node;
> +
> +		node = of_get_child_by_name(parent, "ports");
> +		if (node) {
> +			parent = node;
> +			of_node_put(node);

The original code had this right, but here you have it wrong.

You are releasing ports here, but then using it...

> +		}
> +
> +		return of_get_child_by_name(parent, "port");

...here. You have to get the child before you can put the parent.

> +	}
> +
> +	do {
> +		port = of_get_next_child(parent, port);
> +		if (!port)
> +			break;
> +	} while (!of_node_name_eq(port, "port"));
> +
> +	return port;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port);
> +
