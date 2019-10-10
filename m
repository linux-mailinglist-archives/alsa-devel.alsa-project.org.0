Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD526D33B6
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 23:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426941664;
	Thu, 10 Oct 2019 23:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426941664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570744674;
	bh=23uSCyBU5hRSQ8zM5Mn4lXLCtz4DHvIkORHuST8bqTw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPRSYj4T0/pHuxHdpgdMGJeGrG8EEtCmqe+aTr6TMa6UVAJbWpKVXo8sMuEfxlGGx
	 3y1tmuG1Bu28LWP7q6Y55aJ7iGC86HPT5P0vKCJ/I5BIoIZvXJ5f73OydvFVjVpH0d
	 M6UlBTcHfz8jl2oeoN+teriDP7Lw4ycvz7Sor1e0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C67B1F8045E;
	Thu, 10 Oct 2019 23:56:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE123F8038F; Thu, 10 Oct 2019 23:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04996F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 23:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04996F802BC
Received: by mail-oi1-f196.google.com with SMTP id k25so6259927oiw.13
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 14:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dmEyns0qiRRKvVwvDe9b3zXgdL6xxWI9qrjMl+HbFFk=;
 b=moBjK6wSh8JQDc1RK1u7v/6s0JbFPDR2eZtOZtAxH/PDJtRJtcfKJNkn+AvC3Zbz1e
 ukkCBgPZx6g7s6x81WVNBs5jIIJe+ketmUd5NscBFGvmMPxY9txf9lIW9Bv4EBmGZQeL
 pPKdzY7JylqQBLi6/GqgSnce8j3ZFNjUp9OYWqo912uBDqIOimYV5qx21pW/EjGyehQT
 lTyAWdI1GXaIrAxfexjpccfjqIPgT9qy9Dq/P18IzNhrFpelnHywu/4q2OvN7gUHIFTs
 kC3a7bqP+cIUy3zJm/XPC+9ytKtMpztZz8xcvsNfgdJsQcN3ucIMiuXRRg+WbvPDtdxE
 1Zkw==
X-Gm-Message-State: APjAAAWrnLoZK8wo0I5/my+rxtP4am6a5ED+Za+V4VP68ffzcjg78KcL
 HCnQnVf1DsSqE52GWnUgeg==
X-Google-Smtp-Source: APXvYqzj4kur/33FK2sd//f66BtsRFHAy4do5i9dVlNwbGf5OzP49TJkH5CgWCvXWaooiVa5ktHY5w==
X-Received: by 2002:aca:cdc3:: with SMTP id d186mr9834094oig.162.1570744563038; 
 Thu, 10 Oct 2019 14:56:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o23sm2108179ote.67.2019.10.10.14.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:56:02 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:56:01 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191010215601.GA24757@bogus>
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
 <20190926120210.8544-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926120210.8544-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] dt-bindings: sound: Convert Samsung
 Exynos5433 TM2(E) audio complex with WM5110 codec to dt-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Sep 26, 2019 at 02:02:10PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added type and description and removed number of items from 'model' property.
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
>  .../bindings/sound/samsung,tm2-audio.yaml     | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml

> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> new file mode 100644
> index 000000000000..62b5b9a1dec0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,tm2-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Exynos5433 TM2(E) audio complex with WM5110 codec
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: samsung,tm2-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  audio-codec:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - items:

This way works, but we get better error messages if you move this up to 
'allOf' level. IOW, only the $ref has to be under an 'allOf'.

> +          - description: |
> +              phandle of the wm5110 audio codec node,
> +              as described in ../mfd/arizona.txt;
> +          - description: phandle of the HDMI transmitter node.
> +
> +  i2s-controller:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - items:
> +          - description: phandle of the I2S0.
> +          - description: phandle of the I2S1.
> +
> +  audio-amplifier:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the MAX98504 amplifier.
> +
> +  samsung,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      List of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's
> +      source. Valid names for sources and sinks are
> +      the WM5110's and MAX98504's pins and the jacks on the
> +      board: HP, SPK, Main Mic, Sub Mic, Third Mic, Headset Mic.

Please enumerate the possible strings.

> +
> +  mic-bias-gpios:
> +    description: GPIO pin that enables the Main Mic bias regulator.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - model
> +  - audio-codec
> +  - i2s-controller
> +  - audio-amplifier
> +  - samsung,audio-routing
> +  - mic-bias-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "samsung,tm2-audio";
> +        model = "wm5110";
> +        audio-codec = <&wm5110>, <&hdmi>;
> +        i2s-controller = <&i2s0 0>, <&i2s1 0>;
> +        audio-amplifier = <&max98504>;
> +        mic-bias-gpios = <&gpr3>;
> +        samsung,audio-routing =
> +                "HP", "HPOUT1L",
> +                "HP", "HPOUT1R",
> +                "SPK", "SPKOUT",
> +                "SPKOUT", "HPOUT2L",
> +                "SPKOUT", "HPOUT2R",
> +                "Main Mic", "MICBIAS2",
> +                "IN1R", "Main Mic";
> +    };
> +
> -- 
> 2.17.1
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
