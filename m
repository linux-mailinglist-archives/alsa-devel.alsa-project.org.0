Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99018405E5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 14:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3FE83B;
	Mon, 29 Jan 2024 14:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3FE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706533392;
	bh=oYJ9n0kmGBMU2bNIDl3amQ7PKIOiEuPvpUteUrfq+VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxS8k1EVjLMEOU8ezUWGTh09jBNGb7V4RaLwaPXzX1VceyWiHYqk0yVO9MMYGkbWb
	 zf2NImI57dpfB2AtvXHXat/cYxTOSB6RFKlaZZXeKSBW+jWtI7SCgxn3MNXJUp8W1L
	 qdOavhues0dbVIbaNqm2QRCn9P6pqi+IiUlaEFMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28D82F80567; Mon, 29 Jan 2024 14:02:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E8EF80571;
	Mon, 29 Jan 2024 14:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E82F80310; Mon, 29 Jan 2024 14:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F634F8017A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 14:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F634F8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=djMzyfRg
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D80915B5;
	Mon, 29 Jan 2024 14:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706533261;
	bh=oYJ9n0kmGBMU2bNIDl3amQ7PKIOiEuPvpUteUrfq+VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djMzyfRgXF1NPy65MR+61w/tngalKk2yKnI+GwLaXMGffyykJfxg+BE9W8Ny+SzKp
	 3edG11TvKTFuKerv6OEweKNRHe4leVvnw1jLWk7XEqB5zloijNMsHBUZ/GvRbEzqKG
	 ZOkF9RPQ1nYYuooHeJRC/2msKN4yH4MV7pyzzASQ=
Date: Mon, 29 Jan 2024 15:02:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Uwe =?utf-8?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Message-ID: <20240129130219.GA20460@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
 <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
Message-ID-Hash: LQSPJGTNSS2AL6ALWTVQAIOQZYF2ZOI4
X-Message-ID-Hash: LQSPJGTNSS2AL6ALWTVQAIOQZYF2ZOI4
X-MailFrom: laurent.pinchart@ideasonboard.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQSPJGTNSS2AL6ALWTVQAIOQZYF2ZOI4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 29, 2024 at 02:29:22PM +0200, Tomi Valkeinen wrote:
> On 29/01/2024 02:54, Kuninori Morimoto wrote:
> > We already have of_graph_get_next_endpoint(), but it is not intuitive
> > to use.
> > 
> > (X)	node {
> > (Y)		ports {
> > 			port@0 { endpoint { remote-endpoint = ...; };};
> > (A1)			port@1 { endpoint { remote-endpoint = ...; };
> > (A2)				 endpoint { remote-endpoint = ...; };};
> > (B)			port@2 { endpoint { remote-endpoint = ...; };};
> > 		};
> > 	};
> > 
> > For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> > I want to use like below
> > 
> > 	A1 = of_graph_get_next_endpoint(port1, NULL);
> > 	A2 = of_graph_get_next_endpoint(port1, A1);
> > 
> > But 1st one will be error, because of_graph_get_next_endpoint() requested
> > "parent" means "node" (X) or "ports" (Y), not "port".
> > Below are OK
> > 
> > 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> > 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> > 
> > In other words, we can't handle A1/A2 directly via
> > of_graph_get_next_endpoint() so far.
> > 
> > There is another non intuitive behavior on of_graph_get_next_endpoint().
> > In case of if I could get A1 pointer for some way, and if I want to
> > handle port@1 things, I would like use it like below
> > 
> > 	/*
> > 	 * "endpoint" is now A1, and handle port1 things here,
> > 	 * but we don't know how many endpoints port1 has.
> > 	 *
> > 	 * Because "endpoint" is non NULL, we can use port1
> > 	 * as of_graph_get_next_endpoint(port1, xxx)
> > 	 */
> > 	do {
> > 		/* do something for port1 specific things here */
> > 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> > 
> > But it also not worked as I expected.
> > I expect it will be A1 -> A2 -> NULL,
> > but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> > will fetch endpoint beyond the port.
> > 
> > It is not useful on generic driver like Generic Sound Card.
> > It uses of_get_next_child() instead for now, but it is not intuitive,
> > and not check node name (= "endpoint").
> > 
> > To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> > 
> > 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> > 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> > 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >   drivers/of/property.c    | 26 +++++++++++++++++++++++++-
> >   include/linux/of_graph.h |  2 ++
> >   2 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 14ffd199c9b1..37dbb1b0e742 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
> >   }
> >   EXPORT_SYMBOL(of_graph_get_next_port);
> >   
> > +/**
> > + * of_graph_get_next_endpoint_raw() - get next endpoint node
> 
> How about "of_graph_get_next_port_endpoint()"?

We may want to also rename the existing of_graph_get_next_endpoint()
function to of_graph_next_dev_endpoint() then. It would be a tree-wide
patch, which is always annoying to get reviewed and merged, so if Rob
would prefer avoiding the rename, I'm fine with that.

> > + * @port: pointer to the target port node
> > + * @endpoint: current endpoint node, or NULL to get first
> > + *
> > + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> 
> It might be good to highlight here the difference to the 
> of_graph_get_next_endpoint().

Yes, and the documentation of of_graph_get_next_endpoint() shoul also be
improved.

> > +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> > +						   struct device_node *endpoint)
> > +{
> > +	if (!port)
> > +		return NULL;
> > +
> > +	do {
> > +		endpoint = of_get_next_child(port, endpoint);
> > +		if (!endpoint)
> > +			break;
> > +	} while (!of_node_name_eq(endpoint, "endpoint"));
> > +
> > +	return endpoint;
> > +}
> > +EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
> > +
> >   /**
> >    * of_graph_get_next_endpoint() - get next endpoint node
> >    * @parent: pointer to the parent device node
> > @@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
> >   		 * getting the next child. If the previous endpoint is NULL this
> >   		 * will return the first child.
> >   		 */
> > -		endpoint = of_get_next_child(port, prev);
> > +		endpoint = of_graph_get_next_endpoint_raw(port, prev);
> >   		if (endpoint) {
> >   			of_node_put(port);
> >   			return endpoint;
> > diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> > index fff598640e93..427905a6e8c3 100644
> > --- a/include/linux/of_graph.h
> > +++ b/include/linux/of_graph.h
> > @@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
> >   struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
> >   struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
> >   					struct device_node *previous);
> > +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> > +						   struct device_node *prev);
> >   struct device_node *of_graph_get_next_port(const struct device_node *parent,
> >   					   struct device_node *previous);
> >   struct device_node *of_graph_get_endpoint_by_regs(

-- 
Regards,

Laurent Pinchart
