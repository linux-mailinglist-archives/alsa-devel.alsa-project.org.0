Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941A4C187F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 17:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16AFD1AAB;
	Wed, 23 Feb 2022 17:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16AFD1AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645633402;
	bh=ls4yrRP7+8EE5dMDqiz+4bKzYvl0h24h+IsPrDyHPog=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fce89x72DeLC/VWS/YVXe4UHcgu0Tt1/wbwZ+VG42rJLkgnMemdn1esgfjPOb7Pe2
	 3OL9z6+agfOLpmanUScwmTO9pE5cesmLYg6cyhFT9/PZn85h9Ya4UySgi4ev90/iQV
	 RlSiG6w8cRzyRWl54Ay/IFlPDHHZXxGe5RmmOovg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B841F8025D;
	Wed, 23 Feb 2022 17:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 749FFF80237; Wed, 23 Feb 2022 17:22:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB52AF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 17:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB52AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ukTEz9n9"
Received: by mail-wr1-x433.google.com with SMTP id j22so14410181wrb.13
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3soeUz3Gxi2go8Buwh1sm4qJuSlmkJbGkcHtauPvNOw=;
 b=ukTEz9n9ED5hmYtxHQ7QEwajoWikPgVDiqxvJs25fX/kKE4jq3t+tu39nTrnMufSTk
 CbmIsESzXJ7V4t3JpWOLrixWi1rQ02gZMz1iSGknUK/8JoDDmDE8x3mwdgLOyT/9iepG
 lfs4gAk++GU2fOV0xWwENclLflrFBm8UBDIasPOBIAQthAMelF3eErTUPyh+ii/pg+cO
 9n/0Li/AHsTIEB7RIkjN3bOrcaqdnEWVimH6EtEK4s1FjQwGJHYYyvvgkimHYIORK4id
 xYpebk7XjCwyr6kPqE0EM1IkhkrnTNmaSLvS9h8ZEi74HWygdSlze/r9s1Noxczem/30
 Midg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3soeUz3Gxi2go8Buwh1sm4qJuSlmkJbGkcHtauPvNOw=;
 b=dSNbLkDR5mb3yf7941pxB7lzImvrZvjNWVR8EBONYU+KJfxTudAU45eBxlJB642S9y
 w+71FnQSGHSFWsh6RaXsuTucq1VCvD8v0HdB3G3RuSxSXu+aU0NM9FsIJrWdUWK+JKes
 JtTpFueBa6g6lyeuApCYHH+CeU3Ugj8vuSrLtl5keChvj7WniwrULMhIeRppEgGBb5VZ
 wnaxYbiBefAcBpQ4N4cYrUlUTQGpwqy5t2oHcqsf96n2+VD2IFS1VjwACK+9MQySk8Ud
 BT8a6lzVpV4yWHXVqzI8peScHM94UqXbCyJ7kPGFh8JpU3TV4KBWxDv3LIB2reuxsNK+
 tHgw==
X-Gm-Message-State: AOAM531TknU23drdJZwYu9IJp5WiVHlUVVMeg3KrwsCgcuA2eqgIvDwy
 KUKMWSZtEwmyUXAqW8yqLsNs0A==
X-Google-Smtp-Source: ABdhPJzbKFPWSq+qdM1MYHg1l9ir8j/wbqyy37IoARqa7ZG2n6LAoYfI2LG+OEsp1aOar6Zstb166w==
X-Received: by 2002:adf:f3c8:0:b0:1ed:9cd9:5bf with SMTP id
 g8-20020adff3c8000000b001ed9cd905bfmr311877wrp.380.1645633323192; 
 Wed, 23 Feb 2022 08:22:03 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id c17sm4736wmh.31.2022.02.23.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:22:02 -0800 (PST)
Message-ID: <ee14c940-85c9-6c14-5738-e055801407ab@linaro.org>
Date: Wed, 23 Feb 2022 16:22:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] soundwire: qcom: add wake up interrupt support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-4-srinivas.kandagatla@linaro.org>
 <5e050d4c-e3d2-35fb-ca49-7be53579bc31@linux.intel.com>
 <1cb4e02f-f040-23bd-44d0-0675429332bd@linaro.org>
 <49099bcb-35e9-0bea-9658-006caed3ab33@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <49099bcb-35e9-0bea-9658-006caed3ab33@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



On 23/02/2022 00:31, Pierre-Louis Bossart wrote:
> 
> 
> On 2/22/22 16:52, Srinivas Kandagatla wrote:
>>
>>
>> On 22/02/2022 19:26, Pierre-Louis Bossart wrote:
>>>
>>>
>>>
>>>> +static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>>>> +{
>>>> +    struct qcom_swrm_ctrl *swrm = dev_id;
>>>> +    int ret = IRQ_HANDLED;
>>>> +    struct sdw_slave *slave;
>>>> +
>>>> +    clk_prepare_enable(swrm->hclk);
>>>> +
>>>> +    if (swrm->wake_irq > 0) {
>>>> +        if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
>>>> +            disable_irq_nosync(swrm->wake_irq);
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * resume all the slaves which must have potentially generated this
>>>> +     * interrupt, this should also wake the controller at the same
>>>> time.
>>>> +     * this is much safer than waking controller directly that will
>>>> deadlock!
>>>> +     */
>>> There should be no difference if you first resume the controller and
>>> then attached peripherals, or do a loop where you rely on the pm_runtime
>>> framework.
>>>
>>> The notion that there might be a dead-lock is surprising, you would need
>>> to elaborate here.Issue is, if wakeup interrupt resumes the controller
>>> first which can
>> trigger an slave pending interrupt (ex: Button press event) in the
>> middle of resume that will try to wake the slave device which in turn
>> will try to wake parent in the middle of resume resulting in a dead lock.
>>
>> This was the best way to avoid dead lock.
> 
> Not following, sorry. if you use pm_runtime functions and it so happens
> that the resume already started, then those routines would wait for the
> resume to complete.
yes that is true,

TBH, I was trying to reproduce the issue since morning to collect some 
traces but no luck so far, I hit these issues pretty much rarely. Now 
code has changed since few months back am unable to reproduce this 
anymore. Or it might be just the state of code I had while writing this up.

But when I hit the issue, this is how it looks like:

1. IRQ Wake interrupt resume parent.

2. parent is in middle of resuming

3. Slave Pend interrupt in controller fired up

4. because of (3) child resume is requested and then the parent resume 
blocked on (2) to finish.

5. from (2) we also trying to resume child.

6. (5) is blocked on (4) to finish which is blocked on (2) to finish

we are dead locked. Only way for me to avoid dead lock was to wake the 
child up after IRQ wake interrupts.

here is the stack trace of blocked-tasks from sysrq

root@linaro-gnome:~# [  182.327220] sysrq: Show Blocked State
[  182.331063] task:irq/20-soundwir state:D stack:    0 pid:  445 ppid: 
     2 flags:0x00000008
[  182.339655] Call trace:
[  182.342176]  __switch_to+0x168/0x1b8
[  182.345864]  __schedule+0x2a8/0x880
[  182.349459]  schedule+0x54/0xf0
[  182.352700]  rpm_resume+0xc4/0x550
[  182.356211]  rpm_resume+0x348/0x550
[  182.359805]  rpm_resume+0x348/0x550
[  182.363400]  __pm_runtime_resume+0x48/0xb8
[  182.367616]  sdw_handle_slave_status+0x1f8/0xf80
[  182.372371]  qcom_swrm_irq_handler+0x5c4/0x6f0
[  182.376942]  irq_thread_fn+0x2c/0xa0
[  182.380626]  irq_thread+0x16c/0x288
[  182.384221]  kthread+0x11c/0x128
[  182.387549]  ret_from_fork+0x10/0x20
[  182.391231] task:irq/187-swr_wak state:D stack:    0 pid:  446 ppid: 
     2 flags:0x00000008
[  182.399819] Call trace:
[  182.402339]  __switch_to+0x168/0x1b8
[  182.406019]  __schedule+0x2a8/0x880
[  182.409614]  schedule+0x54/0xf0
[  182.412854]  rpm_resume+0xc4/0x550
[  182.416363]  rpm_resume+0x348/0x550
[  182.419957]  rpm_resume+0x348/0x550
[  182.423552]  __pm_runtime_resume+0x48/0xb8
[  182.427767]  swrm_runtime_resume+0x98/0x3d0
[  182.432079]  pm_generic_runtime_resume+0x2c/0x48
[  182.436832]  __rpm_callback+0x44/0x190
[  182.440693]  rpm_callback+0x6c/0x78
[  182.444289]  rpm_resume+0x2f0/0x550
[  182.447883]  __pm_runtime_resume+0x48/0xb8
[  182.452099]  qcom_swrm_wake_irq_handler+0x20/0x128
[  182.457033]  irq_thread_fn+0x2c/0xa0
[  182.460712]  irq_thread+0x16c/0x288
[  182.464306]  kthread+0x11c/0x128
[  182.467634]  ret_from_fork+0x10/0x20


As am unable to reproduce this issue anymore so I will remove the code 
dealing with slaves directly for now till we are able to really 
reproduce the issue.

> 
> In other words, there can be multiple requests to resume, but only the
> *first* request will trigger a transition and others will just increase
> a refcount.
> 
> In addition, the pm_runtime framework guarantees that the peripheral
> device can only start resuming when the parent controller device is
> fully resumed.
> 
> While I am at it, one thing that kept us busy as well is the
> relationship between system suspend and pm_runtime suspend. In the
> generic case a system suspend will cause a pm_runtime resume before you
> can actually start the system suspend, but you might be able to skip
> this step. In the Intel case when the controller and its parent device
> were suspended we had to pm_runtime resume everything because some
> registers were no longer accessible.
Interesting, thanks for the hints, will keep that in mind.

--srini
> 
> 
