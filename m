Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4E1E7922
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 11:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C710A1788;
	Fri, 29 May 2020 11:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C710A1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590743783;
	bh=0uCz4wQskIgmr/o8jIXWlP7aQ92+9p4o6vWSCaq1eAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kd6yMi5KW6bq3/OQlJSrQR1f+QNF3Q5fNZbT1dZLM8jBk74s6n4AzlKsAW2p70+cQ
	 H3rpwsfY135LaghQE4rQZ5MIKc7R9rGaW32dKTIp/zTycvxhMkhlk+iY8D00qyXMmH
	 NorPdKjBDjcOEVqvcFnWvegvGfbe154uJyuatHSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0757EF8016F;
	Fri, 29 May 2020 11:14:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 795F3F8014E; Fri, 29 May 2020 11:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5154DF800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 11:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5154DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H6OoWEOF"
Received: by mail-lj1-x241.google.com with SMTP id q2so1681881ljm.10
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ucA1gw/ho1zSjwgJBn04nUvtlOmcEkuOvqSSP+X35Y=;
 b=H6OoWEOF97lm2cCfXBbp3785Efsi+f15oMc4dJhbp7Z+m2oCo5HSkIANJ1dN2xCMtB
 3g9dQFGu8D/x21reKf6SKaOiGXFpzhQVHrRQAR6N22YNDXY/NPjdMVzCjf4CBev8BxUp
 5tX1usKImxyRwg3GLA9CrXVyZFI0cX8m4NryjxJyAZMdzJ7VMfjK/Gf20zYFqqXmd5zq
 lL7zxwv9kHLpP4Pr4ANVXJCXRUmOqzEm0sskrumRQONW/zQ2xbt+nbro/Rm0A9m+38VV
 FNzzarU+v3mZvD2Zalr/fSpLqZCw41mtQ9l1mi5cTTcRCJBOwrqIJ2gLiFufXoRR4O2x
 bWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ucA1gw/ho1zSjwgJBn04nUvtlOmcEkuOvqSSP+X35Y=;
 b=CanMMyjiA+kudFjClSfzVf5Kmfqwtm/Eu53KZuswPnhCicHk4DzlE0AwXxZVKKNvn6
 0+Jym+C1zHxIw59tyovIMYsMB7vmry4XbVAB+s+B5cekr7qcpbgQdsXZ+XPjzhqLTvIC
 doC7LPpUy/n+qNT9O8NbaARcbZs1P4Wa8C/auXmkyQML12De02OWTCUrU/RHgxYFDXfE
 BKA80n1AdIchkMpnhjKL0SFWATn6m8gD8J+s44/B7M0dPuM6jjo0QkfPVNi11RnRaA35
 CBygkJXVetAHaPOKRmdcNFad7KRu9SBjUnpHjFxH/HQPWrdyS/1vSJz7E1CTr1sUAJrx
 X5GQ==
X-Gm-Message-State: AOAM533oG/BeEnbyH6KCNP38p5d3KyTAJt5YsXb9YAm7HR8RyY278qpe
 vAFjKZF6PlhMzMonQfgBHB/CGb1ZnKaJJx4uOCc=
X-Google-Smtp-Source: ABdhPJxQWYV58ZprSnFScmEouw+J5GBxzk0/Tb470NoRu5UW6cbA0I3QwIY8Y0lmCdsE+6ikpmy9GqsZI2ByGcmH1eA=
X-Received: by 2002:a2e:300d:: with SMTP id w13mr3789851ljw.245.1590743667722; 
 Fri, 29 May 2020 02:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200528103755.17381-1-steves.lee@maximintegrated.com>
 <20200528141749.GB4186430@bogus>
In-Reply-To: <20200528141749.GB4186430@bogus>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Fri, 29 May 2020 18:14:16 +0900
Message-ID: <CABff4NTc1faPpuunzt6kwOk5YsA0drvkHFvNPhyG6uZZDrqc0w@mail.gmail.com>
Subject: Re: [V6 PATCH 1/2] dt-bindings: Added device tree binding for max98390
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, Steve Lee <steves.lee@maximintegrated.com>,
 ryans.lee@maximintegrated.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 28, 2020 at 11:17 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 28, 2020 at 07:37:55PM +0900, Steve Lee wrote:
> > Add DT binding of max98390 amplifier driver.
> >
> > Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
> > ---
> > Changed since V5:
> >       * Change txt to yaml and fix up the examples.
> > Changed since V4:
> >       * No changes.
> > Changed since V3:
> >       * No changes.
> > Changed since V2:
> >       * No changes.
> > Changed since V1:
> >       * Modified sample text in example
> >
> >  .../bindings/sound/maxim,max98390.yaml        | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > new file mode 100644
> > index 000000000000..1ed4ab9e1c37
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim Integrated MAX98390 Speaker Amplifier with Integrated Dynamic Speaker Management
> > +
> > +maintainers:
> > +  - Steve Lee <steves.lee@maximintegrated.com>
> > +
> > +properties:
> > +  compatible:
> > +      const: maxim,max98390
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  temperature_calib:
>
> s/_/-/

 This is follow as coreboot in Chromium OS case.
I'd follow this name unchanged.

>
> And missing 'maxim' prefix.

 Added missed prefix maxim prefix.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
>
> Any constraints? 0-2^32 are valid values?

 I added range of the values

>
> > +
> > +  r0_calib:
>
> Same here.

I added range of the values.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: This is r0 calibration data which was measured in factory mode.
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> Add:
>
> additionalProperties: false

I have added this.

>
> > +
> > +examples:
> > +  - |
> > +    max98390: amplifier@38 {
> > +            compatible = "maxim,max98390";
> > +            reg = <0x38>;
> > +            maxim,temperature_calib = <1024>;
> > +            maxim,r0_calib = <100232>;
> > +    };
> > --
> > 2.17.1
> >
