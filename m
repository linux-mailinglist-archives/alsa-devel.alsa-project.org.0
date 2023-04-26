Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147816EEF60
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 09:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED0A1013;
	Wed, 26 Apr 2023 09:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED0A1013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682494656;
	bh=YKuz+50qo6Px8bpkUtj8B3kH36FZNPzzJIQrqmLsZN4=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Be2iwj9/PvSD6qhGwVqMzakcQXFwsk+6/bSxZs3ZoXobq770DhIUoDlgZV4NCwYkF
	 MuIRnlD7qo0Fub2q6OuxKt2FqRLwu2wziA1RQ7pcUDrA1SUIm37mOxpeqo3d9DHvGK
	 nb25nHuglKfV0dnnriGZoSBEw+vXYU6dIgBf7xJ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46463F80104;
	Wed, 26 Apr 2023 09:36:45 +0200 (CEST)
Date: Wed, 26 Apr 2023 09:36:21 +0200
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: sound: Add simple-iio-aux
In-Reply-To: <20230425173029.GA1967523-robh@kernel.org>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-2-herve.codina@bootlin.com>
	<20230425173029.GA1967523-robh@kernel.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4KVXVL7OCT2CK4ODANS4MLMIYJLRT6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168249460386.26.4272351947717500662@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 072AAF80236; Wed, 26 Apr 2023 09:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5714FF80104
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 09:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5714FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EUGQvUSl
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96D464001B;
	Wed, 26 Apr 2023 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682494584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GR1E+pbhNEg6zfN0rOacaHcUiyS6/XYLZ7Q4bCGZDj8=;
	b=EUGQvUSlAnbZSP6ryVpH8/2rJsl/W56VfEzXMyqHIHIbfZuMmz1mQv2BNAjmrthj9ayJ1d
	DmnUMcyyGEWQtZ8vCEeTZx4Bozgby+nB0czAGSnfUffBco+kJuo7mlzn/4j0vtOrgaJ8sC
	DdWVOAkN0oqwTxLir/wLahQfcDuDoN2GjyMbVjonptvFS8ESULH8/YUEK8jGViAGX5juVk
	3NbkaTEELOefM1HrP4cnQIRiQgZPqrxLcPFSjR0ElI/ZqK+RBZda79K8fHYYkJTAHYpz3P
	3DmjDe2TcUa7MVg95Qnbx2TpMeUuehG7c3LR31Z9pbxIdepiUVRgV96MRcSbWw==
Date: Wed, 26 Apr 2023 09:36:21 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: sound: Add simple-iio-aux
Message-ID: <20230426093621.3834e703@bootlin.com>
In-Reply-To: <20230425173029.GA1967523-robh@kernel.org>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-2-herve.codina@bootlin.com>
	<20230425173029.GA1967523-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N4KVXVL7OCT2CK4ODANS4MLMIYJLRT6L
X-Message-ID-Hash: N4KVXVL7OCT2CK4ODANS4MLMIYJLRT6L
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4KVXVL7OCT2CK4ODANS4MLMIYJLRT6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On Tue, 25 Apr 2023 12:30:29 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Apr 21, 2023 at 02:41:19PM +0200, Herve Codina wrote:
> > Industrial I/O devices can be present in the audio path.
> > These devices needs to be viewed as audio components in order to be
> > fully integrated in the audio path.
> > 
> > simple-iio-aux allows to consider these Industrial I/O devices as
> > auxliary audio devices.  
> 
> What makes it simple? Any binding called simple or generic is a trigger 
> for me. Best to avoid those terms. :)

I choose simple-iio-aux because some simple-* already exists.
For instance simple-audio-amplifier or simple-audio-mux.

Do you prefer audio-iio-aux ?
Let me know if I should change.

> 
> Examples of devices would be useful here.
> 
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/simple-iio-aux.yaml        | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml b/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> > new file mode 100644
> > index 000000000000..fab128fce4fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/simple-iio-aux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple IIO auxiliary
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |  
> 
> Don't need '|'

Will be fixed.

> 
> > +  Auxiliary device based on Industrial I/O device channels
> > +
> > +allOf:
> > +  - $ref: /schemas/iio/iio-consumer.yaml  
> 
> You don't need to reference consumer schemas.

Right, will be removed.

> 
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: simple-iio-aux
> > +
> > +  io-channels:
> > +    description:
> > +      Industrial I/O device channels used
> > +
> > +  io-channel-names:
> > +    description:
> > +      Industrial I/O channel names related to io-channels.
> > +      These names are used to provides sound controls, widgets and routes names.
> > +
> > +  invert:  
> 
> Property names should globally only have 1 type definition. This is 
> generic enough I'd be concerned that's not the case.

What do you mean ?

> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: |
> > +      A list of 0/1 flags defining whether or not the related channel is
> > +      inverted
> > +    items:
> > +      enum: [0, 1]
> > +      default: 0
> > +      description: |
> > +        Invert the sound control value compared to the IIO channel raw value.
> > +          - 1: The related sound control value is inverted meaning that the
> > +               minimum sound control value correspond to the maximum IIO channel
> > +               raw value and the maximum sound control value correspond to the
> > +               minimum IIO channel raw value.
> > +          - 0: The related sound control value is not inverted meaning that the
> > +               minimum (resp maximum) sound control value correspond to the
> > +               minimum (resp maximum) IIO channel raw value.
> > +
> > +required:
> > +  - compatible
> > +  - io-channels
> > +  - io-channel-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    aux {
> > +        compatible = "simple-iio-aux";
> > +        io-channels = <&iio 0>, <&iio 1>, <&iio 2>, <&iio 3>;
> > +        io-channel-names = "CH0", "CH1", "CH2", "CH3";  
> 
> Not really useful names. Do you have a real example?

As Mark said, for IIO channel, using CHx makes sense.
See below, I provide a full example.

> 
> > +        /* Invert CH1 and CH2 */
> > +        invert = <0 1 1>;  
> 
> IMO, invert should be same length as io-channels.

I will update.

Related to this topic, when I wrote this binding, I wanted to add some
rules/constraints in order to:
- Have this property optional
- If present, force to have as many items in the invert array as the
  number of items present in the io-channels array.

I never succeed in writing the constraint for the invert property.
It should be possible (it is done for some 'foo' 'foo-names' pair such
as clocks).
Can you tell me if possible in my case and give me some pointers ?

> 
> > +    };  
> 
> How do support multiple instances? Say you have 2 sound cards (or 1 
> sound card with multiple audio paths) each with different sets of IIO 
> channels associated with it. You'd need a link to each 'aux' node. Why 
> not just add io-channels to the sound card nodes directly? That's 
> already just a virtual, top-level container node grouping all the 
> components. I don't see why we need another virtual node grouping a 
> subset of them.

I don't see what you mean.
I use a simple-audio-card and here is a full example using several
instances:

    spi {
        #address-cells = <1>;
        #size-cells = <0>;
	/* potentiometers present in an input amplifier design */
        pot_in: potentiometer@0 {
            compatible = "foo,xxx";
            reg = <0>;
            #io-channel-cells = <1>;
        };
	/* potentiometers present in an output amplifier design */
	pot_out: potentiometer@1 {
            compatible = "foo,xxx";
            reg = <1>;
            #io-channel-cells = <1>;
        };
	/* A codec */
        codec: codec@2 {
            compatible = "bar,yyy";
            reg = <2>;
            sound-name-prefix = "CODEC";
        };

    };

    amp_out: aux-out {
        compatible = "simple-iio-aux";
        io-channels = <&pot_out 0>, <&pot_out 1>,
        io-channel-names = "CH0", "CH1";
        invert = <1 1>;
        sound-name-prefix = "AMP_OUT";
    };

    amp_in: aux-in {
	compatible = "simple-iio-aux";
	io-channels = <&pot_in 0>, <&pot_in 1>;
	io-channel-names = "CH0", "CH1";
	sound-name-prefix = "AMP_IN";
    };

    sound {
        compatible = "simple-audio-card";
        #address-cells = <1>;
        #size-cells = <0>;
        simple-audio-card,name = "My Sound Card";

        simple-audio-card,aux-devs = <&amp_in>, <&amp_out>;
        simple-audio-card,routing =
            "CODEC IN0", "AMP_IN CH0 OUT",
            "CODEC IN1", "AMP_IN CH1 OUT",
            "AMP_OUT CH0 IN", "CODEC OUT0",
            "AMP_OUT CH1 IN", "CODEC OUT1",

        simple-audio-card,dai-link@0 {
            ...
        };
    };


Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
