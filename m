Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAE77E59F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 17:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564E574C;
	Wed, 16 Aug 2023 17:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564E574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201065;
	bh=iFQC4hc2PQsLEl5yJ4fOGHLJFWJL/+J7j0wLGTVqGPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kK/PbXFC77AAVy1C/1shDq3ax6C/FnMH16vdc6O2p0TZWbTah98f495YMhRnpH8Bk
	 9NoWDtH2fFa8wT5NBuW4OeHY39PVvLn0dJFsncw4PKH+h6n9xytGDYOan75kDcsofg
	 h0DvLoSBB1RWZOM1nsxuN9qoSQXreW3PngzMsSxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E80FF8016D; Wed, 16 Aug 2023 17:50:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A52F8016A;
	Wed, 16 Aug 2023 17:50:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1030CF8016D; Wed, 16 Aug 2023 17:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E452F800EE
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 17:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E452F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aTA9l5F6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88A01E0008;
	Wed, 16 Aug 2023 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692201004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7qqsraPhv0yClgxA/hyk25/qkMt80mxh+Qel/Qxjxk=;
	b=aTA9l5F6XqBRUIBDAk06nQK/nIEigxkLt66oO1lwGxbsCjnlCIksXy66MYVGgyPuPhY0NJ
	vcgwSZPKuyDa3dpID6QwUfiGt+IN8msV8YcunSM7kYtF1MGNuhN3WTTVxkX+EPgysd5VQG
	Y1STGp7KLgLqOUDDP+50lCSdlCa8KUV9rkbZbfyStWE5OcI3ADLgii1Ip6/MvbsBxhQlDj
	6u2BmR71zqZy9okYfyhuIL6jZaEld4kQiGU7rMUIwVCh7I2/PYqV1NMKGK610szgjiBcZk
	w7ZnmE8N4F7hjEK/ew8ZCi5q3X25mzwLmN2yTK1pO+C2UzINVFe4WGbLTiP2Kg==
Date: Wed, 16 Aug 2023 17:49:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang
 <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 22/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230816174847.4709a428@bootlin.com>
In-Reply-To: 
 <CACRpkdZWHw7sL6EKe0EP0hX5TEsdhzgkPSdVtPPYhS3LqJRHFg@mail.gmail.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
	<20230809132757.2470544-23-herve.codina@bootlin.com>
	<CACRpkdZWHw7sL6EKe0EP0hX5TEsdhzgkPSdVtPPYhS3LqJRHFg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: RJFLGAGFGTCVOVTJUJXV3HS6MOAZFOYA
X-Message-ID-Hash: RJFLGAGFGTCVOVTJUJXV3HS6MOAZFOYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJFLGAGFGTCVOVTJUJXV3HS6MOAZFOYA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Linus,

On Thu, 10 Aug 2023 10:53:04 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Herve,
> 
> thanks for your patch!
> 
> On Wed, Aug 9, 2023 at 3:28 PM Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> (...)
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml#  
> 
> Shouldn't that be pinmux-node.yaml?
> 

Indeed, it should be pinmux-node.yaml.
This will be fixed in the next iteration.

Best regards,
Hervé
