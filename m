Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C97076B21B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656606C0;
	Tue,  1 Aug 2023 12:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656606C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690886704;
	bh=8X1IhBdHmOt2KLDApVFaghTRm8o0NX5o3XUVnKOkhmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ff2KPbbrv5znFQh0Nn2NVCC/A+jnvSheqB3W+lWkW80W52Mw/7MYSY/5jw8aBTME7
	 g+Ttc4R/TEkTMnbMly6U8LPGVrsw5RS4Z9+fG+0LDJOAD3FWVJM414v8ZtlydiZqBb
	 JUjDUVjTPvsGWBHB2QLfCD95x36DOCHDay/SNj9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B729FF80520; Tue,  1 Aug 2023 12:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEB7F8016D;
	Tue,  1 Aug 2023 12:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 010D1F801D5; Tue,  1 Aug 2023 12:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D0FEF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0FEF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZDFUSJCb
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC711C000B;
	Tue,  1 Aug 2023 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEKysH7Y2t6RfT3AfGBp54HWpVEF5LkKbUS/QMB1QqY=;
	b=ZDFUSJCbj6fA75RKgaU5KyPEubtFY3VzZOU8PdM1aCEbn6YSr+BqKTYpbhrc46wMcH0s0L
	xbOm3AV2jxN5pU9+f/y8A9D3ioPgJhEd+sVK5My40QUl79HhUIbpj8Z6FNyH6QoT4nLscV
	NdL3KC+I6mGLCCwmwgWymKieJnjUTwOHTLIXhRkwbL6P451XEVX4DF5rLwP5jH755aRr5A
	FyunbjnU1zJ4gkeAKrjHmbUWqnP/x6TUa+mZakYm+Nj1ODX7z5jLVFZXmNjXbfvfW8mk1Z
	CpC9vyGyEVAFqeoF0/BJLsYkRWxGBKUslX0/qHv6q48CI5T1qUFNPHFyVl0vlQ==
Date: Tue, 1 Aug 2023 12:44:01 +0200
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
Subject: Re: [PATCH v2 23/28] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <20230801124401.3883d16c@bootlin.com>
In-Reply-To: <4adae593-c428-4910-882e-7247727cf501@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-24-herve.codina@bootlin.com>
	<4adae593-c428-4910-882e-7247727cf501@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: LFRHVJESYX7VW6UEM54ISRUP3PILNYQ7
X-Message-ID-Hash: LFRHVJESYX7VW6UEM54ISRUP3PILNYQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFRHVJESYX7VW6UEM54ISRUP3PILNYQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 12:22:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline u8 pef2256_read8(struct pef2256 *pef2256, int offset)
> > +{
> > +	int val;
> > +
> > +	regmap_read(pef2256->regmap, offset, &val);
> > +	return val;
> > +}
> > +
> > +static inline void pef2256_write8(struct pef2256 *pef2256, int offset, u8 val)
> > +{
> > +	regmap_write(pef2256->regmap, offset, val);
> > +}  
> 
> More cases of inline functions in .C files. Please let the compiler
> decide.

Will be changed.

> 
> > +static void pef2256_isr_default_handler(struct pef2256 *pef2256, u8 nbr, u8 isr)
> > +{
> > +	dev_warn(pef2256->dev, "ISR%u: 0x%02x not handled\n", nbr, isr);
> > +}  
> 
> Should this be rate limited? It is going to be very noise if it gets
> called once per frame time.

This function should not be called.
It is wired on some interrupts and these interrupts should not be triggered.
It they fired, something was wrong.

I would prefer to keep this dev_warn() to keep the user informed about the
problem.

Regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
