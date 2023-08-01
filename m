Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AE76B2D3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 13:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAC9843;
	Tue,  1 Aug 2023 13:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAC9843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690888455;
	bh=QXkC/QZ+MsDhBnKnOgcZ25fX4ivId3Q3mXG4q9a8T7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kanYvPecQSyvUWSL4E6vOY5ZSajlANKdkN27nchNay8RODUuj1LwD6HIKwwEWdS7d
	 okyM9J9R5MP3E6R24+l444z2arq9OCASBM+q9Qma/sLSyacwDMMNM3AVLXyaH5njdB
	 cCrEZcYLLTxDcDyOiqhtwbxpN3ZCfLQbaSt27/8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A49AAF80553; Tue,  1 Aug 2023 13:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 434B9F80553;
	Tue,  1 Aug 2023 13:12:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6E2AF80558; Tue,  1 Aug 2023 13:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E881F80548
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 13:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E881F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YeU1uU9D
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB788FF802;
	Tue,  1 Aug 2023 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690888365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9XcoEVaGb/SzYJ6mJdNzeh0I7lywmTLcinYtPtZJ0c=;
	b=YeU1uU9DZXfTdXg8TFeI2o8Vqm7D8c1Fnm2DfojyufbZMvZGwcPjdBxRDg8U36hs3GEZNV
	RfioyzIjkZexR02ZLxdAkOfjwbF1bhjx0ieuUzu/mAHaPNwJQsd0PS6Wnw6126hLkLetZ5
	Jje7zJ+VKap558GZ+oGgWv5oJscKoNwWOHSOTKJU+P4lyu+Gu5z5Nt6HjN3O7V25JsDewD
	ggblvVDvfqULX9YEURYbqlRVqkpWoTW7Z8jtWNqqW9U1XTZzNG+09ROmeraVwAd5Qf+Hqg
	+i4317dj/J6MOo8/Sais9wdrdmM/YCAHzsMdFKTCOSORGRoquZoMA+03nt5CQQ==
Date: Tue, 1 Aug 2023 13:12:35 +0200
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
Message-ID: <20230801131235.10ad334a@bootlin.com>
In-Reply-To: <c27fa438-0885-4e02-a957-ee40b8ef6da1@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-24-herve.codina@bootlin.com>
	<4adae593-c428-4910-882e-7247727cf501@lunn.ch>
	<20230801124401.3883d16c@bootlin.com>
	<c27fa438-0885-4e02-a957-ee40b8ef6da1@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: JLG5TLIZPPM4M4FEBMNGPEMVG4ERHPLC
X-Message-ID-Hash: JLG5TLIZPPM4M4FEBMNGPEMVG4ERHPLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLG5TLIZPPM4M4FEBMNGPEMVG4ERHPLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 12:52:29 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > > > +static void pef2256_isr_default_handler(struct pef2256 *pef2256, u8 nbr, u8 isr)
> > > > +{
> > > > +	dev_warn(pef2256->dev, "ISR%u: 0x%02x not handled\n", nbr, isr);
> > > > +}    
> > > 
> > > Should this be rate limited? It is going to be very noise if it gets
> > > called once per frame time.  
> > 
> > This function should not be called.
> > It is wired on some interrupts and these interrupts should not be triggered.
> > It they fired, something was wrong.
> > 
> > I would prefer to keep this dev_warn() to keep the user informed about the
> > problem.  
> 
> I would definitely keep it, but rate limit it. dev_warn_ratelimited().
> 
> 	Andrew

Ok, will be changed to dev_warn_ratelimited().

Hervé
