Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7177CDFC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D86828;
	Tue, 15 Aug 2023 16:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D86828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692109353;
	bh=LpwRdBHK65oox1bjwAG0ZgYMQPrDoHOBjAICGjFsMmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ScpcOs6auHPXySNnp2tz9jIoC5biUzEcsORkMqkyPHPzp3wTy9DP3BobDHkVwpz5e
	 AY35j3gmy+SuXPFE/4CIH38va2mnPoX/YFNGaWziH0uhjnOYz8FHCdjFJH9FN9BVYs
	 rJPhOgUE0F89i7l954ZreceOvvNo/1dB6VFkc9eI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 298F0F80510; Tue, 15 Aug 2023 16:21:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD447F8016A;
	Tue, 15 Aug 2023 16:21:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC89F8016D; Tue, 15 Aug 2023 16:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04529F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04529F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W8xTN3Mu
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so49485385e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692109294; x=1692714094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcRYAsELzZ8xRLuoOUuCkPhIs6L8FpGXiLKJ/U31bwc=;
        b=W8xTN3MuYzsk/gktkGIfSE/PAeK98mpIjOfIYE/T3/2MX3yrRDb3azJBlDK7GzR4Tz
         AeAQ1bz+s0fHgqrEMYLn3BVVDyNWduExyhI/6N/4zIrQJuAHXr6fFhOmTLj7hWxMmtET
         1u+RyuVd3gerwE9AxrDSts6g178F9f5MN/GgBsJpDdw4XytAeIFvwXAlXtAlnl9aoNyT
         coz/AW+OnpkcCaCsvms44BGaXma8zUXstmUicH+SC/GSxqHJqyGj8TRnunGmkcLQPnqh
         WzkN91TLjGSWaHEkSsrKad4jQ3Ez58daY/eHTzDqMHDAj7vUlZNJu+dVeCKapvbKTuZD
         iKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692109294; x=1692714094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcRYAsELzZ8xRLuoOUuCkPhIs6L8FpGXiLKJ/U31bwc=;
        b=KonoA3fGeWw/b8r0xf1UzGi6Oz49nY7bSYBb5gKz2NmaX26hIBAGFbE25oa5ZzHBcm
         sLG1+0OWWZvwB743ygoi7W2uexcAQiuvfm3jOvM05nhdEhiOegqZwFytMtx4JyoHM0C5
         idLzU/xLCPG3bclTzgMSbs7xFtWQCCym5g5D/jkYSYmZxyIw3pv2ZebDueq2VRoWZBDR
         5yvB9iVBgP8Q8gfjoFQC/mfQGCPyD3L8tjM9COQbAEXqaGnZEtCwGLlv++DnGzHWDkqC
         X8IpzHnFg+SJ2omkCtlIdmKQ84mr7YIAJakTHahgWQcrUKn1KCSDvr0x4a4exYW3X6iv
         UM8A==
X-Gm-Message-State: AOJu0Yzucr/ePsCgc7DG8TmPL19jW9endhKW66zezUF7auurnhb9WsQv
	mZpbwHImxYBI/JPWExBpiuTr4A==
X-Google-Smtp-Source: 
 AGHT+IGMZDYsY9WXT/bGyg3GabwvTyu8r4sZ31hz3OHbKpNSggTjUynaU2Kv5wRsGCL3EmjExdrD9A==
X-Received: by 2002:adf:e784:0:b0:319:6d91:28c2 with SMTP id
 n4-20020adfe784000000b003196d9128c2mr6426748wrm.61.1692109294035;
        Tue, 15 Aug 2023 07:21:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b003141f96ed36sm18128814wri.0.2023.08.15.07.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:21:33 -0700 (PDT)
Message-ID: <e8548782-65bf-114e-afb9-f0450468f6a5@linaro.org>
Date: Tue, 15 Aug 2023 16:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of
 aw88261_reg_update()
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, llvm@lists.linux.dev,
 Andi Shyti <andi.shyti@kernel.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
 <7b35b3b6-7eab-4652-9a16-851a060350bd@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b35b3b6-7eab-4652-9a16-851a060350bd@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SF57TLTYXZHJHAEX7VVCMLBCCXWAUKGL
X-Message-ID-Hash: SF57TLTYXZHJHAEX7VVCMLBCCXWAUKGL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SF57TLTYXZHJHAEX7VVCMLBCCXWAUKGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/08/2023 16:10, Mark Brown wrote:
> On Thu, Aug 10, 2023 at 12:47:43PM +0200, Krzysztof Kozlowski wrote:
>> There is a branch in if() clause where aw88261_reg_update() could return
>> uninitialized value.  Pounted out by W=1 clang build:
> 
> This series appears to have two copies of every patch which *look*
> similar but I'm not 100% sure if that's the case or in general what's
> going on - could you please resend a clean copy, it's probably easier
> than figuring it out?

Sorry for that, I must have screwed something while sending. I'll rebase
(first patch seems to be already fixed by Arnd) and send again.

Best regards,
Krzysztof

