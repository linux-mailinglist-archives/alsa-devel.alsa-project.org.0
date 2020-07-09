Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42A219D64
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:16:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE70B166E;
	Thu,  9 Jul 2020 12:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE70B166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289798;
	bh=XV2cYilyGa2nnX6MBugz7KxYFwPFtsFoRer0cjdBCQY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnsWNPjy6tfRIP6APuLDuc8ix6UQpSxzw3xoyQAD9obH/aZMe78d0VRMAqEBzFOn6
	 pSwtAbcfMvi1O3iMhEhtHX8rm17SImCWyJfq/6mnR1EWjSJDZBBuE+NbzlyY3QU9t7
	 fOUaQfMZcGe10vDyKHNm2KejZo75Jrjgk1RL3ZQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E959DF80117;
	Thu,  9 Jul 2020 12:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E83F80216; Thu,  9 Jul 2020 12:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, RCVD_IN_SORBS_WEB, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9A6F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9A6F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="E8Gvakea"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594289727; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=R96k3NJkJXHArnjayQMtO7eaVw9xfD/00FOqn9uud7M=;
 b=E8GvakeahhCn8QJH6dsqkuSw4kfte8BAoC0BJRZevVzo3aks6OgBzr1X4nnP6v/YNYOw3IcC
 kjymWwqrnZRIxpEyTUsmWjww3Bzo1uzySMHVEtLJlZHaep4pHAB2/gcY6lGawHdeQdU1Ja7T
 em/ToKMb4BpYxZCsUeojJq+9kYA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f06ee2c9b7f1f3df7dae62d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 10:15:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2266C433C8; Thu,  9 Jul 2020 10:15:07 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FFF2C43387;
 Thu,  9 Jul 2020 10:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0FFF2C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v3 3/8] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-4-git-send-email-rohitkr@codeaurora.org>
 <a59dc25f-cac2-5540-f1f4-78fd749c65c9@linaro.org>
 <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
 <ac634d4d-527a-7262-2744-203c04ee0982@linaro.org>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <4c5cb96c-9423-67a5-0da6-ee7cf9b1ea32@codeaurora.org>
Date: Thu, 9 Jul 2020 15:44:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ac634d4d-527a-7262-2744-203c04ee0982@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 7/9/2020 3:36 PM, Srinivas Kandagatla wrote:
>
>
> On 09/07/2020 10:57, Rohit Kumar wrote:
>> Thanks Srini for reviewing.
>>
>> On 7/9/2020 2:56 PM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 08/07/2020 06:08, Rohit kumar wrote:
>>>> I2SCTL and DMACTL registers has different bits alignment for newer
>>>> LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
>>>> reg_fields in platform specific file and removed shifts and mask
>>>> macros for such registers from header file.
>>>>
>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>
>>> Thanks Rohit for doing this, this looks much better now!
>>> I have few minor comments..
>>>
>>>> ---
>>>>   sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
>>>>   sound/soc/qcom/lpass-cpu.c       | 163 
>>>> +++++++++++++++++++++++----------------
>>>>   sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
>>>>   sound/soc/qcom/lpass-lpaif-reg.h | 157 
>>>> +++++++++++++++++++------------------
>>>>   sound/soc/qcom/lpass-platform.c  | 151 
>>>> +++++++++++++++++++++++++++---------
>>>>   sound/soc/qcom/lpass.h           |  53 +++++++++++++
>>>>   6 files changed, 398 insertions(+), 174 deletions(-)
>>>>
>>>
>>> index f0c7e93..f358d12 100644
>>>> --- a/sound/soc/qcom/lpass-cpu.c
>>>> +++ b/sound/soc/qcom/lpass-cpu.c
>>>> @@ -29,6 +29,32 @@
>>>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>>>
>>>
>>>>   }
>>>>   -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream 
>>>> *substream,
>>>> -        struct snd_soc_dai *dai)
>>>> -{
>>>> -    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>>>> -    int ret;
>>>> -
>>>> -    ret = regmap_write(drvdata->lpaif_map,
>>>> -               LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>>>> -               0);
>>>> -    if (ret)
>>>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>>>> -
>>>> -    return ret;
>>>> -}
>>>
>>> Any particular reason why this function remove
>>
>> This was causing issue in playback/capture concurrency. It sets 
>> I2SCTL register value to 0
>>
>> when usecase ends. However, playback/capture specific bits are 
>> already cleared during trigger() stop
>>
>> function. So, this is not needed.
>
> This should be sent as separate fix with fixes tag!
Ok. Will create separate patch with fixes tag and post.
>
>>
>>
>>>
>>>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>>>> b/sound/soc/qcom/lpass-lpaif-reg.h
>>>> index 72a3e2f..5258e60 100644
>>>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>>>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>>>> @@ -12,15 +12,12 @@
>>> ...
>>>>   #endif /* __LPASS_LPAIF_REG_H__ */
>>>> diff --git a/sound/soc/qcom/lpass-platform.c 
>>>> b/sound/soc/qcom/lpass-platform.c
>>>> index 34f7fd1..445ca193 100644
>>>> --- a/sound/soc/qcom/lpass-platform.c
>>>> +++ b/sound/soc/qcom/lpass-platform.c
>>>> @@ -50,6 +50,53 @@ static const struct snd_pcm_hardware 
>>>> lpass_platform_pcm_hardware = {
>>>>       .fifo_size        =    0,
>>>>   };
>>> ...
>>>>   static int lpass_platform_pcmops_open(struct snd_soc_component 
>>>> *component,
>>>>                         struct snd_pcm_substream *substream)
>>>>   {
>>>> @@ -59,9 +106,9 @@ static int lpass_platform_pcmops_open(struct 
>>>> snd_soc_component *component,
>>>>       struct lpass_data *drvdata = 
>>>> snd_soc_component_get_drvdata(component);
>>>>       struct lpass_variant *v = drvdata->variant;
>>>>       int ret, dma_ch, dir = substream->stream;
>>>> -    struct lpass_pcm_data *data;
>>>> +    struct lpass_pcm_data *data = NULL;
>>>>   -    data = devm_kzalloc(soc_runtime->dev, sizeof(*data), 
>>>> GFP_KERNEL);
>>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>>
>>> Does this change belong in this patch?
>>
>>
>> As part of this change, I fixed memory leak too by adding kfree() in 
>> close()
>>
>> However, this was causing issue as memory was allocated using 
>> devm_kzalloc().
>>
>> Should I move it to different patch?
>
> That would be the right thing to do, can also add fixes tag!


Sure, Will do that in next spin.

>
>
>>
>>>
>>>>       if (!data)
>>>>           return -ENOMEM;
>>>>   @@ -111,13 +158,13 @@ static int 
>>>> lpass_platform_pcmops_close(struct snd_soc_component *component,
>>>>       struct snd_pcm_runtime *runtime = substream->runtime;
>>>>       struct lpass_data *drvdata = 
>>>> snd_soc_component_get_drvdata(component);
>>>>       struct lpass_variant *v = drvdata->variant;
>
>>>
>>> Above two along with rddma members can be removed, these become 
>>> redundant after adding regmap field!
>>>
>> wrdma_channels is used in alloc_dma_channel() to get the channel id.
>>
>> Also, both are used for other DMA registers such as LPAIF_RDMABASE_REG,
>>
>> LPAIF_RDMABUFF_REG, LPAIF_RDMACURR_REG, etc.
>>
> Ah I see we are still using this in lpass_cpu_regmap_writeable!
> ignore my previous comments about removing them!
>
> --srini

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

