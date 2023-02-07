Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2968E41C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:04:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E08C847;
	Wed,  8 Feb 2023 00:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E08C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811066;
	bh=Tv0qwjL36Zj7V/yJ92hZWmfaFgCQZjhp5s76520fDgQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JQiIC+usUSl34Y4wj+LuZW5Fi9GO0MUb24uY8ISonwyCJS4KJXzpngNOiuRJPVvlE
	 fky7Trt2DYtNDsU/gZcVMGUkkvOQO3rAh4zqELmTn/UalVHgZ4B6wPrW9FhkJW7brW
	 uGrOCpoLBkfYHdlJU22MMPz3wXz2H853nrjO9M0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDF2F804CC;
	Wed,  8 Feb 2023 00:03:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2BD4F80518; Wed,  8 Feb 2023 00:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA3FF8012B
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA3FF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bgfak1jD
Received: by mail-lf1-x12b.google.com with SMTP id bp15so24508431lfb.13
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ6efCB61TIYLPpmHdBk+1/LSUB0gQyc/JjMU48i42c=;
        b=bgfak1jDvCOVHQQGElWmnD2lEOMEwTBINLogn9Eq0pKQvrNoRAXz8j0EjilZ4k4JYP
         Vmw1eHnC760O26q7ev3uIE0BV6+vlXEgBj9WZuAF5e66h3wBo485l/vcuMKvan2wuHS9
         uIuDOePMn2u7AxdEg1LCq6cSzyJdVmnweP3F/9KzJzC72dHF+4vH+mX10ivzZVBVOho6
         JkVdG1kEid5uJS9lG3OqmKHUgTw4VWggv5Y3fp+saqbVXt7SMQPYQ1sclQWTrrzEHYht
         9Q0FUICTHFi4DO3gHhDSKvWkENjBFuJPlokc1Z8D9JP89mJyHhZl60+6O7RwwyyQhirs
         ml5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ6efCB61TIYLPpmHdBk+1/LSUB0gQyc/JjMU48i42c=;
        b=EO/RyDTz+dxWRD7VL7oYewwy4Oq65rGiWpW6W78Y7JK9zoGRMtfHMK67HWGwlFuuhB
         WWzcq6gwIwxwz8dUCsn5Yjy24Qo+Hmrm9xaTFDUL9FWBsHHFH73pigA2mob2HCW4/A5d
         7DYfQ1C4fR1+X+w/xOQRGGa/IjA+cyZYPDiEVMOe9AmdTXW7+YH3UqgwcBI4pJu+jV8g
         hDA6PqDNGB5zXFSwEfiMu4dBzeqths2L/wP5bO5B31vg1shZ1MBokUMa38CXcj31sqZc
         xcUv8082Meb1A3lko/wJDAEi4XMFf07aUerxmQ6W8hForTacjXUqngudyDJU9Qujqo1K
         /zqA==
X-Gm-Message-State: AO0yUKXppiru0khC+0N8rxatd/ocjO+zu+iGOI7ECERs3IIBjXcTD/qP
	GaNRHsDHQm6+A5rerHZkL8xp1lfDu2M/duZl
X-Google-Smtp-Source: 
 AK7set/wpe72cljXd1fwohTpF1E1pBpcSt320AhZrTM3txhgwmGemUE2cxJ3yvXcCkWxTecsGoIF1w==
X-Received: by 2002:a05:600c:1d8b:b0:3dc:198c:dde with SMTP id
 p11-20020a05600c1d8b00b003dc198c0ddemr3515818wms.41.1675788541619;
        Tue, 07 Feb 2023 08:49:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c468a00b003e0015c8618sm7074580wmo.6.2023.02.07.08.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:49:01 -0800 (PST)
Message-ID: <56ce2617-4fd1-d597-a4dc-918654cdd3f6@linaro.org>
Date: Tue, 7 Feb 2023 17:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
 <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
 <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
 <44c7274f-8a5e-0235-413a-6c3260018601@linaro.org>
 <4efe9796-6d3e-09d1-d5f7-cfb25a439061@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4efe9796-6d3e-09d1-d5f7-cfb25a439061@collabora.com>
Message-ID-Hash: FVHH5LAH2ICB4T2OM4QNS4TM6IDD7CYJ
X-Message-ID-Hash: FVHH5LAH2ICB4T2OM4QNS4TM6IDD7CYJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVHH5LAH2ICB4T2OM4QNS4TM6IDD7CYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/02/2023 17:34, Lucas Tanure wrote:
> On 07-02-2023 16:13, Krzysztof Kozlowski wrote:
>> On 07/02/2023 16:46, Lucas Tanure wrote:
>>>>> +      Shared boost allows two amplifiers to share a single boost circuit by
>>>>> +      communicating on the MDSYNC bus. The passive amplifier does not control
>>>>> +      the boost and receives data from the active amplifier. GPIO1 should be
>>>>> +      configured for Sync when shared boost is used. Shared boost is not
>>>>> +      compatible with External boost. Active amplifier requires
>>>>> +      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
>>>>>          0 = Internal Boost
>>>>>          1 = External Boost
>>>>> +      2 = Reserved
>>>>
>>>> How binding can be reserved? For what and why? Drop. 2 is shared active,
>>>> 3 is shared passive.
>>> 2 Is shared boost without VSPK switch, a mode not supported for new
>>> system designs. But there is laptops using it, so we need to keep
>>> supporting in the driver.
>>
>> That's not the answer. 2 is nothing here, so it cannot be reserved.
>> Aren't you mixing now some register value with bindings?
>>
>> Best regards,
>> Krzysztof
>>
>>
> I have added a new patch with propper documentation.
> And I would like to use 3 and 4 for shared boost as 
> CS35L41_EXT_BOOST_NO_VSPK_SWITCH already exist as 2 and is used in the 
> current driver.

I don't see CS35L41_EXT_BOOST_NO_VSPK_SWITCH in the bindings.

> The laptop that uses CS35L41_EXT_BOOST_NO_VSPK_SWITCH doesn't have the 
> property "cirrus,boost-type", but to make everything consistent I would 
> prefer to use 3 and 4 for the new boost types.
> Is that ok with you?

I don't see how it is related. The value does not exist, so whether
laptop has that property or not, is not really related, right?

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
