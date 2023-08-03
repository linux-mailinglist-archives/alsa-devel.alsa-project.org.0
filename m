Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C8376E9E9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 15:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA954E;
	Thu,  3 Aug 2023 15:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA954E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691068763;
	bh=mXsIbXhuu3AV2aRPUl40i281FIzPnle7h4ii+eoqmSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jxJaGK/K7Um6noZ8NLD4FTgqZ1ds+EzHh5fvBGKHE9xmtv1SzM2pkwuCPVhAWcI8+
	 0foJrUkmzV+8GCnugNRBpbvRUWgCi3iz53cSav0dawSd4aeF0jIQLNrc+/5vtuKfX9
	 nqhGNDgGAjfevLSBvBrsmoTjWYT61WNNm++klqG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38969F8015B; Thu,  3 Aug 2023 15:18:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBAEAF801D5;
	Thu,  3 Aug 2023 15:18:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0444DF8025A; Thu,  3 Aug 2023 15:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1BB1F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 15:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1BB1F8015B
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1qRYDe-00078u-6w; Thu, 03 Aug 2023 15:18:22 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1qRYDd-00070f-AE; Thu, 03 Aug 2023 15:18:21 +0200
Date: Thu, 3 Aug 2023 15:18:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] ASoC: fsl: micfil: Use dual license micfil code
Message-ID: <20230803131821.GA26314@pengutronix.de>
References: <20230803072638.640789-1-daniel.baluta@oss.nxp.com>
 <8a1f9a9a-0962-4c64-8226-b48535a0ae86@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1f9a9a-0962-4c64-8226-b48535a0ae86@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7YOMSHE2ITYZQYYCEOAHC5WPWLJ55LJS
X-Message-ID-Hash: 7YOMSHE2ITYZQYYCEOAHC5WPWLJ55LJS
X-MailFrom: sha@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YOMSHE2ITYZQYYCEOAHC5WPWLJ55LJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 03, 2023 at 12:32:45PM +0100, Mark Brown wrote:
> On Thu, Aug 03, 2023 at 10:26:38AM +0300, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> > 
> > We need this in order to easily reuse register definitions
> > and some functions with Sound Open Firmware driver.
> > 
> > According to Documentation/process/license-rules.rst:
> >     "Dual BSD/GPL"	The module is dual licensed under a GPL v2
> > 			variant or BSD license choice. The exact
> > 			variant of the BSD license can only be
> > 			determined via the license information
> > 			in the corresponding source files.
> > 
> > so use "Dual BSD/GPL" for license string.
> 
> Adding Sascha as he seems to have written a lot of the commits for the
> driver including some features.  Leaving the full message for his
> benefit.

I am fine with that change.

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_micfil.c | 4 ++--
> >  sound/soc/fsl/fsl_micfil.h | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> > index fe28b27e50d0..97cf315781ab 100644
> > --- a/sound/soc/fsl/fsl_micfil.c
> > +++ b/sound/soc/fsl/fsl_micfil.c
> > @@ -1,4 +1,4 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >  // Copyright 2018 NXP
> >  
> >  #include <linux/bitfield.h>
> > @@ -1254,4 +1254,4 @@ module_platform_driver(fsl_micfil_driver);
> >  
> >  MODULE_AUTHOR("Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>");
> >  MODULE_DESCRIPTION("NXP PDM Microphone Interface (MICFIL) driver");
> > -MODULE_LICENSE("GPL v2");
> > +MODULE_LICENSE("Dual BSD/GPL");
> > diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> > index 9237a1c4cb8f..fee9fe3d9119 100644
> > --- a/sound/soc/fsl/fsl_micfil.h
> > +++ b/sound/soc/fsl/fsl_micfil.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> >  /*
> >   * PDM Microphone Interface for the NXP i.MX SoC
> >   * Copyright 2018 NXP
> > -- 
> > 2.25.1
> > 



-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
