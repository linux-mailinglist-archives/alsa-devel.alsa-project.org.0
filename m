Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF75765156
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 12:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0165843;
	Thu, 27 Jul 2023 12:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0165843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690454170;
	bh=mettczvUVkzK9weLGpkc85RbXhusHIFU2k3HfNeKDqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NxfNG5ETi8OLyeEO9Me9ybXX937BA1x3ek+CeIeozAIiCADtoGvvF5pH6znDOhAGU
	 wjhitxSLkjEg1UOfOjUi+EstKBb5yPtvphBwRhC1+EOqe5YwdHBSfpHKwkdrBcvHK4
	 eWFdLX4higdcQIgXgEWomL+8p0zP7RLsjUPLxQes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D38F800D2; Thu, 27 Jul 2023 12:35:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 980F7F80163;
	Thu, 27 Jul 2023 12:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BC1CF8019B; Thu, 27 Jul 2023 12:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98D2FF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 12:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D2FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D7sErss6
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBAA01BF207;
	Thu, 27 Jul 2023 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690454095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49SapdFsUUzXkb0zmYsMHZkg7CHiz7VOLc7j0san1b4=;
	b=D7sErss6g6hwoemn0ONI4uqJb+K/IsweOTLB1naVOQSB0jnxItj4HIIYOc01Bt1PCbQWls
	x2lcEAR9Bd9VjcK6MIkZw2GgBXiwTdL0BWCBkLp6FGIk8zL9HeoByCjQcU71EgLZvHIX9c
	ENATbxHfRlfF0SU97Zp8/habefY7ZArdGsISAkXbKwdQKnHTa46Poh7Izti1MQgJHfgtY+
	+trXOG76m0g/9BUX139rvy1EaJBvWlTKa0L2vTIHxz+5+JsANW+49ziW/vf766xYPBj86D
	/xe6CDk60hgIFLNs0LFEukyLTaCTJBZRtsZB+11cVUQUOpWASao2sGMwjhfrJQ==
Date: Thu, 27 Jul 2023 12:34:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
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
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727123449.0ab1c58e@bootlin.com>
In-Reply-To: <20230727-decidable-sterile-06ef617c144b@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-6-herve.codina@bootlin.com>
	<20230727-talcum-backside-5bdbe2171fb6@spud>
	<20230727110948.7926a532@bootlin.com>
	<20230727-decidable-sterile-06ef617c144b@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZD2RMBWWHEE53JCVTISRS363PGI6JZD6
X-Message-ID-Hash: ZD2RMBWWHEE53JCVTISRS363PGI6JZD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZD2RMBWWHEE53JCVTISRS363PGI6JZD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Conor,

On Thu, 27 Jul 2023 10:53:15 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Jul 27, 2023 at 11:09:48AM +0200, Herve Codina wrote:
> > On Thu, 27 Jul 2023 09:19:59 +0100
> > Conor Dooley <conor@kernel.org> wrote:  
> > > On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:  
> 
> > If needed, I can change to:
> >   title: QMC (QUICC Multichannel Controller) HDLC
> > Let me known if it is better to you.  
> 
> If it were me writing the binding, I'd probably use something like
> "Freescale/NXP QUICC Multichannel Controller (QMC) HDLC", but it is not
> a big deal, I just had a "wtf is this" moment :)

I will change to "Freescale/NXP QUICC Multichannel Controller (QMC) HDLC" in
the next iteration.

> 
> 
> 
> > > > +  fsl,qmc-chan:  
> > > 
> > > Perhaps I am just showing my lack of knowledge in this area, but what is
> > > fsl specific about wanting a reference to the channel of a "QMC"?
> > > Is this something that hardware from other manufacturers would not also
> > > want to do?  
> > 
> > The QMC and the QMC channel are something specific to the SoC. This IP is only
> > available on some Freescale/NXP SoCs.
> > 
> > When I upstreamed the 'fsl,qmc-audio.yaml', I first used a generic name for this
> > property and Kristoff asked to change to a vendor prefixed name.
> >   https://lore.kernel.org/linux-kernel/1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org/
> > 
> > Based on this, as the property 'fsl,qmc-chan' has the exact same meaning in
> > fsl,qmc-audio.yaml and fsl,qmc-hdlc.yaml, I use the same name.  
> 
> Okay, thanks for explaining!

You're welcome.

Regards,
Hervé

