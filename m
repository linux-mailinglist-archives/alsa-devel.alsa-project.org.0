Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58506E96D9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 16:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D64EB3;
	Thu, 20 Apr 2023 16:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D64EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682000287;
	bh=wSQXAIlASVHgAtVE6V7OtxpTFKVmey1nafWVdgWhx+E=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fOyf/nXdzk/wIRfat0pngD6yGktkWCinHH+lwCMmXc260iCUOxbdj5xe4Mk/CuXAF
	 JPalxLdCvIYOD1j9fs+O8fs/MyyZGIKZtN8uiRHHlCgfn3tLQnmG43//3jYmqqI4cp
	 RZvbZhqsiBFpvMlrMXTPB7be3e5DzVkaSALxtWGs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BBAF80149;
	Thu, 20 Apr 2023 16:17:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884FDF80155; Thu, 20 Apr 2023 16:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7F3CF800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 16:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F3CF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CEG9kZmA
Received: by mail-ej1-x634.google.com with SMTP id b16so6795477ejz.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682000221; x=1684592221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wQNlD/zbZubVbAb6VQ4BMWQUxzOi/x1fP1cdt2Qu0U=;
        b=CEG9kZmAnGhpNiLQzNWUaanr8TDi+itdH6w6BGOHZV/L3Khz0ly4xEA6gOdmHxZAlb
         va83cflx0YB2yZcMQY9uMW0TpxNvxehn9oHGxtjCt4/9u4rUbiBuT0dVeY5NFlxvx2cB
         bRb8X6MSjNs20/5o9kMnm8w9QWTAWNu/kiwWEfMFRzuWhnfdPkPKFFdbmyPKcN3bDPtg
         z+oEVSu3+7bKJVVbhSwN+EsWcpG+NC9H7gWiTkQie0CUO2aN04WEHKB7JHuKsykGUrvn
         HJXGkYX+CUHMsushEYqon31xu4I6Q8lD8aeUhH3/dnEeMihCJoWmWeretCmKy+9Lrl42
         FSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682000221; x=1684592221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wQNlD/zbZubVbAb6VQ4BMWQUxzOi/x1fP1cdt2Qu0U=;
        b=KqjUk5zW4vHJcJUvbNcbTvmEYS7ubmsejbvgAcRJRYh2TnMyJAEurHBh2akGqK6CaM
         AfsvMVgrNKdxWbLXH2/+EtmgFl18g2op3Lg5/dsmupcU8nUG6yDY0d4p8dee/QVdEJ3E
         poGCLVKISgYIi3/pbp3QxEIwGMPpUYZ4qFuwN9grqQnd3vq/vQ2tHb/p39RDrgcXsFw8
         EK8ZDPtleuZwqqwr1YaFUewICfCr9oj+SqQ0jEBhwdMtloiYthskYSi4QfkGHTI3IYBM
         DA53xbuMdYAcEtsjwZ0tBzByipuPtrvGI4Ewbz5AvKzpdVi+C/tX82MOJYxSh9V/5Sxb
         nZNg==
X-Gm-Message-State: AAQBX9eDtQ+IkPjCgU4rmwP6bB74HLd+Q3OXqiO3of6LZs0g8EG1WBxw
	ORtYzPK03V51pVEWR06pTzhC+xoRYtUwYpeSHUy9Kg==
X-Google-Smtp-Source: 
 AKy350aRuYn9h0pCNvXsQuwGrEtaGF1pLj3VELsUGLD94aFA63MGBQRcR7yq4IQshi2XqiqXYm/pqg==
X-Received: by 2002:a17:906:a9b:b0:94f:3521:394 with SMTP id
 y27-20020a1709060a9b00b0094f35210394mr1655353ejf.51.1682000220961;
        Thu, 20 Apr 2023 07:17:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 mb20-20020a170906eb1400b0094f432f2429sm773438ejb.109.2023.04.20.07.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:17:00 -0700 (PDT)
Message-ID: <3eb0cbb4-f6d9-db8a-031e-92627e70f41e@linaro.org>
Date: Thu, 20 Apr 2023 16:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
To: Mark Brown <broonie@kernel.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
 <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JWRX6GOHEQZHPLNE7CU6NAVI2CGLTXBO
X-Message-ID-Hash: JWRX6GOHEQZHPLNE7CU6NAVI2CGLTXBO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWRX6GOHEQZHPLNE7CU6NAVI2CGLTXBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 15:00, Mark Brown wrote:
> On Thu, Apr 20, 2023 at 02:30:17PM +0200, Krzysztof Kozlowski wrote:
>> On 20/04/2023 13:58, Mark Brown wrote:
>>> On Thu, Apr 20, 2023 at 12:16:12PM +0200, Krzysztof Kozlowski wrote:
> 
>>>> -	gpio_direction_output(wcd938x->reset_gpio, 0);
>>>> -	/* 20us sleep required after pulling the reset gpio to LOW */
>>>> +	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
>>>> +	/* 20us sleep required after asserting the reset gpio */
> 
>>> This is inverting the sense of the GPIO in the API from active low to
>>> active high which will mean we're introducing a new reliance on having
>>> the signal described as active low in DT.  That's an ABI concern.
> 
>> It's bringing it to the correct level. Old code was not respecting the
>> DTS thus if such DTS came with inverted design, the driver would not work.
> 
> Sure, but OTOH if the user didn't bother specifying as active low it
> would work.  I suspect it's more likely that someone missed a flag that
> had no practical impact in DT than that someone would add an inverter to
> their design.
> 
>> We were already fixing the upstream DTS users and I thought all of them
>> are fixed since long time (half a year) or even correct from the
>> beginning. Now I found one more case with incorrect level, which I will fix.
> 
> That's just upstream, what about any downstream users?

Life of downstream. We all know the drill: merge your DTS or suffer. The
WCD938x codecs are moderately new, so I do not expect many downstream
users. They are in theory possible, because driver was merged in
v5.14-rc1 and for the newest products Qualcomm uses v5.15. Although now
it is v5.15, but the time driver was merged, maybe it was v5.10.

I could rework this patch to provide backwards compatible solution like
I did for WSA:
https://lore.kernel.org/all/20230102114152.297305-4-krzysztof.kozlowski@linaro.org/

There are downsides of it, but as you pointed out - it's actually very
rare to have the signal inverted in hardware.

> 
>>> I remain deeply unconvinced that remapping active low outputs like this
>>> in the GPIO API is helping.
> 
>> The code is mapping them to correct state. The previous state was
>> incorrect and did not allow to handle active high (which can happen).
>> This is the effort to make code correct - driver and DTS.
> 
> We could handle inversions through an explicit property if that were
> needed, that would be a less problematic transition and clearer in the
> consumer code.

I am not sure if it is worth. The DTS is supposed to describe hardware,
so even if reset pin flag was not effective, it is a mistake to describe
it as ACTIVE_HIGH. Do we care about keeping broken code happy? If yes,
then property is the way to go. If partially, then I can add
backwards-compatible approach like I mentioned above.

Best regards,
Krzysztof

