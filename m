Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4E84073B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 14:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E0F84D;
	Mon, 29 Jan 2024 14:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E0F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706535634;
	bh=1Q2ncB17EOSNxTDez7UD4M4c7Sx/P3AtArVJ1O+fXSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tlaX5vzEz/WcCtNx+7iK4kumjzmE40wKBBQ6hJc+K840atbURke59vkzD8mvYfhum
	 GsUyy4OVvzI3BOdXYPQ0CraUJzzYNMuimx1mJI9S7c2WVIV1qbK1A45dyn2to6OzEu
	 YG6BRT7zwM5I2GgfRZR75TbKjIlgGAgVA47tk1QU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D178BF8055C; Mon, 29 Jan 2024 14:40:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE0CF80588;
	Mon, 29 Jan 2024 14:40:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3AEEF80563; Mon, 29 Jan 2024 14:37:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B38B5F8055B
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 14:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38B5F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=meesny header.b=L9iZfGuS
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net
 [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TNq9S6zH6zyPp;
	Mon, 29 Jan 2024 15:37:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706535454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j01SVC6SiusGZa0TumiabawLGRRmQcP48TE8VEU49Xc=;
	b=L9iZfGuSfD83n9B3LK8HTFxMOBQQbuaA5j7AEy89zlHiObFEoq0DumP2/ceRG4wRbTNcri
	jQheHk1RhPt3nAaDfTj1oaiShOyeAb4PEmxL5BQaBzcBEnCwa/tMzEBcCJKnZ3L5/ZlLs+
	EAHcb8xB10Bb949XRrbwSJ46+zVPXMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706535454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j01SVC6SiusGZa0TumiabawLGRRmQcP48TE8VEU49Xc=;
	b=CHWrNpP1vI20eioGflr1i1/sTNwlo+7UMqSxrp5Fa1ljTaeEhApV4kGEY2HOU3BGiF0KuE
	vpFhnOlcLRNRExKR+XZQx/3n5v1bqOD9MTQ4tJL21+mp9Cw2vNCVaena8gYwoQwzJxbGWm
	FR/E2LRXpOCpOStEerututhefS1KamU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706535454; a=rsa-sha256; cv=none;
	b=ZB05vLhHMe4jcm6BJfmZSOQT5XiXsY2DINFJDbDSOy1Al2XbWvrSD0mYIQe334KcV6F36+
	D0iTA5fMPLZz8axEa8SJ6ZsPgQS3BmX0rxtmopfbk0bBSiZxm0Vlm5Kplk08vbA7ju1f0F
	OdtQOEcYRLxI++AwJYvJADhA+VmXPUs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AD9B5634C93;
	Mon, 29 Jan 2024 15:37:30 +0200 (EET)
Date: Mon, 29 Jan 2024 13:37:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
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
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Message-ID: <ZbeqGhfBiXarlhtu@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: SC4IL4BXT274GL3XFB5SP4W4NDX7F4UY
X-Message-ID-Hash: SC4IL4BXT274GL3XFB5SP4W4NDX7F4UY
X-MailFrom: sakari.ailus@iki.fi
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC4IL4BXT274GL3XFB5SP4W4NDX7F4UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On Mon, Jan 29, 2024 at 12:54:59AM +0000, Kuninori Morimoto wrote:
> We already have of_graph_get_next_endpoint(), but it is not intuitive
> to use.
> 
> (X)	node {
> (Y)		ports {
> 			port@0 { endpoint { remote-endpoint = ...; };};
> (A1)			port@1 { endpoint { remote-endpoint = ...; };
> (A2)				 endpoint { remote-endpoint = ...; };};
> (B)			port@2 { endpoint { remote-endpoint = ...; };};
> 		};
> 	};
> 
> For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> I want to use like below
> 
> 	A1 = of_graph_get_next_endpoint(port1, NULL);
> 	A2 = of_graph_get_next_endpoint(port1, A1);
> 
> But 1st one will be error, because of_graph_get_next_endpoint() requested
> "parent" means "node" (X) or "ports" (Y), not "port".
> Below are OK
> 
> 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> 
> In other words, we can't handle A1/A2 directly via
> of_graph_get_next_endpoint() so far.
> 
> There is another non intuitive behavior on of_graph_get_next_endpoint().
> In case of if I could get A1 pointer for some way, and if I want to
> handle port@1 things, I would like use it like below
> 
> 	/*
> 	 * "endpoint" is now A1, and handle port1 things here,
> 	 * but we don't know how many endpoints port1 has.
> 	 *
> 	 * Because "endpoint" is non NULL, we can use port1
> 	 * as of_graph_get_next_endpoint(port1, xxx)
> 	 */
> 	do {
> 		/* do something for port1 specific things here */
> 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> 
> But it also not worked as I expected.
> I expect it will be A1 -> A2 -> NULL,
> but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> will fetch endpoint beyond the port.
> 
> It is not useful on generic driver like Generic Sound Card.
> It uses of_get_next_child() instead for now, but it is not intuitive,
> and not check node name (= "endpoint").
> 
> To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> 
> 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 26 +++++++++++++++++++++++++-
>  include/linux/of_graph.h |  2 ++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 14ffd199c9b1..37dbb1b0e742 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
>  }
>  EXPORT_SYMBOL(of_graph_get_next_port);
>  
> +/**
> + * of_graph_get_next_endpoint_raw() - get next endpoint node
> + * @port: pointer to the target port node
> + * @endpoint: current endpoint node, or NULL to get first
> + *
> + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> +						   struct device_node *endpoint)
> +{
> +	if (!port)
> +		return NULL;

of_get_next_child() returns NULL if node is NULL, hence there's no need to
check this.

> +
> +	do {
> +		endpoint = of_get_next_child(port, endpoint);
> +		if (!endpoint)
> +			break;
> +	} while (!of_node_name_eq(endpoint, "endpoint"));
> +
> +	return endpoint;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
> +
>  /**
>   * of_graph_get_next_endpoint() - get next endpoint node
>   * @parent: pointer to the parent device node
> @@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  		 * getting the next child. If the previous endpoint is NULL this
>  		 * will return the first child.
>  		 */
> -		endpoint = of_get_next_child(port, prev);
> +		endpoint = of_graph_get_next_endpoint_raw(port, prev);
>  		if (endpoint) {
>  			of_node_put(port);
>  			return endpoint;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index fff598640e93..427905a6e8c3 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  					struct device_node *previous);
> +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> +						   struct device_node *prev);
>  struct device_node *of_graph_get_next_port(const struct device_node *parent,
>  					   struct device_node *previous);
>  struct device_node *of_graph_get_endpoint_by_regs(

-- 
Kind regards,

Sakari Ailus
