Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78128844765
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 19:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9B09F6;
	Wed, 31 Jan 2024 19:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9B09F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706726686;
	bh=OsBhn5fmKfi8kOG7a+u9aX/g82LydKjRXv+v9zD7SsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kNF6pKMPtf64QXuxaOSCpa1uSAyLtcW3Zl2G18Gz0wq+02y9E6svRmW1bixxEHZWG
	 FBfX2zYOSCbUW7fUN4/A995hixI1FiBcX6vw/zRieHfVvny2FWK5zYN5CLtqqmkKuF
	 b2FiiRSY4etEVHkhzyRgfVRHqtxB2Fe79xRpJoAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515E7F80580; Wed, 31 Jan 2024 19:44:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 835C3F80571;
	Wed, 31 Jan 2024 19:44:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3D8F8055C; Wed, 31 Jan 2024 19:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A388AF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 19:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A388AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FGsxtHxS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB4961932;
	Wed, 31 Jan 2024 18:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030B7C433F1;
	Wed, 31 Jan 2024 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706726630;
	bh=OsBhn5fmKfi8kOG7a+u9aX/g82LydKjRXv+v9zD7SsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGsxtHxSAzaOcN/5DV6z9kKZWrCxBG75yEJ+HTkJ7wz3tE7i+AkQ8lSNlubzT/Wr1
	 YzI0JUirmHvsyu3CjdqK2DQSJ5khkHIe7dDj2u6OflMEdGBjo7RDpqk9zezy6u+n7M
	 8o4klU/vOAOIp07+YLxvC4ld2aYpJiKabRHYyXs77IhQfFcJa5eg8llA+NZuYuf84t
	 4x92sPioNPV08CnIET+iDDUoj0PexWlAbTQtAlJ6zZtVDFm7PGFczPLR8oPtvb8N+S
	 BOV7rZmhi5HMF0au63wBS245/ytj76g90eMbblyamoeZ055mtlfCMOVI3SDNAN2vyO
	 /uCwIMQ/ApvKA==
Date: Wed, 31 Jan 2024 12:43:47 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
Message-ID: <20240131184347.GA1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
 <afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
 <20240129130219.GA20460@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129130219.GA20460@pendragon.ideasonboard.com>
Message-ID-Hash: 2IH3GWUBJH3AJXOHQPVH44OASSTKJVV2
X-Message-ID-Hash: 2IH3GWUBJH3AJXOHQPVH44OASSTKJVV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IH3GWUBJH3AJXOHQPVH44OASSTKJVV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 29, 2024 at 03:02:19PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 29, 2024 at 02:29:22PM +0200, Tomi Valkeinen wrote:
> > On 29/01/2024 02:54, Kuninori Morimoto wrote:
> > > We already have of_graph_get_next_endpoint(), but it is not intuitive
> > > to use.
> > > 
> > > (X)	node {
> > > (Y)		ports {
> > > 			port@0 { endpoint { remote-endpoint = ...; };};
> > > (A1)			port@1 { endpoint { remote-endpoint = ...; };
> > > (A2)				 endpoint { remote-endpoint = ...; };};
> > > (B)			port@2 { endpoint { remote-endpoint = ...; };};
> > > 		};
> > > 	};
> > > 
> > > For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> > > I want to use like below
> > > 
> > > 	A1 = of_graph_get_next_endpoint(port1, NULL);
> > > 	A2 = of_graph_get_next_endpoint(port1, A1);
> > > 
> > > But 1st one will be error, because of_graph_get_next_endpoint() requested
> > > "parent" means "node" (X) or "ports" (Y), not "port".
> > > Below are OK
> > > 
> > > 	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
> > > 	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint
> > > 
> > > In other words, we can't handle A1/A2 directly via
> > > of_graph_get_next_endpoint() so far.
> > > 
> > > There is another non intuitive behavior on of_graph_get_next_endpoint().
> > > In case of if I could get A1 pointer for some way, and if I want to
> > > handle port@1 things, I would like use it like below
> > > 
> > > 	/*
> > > 	 * "endpoint" is now A1, and handle port1 things here,
> > > 	 * but we don't know how many endpoints port1 has.
> > > 	 *
> > > 	 * Because "endpoint" is non NULL, we can use port1
> > > 	 * as of_graph_get_next_endpoint(port1, xxx)
> > > 	 */
> > > 	do {
> > > 		/* do something for port1 specific things here */
> > > 	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))
> > > 
> > > But it also not worked as I expected.
> > > I expect it will be A1 -> A2 -> NULL,
> > > but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
> > > will fetch endpoint beyond the port.
> > > 
> > > It is not useful on generic driver like Generic Sound Card.
> > > It uses of_get_next_child() instead for now, but it is not intuitive,
> > > and not check node name (= "endpoint").
> > > 
> > > To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()
> > > 
> > > 	of_graph_get_next_endpoint_raw(port1, NULL); // A1
> > > 	of_graph_get_next_endpoint_raw(port1, A1);   // A2
> > > 	of_graph_get_next_endpoint_raw(port1, A2);   // NULL
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >   drivers/of/property.c    | 26 +++++++++++++++++++++++++-
> > >   include/linux/of_graph.h |  2 ++
> > >   2 files changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > > index 14ffd199c9b1..37dbb1b0e742 100644
> > > --- a/drivers/of/property.c
> > > +++ b/drivers/of/property.c
> > > @@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
> > >   }
> > >   EXPORT_SYMBOL(of_graph_get_next_port);
> > >   
> > > +/**
> > > + * of_graph_get_next_endpoint_raw() - get next endpoint node
> > 
> > How about "of_graph_get_next_port_endpoint()"?
> 
> We may want to also rename the existing of_graph_get_next_endpoint()
> function to of_graph_next_dev_endpoint() then. It would be a tree-wide
> patch, which is always annoying to get reviewed and merged, so if Rob
> would prefer avoiding the rename, I'm fine with that.

I think we should get rid of or minimize of_graph_get_next_endpoint() in 
its current form. In general, drivers should be asking for a specific 
port number because their function is fixed in the binding. Iterating 
over endpoints within a port is okay as that's usually a selecting 1 of 
N operation. 

Most cases are in the form of of_graph_get_next_endpoint(dev, NULL) 
which is equivalent to of_graph_get_endpoint_by_regs(dev, 0, 0). 
Technically, -1 instead of 0 is equivalent, but I'd argue is sloppy and 
wrong.

I also added of_graph_get_remote_node() for this reason and cleaned a 
lot of these (in DRM) up some time ago. Because in the end, a driver 
generally just wants the remote device it is connected to and details of 
parsing the graph should be mostly opaque.

Wouldn't something like this work for this case:

#define for_each_port_endpoint_of_node(parent, port, child) \
	for (child = of_graph_get_endpoint_by_regs(parent, port, -1); child != NULL; \
	     child = of_get_next_child(parent, child))

Rob
