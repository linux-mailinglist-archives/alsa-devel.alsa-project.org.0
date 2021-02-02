Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6830BBF8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 11:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5413A174F;
	Tue,  2 Feb 2021 11:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5413A174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612261288;
	bh=Y7v/PtAtaNdF2bnKDOVINqPgOrMy7INUZ6xHmTURqhw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMED7x1ApdTNwDf5mrgHaCTJV/gOB9I1DOY5U+AcSwaTQWRL/CY8MRfPE+xtMXSFR
	 ZBox/Gz7rn8xJT2myIQOxJFfkIzSE6ad52VMAbCucw+QpfXiSpRpBLJkH/BZrs/Ej+
	 enAsg4imZ+GX4vwIDiB2IA8SDHTV4yyhtqk/P7nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2927F801F7;
	Tue,  2 Feb 2021 11:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E75CF800E1; Tue,  2 Feb 2021 11:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4C31F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 11:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4C31F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n4o2SdsT"
Received: by mail-wm1-x333.google.com with SMTP id e15so1773698wme.0
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 02:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4TQrH08/UJxeSx7AxArBpXQ8JwuPZp/xsO/RczEeCRE=;
 b=n4o2SdsTccQ0UfkE8WKWBF5rX+gbqGIWlvhdAIPiRVbm6dSAK4V0kEmehB3aW85elU
 fzDLLevgmyYIvUehwcb5Lt4HvkO4S+ySa4TLciQH+JdeVOVoTJnJCAfoaLSZ9pPwWn4e
 pwYaZAETKDC3gmiqrrnm3xLZPoO/TjAayU42nxC4jFjSGy+jQfLv1JkA7i3prMVwmRtL
 JIk3yRlz46jZRF7b15v71FsMw4TPfEAxP5tIDNCLyJ84Df5GzX//ere3obTQlxVmFB1T
 jy+LSiP99/L+OTqY5aGBT0c/mqbHlr+9YafIGTkkJ4fEubFXkqRWSmQAtAHXGmj/DLYD
 ZE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4TQrH08/UJxeSx7AxArBpXQ8JwuPZp/xsO/RczEeCRE=;
 b=Mpr64gjPAZslsUNOjKTX+L0JYnR4JwqGsUrD1nH98kGEA+9bg7dkM3LCfjrqdZmO7F
 Y4NsCT3fqX4g5zlyrQZolm0EBUHw+0XzH04SoQ4J7lAtVOItTwqfW1GWcguyvhwwIisr
 OvzoYBh9AMY80r/ho9CjN1kDD9r3s1vQR/dGWx2/1hS5cONIve5m0Vw7EvZTprZWVPum
 v54XHbI1G947x/KGV1nOPOTkhe299nQGRiTkz2lsbztxB40fHK0y9+h/RtXeq7TLgKG/
 8RoGMN3l3VeGPcTDIy3nu3BzmlWyXgpRQRFVCyvAUxxhJxjMss2qulpDKJZJ0AefNQS4
 YZgQ==
X-Gm-Message-State: AOAM533mgE4iEEp3Ix2BJ9KJ2QHvkJ0Yp+FhfgLBth/6SA23nj/IOHiU
 vBT6vgV+Qm3qVK5C/tFmtga1T2dsJijS/w==
X-Google-Smtp-Source: ABdhPJwyXFkSxEsGTLVNCkjDES3J4BtRb+cT9X4fkRDyERvmjJlmSNWrgyEMn3QRnpE6zbX3+6/GtA==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr2951091wmh.4.1612261188570;
 Tue, 02 Feb 2021 02:19:48 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v13sm1847921wrd.51.2021.02.02.02.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 02:19:47 -0800 (PST)
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
 <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
 <3a2b5c2d-21aa-2bf5-62df-ef85c7c9293c@linaro.org>
 <b87758d0-5862-3b4e-5a90-7b27d0c78d0d@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4e3ebb99-5647-f71c-1256-a2c55bd9995f@linaro.org>
Date: Tue, 2 Feb 2021 10:19:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b87758d0-5862-3b4e-5a90-7b27d0c78d0d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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



On 01/02/2021 16:42, Pierre-Louis Bossart wrote:
> 
> 
> On 2/1/21 9:50 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 29/01/2021 19:33, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 1/29/21 11:32 AM, Srinivas Kandagatla wrote:
>>>> In the existing code every soundwire register read and register write
>>>> are kinda blocked. Each of these are using a special command id that
>>>
>>> what does 'kinda blocked' mean?
>>
>> I meant read/writes are waiting for completion interrupt!
>>
>>>
>>>> generates interrupt after it successfully finishes. This is really
>>>> overhead, limiting and not really necessary unless we are doing
>>>> something special.
>>>>
>>>> We can simply read/write the fifo that should also give exactly
>>>> what we need! This will also allow to read/write registers in
>>>> interrupt context, which was not possible with the special
>>>> command approach.
>>>
>>> This is really unclear, sorry.
>>
>> If read/writes are waiting for an interrupt, it becomes difficult to 
>> read or write to any registers from same interrupt handler!
> 
> Well, yes, you need to handle the complete() at a lower level than the 
> code that initiates the transactions otherwise you self-deadlock.
> 
> IIRC in the Intel initial code, the complete was in the handler and the 
> register IOs in the thread.
> 
Yes, we did the same in previous version of the code, however with this 
patch reading/writing fifo directly without need of completion should 
remove that need of another thread!
>>
>>
>>>
>>>> +    if (id != SWR_BROADCAST_CMD_ID) {
>>>> +        if (id < 14)
>>>> +            id += 1;
>>>> +        else
>>>> +            id = 0;
>>>
>>> that is really odd. if id=13 (group2) then id becomes 14 (master 
>>> address). A comment is really needed here.
>>
>> This is magic value for each fifo read or write, so that we can verify 
>> that them by comparing with this magic value!
>>
>> This has nothing to do with device number!
> 
> You should probably add a comment here then, or use a #define instead of 
> the 14 which threw me off.

I agree!
> 
>>
>>>
>>>> +    if (cmd_id == SWR_BROADCAST_CMD_ID) {
>>>> +        /*
>>>> +         * sleep for 10ms for MSM soundwire variant to allow broadcast
>>>> +         * command to complete.
>>>
>>> that's also super-odd. There is nothing in SoundWire that makes any 
>>> difference between a regular and a broadcast command. they all 
>>> complete in the same time (a frame).
>>>> +         */
>>>> +        ret = wait_for_completion_timeout(&swrm->broadcast, (2 * 
>>>> HZ/10));
>>>
>>> is this 10ms really or dependent on CONFIG_HZ?
> 
> comment missed?
Not intentionally :-)


I should probably to use msecs_to_jiffies here to keep it inline with 
the comment!

--srini
> 
>>>
>>>> +        if (!ret)
>>>> +            ret = SDW_CMD_IGNORED;
>>>> +        else
>>>> +            ret = SDW_CMD_OK;
>>>
>>> no CMD_FAILED support?
>>
>> Qcom controllers does not provide that information if the command is 
>> ignored or failed by any means!
>>
>> That was the behavior from the starting of this driver.
> 
> ah yes, now I remember this.
