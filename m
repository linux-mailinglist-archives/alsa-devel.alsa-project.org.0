Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE1587E64
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 16:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C7A1E4;
	Tue,  2 Aug 2022 16:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C7A1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659451877;
	bh=ZOHsxZ3AWYgaq1AcD2ILhtYP139daT9WA9Xhmve9wg8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCj+MwEL/nQecxyGKmepHsXcf5vjNcidsjcU8OkIIvfgnzeziYUAyqbPkqqX5riDC
	 4wsSMIVeJd565+Ol69g/Xlz2v+MfsKWw+CME2O87J9ht9unUa720Ed67S9AoaP1oc3
	 iDJO5kWNE10F35bcMbiuiiFOVPoW9pDVwtpAKgBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD641F800B8;
	Tue,  2 Aug 2022 16:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA218F8026A; Tue,  2 Aug 2022 16:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4858F80115
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 16:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4858F80115
Received: by mail-il1-f172.google.com with SMTP id g18so7115582ilk.4
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 07:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=e4JWei8BMxaRFQiwirEOpStmVsY2WsRWjYgax2kVdRc=;
 b=rfIZIUY77qMHCq4Sp43vyvTiWTAcWKDD8wOdAezHQkM6FyZk2d95YJGQgdcb5doevt
 zFstIQiD1E5VnN7niANQnUjYV69Gd85w+lDN7FJldMn+2AMR+i4LtdafNIXicjzw6HXW
 xhe/RRgH8Ir5j7BLzEkEzEfE9ccAunCZMs9PZ+jKN/iG3YHlJTL0D2+c/md9ZjFiKbeY
 N6cNzWQc2TEmflhU2o9MkXmuH9nnubvo5E8J/ZlbdBg7SIdXuWUqeAXX1E/0P6TgohZa
 Nv+dG2d80Zm8tcuOeYv3qq3jaX1Hqi6w8hkNR4IyIJw4jjgG+Dh8rD9RM2D9kz6BEVkM
 yxOw==
X-Gm-Message-State: ACgBeo0q84RfepKTtDNucshqd5q2HayoSomDp88pvag8vSxzOgInsCSn
 cA4zpTppCe9pQDlV1OAr4w==
X-Google-Smtp-Source: AA6agR47+EjReEzIB4sp12jVe0PEjtgf7L/ATJqstogXhzbClxWHyciERfQXiINmgx7Mxoh8x+JmqQ==
X-Received: by 2002:a05:6e02:1a6f:b0:2de:b54a:1ce4 with SMTP id
 w15-20020a056e021a6f00b002deb54a1ce4mr3250938ilv.284.1659451810001; 
 Tue, 02 Aug 2022 07:50:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a02cf0b000000b0033f3dd2e7e7sm6481253jar.44.2022.08.02.07.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 07:50:09 -0700 (PDT)
Received: (nullmailer pid 85864 invoked by uid 1000);
 Tue, 02 Aug 2022 14:50:08 -0000
Date: Tue, 2 Aug 2022 08:50:08 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add sample format conversion
Message-ID: <20220802145008.GB30116-robh@kernel.org>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1659370052-18966-3-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On Mon, Aug 01, 2022 at 09:37:31PM +0530, Sameer Pujar wrote:
> Presently "convert-channels" and "convert-rate" DT bindings are available
> for channel and rate fixups respectively.
> 
> Similarly add "convert-sample-format" binding to fixup DAI sample format
> as well. This is added to simple-card and audio-graph based sound cards.

Do you have users for both cases?

> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml |  4 ++++
>  Documentation/devicetree/bindings/sound/audio-graph.yaml      |  2 ++
>  Documentation/devicetree/bindings/sound/dai-params.yaml       | 10 ++++++++++
>  Documentation/devicetree/bindings/sound/simple-card.yaml      |  4 ++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 30a644d9..8e64192 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -22,6 +22,8 @@ properties:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>    convert-channels:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
> +  convert-sample-format:
> +    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>  
>  patternProperties:
>    "^endpoint(@[0-9a-f]+)?":
> @@ -67,6 +69,8 @@ patternProperties:
>          $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>        convert-channels:
>          $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
> +      convert-sample-format:
> +        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>  
>        dai-tdm-slot-width-map:
>          description: Mapping of sample widths to slot widths. For hardware
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> index a9cd52e..93ddd55 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> @@ -30,6 +30,8 @@ properties:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>    convert-channels:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
> +  convert-sample-format:
> +    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"

Can someone explain why we need these properties defined in 3 different 
locations? That's not a great pattern to continue.

>  
>    pa-gpios:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/dai-params.yaml b/Documentation/devicetree/bindings/sound/dai-params.yaml
> index aae60cb..933957d 100644
> --- a/Documentation/devicetree/bindings/sound/dai-params.yaml
> +++ b/Documentation/devicetree/bindings/sound/dai-params.yaml
> @@ -19,6 +19,16 @@ properties:
>      minimum: 1
>      maximum: 32
>  
> +  dai-sample-format:
> +    description: Audio sample format used by DAI
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - s8
> +      - s16_le
> +      - s24_le
> +      - s24_3le
> +      - s32_le
> +
>    dai-sample-rate:
>      description: Audio sample rate used by DAI
>      $ref: /schemas/types.yaml#/definitions/uint32
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index ab03a2b..ec21190 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -183,6 +183,8 @@ properties:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>    simple-audio-card,convert-channels:
>      $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
> +  simple-audio-card,convert-sample-format:

Don't add more properties with 'simple-audio-card,' prefix. That's not a 
pattern we want to be consistent with...

> +    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>    simple-audio-card,prefix:
>      $ref: "#/definitions/prefix"
>    simple-audio-card,pin-switches:
> @@ -226,6 +228,8 @@ patternProperties:
>          $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>        convert-channels:
>          $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
> +      convert-sample-format:
> +        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>        prefix:
>          $ref: "#/definitions/prefix"
>        pin-switches:
> -- 
> 2.7.4
> 
> 
