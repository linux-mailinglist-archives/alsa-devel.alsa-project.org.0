Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CF6C60BF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 08:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D4CEC0;
	Thu, 23 Mar 2023 08:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D4CEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679556550;
	bh=EjlZSZDzUwTcxwfzGvYEpAuMsIVUl0uPi+oeEhNlvm0=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=VYMPMq1bS9EMIV7asJuoJDrAIsmxklLZNTZfAiGpmvp2aoKXw5y+nazdiU0hDogn2
	 afAMP0k7tWTVKwep+WJGi8OdXTpUseQwqfOANJkvLcHn6XyQbU0ECSmmoPtiCo20Db
	 l1iSbYfDapskpyj3zxW9mSnOHTQA7CIK/XbgXcwU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 303EBF8027B;
	Thu, 23 Mar 2023 08:28:19 +0100 (CET)
Date: Thu, 23 Mar 2023 08:27:58 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
In-Reply-To: <cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-5-herve.codina@bootlin.com>
	<cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77FIBMO3RQQVLXFPZFASCVESJDIGZOMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167955649877.26.13686802066620458324@mailman-core.alsa-project.org>
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
	id 5A72CF802E8; Thu, 23 Mar 2023 08:28:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C19D3F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 08:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C19D3F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oNU9PrUn
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 973C0240003;
	Thu, 23 Mar 2023 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679556482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZCDzRnLqysWpssOJFzBPP+Ah8SGkrKkmxkaX60oGac=;
	b=oNU9PrUnB5kWjgXEat4iAei6Hhs7l5YApzPKFrCVHYbMsCgknox/p5alDoKe8GpDSCPeY9
	QmXMkQbTx6T/wl2Y/618U/WhtERx3X25qKs0hpsHNnJL9Ij/lhylM3AGrPbZyVSzpjikZS
	uq/50PrtdkwzA7Np5OwztD7s6wQrkbASkn2PlWmSwixrkQPQqr9uC2JzkgEacLMWgI8Ks5
	Lg9lV9RYqFXSswWYgg/oaR40vNqfMFwAVSZdt+q8att55/qeiuLfsLJMYTFfsLVo/FkNnR
	48rLE+1X06BTBhdAcupsrdrrYyiQs1vv5aHDY01rX8eAfuNhd/G7nkGmntFJeQ==
Date: Thu, 23 Mar 2023 08:27:58 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Message-ID: <20230323082758.5e4385ff@bootlin.com>
In-Reply-To: <cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-5-herve.codina@bootlin.com>
	<cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 77FIBMO3RQQVLXFPZFASCVESJDIGZOMG
X-Message-ID-Hash: 77FIBMO3RQQVLXFPZFASCVESJDIGZOMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77FIBMO3RQQVLXFPZFASCVESJDIGZOMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof

On Wed, 22 Mar 2023 22:59:37 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 22/03/2023 14:46, Herve Codina wrote:
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > The codec support allows to use some of the PCM system highway
> > time-slots as audio channels to transport audio data over the E1/T1/J1
> > lines.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/lantiq,pef2256-codec.yaml  | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> > new file mode 100644
> > index 000000000000..da35b70cda99
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq PEF2256 codec
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  Codec support for PEF2256.
> > +
> > +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
> > +  line interface component designed to fulfill all required interfacing between
> > +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> > +
> > +  The codec support allows to use some of the PCM system highway time-slots as
> > +  audio channels to transport audio data over the E1/T1/J1 lines.
> > +
> > +  The time-slots used by the codec must be set and so, the properties
> > +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> > +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
> > +  sub-nodes that involve the codec. The codec uses 8bit time-slots.
> > +  'dai-tdm-tdm-slot-with' must be set to 8.
> > +  The tx and rx masks define the PEF2256 time-slots assigned to the codec.
> > +
> > +  The PEF2256 codec node should be a child of a PEF2256 node.
> > +  Refer to the bindings described in
> > +  Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: lantiq,pef2256-codec
> > +
> > +  '#sound-dai-cells':
> > +    const: 0  
> 
> You do not have here any resources, so the entire binding can be dropped
> and merged into the parent.
> 
> Best regards,
> Krzysztof
> 

Ok,
Do you expect all these properties (except compatible) merged at the parent
level or may I keep a child node with these properties including the
compatible property (ie. yaml file merge).

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
