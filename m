Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC386F5995
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 16:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547AE1331;
	Wed,  3 May 2023 16:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547AE1331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683123189;
	bh=Sdc17yyLFNgQb0H5vTTPJSsrbyvScz5vZiBycvsufh0=;
	h=Date:From:Subject:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JGW1ZLk7Cna5VpOqHy95ijCu8ASn8KDuwxcEt/9tWDsdEUUeiwMpMV8Xl0cov+iKd
	 pMmHgabB8y+UNujbLcyCfRex71JtcH+HhYRZStCnJvZ9roV/+/St7oPbf8u5z9AoKW
	 JecsaGDZxm1dVBXC8Ywh4LyM5KSYOkPlNNv8vw6M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A927BF8032B;
	Wed,  3 May 2023 16:12:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A48F8049E; Wed,  3 May 2023 16:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D484F80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 16:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D484F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R4ZikZhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683123126; x=1714659126;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Sdc17yyLFNgQb0H5vTTPJSsrbyvScz5vZiBycvsufh0=;
  b=R4ZikZhFGndx/bxDLMNGJZ9vYMMDu+75XYa2fMxxiXY8fTLo2BKeoAjB
   uKLqoLFxN31Sxt3MFtR+QiGTemeAl0AdZuQIgw06Fxrqw3xek6yvUXpng
   mPcYQJiCWkZilJUia1r/lsFYwqdqEDnje29ECN1CYsy7YGhUot9rBOZvN
   ofZtr4p5Bepl27scfi6HRwbv0/NmPahBBCmeUl5XBGEg7sML2xhUyZIcZ
   eOjlXj0vUg+B/ta03pa3y8uKd/zW4xD3nO9qit4NXR5R9z5rmGG4ToX4M
   ondUeK7BEc9PjHhxOOgoes+zgMYce1aXrAR3jZr/zF00NNhFca0ssyGFY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350740566"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200";
   d="scan'208";a="350740566"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 07:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026512753"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200";
   d="scan'208";a="1026512753"
Received: from jshields-mobl.amr.corp.intel.com (HELO [10.209.77.83])
 ([10.209.77.83])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 07:11:59 -0700
Message-ID: <3dc77f99-2237-80c9-64cf-19e392aaccc9@linux.intel.com>
Date: Wed, 3 May 2023 09:11:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/6] soundwire: qcom: do not probe devices before bus/link
 init
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <b3e227d4-1bdf-9f58-a354-e7f798765e91@linaro.org>
Content-Language: en-US
In-Reply-To: <b3e227d4-1bdf-9f58-a354-e7f798765e91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PKZAUX4ILHPPAEVV7V7WABTWT4TAAWQO
X-Message-ID-Hash: PKZAUX4ILHPPAEVV7V7WABTWT4TAAWQO
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKZAUX4ILHPPAEVV7V7WABTWT4TAAWQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/3/23 03:00, Krzysztof Kozlowski wrote:
> On 01/05/2023 15:43, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/1/23 07:24, Krzysztof Kozlowski wrote:
>>> On 20/04/2023 23:37, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>> On 4/20/23 05:16, Krzysztof Kozlowski wrote:
>>>>> Soundwire devices are supposed to be kept in reset state (powered off)
>>>>> till their probe() or component bind() callbacks.  However if they are
>>>>> already powered on, then they might enumerate before the master
>>>>> initializes bus in qcom_swrm_init() leading to occasional errors like:
>>>>
>>>> The problem statement is really hard to follow.
>>>>
>>>> The peripheral can only be enumerated AFTER
>>>> a) the manager starts the bus clock and transmitting PING frames
>>>> b) the peripheral detects the sync words for 16 frames in a row.
>>>> c) the peripheral reports as Attached in the Device0 slot
>>>>
>>>> That sequence holds whether the manager does the enumeration manually or
>>>> relies on hardware-assisted autoenumeration. This is what the spec requires.
>>>>
>>>> So why can't the bus clock start be controlled by the manager driver,
>>>> and started once all required initializations are done?
>>>>
>>>> I mean, there's got to be some sort of parent-child hierarchy with
>>>> manager first, peripheral(s) second, I don't get how these steps could
>>>> be inverted or race.
>>>>
>>>>>   qcom-soundwire 6d30000.soundwire-controller: Qualcomm Soundwire controller v2.0.0 Registered
>>>>>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops)
>>>>>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops)
>>>>>   qcom-soundwire 6ad0000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
>>>>>
>>>>> The problem primarily lies in Qualcomm Soundwire controller probe() sequence:
>>>>> 1. request_threaded_irq()
>>>>> 2. sdw_bus_master_add() - which will cause probe() and component bind()
>>>>>    of Soundwire devices, e.g. WCD938x codec drivers.  Device drivers
>>>>>    might already start accessing their registers.
>>>>
>>>> not if the bus clock hasn't started...
>>>>
>>>>> 3. qcom_swrm_init() - which initializes the link/bus and enables
>>>>>    interrupts.
>>>>
>>>> if you can move the clock start in 3) then problem solved. Why can't
>>>> this be done?
>>>
>>> Responding to all your three responses:
>>> The clock is enabled in this 3. qcom_swrm_init(), so the old code to my
>>> knowledge is written exactly how you expect.
>>>
>>> However even with stopped clock, the device enumerates at
>>> sdw_bus_master_add(), before anything is enabled.
>>
>> Erm, that's not physically possible...
>>
>> The peripheral can report as attached and be enumerated by the manager,
>> i.e. assigned a non-zero "Device Number" after the peripheral
>> synchronizes on 16 frames with valid static and dynamic syncwords. That
>> can only happen if there is a clock toggling and PING frames transmitted
>> on the data line.
>>
>> There's something else at play here.
> 
> Yes, I think you are right and that "else" is my limited knowledge on
> the entire setup.
> 
> You gave me awesome hint in email before that probe != enumeration !=
> initialization, however the wcd938x sound codec drivers were assuming
> some steps are equal.
> 
> wcd938x comes with three devices on two drivers:
> 1. RX Soundwire device (wcd938x-sdw.c driver)
> 2. TX Soundwire device, which is used as regmap (also wcd938x-sdw.c driver)
> 3. platform device (wcd938x.c driver) - glue and component master,
> actually having most of the code using TX Soundwire device regmap.
> 
> The probe of each RX and TX Soundwire devices added components, but that
> this did not mean devices were enumerated, as you said.
> 
> Considering what Mark said about using regcache (and sync it), I am now
> replacing entire solution with proper regcache handling device
> enumeration after component bind.

I thought you were talking about ASoC "struct snd_soc_component" but no,
that's "struct component_ops" in wcd938x-sdw.c

Now I think I get the scope of the problem, I didn't click on the fact
that it's a platform driver that registers ASoC components, and not the
SoundWire codec driver.

That's certainly more complicated than any other SoundWire-based systems
I've seen so far. It's already difficult to keep track of the SoundWire
peripheral driver .probe(), the ASoC component .probe(), the SoundWire
bus .update_status() callback and now there's
the component .bind() added.

Wow. What could possibly go wrong, eh?
