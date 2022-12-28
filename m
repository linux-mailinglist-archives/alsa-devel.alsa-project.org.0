Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AF657A06
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 16:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45AE38637;
	Wed, 28 Dec 2022 16:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45AE38637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672240028;
	bh=1lGr1SVuK/8F6ymkwiXCoKCWuYE6I5glKsW+hZnzsbg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IvS/jplODzZF5NgOSYlmz9intrT5y/56pUMX1o9McFZ4tCf850LyCujx8Fjq6MWCQ
	 hX34VBDbhY0DzvIPtygH8zzbdhQ2VLzu/wYX9Hb5nRtah6bW2AfHaGeFJiC9sV2v1u
	 2FjICqvoqZRHN/TIcQ+nXFN3IsHU2r6qbpUNkLwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B51CF800F0;
	Wed, 28 Dec 2022 16:06:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F56CF8042F; Wed, 28 Dec 2022 16:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4BFCF800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 16:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BFCF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ucg0KAua
Received: by mail-lj1-x22a.google.com with SMTP id bn6so6874772ljb.13
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzSUnApml1On80n7HfJBsepysNXlW5SfzG3qgcD+3YY=;
 b=Ucg0KAuaFVS6RZhtg5VTMBCnV8AWw20pioDwN5l2+3ea5pB1VTawBz7sU7JbpUJMRU
 OsLL1hSe0TSHNria3+/uvqD6fMw/S3IUonC1avKPjUAwJ4OEz4GPaSPJeACewXdojU+o
 kzJPCeLHUOoCMHfybTAOV9SfUQQkIoKBZy0lalfRvTcNk77uAnkWLYcWzbA6tvvfZo0I
 AwTko5xOjuXhUHdDTbA/FBl3M4Xo7Qn4GQhPL0UiqbFhCUBwn0C+h7fTGgOp1zQET9Vu
 JLe3Rku/Jmotjq9ZgqR8p/3LCqocnBI5jBsmk5xCTqJmS2KlF5w1uo90KNcgckRT8Bmy
 xUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzSUnApml1On80n7HfJBsepysNXlW5SfzG3qgcD+3YY=;
 b=4EX+BR8Aiw/DobU4C1A/TsSjcqLjJ7FOn5HzItIxNSZgNij4Vs/5D0J9k9zdjJOCsU
 oOANQraghB97hzE5kVIvMed9Y2u4sMlfzt2fcv6k4Z69o8pTUL1YoJu2+0YVdASAjtaR
 a1kdNF6NGzD3DW7Aarfl/oyDWrMbsNnckJVAl4Emxc9kuSeHHz2rLpWFgHIxzmiVQJs1
 KGOd0qV5M6MwXPtHDEPnugOr1XOgw9Vv6dvOO1csY4z+IdtReuiVKyW/XvF35iffC6ai
 9ryhS9O9jF9cdCsXpHasdrcA3RFvYO9Plj5qjW2x37efRFJhCeCLcpk+UJmfYKEdjo3o
 oqig==
X-Gm-Message-State: AFqh2kr1mxD8aUX5dy4SoSR3gsPrJ9tREoNYpwy/DWrEwT0csBTUnCfz
 xbuVwzNfhBkg1hOEd4KN8TTMhg==
X-Google-Smtp-Source: AMrXdXvd6Ndb66kaIUVSlnQox53Xq+xs+gRtFV8y4vpR06yi1LfOu1OELbHFZzyDArQ4TxSObNmpng==
X-Received: by 2002:a2e:a604:0:b0:279:c230:a6fb with SMTP id
 v4-20020a2ea604000000b00279c230a6fbmr9620137ljp.9.1672239955439; 
 Wed, 28 Dec 2022 07:05:55 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a2eb903000000b0027fb672d5fesm1532318ljb.59.2022.12.28.07.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 07:05:54 -0800 (PST)
Message-ID: <513807db-4cf8-5123-fa07-8d4d1feb84db@linaro.org>
Date: Wed, 28 Dec 2022 16:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/2] dt-bindings: sound: tlv320aic3x: Add optional
 clock and port properties
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221227082717.29561-1-j-luthra@ti.com>
 <20221227082717.29561-3-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227082717.29561-3-j-luthra@ti.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27/12/2022 09:27, Jai Luthra wrote:
> Describe optional properties for clocks and ports that were missing in
> the original txt binding, to fix warnings like:
> 
> aic33@18: 'assigned-clock-parents', 'assigned-clock-rates',
> 	'assigned-clocks' do not match any of the regexes:
> 	'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/omap2420-n810.dtb
> 
> tlv320aic3106@1b: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/am335x-sl50.dtb
> 
> codec@18: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx6dl-gw5903.dtb
> 	arch/arm/boot/dts/imx6q-gw5903.dtb
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> index f0375bbf4c40..2f9fc76bba55 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> @@ -110,6 +110,12 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  clocks: true

maxItems

> +
> +  port:
> +    description: For DAI connection when the codec is used via graph card
> +    type: object

Instead this should be $ref to graph port

> +
>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof

