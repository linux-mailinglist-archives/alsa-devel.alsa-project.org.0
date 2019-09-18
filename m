Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCCB6221
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 13:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02535167B;
	Wed, 18 Sep 2019 13:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02535167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568805447;
	bh=+du4+EXzSWUTI2gG10S07dHyeSTdMnIy7y0VnKfscaA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjIL8Nevwc7qtKqp+ejztFgFxVQYR4EOLowAXB+apb4mcv+EmVrHKwRtNrrX5454I
	 cQmDx6EY6qty0n9NnHKekgOZl4cS+er/1zjIAkfvzla08IgtEluuzgmKp0FHgAD6Qh
	 u1BCI9uboj4pTgO06b0xpMNFPMs2SU6Wop5Th+h4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84943F80506;
	Wed, 18 Sep 2019 13:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0A5F80506; Wed, 18 Sep 2019 13:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4003F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 13:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4003F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tdoNm7MQ"
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1569D21925
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568805333;
 bh=Z1ZIFhhy6smRaUk/cnY/1dt44ZCoDTqFKOckpsCYBxw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tdoNm7MQM6vlD8Re6p+4+TuUhvb08H7edBsKvOUfJfR+FTIcHmtJQQ5J8sWbMUlSS
 b2JaTeE+3aiZE+izXmc0Pyc0Cd+i5ljeUswsogSlbZV/K2cvcGTxGHiWIYVlUjaGnh
 X7j3MRHojIedB0CkIhuMj+sG/4fs441A5OUQi3i0=
Received: by mail-lj1-f179.google.com with SMTP id a22so6827230ljd.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 04:15:32 -0700 (PDT)
X-Gm-Message-State: APjAAAXGJf3RpSIJ9kXhjZv7ovsrwtcZmmoe+fOpTgSG/v8QlZPA1qr2
 2GupPFc85RXMhLKBMwPCJCEya/8eluuf1GwA54w=
X-Google-Smtp-Source: APXvYqwqIMrcCSDnVOm7QL2aENfE9D2HYtsS7Rg6tiAb7a6LF8Si7qSp+YiCRLA7O5nuNdgm649/uCGZusiMIQO21ws=
X-Received: by 2002:a2e:3201:: with SMTP id y1mr1880694ljy.5.1568805331254;
 Wed, 18 Sep 2019 04:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5@eucas1p2.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com>
 <20190917120627.28357-1-m.falkowski@samsung.com>
In-Reply-To: <20190917120627.28357-1-m.falkowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 18 Sep 2019 13:15:19 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc=OXLY3ynUKGhVduuiSyzT_1Po19Hhwd6fGkbaar8GQQ@mail.gmail.com>
Message-ID: <CAJKOXPc=OXLY3ynUKGhVduuiSyzT_1Po19Hhwd6fGkbaar8GQQ@mail.gmail.com>
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 sbkim73@samsung.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 robh+dt@kernel.org, lgirdwood@gmail.com, Andrzej Hajda <a.hajda@samsung.com>,
 broonie@kernel.org, s.nawrocki@samsung.com,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] dt-bindings: sound: Convert Samsung
	SMDK audio complex
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

On Tue, 17 Sep 2019 at 14:06, Maciej Falkowski <m.falkowski@samsung.com> wrote:
>
> Convert Samsung SMDK audio complex to newer dt-schema format.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added missing Signed-off-by certificate

I understood you cannot certify that you have the rights to send the
patch. Adding someone's else Signed-off-by does not solve the problem
of lack of such permission. Marek could certify that but you cannot
certify for him. Otherwise it really makes the process bogus - anyone
can add Linus' SoB and say that Linus certified the rights to include
this contribution.

In my understanding of Developer's Certificate of Origin 1.1, these
patches do not meet the criteria and therefore should not be included
from that point of view.

One minor comment further.

> ---
>  .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
>  .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
> deleted file mode 100644
> index 4686646fb122..000000000000
> --- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Samsung SMDK audio complex
> -
> -Required properties:
> -- compatible : "samsung,smdk-wm8994"
> -- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
> -- samsung,audio-codec: The phandle of the WM8994 audio codec
> -Example:
> -
> -sound {
> -               compatible = "samsung,smdk-wm8994";
> -
> -               samsung,i2s-controller = <&i2s0>;
> -               samsung,audio-codec = <&wm8994>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
> new file mode 100644
> index 000000000000..a66c0dfdeb57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC SMDK audio complex
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sangbeom Kim <sbkim73@samsung.com>

Unfortunately there was no mails coming from Sangbeom Kim so I think
he is not active in maintaining these pieces. Let's skip this entry.

Best regards,
Krzysztof

> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: "samsung,smdk-wm8994"
> +
> +  samsung,i2s-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the Samsung I2S0 controller
> +
> +  samsung,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the WM8994 audio codec
> +
> +required:
> +  - compatible
> +  - samsung,i2s-controller
> +  - samsung,audio-codec
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "samsung,smdk-wm8994";
> +        samsung,i2s-controller = <&i2s0>;
> +        samsung,audio-codec = <&wm8994>;
> +    };
> +
> --
> 2.17.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
