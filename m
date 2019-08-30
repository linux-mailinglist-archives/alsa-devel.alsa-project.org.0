Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746EA3A9A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 17:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E065F1658;
	Fri, 30 Aug 2019 17:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E065F1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567179725;
	bh=JUPqmSQhdMukpQ12Hw3phlqCwOIxKfh/CZUED9JYgrg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jX0URCocdoiuvnqgK+nA9bEzn/AsC6TSeaKGyNpFNPqWPwSXcNhyB2+ptl93G1vlC
	 cq3DQUDOMqK/JzTc4iMsedAnugaG0EqZiFykztogeVdgYbpYwuQuqC4SLhAwMR36AK
	 9wbg+HMsuK3FbILdBfWur7iEMUDPiocv94H6g6ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BB47F80376;
	Fri, 30 Aug 2019 17:40:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E3F6F80369; Fri, 30 Aug 2019 17:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC602F800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 17:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC602F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q9KQy+YN"
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50DA42342E
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567179612;
 bh=CUBbtf0vFE1nde+pP9wjLrp16M7oNNsE0ztDeDpMvyo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q9KQy+YNdu84KhVBk69egisbxRYLE/HKPlOTSlqZe57iWo9vMXok3Nmyx+Idugazf
 uov3Haq9DUc0OtxaHeHBGe5ogz0Y8J9pO6LPBo/1lZFqnddceSidF0FScV55z/uHN4
 jpB3TKCjA5zLCiBX0VbnE/apd1nrB3bQSyCG3Tz4=
Received: by mail-qk1-f174.google.com with SMTP id f13so6436555qkm.9
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 08:40:12 -0700 (PDT)
X-Gm-Message-State: APjAAAX17i/0cm7uDuOy7AGAZVRDhY1+NZeMSq81bMB9GCnqgPPu9liI
 DNU8Zr3ONjz1VxIjDJoddh54H0Dlp/nHXWc/xg==
X-Google-Smtp-Source: APXvYqz2kJmiA9uqtucgQvwHXjcvlcKaTwpYdryTknADMy0ucjESEufasarQtlB0mHHN2UX16jnnn8whJSasvKnnXPA=
X-Received: by 2002:a37:8905:: with SMTP id l5mr16254270qkd.152.1567179611442; 
 Fri, 30 Aug 2019 08:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190828125209.28173-1-mripard@kernel.org>
 <20190828125209.28173-4-mripard@kernel.org>
In-Reply-To: <20190828125209.28173-4-mripard@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Aug 2019 10:39:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMvKUu0hp6rSGn=KtPHGe++r4dYyAZcDfLgy16pUi2Bg@mail.gmail.com>
Message-ID: <CAL_JsqLMvKUu0hp6rSGn=KtPHGe++r4dYyAZcDfLgy16pUi2Bg@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 4/5] ASoC: dt-bindings: Convert
 Allwinner A23 analog codec to a schema
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

On Wed, Aug 28, 2019 at 7:52 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner A23 SoC and later have an embedded audio codec that uses a
> separate controller to drive its analog part, which is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../allwinner,sun8i-a23-codec-analog.yaml     | 38 +++++++++++++++++++
>  .../bindings/sound/sun8i-codec-analog.txt     | 17 ---------
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
> new file mode 100644
> index 000000000000..832779389cbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/allwinner,sun8i-a23-codec-analog.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A23 Analog Codec Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      # FIXME: This is documented in the PRCM binding, but needs to be
> +      # migrated here at some point
> +      # - const: allwinner,sun8i-a23-codec-analog
> +      - const: allwinner,sun8i-h3-codec-analog
> +      - const: allwinner,sun8i-v3s-codec-analog

enum is nicer than oneOf+const.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    codec_analog: codec-analog@1f015c0 {
> +      compatible = "allwinner,sun8i-h3-codec-analog";
> +      reg = <0x01f015c0 0x4>;
> +    };
> +
> +...
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
