Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD257142C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 10:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFACE161E;
	Tue, 12 Jul 2022 10:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFACE161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657613728;
	bh=DaO1SaCB2QJ8BzyVMTk36CTssf38LA8aDs4v44hjeVk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDQE796MloBSbHM/g/ojs+xxgsJULxlGI/Hxhh+yTAQG5Sd+ZqVuUm1mS6k0JRNje
	 hhu3EMOe6HD+WE8p54KSlYyovxfC13PgHewdzhJ54AI1o/CKmLg2t7UHbSXRUmMFiT
	 peVcSBALihLMP2DJfhO5tvV3/DEgoqxJMVb+SKz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B018F800E8;
	Tue, 12 Jul 2022 10:14:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94B7BF80246; Tue, 12 Jul 2022 10:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 749B9F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 10:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 749B9F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="StLfu8nw"
Received: by mail-lf1-x136.google.com with SMTP id bu42so12722786lfb.0
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=piVMAlOpffJwid9tZ0g858Wy2lJidXX23spAtayy7OI=;
 b=StLfu8nwjSGQBtoVu4xYBsPLaD86GA58kvcFstln0NzGJ/tDTYxbzgh3KFuopdgHNF
 fK+aRHHn5QwzVLgwmscm7kPdZVWj+Lyj+G6BTDqzEVOJMulJ+zd4o8+JeCOdURYADhdN
 dJCsIuavIfqIWAzB5j1VjwTnovlSzB+zyXJM5URY8uDY5idEMKcQGkhk7QT6ka1njyOs
 gXDpjtdnsNFSHZQh59Az9HtdqoLcByUS4I9wjlO4d2zx4Q5iGdnSiL+FyuVfIbPlvJOO
 oD26l4vQ80PEHbSKsVUliv8Ke8if2qF42yz+10hJLfWg54eG43XGUooXN25VQE3E2Fkd
 ugfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=piVMAlOpffJwid9tZ0g858Wy2lJidXX23spAtayy7OI=;
 b=wDw74y08FGPCU0BCP39NsKZoVid1DWRpuAAEwhje0p1Q6JG0ruPrgb65n6BovFWxor
 1sQ+9HQjvUuJi+DlrceJASnGTp3d/Rjo1iNDWjKVdH19zPUpffSRHwdizmm0QvGX+3Jx
 3eYfk+DJyyghoSrG5M6GeYZxjRqw6LSsbIgqOeU+/67FG2ISxwAJdAQ/51l+EkvVDT9e
 TtLDAOjtAK0B/2fzts0ydJgfEF1CKg7ZfAbYEd/nSvC1fNmza0PRFNt8gastt6sBoF5p
 uCJ73vG1Ke6LUtOt73OkGVMDmhfUEKrrHYIc4YxUJemvWlgZ/iOexROoLlkRKdxe8qMG
 WvXw==
X-Gm-Message-State: AJIora8q7v/65obEYtqbxIejbP/GD5a2Ib2iKH3CqItW0PVr+FgXXDWO
 K9Xx+vkYF+onKk+GD3Y8wlSNnQ==
X-Google-Smtp-Source: AGRyM1vqqp5s0BWN1F/7Lz3d6Rxo5GmlvLhM0XjExtACcM8zjS7RAxUFqyw3vof8bqYboTmuemBL4g==
X-Received: by 2002:a05:6512:2345:b0:489:e76e:cc1a with SMTP id
 p5-20020a056512234500b00489e76ecc1amr3619483lfu.219.1657613656558; 
 Tue, 12 Jul 2022 01:14:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05651c02ce00b0025d754ba5f4sm639397ljo.99.2022.07.12.01.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:14:16 -0700 (PDT)
Message-ID: <1d048162-8051-f95b-c359-0ab59e32e507@linaro.org>
Date: Tue, 12 Jul 2022 10:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] dt-binding: sound: atmel,pdmic: Convert to
 json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
 <20220711183010.39123-3-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711183010.39123-3-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 11/07/2022 20:30, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert Atmel PDMIC devicetree binding to json-schema.
> Change file naming to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> v1 -> v2:
> - Fix title.
> - Removed trivial descriptions.
> - Fix formatting.
> 
>  .../bindings/sound/atmel,sama5d2-pdmic.yaml   | 98 +++++++++++++++++++
>  .../devicetree/bindings/sound/atmel-pdmic.txt | 55 -----------
>  2 files changed, 98 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
> new file mode 100644
> index 000000000000..88fa92a30147
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/atmel,sama5d2-pdmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel PDMIC decoder
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
> +
> +description:
> +  Atmel Pulse Density Modulation Interface Controller
> +  (PDMIC) peripheral is a mono PDM decoder module
> +  that decodes an incoming PDM sample stream.
> +
> +properties:
> +  compatible:
> +    const: atmel,sama5d2-pdmic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: peripheral clock
> +      - description: generated clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: gclk
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx
> +
> +  atmel,mic-min-freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The minimal frequency that the microphone supports.
> +
> +  atmel,mic-max-freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximal frequency that the microphone supports.
> +
> +  atmel,model:
> +    description: The user-visible name of this sound card.

In previous properties the description was the last one, so keep it
consistent.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    default: PDMIC
> +
> +  atmel,mic-offset:
> +    $ref: /schemas/types.yaml#/definitions/int32
> +    description: The offset that should be added.
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - dmas
> +  - dma-names
> +  - clock-names
> +  - clocks
> +  - atmel,mic-min-freq
> +  - atmel,mic-max-freq
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/dma/at91.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pdmic: sound@f8018000 {
> +    	compatible = "atmel,sama5d2-pdmic";

Wrong indentation. I already asked for this.


Best regards,
Krzysztof
