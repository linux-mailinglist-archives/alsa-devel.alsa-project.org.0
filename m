Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68176990B1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:05:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB3583E;
	Thu, 16 Feb 2023 11:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB3583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676541943;
	bh=3xjmdSlfBvqBk/f+jld6rVfcT1PshIHlzffiLppDBs0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZ6ElRQQWX3VaFjXJsvf1KL3mrMLpkbzJWw49Q/QrcdKfLdrYCR5704Ew1AzWaiN2
	 YqfKQWNHIgDKuCiG/66cIKkGw1mGYrPa1NfceshvlzArNDMfkp8vOyNGacUORxTpW9
	 2+c3/Vmimh4EqKiZPqeMdFDL+M5bcqBKlz5SzLe4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62BE4F80083;
	Thu, 16 Feb 2023 11:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB83BF80171; Thu, 16 Feb 2023 11:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51DFDF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51DFDF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bjZQpJ3l
Received: by mail-ed1-x52f.google.com with SMTP id v13so1964073eda.11
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHOyQ5lmh44/x0N5o9EsWAl8D2lj1V8oYJTQzd4/iwg=;
        b=bjZQpJ3lzdwQ8hGv3TiVKeTU35vniZY/thIN9btZzz90XUJOLhcN9Z7phrwR7ME7jb
         XNm/51PJRU2HHchyrEc8hwF7cdzv7z4r+93iuikWUBkyxjgFKu3gxT9bjSmgPNT4Pl6d
         Bv2Ws/i4ScQ9647GxmC2sxRX1idbw5LtIJ9cdtmJnoyNduPYEGa5xPI2josYcuT5Fllh
         lsssLoSR0N8rc0QYXHSOHtTtcmeY6toL74u5lem43ZI+jAa7IJua79bHUW3TVpdCaoxt
         wQDDndTj0CAlUME4H68ScsnMzc8nPyAgBhr3Y1qJS979xJeDTQM/S46vbI9pL4tjg+C4
         q35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHOyQ5lmh44/x0N5o9EsWAl8D2lj1V8oYJTQzd4/iwg=;
        b=QSoddFb1plUH5MALBjPlu1JaJl6gfZjVOmNzve5eu2suwSFFQfuUcND0MWEndHZ/vb
         wlZ5mUleQckYozacb6O41TBWzFtsilMMFW+La35uepUFm0VZFbNrrWbjR7QIirdYCvuz
         YJT9zk250aJ1VG43BBNyw25Be/kKl4MxF+ix0qLxHK96zxmI6HLVP3IcRQleLdGVOScA
         wu3idb4+6LcXZk/6HPTGtli7WsW2Rbz8u82QNggrNVeQLVa/r6j087jwszA79Uoo9Xj/
         inQ1/vQdUuyaVjPhB/nAD7YLVSAqQSfF+JwrayDBT8nDYyIwWdiMH9/OfulOKGG+v6y6
         9kXw==
X-Gm-Message-State: AO0yUKW3qcKg70uSX3M1IjmasdErzeL9z4TxkqKx3sbVVTEobJ/qwiHc
	qR7Wm8l6+dylgmpYONMdwcC3Aw==
X-Google-Smtp-Source: 
 AK7set9uWaBpaH1PbK5+K7zWxGk9xtocPZW9k0aRimgCx3zjxnmc6I9YqaLLs+v34zBVzX/5pzScEg==
X-Received: by 2002:aa7:d28b:0:b0:4a0:e31a:434 with SMTP id
 w11-20020aa7d28b000000b004a0e31a0434mr5546917edq.27.1676541876140;
        Thu, 16 Feb 2023 02:04:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 i5-20020a50c3c5000000b004aad8d2158dsm579668edf.66.2023.02.16.02.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:04:35 -0800 (PST)
Message-ID: <485d74fe-bfb5-c55e-724f-304476624abd@linaro.org>
Date: Thu, 16 Feb 2023 11:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lars@metafoo.de, perex@perex.cz, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-3-claudiu.beznea@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214161435.1088246-3-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GROO3QFMNLXK55SW237FMKNJQBQKGFHW
X-Message-ID-Hash: GROO3QFMNLXK55SW237FMKNJQBQKGFHW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GROO3QFMNLXK55SW237FMKNJQBQKGFHW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/02/2023 17:14, Claudiu Beznea wrote:
> Add microchip,startup-delay-us binding to let PDMC users to specify
> startup delay.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> index c4cf1e5ab84b..9b40268537cb 100644
> --- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> +++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> @@ -67,6 +67,12 @@ properties:
>      maxItems: 4
>      uniqueItems: true
>  
> +  microchip,startup-delay-us:
> +    description: |
> +      Specifies the delay in microseconds that needs to be applied after
> +      enabling the PDMC microphones to avoid unwanted noise due to microphones
> +      not being ready.

Is this some hardware delay? Or OS? If OS, why Linux specific delay is
put into DT?

Best regards,
Krzysztof

