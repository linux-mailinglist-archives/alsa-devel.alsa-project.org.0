Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C32FF35E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 19:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE561916;
	Thu, 21 Jan 2021 19:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE561916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611254596;
	bh=T7XFUuS3QsjMQmRVpNDtI0jeHer6ZZPxzRmN3wV9KJs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuKHB/XqqzwLTskmgSjAwLnLuGlFDnaGu4CNyKcK5F2IF+CMpuY2mMyoHESJb8GMb
	 kIKltmTb91M/HO9ie5w6hKu0N8JvM9ncEh6oeAPxJ1i81EQ9fKXyxndkD/PPy2wdzy
	 ZFyILLfc2ywGZANm4q2xauNPRinfDbMuDuC3DmxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2B8F8026A;
	Thu, 21 Jan 2021 19:41:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56611F80257; Thu, 21 Jan 2021 19:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE8FF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 19:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE8FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UD6zT62A"
Received: by mail-wr1-x42e.google.com with SMTP id c12so2750513wrc.7
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1LZdJjGc48/gwLzyAgp0Q9hkzPKTZ92XadLVHIdNeus=;
 b=UD6zT62AGvo2fkoK8hEZH4D0yvQgJfrJUmPrHfaow3f8ai0CV5F14TRdrLUrfrHfS7
 tPT8wNAqsCD3dlFHt+lylV23YroI4y+uWBeBXFoYbmLfQKRevZWiiMSH+CQNHC7+DLG6
 CE3WJtsuxOSURAXoqqTtb3rewX+RZc/LBapifzI5lT60egICl9V23Px7ajkNaxOoiLYx
 PXh+4RRQrMYgDm/Y6uQyMngL143bihRL75rMmJdqX/868pLucWFY44PqNBiEaYuZ3RSy
 VsUuFz+6IqAIpYO5AJLAnKnDKlDY0E6aeKB14S6wICxCQXWNiugvnxtN6DLUtmTRC45c
 J6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1LZdJjGc48/gwLzyAgp0Q9hkzPKTZ92XadLVHIdNeus=;
 b=dvwiMjzdDcwMGIfGC33eg1HsMazBLBjkBDaBKuUdx9Zr9TNRrPJn6DFNPPU7h/I1rK
 Eh5w5Tx0YbN2M4+5egaW8RvnjiNrH9JtIMw5xdsMtRSX+xZ7cmEYNrqrLDFqMV8Mvuxo
 WJEt9pd/XzTsFxIqs+SnmdEQxEGL1+dVu65TsWPY+ksNNqU2g9n0keGPsTSQKSQVxlnm
 SitSLJ+azecUBnasjm1v1/g5op1e5xIGWpelnlX1qYmqoX9LqXdBTAUBP87yVvxpHbTH
 9dHofcFgh9W6ZIL5nrVsqRz9Pl2ZsbNqoG0EgwBcOH9ICFxQ5yYhsOxTT/dIP/CfWT/X
 2HNg==
X-Gm-Message-State: AOAM532xeLuBKbQnvBwdkV41V8ziZ+gZzi17QOMFV8+rvGNNLnBVAcm9
 CeLAS5XpA0wLdGLWRp/6Hq9O2Q==
X-Google-Smtp-Source: ABdhPJx8D0CkZqme6uOFhWSz66F7vNTs1DfA97Uneyp1dieL6ivNfdJxzmiwg5skCfOhlEJAyKj4Ew==
X-Received: by 2002:a5d:4241:: with SMTP id s1mr788988wrr.269.1611254491953;
 Thu, 21 Jan 2021 10:41:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g192sm9878730wmg.18.2021.01.21.10.41.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 10:41:31 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
 <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
Date: Thu, 21 Jan 2021 18:41:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 21/01/2021 18:00, Pierre-Louis Bossart wrote:
> 
> 
> On 1/21/21 9:41 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 21/01/2021 14:56, Pierre-Louis Bossart wrote:
>>>
>>>
>>>> Port allocations are something like this:
>>>>
>>>> RX: (Simple)
>>>> Port 1 -> HPH L/R
>>>> Port 2 -> CLASS H Amp
>>>> Port 3 -> COMP
>>>> Port 4 -> DSD.
>>>>
>>>> TX: (This get bit more complicated)
>>>> Port 1: PCM
>>>> Port 2: ADC 1 & 2
>>>> Port 3: ADC 3 & 4
>>>> Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
>>>> Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7
>>>>
>>>> We handle the port allocation dynamically based on mixer and dapm 
>>>> widgets in my code! Also channel allocations are different for each 
>>>> function!
>>>
>>> Sorry, I am not following here. What is dynamic here and use-case 
>>> dependent? And is this a mapping on the master or the codec sides 
>>> that you want to modify?
>>
>> [SLAVE]-------[MASTER]
>> NA-------------Port 1: PCM
>> Port 1---------Port 2: ADC 1 & 2
>> Port 2---------Port 3: ADC 3 & 4
>> Port 3---------Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
>> Port 4---------Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7
>>
>>
>> Mapping is still static however Number of ports selection and channel 
>> mask will be dynamic here.
>>
>>
>> Example: for Headset MIC usecase we will be using Slv Port1, Slv Port3 
>> along with Mstr Port2 and Master Port4
>>
>> Similarly for usecases like Digital MIC or other Analog MICs.
> 
> Sorry, I must be thick here, but in my experience the choice of Digital 
> or analog mics is a hardware design level not a use-case one. Using ADC 
> 1 & 2 at the same time as DMICs is very surprising to me. You'd have 
> different sensitivities/performance, not sure how you would combine the 
> results.

In this particular case, ADC2 on Port2 is used along with the MBHC(Multi 
Button and Headset Detection) channel on Master Port4. This is intended 
for Headset Button Click Suppression!. This again can be  dynamically 
selected based on if headset button Click Suppression is enabled or not.

So this is not really mixing ADC with DMICs here!


> 

> I also don't see how a headset mic can both use Analog and digital, 
> unless we have a different definition of what a 'headset' is.
> 
>>>>> Does this help and can you align on what Intel started with?
>>>>
>>>> Firstly, This is where the issue comes, if we go with the 
>>>> suggested(dai->id) solution, we would end up with a long list of 
>>>> dai-links with different combinations of both inputs/output 
>>>> connections and usecases. Again we have to deal with limited DSP 
>>>> resources too!
>>>>
>>>> Secondly, The check [1] in stream.c will not allow more than one 
>>>> master port config to be added to master runtime. Ex: RX Port 1, 2, 
>>>> 3 is used for Headset Playback.
>>>
>>> I am confused here, we do have examples in existing codec drivers 
>>> where we use multiple ports for a single stream, e.g. for IV feedback 
>>> we use 2 ports.
>>
>> Is this on multi_link? which is why it might be working for you.
> 
> no, this is done at the codec driver level, which has no notion of 
> multi-link. we pass a port_config as a array of 2.
> 

Am referring to sdw_stream_add_master() not sdw_stream_add_slave().

>> Currently we have below check in sdw_stream_add_master().
>>
>> if (!bus->multi_link && stream->m_rt_count > 0) {
>>      dev_err(bus->dev, "Multilink not supported, link %d\n", 
>> bus->link_id);
>>      ret = -EINVAL;
>>      goto unlock;
>> }
>>
>> If we have single master(like my case) and dai-links which have more 
>> then one port  will be calling  sdw_stream_add_master() for each port, 
>> so m_rt_count above check will fail for the second call!
> 
> if you use multiple ports in a given master for the same stream, you 
> should have the m_rt_count == 1. That's a feature, not a bug.
> 
> A port is not a stream... You cannot call sdw_stream_add_master() for 
> each port, that's not what the concept was. You allocate ONE master_rt

Am looking at intel_hw_params(). Isn't sdw_stream_add_master() called 
for every dai in the dai link.

> per master, and that master_rt deals with one or more ports - your choice. >
> A 'stream' is an abstract data transport which can be split across 
> multiple masters/sales and for each master/slave use multiple ports.
> When calling sdw_stream_add_master/slave, you need to provide a 
> port_config/num_ports to state which ports will be used on that 
> master/slave when using the stream. That's how we e.g. deal with 4ch 
> streams that are handled by two ports on each side.
> 
> To up-level a bit, the notion of 'stream' is actually very very similar 
> to the notion of dailink. And in fact, the 'stream' is actually created 
> for Intel in the dailink .startup callback, so I am quite in the dark on 
> what you are trying to accomplish.
In qcom case stream is also allocated for in dai startup().

I think we are talking about two different issues,

1>one is the failure I see in sdw_stream_add_master() when I try to use 
dai-link dai-id style approach suggested. I will dig this bit more and 
collect more details!

2>(Main issue) Ability for slave to select different combination of 
ports at runtime based on the mixer setting or active dapm.

All this patch is trying do is the pass this *CURRENT/ACTIVE* static 
port mapping between slave and master while setting up the stream.
With the dailink approach number of ports are pretty much static and may 
not be required for particular use case. As above example if we have a 
headset with button click suppression we would need 2 Ports and 
similarly without we only need one port.

This is not possible with dai-link approach, unless we create two 
different dai links for the above example usecase!

Hopefully this adds some light to the issue :-)

--srini
