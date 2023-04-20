Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 673166E947E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 14:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF44832;
	Thu, 20 Apr 2023 14:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF44832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681994024;
	bh=aoIY2zIhZUgr8oKar5hCNP8Iy2DTJk/UP2xUGqHoBwQ=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ipQULuShCfk0yq93g5igy17r3S74i1es+8YYCl+ttVjsMX/Yaj5Xu+fA1ZJ/Mgij5
	 CpbyeuKhrY5wGw/lHVhpZOnG1eMJh7vwLPr2s5HN08osqXPPhcnagCWvtsM9PvmP4z
	 4EcJ+3iDOZ3vQ/5Jrkq2xwoxzfpIL3mZCQ6i3if0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A1FF80149;
	Thu, 20 Apr 2023 14:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 343FEF80155; Thu, 20 Apr 2023 14:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D47D7F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 14:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47D7F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OIoKuGGi
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so3849312a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681993954; x=1684585954;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53J0OnnwTTvP3fEiCKzAu0mdWJJtadmQyC8IMtn5GfY=;
        b=OIoKuGGijqyWw4bJYWhYgr9uuEf0oWAOGkW7aBrODsmZWuHO3V4uchC7+TTQhxL9uj
         N+o6GX3yZomqIWPoVU8xl8+n1NvsLN/XY0EduU22cTeIyY9U4KIlz1O+SAjfHUVU1cfL
         XETLDBe9ZqrMvaxfS3NQjXRf5Xetme2B4n9g5ykRxhShiVEI5L2hf7a7oqpmx+cUNnT8
         uKlL9aYYxwjyFpsGvtiiLfOdk6Ubc9vqfOaVkSxyPSgZPxQpZYnjX/lW4ZE/Sbli7nia
         ulLNs1kuN/aGCTIWfNiiklBsGOuFOrzcaopqLIaBOAHLq6hwM2L/xP7aAoY1AUaSLIL6
         INNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993954; x=1684585954;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53J0OnnwTTvP3fEiCKzAu0mdWJJtadmQyC8IMtn5GfY=;
        b=UVhM23cQh8sepYz6Bu+E92t3D7NKmEzUZVNGqy0GaNPQAlAMtP4L3pYFhPrFHo1svK
         JD4nIka3BxwsQOWKrxVrAlj4IjRE8Wws/EbgG8z2bcuRPsOb/0EmCnG2zrnKy33cuwRt
         mGCDKmskVC3S+W9zgQEBHA3ExTN88FY2aHCGDoaTCbqvAllbnQ2GFcoPzya+ipLFRvPT
         mPPXOf2fkov+8TX4SeONP7DOZ9iZtLNAJEbJol/7q//7X29ImQjpO7NKVACTO134TZlx
         y3q5CDPE8Dt+V72WtlEzlz8zrTEfo4lcPHwLSAqaT8XJaFyA0A8117z0CBWPOYa+0RgP
         LZGA==
X-Gm-Message-State: AAQBX9esmnIv7qkoxqWtnc+etVypoiA4F7bG63JUgxPbjo60iqvxGABc
	QjOTQIif6VhslbZA96YyrUmC3g==
X-Google-Smtp-Source: 
 AKy350bv1wfr1ZJ4XXmpodBIBbP1QCVtJLNuvfULoIwjZ8rzdQgW4efe5Z2wJ9xDI4AyZKxIj8vLsA==
X-Received: by 2002:a05:6402:d1:b0:506:c238:4067 with SMTP id
 i17-20020a05640200d100b00506c2384067mr1451932edu.8.1681993954366;
        Thu, 20 Apr 2023 05:32:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a05640210d300b005067d089aafsm707694edu.11.2023.04.20.05.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:32:34 -0700 (PDT)
Message-ID: <090a1baf-ba2e-669f-7e31-cd97d1d5a970@linaro.org>
Date: Thu, 20 Apr 2023 14:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
In-Reply-To: <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P6PRZ764HC76MOT4IMSRBYDLMPJFTHQW
X-Message-ID-Hash: P6PRZ764HC76MOT4IMSRBYDLMPJFTHQW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6PRZ764HC76MOT4IMSRBYDLMPJFTHQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 14:30, Krzysztof Kozlowski wrote:
> On 20/04/2023 13:58, Mark Brown wrote:
>> On Thu, Apr 20, 2023 at 12:16:12PM +0200, Krzysztof Kozlowski wrote:
>>
>>> -	gpio_direction_output(wcd938x->reset_gpio, 0);
>>> -	/* 20us sleep required after pulling the reset gpio to LOW */
>>> +	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
>>> +	/* 20us sleep required after asserting the reset gpio */
>>
>> This is inverting the sense of the GPIO in the API from active low to
>> active high which will mean we're introducing a new reliance on having
>> the signal described as active low in DT.  That's an ABI concern.
> 
> It's bringing it to the correct level. Old code was not respecting the
> DTS thus if such DTS came with inverted design, the driver would not work.
> 
> We were already fixing the upstream DTS users and I thought all of them
> are fixed since long time (half a year) or even correct from the
> beginning. Now I found one more case with incorrect level, which I will fix.

No, my bad - all upstream DTSes are corrected since half year.

> 
>>
>> I remain deeply unconvinced that remapping active low outputs like this
>> in the GPIO API is helping.
> 
> The code is mapping them to correct state. The previous state was
> incorrect and did not allow to handle active high (which can happen).
> This is the effort to make code correct - driver and DTS.

Best regards,
Krzysztof

