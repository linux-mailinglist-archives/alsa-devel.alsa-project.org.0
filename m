Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549A2FFD07
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07861A94;
	Fri, 22 Jan 2021 08:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07861A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299233;
	bh=xk6NaMUXeIR9X8okEG5JJUT0YFYCjxz+EeVuK+FPhtU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4VAB+PGaBrSUB/ppnrR/wxMlK8xPy2i9+DsowC8t7LmKv9y2GoIt0RzQbdgQric+
	 rkpsBWqYMIcpzQ868mxImkwqbT2/1gNDx7SqAJMiUrqs2jW6DAwd2I+RpRuEdMka1y
	 JBLncwFEUOqI0Sy1GziiCb84XswZfdXX1ZVIIGiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CEDF80129;
	Fri, 22 Jan 2021 08:05:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CDFF8016E; Fri, 22 Jan 2021 08:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3356F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3356F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tgRZ8q3F"
Received: by mail-wm1-x334.google.com with SMTP id j18so3353988wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 23:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PYSLUkfxWsDYatmJuPKgHOdMeMwyybCsIjFDnItPhjQ=;
 b=tgRZ8q3FAlY3OEOoVbBf+0m6G9PHTZRKFNiQg1hZpdTo+oPMEnF01h6OruCV26+5fB
 4MgvcsxfTMkF9mEPW80e03KYaXbgeJlB5Rsvkj20Mt8nMKCxKokbT0vrFmO0IunGjM8+
 ABs2AkfHLlcdyYAGLRuAaOLBD/7Z6IW+/szDMHhdqJzpiGQcMZTTq6/F1GPxTCU85uNs
 +Duox363NfvTD8l0zcdl5sN3eR/2Gc09B9zsnLyLBo9kKg8eruoQgtOPwAVVZ2SKdheP
 ggdrszjrx15AiRkM02ZBHfpDnEqTEP6LVkhd1TZLdyu0740QjhMzlLvsLNQhACpO2VZK
 C22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PYSLUkfxWsDYatmJuPKgHOdMeMwyybCsIjFDnItPhjQ=;
 b=N/ioCS3Asdr+kwYu7HS1RV5SQq2S6L7QE3GDxdsHaMheFnwnqg58K0uYO8uY92oczx
 4t0xR7bANw8Ob3nNd/j2uxdoeJ1BWhdICGeeHnfVWdq1Um0/e6f1LdsmbfZkwoBQv1md
 anNQwr75lHknznIHOVkAo2ngLB7n815Fs2fZ4UZETTNfQXVpt2tPI+5JMUpISyCp64Z3
 w8X3baQDK2VrNtjpvhW6VTxZO5ulI6j5JWpfBd1ZWzYNs4v+jFoo8ArkcqlKvcWV4rE1
 8XrA5wpCRg5E8zmDcLiJiYbmdeXSEWQG0safPTMel/Qm4SxeGzqLWo8Qqf3pWQfYT4kh
 k9iQ==
X-Gm-Message-State: AOAM5313I7xUNnBwz5caUEO9wB8SNdgOiT+7uSke72sEvHknnArG2n2h
 HqYzh7ef14QPtPscdvOWbPuJdw==
X-Google-Smtp-Source: ABdhPJwXSRuhk/zzqBTxPzZhquyqwBtYhyEpD8swCyDcxal/5yBhOCCaQuA37HYcYWUxREkwxYxvfg==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr2504980wmf.151.1611299125958; 
 Thu, 21 Jan 2021 23:05:25 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id
 w129sm10436919wmb.11.2021.01.21.23.05.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 23:05:25 -0800 (PST)
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
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
Date: Fri, 22 Jan 2021 07:05:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 21/01/2021 21:30, Pierre-Louis Bossart wrote:
>>
>> Am looking at intel_hw_params(). Isn't sdw_stream_add_master() called 
>> for every dai in the dai link.
> 
> Yes, that's correct, but again a dai may use one or more ports.
> 
> if you defined each port as a dai, and want to call 
> sdw_stream_add_master() for each port you are doing something the API 
> was not designed for. There is a 'num_ports' argument for a reason :-)
> 
>>> per master, and that master_rt deals with one or more ports - your 
>>> choice. >
>>> A 'stream' is an abstract data transport which can be split across 
>>> multiple masters/sales and for each master/slave use multiple ports.
>>> When calling sdw_stream_add_master/slave, you need to provide a 
>>> port_config/num_ports to state which ports will be used on that 
>>> master/slave when using the stream. That's how we e.g. deal with 4ch 
>>> streams that are handled by two ports on each side.
>>>
>>> To up-level a bit, the notion of 'stream' is actually very very 
>>> similar to the notion of dailink. And in fact, the 'stream' is 
>>> actually created for Intel in the dailink .startup callback, so I am 
>>> quite in the dark on what you are trying to accomplish.
>> In qcom case stream is also allocated for in dai startup().
>>
>> I think we are talking about two different issues,
>>
>> 1>one is the failure I see in sdw_stream_add_master() when I try to 
>> use dai-link dai-id style approach suggested. I will dig this bit more 
>> and collect more details!
>>
>> 2>(Main issue) Ability for slave to select different combination of 
>> ports at runtime based on the mixer setting or active dapm.
>>
>> All this patch is trying do is the pass this *CURRENT/ACTIVE* static 
>> port mapping between slave and master while setting up the stream.
>> With the dailink approach number of ports are pretty much static and 
>> may not be required for particular use case. As above example if we 
>> have a headset with button click suppression we would need 2 Ports and 
>> similarly without we only need one port.
> 
> As I said above you cannot enable the button click suppression 
> dynamically *after* the headset capture hw_params/prepare.

That is not true, the ports in this case are selected based on mixer 
setting or register state even before stream is setup/started in 
hw_params/prepare.
WSA881x codec has pretty much similar setup.

> 
>> This is not possible with dai-link approach, unless we create two 
>> different dai links for the above example usecase!
> 
> The current approach is a worst-case one, where you would create a 
> single 'headset capture' dailink.
> 

Are you suggesting that we have dailink for each usecase like:

"headset capture"
"Analog MIC1 capture"
"Analog MIC2 Capture"

...

"Analog MIC4 Capture"

...

"DMIC0 capture"
"DMIC1 Capture"
"DMIC2 Capture"

...

"DMIC7 Capture"
..
"Headset Playback"
"Ear Playback"
..
"Aux Playback"
...

this is not really doable!

All am saying is that codec can decide which ports it has to select 
based on mixer setting before the stream is setup/started. This updated 
mapping between slv port and master ports is passed as part of the 
port_config in sdw_stream_add_slave().


--srini

> We never envisioned a case where you modify what the definition of 
> 'headset capture' is based on control events, and I really challenge the 
> fact that it is feasible/realistic. This is really about streaming data 
> across a bus, and we are limited on what we can do. It's the same 
> problem that we never modify the number of channels dynamically on a PCM 
> device.
> 
> 
> 
