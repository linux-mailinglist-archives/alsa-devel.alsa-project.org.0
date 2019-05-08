Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CD180B9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 21:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69871AB3;
	Wed,  8 May 2019 21:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69871AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557345252;
	bh=8LobMfXi2+uUffjBcguMQNs05RmS/jpj4x9MAVaybFE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fx1JugGc0thLVS/tzZZtP1DudX8KoX48LDE7oQWsDGDxyxU5Th9weRaRzAN8gy4pY
	 D8R8rx3cjwfJ1adOlEyQG6phiuGAuwamRuU0cbtW7Lt0ENBTUoWsGIrItdP0bFcPF5
	 4ynMnK1x1VrEhRP0XvhMppjJaspkLNfy87G4S8NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C2E2F896FF;
	Wed,  8 May 2019 21:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A23EF896F0; Wed,  8 May 2019 21:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CA0F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 21:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CA0F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qis8XcF0"
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7431721744
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557344123;
 bh=mphS1ZN+kXNeKFWy1pdoLamsdXu3KBM/8iy2Ccq1Jww=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qis8XcF09odtVtYH48hq892KgXbEy2WFYjgITzLgPd/MhviV3TODGnumc5xgy4zz1
 Dl93P6CJHOMqwvU4+fWCNgxaqCsADXphF/ii+5AYJrk7PyfyGe0oDXYj0EmBVX21Fc
 BvhILC//l4J2vSVC4rCVjprIovyUqdXFlelxVU54=
Received: by mail-qt1-f182.google.com with SMTP id c13so24627327qtn.8
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 12:35:23 -0700 (PDT)
X-Gm-Message-State: APjAAAXXRMWz/Z01D1bR5NnqcwDNHE0Q0kzKjSmoVn7xCj00pzBeJQA/
 49r0o3aSauWpPFiV9fmxCnDAq8l0asWY1da/Rg==
X-Google-Smtp-Source: APXvYqwTXK9BQC3/v8jqMr3QUXehY36ghelKZ/C7r+S4saAFToONVr37WTIeh/DAe2dCDHllum/rv91d81sXjmRd9Dc=
X-Received: by 2002:aed:306c:: with SMTP id 99mr32486801qte.38.1557344122609; 
 Wed, 08 May 2019 12:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <dc84c7e9ce272109052f553a5e050bfe1a09e9d6.1557252411.git-series.maxime.ripard@bootlin.com>
 <d9afb19c32f8b9b2c40c8d4c0c3df74bff0ccf35.1557252411.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <d9afb19c32f8b9b2c40c8d4c0c3df74bff0ccf35.1557252411.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 May 2019 14:35:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+iLmzti5TX-TUU3PN4taC66UMqHMk-aKTjZKt1kVRtMQ@mail.gmail.com>
Message-ID: <CAL_Jsq+iLmzti5TX-TUU3PN4taC66UMqHMk-aKTjZKt1kVRtMQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 2/2] dt-bindings: sound: sun4i-spdif:
 Document that the RX channel can be missing
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

On Tue, May 7, 2019 at 1:07 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The H3 and compatibles controllers don't have any reception capabilities,
> even though it was never documented as such in the binding before.
>
> Therefore, on those controllers, we don't have the option to set an RX DMA
> channel.
>
> This was already done in the DTSI, but the binding itself was never
> updated. Let's add a special case in the schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - switch to a draft7 conditional
> ---
>  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml | 45 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
> index 5698e5de5e31..8f1bc1a1af96 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
> @@ -44,15 +44,8 @@ properties:
>        - const: apb
>        - const: spdif
>
> -  dmas:
> -    items:
> -      - description: RX DMA Channel
> -      - description: TX DMA Channel
> -
> -  dma-names:
> -    items:
> -      - const: rx
> -      - const: tx
> +  dmas: true
> +  dma-names: true
>
>    resets:
>      maxItems: 1
> @@ -70,6 +63,40 @@ allOf:
>        required:
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun8i-h3-spdif
> +
> +    then:
> +      properties:
> +        dmas:
> +          maxItems: 1

In this and below, these should get added automatically by
fixup_schema. If not present, we set minItems/maxItems to the size of
the items list. It look like you added support for that, so left over
from before you addressed that for if/then/else?

> +          items:
> +            - description: RX DMA Channel

s/RX/TX/

> +
> +        dma-names:
> +          maxItems: 1
> +          items:
> +            - const: tx
> +
> +    else:
> +      properties:
> +        dmas:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: RX DMA Channel
> +            - description: TX DMA Channel
> +
> +        dma-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: rx
> +            - const: tx

I'm really on the fence whether it's worth it to add all this just add
the restrictions based on the compatible. I guess with copy-n-paste
this would be a common error.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
