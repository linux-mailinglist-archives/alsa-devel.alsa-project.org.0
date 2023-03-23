Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D906C615B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 09:11:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9A8EC6;
	Thu, 23 Mar 2023 09:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9A8EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679559066;
	bh=LE7dtLeL6wZ8yh0gvS4w/ceNC9a98Or9JRImHjTxUQg=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=kL/RW+Q3/sb8/q2/VDO6aQzNI0u1i0uRcIa5X+D9YYWXbDypRlffUnA+8VdSV5JUK
	 WthDcxYS1zecNapFPpyZua1Ljl+oHyEleA7+LzHKeJThYcGffQceHF6ceZ5wiubTjW
	 A3TWmDhDRDhwLxFOQfQmC7w4CTW804KjLQEcaIqk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAA1F8027B;
	Thu, 23 Mar 2023 09:10:15 +0100 (CET)
Date: Thu, 23 Mar 2023 09:10:01 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
In-Reply-To: <5c82c731-3124-9eca-32a3-c974db95724a@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-5-herve.codina@bootlin.com>
	<cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
	<20230323082758.5e4385ff@bootlin.com>
	<5c82c731-3124-9eca-32a3-c974db95724a@linaro.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OO2AXN6AAIJMBNHUVL2GLG6AXMDR25UJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167955901495.26.15593603709004991186@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F475F802E8; Thu, 23 Mar 2023 09:10:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC7E7F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 09:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC7E7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y4TDA/aH
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 79AE71BF212;
	Thu, 23 Mar 2023 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679559005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSFCW6jLRdKGSTRgBj+3w6Z50goS9OAkklgGnjMU3uc=;
	b=Y4TDA/aHcoKPzG7DDAfcDeMKGbDnh6P7jwE53mGuYW17CT/uBplLfXZRzHxCCU/S/3g9Ux
	ePo5Qdm7mYIGE/27ANu1JtRcg9n9FV97IFBG9XXFM8GTE0oTMLSvhOkDWoC0BTwqau72QF
	d9uoYHuXL5XdZCN1nlvCLkJzW64Rzf5ZL+nX1111jC72V06lC7t1kLUwGIplbJBD3PHYmK
	0Qa4yZM/0W81SSgA0CGyDCR9fKMgf09t6JuEMknkQtXJXNlJ5O1+M45Z5RP+h6fy8kxwgH
	S5xasH9/0cFskVdUiTHsv26z84liAsQyGtY7zZ8e8MnYlDGwFvCjb+igsoZVww==
Date: Thu, 23 Mar 2023 09:10:01 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Message-ID: <20230323091001.100ca343@bootlin.com>
In-Reply-To: <5c82c731-3124-9eca-32a3-c974db95724a@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-5-herve.codina@bootlin.com>
	<cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
	<20230323082758.5e4385ff@bootlin.com>
	<5c82c731-3124-9eca-32a3-c974db95724a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OO2AXN6AAIJMBNHUVL2GLG6AXMDR25UJ
X-Message-ID-Hash: OO2AXN6AAIJMBNHUVL2GLG6AXMDR25UJ
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OO2AXN6AAIJMBNHUVL2GLG6AXMDR25UJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 08:31:28 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 23/03/2023 08:27, Herve Codina wrote:
> > Hi Krzysztof
> > 
> > On Wed, 22 Mar 2023 22:59:37 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >   
> >> On 22/03/2023 14:46, Herve Codina wrote:  
> >>> The Lantiq PEF2256 is a framer and line interface component designed to
> >>> fulfill all required interfacing between an analog E1/T1/J1 line and the
> >>> digital PCM system highway/H.100 bus.
> >>>
> >>> The codec support allows to use some of the PCM system highway
> >>> time-slots as audio channels to transport audio data over the E1/T1/J1
> >>> lines.
> >>>
> >>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >>> ---
> >>>  .../bindings/sound/lantiq,pef2256-codec.yaml  | 54 +++++++++++++++++++
> >>>  1 file changed, 54 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> >>> new file mode 100644
> >>> index 000000000000..da35b70cda99
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> >>> @@ -0,0 +1,54 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Lantiq PEF2256 codec
> >>> +
> >>> +maintainers:
> >>> +  - Herve Codina <herve.codina@bootlin.com>
> >>> +
> >>> +description: |
> >>> +  Codec support for PEF2256.
> >>> +
> >>> +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
> >>> +  line interface component designed to fulfill all required interfacing between
> >>> +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> >>> +
> >>> +  The codec support allows to use some of the PCM system highway time-slots as
> >>> +  audio channels to transport audio data over the E1/T1/J1 lines.
> >>> +
> >>> +  The time-slots used by the codec must be set and so, the properties
> >>> +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> >>> +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
> >>> +  sub-nodes that involve the codec. The codec uses 8bit time-slots.
> >>> +  'dai-tdm-tdm-slot-with' must be set to 8.
> >>> +  The tx and rx masks define the PEF2256 time-slots assigned to the codec.
> >>> +
> >>> +  The PEF2256 codec node should be a child of a PEF2256 node.
> >>> +  Refer to the bindings described in
> >>> +  Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
> >>> +
> >>> +allOf:
> >>> +  - $ref: dai-common.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lantiq,pef2256-codec
> >>> +
> >>> +  '#sound-dai-cells':
> >>> +    const: 0    
> >>
> >> You do not have here any resources, so the entire binding can be dropped
> >> and merged into the parent.
> >>
> >> Best regards,
> >> Krzysztof
> >>  
> > 
> > Ok,
> > Do you expect all these properties (except compatible) merged at the parent  
> 
> You have only two properties here - dai cells and name-prefix...
> 
> > level or may I keep a child node with these properties including the
> > compatible property (ie. yaml file merge).  
> 
> I was thinking that these should be merged into parent because usually
> you do not need child node for this. However now I started to think how
> the codec driver would look like. Essentially the parent MFD driver
> would need to register dais...
> 

There is also something specific to audio, the slots definition
'dai-tdm-slot-tx-mask' and 'dai-tdm-slot-rx-mask'. These slots definitions
are set at the ALSA sound card sub-nodes.
So, I can have multiple codec in the PEF2256.

For instance:
  framer {
    compatible = "lantiq,pef2256", "simple-mfd";
    ...
    pef2256_codec0: codec0 {
      compatible = "lantiq,pef2256-codec";
      #sound-dai-cells = <0>;
    };
    pef2256_codec1: codec1 {
      compatible = "lantiq,pef2256-codec";
      #sound-dai-cells = <0>;
    };
  };

  sound {
    compatible = "simple-audio-card";
    #address-cells = <1>;
    #size-cells = <0>;
    simple-audio-card,dai-link@0 { /* CPU DAI1 - pef2256 codec 1 */
      reg = <0>;
      cpu {
        sound-dai = <&cpu_dai1>;
      };
      codec {
        sound-dai = <&pef2256_codec0>;
	dai-tdm-slot-num = <4>;
	dai-tdm-slot-width = <8>;
	/* TS 2, 3, 4, 5 */
	dai-tdm-slot-tx-mask = <0 1 1 1 1>;
	dai-tdm-slot-rx-mask = <0 1 1 1 1>;
      };
    simple-audio-card,dai-link@1 { /* CPU DAI2 - pef2256 codec 2 */
      reg = <1>;
      cpu {
        sound-dai = <&cpu_dai2>;
      };
      codec {
	sound-dai = <&pef2256_codec1>;
	dai-tdm-slot-num = <4>;
	dai-tdm-slot-width = <8>;
	/* TS 6, 7, 8, 9 */
	dai-tdm-slot-tx-mask = <0 0 0 0 0 1 1 1 1>;
	dai-tdm-slot-rx-mask = <0 0 0 0 0 1 1 1 1>;
      };
    };
  };

To solve this, I can use #sound-dai-cells = <1>; but this will complicate
the driver itself and is it really needed ?
Having "simple-mfd" dans sub-nodes keep all things simple.

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
