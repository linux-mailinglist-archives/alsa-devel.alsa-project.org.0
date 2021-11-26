Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22645ECD4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 12:42:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB791906;
	Fri, 26 Nov 2021 12:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB791906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637926978;
	bh=GnYum8IS0+fV8KRp3p/NylOaBVnB4WS6eYNvvMEXnkE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUEhlMkKDUynFhI+hm/1Eb+oIEecaOwh4urAInID6R36P3AlWwQ11xijWwa/ANisg
	 VI+WLn4nPArXjaGaIE4qEB8X31CmUjDho+wfYMJzAQiEaxg1Odb2j41yLniGiG3pgD
	 sYhPh57t3EgKtP+Qb+VS/uUrwFS/FBzuMPKSYS6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4165CF801F7;
	Fri, 26 Nov 2021 12:41:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E041FF80212; Fri, 26 Nov 2021 12:41:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D84BCF80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 12:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D84BCF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="UbK4tcxv"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637926894; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/ZEuKj4bQJYJW9WhSqQR5z/eUKnybN7H2nOzwjPZXXs=;
 b=UbK4tcxvAdSWDtJXPj45uln4lNpnZeQxbtXnZ3dAAYHUkW9rgDOsMEESgURqJc8NFOWicE9S
 CcPFLd4NQb+KZ3S6FJ5ptZ3ohRfRw6n9Uooi7TecC8ZxnzQz1WIOsG/Ie9KJ04Byv4xafqsX
 Z+4mMmauKDw8uwEVBoXTGDViiUk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61a0c7d386d0e4d888e8876b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 11:41:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D07ABC43616; Fri, 26 Nov 2021 11:41:06 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BBA9DC4338F;
 Fri, 26 Nov 2021 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BBA9DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v5 04/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <1637239714-11211-5-git-send-email-srivasam@codeaurora.org>
 <03051fc7-5f52-2a09-4136-6a1c717c3e75@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f880d9e3-62cf-4045-99a0-8baddc0119f4@codeaurora.org>
Date: Fri, 26 Nov 2021 17:10:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <03051fc7-5f52-2a09-4136-6a1c717c3e75@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 11/23/2021 5:57 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
>> Add lpass cpu driver to support audio over codec dma for
>> ADSP bypass usecase.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cdc-dma.c | 195 
>> +++++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass.h         |   1 +
>>   2 files changed, 196 insertions(+)
>>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>>
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c 
>> b/sound/soc/qcom/lpass-cdc-dma.c
>> new file mode 100644
>> index 0000000..f5bfda9
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
>> @@ -0,0 +1,195 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
>> + *
>> + * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/module.h>
>> +#include <sound/soc.h>
>> +#include <sound/soc-dai.h>
>> +
>> +#include "lpass-lpaif-reg.h"
>> +#include "lpass.h"
>> +
>> +static void __get_dmactl_handle(struct snd_pcm_substream *substream, 
>> struct snd_soc_dai *dai,
>> +                    struct lpaif_dmactl **dmactl, int *id)
>
> Please rename this with an lpass prefix, Also indentation looks bit 
> off here.
Okay.
>
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct snd_pcm_runtime *rt = substream->runtime;
>> +    struct lpass_pcm_data *pcm_data = rt->private_data;
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int dir = substream->stream;
>> +    unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +    if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
>> +        *dmactl = drvdata->rxtx_rd_dmactl;
>> +        *id = pcm_data->dma_ch;
>> +    } else {
>> +        if (dai_id == LPASS_CDC_DMA_TX3) {
>> +            *dmactl = drvdata->rxtx_wr_dmactl;
>> +            *id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +        } else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +            *dmactl = drvdata->va_wr_dmactl;
>> +            *id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +        }
>
> use switch case here, also something like this makes more sense rather 
> that just dealing with TX3 and VA TX0
okay. will change accordingly and add other cdc dma ports.
>
> switch (dai_id) {
> case: LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch;
>     break;
> case: LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>     break;
> case LPASS_CDC_DMA_VA_TX0 ...  LPASS_CDC_DMA_VA_TX8:
>     *dmactl = drvdata->rxtx_wr_dmactl;
>     *id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>     break;
> default:
>     dev_err(dev, "Invalid dai id for dma ctl\n");
>     break;
> }
>
>> +    }
>> +}
>> +
>> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
>> +                     struct snd_pcm_substream *substream)
>
> Indentation is off, I think most of the code has simillar issue.
Okay. will change in all places.
>
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +    struct lpaif_dmactl *dmactl;
>> +    int dir = substream->stream;
>> +    int ret, id, codec_intf;
>> +    unsigned int dai_id = cpu_dai->driver->id;
>> +
>> +    if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +        codec_intf = LPASS_CDC_DMA_RX0_INTERFACE;
>
> Why are we limiting this to just RX0, it should be trivial to add 
> support to other RX and TX dais.
>
> Add a helper to convert the dai ids to interface indexs
Okay. will change accordingly.
>
>> +    else
>> +        codec_intf = LPASS_CDC_DMA_INTERFACE(dai_id);
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> We are not checking if dmactl is valid or not, best is to have a error 
> returned from __get_dmactl_handle() and handle it properly here.
Okay. will add error handling.
>> +
>> +    ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
> Why not use a local declare a local dev pointer and use it here, it 
> will save lines here.
Okay.
>> +            "error writing to dmactl codec_intf reg field: %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_fs_sel reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_fs_delay reg field: 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_pack reg field: %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = regmap_fields_write(dmactl->codec_enable, id, 
>> LPAIF_DMACTL_ENABLE_ON);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_enable reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int lpass_wcd_daiops_startup(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    int ret;
>> +
>> +    ret = clk_bulk_prepare_enable(drvdata->cdc_num_clks, 
>> drvdata->cdc_clks);
>> +    if (ret) {
>> +        dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>
> may be just do
> return clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
>
> soc_dai_ret() should print an error if startup fails.
>
Okay.
>
>
>> +}
>> +
>> +static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    clk_bulk_disable_unprepare(drvdata->cdc_num_clks, 
>> drvdata->cdc_clks);
>> +}
>> +
>> +static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct lpaif_dmactl *dmactl;
>> +    unsigned int ret, regval;
>> +    unsigned int channels = params_channels(params);
>> +    int id;
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> may be move it after switch case and handle the errors.
Okay. will move it below.
>> +
>> +    switch (channels) {
>> +    case 1:
>> +        regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
>> +        break;
>> +    case 2:
>> +        regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
>> +        break;
>> +    case 4:
>> +        regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
>> +        break;
>> +    case 6:
>> +        regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
>> +        break;
>> +    case 8:
>> +        regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
>> +        break;
>> +    default:
>> +        dev_err(soc_runtime->dev, "invalid PCM config\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = regmap_fields_write(dmactl->codec_channel, id, regval);
>> +    if (ret) {
>> +        dev_err(soc_runtime->dev,
>> +            "error writing to dmactl codec_channel reg field: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int lpass_wcd_daiops_trigger(struct snd_pcm_substream 
>> *substream,
>> +        int cmd, struct snd_soc_dai *dai)
>> +{
>> +    struct snd_soc_pcm_runtime *soc_runtime = 
>> asoc_substream_to_rtd(substream);
>> +    struct lpaif_dmactl *dmactl;
>> +    int ret = 0, id;
>> +
>> +    __get_dmactl_handle(substream, dai, &dmactl, &id);
>
> move it inside the case where this is really used.
Okay.
>
>> +
>> +    switch (cmd) {
>> +    case SNDRV_PCM_TRIGGER_START:
>> +    case SNDRV_PCM_TRIGGER_RESUME:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +        __lpass_platform_codec_intf_init(dai, substream);
>> +        break;
>> +    case SNDRV_PCM_TRIGGER_STOP:
>> +    case SNDRV_PCM_TRIGGER_SUSPEND:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +        ret = regmap_fields_write(dmactl->codec_enable, id, 
>> LPAIF_DMACTL_ENABLE_OFF);
>> +        if (ret) {
>> +            dev_err(soc_runtime->dev,
>> +                "error writing to dmactl codec_enable reg: %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        break;
>
> missing default:
Okay. will add it.
>
>> +    }
>> +    return ret;
>> +}
>> +
>> +const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
>> +    .startup    = lpass_wcd_daiops_startup,
>> +    .shutdown    = lpass_wcd_daiops_shutdown,
>> +    .hw_params    = lpass_wcd_daiops_hw_params,
>> +    .trigger    = lpass_wcd_daiops_trigger,
>> +};
>> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
>> +
>> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
>> +MODULE_LICENSE("GPL v2");
>
> use
> MODULE_LICENSE("GPL");
>
> more info in ./Documentation/process/license-rules.rst
>
> --srini
Okay.
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index b068534..f912425 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -414,5 +414,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct 
>> snd_soc_dai *dai);
>>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>>   int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>                   struct snd_soc_dai *dai);
>> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
>>     #endif /* __LPASS_H__ */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

