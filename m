Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE49B6B10BF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 19:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25778185D;
	Wed,  8 Mar 2023 19:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25778185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678299163;
	bh=6aQD4ulASmBHmdReyFzpiklRIR4nRqiwtsFqEkOZcg0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHjAzgsqovjfDC1AEFz4BXi2LNqaWDOuIXHuJnXS1Ywcrwc43rBbphePsszg54jlT
	 MIRGD4Sk/xDkFhHZ30T1ydKyFnVfd0yA5LEmFUvHvY/Esah34C0/a7dPeeqwp5aIum
	 cBEV8hcwzp4kNSkBo9vg6gfYYnzBgCXmar25mdvI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83246F80236;
	Wed,  8 Mar 2023 19:11:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83305F8042F; Wed,  8 Mar 2023 19:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EE83F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 19:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE83F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DdJ5ND4z
Received: by mail-ed1-x52a.google.com with SMTP id cw28so69251042edb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Mar 2023 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678299105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIbkTfbuYaA3+RtOg7HrzhffYJa9wKgDrnO04ZjeBhE=;
        b=DdJ5ND4zyMvr9mwMG3s365t9o3KE0ukJtj1YUDCtCv3nCUlkUOpfvCieZ0dz1ecQP2
         ROcgXniTT4umF0h3naad4Q24Ta3U6wXijdZBqdI0zLJtUfCywhXWLlP9SNJF1tbhgxSL
         bYuUJYPUOf5xI/7pmerUBtG94IuvjpYzwylVGDmPLoAs6S7hN7EQyJgBe/4Mk/VIODcJ
         iRytKqpLIn+zy0h5qHh6eAUvpccOmWrcNr8uTmN3xrHziSp/di2uQlHpap/swSknIizC
         Du3Mi0O32jpWaEYc6Uw1s/jNUG51dSay2ukUuVHn0VaBFdMvqWXVv/wfTNF+UM4sIAOT
         JScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIbkTfbuYaA3+RtOg7HrzhffYJa9wKgDrnO04ZjeBhE=;
        b=caEoFyv+ENG6UwoZeWbWZbUdOxoLevoj4evMMJSqSJstOfAti2fSAOt1eca2Ue4uec
         YvEG+pfS7sLI15jgNIauQ6WWLg53UjUFVhjnnl63QHI8Aon8MSe3lXnge/swfYhrfHr9
         YngV2JXpD9R9P9f2HdIiAGx1xYSLBIFWnMt0JOnlv0B/VbrzSMDluv0WB4VJk56B3M5E
         2msKvAqTcR2HoCtaS5FlxYsHzsfH+6909RHyE4nFuX9LBA9SZR0W+FwPA3NBzloVwscB
         uQNotbDeqS9RckIvZ0hKaBREbF4dLr+pqcAbFI7sxrLv2zhfmpUxNUWSvD+8YjR3CpHP
         bGUw==
X-Gm-Message-State: AO0yUKUiUtb66cTBOD2UMBtkW1KjaoFwiWjrUz8p2jD/CdMcFYTuMi91
	AFZVGfvSysWbiBabBgLdTU7v6w==
X-Google-Smtp-Source: 
 AK7set+80cZBExXbCTHag1Wy6TbwvmP01bgn9yhvAxwdmR/++/eWcPR5be2UxGhWfA1YEFrVu9A6fg==
X-Received: by 2002:aa7:c50d:0:b0:4c0:d157:a57c with SMTP id
 o13-20020aa7c50d000000b004c0d157a57cmr17607239edq.4.1678299105057;
        Wed, 08 Mar 2023 10:11:45 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da?
 ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a50c202000000b004f0e11e071dsm2248904edf.73.2023.03.08.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:11:44 -0800 (PST)
Message-ID: <5856c91d-b1d9-50d6-9e7d-cafee8b05092@linaro.org>
Date: Wed, 8 Mar 2023 19:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/11] ASoC: wcd938x: switch to using gpiod API
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
 <20221116053817.2929810-11-dmitry.torokhov@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116053817.2929810-11-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OFFXV2F267ZKM4JTOZK4BFFMA2PHDS52
X-Message-ID-Hash: OFFXV2F267ZKM4JTOZK4BFFMA2PHDS52
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFFXV2F267ZKM4JTOZK4BFFMA2PHDS52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/11/2022 06:38, Dmitry Torokhov wrote:
> Switch the driver from legacy gpio API that is deprecated to the newer
> gpiod API that respects line polarities described in ACPI/DT.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  sound/soc/codecs/wcd938x.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 

I almost sent same patch. DTS was already aligned with this, thus:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

