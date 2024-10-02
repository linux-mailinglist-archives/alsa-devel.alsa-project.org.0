Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE098CD79
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 08:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A06084D;
	Wed,  2 Oct 2024 08:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A06084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727852211;
	bh=1x8FsTYKTElgsro6hjXvj/EoIu+83Ck3wv1piHuIC9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JG9BEph8lsCs7CDxoL4uz+ILmg0uGomAxePKl2J1LCKbfvWc+HpvpihJP4d01wGzP
	 IG8yn7u1xit16RDnuy6ln+Mi/NoMWcWTWWABdv8DFrKnB8iX5GBXz4NPzn9e3amIwE
	 iixof8sy7ALczfaJSH1umndJCZci9wW+pt72FhPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AAF5F805B6; Wed,  2 Oct 2024 08:56:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F7AF805B0;
	Wed,  2 Oct 2024 08:56:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 131D2F80517; Wed,  2 Oct 2024 08:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB568F8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 08:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB568F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OPooQOpK
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5141120002;
	Wed,  2 Oct 2024 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727852167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHrsnih06kMmn0kAxCYeMqMQc7boKhbn730umSdHFlY=;
	b=OPooQOpKYrL9KBqvrSgkCbk52UkG1+O8zOtQ+3tYXfY9H3R+7i69jE+OGeWcHDYAycOPwS
	JcPV1gSkC3Tj4n85gWBX4Pj8aYCq0+oNEkyggb9IQydRDvf8mXuI7UeGuyxyoLFWGOG77w
	iAIZV0lx45aAabcYA1mkuzXUS2XUdQ+T0m1NfM888QPBVJ3LJfFvNbrF6CUYKqa3nLofmZ
	fufOhNgx9/5vq7TqH/YaOmraHM6NYuoG6p1qu+VXkSKf1TYOiIEiVdKuqpujKDnE5DZy+z
	OMZBgRzHzA3LZv3NFuG+O7DD5MDy8dOCE++H+GrBIUIGT4wFnyrjkuH4lbrb3g==
Date: Wed, 2 Oct 2024 08:56:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241002085604.277d5006@xps-13>
In-Reply-To: <7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: JWNRDZXY5ZIDCU7YESDUNRYLOHR7LUGV
X-Message-ID-Hash: JWNRDZXY5ZIDCU7YESDUNRYLOHR7LUGV
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWNRDZXY5ZIDCU7YESDUNRYLOHR7LUGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

krzk@kernel.org wrote on Wed, 2 Oct 2024 08:34:44 +0200:

> On Tue, Oct 01, 2024 at 10:47:49PM +0200, Miquel Raynal wrote:
> > My understanding of the interrupts property is that it can either be:
> > 1/ - TX
> > 2/ - TX
> >    - RX
> > 3/ - Common/combined.
> >=20
> > There are very little chances that either:
> >    - TX
> >    - Common/combined
> > or even
> >    - TX
> >    - RX
> >    - Common/combined
> > could be a thing.
> >=20
> > Looking at the interrupt-names definition (which uses oneOf instead of
> > anyOf), it makes indeed little sense to use anyOf in the interrupts
> > definition. I believe this is just a mistake, hence let's fix it.
> >=20
> > Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP b=
indings to yaml schema")
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> > ---
> >  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audi=
o.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > index 7735e08d35ba..ab3206ffa4af 100644
> > --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > @@ -102,7 +102,7 @@ properties:
> >      default: 2
> > =20
> >    interrupts:
> > -    anyOf:
> > +    oneOf: =20
>=20
>=20
> You need to change interrupt-names as well.

interrupt-names is already using 'oneOf'!

The extended diff looks like that:

   interrupts:
-    anyOf:
+    oneOf:
       - minItems: 1
         items:
           - description: TX interrupt
           - description: RX interrupt
       - items:
           - description: common/combined interrupt
=20
   interrupt-names:
     oneOf:
       - minItems: 1
         items:
           - const: tx
           - const: rx
       - const: common

Thanks,
Miqu=C3=A8l
