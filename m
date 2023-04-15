Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB556E2FDB
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7DB843;
	Sat, 15 Apr 2023 11:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7DB843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549353;
	bh=4YBnptFvHeOM7ixwk3IjqTLGCQUio8m1i2E4+w7ktlw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2k2y0/jvSQBLyemnAlY8AVJOyU7tG/oGaHCJy7v0dsl4/vcxDQc9dZDK1Gke3EME
	 1sTF6kIlp2lqJJN8Wlx3ZPZtuGEMD4q1U5IFCtHRuN2DLnskMkt/DnE6vNO3q/ebyw
	 1A60DA2K91lUATzrraHzw1wUF5nZbXhDPn73tA+g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F06AEF8025E;
	Sat, 15 Apr 2023 11:01:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334F7F8032B; Sat, 15 Apr 2023 11:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40772F80149
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 11:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40772F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Co0OwPVR
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso65222066b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Apr 2023 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681549251; x=1684141251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7bWAyZyLD6uo7vF/WlVxj3C8Ki8eISz7a0rWcMvR1k=;
        b=Co0OwPVRZSFCKAUtHmKZxfLEAl4+Yk9tRoSp0clTuJuTTsTWsesS7PWBTgdyTOlyEd
         bvErnPDwam2MuQ/85GuljVZSjqxCU4lay98TPaSI6eh+3DbgqXhKiXdeP4hhJpLgBzPR
         QONKjBWMsLwAiAUmhgHneXIT4yUvIfDtAd04MVj6qXuGPQUYtah+cHnfkZdJ8xwDwzWf
         7Z9urp7g82zxPXKJlqXl+ZFL0g2kh8xhmkrijuXx0FCo30I0AJvnYWTlWadx5OQb7KT8
         1nGYSyuKtZOANDAyIr4QKAl1B3jd6va4NY5Nb/G/jEvrtXDSn+wV122H06cH5GFbxNPp
         XIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681549251; x=1684141251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7bWAyZyLD6uo7vF/WlVxj3C8Ki8eISz7a0rWcMvR1k=;
        b=ByzfiYC2FJ2FOzjJJbHYFsRVg0KaBFFo0sjNOpuXCTexQkVsnzSWMWOEuD7qsYoPGR
         OSF2u4nGU72AJMU0tVNNyyY2eoLOSvoaUw3hbgmtxFD+KGUYqX7OkK+cfb0lE2iAg/rj
         EaaOpy1Ur1zoNUcHp6SNxFR65B5KaakRO8BTa5wWBrDUL7q4aHaMCe8CmfHJ1DLyx7I2
         uc59tKqWqLR6YbyDoHuodndSuBsPg98bteqxbnc5F3yl6g2OXUFODBMFbfkw/JxarXMF
         lbEkhgT3k7fkxgSjEbDMsn1dxEe0cJYcgajtiVTs/4utd04jPSMrBnZOPHNT9v2cZ/jK
         AM+A==
X-Gm-Message-State: AAQBX9eT+45/wQvgnHjsOfUdNnpXURUUttnzusFYjVVpramkwyaW6M0d
	5NzouP5vzo2QwtM17/EbsGb7NA==
X-Google-Smtp-Source: 
 AKy350aEJnSqnbH8WH/aQ9lyPmdapGYw/EYooeirvjzag7l10B9FqEzScCXV7gADNUZ63773fFSs4A==
X-Received: by 2002:a05:6402:1a2c:b0:506:7d14:984c with SMTP id
 be12-20020a0564021a2c00b005067d14984cmr6282723edb.19.1681549251217;
        Sat, 15 Apr 2023 02:00:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36?
 ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id
 wt10-20020a170906ee8a00b0094f225c0cd3sm421385ejb.86.2023.04.15.02.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 02:00:50 -0700 (PDT)
Message-ID: <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
Date: Sat, 15 Apr 2023 11:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413104713.7174-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JJFY3GIOZJFXU6WC3GVJZYRYAUKDSMST
X-Message-ID-Hash: JJFY3GIOZJFXU6WC3GVJZYRYAUKDSMST
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJFY3GIOZJFXU6WC3GVJZYRYAUKDSMST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/04/2023 12:47, Trevor Wu wrote:
> Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
> the parent of top_a1sys_hp dynamically
> On the other hand, "mediatek,infracfg" is included for bus protection.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..03301d5082f3 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,6 +29,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of the mediatek topckgen controller
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek infracfg controller
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -37,6 +41,7 @@ properties:
>        - description: 26M clock
>        - description: audio pll1 clock
>        - description: audio pll2 clock
> +      - description: audio pll1 divide 4
>        - description: clock divider for i2si1_mck
>        - description: clock divider for i2si2_mck
>        - description: clock divider for i2so1_mck
> @@ -58,6 +63,7 @@ properties:
>        - const: clk26m
>        - const: apll1
>        - const: apll2
> +      - const: apll1_d4

Why do you add clocks in the middle? The order is strict, so you just
broke all DTS.

>        - const: apll12_div0
>        - const: apll12_div1
>        - const: apll12_div2
> @@ -74,6 +80,12 @@ properties:
>        - const: i2si2_m_sel
>        - const: adsp_audio_26m
>  
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1

Usually these two are not needed.

> +
>    mediatek,etdm-in1-cowork-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -147,6 +159,8 @@ required:
>    - power-domains
>    - clocks
>    - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

Why making them required?
Best regards,
Krzysztof

