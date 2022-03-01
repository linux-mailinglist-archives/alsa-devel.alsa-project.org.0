Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E304C902D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 17:19:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DECFB1AA1;
	Tue,  1 Mar 2022 17:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DECFB1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646151549;
	bh=Ic2cVNr/QuZ8LZWxFs/I0VO4RNQe/bRpOebdDp7iddI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTW2uHe7tVv1432EDzR0x19X201K576rZTcxkRsd2e0TrXo4vwLG6E3Sr+UwNyDjE
	 eOH/7cQZ9MhvjPSP+BC5tgaLB5M3wXeyeQuGTQYsGxwJhiKq71c9qRNZmTNu5Q3dX/
	 B/UTb7tkn/gg3Y3bjmLJMp9N8oGjKKCO1pRto/wM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 379AAF80054;
	Tue,  1 Mar 2022 17:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72D27F802DB; Tue,  1 Mar 2022 17:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC0BF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 17:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC0BF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k6uTd/Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646151478; x=1677687478;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ic2cVNr/QuZ8LZWxFs/I0VO4RNQe/bRpOebdDp7iddI=;
 b=k6uTd/JdfQ5vBDYpvt+p9vlgXOChEzO+0RGGxrv/vHhBWDyyAh+6rfnT
 hQMSPRoN29Eh6+pTovm1lGMP7GihK3Kfgk5hgT5XhHUMCXnhuRFmZTovB
 rIAeZUR5SSdSqDJiZbwF3L+fPGBydXGsVHnkcT+o7jCVMZIAM/Gg+HWvf
 8+qO15l4p4b6wkrW/mvVehXDx1uCCy7UttyxxV22/nJ1CUiyu51DMnBs2
 xx/TUHFvHNSU5bUokw4+gp5KFlGwyEZf4jc3t2b1/C+pUzOplsk7E40bF
 Bdka3iv75IQJkPxAhsmssr1LB5rCVv2QQALsleDK6W7+TqEfuMjvBdivU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251998227"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="251998227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 08:17:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="545146467"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO [10.209.131.146])
 ([10.209.131.146])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 08:17:45 -0800
Message-ID: <01184946-ebdc-52f1-65d9-e2905be0474e@linux.intel.com>
Date: Tue, 1 Mar 2022 07:51:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
 <28a7aa9b-8322-54df-1cfa-275805e2b044@linux.intel.com>
 <c6b0506a-24ed-d4fd-c74e-d95c6dca6fe6@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c6b0506a-24ed-d4fd-c74e-d95c6dca6fe6@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 3/1/22 05:13, Srinivas Kandagatla wrote:
> 
> 
> On 28/02/2022 18:01, Pierre-Louis Bossart wrote:
>>
>>> @@ -1424,6 +1464,11 @@ static int swrm_runtime_resume(struct device
>>> *dev)
>>>       struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>>>       int ret;
>>>   +    if (ctrl->wake_irq > 0) {
>>> +        if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>>> +            disable_irq_nosync(ctrl->wake_irq);
>>> +    }
>>> +
>>>       clk_prepare_enable(ctrl->hclk);
>>
>> This one is quite interesting. If you disable the IRQ mechanism but
>> haven't yet resumed the clock, that leaves a time window where the
>> peripheral could attempt to drive the line high. what happens in that
>> case?
> 
> 
> We did call pm_runtime_get_sync() from Wake IRQ handler, which means
> that resume should be finished as part of Wake IRQ handler. Any new
> Interrupt conditions/status generated by slave in the meantime will be
> cleared while handling SLAVE PEND interrupt.
> 
>>
>>>         if (ctrl->clock_stop_not_supported) {
>>> @@ -1491,6 +1536,11 @@ static int __maybe_unused
>>> swrm_runtime_suspend(struct device *dev)
>>>         usleep_range(300, 305);
>>>   +    if (ctrl->wake_irq > 0) {
>>> +        if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>>> +            enable_irq(ctrl->wake_irq);
>>> +    }
>>> +
>>
>> and this one is similar, you could have a case where the peripheral
>> signals a wake immediately after the ClockStopNow frame, but you may not
>> yet have enabled the wake detection interrupt.
>>
>> Would that imply that the wake is missed?
> Its Possible it might be missed at that instance, however as the Slave
> interrupt source condition/status (Ex: button Press) is still not
> cleared it should generate a Wake interrupt as soon as its enabled.

ok, thanks for the answers - both make sense.
