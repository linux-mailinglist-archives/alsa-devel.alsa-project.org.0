Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F869028F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42CB0A4D;
	Thu,  9 Feb 2023 09:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42CB0A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932940;
	bh=fQ72H1AYlxX92RSU5MSuNfG/4UOOK/jNoe7hknVhGZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p7jPxrCnY1nIpp/zMBc7amWUvhuI9fg+HC85t63T2ErUwdymu7UOQlTJxaSzYzpKV
	 7rjKNEiVtpwvO0XJCaG6Zcju7Xq/Y7sXNAcoMCjEeoK1CEoLIV4/MicXDFxPoII3Ya
	 FJ3iM0tFKfsbDFnR9O0XdpbzwQd6TLKeTN0B1M+M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 981F0F80094;
	Thu,  9 Feb 2023 09:54:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF5D7F80269; Thu,  9 Feb 2023 09:54:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4833F800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4833F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hzGAcmJl
Received: by mail-wr1-x436.google.com with SMTP id o18so1026598wrj.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 00:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZaBU5MlTw0ghUyG7F0EMhIOGNhTAX80itYRC0FVJJNc=;
        b=hzGAcmJlJQDKvZLmxRpcdwbNiESP5nTRXuyNgJOnRPys1WNaOo/I2MVVd3JOTJ8LQZ
         Cv6qqiA30QIOn4QuCPbNLE3ycdKZ8MOSfj/lSb4Tu4fKUG0sJ7UfdDKW7o/8Xpa78YNZ
         P2XFT6Ozz129jxT0swHSHR7kchNQSWC0aJ0GVwz9GJaGiGQ6irZMtLiZorltuOUHXj0a
         Lz9NEtLWGVmz3kYDsilRG/uh6TVkfPeYTHr45DDzcoAtVjaFumGVYAmgP4TlHVLtsP4p
         ZeXlJyaOJzg6wWishOEBakggDlXdaTl717C2XKSo5DvDImoiL8z6Xo7eruxU/i9waefC
         vBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaBU5MlTw0ghUyG7F0EMhIOGNhTAX80itYRC0FVJJNc=;
        b=CXzUXNbbshQXKyQybYEFyAOWno3xsIe6YYUZw+/7h1Bk91k6g7R6NCV3ssrIPr47oL
         t6fVDK9a30lNqCqi38QMMuF61w/gX/laEWhntLabuBT2LiphXaI8tqm039X6JsvhGOhc
         lBPxHKyH8Q+ZkZexaNPkO2y25PTSMVRLYfLIwYogTHWfb55H8CizKY/TPeSCmR85Sdzx
         FfO4C7Fv7lQEOYDyst8LN9mR/9ZwIRadMXBG214/j2wUFqWkJeRdu0ky6HyaQmZSus8L
         sArh6tXJT8a3veGiGvODXGXWy56ok/i++8jFVGrzWNiAG8x6F4rDbhwB4C63Azkz2FZv
         jRKQ==
X-Gm-Message-State: AO0yUKWUecGfp3tvVUrFAr1SzGKsntaep0QiiTkxTLPaXEm1nTVTpXTz
	/VsGk9U1meYjcPjxMDyLtHbOIw==
X-Google-Smtp-Source: 
 AK7set+XBnSQvSY4Ttsb7H2i3i83JcSSqIeNcy7/TiZRMBGW+P9zFWR7XxEk9Q3F/uknlW7ysVJETA==
X-Received: by 2002:a5d:6b85:0:b0:2c3:f8f0:aae0 with SMTP id
 n5-20020a5d6b85000000b002c3f8f0aae0mr8013487wrx.22.1675932881200;
        Thu, 09 Feb 2023 00:54:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 q12-20020adffecc000000b002c3ea9655easm679719wrs.108.2023.02.09.00.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:54:40 -0800 (PST)
Message-ID: <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
Date: Thu, 9 Feb 2023 09:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209084903.13000-2-kiseok.jo@irondevice.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MOCGDGCSKMNCSPGV64QT6NKLPKRN554T
X-Message-ID-Hash: MOCGDGCSKMNCSPGV64QT6NKLPKRN554T
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOCGDGCSKMNCSPGV64QT6NKLPKRN554T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 09:49, Kiseok Jo wrote:
> In SMA1303, this device does not support MCLK.
> So it need to remove sysclk setting in devicetree.
> v2: Modify the sysclk setting - using devm_clk_get for mclk.
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Where? Where did you get this tag?

Best regards,
Krzysztof

