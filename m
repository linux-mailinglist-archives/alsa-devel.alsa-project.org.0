Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456169AD2A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 14:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1703F1B;
	Fri, 17 Feb 2023 14:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1703F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676641889;
	bh=wo9leP4z+3lq2c8RvEbXWZDwVdn9gtko4armAoJhFVo=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vazNqrdGZQcKjh80qfExTxS/rQOGuKeuKzNdDWjbB4/Z5xlKvQYoba5V2Hbwz0Iw6
	 abii3W/6uldPjpsh4PUEGeyyuEVo3ntCzriZCMnVjl3cu+H6HecDVD2fFA6/4GrKnj
	 cM/ttiLB3xvZiX6YbOfB3/27LW4ap9f/EOkBId0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E80E6F800AA;
	Fri, 17 Feb 2023 14:50:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E24F80171; Fri, 17 Feb 2023 14:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A04AF80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 14:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A04AF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RoBsXKNP
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 47F6B60003;
	Fri, 17 Feb 2023 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676641825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXtty5j4EPkHzMourS16qE5SNRSNmBZzzykreudpYyw=;
	b=RoBsXKNPDSFIw+waIM9X3bayblvPaLqhufkZQmycFa7Xnrs3aTpCAWzjhfnGtitb8+V2N1
	7lvs3fA9mB2xffWdKYEEfQNqEKifHKxSneXjI8wUgFitrhpYd/n+2eAtt+u9wdBpmfiF99
	3+IsOBT6U1N4DOFMFnmQspVrm+xBGluGmi55YzwE/u8kJufXbbl+0bmekuU9Xl8KhAW5EU
	AVXU7Vb/pZ14cC+S+t5i+AZPWyZoqSPusgF7ggwvHd6IDqZnmrk8/AarNmkNGQDl6tIZJP
	kmwG5k2P/GWE4TNLz5ynqio6byKJqgjXOVaFfHowgpEcNTsKLnSWj+XNN8tEKQ==
Date: Fri, 17 Feb 2023 14:50:19 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230217145019.0def6f9a@bootlin.com>
In-Reply-To: <6ae9af19-1d52-c31f-79be-a36f06caaf80@linaro.org>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
	<20230216134226.1692107-2-herve.codina@bootlin.com>
	<6ae9af19-1d52-c31f-79be-a36f06caaf80@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Q5SDUYAWVBOK63OYPGMHBHNFQBIB4KYJ
X-Message-ID-Hash: Q5SDUYAWVBOK63OYPGMHBHNFQBIB4KYJ
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5SDUYAWVBOK63OYPGMHBHNFQBIB4KYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Fri, 17 Feb 2023 10:14:48 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 16/02/2023 14:42, Herve Codina wrote:
> > Add support for the time slot assigner (TSA)
> > available in some PowerQUICC SoC such as MPC885
> > or MPC866.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 234 ++++++++++++++++++
> >  include/dt-bindings/soc/fsl,tsa.h             |  13 +
> >  2 files changed, 247 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,cpm1-tsa.yaml
> >  create mode 100644 include/dt-bindings/soc/fsl,tsa.h

[...]
> > +
> > +patternProperties:
> > +  '^tdm@[0-1]$':
> > +    description:
> > +      The TDM managed by this controller
> > +    type: object
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 1
> > +        description:
> > +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
[...]
> > +
> > +      fsl,rx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3] =20
>=20
> maxItems: 1

The property is an enum
Why this maxItems value ?

If I add the maxItems value, I've got some dt_binding_check errors:
  /xxxx/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml:
  patternProperties:^tdm@[0-1]$:properties:fsl,rx-frame-sync-delay-bits:
  'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMax=
imum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

>=20
> > +        default: 0
> > +        description: |
> > +          Receive frame sync delay in number of bits.
> > +          Indicates the delay between the Rx sync and the first bit of=
 the Rx
> > +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits dela=
y.
> > +
> > +      fsl,tx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3] =20
>=20
> maxItems: 1

Same question here.


Thanks for the review,

Herv=C3=A9
--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
