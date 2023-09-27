Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A45547AFBFD
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 09:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A3C84B;
	Wed, 27 Sep 2023 09:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A3C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695799595;
	bh=s1bOiCnIyEHrsE6jKa/U3IZY/dZiZBgXVK3g5WhsznI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HEbSt/GX7n40tQMR8dqANYZZdmlSo953rZdv23/t+sLq4+2myydKvoP/DhBV47q5z
	 8TO9rp1YDJxdeMQVY6y6WiD+jRHbz7fMYHheonkhzSuS02kWR6nlOseG0GUXknsISK
	 9w33hVo/xqkJhqrPGmpS8QNKquwfkGwSb7TC1ci8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB0EF800AA; Wed, 27 Sep 2023 09:25:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0766F80166;
	Wed, 27 Sep 2023 09:25:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10592F8016A; Wed, 27 Sep 2023 09:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D65F0F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 09:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65F0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CUxDSg3d
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1DB71C0005;
	Wed, 27 Sep 2023 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695799465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7lheL/fPD30+qWF6kotkKYQgHBfzDpYHPBkU7rqwKc=;
	b=CUxDSg3duEvh2iFUudjI4nwvl79l+61/0VAmFQSu2LRxhgpcqiWvVArxluGLfvz8i5H50g
	/1E6SCgjLvpCudreDT7YjSUJNoddPGTSsaP4qgW8mWZk1r2YQFIKYrFJ/YEM0vSjcRIouF
	jAG7C/ETkfGIPjGdzUf59swSIoGJQUGcVuuayMkzk8au+5Sk7KAiVV36+GbS/U8eAaBUBo
	Pb/APoI1htl9U6jlR0NLt4TNlSJhGv0qMJmsS+9RrcsdPKtRdRr7gPHjPd+Eba7D0t9cHn
	BMVN9LDMWuIFiKvBLMP4Ihx4uyZvHi66OO4LFFFAfTsgo3N8lhrCfO7XudhEyQ==
Date: Wed, 27 Sep 2023 09:24:18 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230927092418.6a5326ce@bootlin.com>
In-Reply-To: <e8ee6529-b194-4588-96c0-1459f214d005@linaro.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-9-herve.codina@bootlin.com>
	<5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
	<20230925101703.1bf083f1@bootlin.com>
	<5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
	<20230925122758.43963736@bootlin.com>
	<e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
	<20230925154929.2b6a9cab@bootlin.com>
	<e8ee6529-b194-4588-96c0-1459f214d005@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: GUS6PXTH573AJOZ5PG32BBVZOBEK4SGP
X-Message-ID-Hash: GUS6PXTH573AJOZ5PG32BBVZOBEK4SGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUS6PXTH573AJOZ5PG32BBVZOBEK4SGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Tue, 26 Sep 2023 22:59:14 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 25/09/2023 15:50, Herve Codina wrote:
> >>>>> With these details, do you still think I need to change the child (channel)
> >>>>> compatible ?      
> >>>>
> >>>> From OS point of view, you have a driver binding to this child-level
> >>>> compatible. How do you enforce Linux driver binding based on parent
> >>>> compatible? I looked at your next patch and I did not see it.    
> >>>
> >>> We do not need to have the child driver binding based on parent.    
> >>
> >> Exactly, that's what I said.
> >>  
> >>> We have to ensure that the child handles a QMC channel and the parent provides
> >>> a QMC channel.
> >>>
> >>> A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
> >>> and a QMC channel driver (child) has to use the QMC API.    
> >>
> >> How does this solve my concerns? Sorry, I do not understand. Your driver
> >> is a platform driver and binds to the generic compatible. How do you
> >> solve regular compatibility issues (need for quirks) if parent
> >> compatible is not used?
> >>
> >> How does being QMC compliant affects driver binding and
> >> compatibility/quirks?
> >>
> >> We are back to my original question and I don't think you answered to
> >> any of the concerns.  
> > 
> > Well, to be sure that I understand correctly, do you mean that I should
> > provide a compatible for the child (HDLC) with something like this:
> > --- 8< ---
> >   compatible:
> >     items:
> >       - enum:
> >           - fsl,mpc885-qmc-hdlc
> >           - fsl,mpc866-qmc-hdlc
> >       - const: fsl,cpm1-qmc-hdlc
> >       - const: fsl,qmc-hdlc
> > --- 8< ---  
> 
> Yes, more or less, depending on actual compatibility and SoC-family.
> Maybe "fsl,cpm1-qmc-hdlc" item in the middle is not needed.

Ok,
I will keep "fsl,cpm1-qmc-hdlc". The CPM1 is the co-processor present in these
SoCs and it handles the QMC controller. So, it makes sense to have it in this
binding.

I plan to add support for other SoCs in the future and for these SoCs, the
co-processor is not the CPM1. So, it makes sense to keep "fsl,cpm1-qmc-hdlc"
to identify the co-processor.

> 
> > 
> > If so, I didn't do that because a QMC channel consumer (driver matching
> > fsl,qmc-hdlc) doesn't contains any SoC specific part.  
> 
> Just like hundreds of other drivers. :)
> 
> There is a paragraph about specific compatibles here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
> 
> 
> > It uses the channel as a communication channel to send/receive HDLC frames
> > to/from this communication channel.
> > All the specific SoC part is handled by the QMC controller (parent) itself and
> > not by any consumer (child).  
> 
> OK, so you guarantee in 100% for this hardware and all future (including
> designs unknown currently), that they will be 100% compatible with
> existing QMC channel consumer (child, matching fsl,qmc-hdlc) driver,
> thus there will be no need for any quirk. Specifically, there will be no
> chances that it would be reasonable to re-use the same driver for child
> (currently fsl,qmc-hdlc) in different parent.

Right,
compatible strings with SoC and co-processor will be added in the next iteration.

Thanks for your feedback.

Best regards,
Hervé

> 
> P.S. If you received this email twice, apologies, I have here troubles
> with internet.
> 
> Best regards,
> Krzysztof
> 
