Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C1745239
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jul 2023 22:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A68083B;
	Sun,  2 Jul 2023 22:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A68083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688329208;
	bh=kqREYJPi9lC5uSS5Bz7qcCqD7s7vRnM3co30lpHoM+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lo1cihCwHc7itB98VWSgLkznaZ+1vCQefVTZdQAJRwezxzyeuyZpBaKOVphGTnkzT
	 Cmbu1k18IK5Jz5795vb0Sxr5CAlp1i4od/YqqS45DkWl8oKmxP0A4Fn+99ap15ERXI
	 1JfanHB3TKvtt0qEeNSroe8+Szy56O7A4JRG6l1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3A81F80153; Sun,  2 Jul 2023 22:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3754AF80124;
	Sun,  2 Jul 2023 22:18:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C39F80125; Sun,  2 Jul 2023 22:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D13F8F80093
	for <alsa-devel@alsa-project.org>; Sun,  2 Jul 2023 22:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13F8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RLbE7HcZ
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51d80d81d6eso4387198a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Jul 2023 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688329086; x=1690921086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCR9aKiKS/1HtQwTZqnWeFMubODuiRALoM63pUyTJCU=;
        b=RLbE7HcZPgIaiC6blyEO4rHMhIXAejRbkQ+QaFRrD3+fDJNHa3bp7iPuLzBjMlfckb
         El3tW28QZBjIFXQuJiV61Afd5QA24xnFNH+NQtFskOH5cPODH5rCNyqHOKEEkUwAdBie
         zH2QqLI1PjyyRMF3uoksnVpE8XosHESkuwaaT4Pjq5kPmiea38CivFMvgLqMWKeoBZAT
         K4pPgEEEkjFzsZJliyEt321jxueI8N4hkgrRKrCotcaEGtWMz5bVz7fS70LyGNye3j/A
         8KasqV+7EFKrAXUVyt02SHeO1WWs5SWtEnytY1JoH/Fc28DYFwwedC7CXMfjHQrpxLCn
         GziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688329086; x=1690921086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCR9aKiKS/1HtQwTZqnWeFMubODuiRALoM63pUyTJCU=;
        b=L9Rz9kNIK+OyEGs2dZgi4nxB7ka34zUltimx7BXSWfdEAG6Mi5gVpeSIHXGp0zKqbD
         BtsDbkkBkzAvzstOGqoyiyKqVPlAHl/+wU/u9mcVjRV2cUP+bPiyqE2gziI6JpFYYObt
         2DH7sHhIdWXWvpxYYHIppehbmBk3HE+dhBbQgHIqZCxW6DId0nh6R2n5dh2lBNO/uEZj
         t97xQ5PNTKuhzZRZCt/lMkU/asajWhA201yII/5GZllw59oLYSxRO4DIj0trQRPAkHJu
         tyOJM0h2QS8LJpPBM4g6neLJEla7z/wkVyzP8ynOkj7VMM/V78tFtWxqT9NFgUBaflnY
         63XA==
X-Gm-Message-State: ABy/qLbUW3o8HrjYnjuCOATp2u8Z4R0mpJ9kGsK0bxzQio2+W/c5VY/R
	/zx0nbQZfuQiYm2Fk2CsjENz7g==
X-Google-Smtp-Source: 
 APBJJlFVtPTlxrm//lL1YIu3ZSH+xqtNfZVjv/+8m52ah6lvvQu8iOwxcBLsGx3A/u0rD4Ns0Qtzkg==
X-Received: by 2002:aa7:c64f:0:b0:51d:96d2:6578 with SMTP id
 z15-20020aa7c64f000000b0051d96d26578mr5758395edr.28.1688329085809;
        Sun, 02 Jul 2023 13:18:05 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cb92000000b0051bec856cb4sm9461312edt.50.2023.07.02.13.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 13:18:05 -0700 (PDT)
Message-ID: <6136e12b-7a66-b1df-23f8-9767130576fb@linaro.org>
Date: Sun, 2 Jul 2023 22:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Content-Language: en-US
To: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
References: <20230628085009.1130318-1-wtli@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628085009.1130318-1-wtli@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KO6EJWDUZRTLIJ4GBIET3OJ6DO7H3R4P
X-Message-ID-Hash: KO6EJWDUZRTLIJ4GBIET3OJ6DO7H3R4P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KO6EJWDUZRTLIJ4GBIET3OJ6DO7H3R4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2023 10:50, Seven Lee wrote:
> Convert the NAU8821 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---

This is not v1. Please write proper changelog and version your patches.


You did not respond to my comment and you did not fully implement it.
With lack of changelog it looks like it was ignored

Please fix everything I asked about.

Best regards,
Krzysztof

