Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832F79E025
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 08:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBBD820;
	Wed, 13 Sep 2023 08:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBBD820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694587252;
	bh=XZgnYfWKI/6jW7g2dq9MPf7txMDELH2gAjULS9+XAOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t53mOzu4xDRSRFKi1Ygp4aKw5yYpiCWygbsbpLfwBisi0eFOSC4mjfPDXsgomiLEh
	 hS+DQqAv+Cyt/dVsTOjP6Xz+R8ONGFL/N6c4AXMYKjENWgU7xjMFh0cKvmdrdhq5pA
	 0FDeOg7XwOT0/CC7/QEg59iaq/U/1ulU1fuNQT8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B84F80246; Wed, 13 Sep 2023 08:39:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE4DF80246;
	Wed, 13 Sep 2023 08:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D96F80425; Wed, 13 Sep 2023 08:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7F4AF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 08:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F4AF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PwPJT1/l
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b393ddd2so73064585e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Sep 2023 23:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694587138; x=1695191938;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXni+5boQmEaYGoN3pj3Gay1Zsi6v5dMqRf5NvenPXw=;
        b=PwPJT1/lZRiFpsygg2aHLXZDLT1SBe50Ba/73tmEfRcXSYwvxe+eCga5ZGaKAdWZuP
         CTLfC6qG/p8+N1taVq+NzrBcxACwvS+vZje3fcl6hxpIskQbEUDKBFCuDbfAxGQ+6Bf9
         noEw7uvvcJC38NE7ORM/+Nd3XqnKFV/9r0dLmD0xEj/v0swHXbAAAAZXkYyRqveDjA9V
         VY3b01Iowj25qAgYA5Rwl7kwCSw7uvjjDyMJz+gkc8BSrE4AN8q3ctxcoF1qKVqc3cyT
         jgsfnOuUTGMg7OjXhmviknwNHT2Fy5NHZBwWiJ+RRhBZnRvOm/ejURAk01atETsUjGe7
         2+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587138; x=1695191938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXni+5boQmEaYGoN3pj3Gay1Zsi6v5dMqRf5NvenPXw=;
        b=A3ah4RQ+OoZIa1WBTE/ndSxfeMHwVKTtn2sG18OhazFFW3ofiL+uQaezTg5TcVlA9Y
         Pp/+Ts+qwgXtBSEwfXngdC9xdBFGQGvSPK4oCtBBC/EP2sGXLxsOIKkzHQjs232un/K0
         e9EhaPMArhtVuLYAODwitPPmnu1rE8FDVg2w6I1g4KGq3dBuY+yngQaW+/r3f/wM6FJ8
         orZLFucjwG7TB6hGzqSRu7jMPGzvD1qb5mSEbVknQ1rME0/ODvk2Ykl0D+XUV+2Bz2vw
         iHwf7kU7ut5gZZvo7kzssO3RRpqGhPg4QB3I90XUiB1rnrgIkmuCfWWvzMsnli+W5SXb
         ZvtA==
X-Gm-Message-State: AOJu0YzpWwbWgEjv4IiH51Zgit/3KRlFtswMYiuqpCvhZqXoS7Pzznoc
	SKhGr35XvxARdUbKyzRIJUfx2w==
X-Google-Smtp-Source: 
 AGHT+IHjbiauJkI1GqGxKgcBlVc77B/2lF4dOPnQfOl3dEP1ToJieZ2KwqLjU/XSoTj0LZdfUvhUqg==
X-Received: by 2002:a05:600c:2147:b0:401:b1c6:97e8 with SMTP id
 v7-20020a05600c214700b00401b1c697e8mr1253612wml.36.1694587137780;
        Tue, 12 Sep 2023 23:38:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003feae747ff2sm1030573wmk.35.2023.09.12.23.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:38:56 -0700 (PDT)
Message-ID: <644e3564-994d-0b51-7d58-dac6afc1e0ec@linaro.org>
Date: Wed, 13 Sep 2023 08:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: dwc: Add Single DMA mode support
Content-Language: en-US
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, fido_max@inbox.ru, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
 robh+dt@kernel.org, tiwai@suse.com, u.kleine-koenig@pengutronix.de,
 xingyu.wu@starfivetech.com
References: <bf43b771-35e3-1b37-24f5-e21b2c34a415@linaro.org>
 <20230913025342.1460157-1-mwkim@gaonchips.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913025342.1460157-1-mwkim@gaonchips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZSUF2VPOB45JEQO7MBUNOCG6CJ3QAOYH
X-Message-ID-Hash: ZSUF2VPOB45JEQO7MBUNOCG6CJ3QAOYH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSUF2VPOB45JEQO7MBUNOCG6CJ3QAOYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/09/2023 04:53, Myunguk Kim wrote:
>> Bindings are always separate patch.
> 
> Okay, I will send v2.
> 
>> This was not tested. Missing vendor prefix, type.
>>
>> Anyway please provide some explanation why this cannot be deduced from
>> the compatible.
> 
> This is not dependent on a specific vendor, 
> but is intended to describe 
> the properties of the signal(single/burst request) connection 
> relationship between i2s and dma.

How does this relationship depend on hardware?

Best regards,
Krzysztof

