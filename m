Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07A8404FF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 13:28:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F0583E;
	Mon, 29 Jan 2024 13:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F0583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706531297;
	bh=LD9PXBHasMJZgGdP7dqL3EAkH+ae11rR+hI3U+UsZRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InS1lB5BPuVDfICSWHVjuTzZxBK4CQr2Th16sPuhwmSeu4XpGUd7DrN/sGyvnWXv+
	 tgDinfquuKxI8k9shQseMBCqV3WbPy+E0bBt61MPUF37V2T/EjQmKe1kOMm3585fp/
	 Rq2yj7PsRDAm0eyv2fW7fg2MitQ9NdfXiAfGQqxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 461E4F8057F; Mon, 29 Jan 2024 13:27:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD07AF8057E;
	Mon, 29 Jan 2024 13:27:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D27F800FB; Mon, 29 Jan 2024 13:27:40 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E19F4F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 13:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19F4F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=hV0wfjbK
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FFB91803;
	Mon, 29 Jan 2024 13:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706531178;
	bh=LD9PXBHasMJZgGdP7dqL3EAkH+ae11rR+hI3U+UsZRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hV0wfjbKo92FIVlElfyP/cM6PG/q2iFuoPQOkqKD4H3NktWYUgk5FXVekLTeYivzc
	 tTxmPjr5npkZ3qHxiG2HqsVOTOqnaQGXBaEadpLTCeTgQWT7/jEU6BWRXnnYwubSAR
	 Hcs6IoBoqPWgTocl3pr823q/zsNRkmRRalyMj2h4=
Date: Mon, 29 Jan 2024 14:27:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?B?IlV3ZSBLbGVpbmUtS8ODwrZuaWci?= <u.kleine-koenig@pengutronix.de>,
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <20240129122736.GC8131@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: G345XV4RV5M6MZW62XXHTZAWQCHSTJDU
X-Message-ID-Hash: G345XV4RV5M6MZW62XXHTZAWQCHSTJDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G345XV4RV5M6MZW62XXHTZAWQCHSTJDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Morimoto-san,

(CC'ing Sakari Ailus)

On Mon, Jan 29, 2024 at 12:54:24AM +0000, Kuninori Morimoto wrote:
> 
> Hi Rob
> 
> This is v2 of port base loop patch-set
> 
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()
> 
> But to handling "port" base things, it is not useful. We want to have
> "port" base functions, too. This patch-set adds it.
> 
> Because current existing drivers couldn't use "port" base functions,
> it were implemented in a different way. This patch-set doesn't try
> to full-replace to avoid unknown bug, try easy / quick replace only
> for now, but easy to know how "port" base functions are needed.
> 
> Because I can't test the driver which I can't use, non-ASoC drivers
> needs Tested-by, Acked-by.

The strategy sounds good to me. However, I'm wondering if you shouldn't
take one more step in the core, and implement these as fwnode
operations. Or is there a reason why OF is special, and iterating over
ports would be useful for drivers on OF systems but not on other types
of systems ?

> v1 -> v2
> 	- tidyup function explain
> 	- add missing header on each files
> 
> Kuninori Morimoto (13):
>   of: property: add port base loop
>   of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
>   of: property: add of_graph_get_next_endpoint_raw()
>   drm: omapdrm: use of_graph_get_next_endpoint_raw()
>   media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
>   ASoC: audio-graph-card: use of_graph_get_next_endpoint_raw()
>   ASoC: audio-graph-card2: use of_graph_get_next_port()
>   ASoC: audio-graph-card2: use of_graph_get_next_endpoint_raw()
>   ASoC: test-component: use for_each_port_of_node()
>   fbdev: omapfb: use of_graph_get_remote_port()
>   fbdev: omapfb: use of_graph_get_next_port()
>   fbdev: omapfb: use of_graph_get_next_endpoint_raw()
>   fbdev: omapfb: use of_graph_get_next_endpoint()
> 
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   2 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   2 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |   2 +-
>  drivers/of/property.c                         |  92 +++++++++++++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 101 +-----------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c   |   3 +-
>  include/linux/of_graph.h                      |  23 ++++
>  include/video/omapfb_dss.h                    |  11 --
>  sound/soc/generic/audio-graph-card.c          |   2 +-
>  sound/soc/generic/audio-graph-card2.c         |  31 ++----
>  sound/soc/generic/test-component.c            |   2 +-
>  17 files changed, 133 insertions(+), 162 deletions(-)

-- 
Regards,

Laurent Pinchart
