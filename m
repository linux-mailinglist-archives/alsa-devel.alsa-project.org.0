Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC6219CBC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DBF1616;
	Thu,  9 Jul 2020 11:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DBF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594288808;
	bh=XCiMam8gio2Z7tnIrEfWZRj0XlQVUazyvlxNRQDe4no=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gYLrvY5popASa+4jsz2Dhq7MVICbxmGgr4sW++u2RMRfkvFXdqep5HBx6T2WJWhx0
	 +IxqLmOcK18N78qLqY+MXlW5PV0JK8uEf/8WZwy8VWO2VK9IUj+Fqbm9rPpwk1jpbY
	 BCzIRudTgzoOisC6IKPyvEbL7p6GOHK0H9tsYd0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF169F80117;
	Thu,  9 Jul 2020 11:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B84F801F9; Thu,  9 Jul 2020 11:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, RCVD_IN_SORBS_WEB, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13732F80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13732F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="NOvYmkhc"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594288699; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=eS1XOI68pXq0NOUkMcH2o3feRaMXHOaXLg9KHCbs3pQ=;
 b=NOvYmkhcFbuaKcq4FOE4toYJJgfL973XgyKhvqn28Uw0X13awMdq6EllzhB0k7T/xdkFWVBV
 IEM2wJ3d9zgfoIEZgaYAojyAbCdIkp1ZOK2QSkq1CxjrBh+tHIIfzP8ADGMhyzeiV2sIIw3m
 DCtp2967CHCZpGtJXr8K/hcGHdM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f06ea0778e7807b5ebf1c07 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 09:57:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8C0BCC433C8; Thu,  9 Jul 2020 09:57:26 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61982C433C6;
 Thu,  9 Jul 2020 09:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61982C433C6
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
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
Date: Thu, 9 Jul 2020 15:27:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a59dc25f-cac2-5540-f1f4-78fd749c65c9@linaro.org>
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

Thanks Srini for reviewing.

On 7/9/2020 2:56 PM, Srinivas Kandagatla wrote:
>
>
> On 08/07/2020 06:08, Rohit kumar wrote:
>> I2SCTL and DMACTL registers has different bits alignment for newer
>> LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
>> reg_fields in platform specific file and removed shifts and mask
>> macros for such registers from header file.
>>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>
> Thanks Rohit for doing this, this looks much better now!
> I have few minor comments..
>
>> ---
>>   sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
>>   sound/soc/qcom/lpass-cpu.c       | 163 
>> +++++++++++++++++++++++----------------
>>   sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
>>   sound/soc/qcom/lpass-lpaif-reg.h | 157 
>> +++++++++++++++++++------------------
>>   sound/soc/qcom/lpass-platform.c  | 151 
>> +++++++++++++++++++++++++++---------
>>   sound/soc/qcom/lpass.h           |  53 +++++++++++++
>>   6 files changed, 398 insertions(+), 174 deletions(-)
>>
>
> index f0c7e93..f358d12 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -29,6 +29,32 @@
>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>
>
>>   static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int 
>> clk_id,
>>           unsigned int freq, int dir)
>>   {
>> @@ -79,12 +105,13 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>           struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
>> +    unsigned int id = dai->driver->id;
>>       snd_pcm_format_t format = params_format(params);
>>       unsigned int channels = params_channels(params);
>>       unsigned int rate = params_rate(params);
>>       unsigned int mode;
>> -    unsigned int regval;
>> -    int bitwidth, ret;
>> +    int bitwidth, ret, regval;
>
> Why is this change?

Sorry, It came as part of previous patchset. regval was removed in 
patchv2  and

bitwidth variable was used to configure both clk and i2sctl register, 
which was not proper.

Added regval again. I will repost this patch without this change.

>
>>         bitwidth = snd_pcm_format_width(format);
>>       if (bitwidth < 0) {
>> @@ -92,28 +119,45 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>           return bitwidth;
>>       }
>>   -    regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
>> -            LPAIF_I2SCTL_WSSRC_INTERNAL;
>> +    ret = regmap_fields_write(i2sctl->loopback, id,
>> +                 LPAIF_I2SCTL_LOOPBACK_DISABLE);
>> +    if (ret) {
>> +        dev_err(dai->dev, "error updating loopback field: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = regmap_fields_write(i2sctl->wssrc, id,
>> +                 LPAIF_I2SCTL_WSSRC_INTERNAL);
>> +    if (ret) {
>> +        dev_err(dai->dev, "error updating wssrc field: %d\n", ret);
>> +        return ret;
>> +    }
>>         switch (bitwidth) {
>>       case 16:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_16;
>> +        regval = LPAIF_I2SCTL_BITWIDTH_16;
>>           break;
>>       case 24:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_24;
>> +        regval = LPAIF_I2SCTL_BITWIDTH_24;
>>           break;
>>       case 32:
>> -        regval |= LPAIF_I2SCTL_BITWIDTH_32;
>> +        regval = LPAIF_I2SCTL_BITWIDTH_32;
>>           break;
>>       default:
>>           dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
>>           return -EINVAL;
>>       }
>>   +    ret = regmap_fields_write(i2sctl->bitwidth, id, regval);
>> +    if (ret) {
>> +        dev_err(dai->dev, "error updating bitwidth field: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>>       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> -        mode = drvdata->mi2s_playback_sd_mode[dai->driver->id];
>> +        mode = drvdata->mi2s_playback_sd_mode[id];
>>       else
>> -        mode = drvdata->mi2s_capture_sd_mode[dai->driver->id];
>> +        mode = drvdata->mi2s_capture_sd_mode[id];
>>         if (!mode) {
>>           dev_err(dai->dev, "no line is assigned\n");
>> @@ -175,30 +219,34 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>       }
>>         if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -        regval |= LPAIF_I2SCTL_SPKMODE(mode);
>> +        ret = regmap_fields_write(i2sctl->spkmode, id,
>> +                     LPAIF_I2SCTL_SPKMODE(mode));
>>             if (channels >= 2)
>> -            regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
>> +            ret = regmap_fields_write(i2sctl->spkmono, id,
>> +                         LPAIF_I2SCTL_SPKMONO_STEREO);
>>           else
>> -            regval |= LPAIF_I2SCTL_SPKMONO_MONO;
>> +            ret = regmap_fields_write(i2sctl->spkmono, id,
>> +                         LPAIF_I2SCTL_SPKMONO_MONO);
>>       } else {
>> -        regval |= LPAIF_I2SCTL_MICMODE(mode);
>> +        ret = regmap_fields_write(i2sctl->micmode, id,
>> +                     LPAIF_I2SCTL_MICMODE(mode));
>>             if (channels >= 2)
>> -            regval |= LPAIF_I2SCTL_MICMONO_STEREO;
>> +            ret = regmap_fields_write(i2sctl->micmono, id,
>> +                         LPAIF_I2SCTL_MICMONO_STEREO);
>>           else
>> -            regval |= LPAIF_I2SCTL_MICMONO_MONO;
>> +            ret = regmap_fields_write(i2sctl->micmono, id,
>> +                         LPAIF_I2SCTL_MICMONO_MONO);
>>       }
>>   -    ret = regmap_write(drvdata->lpaif_map,
>> -               LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>> -               regval);
>>       if (ret) {
>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>> +        dev_err(dai->dev, "error writing to i2sctl channels mode: 
>> %d\n",
>> +            ret);
>>           return ret;
>>       }
>>   -    ret = clk_set_rate(drvdata->mi2s_bit_clk[dai->driver->id],
>> +    ret = clk_set_rate(drvdata->mi2s_bit_clk[id],
>>                  rate * bitwidth * 2);
>>       if (ret) {
>>           dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
>> @@ -209,41 +257,24 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>       return 0;
>>   }
>>   -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream 
>> *substream,
>> -        struct snd_soc_dai *dai)
>> -{
>> -    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> -    int ret;
>> -
>> -    ret = regmap_write(drvdata->lpaif_map,
>> -               LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>> -               0);
>> -    if (ret)
>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>> -
>> -    return ret;
>> -}
>
> Any particular reason why this function remove

This was causing issue in playback/capture concurrency. It sets I2SCTL 
register value to 0

when usecase ends. However, playback/capture specific bits are already 
cleared during trigger() stop

function. So, this is not needed.

>> -
>>   static int lpass_cpu_daiops_prepare(struct snd_pcm_substream 
>> *substream,
>>           struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
>> +    unsigned int id = dai->driver->id;
>>       int ret;
>> -    unsigned int val, mask;
>>         if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -        val = LPAIF_I2SCTL_SPKEN_ENABLE;
>> -        mask = LPAIF_I2SCTL_SPKEN_MASK;
>> -    } else  {
>> -        val = LPAIF_I2SCTL_MICEN_ENABLE;
>> -        mask = LPAIF_I2SCTL_MICEN_MASK;
>> +        ret = regmap_fields_write(i2sctl->spken, id,
>> +                     LPAIF_I2SCTL_SPKEN_ENABLE);
>> +    } else {
>> +        ret = regmap_fields_write(i2sctl->micen, id,
>> +                     LPAIF_I2SCTL_MICEN_ENABLE);
>>       }
>>   -    ret = regmap_update_bits(drvdata->lpaif_map,
>> -            LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>> -            mask, val);
>>       if (ret)
>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>> +        dev_err(dai->dev, "error writing to i2sctl enable: %d\n", ret);
>>         return ret;
>>   }
> ...
>> @@ -304,7 +326,6 @@ const struct snd_soc_dai_ops 
>> asoc_qcom_lpass_cpu_dai_ops = {
>>       .startup    = lpass_cpu_daiops_startup,
>>       .shutdown    = lpass_cpu_daiops_shutdown,
>>       .hw_params    = lpass_cpu_daiops_hw_params,
>> -    .hw_free    = lpass_cpu_daiops_hw_free,
>>       .prepare    = lpass_cpu_daiops_prepare,
>>       .trigger    = lpass_cpu_daiops_trigger,
>>   };
>> @@ -599,6 +620,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>           }
>>       }
>>   +    /* Allocation for i2sctl regmap fields */
>> +    drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct 
>> lpaif_i2sctl),
>> +                    GFP_KERNEL);
>> +
>> +    /* Initialize bitfields for dai I2SCTL register */
>> +    ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
>> +                        drvdata->lpaif_map);
>> +    if (ret) {
>> +        dev_err(dev, "error init i2sctl field: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>>       ret = devm_snd_soc_register_component(dev,
>>                             &lpass_cpu_comp_driver,
>>                             variant->dai_driver,
>
>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>> b/sound/soc/qcom/lpass-lpaif-reg.h
>> index 72a3e2f..5258e60 100644
>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>> @@ -12,15 +12,12 @@
> ...
>>   #endif /* __LPASS_LPAIF_REG_H__ */
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index 34f7fd1..445ca193 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -50,6 +50,53 @@ static const struct snd_pcm_hardware 
>> lpass_platform_pcm_hardware = {
>>       .fifo_size        =    0,
>>   };
> ...
>>   static int lpass_platform_pcmops_open(struct snd_soc_component 
>> *component,
>>                         struct snd_pcm_substream *substream)
>>   {
>> @@ -59,9 +106,9 @@ static int lpass_platform_pcmops_open(struct 
>> snd_soc_component *component,
>>       struct lpass_data *drvdata = 
>> snd_soc_component_get_drvdata(component);
>>       struct lpass_variant *v = drvdata->variant;
>>       int ret, dma_ch, dir = substream->stream;
>> -    struct lpass_pcm_data *data;
>> +    struct lpass_pcm_data *data = NULL;
>>   -    data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>
> Does this change belong in this patch?


As part of this change, I fixed memory leak too by adding kfree() in close()

However, this was causing issue as memory was allocated using 
devm_kzalloc().

Should I move it to different patch?

>
>>       if (!data)
>>           return -ENOMEM;
>>   @@ -111,13 +158,13 @@ static int lpass_platform_pcmops_close(struct 
>> snd_soc_component *component,
>>       struct snd_pcm_runtime *runtime = substream->runtime;
>>       struct lpass_data *drvdata = 
>> snd_soc_component_get_drvdata(component);
>>       struct lpass_variant *v = drvdata->variant;
>> -    struct lpass_pcm_data *data;
>> +    struct lpass_pcm_data *data = runtime->private_data;
>>   -    data = runtime->private_data;
>>       drvdata->substream[data->dma_ch] = NULL;
>>       if (v->free_dma_channel)
>>           v->free_dma_channel(drvdata, data->dma_ch);
>>   +    kfree(data);
>>       return 0;
>>   }
>>           return devm_snd_soc_register_component(&pdev->dev,
>>               &lpass_component_driver, NULL, 0);
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 450020e..4294ec2 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -17,6 +17,28 @@
>>   #define LPASS_MAX_MI2S_PORTS            (8)
>>   #define LPASS_MAX_DMA_CHANNELS            (8)
> ...
>
>>   /* Both the CPU DAI and platform drivers will access this data */
>>   struct lpass_data {
>>   @@ -55,6 +77,10 @@ struct lpass_data {
>>       struct clk_bulk_data *clks;
>>       int num_clks;
>>   +    /* Regmap fields of I2SCTL & DMACTL registers bitfields */
>> +    struct lpaif_i2sctl *i2sctl;
>> +    struct lpaif_dmactl *rd_dmactl;
>> +    struct lpaif_dmactl *wr_dmactl;
>>   };
>>     /* Vairant data per each SOC */
>> @@ -72,6 +98,33 @@ struct lpass_variant {
>>       u32    wrdma_reg_stride;
>>       u32    wrdma_channels;
>
> Above two along with rddma members can be removed, these become 
> redundant after adding regmap field!
>
wrdma_channels is used in alloc_dma_channel() to get the channel id.

Also, both are used for other DMA registers such as LPAIF_RDMABASE_REG,

LPAIF_RDMABUFF_REG, LPAIF_RDMACURR_REG, etc.

>
>> +    /* I2SCTL Register fields */
>> +    struct reg_field loopback;
>> +    struct reg_field spken;
>> +    struct reg_field spkmode;
>> +    struct reg_field spkmono;
>> +    struct reg_field micen;
>> +    struct reg_field micmode;
>> +    struct reg_field micmono;
>> +    struct reg_field wssrc;
>> +    struct reg_field bitwidth;
>> +
>> +    /* RD_DMA Register fields */
>> +    struct reg_field rdma_bursten;
>> +    struct reg_field rdma_wpscnt;
>> +    struct reg_field rdma_intf;
>> +    struct reg_field rdma_fifowm;
>> +    struct reg_field rdma_enable;
>> +    struct reg_field rdma_dyncclk;
>> +
>> +    /* RD_DMA Register fields */
>> +    struct reg_field wrdma_bursten;
>> +    struct reg_field wrdma_wpscnt;
>> +    struct reg_field wrdma_intf;
>> +    struct reg_field wrdma_fifowm;
>> +    struct reg_field wrdma_enable;
>> +    struct reg_field wrdma_dyncclk;
>> +
>>       /**
>>        * on SOCs like APQ8016 the channel control bits start
>>        * at different offset to ipq806x
>>
Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

