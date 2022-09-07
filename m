Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1755B04A2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 15:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61F721660;
	Wed,  7 Sep 2022 15:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61F721660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662555891;
	bh=kjEBv681Uh76hPxvSLTwYZf31spWIZR2Fybv0iDtesk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JyUlnHC7oe567pkAh+QBluzwi6HBnqReczVulBkxWNImX8z5ZEQIvhT3XlEq1NoHG
	 FVD2HogvOKgjjnN1ZXuR4Z8PAQ8to7fxPS2h/HCqg3WRYap/8WKRQ3j9xHhai5vKi6
	 9cWDxMDCcPSsoVfC2H8AS3nRvAcPy1R/rpLH+P7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8953F8011C;
	Wed,  7 Sep 2022 15:03:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F93DF8011C; Wed,  7 Sep 2022 15:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCFBF8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCFBF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L5rq5Kda"
Received: by mail-lf1-x135.google.com with SMTP id k10so7714102lfm.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qCzGo5zu3ocFxONBKNXURb73iuFFxmthYiRFpinE5Ww=;
 b=L5rq5KdabBRfTF+SWJEDqLBbBXZTs7u2Pi4wGAAY8U7o2uQhQ2yLr10IQhjcOExmAt
 LEgkaPkRiTtJZkLPjP8DXeb8ga25JanlssJQkJotVNv8HPla1vvri9GtxOR9SBdr61Yc
 STOeUz/52yw29EFHYx3E/ZQOPwebMhmQcKYe3FiH67pvY4hBhBquxWD3T8WINrUduDgN
 doYag7c65qyWd9iyGT3vxihJNaiSkhGbgudJtOexc24nTnTAUrddF+NUkrS+2WCngwQn
 strEusz0UFVKnqVjqY4PDhc6iRxScwTQCQhvWoWPpPzCqIz94EqQas4mD0KEYthpPnCk
 WamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qCzGo5zu3ocFxONBKNXURb73iuFFxmthYiRFpinE5Ww=;
 b=R8n/UESFMuqk/ov3SHbnsp2UY6Q5Ppltu+I3jwlVUkeb6fWavcOnTMDFoXsYqs/XK4
 x5d6cllf/7fonii1AIMeGwiPQnI7i13Jk/itrEM9ed6J2inYS9VSKVWZ0l4x49VlqGtp
 bcfXSmvef/Hz9gJhVSR7KH9yJUxS9cR+redO5X165Xe7L6lsC8lIR1ysR+5S3sjLy6ub
 +00VdhdFIKEbkZo2uHTFRm8fDFwEzNEU9+mxupFZA+QoGUk8ggxGPJRpJC0jnJ+VDOYW
 c/mWorzVMOXGrGECaeguzo2Y8jTVj8K4E2ASrdJeznDULO/SDREU3kYYoZzdq0cSLD1n
 LdGA==
X-Gm-Message-State: ACgBeo34NoJnajXJU5FHT1AUcykR2pKnfaT0WCWi4lKXyR1PN/k+jdaf
 sGobF9LSDOZFjctnCCWG/98A0W48mmeoyQ9BdA==
X-Google-Smtp-Source: AA6agR7/Inx7r/JXeN2FD6BwzYX7KUm1Zk8qjiwgstk424GZR+f1LFj1bkrB46I2tF3SFcuyKyBqeQfeTVDBhVAfvPo=
X-Received: by 2002:a05:6512:2252:b0:494:7a42:6ba9 with SMTP id
 i18-20020a056512225200b004947a426ba9mr1060384lfu.273.1662555820630; Wed, 07
 Sep 2022 06:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
In-Reply-To: <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Wed, 7 Sep 2022 21:03:29 +0800
Message-ID: <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 samuel@sholland.org, lgirdwood@gmail.com, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wens@csie.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E2022=E5=B9=B4=
8=E6=9C=8831=E6=97=A5=E5=91=A8=E4=B8=89 01:35=E5=86=99=E9=81=93=EF=BC=9A

> On 30/08/2022 18:07, Ban Tao wrote:
> > DT binding documentation for this new ASoC driver.
>
> Thank you for your patch. There is something to discuss/improve.
>
> >
>
> >  .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79
> ++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> > new file mode 100644
> > index 0000000..0cfc07f
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H6 DMIC Device Tree Bindings
>
> s/Device Tree Bindings//
>

So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?

>
> > +
> > +maintainers:
> > +  - Ban Tao <fengzheng923@gmail.com>
> > +
> > +properties:
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    const: allwinner,sun50i-h6-dmic
>
> Put compatible first in the list of properties (also in required:).
>
> Rest is ok, so keep the Rb-tags you already got.
>
> Best regards,
> Krzysztof
>
