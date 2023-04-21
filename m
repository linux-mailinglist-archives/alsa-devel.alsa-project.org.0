Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E1A6EB33B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 22:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA12EA0;
	Fri, 21 Apr 2023 22:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA12EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682110710;
	bh=7oY1sPmGBTnkzdQAaui2WsaM/04oQgtQNgR7ZyihKu0=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BorQO9BjcHNWvQE7DJRFSx6JJNz+rF5/1PSSZp514hnkZ5lW8gu+YfAV3AvBho9P/
	 cHLLJWyiOFPBXrE+bYWdkRvScr8mtFH2z1vRk0ioHNMm76Fg2vD6Z5bREZ9lpq5VaW
	 /6tKP1b+k66XsEtvh+PXFIBFCks5QCUomtP1nXPk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 900E4F80149;
	Fri, 21 Apr 2023 22:57:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770D2F80155; Fri, 21 Apr 2023 22:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A10BF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A10BF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xtjCpswo
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94ed301bba0so360143266b.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682110652; x=1684702652;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YC/slnsRTxWkcIN+Mc5AhhpThkzQf8YmWNnwq7mrl/Y=;
        b=xtjCpswoTkouS1PqOEZ8Y3LzXty1Lykp2ZZSTAqwWFWB8DPzcVSEsGOrw3R8P0pe4o
         Iiv5M4m7lsXqOAELIaYQI9PfW+CI4oORSSudPUC2NVTyebjkl6CFUE2vdShzlLlH+RHY
         4FThnEfWK9Ri2lCzQJgO9/sGFJPjKQa8Z1FkHjJzCtqlcEPQYnZ0JfCygssZIct3RbbI
         /46JGoDtNVWTZNgAclX1ym0h5t5lM7OJ7ziEPJrSvFywBBJhrdpWIQ4rLpZ8yI/mbobv
         cdR500nS3SRpb6SSvWfHMcP5A9Cd3vNIabHt6bbMM83RI1MZ7TSUTLz6QidaNQDWoQpm
         sVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682110652; x=1684702652;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YC/slnsRTxWkcIN+Mc5AhhpThkzQf8YmWNnwq7mrl/Y=;
        b=L4m0RJsQ9rQO8DasERgwE1Ll1ENtakArY08zA/uczsy1+jtmVqDVSaSd7Z2yY13/pc
         F8vU5fIV/R0QCm9HvdzkyFOFSA0wOudKwG0641IN5FKw7CzBrJxDyem+0mT4RCkGvMiv
         qimW/g0Prqn+YVFZYpIKW/mzG0SMy7GlRdffSAxY6viphSzro9FQVjTzZf/Y6v+Wl4gu
         FCM93BBnm6HA7JxCrLRvp6fOGnwCQ5CKWVGySlzVRFJqMZHVnKx/c1fzuS78kTzlDrdN
         WQ6BXkprDgcEZKcGsSo7zRomOe5Jqh6WvshMxFTnHn1BQ4aaCSrQh4jth9goY7U8NX7s
         YNyw==
X-Gm-Message-State: AAQBX9dY4S3La9xVMf8WQxbf4PEDxOYjjj+Q+kO9tFuo9Z0DBH8cHmlL
	gs4pxg+W6bVnhdWMb+FByDm2NQ==
X-Google-Smtp-Source: 
 AKy350bSjiXqbCqxEvtNDy9VuBrD/RugniCzmDPShpxtPDCwHS1u2oUxD0KaImcifg+OQ7j5DkgCoQ==
X-Received: by 2002:a17:907:a485:b0:94a:7979:41f5 with SMTP id
 vp5-20020a170907a48500b0094a797941f5mr3296558ejc.71.1682110652668;
        Fri, 21 Apr 2023 13:57:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm2167079edr.29.2023.04.21.13.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:57:32 -0700 (PDT)
Message-ID: <4bd2b8f9-0b1b-7494-7d55-ba646a6046f6@linaro.org>
Date: Fri, 21 Apr 2023 22:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: max98088: make it selectable
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
 <444ed682-9c5a-4d5b-8ba2-f1954c7719c5@sirena.org.uk>
 <03bcdcfd-3007-5124-428e-7be92d3aa8b2@linaro.org>
In-Reply-To: <03bcdcfd-3007-5124-428e-7be92d3aa8b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2FTUEOK4PZ5MRD5P3JYUBXQTHG72P2UB
X-Message-ID-Hash: 2FTUEOK4PZ5MRD5P3JYUBXQTHG72P2UB
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FTUEOK4PZ5MRD5P3JYUBXQTHG72P2UB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 22:54, Krzysztof Kozlowski wrote:
> On 21/04/2023 22:43, Mark Brown wrote:
>> On Fri, Apr 21, 2023 at 10:41:00PM +0200, Krzysztof Kozlowski wrote:
>>> On 21/04/2023 22:01, Maxim Kochetkov wrote:
>>
>>>> There is no way to select max98088 from menuconfig right now.
>>>> Add a Kconfig menu description to allow building the driver standalone.
>>
>>> Just like many other codecs used in embedded designs. Why exactly this
>>> one should be user selectable, but others not?
>>
>> Not all drivers are capable of interoperating with the generic cards,
>> some require things like specifically programmed clocking setup.
> 
> This one so far is not used in any generic card, so I wonder...

I found one generic user - at least one board (Odroid XU) uses it with
generic simple audio card, so probably this makes sense.

Best regards,
Krzysztof

