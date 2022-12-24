Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECE655A3A
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 14:19:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CE5B3ED;
	Sat, 24 Dec 2022 14:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CE5B3ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671887959;
	bh=x5A5/rsOUW/FEQWGhJwxEkUjRAt0UhPQ6owLEhvGtys=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=emdlrEGt1w2l4s8YcoawVclyGibHei/5LnotnI0CKVVV4SkNa6YdmSG/PuB2oIwFo
	 XjRzxHXzj/dKh0aj0XoezPmkzNN7bUXfVCVm1DAGgEB5mjwLvjQ0zYqOezSvgxXyde
	 R60kozvzKRONM8FKjzNi827aKTi5XKv/KkemkbnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271FBF80245;
	Sat, 24 Dec 2022 14:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8501F80423; Sat, 24 Dec 2022 14:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B689DF80249
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 14:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B689DF80249
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UDfZ8mow
Received: by mail-lf1-x133.google.com with SMTP id m29so10348597lfo.11
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTPdWiUupXlyk+9L8fDSvUwO/gVy17QntHOoXtMHl9c=;
 b=UDfZ8mowsaoGBq8dza6YN/C+3RaSd8ZarIN9XC0ZfQfeBgfDQNwwl7kIDXJxoA3ddy
 RYXzrMeVtidmbzawMyOF5SdIwYSsiBpsrsD6f9/5p8L9UnC67btQkRg3JXEw/XAvMmXD
 YfDtc24BlPn/5vAO8zpIgbfNUZ/onnWxF+A0reKtD6XhX2T18J48pxe+Hw7OoMiL+49p
 AOHZzqgSDgO8SuTmyb6Xst3GgBuC1XIoVwI2sXlAk2P4FkyoOhvqR0C2Dpf/nz3PChtk
 6IbZQfWuuoGHXpo2aj9X7U1XeOlLcprH7keUzBwZiW5Nld/tXkeH/YXhc1fbCpj+eIxu
 zdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTPdWiUupXlyk+9L8fDSvUwO/gVy17QntHOoXtMHl9c=;
 b=iTrKoWB2gneGfMFVKRpGZIdMUlQWge1DoyL2ybRJuH3a4zTwsVY49P7SdEg+FxFnkD
 +YagDD9/oJORZZZv06JbjEgFn6Q4iAjyxjoh4QakRiOIXU8unGcPyoEknWidwHDD57jK
 r8opiWc0WFQxZQkC2k287AggkHHSiP6WVJDKbarLNWL6pOlVq8JsvQEUqhH4FZwCTyWe
 1LfLFDV/+szS00IFVHMGcPhpt+Mpu0EjcPDppq3Pl6c6LYSXd65FQTvgnMkWJjGeYHpZ
 12emDhho2q/dsQUPDZUP8c+XhcX6Il3IvYpMThV2ns6iqdyoUJ8Y9Iby9dl9tDR1Prx2
 SVDw==
X-Gm-Message-State: AFqh2kpFUQ8AROJ/g58lsPCM9zTvCws3VnQ5cnJD0I+2qnNIzaqfCZOI
 XTKbsXcd3p7OCSE/IG197T93xA==
X-Google-Smtp-Source: AMrXdXvm2iNA4DpQ7kdLXs0ilYmwia82uEkbiTRdL09Xr6Qfdc2+EyWkQsESLcVNOmoQuvKeeP2dew==
X-Received: by 2002:ac2:5604:0:b0:4a4:68b9:19da with SMTP id
 v4-20020ac25604000000b004a468b919damr3114277lfd.2.1671887895687; 
 Sat, 24 Dec 2022 05:18:15 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y35-20020a0565123f2300b00497ab34bf5asm944175lfa.20.2022.12.24.05.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 05:18:15 -0800 (PST)
Message-ID: <f7aa21e3-0c1c-8450-ee00-09162f1c59be@linaro.org>
Date: Sat, 24 Dec 2022 14:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
References: <20221223170404.210603-1-francesco@dolcini.it>
 <20221223170404.210603-2-francesco@dolcini.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223170404.210603-2-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/12/2022 18:04, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Convert nau8822 devicetree binding to dtschema.
> Change file name to match dtschema naming.
> 
> Cc: David Lin <CTLIN0@nuvoton.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/sound/nau8822.txt     | 16 --------
>  .../bindings/sound/nuvoton,nau8822.yaml       | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8822.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nau8822.txt b/Documentation/devicetree/bindings/sound/nau8822.txt
> deleted file mode 100644
> index a471d162d4e5..000000000000
> --- a/Documentation/devicetree/bindings/sound/nau8822.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -NAU8822 audio CODEC
> -
> -This device supports I2C only.
> -
> -Required properties:
> -
> -  - compatible : "nuvoton,nau8822"
> -
> -  - reg : the I2C address of the device.
> -
> -Example:
> -
> -codec: nau8822@1a {
> -	compatible = "nuvoton,nau8822";
> -	reg = <0x1a>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> new file mode 100644
> index 000000000000..10464170a98f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8822.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAU8822 audio CODEC
> +
> +description: |
> +  24 bit stereo audio codec with speaker driver.
> +  This device supports I2C/SPI. Currently, only I2C bus is supported.

I would skip the last sentence - bindings are independent of OS, so the
sentence might be not true in different systems/versions.

> +
> +maintainers:
> +  - David Lin <CTLIN0@nuvoton.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nau8822
> +
> +  reg:
> +    maxItems: 1
> +
> +additionalProperties: false

Please put "additionalProperties" after "required:".

With above (or even without these):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

