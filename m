Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DD68F835
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 20:39:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D3E4843;
	Wed,  8 Feb 2023 20:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D3E4843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675885184;
	bh=I62RHIEi2ycH8Xf2VMiJD9GZbQD3uLspF1h/iGyYItI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UWCPnE0Tp31KtukAcRAXC+Ab3AKWHA36KkjnQ94JtvnlcKJgp4ZV/r71UP4c+sZ2R
	 oYF9m1h/alCEmcZLdyAHMGEv+/5Fq9MWL/Cg7D2jsZ81NSbwO5tRPB4WDL/RnkC/KX
	 eO+OvhO8uXbrgLWm0mTqs6WxzcOXKvmg66hZfLFU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF571F8012B;
	Wed,  8 Feb 2023 20:38:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C528F80152; Wed,  8 Feb 2023 20:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB8E4F800E4
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 20:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8E4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FkmfxtiP
Received: by mail-wr1-x429.google.com with SMTP id h16so17884918wrz.12
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdAD5QrpEcQ0zzaMz4kMFeIBnTyIJbzpOOt7zHm3IRI=;
        b=FkmfxtiPgxjuvvp4A+gPUuNqzf4PAY4/hh36cKhM/flGzlXiF9Zv4MydUlzd8fF/kQ
         +LUEqLUIm/VeVFGaLnqhnTzrCMtqGCKJ061eSTxQYwnSt1VCKqXN9XdzT5YGh9Zbs15x
         y79wRHq2HVwTCNYwUX68HNb2pikwg1qXjzpgvXbnPF810JZAtxVE2pLKDIv9/cDrzmJ5
         Ga84vuFFML6iq3/dvb8y8QPrM7sOZ80Ml1Rv2aJ7UfcT5VpLifz7AWhnDG1bdhuNZcoO
         4Drt5rZoGR5frOnpRnlBwWjx/X4D2P4PQnLe7hw8WqtDkwVBm1yjqznc+qyza4Nk09Cw
         lCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdAD5QrpEcQ0zzaMz4kMFeIBnTyIJbzpOOt7zHm3IRI=;
        b=yyRbwsxreQruQCnK5m12TCUNFC3twj8XgVTIMZvYRH+I5uhJ6rH+4Yar5rtK3Q5zHa
         gNhgMEmFQ6iaOxQX/ClgHxE3hv7wm4qeBQ8RM1Cwi0NfuyccFWBWhXJEqg6vdOxiLR/k
         pQ2fwS+aeiJHPgKwUYFNrWhLwJWhqOlZ1V8rAaJ633rNYSHnG+ti9qGMx7TZ5Ksc+L0/
         uLvrywntvihCw7+xHDeT3Wy/WQgviYT1hYmJh75yMSaKRIL4iNq1KM0yMJupZgWqkUfN
         C7hXfFYn7CHnwEHsFrycr6b5NCnoAYP5ZG/Fl8S87vu53v/5hH7H5GVYxxLSZq9n9/le
         fyjA==
X-Gm-Message-State: AO0yUKU6WfmknKJXI4DqVIDj9d/XJaqlaqTX+7jcEEsHyv1KMB7yY2xl
	C3yHA00+kyZXQaTQ8sqjGdP7AA==
X-Google-Smtp-Source: 
 AK7set/Sk+mM5Gp0qTAl+sx2O3tRO1dQ1UUP0ecynbikcu/9D+jv85ph6CzBBq4we+evJn0ovJMdnA==
X-Received: by 2002:a5d:62c8:0:b0:2c3:f250:f1ed with SMTP id
 o8-20020a5d62c8000000b002c3f250f1edmr10154258wrv.1.1675885121164;
        Wed, 08 Feb 2023 11:38:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm6382181wrt.110.2023.02.08.11.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 11:38:40 -0800 (PST)
Message-ID: <f09a89e0-c93f-dacd-2270-379e43773b61@linaro.org>
Date: Wed, 8 Feb 2023 20:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
 <167588125123.2283195.8694738903913228349.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167588125123.2283195.8694738903913228349.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UGHBWSCHGAOKKPHTVRZAIEIQDCK5PTP5
X-Message-ID-Hash: UGHBWSCHGAOKKPHTVRZAIEIQDCK5PTP5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, - <patches@opensource.cirrus.com>,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGHBWSCHGAOKKPHTVRZAIEIQDCK5PTP5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 19:46, Rob Herring wrote:
> 
> On Wed, 08 Feb 2023 18:25:52 +0100, Krzysztof Kozlowski wrote:
>> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
>> schema.
>>
>> Changes against original binding:
>> 1. Add missing LDO1VDD-supply for WM1811.
>> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
>>    gpiolib already looks for both variants).
>> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
>>    Arndale board with Exynos5250 these are grounded.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/sound/wlf,wm8994.yaml | 203 ++++++++++++++++++
>>  .../devicetree/bindings/sound/wm8994.txt      | 112 ----------
>>  2 files changed, 203 insertions(+), 112 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8994.txt
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230208172552.404324-1-krzysztof.kozlowski@linaro.org
> 
> 
> audio-codec@1a: 'AVDD1-supply' is a required property
> 	arch/arm/boot/dts/exynos5250-smdk5250.dtb
> 	arch/arm/boot/dts/s5pv210-fascinate4g.dtb
> 	arch/arm/boot/dts/s5pv210-galaxys.dtb
> 
> audio-codec@1a: 'DCVDD-supply' is a required property
> 	arch/arm/boot/dts/exynos5250-smdk5250.dtb
> 	arch/arm/boot/dts/s5pv210-fascinate4g.dtb
> 	arch/arm/boot/dts/s5pv210-galaxys.dtb

These two need corrections in the binding - next version of patch.

> 
> audio-codec@1a: Unevaluated properties are not allowed ('wlf,ldo1ena', 'wlf,ldo2ena' were unexpected)
> 	arch/arm/boot/dts/exynos4412-i9300.dtb

These are fixed here:
https://lore.kernel.org/linux-samsung-soc/20230208172634.404452-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

