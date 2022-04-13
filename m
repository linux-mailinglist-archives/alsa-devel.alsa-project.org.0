Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDB4FF8AE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 16:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A8817EE;
	Wed, 13 Apr 2022 16:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A8817EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649858993;
	bh=27jv6XOsc47PVuYDj00wkMKXupYXVSq/r9E9ogOtkFw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z4mWBLY6aWN2Z8FFZ93hRtWsTljSTPcq9WrkPv5BO+StjlOcbOY1IdcL1PkCSqsuv
	 SiMkkkbgajtbS5E4bVm/9u3Lf2X4DdKqsep0qTlPeCEinZYdMukhNSimD5DnylE19y
	 4d7Mz16EbMPrhao48tvXXmWLlaovbJ/RCGYJyVqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45158F80124;
	Wed, 13 Apr 2022 16:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C0AF80248; Wed, 13 Apr 2022 16:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73054F80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 16:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73054F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RRzY9iqi"
Received: by mail-ot1-x334.google.com with SMTP id
 i23-20020a9d6117000000b005cb58c354e6so1229119otj.10
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V7pjazVef+DOYF0C0vXfWeCRJdWePXo1vwtP6FRieUk=;
 b=RRzY9iqiEBjIxfZsXWX6JNs/IOVhZyL1kBtF1NGpWtG4WfeiwwPg+yZg7jqvF4aWHf
 CMy3Ckx7Pu8VMWoTiuYMakxw9j660enbSyf5rBCO8cl4XEDu/HOI7ryp0R3s+ZBp2qEX
 SNL7Qmd1z3nZJ1qbD8HDItvjHgfVXakCyAVBywLbN7X/FGlFyaJz+d5PvjzH7vXK3muk
 BcNJqkLOSMIoEoniBn0G3tXC1wV+S5rJeXYXqjTBbTq5FQzOG/VKpuk450N5A9OQ8wj1
 gmbEipZle3FVAK2RGuLGhZgYCp2sjt/Rjtff2xiD4VDqrUFKGeVdf6XrQyjalqlg/nvU
 2A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=V7pjazVef+DOYF0C0vXfWeCRJdWePXo1vwtP6FRieUk=;
 b=dEaAretc+DSWzIIKkVKQJB1p5HQinjyK0qr0IwjUvmnxo+lXhHCJg67xf+eVxnZs+k
 6002Gby5qK75TxH0LIW8MwshOCuXIV+y5vFYGowHkAQIhln8+2WbO6AErYi4FO+rgGMk
 09ruRkQocML5mVmPnB9c1TW2/KyvpraLkdw/c6m2yl5e/7mj+405XhVDbgqivB1KfjMp
 wfVj0Jp1/rpzkKL4bor5ti5nCRp4beOnDcAqBRQKKcl7JlchMaPHyVDPBpMTq8MX9Pss
 8PaWD+A72gs0dgIg7r6IV+LcwXa2i0Od1tqhwSTrVWeGmTHieYOF87BtNC66yuwbwTBC
 B6+Q==
X-Gm-Message-State: AOAM531njJn03QKt/Vo5A2Imtz+xiTbiHovykbpoGMrTm7JfATRHYZ0W
 XKvqa1yiU62c3fKYkoHtb9E=
X-Google-Smtp-Source: ABdhPJy1DrnrepGB5CIyKFQ9qwuH9a+TUnwLgD7Bxt7ac/cp5F6MDKiCm/tj1hqMjocWbdXBVgAwmA==
X-Received: by 2002:a05:6830:1012:b0:5b2:36d1:f15d with SMTP id
 a18-20020a056830101200b005b236d1f15dmr14494741otp.219.1649858922171; 
 Wed, 13 Apr 2022 07:08:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e9-20020aca3709000000b002ed1930b253sm13604917oia.30.2022.04.13.07.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 07:08:41 -0700 (PDT)
Date: Wed, 13 Apr 2022 07:08:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
Message-ID: <20220413140839.GA2398533@roeck-us.net>
References: <20220413140121.3132837-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-iio@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-hwmon@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Agathe Porte <agathe.porte@nokia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Apr 13, 2022 at 09:01:21AM -0500, Rob Herring wrote:
> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints under
> 'items' moved up a level.
> 
> Cc: Agathe Porte <agathe.porte@nokia.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-hwmon@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml       | 5 ++---

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 +---
>  Documentation/devicetree/bindings/media/coda.yaml            | 1 -
>  .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml   | 2 --
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml   | 2 --
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 1 -
>  .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml | 4 +---
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --
>  8 files changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> index 801ca9ba7d34..e7493e25a7d2 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> @@ -58,9 +58,8 @@ patternProperties:
>            The value (two's complement) to be programmed in the channel specific N correction register.
>            For remote channels only.
>          $ref: /schemas/types.yaml#/definitions/int32
> -        items:
> -          minimum: -128
> -          maximum: 127
> +        minimum: -128
> +        maximum: 127
>  
>      required:
>        - reg
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 7c260f209687..952bc900d0fa 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -108,9 +108,7 @@ patternProperties:
>            - [1-5]: order 1 to 5.
>            For audio purpose it is recommended to use order 3 to 5.
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        items:
> -          minimum: 0
> -          maximum: 5
> +        maximum: 5
>  
>        "#io-channel-cells":
>          const: 1
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> index 36781ee4617f..c9d5adbc8c4a 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -65,7 +65,6 @@ properties:
>    iram:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle pointing to the SRAM device node
> -    maxItems: 1
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index 9b179bb44dfb..aa55ca65d6ed 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -63,13 +63,11 @@ properties:
>  
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to vpu.
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to scp.
>  
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index e7b65a91c92c..2746dea3ce79 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -55,13 +55,11 @@ properties:
>  
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to vpu.
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to scp.
>  
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 7687be0f50aa..c73bf2352aca 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -61,7 +61,6 @@ properties:
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description: |
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> index 2424de733ee4..d99a729d2710 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> @@ -104,8 +104,7 @@ properties:
>    qcom,smem-state-names:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: The names of the state bits used for SMP2P output
> -    items:
> -      - const: stop
> +    const: stop
>  
>    glink-edge:
>      type: object
> @@ -130,7 +129,6 @@ properties:
>        qcom,remote-pid:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description: ID of the shared memory used by GLINK for communication with WPSS
> -        maxItems: 1
>  
>      required:
>        - interrupts
> diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> index b104899205f6..5de710adfa63 100644
> --- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> @@ -124,7 +124,6 @@ properties:
>      description: |
>        Override the default TX fifo size.  Unit is words.  Ignored if 0.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    maxItems: 1
>      default: 64
>  
>    renesas,rx-fifo-size:
> @@ -132,7 +131,6 @@ properties:
>      description: |
>        Override the default RX fifo size.  Unit is words.  Ignored if 0.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    maxItems: 1
>      default: 64
>  
>  required:
