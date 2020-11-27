Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973D2C6AE7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 18:50:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD081858;
	Fri, 27 Nov 2020 18:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD081858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606499453;
	bh=lhc7NXLIa/+aJQjSHvko46kzHVbnu9bGaY1Vcay0/is=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAIqRA9ebVS0oh9C5hBuACdSSzpnkiywfWtPR+BsfSAV5C+sbJMAynpRn0dGlCoIu
	 BcZcIrzYrBHjAZX/MHgyYIAxocMXbnEMRnieNHCw92vtaNv/Pnhs5VzUMBkbdqKMpb
	 bVkJyIhPj9zCwtJUIlVu22RuNllcn1nti7CwoDVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32023F800E0;
	Fri, 27 Nov 2020 18:49:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D64CAF8019D; Fri, 27 Nov 2020 18:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E297F8015A
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 18:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E297F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="OefnzRUH"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606499352; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pUPCU+QayI1Qx+sBFoJcvK5sgEvyc418pyh2vbWzEQE=;
 b=OefnzRUHu0hvtmOvuxy6TjxW+CeZgLGqj16BQjM3SmPJcd+tijU8QulZuIWPrqICKISm98hX
 ZyRqVZ7kGzg1ym37WQyCeqrgT4Bbebp9NmBtxv3M8GmfFNs/aRe0vGnvMbVXhwSLblnaZuAz
 lWbE8egf6TmQWO+RJ6ztLwafamg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fc13c0ca5a29b56a1525558 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 17:49:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 18892C43460; Fri, 27 Nov 2020 17:49:00 +0000 (UTC)
Received: from [172.20.10.2] (unknown [27.59.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9F65C433C6;
 Fri, 27 Nov 2020 17:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9F65C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend
 resume
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
 <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <0055cc2e-87f1-bcc3-247b-8a4bd1bea883@codeaurora.org>
Date: Fri, 27 Nov 2020 23:18:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks a lot  Srinivas for your valuable review comments and for your 
time!!!

On 11/27/2020 5:39 PM, Srinivas Kandagatla wrote:
>
>
> On 27/11/2020 09:56, Srinivasa Rao Mandadapu wrote:
>> To support playback continuation after hard suspend(bypass powerd)
>>   and resume:
>> Prepare device in  platform trigger callback.
>> Make I2s and DMA control registers as non volatile.
> Looks like there are two changes here, One is fixing the volatile 
> registers!
>
>
> Other is preparing device after suspend!
>
> Consider splitting them!
>
Okay will split and share.
>>
>
> Fixes tag is missing here?
>
Actually fixing volatile registers is just partial reversal of commit 
b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid 
state")

Will revert and share the patch separately.

>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes Since v1 and v2:
>>    -- Subject lines changed
>>
>>   sound/soc/qcom/lpass-cpu.c      | 8 ++------
>>   sound/soc/qcom/lpass-platform.c | 5 +++--
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index af684fd..c99be03 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct 
>> device *dev, unsigned int reg)
>>       struct lpass_variant *v = drvdata->variant;
>>       int i;
>>   -    for (i = 0; i < v->i2s_ports; ++i)
>> -        if (reg == LPAIF_I2SCTL_REG(v, i))
>> -            return true;
>>       for (i = 0; i < v->irq_ports; ++i)
>>           if (reg == LPAIF_IRQSTAT_REG(v, i))
>>               return true;
>>         for (i = 0; i < v->rdma_channels; ++i)
>> -        if (reg == LPAIF_RDMACURR_REG(v, i) || reg == 
>> LPAIF_RDMACTL_REG(v, i))
>> +        if (reg == LPAIF_RDMACURR_REG(v, i))
>>               return true;
>>         for (i = 0; i < v->wrdma_channels; ++i)
>> -        if (reg == LPAIF_WRDMACURR_REG(v, i + 
>> v->wrdma_channel_start) ||
>> -            reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
>> +        if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
>>               return true;
>>         return false;
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index 80b09de..2b0a7c1 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>           return -ENOTRECOVERABLE;
>>       }
>>       switch (cmd) {
>> -    case SNDRV_PCM_TRIGGER_START:
>>       case SNDRV_PCM_TRIGGER_RESUME:
>> +        lpass_platform_pcmops_prepare(component, substream);
>
> Can you elaborate the actual issue here?
>
> Are any other registers needs to re-programmed??
>
> Does it make sense to use
> regcache_mark_dirty()
> regcache_sync() in pm suspend resume path,
> instead of calling prepare explicitly?
>
>
> --srini
>
Yes it's working fine with regcache APIs. will update the patch.
>
>> +    case SNDRV_PCM_TRIGGER_START:
>>       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>           ret = regmap_fields_write(dmactl->enable, id,
>>                            LPAIF_DMACTL_ENABLE_ON);
>> @@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>           break;
>>       }
>>   -    return 0;
>> +    return ret;
>>   }
>>     static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

