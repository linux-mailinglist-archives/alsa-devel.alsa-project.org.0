Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2376B201
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346EF7F8;
	Tue,  1 Aug 2023 12:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346EF7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690886193;
	bh=2J8qj07PsH6/fhghr/Ils/YRhqI7VzCDTj6pXTQu0HU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kIebAYn202DAdjzjR1SHhGrb/Yma3YWNss0dtBc3nS2+uS7OvDjqNMnbjmV1vYAxj
	 Gsqi1EFZu0OwB39lu17qQ/WY1aOtey2IPpytwd3pEeafRm+ADPCOOad7wkkJghxpxQ
	 YRFpQqgwPYGiACcYinuGbr20OOLQiHX6tvy6Z0/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF099F80087; Tue,  1 Aug 2023 12:35:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4153EF801D5;
	Tue,  1 Aug 2023 12:35:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BC83F80558; Tue,  1 Aug 2023 12:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B63EF80549
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B63EF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HuQzMwky
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8CDE0003;
	Tue,  1 Aug 2023 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SvrVZjf5OnwSU9GuipBXCgEg/NuLuQSUax9kncJoss=;
	b=HuQzMwkymqd89YQoEOX2hMmEco1BS/rW1obWm9cNvo095SSLNpGDkjCz4UJ3BLDfoE9k4R
	zp6KVAzYGP/2qHBCb4o10LhoepouFfTms8w662mMV28RDhnCwvJmkHWYJ9BenFcSakmPvx
	FIb1TDkkeh6zFUNFCbsBC0CtVvmjR4CV9TWZG0vX63qv7Ohi+d/V747j0aBktlrPD1SEOh
	UNofMfWXUwklIq9B+lA9UP0VitUrBr6kYB1ARn1gptVhxnGSAoqPaz+5E2ELot8RfdcQ5/
	wnDuKt6RwwmpUwi1m19cZlmAcWrcpgYWun/8LKtFIdE4GE6cXVlVpF3MRMr2wg==
Date: Tue, 1 Aug 2023 12:35:30 +0200
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
Subject: Re: [PATCH v2 21/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230801123530.3f92f5da@bootlin.com>
In-Reply-To: <1f5fbf0a-90fe-491a-91c6-31fefd4b786f@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-22-herve.codina@bootlin.com>
	<1f5fbf0a-90fe-491a-91c6-31fefd4b786f@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: KR44N6UAY6BKZHOEAVLWRKBFLAMOBB5J
X-Message-ID-Hash: KR44N6UAY6BKZHOEAVLWRKBFLAMOBB5J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KR44N6UAY6BKZHOEAVLWRKBFLAMOBB5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 12:05:07 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +  clocks:
> > +    items:
> > +      - description: Master clock
> > +      - description: Receive System Clock
> > +      - description: Transmit System Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mclk
> > +      - const: sclkr
> > +      - const: sclkx  
> 
> Nit pick, but "Receive System Clock", but "sclkr'. Maybe "System Clock
> Receive" so you have the same word order?
> 

Will also change the 'Transmit System Clock' to 'System Clock Transmit'

Regards,
Hervé



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
