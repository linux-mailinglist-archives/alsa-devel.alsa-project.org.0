Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF551FF28
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAFAD18EB;
	Mon,  9 May 2022 16:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAFAD18EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652105367;
	bh=dfgyyp2bgHx4lItrLNcL7C771slb6v05K9yGx4NBETI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lVghSH2y/BXrcdrIvj2SdndpwmEC16oIIQynWaqyFUhM94QOHjUiJvZHa6FRtfG5h
	 x4h83PqxqK2UqmmrJGC3qoqRGObzuAsRTU0NK8zfKkw71ib4DpxrZLQollmw2B3jdO
	 32hSs0MvJW+myg+WlK5J2xJ/EroZM8wL/WSLsDDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14350F80269;
	Mon,  9 May 2022 16:08:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F8AF8025D; Mon,  9 May 2022 16:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D9FDF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9FDF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fjYKWuFA"
Received: by mail-wr1-x429.google.com with SMTP id t6so19646939wra.4
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CN3/TIblunEmTfTGTQQLjlPKeiSgXjQJ0JkChiazJpI=;
 b=fjYKWuFAh2nxD9f1IzYEzZEyT5Y44vxrJFNg3JmmakmsiDJvkYXqaIewg0v8eB0EP5
 iFAdYV7t0QdxBhlxtHkmlH8852MdyAEiFRDyolFRoQNO7jPjctJkG6odoS6FCwQtOB4o
 LfykkBZJ/l27KcFVpyeg6FTe8e1BeOCThxd9a30eSZcqF9GhFAHP+ZKsKV7jqOYBwA38
 j717LSyDNerwm1FWO7seDdqmMPlAMusOldFOBKxw5zG1Dg7ICP8DEJ6WOkvKotzUyc4L
 biurZGHal+JDwRCZzA5dT30fumVytXFvd96gKmxivJh4Kq1Mxd0z2utdXpXTaoXktD+Z
 d82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CN3/TIblunEmTfTGTQQLjlPKeiSgXjQJ0JkChiazJpI=;
 b=BIk2KBt+XzoDwop2OxUY/TCRUW/AvRJjkqEDOLg6+pfXHV6/Q25OORmmZsj2eaIAbV
 nPWCMf+4r7xl25yzC3KHU+vsovHFqkBPohluD3y2XmK4QTOU8fg46DBDlmwk8OCuMkDx
 Ss86XyL143ZqiZSgexa0PixSoBVI7MBuUYhhzZ/h/piZdNs3jM156sob05EmtKIhutuV
 eJmMHDwuy2qRZbr2R6cuaNCNINyPG2zh0we/+pTzgVnQfgR2QrYBmfdOATSueN/6blaJ
 lrMGOeMdw4vxEqBdmjFeXoxX7EVXrmtZv2aUz6ZOrwbY6RRISFv8+KpLa1R7frVmoOyu
 0TfQ==
X-Gm-Message-State: AOAM531fWLxOSmOdjQ85R0PnCgwW1LFcbybbkMjVUxr0+9a1CO0O86kq
 9OnfIMK6dgoSIvp3kifp22N8Mw==
X-Google-Smtp-Source: ABdhPJyrM1S7nbR0Cl1V0XFRvhXAm3F8I6t0KELsVJLnGWEV4yBOC6N5aFBvRrp6sKKjF6xyFF71Fg==
X-Received: by 2002:adf:de83:0:b0:20a:cbb5:903a with SMTP id
 w3-20020adfde83000000b0020acbb5903amr13753816wrl.544.1652105299332; 
 Mon, 09 May 2022 07:08:19 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 s6-20020adfea86000000b0020c5253d907sm11401610wrm.83.2022.05.09.07.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:08:18 -0700 (PDT)
Message-ID: <fd355232-c5e3-ba1b-801d-526ee6f04946@linaro.org>
Date: Mon, 9 May 2022 15:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
 <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
 <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 09/05/2022 14:31, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/22 01:52, Srinivas Kandagatla wrote:
>> Thanks Pierre,
>>
>> On 06/05/2022 15:13, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 5/6/22 03:47, Srinivas Kandagatla wrote:
>>>> Currently timeout for autoenumeration during probe and bus reset is
>>>> set to
>>>> 2 secs which is really a big value. This can have an adverse effect on
>>>> boot time if the slave device is not ready/reset.
>>>> This was the case with wcd938x which was not reset yet but we spent 2
>>>> secs waiting in the soundwire controller probe. Reduce this time to
>>>> 1/10 of Hz which should be good enough time to finish autoenumeration
>>>> if any slaves are available on the bus.
>>>
>>> Humm, now that I think of it I am not sure what reducing the timeout
>>> does.
>>>
>>> It's clear that autoenumeration should be very fast, but if there is
>>> nothing to enumerate what would happen then? It seems that reducing the
>>> timeout value only forces an inconsistent configuration to be exposed
>>> earlier, but that would not result in a functional change where the
>>> missing device would magically appear, would it? Is this change mainly
>>> to make the tests fail faster? If the 'slave device is not ready/reset',
>>> is there a recovery mechanism to recheck later?
>>>
>>> Would you mind clarifying what happens after the timeout, and why the
>>> timeout would happen in the first place?
>>
>> This issue is mostly present/seen with WCD938x codec due to its Linux
>> device model.
>> WCD938x Codec has 3 Linux component drivers
>> 1. TX Component (A soundwire device connected to TX Soundwire Master)
>> 2. RX Component (A soundwire device connected to RX Soundwire Master)
>> 3. Master Component (Linux component framework master for (1) and  (2)
>> and registers ASoC codec)
>>
>> Also we have only one reset for (1) and (2).
>>
>> reset line is handled by (3)
>> There are two possibilities when the WCD938x reset can happen,
>>
>> 1. If reset happens earlier than probing (1) and (2) which is best case.
>>
>>
>> 2. if reset happens after (1) and (2) are probed then SoundWire TX and
>> RX master will have spend 2 + 2 secs waiting, Which is a long time out
>> Hence the patch.
>>
>> TBH, the 2 sec timeout value was just a random number which I added at
>> the start, we had to come up with some sensible value over the time
>> anyway for that.
>>
>> You could say why do we need wait itself in the first place.
>>
>> The reason we need wait in first place is because, there is a danger of
>> codec accessing registers even before enumeration is finished. Because
>> most of the ASoC codec registration happens as part of codec/component
>> driver probe function rather than status callback.
>>
>> I hope this answers your questions.
> 
> 
> Humm, not really.
> 
> First, you're using this TIMEOUT_MS value in 3 unrelated places, and
> using 2 different struct completion, which means there are side effects
> beyond autoenumeration.

2 of these 3 are autoenum ones, one is in probe path and other in bus 
reset path during pm.

The final one is broadcast timeout, new timeout value should be okay for 
that too, given that we need 10ms timeout.

> 
> qcom.c-         /*
> 
> qcom.c-          * sleep for 10ms for MSM soundwire variant to allow
> broadcast
> 
> qcom.c-          * command to complete.
> 
> qcom.c-          */
> 
> qcom.c-         ret = wait_for_completion_timeout(&swrm->broadcast,
> 
> qcom.c:                                   msecs_to_jiffies(TIMEOUT_MS));
> 
> --
> 
> qcom.c-         goto err_clk;
> 
> qcom.c- }
> 
> qcom.c-
> 
> qcom.c- qcom_swrm_init(ctrl);
> 
> qcom.c- wait_for_completion_timeout(&ctrl->enumeration,
> 
> qcom.c:                             msecs_to_jiffies(TIMEOUT_MS));
> 
> --
> 
> qcom.c-         if (!swrm_wait_for_frame_gen_enabled(ctrl))
> 
> qcom.c-                 dev_err(ctrl->dev, "link failed to connect\n");
> 
> qcom.c-
> 
> qcom.c-         /* wait for hw enumeration to complete */
> 
> qcom.c-         wait_for_completion_timeout(&ctrl->enumeration,
> 
> qcom.c:                                   msecs_to_jiffies(TIMEOUT_MS)); >
> 
> And then I don't get what you do on a timeout. in the enumeration part,

We can't do much on the timeout.

> the timeout value is not checked for, so I guess enumeration proceeds
> without the hardware being available? That seems to contradict the
> assertion that you don't want to access registers before the hardware is
> properly initialized.

Even if enumeration timeout, we will not access the registers because 
the ASoC codec is not registered yet from WCD938x component master.

> 
> And then on broadcast you have this error handling:
> 
> 		ret = wait_for_completion_timeout(&swrm->broadcast,
> 						  msecs_to_jiffies(TIMEOUT_MS));
> 		if (!ret)
> 			ret = SDW_CMD_IGNORED;
> 		else
> 			ret = SDW_CMD_OK;
> 
> Which is equally confusing since SDW_CMD_IGNORED is really an error, and
> the bus layer does not really handle it well - not to mention that I
> vaguely recall the qcom hardware having its own definition of IGNORED?
QCom hardware alteast the version based on which this driver was written 
did not have any support to report errors type back on register read/writes.

In this case a broad cast read or write did not generate a complete 
interrupt its assumed that its ignored, as there is no way to say if its 
error or ignored.

--srini




> 
