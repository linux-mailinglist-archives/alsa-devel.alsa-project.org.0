Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749C702C3A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65EF1CE;
	Mon, 15 May 2023 14:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65EF1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684152316;
	bh=OhHr5iN6fyqws8qv2NSSeMrZzOrbUKkW+DJiBBQxbMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNbdgIOvzN80mPr16XiehLEmTUi3y9dLTRu+1ejU60vPmK9KgHG+Z8Hg+A9h6msaK
	 OvBZvejJ9yLPG3tQmH0/qRsig7SplEOTIl8CX/+HcweSxlOkpjOlobp4a1fQJmINWj
	 NBpbc2crKNHJdGM+9a0kpOmiKkKNyUdAiHaqcHBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E7AF80549; Mon, 15 May 2023 14:04:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 972FBF8025A;
	Mon, 15 May 2023 14:04:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CBA9F80272; Mon, 15 May 2023 14:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 446ACF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 14:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 446ACF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ByoRjCzb
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso2311274966b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684152247; x=1686744247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/nlan8NsKQaqVLCr51QfC/hNbeFSNTXRRDAB3FVPas=;
        b=ByoRjCzbZlDhT1T9pjQEYxr54YRw44V8aNUv9jfd5JCNP8tHSMuToNR/AON5XhQOmw
         N40Kl/3OLlocsZ4d9J6Kn7vUs9/ZVehfyNn5RyuY8fBOdTbsM6OSE/tm9Oh9hYZtBT1A
         rbxBFvkvqcGnMKja3ynsVt20EiEKi2YE3+SrV5OGR6t4lHveWTtmgAksr7JO7ceasrTJ
         7F0woxS2bnN2EVU8rslQE62j9dDrwpLpurk01imY+qvNvqiVHXgGrSyPClPx0u1yOMoF
         NfSX/hzAgDXlfsmrgFfUiFNX7jDD7okvDYvv7hfnpJlVhIhrQmhb8hVm3+ifeZLht279
         fJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152247; x=1686744247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/nlan8NsKQaqVLCr51QfC/hNbeFSNTXRRDAB3FVPas=;
        b=NDC4LwBSI096OBaE+7LnPOcSR6pm0c738N6GqYKFhvHcoEQb1vqpKWt/t2R9aYGi8/
         nkn+TQww+0BO7pDeRZpZgpNVPREZoSB5MParlb1hEDriatOy99bIQjGtgHul6WGCU1Nq
         ubPTeIUl8y4Oo6HyT1/F3fovwXc02omdN/TH9TK+FF+bQmNkjXUzSZ/MIO30O+foz5eq
         p321bKmIUcm9Yod4u2+vD8lwOs1MxOK5lIabAv4B+ZkAIHaiuI6u/rWgztyftqUoILc0
         ZnrNKRCFer/meqZ0+4immqMxm1xsPQViM5LWxI9YMjheaaSFakZLi3fNUabElEtJVqm2
         ZLTQ==
X-Gm-Message-State: AC+VfDyEmbccYi2O0dGg72nAXxFteODaphrIUKMd+xVBGkO5udUvPm+J
	dWS4P2Ipjynw8H0YSm/jRnxfyg==
X-Google-Smtp-Source: 
 ACHHUZ4whC+e3qGJCrdvneIaAmKdoHpgCsOxbqCTyf91AW/nF0/VvKIN+NibbQBny50EjV05s6mA/g==
X-Received: by 2002:a17:906:974b:b0:957:943e:7416 with SMTP id
 o11-20020a170906974b00b00957943e7416mr34190677ejy.15.1684152247320;
        Mon, 15 May 2023 05:04:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id
 k10-20020a1709067aca00b0096a1ba4e0d1sm7811245ejo.32.2023.05.15.05.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:04:02 -0700 (PDT)
Message-ID: <e8d7e008-db27-9ac5-6728-d3f7a19c10c9@linaro.org>
Date: Mon, 15 May 2023 14:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] ASoC: dt-bindings: Add ESS ES9218P codec
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230515074021.31257-1-aidanmacdonald.0x0@gmail.com>
 <20230515074021.31257-3-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515074021.31257-3-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KRJRA5YCUJ54PNKD6Z24JG7NHHQMTCSD
X-Message-ID-Hash: KRJRA5YCUJ54PNKD6Z24JG7NHHQMTCSD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRJRA5YCUJ54PNKD6Z24JG7NHHQMTCSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/05/2023 09:40, Aidan MacDonald wrote:
> Device tree bindings for the ESS ES9218P codec, which uses an
> I2C control interface.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
> 
> Notes:
>     v1->v2


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

