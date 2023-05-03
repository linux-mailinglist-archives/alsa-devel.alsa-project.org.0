Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255AF6F527C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 10:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD5E134D;
	Wed,  3 May 2023 10:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD5E134D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683100888;
	bh=V/4ypLr9tYbnEfhmfluFmzj79K/oC3yRDc2HDjzEM80=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fK0DeKqiwnRVqsqzqXl2YNAPcOYvG8aEGQKRjKTmawqi1MYmK1zUhJLAOo649yuFo
	 X5Di70Hn4HJASN9SsUOSHAe/eJefNNFx43CVl6j59feXokXF/1SZQW/IYLb8xzQ0wB
	 ZmjdfNBUBM0U4OZq7AJbd1xzdQrpFWKt5jpIKPV8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED19F8032B;
	Wed,  3 May 2023 10:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BECD6F8049E; Wed,  3 May 2023 10:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66E14F80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 10:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E14F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XKpO/jtQ
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc5197d33so6344022a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 May 2023 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683100819; x=1685692819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDbcd7WqGVeRLL02ERpjzOWzEQ8QCr4sxAPprp+7Tic=;
        b=XKpO/jtQf7swVp2+niPXDJtv62ipHkMbsef5wWma2J43jj6tBUBcI3P7pEM4wjFH8p
         5/lnpT7JqB36XiqzwMrXSsJvYLWDPtswP6ZurpYSs+er2XP9jfgmhFqcagNbcfgfR59g
         ltJBzthBzusiNRteiPeh4jU6JdNu13Ed8B9YM/UjrgBOd3IOI/2hsx0qz6E1/8W4qdhT
         90K5dmPn3Uucq5VP+E6ScKxCQuOAJAxVg1zJup+sSiFQ/HpIPD/23pUBX6zQTIZLhPUN
         5yG+IHTwrOBHh5QwfAChV83KRHfWAHAe9HsMDN6pjUK59v+bsHZJj0EM8KRNzrBW/92k
         NgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683100819; x=1685692819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDbcd7WqGVeRLL02ERpjzOWzEQ8QCr4sxAPprp+7Tic=;
        b=iVi78oYJQHRvxD2sq3G+mI2uON45BBs140TvstzZ0tBegWljn4uGuUHt0gXnBpv/+c
         2rlhSDqEzhXTCWgRw4Ln4e1wRqCZAZ4KRMZL8V+ROJul4phOV7NndJca3bbcW0WEtn+a
         IQb5dsIkzEAYuPOHjo4lx5Syle+nw4JWVpa4wl+FxB/jtUyhRI0ROelklP2GxsS/QKBa
         nVnYs4FkKQBfFZpNovMwtQRyR+2N6/uFp2CQSU5bD9Q4s8US1+xB8iEf/kmHW0aBI0OT
         O/s/qfh4aLmpb0v2gXTBJX8Hrm7Fz9qngeheX4X8xKzKmATMuKTSV50cvDhQ5TEAFeDE
         cmdg==
X-Gm-Message-State: AC+VfDwALClq6/xE2OMYfL2zS+8EWSG9hd07kHCSr1xJ1kNgG3aRQcw8
	G17mPJXAlNDPyjZHrYVBtW87/w==
X-Google-Smtp-Source: 
 ACHHUZ6lXDlOR3mp+rsdhGh4eUn3gQ3+nAzJWxexqEU2mAxaH0A8yN3eJHCzcLI0u1bOfl0Iqrk1Kw==
X-Received: by 2002:a17:907:9485:b0:94f:720b:1b14 with SMTP id
 dm5-20020a170907948500b0094f720b1b14mr2456927ejc.29.1683100819322;
        Wed, 03 May 2023 01:00:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5?
 ([2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5])
        by smtp.gmail.com with ESMTPSA id
 bj1-20020a170906b04100b0094f7acbafe0sm16105889ejb.177.2023.05.03.01.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:00:18 -0700 (PDT)
Message-ID: <b3e227d4-1bdf-9f58-a354-e7f798765e91@linaro.org>
Date: Wed, 3 May 2023 10:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] soundwire: qcom: do not probe devices before bus/link
 init
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-7-krzysztof.kozlowski@linaro.org>
 <28141433-2130-e278-0f59-d9ab507b9be3@linux.intel.com>
 <42fbf7ad-54db-0917-bb85-a1be9f99cc45@linaro.org>
 <3f618297-e1cd-a46d-5318-c3b77a0fc78d@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3f618297-e1cd-a46d-5318-c3b77a0fc78d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HPXP5Q4K2M7GDEIGUPCRNGEGQRFJ4CVQ
X-Message-ID-Hash: HPXP5Q4K2M7GDEIGUPCRNGEGQRFJ4CVQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPXP5Q4K2M7GDEIGUPCRNGEGQRFJ4CVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/05/2023 15:43, Pierre-Louis Bossart wrote:
> 
> 
> On 5/1/23 07:24, Krzysztof Kozlowski wrote:
>> On 20/04/2023 23:37, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 4/20/23 05:16, Krzysztof Kozlowski wrote:
>>>> Soundwire devices are supposed to be kept in reset state (powered off)
>>>> till their probe() or component bind() callbacks.  However if they are
>>>> already powered on, then they might enumerate before the master
>>>> initializes bus in qcom_swrm_init() leading to occasional errors like:
>>>
>>> The problem statement is really hard to follow.
>>>
>>> The peripheral can only be enumerated AFTER
>>> a) the manager starts the bus clock and transmitting PING frames
>>> b) the peripheral detects the sync words for 16 frames in a row.
>>> c) the peripheral reports as Attached in the Device0 slot
>>>
>>> That sequence holds whether the manager does the enumeration manually or
>>> relies on hardware-assisted autoenumeration. This is what the spec requires.
>>>
>>> So why can't the bus clock start be controlled by the manager driver,
>>> and started once all required initializations are done?
>>>
>>> I mean, there's got to be some sort of parent-child hierarchy with
>>> manager first, peripheral(s) second, I don't get how these steps could
>>> be inverted or race.
>>>
>>>>   qcom-soundwire 6d30000.soundwire-controller: Qualcomm Soundwire controller v2.0.0 Registered
>>>>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops)
>>>>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops)
>>>>   qcom-soundwire 6ad0000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
>>>>
>>>> The problem primarily lies in Qualcomm Soundwire controller probe() sequence:
>>>> 1. request_threaded_irq()
>>>> 2. sdw_bus_master_add() - which will cause probe() and component bind()
>>>>    of Soundwire devices, e.g. WCD938x codec drivers.  Device drivers
>>>>    might already start accessing their registers.
>>>
>>> not if the bus clock hasn't started...
>>>
>>>> 3. qcom_swrm_init() - which initializes the link/bus and enables
>>>>    interrupts.
>>>
>>> if you can move the clock start in 3) then problem solved. Why can't
>>> this be done?
>>
>> Responding to all your three responses:
>> The clock is enabled in this 3. qcom_swrm_init(), so the old code to my
>> knowledge is written exactly how you expect.
>>
>> However even with stopped clock, the device enumerates at
>> sdw_bus_master_add(), before anything is enabled.
> 
> Erm, that's not physically possible...
> 
> The peripheral can report as attached and be enumerated by the manager,
> i.e. assigned a non-zero "Device Number" after the peripheral
> synchronizes on 16 frames with valid static and dynamic syncwords. That
> can only happen if there is a clock toggling and PING frames transmitted
> on the data line.
> 
> There's something else at play here.

Yes, I think you are right and that "else" is my limited knowledge on
the entire setup.

You gave me awesome hint in email before that probe != enumeration !=
initialization, however the wcd938x sound codec drivers were assuming
some steps are equal.

wcd938x comes with three devices on two drivers:
1. RX Soundwire device (wcd938x-sdw.c driver)
2. TX Soundwire device, which is used as regmap (also wcd938x-sdw.c driver)
3. platform device (wcd938x.c driver) - glue and component master,
actually having most of the code using TX Soundwire device regmap.

The probe of each RX and TX Soundwire devices added components, but that
this did not mean devices were enumerated, as you said.

Considering what Mark said about using regcache (and sync it), I am now
replacing entire solution with proper regcache handling device
enumeration after component bind.

Best regards,
Krzysztof

