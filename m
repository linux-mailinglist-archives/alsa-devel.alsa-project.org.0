Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A731B86F3
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 16:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231041691;
	Sat, 25 Apr 2020 16:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231041691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587824177;
	bh=AE+VV5D5jgWtFwELNwOhIpRI6qvXNHN+MBBblWXsXxw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oR8PTjB6U/Y/+6rdZAqevczpZQ3ZLKQrcruFzzzmCKPDLAaRv9ZB+j5kiy2WoBwZW
	 v5DvH5A4bOhKKwoIdMLNsDoSFkwatATIkL0RGsiaRI3bHJE+PlNUmJ4rf0EXy1iJQ5
	 yuRVMzRsmh+xE0Yj4SGb3OM4XxQnNgPzDbeYSU9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5657AF80228;
	Sat, 25 Apr 2020 16:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D45F801EC; Sat, 25 Apr 2020 16:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFCE6F80105
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 16:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFCE6F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="PG6xPxR4"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587824065; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=p4lSwygccVZ8YSjxdjuRgUeLP+xHzfxzZZVCBXAfgvI=;
 b=PG6xPxR40gdLiFDUosLt4flt4pW15DtDI0rtyZRDSHb8vh3+HKgw+s+aB/IR4CHWq29j2V2N
 vXVON46PDFkom9EwCbIx5VRlh2BChlKhDjq1MThl20U6xZGWHfvEuV2HBOLG/TeLEKo9t2N7
 qGIcLzlo+7fr0WXzMSIQcLlyJf0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea445b9.7f84417718f0-smtp-out-n03;
 Sat, 25 Apr 2020 14:14:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 04022C433D2; Sat, 25 Apr 2020 14:14:16 +0000 (UTC)
Received: from [10.86.13.83]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3215C433D2;
 Sat, 25 Apr 2020 14:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3215C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH 05/11] ASoC: qcom: lpass: Add support for newer lpass
 version
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, broonie@kernel.org, devicetree@vger.kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-6-git-send-email-ajitp@codeaurora.org>
 <1af5face-507a-5866-d5ae-24ab050dad81@linaro.org>
From: Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <057551ef-0b2f-6907-b6f9-9880a807893b@codeaurora.org>
Date: Sat, 25 Apr 2020 19:44:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1af5face-507a-5866-d5ae-24ab050dad81@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com
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

On 4/16/2020 1:26 PM, Srinivas Kandagatla wrote:
>
>
> On 11/04/2020 09:02, Ajit Pandey wrote:
>> Few control registers bit offset of lpaif in newer lpass variants
>> are changed. Added "id" field in variant struct and changes macros
>> configuration of registers to calculate bit mask & offset based on
>> variant id.
>>
>
> These fields are handled much nicely with regmap_field, you should 
> consider using that. If not we will add overhead of check for every mask.

Sure i'll try  to add this support using regmap_field API's during v2 
patch chain

Thanks & Regards

Ajit

>
>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cpu.c       |  77 +++++++++--------
>>   sound/soc/qcom/lpass-lpaif-reg.h | 182 
>> ++++++++++++++++++++++++++++++++++++++-
>>   sound/soc/qcom/lpass-platform.c  |  31 +++----
>>   sound/soc/qcom/lpass.h           |   6 ++
>>   4 files changed, 241 insertions(+), 55 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index f177932..006ba5a 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -77,6 +77,7 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>>       struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>> +    struct lpass_variant *v = drvdata->variant;
>>       snd_pcm_format_t format = params_format(params);
>>       unsigned int channels = params_channels(params);
>>       unsigned int rate = params_rate(params);
>> @@ -89,18 +90,18 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>           return bitwidth;
>>       }
>>   -    regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
>> -            LPAIF_I2SCTL_WSSRC_INTERNAL;
>> +    regval = LPAIF_I2SCTL(v, LOOPBACK_DISABLE);
>> +    regval |= LPAIF_I2SCTL(v, WSSRC_INTERNAL);
>>         switch (bitwidth) {
>>       case 16:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_16;
>> +        regval |= LPAIF_I2SCTL(v, BITWIDTH_16);
>>           break;
>>       case 24:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_24;
>> +        regval |= LPAIF_I2SCTL(v, BITWIDTH_24);
>>           break;
>>       case 32:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_32;
>> +        regval |= LPAIF_I2SCTL(v, BITWIDTH_32);
>>           break;
>>       default:
>>           dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
>> @@ -110,24 +111,24 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>           switch (channels) {
>>           case 1:
>> -            regval |= LPAIF_I2SCTL_SPKMODE_SD0;
>> -            regval |= LPAIF_I2SCTL_SPKMONO_MONO;
>> +            regval |= LPAIF_I2SCTL(v, SPKMODE_SD0);
>> +            regval |= LPAIF_I2SCTL(v, SPKMONO_MONO);
>>               break;
>>           case 2:
>> -            regval |= LPAIF_I2SCTL_SPKMODE_SD0;
>> -            regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, SPKMODE_SD0);
>> +            regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>>               break;
>>           case 4:
>> -            regval |= LPAIF_I2SCTL_SPKMODE_QUAD01;
>> -            regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, SPKMODE_QUAD01);
>> +            regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>>               break;
>>           case 6:
>> -            regval |= LPAIF_I2SCTL_SPKMODE_6CH;
>> -            regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, SPKMODE_6CH);
>> +            regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>>               break;
>>           case 8:
>> -            regval |= LPAIF_I2SCTL_SPKMODE_8CH;
>> -            regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, SPKMODE_8CH);
>> +            regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>>               break;
>>           default:
>>               dev_err(dai->dev, "invalid channels given: %u\n",
>> @@ -137,24 +138,24 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>       } else {
>>           switch (channels) {
>>           case 1:
>> -            regval |= LPAIF_I2SCTL_MICMODE_SD0;
>> -            regval |= LPAIF_I2SCTL_MICMONO_MONO;
>> +            regval |= LPAIF_I2SCTL(v, MICMODE_SD0);
>> +            regval |= LPAIF_I2SCTL(v, MICMONO_MONO);
>>               break;
>>           case 2:
>> -            regval |= LPAIF_I2SCTL_MICMODE_SD0;
>> -            regval |= LPAIF_I2SCTL_MICMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, MICMODE_SD0);
>> +            regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>>               break;
>>           case 4:
>> -            regval |= LPAIF_I2SCTL_MICMODE_QUAD01;
>> -            regval |= LPAIF_I2SCTL_MICMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, MICMODE_QUAD01);
>> +            regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>>               break;
>>           case 6:
>> -            regval |= LPAIF_I2SCTL_MICMODE_6CH;
>> -            regval |= LPAIF_I2SCTL_MICMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, MICMODE_6CH);
>> +            regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>>               break;
>>           case 8:
>> -            regval |= LPAIF_I2SCTL_MICMODE_8CH;
>> -            regval |= LPAIF_I2SCTL_MICMONO_STEREO;
>> +            regval |= LPAIF_I2SCTL(v, MICMODE_8CH);
>> +            regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>>               break;
>>           default:
>>               dev_err(dai->dev, "invalid channels given: %u\n",
>> @@ -200,15 +201,16 @@ static int lpass_cpu_daiops_prepare(struct 
>> snd_pcm_substream *substream,
>>           struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_variant *v = drvdata->variant;
>>       int ret;
>>       unsigned int val, mask;
>>         if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -        val = LPAIF_I2SCTL_SPKEN_ENABLE;
>> -        mask = LPAIF_I2SCTL_SPKEN_MASK;
>> +        val = LPAIF_I2SCTL(v, SPKEN_ENABLE);
>> +        mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>>       } else  {
>> -        val = LPAIF_I2SCTL_MICEN_ENABLE;
>> -        mask = LPAIF_I2SCTL_MICEN_MASK;
>> +        val = LPAIF_I2SCTL(v, MICEN_ENABLE);
>> +        mask = LPAIF_I2SCTL(v, MICEN_MASK);
>>       }
>>         ret = regmap_update_bits(drvdata->lpaif_map,
>> @@ -224,6 +226,7 @@ static int lpass_cpu_daiops_trigger(struct 
>> snd_pcm_substream *substream,
>>           int cmd, struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_variant *v = drvdata->variant;
>>       int ret = -EINVAL;
>>       unsigned int val, mask;
>>   @@ -232,11 +235,11 @@ static int lpass_cpu_daiops_trigger(struct 
>> snd_pcm_substream *substream,
>>       case SNDRV_PCM_TRIGGER_RESUME:
>>       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>           if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -            val = LPAIF_I2SCTL_SPKEN_ENABLE;
>> -            mask = LPAIF_I2SCTL_SPKEN_MASK;
>> +            val = LPAIF_I2SCTL(v, SPKEN_ENABLE);
>> +            mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>>           } else  {
>> -            val = LPAIF_I2SCTL_MICEN_ENABLE;
>> -            mask = LPAIF_I2SCTL_MICEN_MASK;
>> +            val = LPAIF_I2SCTL(v, MICEN_ENABLE);
>> +            mask = LPAIF_I2SCTL(v, MICEN_MASK);
>>           }
>>             ret = regmap_update_bits(drvdata->lpaif_map,
>> @@ -251,11 +254,11 @@ static int lpass_cpu_daiops_trigger(struct 
>> snd_pcm_substream *substream,
>>       case SNDRV_PCM_TRIGGER_SUSPEND:
>>       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>           if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -            val = LPAIF_I2SCTL_SPKEN_DISABLE;
>> -            mask = LPAIF_I2SCTL_SPKEN_MASK;
>> +            val = LPAIF_I2SCTL(v, SPKEN_DISABLE);
>> +            mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>>           } else  {
>> -            val = LPAIF_I2SCTL_MICEN_DISABLE;
>> -            mask = LPAIF_I2SCTL_MICEN_MASK;
>> +            val = LPAIF_I2SCTL(v, MICEN_DISABLE);
>> +            mask = LPAIF_I2SCTL(v, MICEN_MASK);
>>           }
>>             ret = regmap_update_bits(drvdata->lpaif_map,
>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>> b/sound/soc/qcom/lpass-lpaif-reg.h
>> index 3d74ae1..4251aa6 100644
>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>> @@ -17,11 +17,28 @@
>>   #define LPAIF_I2SCTL_LOOPBACK_DISABLE    (0 << 
>> LPAIF_I2SCTL_LOOPBACK_SHIFT)
>>   #define LPAIF_I2SCTL_LOOPBACK_ENABLE    (1 << 
>> LPAIF_I2SCTL_LOOPBACK_SHIFT)
>>   +#define LPAIF_I2SCTL_LOOPBACK_MASK_V2     0x20000
>> +#define LPAIF_I2SCTL_LOOPBACK_SHIFT_V2     17
>> +#define LPAIF_I2SCTL_LOOPBACK_DISABLE_V2 (0 << 
>> LPAIF_I2SCTL_LOOPBACK_SHIFT_V2)
>> +#define LPAIF_I2SCTL_LOOPBACK_ENABLE_V2     (1 << 
>> LPAIF_I2SCTL_LOOPBACK_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_SPKEN_MASK        0x4000
>>   #define LPAIF_I2SCTL_SPKEN_SHIFT    14
>>   #define LPAIF_I2SCTL_SPKEN_DISABLE    (0 << LPAIF_I2SCTL_SPKEN_SHIFT)
>>   #define LPAIF_I2SCTL_SPKEN_ENABLE    (1 << LPAIF_I2SCTL_SPKEN_SHIFT)
>>   +#define LPAIF_I2SCTL_SPKEN_MASK_V2    0x10000
>> +#define LPAIF_I2SCTL_SPKEN_SHIFT_V2    16
>> +#define LPAIF_I2SCTL_SPKEN_DISABLE_V2    (0 << 
>> LPAIF_I2SCTL_SPKEN_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKEN_ENABLE_V2    (1 << 
>> LPAIF_I2SCTL_SPKEN_SHIFT_V2)
>> +
>> +#define __LPAIF_I2S_CTL(v, bit)  \
>> +    ((v->id ==  LPASS_VARIANT_V2) ? \
>> +        LPAIF_I2SCTL_##bit##_V2 : \
>> +        LPAIF_I2SCTL_##bit)
>> +
>> +#define LPAIF_I2SCTL(v, bit)        __LPAIF_I2S_CTL(v, bit)
>> +
>>   #define LPAIF_I2SCTL_SPKMODE_MASK    0x3C00
>>   #define LPAIF_I2SCTL_SPKMODE_SHIFT    10
>>   #define LPAIF_I2SCTL_SPKMODE_NONE    (0 << LPAIF_I2SCTL_SPKMODE_SHIFT)
>> @@ -34,16 +51,49 @@
>>   #define LPAIF_I2SCTL_SPKMODE_6CH    (7 << LPAIF_I2SCTL_SPKMODE_SHIFT)
>>   #define LPAIF_I2SCTL_SPKMODE_8CH    (8 << LPAIF_I2SCTL_SPKMODE_SHIFT)
>>   +#define LPAIF_I2SCTL_SPKMODE_MASK_V2    0xF800
>> +#define LPAIF_I2SCTL_SPKMODE_SHIFT_V2    11
>> +#define LPAIF_I2SCTL_SPKMODE_NONE_V2    (0 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD0_V2    (1 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD1_V2    (2 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD2_V2    (3 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD3_V2    (4 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_QUAD01_V2    (5 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_QUAD23_V2    (6 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_6CH_V2    (7 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_8CH_V2    (8 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_10CH_V2    (9 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_12CH_V2    (10 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_14CH_V2    (11 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_16CH_V2    (12 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD4_V2    (13 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD5_V2    (14 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD6_V2    (15 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_SD7_V2    (16 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_QUAD45_V2    (17 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_QUAD47_V2    (18 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMODE_8CH_2_V2    (19 << 
>> LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_SPKMONO_MASK    0x0200
>>   #define LPAIF_I2SCTL_SPKMONO_SHIFT    9
>>   #define LPAIF_I2SCTL_SPKMONO_STEREO    (0 << 
>> LPAIF_I2SCTL_SPKMONO_SHIFT)
>>   #define LPAIF_I2SCTL_SPKMONO_MONO    (1 << LPAIF_I2SCTL_SPKMONO_SHIFT)
>>   +#define LPAIF_I2SCTL_SPKMONO_MASK_V2    0x0400
>> +#define LPAIF_I2SCTL_SPKMONO_SHIFT_V2    10
>> +#define LPAIF_I2SCTL_SPKMONO_STEREO_V2    (0 << 
>> LPAIF_I2SCTL_SPKMONO_SHIFT_V2)
>> +#define LPAIF_I2SCTL_SPKMONO_MONO_V2    (1 << 
>> LPAIF_I2SCTL_SPKMONO_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_MICEN_MASK        GENMASK(8, 8)
>>   #define LPAIF_I2SCTL_MICEN_SHIFT    8
>>   #define LPAIF_I2SCTL_MICEN_DISABLE    (0 << LPAIF_I2SCTL_MICEN_SHIFT)
>>   #define LPAIF_I2SCTL_MICEN_ENABLE    (1 << LPAIF_I2SCTL_MICEN_SHIFT)
>>   +#define LPAIF_I2SCTL_MICEN_MASK_V2    0x0200
>> +#define LPAIF_I2SCTL_MICEN_SHIFT_V2    9
>> +#define LPAIF_I2SCTL_MICEN_DISABLE_V2    (0 << 
>> LPAIF_I2SCTL_MICEN_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICEN_ENABLE_V2    (1 << 
>> LPAIF_I2SCTL_MICEN_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_MICMODE_MASK    GENMASK(7, 4)
>>   #define LPAIF_I2SCTL_MICMODE_SHIFT    4
>>   #define LPAIF_I2SCTL_MICMODE_NONE    (0 << LPAIF_I2SCTL_MICMODE_SHIFT)
>> @@ -56,22 +106,61 @@
>>   #define LPAIF_I2SCTL_MICMODE_6CH    (7 << LPAIF_I2SCTL_MICMODE_SHIFT)
>>   #define LPAIF_I2SCTL_MICMODE_8CH    (8 << LPAIF_I2SCTL_MICMODE_SHIFT)
>>   +#define LPAIF_I2SCTL_MICMODE_MASK_V2    GENMASK(8, 4)
>> +#define LPAIF_I2SCTL_MICMODE_SHIFT_V2    4
>> +#define LPAIF_I2SCTL_MICMODE_NONE_V2    (0 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD0_V2    (1 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD1_V2    (2 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD2_V2    (3 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD3_V2    (4 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_QUAD01_V2    (5 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_QUAD23_V2    (6 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_6CH_V2    (7 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_8CH_V2    (8 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_10CH_V2    (9 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_12CH_V2    (10 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_14CH_V2    (11 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_16CH_V2    (12 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD4_V2    (13 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD5_V2    (14 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD6_V2    (15 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_SD7_V2    (16 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_QUAD45_V2    (17 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_QUAD47_V2    (18 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMODE_8CH_2_V2    (19 << 
>> LPAIF_I2SCTL_MICMODE_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_MIMONO_MASK    GENMASK(3, 3)
>>   #define LPAIF_I2SCTL_MICMONO_SHIFT    3
>>   #define LPAIF_I2SCTL_MICMONO_STEREO    (0 << 
>> LPAIF_I2SCTL_MICMONO_SHIFT)
>>   #define LPAIF_I2SCTL_MICMONO_MONO    (1 << LPAIF_I2SCTL_MICMONO_SHIFT)
>>   +#define LPAIF_I2SCTL_MICMONO_MASK_V2    GENMASK(3, 3)
>> +#define LPAIF_I2SCTL_MICMONO_SHIFT_V2    3
>> +#define LPAIF_I2SCTL_MICMONO_STEREO_V2    (0 << 
>> LPAIF_I2SCTL_MICMONO_SHIFT_V2)
>> +#define LPAIF_I2SCTL_MICMONO_MONO_V2    (1 << 
>> LPAIF_I2SCTL_MICMONO_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_WSSRC_MASK        0x0004
>>   #define LPAIF_I2SCTL_WSSRC_SHIFT    2
>>   #define LPAIF_I2SCTL_WSSRC_INTERNAL    (0 << LPAIF_I2SCTL_WSSRC_SHIFT)
>>   #define LPAIF_I2SCTL_WSSRC_EXTERNAL    (1 << LPAIF_I2SCTL_WSSRC_SHIFT)
>>   +#define LPAIF_I2SCTL_WSSRC_MASK_V2    0x0004
>> +#define LPAIF_I2SCTL_WSSRC_SHIFT_V2    2
>> +#define LPAIF_I2SCTL_WSSRC_INTERNAL_V2    (0 << 
>> LPAIF_I2SCTL_WSSRC_SHIFT_V2)
>> +#define LPAIF_I2SCTL_WSSRC_EXTERNAL_V2    (1 << 
>> LPAIF_I2SCTL_WSSRC_SHIFT_V2)
>> +
>>   #define LPAIF_I2SCTL_BITWIDTH_MASK    0x0003
>>   #define LPAIF_I2SCTL_BITWIDTH_SHIFT    0
>>   #define LPAIF_I2SCTL_BITWIDTH_16    (0 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>>   #define LPAIF_I2SCTL_BITWIDTH_24    (1 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>>   #define LPAIF_I2SCTL_BITWIDTH_32    (2 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>>   +#define LPAIF_I2SCTL_BITWIDTH_MASK_V2    0x0003
>> +#define LPAIF_I2SCTL_BITWIDTH_SHIFT_V2    0
>> +#define LPAIF_I2SCTL_BITWIDTH_16_V2    (0 << 
>> LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
>> +#define LPAIF_I2SCTL_BITWIDTH_24_V2    (1 << 
>> LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
>> +#define LPAIF_I2SCTL_BITWIDTH_32_V2    (2 << 
>> LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
>> +
>>   /* LPAIF IRQ */
>>   #define LPAIF_IRQ_REG_ADDR(v, addr, port) \
>>       (v->irq_reg_base + (addr) + v->irq_reg_stride * (port))
>> @@ -91,7 +180,6 @@
>>   #define LPAIF_IRQ_ALL(chan)        (7 << (LPAIF_IRQ_BITSTRIDE * 
>> (chan)))
>>     /* LPAIF DMA */
>> -
>>   #define LPAIF_RDMA_REG_ADDR(v, addr, chan) \
>>       (v->rdma_reg_base + (addr) + v->rdma_reg_stride * (chan))
>>   @@ -143,7 +231,7 @@
>>     #define LPAIF_DMACTL_AUDINTF_MASK    0x0F0
>>   #define LPAIF_DMACTL_AUDINTF_SHIFT    4
>> -#define LPAIF_DMACTL_AUDINTF(id)    (id << LPAIF_DMACTL_AUDINTF_SHIFT)
>> +#define LPAIF_DMACTL_AUDINTF(port)    (port << 
>> LPAIF_DMACTL_AUDINTF_SHIFT)
>>     #define LPAIF_DMACTL_FIFOWM_MASK    0x00E
>>   #define LPAIF_DMACTL_FIFOWM_SHIFT    1
>> @@ -158,11 +246,99 @@
>>     #define LPAIF_DMACTL_ENABLE_MASK    0x1
>>   #define LPAIF_DMACTL_ENABLE_SHIFT    0
>> -#define LPAIF_DMACTL_ENABLE_OFF    (0 << LPAIF_DMACTL_ENABLE_SHIFT)
>> +#define LPAIF_DMACTL_ENABLE_OFF        (0 << LPAIF_DMACTL_ENABLE_SHIFT)
>>   #define LPAIF_DMACTL_ENABLE_ON        (1 << LPAIF_DMACTL_ENABLE_SHIFT)
>>   +#define LPAIF_IRQ_BITSTRIDE        3
>> +
>> +#define LPAIF_IRQ_PER(chan)        (1 << (LPAIF_IRQ_BITSTRIDE * 
>> (chan)))
>> +#define LPAIF_IRQ_XRUN(chan)        (2 << (LPAIF_IRQ_BITSTRIDE * 
>> (chan)))
>> +#define LPAIF_IRQ_ERR(chan)        (4 << (LPAIF_IRQ_BITSTRIDE * 
>> (chan)))
>> +
>> +#define LPAIF_IRQ_ALL(chan)        (7 << (LPAIF_IRQ_BITSTRIDE * 
>> (chan)))
>> +
>>   #define LPAIF_DMACTL_DYNCLK_MASK    BIT(12)
>>   #define LPAIF_DMACTL_DYNCLK_SHIFT    12
>>   #define LPAIF_DMACTL_DYNCLK_OFF    (0 << LPAIF_DMACTL_DYNCLK_SHIFT)
>>   #define LPAIF_DMACTL_DYNCLK_ON        (1 << LPAIF_DMACTL_DYNCLK_SHIFT)
>> +
>> +#define LPAIF_DMACTL_BURSTEN_MASK_V2    0x100000
>> +#define LPAIF_DMACTL_BURSTEN_SHIFT_V2    20
>> +#define LPAIF_DMACTL_BURSTEN_SINGLE_V2    (0 << 
>> LPAIF_DMACTL_BURSTEN_SHIFT_V2)
>> +#define LPAIF_DMACTL_BURSTEN_INCR4_V2    (1 << 
>> LPAIF_DMACTL_BURSTEN_SHIFT_V2)
>> +
>> +#define LPAIF_DMACTL_WPSCNT_MASK_V2    0xF0000
>> +#define LPAIF_DMACTL_WPSCNT_SHIFT_V2    16
>> +#define LPAIF_DMACTL_WPSCNT_ONE_V2    (0 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_TWO_V2    (1 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_THREE_V2    (2 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_FOUR_V2    (3 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_SIX_V2    (5 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_EIGHT_V2    (7 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_TEN_V2    (9 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_TWELVE_V2    (11 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_FOURTEEN_V2    (13 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +#define LPAIF_DMACTL_WPSCNT_SIXTEEN_V2    (15 << 
>> LPAIF_DMACTL_WPSCNT_SHIFT_V2)
>> +
>> +#define LPAIF_DMACTL_AUDINTF_MASK_V2    0xF000
>> +#define LPAIF_DMACTL_AUDINTF_SHIFT_V2    12
>> +#define LPAIF_DMACTL_AUDINTF_V2(port)    (port << 
>> LPAIF_DMACTL_AUDINTF_SHIFT_V2)
>> +
>> +#define LPAIF_DMACTL_AUD_INTF(v, port)  \
>> +    ((v->id ==  LPASS_VARIANT_V2) ? \
>> +        LPAIF_DMACTL_AUDINTF_V2(port) : \
>> +        LPAIF_DMACTL_AUDINTF(port))
>> +
>> +#define LPAIF_DMACTL_FIFOWM_MASK_V2    0x3E
>> +#define LPAIF_DMACTL_FIFOWM_SHIFT_V2    1
>> +#define LPAIF_DMACTL_FIFOWM_1_V2    (0 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_2_V2    (1 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_3_V2    (2 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_4_V2    (3 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_5_V2    (4 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_6_V2    (5 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_7_V2    (6 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_8_V2    (7 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_9_V2    (8 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_10_V2    (9 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_11_V2    (10 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_12_V2    (11 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_13_V2    (12 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_14_V2    (13 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_15_V2    (14 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_16_V2    (15 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_17_V2    (16 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_18_V2    (17 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_19_V2    (18 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_20_V2    (19 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_21_V2    (20 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_22_V2    (21 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_23_V2    (22 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_24_V2    (23 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_25_V2    (24 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_26_V2    (25 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_27_V2    (26 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_28_V2    (27 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_29_V2    (28 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_30_V2    (29 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_31_V2    (30 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +#define LPAIF_DMACTL_FIFOWM_32_V2    (31 << 
>> LPAIF_DMACTL_FIFOWM_SHIFT_V2)
>> +
>> +#define LPAIF_DMACTL_ENABLE_MASK_V2    0x1
>> +#define LPAIF_DMACTL_ENABLE_SHIFT_V2    0
>> +#define LPAIF_DMACTL_ENABLE_OFF_V2    (0 << 
>> LPAIF_DMACTL_ENABLE_SHIFT_V2)
>> +#define LPAIF_DMACTL_ENABLE_ON_V2    (1 << 
>> LPAIF_DMACTL_ENABLE_SHIFT_V2)
>> +
>> +#define LPAIF_DMACTL_DYNCLK_MASK_V2    BIT(21)
>> +#define LPAIF_DMACTL_DYNCLK_SHIFT_V2    21
>> +#define LPAIF_DMACTL_DYNCLK_OFF_V2    (0 << 
>> LPAIF_DMACTL_DYNCLK_SHIFT_V2)
>> +#define LPAIF_DMACTL_DYNCLK_ON_V2    (1 << 
>> LPAIF_DMACTL_DYNCLK_SHIFT_V2)
>> +
>> +#define __LPAIF_DMA_CTL(v, bit)  \
>> +    ((v->id ==  LPASS_VARIANT_V2) ? \
>> +        LPAIF_DMACTL_##bit##_V2 : \
>> +        LPAIF_DMACTL_##bit)
>> +
>> +#define LPAIF_DMACTL(v, bit)        __LPAIF_DMA_CTL(v, bit)
>> +
>>   #endif /* __LPASS_LPAIF_REG_H__ */
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index b05091c2..821599e 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -146,25 +146,26 @@ static int 
>> lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>>           return bitwidth;
>>       }
>>   -    regval = LPAIF_DMACTL_BURSTEN_INCR4 |
>> -            LPAIF_DMACTL_AUDINTF(dma_port) |
>> -            LPAIF_DMACTL_FIFOWM_8;
>> +
>> +    regval = LPAIF_DMACTL(v, BURSTEN_INCR4);
>> +    regval |= LPAIF_DMACTL(v, FIFOWM_8);
>> +    regval |= LPAIF_DMACTL_AUD_INTF(v, dma_port);
>>         switch (bitwidth) {
>>       case 16:
>>           switch (channels) {
>>           case 1:
>>           case 2:
>> -            regval |= LPAIF_DMACTL_WPSCNT_ONE;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_ONE);
>>               break;
>>           case 4:
>> -            regval |= LPAIF_DMACTL_WPSCNT_TWO;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_TWO);
>>               break;
>>           case 6:
>> -            regval |= LPAIF_DMACTL_WPSCNT_THREE;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_THREE);
>>               break;
>>           case 8:
>> -            regval |= LPAIF_DMACTL_WPSCNT_FOUR;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_FOUR);
>>               break;
>>           default:
>>               dev_err(soc_runtime->dev,
>> @@ -177,19 +178,19 @@ static int 
>> lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>>       case 32:
>>           switch (channels) {
>>           case 1:
>> -            regval |= LPAIF_DMACTL_WPSCNT_ONE;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_ONE);
>>               break;
>>           case 2:
>> -            regval |= LPAIF_DMACTL_WPSCNT_TWO;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_TWO);
>>               break;
>>           case 4:
>> -            regval |= LPAIF_DMACTL_WPSCNT_FOUR;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_FOUR);
>>               break;
>>           case 6:
>> -            regval |= LPAIF_DMACTL_WPSCNT_SIX;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_SIX);
>>               break;
>>           case 8:
>> -            regval |= LPAIF_DMACTL_WPSCNT_EIGHT;
>> +            regval |= LPAIF_DMACTL(v, WPSCNT_EIGHT);
>>               break;
>>           default:
>>               dev_err(soc_runtime->dev,
>> @@ -277,7 +278,7 @@ static int lpass_platform_pcmops_prepare(struct 
>> snd_soc_component *component,
>>         ret = regmap_update_bits(drvdata->lpaif_map,
>>               LPAIF_DMACTL_REG(v, ch, dir),
>> -            LPAIF_DMACTL_ENABLE_MASK, LPAIF_DMACTL_ENABLE_ON);
>> +            LPAIF_DMACTL(v, ENABLE_MASK), LPAIF_DMACTL_ENABLE_ON);
>>       if (ret) {
>>           dev_err(soc_runtime->dev, "error writing to rdmactl reg: 
>> %d\n",
>>               ret);
>> @@ -326,7 +327,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>             ret = regmap_update_bits(drvdata->lpaif_map,
>>                   LPAIF_DMACTL_REG(v, ch, dir),
>> -                LPAIF_DMACTL_ENABLE_MASK,
>> +                LPAIF_DMACTL(v, ENABLE_MASK),
>>                   LPAIF_DMACTL_ENABLE_ON);
>>           if (ret) {
>>               dev_err(soc_runtime->dev,
>> @@ -339,7 +340,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>           ret = regmap_update_bits(drvdata->lpaif_map,
>>                   LPAIF_DMACTL_REG(v, ch, dir),
>> -                LPAIF_DMACTL_ENABLE_MASK,
>> +                LPAIF_DMACTL(v, ENABLE_MASK),
>>                   LPAIF_DMACTL_ENABLE_OFF);
>>           if (ret) {
>>               dev_err(soc_runtime->dev,
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 279cd02..384f4b8 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -17,6 +17,9 @@
>>   #define LPASS_MAX_MI2S_PORTS                   (8)
>>   #define LPASS_MAX_DMA_CHANNELS                 (8)
>>   +#define LPASS_VARIANT                0
>> +#define LPASS_VARIANT_V2            1
>> +
>>   struct lpass_dai {
>>       struct clk *osr_clk;
>>       struct clk *bit_clk;
>> @@ -91,6 +94,9 @@ struct lpass_variant {
>>       /* SOC specific clocks configuration */
>>       const char **clk_name;
>>       int num_clks;
>> +
>> +    /* LPASS Version id */
>> +    int id;
>
> May be spelling this out like "version_id" would make it more readable.
>
> thanks,
> srini
>
>
>>   };
>>     /* register the platform driver from the CPU DAI driver */
>>
