Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0D6EC831
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 10:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4846F29;
	Mon, 24 Apr 2023 10:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4846F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682326719;
	bh=qAQa4pgWdQ/duGl6AUi6GeoL58Fh9xZljjiwcg2iOCE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oqbMweP8DnP3uqBl68mhef9PQSGgm7iKPkFfRVnuBH0uFjL90mWyzEBhnfbN4nnYc
	 5g+159WUa0tLHQcam2P5BaRvXmTKU31aO676KIaAI8vEjlAXPA0fNkoRo6ZsrW8Vfg
	 LFOXYfJaYufJspRqSBwXNxa89mJd+WbfKQAMnHaE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37895F80162;
	Mon, 24 Apr 2023 10:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 232D5F8018A; Mon, 24 Apr 2023 10:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFA64F80137
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 10:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA64F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wnoZDMgq
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so31031103a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Apr 2023 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682326660; x=1684918660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=py9y4io0JhKKQaJ7dHvVlaxjI6tdWmAwE0q2TA8Rftw=;
        b=wnoZDMgqjic8RW3o0ZWmn0DOOE/LZaUDXt4RLG1Y2BKytuMU3u0ougg705ooblBOT4
         aGMul4S6SKYv6IVQwp+v8jgjv4RSBtwg3ySU8uttopygYwrS+yMMsTXq89IUaiGBK/b3
         6awmjyPxniVcZJG6F7EG3V5I4bconXMAXxvQ/hTpUByjsV21QpYemmaSZebKtyqDln0A
         fRf+YHTciYQuZ35NG9cXQbtPryz3319fq8X4grnkTdkECb8OTTKpO90O0m61hTbLdqsr
         /XvaxedOGnSbCG9cigVghwHpRbVL4+Fo/AIzaRzBr22b0y9WIsXiVLagq6OYaM/epmUG
         g3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682326660; x=1684918660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=py9y4io0JhKKQaJ7dHvVlaxjI6tdWmAwE0q2TA8Rftw=;
        b=NhTwGq8zkhzmN3pJ0taxwMvejoutmyHWSKqknMjKZS09Bp55qKv+iuFtkOyZJwCQfj
         rrnr9oJw8i7pmGMObedPJpYMddjNd6F/+Ef0dsmyDNezq66lgwxZ2FDL1eBym3ySK/RS
         69RyA1JeMLdnn0xDgZ5YMbEli7I23bkWZw6bgRR3xlS4h/LMuYfus0mnz5h3iey0UCve
         KxkwhRj2UjYMkDFfpytmOMpEfpQ1cui4+7E4iGg7kpWfYAhowDPkTQ1O1llGbPUSGO7I
         Pd5ZEtMdz1y8uYtRHcn5lXP6bZQ+I6VhT++ewKi9hcnSNR/P1TOtMjRtDKjNufnq5CIb
         XsRQ==
X-Gm-Message-State: AAQBX9cuLRb7rVB61V2BowQ/9MCAkLKx68IdK2zDzcKtockt7Ce9JGrb
	pJrHCGUiQAE476zwWgSQ4E0SZg==
X-Google-Smtp-Source: 
 AKy350YnWh5dQqxulqiegnnw1JtNJ/toTAVsHsERPqx47Br5ukTw2d4ghl1xLHjty+OA7pZQKeri2Q==
X-Received: by 2002:a17:906:12:b0:94e:6edc:71bc with SMTP id
 18-20020a170906001200b0094e6edc71bcmr9036908eja.25.1682326660596;
        Mon, 24 Apr 2023 01:57:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:fcdb:bf53:d053:3a52?
 ([2a02:810d:15c0:828:fcdb:bf53:d053:3a52])
        by smtp.gmail.com with ESMTPSA id
 lb16-20020a170907785000b0094ee700d8e4sm5243859ejc.44.2023.04.24.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 01:57:40 -0700 (PDT)
Message-ID: <2c308d01-8b9f-5132-6440-ee9166499b55@linaro.org>
Date: Mon, 24 Apr 2023 10:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230421211950.20972-1-fido_max@inbox.ru>
 <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
 <7fdf1f95-a9bb-8560-729c-b12bee302376@inbox.ru>
 <600d0c3e-0b5a-88a8-fade-edf3e4dd8ac6@linaro.org>
 <8805da0f-f79c-f6ad-bdec-7e1183242a79@inbox.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8805da0f-f79c-f6ad-bdec-7e1183242a79@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KCOIERG6PKHJ6BIJG2ZG2RSMUOFKTRYG
X-Message-ID-Hash: KCOIERG6PKHJ6BIJG2ZG2RSMUOFKTRYG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCOIERG6PKHJ6BIJG2ZG2RSMUOFKTRYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/04/2023 10:55, Maxim Kochetkov wrote:
> 
> 
> On 24.04.2023 09:40, Krzysztof Kozlowski wrote:
>> On 24/04/2023 07:07, Maxim Kochetkov wrote:
>>>
>>>
>>> On 23.04.2023 11:22, Krzysztof Kozlowski wrote:
>>>> On 21/04/2023 23:19, Maxim Kochetkov wrote:
>>>>> There is no way to select max98090 from menuconfig right now.
>>>>> Add a Kconfig menu description to allow building the driver standalone.
>>>>> It will allow this codec to be used by any other I2S master without
>>>>> adding extra sound card entry in Kconfig.
>>>>
>>>> For your sound card, you need extra sound card entry in Kconfig.
>>>
>>> Ok. But why do we allow some other codecs to be selectable?
>>
>> Mark explained reasons and I also pointed out that some are used through
>> generic card.
> 
> Exactly. I'm trying to use this codec through generic card.

Commit msg does not answer in such way. It suggests removal of
unnecessary extra sound card, but extra sound cards are necessary.
Otherwise just write in commit what is going to use it.

Best regards,
Krzysztof

