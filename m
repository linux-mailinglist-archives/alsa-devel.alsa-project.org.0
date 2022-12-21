Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4A652E03
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 09:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58DF168F;
	Wed, 21 Dec 2022 09:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58DF168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671611691;
	bh=IH/aUiF/BpmJ627vGqgsWST4JqH+rgfTYmQspig5YKE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GFdke8MgM5h6mTu7QaEOzELasuJbikI9tDCKThs9CD3ymeBzDCLTLyD2zhqc1s2/j
	 1Avdv5JdTm+41Gyk9UDI4Hve8ScQClY/syJzdbQneSHQhD+VjtcfFwILJr/6bVCxdU
	 oSdHBNOHuW426afsoUxR+Vuz9oiMDIpr/d8c1VM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B1AF8047B;
	Wed, 21 Dec 2022 09:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A05F80022; Wed, 21 Dec 2022 09:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 893A4F80022
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 09:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 893A4F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bpuK+FAv
Received: by mail-lf1-x12a.google.com with SMTP id b13so22435848lfo.3
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 00:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4jOnWz0VXwNEogehp8TEQmKOcmuRvhCI8qQAKriBX3Q=;
 b=bpuK+FAvdpZKB26/wt1JafMHXpjWPu6SrtQB521/C1GQBY+89khxEjtcrN0hvFHSgF
 Ruo5SrwWq5YXqIfTvz+67cF2H57Jyp0Af53CJz/+XSiuloCfA28OoEAd6u6vqVbo0IvO
 Sdzt5pqenjwUdmY0n3lD7sh8fcUSPmVZleP2KbY4fXn2eiMWrFOSG880NikSFawtGMxz
 FMurIv1wYLU0xBV6YAHN+0Wh7T4SgAwYPwVkuy7aYeBSDyZ1EU/DX8eQJ50g848m34dG
 WjiiBguOAGiAq066YnD9jxoSaXq622gzMc+8Q9us/7SKPtlfe7RG/9Uo/mQ8PkY33USW
 KWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4jOnWz0VXwNEogehp8TEQmKOcmuRvhCI8qQAKriBX3Q=;
 b=wrudamlV7xzUlbz3RmT5Eaokay0vASLOkfbaSPExomlVB1jofs8EtbvQ+UbOrLfMTd
 +D3hCKpqUtKvJv/eYCixLfKKR8VLawFiSpg/9SJIn2freXxxGN1fAkMrC+WaeAfMGbCI
 ECKh62Dk/HN+9w0S074G8KIurtVOmW25mgkHJ8UKGmRUaLkljltV1Ab00B8rwbsMaZMg
 LIgm/AEqMP/joa/vTi/9UogH4rHZv9mirTItPyvlFounsIomyGaVUwYnZr9V3z5MnMMP
 TIj6izS+jDjwfait6iEp/FLtuXumuCfLmNuNWoalmSrQ/BQutmpvBVVbhU9H6QGXt/cV
 vrVQ==
X-Gm-Message-State: AFqh2ko1toNGLY+ErMogIyveDPOzUdWxQVX/nbtrLcriAF1bncWQlgCt
 aujMiIgU2BNDc9R6KVNQ9ZRRow==
X-Google-Smtp-Source: AMrXdXv66I16xM4fO2HPAgbHKarNPj8tCHsgBene27afY3kVvsY/yuv5VKVAjHf83A1uXNUAfPr4RA==
X-Received: by 2002:ac2:5bc5:0:b0:4ad:5fbb:a594 with SMTP id
 u5-20020ac25bc5000000b004ad5fbba594mr322404lfn.58.1671611612977; 
 Wed, 21 Dec 2022 00:33:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05651203e900b004b5a2a33972sm1777222lfq.40.2022.12.21.00.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:33:32 -0800 (PST)
Message-ID: <aa8a2251-b7e7-9c03-fcd4-9875302981e4@linaro.org>
Date: Wed, 21 Dec 2022 09:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221220123951.29959-1-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123951.29959-1-j-luthra@ti.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/12/2022 13:39, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> The following properties are still found in some old dts files, but will
> be ignored by the driver:
> - adc-settle-ms
> - assigned-clock-paranets, assigned-clock-rates, assigned-clocks
> - port
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      tlv320aic3x_i2c: tlv320aic3x@1b {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "ti,tlv320aic3x";
> +        reg = <0x1b>;
> +
> +        reset-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
> +
> +        AVDD-supply = <&regulator>;
> +        IOVDD-supply = <&regulator>;
> +        DRVDD-supply = <&regulator>;
> +        DVDD-supply = <&regulator>;
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      tlv320aic3x_spi: codec@0 {
> +        compatible = "ti,tlv320aic3x";
> +        reg = <0>; /* CS number */
> +        #sound-dai-cells = <0>;
> +
> +        AVDD-supply = <&regulator>;
> +        IOVDD-supply = <&regulator>;
> +        DRVDD-supply = <&regulator>;
> +        DVDD-supply = <&regulator>;
> +        ai3x-ocmv = <0>;
> +      };
> +    };
> +
> +...

Best regards,
Krzysztof

