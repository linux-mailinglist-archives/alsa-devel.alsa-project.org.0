Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F2737CB2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 10:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0461F9;
	Wed, 21 Jun 2023 10:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0461F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687334845;
	bh=+rMF4a1573ZcN2umVIh7WjTdih5F6B4JvLwF95BLUkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q94BFLk4jrmFwUb+KiTU85mqqsJdcXCZmeIqYA1xF80FIPxFxTRvWY7KDH2u8dq95
	 /cYok+1Qr10YjX0KBbv6tM2rvZPoQUQidHnO3adxVjQSL+SRC76+TE33l34cpn8QOc
	 8O8l1/slhl2bgZKIv+yWQF359BpuIz4nMFy8o92s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1242AF80535; Wed, 21 Jun 2023 10:06:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D37A2F80132;
	Wed, 21 Jun 2023 10:06:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE6CFF80124; Wed, 21 Jun 2023 10:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB026F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 10:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB026F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SgudXOqm
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687334783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYtqxR//h5o3fcMngi/YGGEQl12cFL95TkWLUIHTxSw=;
	b=SgudXOqmAUvHeu4Jo3eLRfZ1fN2zhpb2s2JmooflnVq4jwsIFIoXRIaxuN23vxaILTt3Do
	CGki7lB5WuwItvsGgzokEFaiwHTF1MFaHNEbJ5Rj2SCmtGrW41IBSmy8EL8EOKI4fUsu64
	JUzZxmEFw6a5mediCQXKrRThbcQExL5Qgj+Wu5YzVbkZ/9e9W9zMG5trHILycqU8NZvOc3
	Ig14PDS7aCqu6HKYRJ7HkLg4q1vsGAFTmKKbNN1x3wwO5toJi72p8psxqHtpAb0tpReRlZ
	bnLJA0nAyGADD0pCG5WmgyNReUWUcMCVwat4VJ99IenkWCevR6MhQTnStmjGyQ==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9ED9D6000A;
	Wed, 21 Jun 2023 08:06:21 +0000 (UTC)
Date: Wed, 21 Jun 2023 10:06:20 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 02/13] ASoC: dt-bindings: simple-card: Add
 additional-devs subnode
Message-ID: <20230621100620.0666ae29@bootlin.com>
In-Reply-To: <20230620164521.GA3789188-robh@kernel.org>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-3-herve.codina@bootlin.com>
	<20230620164521.GA3789188-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 57U4O2WDRR5VE3VKYSR3SXZOD5NTC5NJ
X-Message-ID-Hash: 57U4O2WDRR5VE3VKYSR3SXZOD5NTC5NJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57U4O2WDRR5VE3VKYSR3SXZOD5NTC5NJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On Tue, 20 Jun 2023 10:45:21 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, Jun 15, 2023 at 05:26:20PM +0200, Herve Codina wrote:
> > The additional-devs subnode allows to declared some virtual devices
> > as sound card children.
> > These virtual devices can then be used by the sound card and so be
> > present in the audio path.
> > 
> > The first virtual device supported is the audio IIO auxiliary device
> > in order to support an IIO device as an audio auxiliary device.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/simple-card.yaml           | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> > index b05e05c81cc4..59ac2d1d1ccf 100644
> > --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> > @@ -148,6 +148,15 @@ definitions:
> >      required:
> >        - sound-dai
> >  
> > +  additional-devs:
> > +    type: object
> > +    description:
> > +      Additional devices used by the simple audio card.
> > +    patternProperties:
> > +      '^iio-aux(-.+)?$':
> > +        type: object
> > +        $ref: audio-iio-aux.yaml#
> > +
> >  properties:
> >    compatible:
> >      contains:
> > @@ -187,6 +196,8 @@ properties:
> >      $ref: "#/definitions/mclk-fs"
> >    simple-audio-card,aux-devs:
> >      $ref: "#/definitions/aux-devs"
> > +  simple-audio-card,additional-devs:
> > +    $ref: "#/definitions/additional-devs"  
> 
> Why do you need this under the card node? Can't you just use the 
> existing aux-devs?

aux-devs is a phandle array referencing auxiliary devices.
I cannot define a node with just aux-devs, just reference.

I need device auxiliary devices that are not defined somewhere else in
the DT.

A SPI amplifier is defined as a subnode of a SPI controler.
But my IIO/ASoC virtual devices are not defined under some hardware bus.
I need to define them here, as a simple-audio-card subnode.

Several subnodes are already defined for a simple-audio-card subnode for
other purpose.

Instead of having virtual device nodes directly as chidren mixed with the
other purpose nodes of the simple-audio-card, I group them under the
additional-devs node in order to ease evolution and maintenance.

Best regards,
Hervé

> 
> >    simple-audio-card,convert-rate:
> >      $ref: "#/definitions/convert-rate"
> >    simple-audio-card,convert-channels:
> > @@ -359,6 +370,48 @@ examples:
> >          };
> >      };
> >  
> > +# --------------------
> > +# route audio to/from a codec through an amplifier
> > +# designed with a potentiometer driven by IIO:
> > +# --------------------
> > +  - |
> > +    sound {
> > +        compatible = "simple-audio-card";
> > +
> > +        simple-audio-card,aux-devs = <&amp_in>, <&amp_out>;
> > +        simple-audio-card,routing =
> > +            "CODEC LEFTIN", "AMP_IN LEFT OUT",
> > +            "CODEC RIGHTIN", "AMP_IN RIGHT OUT",
> > +            "AMP_OUT LEFT IN", "CODEC LEFTOUT",
> > +            "AMP_OUT RIGHT IN", "CODEC RIGHTOUT";
> > +
> > +        simple-audio-card,additional-devs {
> > +            amp_out: iio-aux-out {
> > +                compatible = "audio-iio-aux";
> > +                io-channels = <&pot_out 0>, <&pot_out 1>;
> > +                io-channel-names = "LEFT", "RIGHT";
> > +                snd-control-invert-range = <1 1>;
> > +                sound-name-prefix = "AMP_OUT";
> > +            };
> > +
> > +            amp_in: iio_aux-in {
> > +                compatible = "audio-iio-aux";
> > +                io-channels = <&pot_in 0>, <&pot_in 1>;
> > +                io-channel-names = "LEFT", "RIGHT";
> > +                sound-name-prefix = "AMP_IN";
> > +            };
> > +        };
> > +
> > +        simple-audio-card,cpu {
> > +            sound-dai = <&cpu>;
> > +        };
> > +
> > +        simple-audio-card,codec {
> > +            sound-dai = <&codec>;
> > +            clocks = <&clocks>;
> > +        };
> > +    };
> > +
> >  # --------------------
> >  # Sampling Rate Conversion
> >  # --------------------
> > -- 
> > 2.40.1
> >   



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
