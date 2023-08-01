Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F576B1B0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACBB5820;
	Tue,  1 Aug 2023 12:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACBB5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690885501;
	bh=elGQDRPvo91fNMLivN/S4uF0gEM4bek8E7G7tKjqRh0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hwg2UR/XYBvXgm5GhxmgxRCqwFd47fgXeLNzsse+dXM5rxGNDqvtADevLL82mGsLC
	 e6lBv6q9JwxwKbvSmpbpRfVCNYkSv5HMGzCrcS7f1p+O6Al35abjijjg215/bE3BpC
	 YvDOq4Z/cCUsKVS4CdxInHbX0qvdkXJrIR6I/Qbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D6EDF8016D; Tue,  1 Aug 2023 12:24:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D7CF8016D;
	Tue,  1 Aug 2023 12:24:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1F9F801D5; Tue,  1 Aug 2023 12:24:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 777A9F8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777A9F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f9mqi/1O
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C9AFC0003;
	Tue,  1 Aug 2023 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690885443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh049SisoIWliG3uyLlXHzxD5wRc/J6bqr8r19ynpGo=;
	b=f9mqi/1Oxj+4XOaIlU22+7chRim64bLbHC89dhnq9NrYZHmPLGlNes8J8KY24lP6ZgYAlD
	eD6x5iT8jEr2zsXSVJJPvtYx5/BCSTIVTF4upPsbtDnfanTrKZzsr/NZcmTGpMMRPsbiwu
	MfI8n7wdawYwlc8X3XOv1bqEp5cuwBk81jBVGgET6qkiT/ubH6LAoCaSPNevEy1yMF9GlQ
	BgQ3xYH3kfMmnr/GZ5pgzGZmS4ZwoDWBx5Za0/Ne59WHOdLeHgCl4tpOQtBywFMYlG7Rki
	nuJbeHCb5FilfHYhV0dpg93ttgFZRXaEugYAZsyN24ghg5tiOBCl9ltTL4+hNA==
Date: Tue, 1 Aug 2023 12:23:59 +0200
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
Subject: Re: [PATCH v2 10/28] soc: fsl: cpm1: qmc: Introduce
 qmc_chan_setup_tsa*
Message-ID: <20230801122359.6b22784c@bootlin.com>
In-Reply-To: <252d6a49-4a97-4ecc-844e-f23bda55debf@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-11-herve.codina@bootlin.com>
	<252d6a49-4a97-4ecc-844e-f23bda55debf@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: WQWD7OQ7BINNOKWW4FWRG63LKDXHOKEA
X-Message-ID-Hash: WQWD7OQ7BINNOKWW4FWRG63LKDXHOKEA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQWD7OQ7BINNOKWW4FWRG63LKDXHOKEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 11:36:43 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline void qmc_clrsetbits16(void __iomem *addr, u16 clr, u16 set)
> > +{
> > +	qmc_write16(addr, (qmc_read16(addr) & ~clr) | set);
> > +}
> > +  
> 
> Please don't use inline in .c files. Let the compiler decide.
> 
>        Andrew

Ok, I will remove the inline in the next iteration.
I will also remove the inline of all other similar functions (probably a
separate patch in the series).

Regards,
Hervé
