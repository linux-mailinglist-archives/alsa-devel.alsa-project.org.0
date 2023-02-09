Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53169026F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:48:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BA4839;
	Thu,  9 Feb 2023 09:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BA4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932496;
	bh=htMEtkZfh2aHxTkQFyz4MdDl6h9cVVF28TAZD9p84hk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFy9MKims4dB1rHFRYQJO/mTYoh4/SvKhpwLeQkN/XqzD+715PrBRU33eNEs8Yg3n
	 nQZWrfu6y9x6FhzGgtlYsNNPDSvwnu3RQst5UfDK2xWWMl+2rbWvTgB67ElO11JpoS
	 USSasxmN+9tiW97+wCHJLnc2Y1jUbPFyXw9CAW1o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0487F800B8;
	Thu,  9 Feb 2023 09:47:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 836C4F800E4; Thu,  9 Feb 2023 09:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DE2DF80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE2DF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M/IqiT5b
Received: by mail-wr1-x42f.google.com with SMTP id a2so995733wrd.6
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNxrYafZPgwkI9Zs1VddIiODgFm8O0UYgQsUcqELM8E=;
        b=M/IqiT5bfF2H2m7rp+kNBZYDXUMi6g0BSid0W4hQ+sVsYfyCr4xv0e+OcKt3THpg3D
         aeF8u4euFYL3Vk97qTsryho5y//inzGHfXQAX4JAWC+SuQp6RWlCU8Q4cv/Wbh5Z1Oix
         cZ4e9/PjUR3lczRKICPz5erR6N2wsJi97x9OzBqGBaUBesUhBaRhpQL1dr32PqTQ9nNM
         YJqIkY1rAuP5eWX6ONuFl4x1aI0gRrjoWWDA5KAai6JiiHN7h7tkYDnOpza8g1SFSyL2
         CZT55WZ/OsGr8sNNh17AgaKt4e9YIC64hOrd7zwWMILXYJgGM2u8IPaSIVfYUErSPinS
         F0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNxrYafZPgwkI9Zs1VddIiODgFm8O0UYgQsUcqELM8E=;
        b=ul+4cqe/MkRm5tpjg7IHTdT9NNc1mFPOjKF0+OdyB2liipfsUKRMtYUHTeJig8rXa3
         JJ01lHa8fcSH/P4Ez9mHD1Kr2sar4LFOUdn5xaGY9vvE8xo7zLL86ku6a+ZsTlwkSff1
         /7caqLfC14Z5nMBABQp2C2RZIzy2giSVlpAt3FP5SwgeOvQGF6Mnl5xFh2ZT0haDiP30
         ULgIxRe9lZ26+SkUA65xN2+XZ7W6sAms6d+wqQN9OIej2XHMoPm9aAPJ3bVDMztMPS+X
         SsFTGtuu8gVJ41AC3i9lZVNdWz75k/1f+XtfozOZhyBV/xt6TUOvWouidXFRmc7FL/2n
         wYbQ==
X-Gm-Message-State: AO0yUKXhYc+Z8yUjlUvVpZRusEBuOhXtHv6xc/4zAy3C6v1gMGIbPI/R
	3mP8U0QO1bGN1iKMRaLXw3vdkg==
X-Google-Smtp-Source: 
 AK7set+CAKpxvDUCxsfDlhqJVlXOXj4uGBOiNFeNOcybsM4BZdQQKESjC9ggTPmEbdrpp99Z3EPGEw==
X-Received: by 2002:adf:db88:0:b0:2bf:b92b:8a8a with SMTP id
 u8-20020adfdb88000000b002bfb92b8a8amr9410439wri.7.1675932432804;
        Thu, 09 Feb 2023 00:47:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 p3-20020adff203000000b002c3f6d7d5fesm682882wro.44.2023.02.09.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:47:12 -0800 (PST)
Message-ID: <072724aa-2bf3-32a6-dee8-e74c74b01019@linaro.org>
Date: Thu, 9 Feb 2023 09:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
 <87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CEOFVGWTXTOS7J52UKTRB5Y2VP4JLZWS
X-Message-ID-Hash: CEOFVGWTXTOS7J52UKTRB5Y2VP4JLZWS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEOFVGWTXTOS7J52UKTRB5Y2VP4JLZWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 02:22, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> There are no compatible for "reg/reg-names" and "clock-name"
> between previous R-Car series and R-Car Gen4.
> 
> "reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
> therefore, use 3 if-then to avoid nested if-then-else.
> 
> Move "clock-name" property to under allOf to use if-then-else.
> 
> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 80 +++++++++++++++----
>  1 file changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 12ccf29338d9..5fd6435f4873 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -99,20 +99,6 @@ properties:
>      minItems: 1
>      maxItems: 31
>  
> -  clock-names:
> -    description: List of necessary clock names.
> -    minItems: 1
> -    maxItems: 31

No improvements here. Your argument that you need to remove it to
customize is not correct.

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

Best regards,
Krzysztof

