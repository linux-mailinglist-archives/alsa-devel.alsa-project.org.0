Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66926F2ED1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319151775;
	Mon,  1 May 2023 08:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319151775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923416;
	bh=NmqiJu4v6ZZCk+1mECI6DILNdmMBhDNGj/FgY4RSqlk=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=RcEnFzP26DqwXxZkgT6QyCIeaSaMjRKi/gbtPV8wZMbKGaDGkJxCmBMI0O7U2reIV
	 MMKRIfvP+JrmSQhXo/Rp0IQJJtWZcFp2NOHyyCgL1d/Y745Nd5UFPytTusT8ISWw5I
	 G7J8/53SX1yFYFze2lllkS+gvTFYdXSUU4nfhrEU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9423F80578;
	Mon,  1 May 2023 08:40:23 +0200 (CEST)
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-3-pan@semihalf.com>
 <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
In-Reply-To: <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
Date: Tue, 25 Apr 2023 18:01:17 +0200
Subject: Re: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTJYPTNXJK3FCR44NOWQSJOAQDCRMSAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292322302.26.6517297685776635918@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D884F80236; Tue, 25 Apr 2023 18:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B32A2F80137
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B32A2F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=s6lxl/bN
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso1089881466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1682438488; x=1685030488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qZwe+g9Dxagr64hvkp0DhXSjVEAgZXo7VQunQF7wJI=;
        b=s6lxl/bNCKB74RDhUWpS6sp3eZRcXFwdRnzT/5iAvi8qIT7vmatOaU+ON5LbTlP1Ke
         t40qJ2JzqOyRd6/Emtfw9AC27BFIDI6WXh/J+u2QKv1Yt7zvcYLmsRa+sIUfwIocsX64
         8W92McU54ZiLTZcKDTRLEax1MOUzMe95jVR3CbWaMGtAQLpH8bJriauESPZfAjun81xG
         I70XpVc/9k8RjAmUo59/nDUIgYSeOmf0yRuY7jYB/MMk/g+1GMfySEuYRtnTq0FD9wWj
         4iRebKqersE7iF/XG5HV9k06kmh6hKvLI3Evj0XuX755mnRNBeXUjqOcif2pRr55fVGW
         th+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682438488; x=1685030488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qZwe+g9Dxagr64hvkp0DhXSjVEAgZXo7VQunQF7wJI=;
        b=R3edYutuQduKeQkW9ILRYNgC+vcO+1CzBXog27lVZ+lzxd9xRwTBAX9ucag+gOzyJz
         tD6vN9cY4oXMbAxzRQft3u5vq+OmzfkDiCGmwTQcaZ2x2+CQkraRYhVzBGMA82XZMDZo
         PeIr2LhhW+zYu2BuXvpcHovC7qcNOz6S/YWcNzZstJFd7r0QxPH0OnqVNMmi1uz3QsEd
         hCmSbKZap1fDvy+poxhHt5cQIXpiYWweTLBTwEbfmPE9O2HmO08ctBZuhgcFvPxTo+Gb
         7GF39q38i81b9E2Un7M6Gj5Ggg0fVwlsFFfv2JgfBS3qQ3t8VRtD4ZswhdpF447ioLqI
         pViA==
X-Gm-Message-State: AAQBX9ddMr5DCUtZTQYqgzY/n3XX/PgKQ9KPemNW4hEc8h/HtuRoep4C
	OvTAN5MRnwpupiRnHhzI8toPcV+OksuVamT6zYBB8w==
X-Google-Smtp-Source: 
 AKy350bCTCO5FEN3I9Rp+cI+k9IsgEyugAx+bZ7mqb2EP6CD9TQx690F5KVSw5g1qGf64xP5J4DwvncWgDkwOqAS+4I=
X-Received: by 2002:a17:907:168d:b0:94a:82ca:12e5 with SMTP id
 hc13-20020a170907168d00b0094a82ca12e5mr17161732ejc.45.1682438487931; Tue, 25
 Apr 2023 09:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-3-pan@semihalf.com>
 <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
In-Reply-To: <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 25 Apr 2023 18:01:17 +0200
Message-ID: 
 <CAF9_jYRXsdQX22bOVG5Dp20GnC7JniqGC6popTS5dSxmiqjizQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DTJYPTNXJK3FCR44NOWQSJOAQDCRMSAA
X-Message-ID-Hash: DTJYPTNXJK3FCR44NOWQSJOAQDCRMSAA
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTJYPTNXJK3FCR44NOWQSJOAQDCRMSAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 7:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/04/2023 16:01, Pawe=C5=82 Anikiel wrote:
> > Add binding for chv3-i2s device.
>
> Your subject needs improvements:
> 1. ASoC goes before bindings
> 2. You miss some meaningful title of device. "chv3-i2s" can be anything,
> so add Google or Google Chameleon. Or use entire compatible.

Would "ASoC: dt-bindings: Add Google Chameleon v3 I2S device" be better?

>
>
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> > ---
> >  .../bindings/sound/google,chv3-i2s.yaml       | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3=
-i2s.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.ya=
ml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> > new file mode 100644
> > index 000000000000..6f49cf059ac5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Chameleon v3 I2S device
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <pan@semihalf.com>
> > +
> > +description: |
> > +  I2S device for the Google Chameleon v3. The device handles both RX
> > +  and TX using a producer/consumer ring buffer design.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,chv3-i2s
>
> Missing blank line.
>
> Is chv3 the name of your SoC? Where are the SoC bindings? What's exactly
> the versioning scheme for it (compatibles must be specific, not generic).

The Chameleon v3 is based around an Intel Arria 10 SoC FPGA. The i2s
device is implemented inside the FPGA. Does this case require SoC
bindings?

>
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
>
> As well...
>
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2s0: i2s@c0060300 {
> > +        compatible =3D "google,chv3-i2s";
> > +        reg =3D <0xc0060300 0x100>,
> > +              <0xc0060f00 0x10>;
> > +        interrupts =3D <0 20 IRQ_TYPE_LEVEL_HIGH>;
>
> Isn't 0 also a known define?

Do you mean this?
interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;

Regards,
Pawe=C5=82
