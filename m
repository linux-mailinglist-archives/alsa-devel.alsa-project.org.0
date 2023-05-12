Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306EE700CD1
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E04DE12;
	Fri, 12 May 2023 18:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E04DE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683908396;
	bh=F3vOTKmHs9+e60D00l+qCxgdk5+wQYo7IOS3C+IAN1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WnHeBkyGbtMUK8hnRGn0W+5iQYU6ITJ/Q4cwdkj+loHyw3GG4V+aZU7PPvcVTY5Ec
	 gi1bAa2IUaWXRGK6qFW/ZezkM9wAHvgb0+pdgLIAfGCjqqE4P6rtG1NEqT5wrachrU
	 yS0fEvUOkgjF0GZD9C44gco6DCCJmrMxsV8h3te0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A7EEF80558; Fri, 12 May 2023 18:18:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE21F80548;
	Fri, 12 May 2023 18:18:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BCFF80551; Fri, 12 May 2023 18:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFE5AF80544
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE5AF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=az2gzunW
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-96598a7c5e0so1638181766b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 12 May 2023 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683908306; x=1686500306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrz9w0tFb2bEDTavGbd5fDgs1thiabqypf9MHkMZM7E=;
        b=az2gzunWnoFGTedzrfM2TIbgTMGezLZi0Pxftg0z4G7WBcjClypX1MFYbz8i8Ffkpy
         rIPd+p9IvKeMHmW8j0rdOgWCBsgeKRSnUSDfyt1Vi+6WnmNExmMvNKsjWXnRovJQXfKW
         448lS9q5BRTaRG5axAPCUHKPpTDMtBNaadOB56e9URD71wbzPywTpB6wAAkG89cJmDrs
         BGIDgPXrsRgwWJ5tFqT1Ijehw1cql0A+ytkZnF6yCl/IyGvkD3S5HckHcMHX66OWzRz3
         zXAksm8dqrKTDHLbPan7w3A5gRaD13FQcWspRlIoW4Nysu8LdJMknrr3IeNo+/koT/M1
         jpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908306; x=1686500306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrz9w0tFb2bEDTavGbd5fDgs1thiabqypf9MHkMZM7E=;
        b=c23R0p4W7YMBViMFlXGcpXGmecqjv28CzYZ1v+dfF5kbtN0iYXQjpznAd1Pid9M/yd
         le/316JBkvMCfDVSjTYQwf4PRMxQJrm/sXxAe6nDR6kfPANWnauEcNetI3fDNU7H/59A
         +E7q3ntuVtGgm9yBPup3bZmbZXa/olP0SDObFFKLl4bCKA8/i8GyUTM8d1OHd8IAkVVe
         e28MRbUxKdxX2Bul+6MnhiUYKPc6fFdqP6JuY9421O9J1odsHwFO6F4pISvmu4wzfPE1
         1YZtP1bY7X1njFP+3WA9FgbzO9mmLW69Kv4/oOsgn+tkPJPnffQiQRjAPvHSuc2ubu9u
         nplg==
X-Gm-Message-State: AC+VfDwkdmVJ1GeUPhzCQQXcm2kJkjcbOUkOHNeIs1mR7HmumCb2DVpv
	FyBYlKaXlPeUt8BpN2JEAyyo8A==
X-Google-Smtp-Source: 
 ACHHUZ503Yw3/dALYytrKZ2MlhWOUd6bkVlyqT/PlDFv2HMBJY003CZ/7QJHED8qAmAK9YRj0Ft2Mw==
X-Received: by 2002:a17:907:6e12:b0:96a:78ee:7e27 with SMTP id
 sd18-20020a1709076e1200b0096a78ee7e27mr5822051ejc.59.1683908306071;
        Fri, 12 May 2023 09:18:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883?
 ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm5544589ejc.105.2023.05.12.09.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:18:24 -0700 (PDT)
Message-ID: <3b382277-e992-39a0-a4ba-c3fd88bfc41e@linaro.org>
Date: Fri, 12 May 2023 18:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Content-Language: en-US
To: David Rau <David.Rau.opensource@dm.renesas.com>, broonie@kernel.org
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230512081030.5138-1-David.Rau.opensource@dm.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512081030.5138-1-David.Rau.opensource@dm.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SNWN3TTYA7GWOVR47H43RXQXH5HCRYNC
X-Message-ID-Hash: SNWN3TTYA7GWOVR47H43RXQXH5HCRYNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNWN3TTYA7GWOVR47H43RXQXH5HCRYNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/05/2023 10:10, David Rau wrote:
> DA7219 can support 2 kinds of insertion detection polarity
> - Default polarity (Low)
> - Inverted polarity (High)
> 
> This patch adds support for selecting insertion detection
> polarity to the DT binding.
> 
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
> ---
>  .../devicetree/bindings/sound/da7219.txt      |  3 ++

Bindings are always separate patches.

Consider also converting them to DT schema first.

>  include/sound/da7219-aad.h                    |  6 ++++
>  sound/soc/codecs/da7219-aad.c                 | 34 +++++++++++++++++++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/da7219.txt b/Documentation/devicetree/bindings/sound/da7219.txt
> index add1caf26ac2..357d1f61de1d 100644
> --- a/Documentation/devicetree/bindings/sound/da7219.txt
> +++ b/Documentation/devicetree/bindings/sound/da7219.txt



Best regards,
Krzysztof

