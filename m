Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DD6D4092
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 11:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10C11FB;
	Mon,  3 Apr 2023 11:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10C11FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680514095;
	bh=5hPzvwjjmGWKcyti//c+MtakTz9TVSi5LyqZ6JpDq8Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D8beko/MF7S2MLchrO5tQas3iXN56Yc/htdg62LIs/fSKrrvtzslZ+uyNZg1b1z/d
	 X7kfS2YZkJnfGAp37if3wjdMNJYDs9y3e0UkvYHCWZlLOyzLcnuLL1k0Zqemg+DwaF
	 pxGbtSmWtqo8mwwNoaY0RiY1fiQsy77vOoiA/T+M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43DD0F80249;
	Mon,  3 Apr 2023 11:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61985F8024C; Mon,  3 Apr 2023 11:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3225EF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 11:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3225EF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xpMiEKFL
Received: by mail-ed1-x534.google.com with SMTP id h8so114651794ede.8
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680514032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4b4SRkNTi7aA5RsxyjabtzrbkWgqLGc4UDFk49yWJY=;
        b=xpMiEKFLNWeVcJLmzCya3bu5xzEbzDHDzrNVV5vS8tFY9ajwv6cWY2A2UNVMjNkX7v
         GXlue/uNn7km52Ykla9DqAloLPmTZFa6ZqY5d45OGwmeXAwmIJ+omcBTcw0BHcAi+w1c
         CAMldgQIJ9FWw4xX+Kh+/dXRa3GlUmQDiSvSYUxsrx2pgjiGSIPkOCPrG8T/+U6Xyj63
         7owdBrrqg37u2wifAX6kZcch85VBEuk3SVKvE43l0N27TMiCgDOLLwErA4Erf9ep8Q3E
         gGchMXZp2n5f8knEkmXbdOuAyMAbkl7Rnnen2c7vRm9ihCMjD1l9CSPadBfctaJB71Tk
         dyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4b4SRkNTi7aA5RsxyjabtzrbkWgqLGc4UDFk49yWJY=;
        b=V2KbUoRUcG90AHC0AI7cRGdxem6N6Dogh5KVk57L/+sFuyX7mQFR9Am2K/uHC5Fs8T
         WKF5LEWN3MUX/JEM+2nm2fLsWXmdMBatm24u01U+wDdFGAPJVwxDwWFqGyQHrf3W8tIZ
         qcrvHKf+iCwkSOksuttuvs/7Be5Gk9O3DFVsynC3tnQAoKAJsSdNUP/F8h2HuKUozqU4
         KSzBYX/VNVz3TaBshIAQC3qvd8kpo1ybfQVokk+2Ka1ds3Kh05dS42/h/Og3B865nbKJ
         64RlldAreVAOy6TVzRGVNrOZqapQzo1zBz0HOJmEo37XqzSYV6kd2YrXZ4sBZ4fsQnuM
         5hWA==
X-Gm-Message-State: AAQBX9db7CLwE/I54K6tFvDm0gDvZcU11bNUpix75C6qW2sunvdtpKnL
	JZKLU3F4TbvmB3+OPTG0oOWKcQ==
X-Google-Smtp-Source: 
 AKy350bwqQI0MXRnlC4S/ng3F4h1DZplWCGvZ3xcBVTSjsNaTfLgISLMjdnlhoXc2HzPAXCKvrD5fw==
X-Received: by 2002:a17:907:8d04:b0:947:d43f:8f06 with SMTP id
 tc4-20020a1709078d0400b00947d43f8f06mr8329489ejc.27.1680514032224;
        Mon, 03 Apr 2023 02:27:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id
 y18-20020a170906525200b0093f322187f0sm4253210ejm.189.2023.04.03.02.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:27:11 -0700 (PDT)
Message-ID: <9acb38db-bdef-bfc0-5de0-c248d45714ae@linaro.org>
Date: Mon, 3 Apr 2023 11:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8510: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230402205719.6728-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230402205719.6728-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D6QZGGHJT65JLNEJLXMMYF2OCHVBLE53
X-Message-ID-Hash: D6QZGGHJT65JLNEJLXMMYF2OCHVBLE53
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6QZGGHJT65JLNEJLXMMYF2OCHVBLE53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/04/2023 22:57, Saalim Quadri wrote:
> Convert the WM8510 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8510.yaml | 39 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8510.txt      | 18 ---------
>  2 files changed, 39 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8510.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
> new file mode 100644
> index 000000000000..f45dad0fbef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8510.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WM8510 audio CODEC
> +
> +description: |
> +  These devices support both I2C and SPI (configured with pin strapping
> +  on the board).
> +
> +maintainers:
> +  - Mark Brown <broonie@kernel.org>

This should be rather someone from Cirrus or their regular contact -
patches@opensource.cirrus.com.

Also missing $ref to dai-common.yaml

> +
> +properties:
> +  compatible:
> +    const: wlf,wm8510
> +
> +  reg:
> +    description:
> +      The I2C address of the device for I2C, the chip select number for SPI

Drop description, it is obvious.

> +    maxItems: 1

sound-dai-cells with const:0

> +
> +additionalProperties: false

This goes after required. Look at example-schema. Anyway this should be
unevaluatedProperties: false, after adding the $ref.

> +
> +required:

Missing compatible.

> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@1a {
> +            compatible = "wlf,wm8510";
> +            reg = <0x1a>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/wm8510.txt b/Documentation/devicetree/bindings/sound/wm8510.txt
> deleted file mode 100644
> index e6b6cc041f89..000000000000
> --- a/Documentation/devicetree/bindings/sound/wm8510.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -WM8510 audio CODEC
> -
> -This device supports both I2C and SPI (configured with pin strapping
> -on the board).
> -
> -Required properties:
> -
> -  - compatible : "wlf,wm8510"
> -
> -  - reg : the I2C address of the device for I2C, the chip select
> -          number for SPI.
> -
> -Example:
> -
> -wm8510: codec@1a {
> -	compatible = "wlf,wm8510";
> -	reg = <0x1a>;
> -};

Best regards,
Krzysztof

