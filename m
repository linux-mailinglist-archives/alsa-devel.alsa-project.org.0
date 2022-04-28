Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D5512C52
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 09:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A5A829;
	Thu, 28 Apr 2022 09:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A5A829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651129633;
	bh=JJ58QTctyjgaKV9i6Cn3QJr3uRDiVT50KlC7K3dewB8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScDQUUpw8VScJoDN0/+eevwsytH4/hmpADUZY/UamfoYqdajRoVlc5x1tcFMIjY4q
	 M8dp8WWV1dJRA55ef5xekV7cQ3rTuShtMmtGkMDPrK8giEezVJKCAzDsy/yAZ4M200
	 XhCRIAKHjdJC3Eyr3p0aLFpMmxCfZHbTBa8GRvkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAEB9F800AE;
	Thu, 28 Apr 2022 09:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC233F800AE; Thu, 28 Apr 2022 09:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC1C0F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 09:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC1C0F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dnR8dRNU"
Received: by mail-ej1-x631.google.com with SMTP id m20so7630411ejj.10
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iBEhvrsPsOhgEt0Y1YW/HNHhU6vNHdiEta/57GlhVhk=;
 b=dnR8dRNUs7h9j/HKxlXNIA4lIpkFD31q+HvLJ/eKuI+nhJlW+YrFiWM9rP2CyoGaMS
 XeOLKlrYTjg5fMTkMESgKXIlyvnZ3oDuvVton7kAsZGNlZPnEjl2H2SPbwkktJTx7qCk
 ekfhcJMJmLtU2lITdXGqu4rePZT0Cb9pNkCEND2Na9cbucTF4Q1DTOawQPdvbwIMquid
 c672Ay3kWiDq9TOA+IELYO/uOyte64CA9KKzHDhPvgfQ9CVgHTohrIf+dryM44EkQPnl
 pk8oTToh1A+OPyPqUxfluHpdmEQUfAnKDlFUp7pvOy5qPgL8V4y45IAj37tfJG3qJQnj
 89YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iBEhvrsPsOhgEt0Y1YW/HNHhU6vNHdiEta/57GlhVhk=;
 b=g0bOHb0OsvCVRC0oSGBh/yQzpPlBd0Y7KBKGTcxOpIue3ZbnTXHiWBY0JnSodjGQri
 vB8dCyl6U8hVr+BUyO3thvEz/T96MffH6qgATcMh+b7LSUp/ghfmCAVPWHMDBe+kd0OP
 qxNvvaXqyc8huEAZNeGY0uUCDh9AO/DTqb6Pbp1bAlUKMR3wO3D720aGRwxF3BYBCQi0
 rAVmtKwG04t1hFY8hoWKoAV6PRSa2nT598x2ByYXFKzcfHV9B6SmZr4+qogIBeeVpHMj
 rmkSaG+Ir87WnejL75sg7C+uiJ/e/Czn7qi0aay3shcP5XJ9kw0V0hj/ZKW51logvF6i
 oJoQ==
X-Gm-Message-State: AOAM533kOM+Va6ryyXcMS3igwLm6C1381xgal/ebtIgxD5bTWxak+MhH
 QV+c2qIjcyZ3b63t4HxXrpqNow==
X-Google-Smtp-Source: ABdhPJyEMosMEvWv2NKcCdkzSlAn1WgtjIOSc3yBPtrlslz4hSKiE5Mxs0hwDpBfDpfO4Wx0jZmH/w==
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id
 o3-20020a170906288300b006e870124185mr30112996ejd.204.1651129564100; 
 Thu, 28 Apr 2022 00:06:04 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s23-20020a056402037700b0042617ba639bsm1010973edw.37.2022.04.28.00.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:06:02 -0700 (PDT)
Message-ID: <53e4eed4-16ae-95ce-967f-ed615158584d@linaro.org>
Date: Thu, 28 Apr 2022 09:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427112528.4097815-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On 27/04/2022 13:25, Andre Przywara wrote:
> The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
> a peripheral that provides communication with an audio CODEC.
> 
> Add a simple DT schema binding for it, so that DTs can be validated
> automatically.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/sound/amba-pl041.yaml | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/amba-pl041.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amba-pl041.yaml b/Documentation/devicetree/bindings/sound/amba-pl041.yaml
> new file mode 100644
> index 0000000000000..f00796d5ea473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amba-pl041.yaml

Filename: vendor,device, so "arm,amba-pl041" or "arm,pl041"

> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amba-pl041.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Ltd. PrimeCell PL041 AACI sound interface
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Arm PrimeCell Advanced Audio CODEC Interface (AACI) is an AMBA compliant
> +  peripheral that provides communication with an audio CODEC using the AC-link
> +  protocol.
> +
> +# We need a select here so we don't match all nodes with 'arm,primecell'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: arm,pl041
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,pl041
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: APB register access clock
> +
> +  clock-names:
> +    const: apb_pclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    aaci@40000 {

Would be nice to find here a generic node name, so "audio-controller"?
It's not a codec, right?

> +            compatible = "arm,pl041", "arm,primecell";
> +            reg = <0x040000 0x1000>;
> +            interrupts = <11>;
> +            clocks = <&v2m_clk24mhz>;
> +            clock-names = "apb_pclk";
> +    };
> +
> +...


Best regards,
Krzysztof
