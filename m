Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6825A78755F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 18:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFC683E;
	Thu, 24 Aug 2023 18:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFC683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692894566;
	bh=wvR208fYQWQaQC3YEMZE+hXoeOqYacAkDmLikKDAAsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rOfdd/ik6CvCUuKQSUHTu5ePWFXb1SoWYECYPPYxWryIvEmfmMQmX3o3doDBU0tmb
	 hzU9fiw54+RVr3yMsS5Vbg6BLFssn3/Q9awYvn6wMKtEjVQr+idawHwBC2rpfI1NKD
	 zNgIiSg9uqTcX6+LsYt3IKxjAKgPHQhaKT9fgoAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 377A6F804DA; Thu, 24 Aug 2023 18:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4926F800F5;
	Thu, 24 Aug 2023 18:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 878E5F80158; Thu, 24 Aug 2023 18:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66781F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 18:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66781F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQiusfd0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9087D1C0004;
	Thu, 24 Aug 2023 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692894496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vlV24O5RSLn9le+rax+GkVBvAuRn488qRP2ADPCZKQ=;
	b=hQiusfd0FQuOVDUCU52tli4u035fc/XjK+mJGsdYMY9Cc3jlsA7j174kFQm83u8uLS5LVi
	R7rizQ427/PCiDxMGgmb0iBT+lg/nBzDrjL03AwM7yqDCH+8J6Xti7h9QC7C1DCftFq+ri
	8stj0LwVZ80zdVKPSbG4wPO4NVB9ezkC+sAlBD5qiMpyGz5nRPAfNO/mO0fBPb1Yo15VfX
	F30PM50FnMGe+GtDc9KNirwD6IlaXFWYp4gX1Bd4hZpqpMGgR6w5QRnjELrFg4jeKKEAar
	4fgQJ8axYCldIIsn9lZN0tvBAMnVq+qlp6kPjF8rY3LGLhynkVas5PMk9I4e7A==
Date: Thu, 24 Aug 2023 18:28:11 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li
 Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas
 .petazzoni@bootlin.com>
Subject: Re: [PATCH v4 22/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230824182811.1f8eb0a2@bootlin.com>
In-Reply-To: <20230821204929.GA2261144-robh@kernel.org>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<7c67d590b13a889466f53edf94192bca3bf6ceec.1692376361.git.christophe.leroy@csgroup.eu>
	<20230821204929.GA2261144-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: LFHWIAFXVJKPECDMY3B6W6VPZD7L7OE7
X-Message-ID-Hash: LFHWIAFXVJKPECDMY3B6W6VPZD7L7OE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFHWIAFXVJKPECDMY3B6W6VPZD7L7OE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On Mon, 21 Aug 2023 15:49:29 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Aug 18, 2023 at 06:39:16PM +0200, Christophe Leroy wrote:
> > From: Herve Codina <herve.codina@bootlin.com>
> > 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../bindings/net/lantiq,pef2256.yaml          | 219 ++++++++++++++++++
> >  1 file changed, 219 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
...
> > +  '#framer-cells':  
> 
> Not a standard binding. Do you need provider specific variable number of 
> cells?

For the PEF2256, I don't need it.
It will be removed in the next iteration.

> 
> > +    const: 0
> > +
...

> > +  lantiq,channel-phase:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +    default: 0
> > +    description:  
> 
> Need '|' to preserve formatting

Will be fixed in the next iteration.

Best regards,
Hervé
