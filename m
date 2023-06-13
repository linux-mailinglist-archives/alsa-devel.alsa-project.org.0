Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C972E197
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6212E851;
	Tue, 13 Jun 2023 13:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6212E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686655625;
	bh=AcjMq2Rl+H0PIGt2PSoRt3eTzmqJMDBvD3LJq4ClY7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cxzX/dxybzmd0O+4aYEbWKabwgGntpdOz2V7AE8tyzthYc/fP6IMxcuDguF3Kjr3P
	 lEW1OKvIDY1Csl4LPMbzHk4SET2W463qYWPPzxGCukYgzthA82Gf/fZXwu74xgKSlv
	 UGM6zrhgt7fycjgL8Fv9Yeqtcf+L6w6OCOTtCQAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7526FF8052E; Tue, 13 Jun 2023 13:26:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F344CF80132;
	Tue, 13 Jun 2023 13:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F88EF80149; Tue, 13 Jun 2023 13:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A21DCF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 13:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A21DCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lNhZVWQJ
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51873e43986so877529a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686655563; x=1689247563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxZ6Fqrfi2cMMSMAViqpb7jaNUE5MqfoSxIZcIQgJAg=;
        b=lNhZVWQJJcFRbzPuZKmhRJg5BKsYzf5QSNIi6tuaPQJlatEh6slm3faM7Wyszujhc9
         4rr+yJGh8O5G4pl/qcRNxesE5fPGWUtK/uFkq7xanZ7WnMfytPEzbrtruB6CzyZ0ifoA
         CPkBi+W6q268emPoS0ZiWClpIGGgUGdfgriXLhPEHC/PhbYsA6IPQmXw9RdRRTrXh29W
         dI43btoRKS5EdmvLeLFsfhCazzEHb1fT/pllNIIlkFnMN9He5GNOiZeh5xcsFvKaI1OZ
         BwD8BBo7qg6LilLjcgqjMQzi/duVeDklGOBGGULCQZInlaZk206ESFQh95fc/aAg6axD
         QHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655563; x=1689247563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxZ6Fqrfi2cMMSMAViqpb7jaNUE5MqfoSxIZcIQgJAg=;
        b=gFddLRENLvfDCi9vdW1JF7L76uondwzAYhN/5y0k37s3uMlpsEu8aAvGu+MHZ+CPg9
         6dRaEt+h0UdBpRtRutd8DRNOL5pJufTFkCsHh6OLWI+icbGlae/jDH+ldJcPQa/Dhc+M
         od4+d+7WSsryqiKbeAXkXmRbJKaK7xdXxdDyKv0ADnkva4rCQzF94CxoPC0tWPzl/d2C
         Y8o2+9/MKewmJpzwXiMqSi3mo0HAKhdSuGtLLPYdf9Fo/Ao4OlnpAEM7oKpKhOwigC87
         9ZDR83r7yKlRyE0J2AAj4J1k+rf0eULyYmao+un7lWjw2gfZP8bKXoPrkj+7kj8WpyTa
         633A==
X-Gm-Message-State: AC+VfDzx1nSAabfbGEOZ7Qn2/TyIwX4+BZbjilwgokUZB98W59xSKL8O
	Rai9a0KzBLJpxU/k9pr4qpuuMw==
X-Google-Smtp-Source: 
 ACHHUZ7XRANA1hIZ2bfFjOqgLiXrSL2yIMdblUbXWYP+hD/zhiX6bByb6ir8esTl9bROzmmntuvOfQ==
X-Received: by 2002:aa7:d901:0:b0:50d:8979:5722 with SMTP id
 a1-20020aa7d901000000b0050d89795722mr6174692edr.39.1686655563454;
        Tue, 13 Jun 2023 04:26:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 n27-20020a056402515b00b00502689a06b2sm6253637edd.91.2023.06.13.04.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:26:03 -0700 (PDT)
Message-ID: <3bf05cf5-de8f-27d5-343f-975293492a90@linaro.org>
Date: Tue, 13 Jun 2023 13:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VCNLGBOTONE4REGZQATU3EKKESFBJ7RO
X-Message-ID-Hash: VCNLGBOTONE4REGZQATU3EKKESFBJ7RO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCNLGBOTONE4REGZQATU3EKKESFBJ7RO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:15, Alexander Stein wrote:
> Convert the binding to DT schema format.
> Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> clocks & clock-names = "mclk" is mandatory, it has been added to required
> properties as well. '#sound-dai-cells' is added for reference from
> simple-audio-card.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---



> -	aic32x4-gpio-func= <
> -			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
> -			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
> -			0x04 /* MFP3 AIC32X4_MFP3_GPIO_ENABLED */
> -			0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
> -			0x08 /* MFP5 AIC32X4_MFP5_GPIO_INPUT */
> -		>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml b/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml
> new file mode 100644
> index 0000000000000..ebf84cdcb68d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tlv320aic32x4.yaml

Filename based on compatibles, so at least vendor prefix missing.

> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/tlv320aic32x4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TLV320AIC32x4 Stereo Audio codec
> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +
> +description: |
> +  The TLV320AIC32x4 audio codec can be accessed using I2C or SPI
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2505
> +      - ti,tlv320aic32x4
> +      - ti,tlv320aic32x6
> +
> +  reg:
> +    description: |
> +      I2C address or SPI chip select of the device

Drop description. Instead missing maxItems.

> +
> +  clocks:
> +    items:
> +      - description: Master clock
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  av-supply:
> +    description: Analog core power supply
> +
> +  dv-supply:
> +    description: Digital core power supply
> +
> +  iov-supply:
> +    description: Digital IO power supply
> +
> +  ldoin-supply:
> +    description: LDO power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: |
> +      GPIO used for hardware reset

Drop description, it's obvious.

> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  aic32x4-gpio-func:
> +    description: |
> +       GPIO function configuration for pins MFP1-MFP5.
> +       Types are defined in include/sound/tlv320aic32x4.h
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 5
> +    maxItems: 5
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - iov-supply

allOf goes here. Missing ref to dai-common.

> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      not:
> +        required:
> +          - ldoin-supply
> +    then:
> +      required:
> +        - av-supply
> +        - dv-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      codec: tlv320aic32x4@18 {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "ti,tlv320aic32x4";
> +        reg = <0x18>;
Best regards,
Krzysztof

