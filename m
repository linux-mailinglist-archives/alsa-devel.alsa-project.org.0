Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF176B056
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE4914E;
	Tue,  1 Aug 2023 12:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE4914E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690884391;
	bh=CjoZN+7tVqH1PfvdhR88wQfRIVl7/xTyB8H+85exrAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iIm7NyW3Fl7d06xIhfGI49Xh2vpn4hquBPBAbVzbNrsMBJcat5NRLKdfZ92Gk8OQ/
	 v3dJdY297XniqQw4h7JQLUL75g4RX1mHTqEaZU7t9bJ6IS0/xVMmP5MKLRC0NhILd+
	 rdy1ftH2tAQy8ALJqHA51UNESjyaG7AgXaggNSts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A0E9F8053B; Tue,  1 Aug 2023 12:05:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFECF8016D;
	Tue,  1 Aug 2023 12:05:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA23DF801D5; Tue,  1 Aug 2023 12:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7507BF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7507BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H3+g77sX
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DE551C0012;
	Tue,  1 Aug 2023 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690884315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSVB+HORSFsnXDmjVg67aSWP2rANROm59byfAHhHD0Y=;
	b=H3+g77sXqmhMiUD9cLYfYWHOIVyYaAAYK3S6orraq++QkO4KEPeDisG+ZrlTgTA5FpWvKu
	69gaGhOPX+b8Lggqcv5DbCT0WtLbny4lOhHNeGu2Ndjj3nIYbC3SzM5ixLuleezrP3/GYL
	5wvk9vgnF24HM+baeEJ3BmpWjahI4i5fge3JTVMe9EmMLUTtwb/ZAliplzCM5qZU13rsEO
	7vUl/ArcrY7p6p8npXU92BVujGKBPxxWvqIuZHuk99NXtqsfCLiewRCtG+M4ycbXPoFd5/
	22qw57nzEewvcaWgfHT2vgGimy6CmMvgiMnA62C50o4su4myL978d2bjQcLMjQ==
Date: Tue, 1 Aug 2023 12:05:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 08/28] soc: fsl: cpm1: qmc: Introduce available
 timeslots masks
Message-ID: <20230801120510.1ac862de@bootlin.com>
In-Reply-To: <dd34fa03-0b34-44a4-9e70-9d9a69f95403@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-9-herve.codina@bootlin.com>
	<dd34fa03-0b34-44a4-9e70-9d9a69f95403@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: YHIXNM5WJYW5KBC5ELQXGGUXOP2OOKHI
X-Message-ID-Hash: YHIXNM5WJYW5KBC5ELQXGGUXOP2OOKHI
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHIXNM5WJYW5KBC5ELQXGGUXOP2OOKHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 11:33:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Jul 26, 2023 at 05:02:04PM +0200, Herve Codina wrote:
> > Available timeslots masks define timeslots available for the related
> > channel. These timeslots are defined by the QMC binding.
> > 
> > Timeslots used are initialized to available timeslots but can be a
> > subset of available timeslots.
> > This prepares the dynamic timeslots management (ie. changing timeslots
> > at runtime).
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/soc/fsl/qe/qmc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> > index 2d2a9d88ba6c..21ad7e79e7bd 100644
> > --- a/drivers/soc/fsl/qe/qmc.c
> > +++ b/drivers/soc/fsl/qe/qmc.c
> > @@ -177,7 +177,9 @@ struct qmc_chan {
> >  	struct qmc *qmc;
> >  	void __iomem *s_param;
> >  	enum qmc_mode mode;
> > +	u64	tx_ts_mask_avail;
> >  	u64	tx_ts_mask;
> > +	u64	rx_ts_mask_avail;
> >  	u64	rx_ts_mask;  
> 
> Is this for E1? So there is a maximum of 32 slots? A u32 would be
> sufficient i think?
> 

The QMC can use up to 64 slots. So masks related to the QMC are on 64bits.
These masks are not specific to the E1 framer but really related to the QMC
capabilities.

Regards,
Hervé
