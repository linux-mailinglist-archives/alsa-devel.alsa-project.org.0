Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474066C6C0C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 16:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B43DECB;
	Thu, 23 Mar 2023 16:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B43DECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679584570;
	bh=hCse1MpUBPapUf/FTQ7UDasLpBENrjlCa+gCSGqPihY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZFvstYFG753IcYnhmtIOx+nnCIghdzgzZLNERdMeiu7/Wn2hQ9VLts9x9EEyx3oUS
	 RAa5OxcgGNmI2iy25i0f5GXZA1c+B2k0PdpfQ+aBIwnXa3Ts6wod0pevMNasM6bMI5
	 28iZZfBrQZItnHbN1xF8msa04fSXU/F2S9See18c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB78F8027B;
	Thu, 23 Mar 2023 16:15:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6957F802E8; Thu, 23 Mar 2023 16:15:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44E0BF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 16:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44E0BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a9yJXmVY
Received: by mail-ed1-x536.google.com with SMTP id ew6so25091206edb.7
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679584506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0EIRlor9wN9UbhWdsh79YHQkDroJAzuUdmd2X+qriQ=;
        b=a9yJXmVYDeK0NwIHu2IpvL74NnIG0899faHFGDMQlG8vSHbEOejUzIgt0eogbaoQiU
         hlLIpsoKk6glSaVvbIf+Yj12Z6ycPS6erte8U77kqVNLYSVW/XRMb+4Qx33/gxDnknr2
         dZIKgEEdP6APYawwVA0zOJCj0/oAhGazZ+ELnvidtKXj57Xwf2anyencQLxMpcDBtVlZ
         LCDTVcJCpLDA79ilaf9E5z1hXRQOczmxdA2U8Hd+tlZ522QkWp1+cEpRozgb3Pmdq5i/
         Q2eOGz89jQ1AHUNUgFL7FN2Hel1yuoS26IZhfm/m3ibo2OnWzIe1zK8PxNQMAO42oYCj
         C5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679584506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0EIRlor9wN9UbhWdsh79YHQkDroJAzuUdmd2X+qriQ=;
        b=bVDNk/oEJSvGY9ntxSubaV3kk3vuCztFGbPBJk3f3lgPFFEEXI3WqMzwfWjkH6B6zg
         RYWuahxKlIaKzyy3LH5TJThX4KRasrY8bW3ke7O5qgoiFUB/cw5JNbAZ4edB5f+skWoU
         SE4peR+BwYlBCwh6a3/hYPhZr7VyLOKk5Cmp3sN3+fndn3Fkgl7KQJZwo7eFxE/hbt5V
         BmuU2yQgXwPN3C11MwjWx3GH5z0PZJf+54wknMz8OmnhP6z3iu4r+Lu8OQAMD4fLiCPP
         U0I5zW0N8v0d+FTXEx+9eGeOXFd+Hwr2kcUqkWbYK4scEh4cPEmdOr5S57JjTdjUasgV
         3W1Q==
X-Gm-Message-State: AO0yUKWCYAVn+3cxG/jyEY2oNPdFhtagOkITqXx6mF51m/oP4rfCV9mN
	G79egmPA9ROLPFZrf0ao+qr40w==
X-Google-Smtp-Source: 
 AK7set8gtYX838jmT3vkdbM6ajyzGH8Lai6OGJWibken05c+x+1ZWKC1tz/RH7h9iUeekgQDHZHt3g==
X-Received: by 2002:a17:906:28c9:b0:934:8043:ebf8 with SMTP id
 p9-20020a17090628c900b009348043ebf8mr10909795ejd.26.1679584506221;
        Thu, 23 Mar 2023 08:15:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d350:23b1:cb94:f39d?
 ([2a02:810d:15c0:828:d350:23b1:cb94:f39d])
        by smtp.gmail.com with ESMTPSA id
 gz14-20020a170906f2ce00b00923221f4062sm8777740ejb.112.2023.03.23.08.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:15:05 -0700 (PDT)
Message-ID: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
Date: Thu, 23 Mar 2023 16:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230323130511.16367-1-danascape@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323130511.16367-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MFZW75DSE57VBSLAIUTK4B5R5YE2LI3P
X-Message-ID-Hash: MFZW75DSE57VBSLAIUTK4B5R5YE2LI3P
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFZW75DSE57VBSLAIUTK4B5R5YE2LI3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 14:05, Saalim Quadri wrote:
> Convert the ALC5632 audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>


Thank you for your patch. There is something to discuss/improve.


> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,alc5632.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ALC5632 audio CODEC
> +
> +description: |
> +  Pins on the device (for linking into audio routes):
> +      * SPK_OUTP
> +      * SPK_OUTN
> +      * HP_OUT_L
> +      * HP_OUT_R
> +      * AUX_OUT_P
> +      * AUX_OUT_N
> +      * LINE_IN_L
> +      * LINE_IN_R
> +      * PHONE_P
> +      * PHONE_N
> +      * MIC1_P
> +      * MIC1_N
> +      * MIC2_P
> +      * MIC2_N
> +      * MICBIAS1
> +      * DMICDAT
> +
> +maintainers:
> +  - Liam Girdwood <lgirdwood@gmail.com>

This should not be subsystem maintainer but someone related to the
device. It's maintainer or interested contributor. Unless that's the
case here?

> +
> +properties:
> +  compatible:
> +    const: realtek,alc5632
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        alc5632: alc5632@1a {

Node name: codec
and drop alc5632 label

> +            compatible = "realtek,alc5632";
> +            reg = <0x1a>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };

Best regards,
Krzysztof

