Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15C7F2693
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 08:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1460D950;
	Tue, 21 Nov 2023 08:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1460D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700552709;
	bh=UF1VNK1HfbZxsAU2pecJYw22EDeDawdfjbHoG6omKJg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCtFl6L0eyYDWBMSac1PPgW1zrq25Wt69OxEw4WkD8c0wVIuwnK0Lzu79viOTcdev
	 U8SphX1BHQNbLvfnhc+PePBw7Zw3wQzyw22BkmTUhMQtHLKMJ7A6e3CfWN0sdLP7oy
	 SX1w5sZZ1sTObRBvyDbCc0lcelZaXZeydRmPAlFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6548FF80563; Tue, 21 Nov 2023 08:44:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9CAF80558;
	Tue, 21 Nov 2023 08:44:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A90B7F802E8; Tue, 21 Nov 2023 08:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33601F80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 08:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33601F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dT42X7ba
Received: by mail.gandi.net (Postfix) with ESMTPSA id B32381C0015;
	Tue, 21 Nov 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700552615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3xCJjkxWbDTmhyET+JWYTIEBodqcC4r6MWWY/ifhBQ=;
	b=dT42X7baSXiBorHZH4H94BtPqndNDcp8eqbqRa5/266PjA697mrwQZuiFMOFV3bqC+LFYf
	JD9t8zFm7iJBbo/uCf/mKJjOP3PTC3GmJI37eI7GTOjuJ8ITZp/wQUz3EpxNLl97kL/Ydd
	npP0GpYKiS9dmO5mpmTMbiXDcLLjlmnLf9w/QSqE/jx7Nk+ez5MHwmRVfmhMUj3fQVPeVf
	1mjEET4IRfcoEu+gEy02lqEJPcaybC3vZ0djc8RWppQTbNOLGdI5ALeXmq/2hlPmpc12Dm
	w/HPmiPybkosUJleovl4ltfmbt1SZUteSF/8l7z5wxKTA+iJ8rqKQbSTnAEgQg==
Date: Tue, 21 Nov 2023 08:43:30 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li
 Yang <leoyang.li@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231121084330.4064bf14@bootlin.com>
In-Reply-To: <573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
	<20231117164746.0589e955@kernel.org>
	<573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: YURXSV26I2YWTVHGFMF45ETXHLJGWHER
X-Message-ID-Hash: YURXSV26I2YWTVHGFMF45ETXHLJGWHER
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YURXSV26I2YWTVHGFMF45ETXHLJGWHER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark, Jakub, Qiang, Li,

On Mon, 20 Nov 2023 13:30:08 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Nov 17, 2023 at 04:47:46PM -0800, Jakub Kicinski wrote:
> > On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:  
> > >    - Removed Patches 6, 7 and 8 (patches applied)
> > > 
> > >    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
> > >      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'  
> 
> > I thought someone (Mark?) asked for the networking stuff to be put 
> > on a branch. If that's still the preference - is it possible to factor
> > these out as a standalone series, too?  Will they build on their own?  
> 
> Yes, can we *please* at least get the generic non-driver bits of this
> series moving - they seem uncontroversial as far as I can see and are a
> tiny portion of the overall 20 patches.  Patches 21-23 look like they
> can go on a branch in the net tree?

Patch 21 is the framer infrastructure.
Patches 22-25 are the driver for the PEF2256 framer.
Note that patch 24 is the pinmux part of the framer and, IHMO, can be
taken too.
Patch 23 need to be fixed (kernel test robot). The fix will be quite
minor (depends on HAS_IOMEM on the Kconfig file).

For the SoC part (QUICC ENGINE QMC and TSA), what will be the plan ? 
Qiang, Li, any opinion ?

I plan to send the v10 with the patch 23 fixed.
Based on that v10, some patches (21 to 25 at least) could be applied and
I will remove them for the future v11.
I think it will be easier to follow if I iterate on the series removing
patches as soon as they are applied.

Of course, please, let me know if this is not the right way to do.

Best regards,
Hervé
