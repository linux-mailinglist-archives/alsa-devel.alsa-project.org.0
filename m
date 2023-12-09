Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201D80B327
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 09:21:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5B97F8;
	Sat,  9 Dec 2023 09:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5B97F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702110105;
	bh=322VRBS45vNHvcZ5A1sxZ0K9VsRds7D6rIQbrsUUqpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rkRGMzpeRJ+MwkX5RtdJGQ/IBg32ElYTzJRClEWh3uVuRexiZpl8Fg4JQh37aea3v
	 cG4apEQ1P42ef54e7r0PO1iwm5XmEAsheuMQjI6w8/u5MCWrKW35kK319FqEDLd3AS
	 WPVjcnhLT0TG9JYOgfXPLO3dt/kaULPk97q2zDA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE4EEF805C3; Sat,  9 Dec 2023 09:21:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02909F805C1;
	Sat,  9 Dec 2023 09:21:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDE02F8024E; Sat,  9 Dec 2023 09:13:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABCAEF800D2
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 09:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABCAEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cudyfOZs
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a196f84d217so333623866b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 09 Dec 2023 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702109589; x=1702714389;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MM2Sr/00z9b7gN+VvKVCEt9Xgjmkhw5TWlydzOOP3NQ=;
        b=cudyfOZsMiUuulxUez7wWTWXTi2VnnWn1u56m2NgfLowkFZfSnRbcooPCiBGbi/7FJ
         TGPG/xKPQh6mimowxu+HUddl5HEMusNE8W1hJtvepG2+i/HeRTfB2K+BgAAYGtRz2Na0
         GeBPd/ZzKw5IT8fAP+LOMhumD4GMGz3X1tK4e2nuiE0vOH0eE5DaF9PwOeQY4aZD49VF
         Ch12Y4Opn+7fFYXNbpuE9vdUJn7iHG16yzquxFQhN5EGTKA2L62qofMmdYFO1foBIMKY
         9TrvfXeDF4wGwjmSPaTfuUltESwJFjwcbDxQAgeUb1exk3jc/2O02uuvFVyuZFMw2bWS
         NVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702109589; x=1702714389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MM2Sr/00z9b7gN+VvKVCEt9Xgjmkhw5TWlydzOOP3NQ=;
        b=MOviSUbQJBIx/G+roDVFlJwcQhZ3tcUfIP3qzmAoR5CBhmbyvJKQiI7lKyGhd9BL0K
         xA4s0khTho0MEMGTZSW1MJgjFVaFTruqqdS7Tduk/HKDjvRfjCCR0IzKAeeXNv5HNWhs
         pZvRj73azTGBs7bNfH+mFTFSwM07hazmni2I1UwuI3P4vgeAt9sPGoI7X9tr9bMiy0FZ
         OkIKhcSBaD/ByzID5kRTG7dIevK67FscdZSfJmnyd4i1xBRHetKt5AYa7qsFr9k6iZbE
         NTNm0lSvphLUYXI5xuWXsZxD+A+A1MBPg9E77YONEyvBF9SOqE9yep2lVDX5Zl6WMfXp
         44Hg==
X-Gm-Message-State: AOJu0YxnxIr6X2p88ZqCH7DAbgnUtS8JVTsQi0Jw9SF8zzFDlSLDXgt8
	QF9JX9akACu+f4EQ8ve3NKiCig==
X-Google-Smtp-Source: 
 AGHT+IGTCc8NzaqCEbYGLpTbx4GP9wRIBW0kXLg23emvlQb4M/aQR32v86u8vLduN+aG92TO/YR7Dw==
X-Received: by 2002:a17:907:7d9e:b0:a1d:bef8:cea3 with SMTP id
 oz30-20020a1709077d9e00b00a1dbef8cea3mr697274ejc.75.1702109589433;
        Sat, 09 Dec 2023 00:13:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 uv6-20020a170907cf4600b00a1f699e5217sm1684637ejc.135.2023.12.09.00.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 00:13:09 -0800 (PST)
Message-ID: <9dc6ff91-d28c-4e94-9ec7-f39aa1555bda@linaro.org>
Date: Sat, 9 Dec 2023 09:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: dt-bindings: Add tas2563 into yaml
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com, soyer@irl.hu,
 tiwai@suse.de
References: <20231209080742.1290-1-shenghao-ding@ti.com>
 <20231209080742.1290-3-shenghao-ding@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231209080742.1290-3-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FG5OFALQZFYHOQWW46M4U4E5N2ZAICQQ
X-Message-ID-Hash: FG5OFALQZFYHOQWW46M4U4E5N2ZAICQQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FG5OFALQZFYHOQWW46M4U4E5N2ZAICQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/12/2023 09:07, Shenghao Ding wrote:
> Support tas2563.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> index a69e6c223308..84e197e15df4 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -11,11 +11,11 @@ maintainers:
>    - Shenghao Ding <shenghao-ding@ti.com>
>  
>  description:
> -  The TAS2781 is a mono, digital input Class-D audio amplifier
> -  optimized for efficiently driving high peak power into small
> -  loudspeakers. An integrated on-chip DSP supports Texas Instruments
> -  Smart Amp speaker protection algorithm. The integrated speaker
> -  voltage and current sense provides for real time
> +  The TAS2781/TAS2563 is a mono, digital input Class-D audio
> +  amplifier optimized for efficiently driving high peak power into
> +  small loudspeakers. An integrated on-chip DSP supports Texas
> +  Instruments Smart Amp speaker protection algorithm. The
> +  integrated speaker voltage and current sense provides for real time
>    monitoring of loudspeaker behavior.
>  
>  allOf:
> @@ -25,16 +25,19 @@ properties:
>    compatible:
>      enum:
>        - ti,tas2781
> +      - ti,tas2563

Looks like devices are compatible, so express it in the bindings with a
fallback and drop driver patches.

Best regards,
Krzysztof

