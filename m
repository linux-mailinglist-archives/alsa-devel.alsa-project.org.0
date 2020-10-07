Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA27285C26
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 11:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7FB16C8;
	Wed,  7 Oct 2020 11:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7FB16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602064619;
	bh=X8Q9DyH1qnzslNjjt79eWumrILoBLv+o+MblEofJWys=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fztQiwuO48OeycH6JqAskSSZbP927IdjWQm3VlgGdokdxvxxWEIUJzbGVHMprgGfM
	 g3mbqylq0/DKbwiHBYH8lofbth3I0zcNTqtIE1zSQIP5s8fQS9a/iatXdFW+iUoN9F
	 0PNwuzmyRIF+FYI8paFrQ0PL8oRdiXzGl4CejqgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCD54F8016A;
	Wed,  7 Oct 2020 11:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C53D4F80128; Wed,  7 Oct 2020 11:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7AE0F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 11:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7AE0F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="hVlj1UKe"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602064509; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8ozygbxud/OiIEgYTJ4LYZiKUJyPCwUTAIFE1enRe1Y=;
 b=hVlj1UKexCujTbKbCbvygWImV5B+TEhIUrtcg2y+04Q1NAA/zlkyQfW7lHIc+bxUogy58ZgQ
 SbC6JoSWKQv1NmqCAfI6R73pLrDSl1QZZsaIJnYEANkCbf/0whYU7roIbD0N2gKHEQe+k79s
 dSML821OvlW3gRxmmX/Go4ErReg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f7d907c4f8cc67c31504097 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 09:55:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41B33C433FE; Wed,  7 Oct 2020 09:55:07 +0000 (UTC)
Received: from [10.131.172.121]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3CDEC433CB;
 Wed,  7 Oct 2020 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3CDEC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v10 5/7] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601873310-1894-1-git-send-email-srivasam@codeaurora.org>
 <1601873310-1894-6-git-send-email-srivasam@codeaurora.org>
 <5a6a282b-91e7-7bba-c86b-ec0ca54e3b4b@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <ac550e26-cfb9-3275-7ea0-530f4598b0f3@codeaurora.org>
Date: Wed, 7 Oct 2020 15:24:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5a6a282b-91e7-7bba-c86b-ec0ca54e3b4b@linaro.org>
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

Thanks for review comments Srinivas!!!

On 10/7/2020 2:00 AM, Srinivas Kandagatla wrote:
> On 05/10/2020 05:48, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Upadate lpass cpu and platform driver to support audio over dp.
>> Also add lpass-hdmi.c and lpass-hdmi.h.
>>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/Kconfig           |   5 +
>>   sound/soc/qcom/Makefile          |   2 +
>>   sound/soc/qcom/lpass-apq8016.c   |   4 +-
>>   sound/soc/qcom/lpass-cpu.c       |  51 ++++-
>>   sound/soc/qcom/lpass-hdmi.c      | 468 
>> +++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass-hdmi.h      | 106 +++++++++
>>   sound/soc/qcom/lpass-ipq806x.c   |   4 +-
>>   sound/soc/qcom/lpass-lpaif-reg.h |  52 ++++-
>>   sound/soc/qcom/lpass-platform.c  | 391 
>> ++++++++++++++++++++++++++------
>>   sound/soc/qcom/lpass.h           | 113 +++++++++-
>>   10 files changed, 1097 insertions(+), 99 deletions(-)
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
>>
> ...
>
>> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
>> new file mode 100644
>> index 0000000..ee737f0
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-hdmi.c
>> @@ -0,0 +1,468 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>> + *
>> + * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
>> + */
>> +
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <sound/pcm_params.h>
>> +#include <linux/regmap.h>
>> +#include <sound/soc.h>
>> +#include <sound/soc-dai.h>
>> +#include <dt-bindings/sound/sc7180-lpass.h>
>> +#include "lpass-lpaif-reg.h"
>> +#include "lpass.h"
>> +
>
> [
>> +#define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
>> +    do { \
>> +        mf = devm_regmap_field_alloc(d, m, f);     \
>> +        if (IS_ERR(mf))                \
>> +            return -EINVAL;         \
>> +    } while (0)
>> +
>> +
> ]
> should go into lpass.h
>
okay!. will move to lpass.h
> [
>> +int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
>> +{
>> +    struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +    struct lpass_variant *v = drvdata->variant;
>> +    unsigned int i;
>> +    struct lpass_hdmi_tx_ctl *tx_ctl;
>> +    struct regmap_field *legacy_en;
>> +    struct lpass_vbit_ctrl *vbit_ctl;
>> +    struct regmap_field *tx_parity;
>> +    struct lpass_dp_metadata_ctl *meta_ctl;
>> +    struct lpass_sstream_ctl *sstream_ctl;
>> +    struct regmap_field *ch_msb;
>> +    struct regmap_field *ch_lsb;
>> +    struct lpass_hdmitx_dmactl *tx_dmactl;
>> +    int rval;
>> +
>> +    tx_ctl = devm_kzalloc(dev, sizeof(*tx_ctl), GFP_KERNEL);
>> +    if (!tx_ctl)
>> +        return -ENOMEM;
>> +
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->soft_reset, 
>> tx_ctl->soft_reset);
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->force_reset, 
>> tx_ctl->force_reset);
>> +    drvdata->tx_ctl = tx_ctl;
>> +
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->legacy_en, legacy_en);
>> +    drvdata->hdmitx_legacy_en = legacy_en;
>> +
>> +    vbit_ctl = devm_kzalloc(dev, sizeof(*vbit_ctl), GFP_KERNEL);
>> +    if (!vbit_ctl)
>> +        return -ENOMEM;
>> +
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->replace_vbit, 
>> vbit_ctl->replace_vbit);
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->vbit_stream, 
>> vbit_ctl->vbit_stream);
>> +    drvdata->vbit_ctl = vbit_ctl;
>> +
>> +
>> +    QCOM_REGMAP_FIELD_ALLOC(dev, map, v->calc_en, tx_parity);
>> +    drvdata->hdmitx_parity_calc_en = tx_parity;
>> +
>> +    meta_ctl = devm_kzalloc(dev, sizeof(*meta_ctl), GFP_KERNEL);
>> +    if (!meta_ctl)
>> +        return -ENOMEM;
>> +
>> +    rval = devm_regmap_field_bulk_alloc(dev, map, &meta_ctl->mute, 
>> &v->mute, 7);
>> +    if (rval)
>> +        return rval;
>> +    drvdata->meta_ctl = meta_ctl;
>> +
>> +    sstream_ctl = devm_kzalloc(dev, sizeof(*sstream_ctl), GFP_KERNEL);
>> +    if (!sstream_ctl)
>> +        return -ENOMEM;
>> +
>> +    rval = devm_regmap_field_bulk_alloc(dev, map, 
>> &sstream_ctl->sstream_en, &v->sstream_en, 9);
>> +    if (rval)
>> +        return rval;
>> +
>> +    drvdata->sstream_ctl = sstream_ctl;
>> +
>> +    for (i = 0; i < LPASS_MAX_HDMI_DMA_CHANNELS; i++) {
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->msb_bits, ch_msb);
>> +        drvdata->hdmitx_ch_msb[i] = ch_msb;
>> +
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->lsb_bits, ch_lsb);
>> +        drvdata->hdmitx_ch_lsb[i] = ch_lsb;
>> +
>> +        tx_dmactl = devm_kzalloc(dev, sizeof(*tx_dmactl), GFP_KERNEL);
>> +        if (!tx_dmactl)
>> +            return -ENOMEM;
>> +
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->use_hw_chs, 
>> tx_dmactl->use_hw_chs);
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->use_hw_usr, 
>> tx_dmactl->use_hw_usr);
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->hw_chs_sel, 
>> tx_dmactl->hw_chs_sel);
>> +        QCOM_REGMAP_FIELD_ALLOC(dev, map, v->hw_usr_sel, 
>> tx_dmactl->hw_usr_sel);
>> +        drvdata->hdmi_tx_dmactl[i] = tx_dmactl;
>> +    }
>> +    return 0;
>> +}
>
> ]
> This should go into lpass-cpu.c
>
Okay!. Will move to lpass-cpu.c
>
>> +EXPORT_SYMBOL(lpass_hdmi_init_bitfields);
>
>> +
>> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    snd_pcm_format_t format = params_format(params);
>> +    unsigned int rate = params_rate(params);
>> +    unsigned int channels = params_channels(params);
>> +    unsigned int ret;
>> +    unsigned int bitwidth;
>> +    unsigned int word_length;
>> +    unsigned int ch_sts_buf0;
>> +    unsigned int ch_sts_buf1;
>> +    unsigned int data_format;
>> +    unsigned int sampling_freq;
>> +    unsigned int ch = 0;
>> +    struct lpass_dp_metadata_ctl *meta_ctl = drvdata->meta_ctl;
>> +    struct lpass_sstream_ctl *sstream_ctl = drvdata->sstream_ctl;
>> +
>> +    bitwidth = snd_pcm_format_width(format);
>> +    if (bitwidth < 0) {
>> +        dev_err(dai->dev, "%s invalid bit width given : %d\n",
>> +                    __func__, bitwidth);
>> +        return bitwidth;
>> +    }
>> +
>> +    switch (bitwidth) {
>> +    case 16:
>> +        word_length = LPASS_DP_AUDIO_BITWIDTH16;
>> +        break;
>> +    case 24:
>> +        word_length = LPASS_DP_AUDIO_BITWIDTH24;
>> +        break;
>> +    default:
>> +        dev_err(dai->dev, "%s invalid bit width given : %d\n",
>> +                    __func__, bitwidth);
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch (rate) {
>> +    case 32000:
>> +        sampling_freq = LPASS_SAMPLING_FREQ32;
>> +        break;
>> +    case 44100:
>> +        sampling_freq = LPASS_SAMPLING_FREQ44;
>> +        break;
>> +    case 48000:
>> +        sampling_freq = LPASS_SAMPLING_FREQ48;
>> +        break;
>> +    default:
>> +        dev_err(dai->dev, "%s invalid bit width given : %d\n",
>> +                    __func__, bitwidth);
>> +        return -EINVAL;
>> +    }
>> +    data_format = LPASS_DATA_FORMAT_LINEAR;
>> +    ch_sts_buf0 = (((data_format << LPASS_DATA_FORMAT_SHIFT) & 
>> LPASS_DATA_FORMAT_MASK)
>> +                | ((sampling_freq << LPASS_FREQ_BIT_SHIFT) & 
>> LPASS_FREQ_BIT_MASK));
>> +    ch_sts_buf1 = (word_length) & LPASS_WORDLENGTH_MASK;
>> +
>> +    ret = regmap_field_write(drvdata->tx_ctl->soft_reset, 
>> LPASS_TX_CTL_RESET);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->tx_ctl->soft_reset, 
>> LPASS_TX_CTL_CLEAR);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmitx_legacy_en, 
>> LPASS_HDMITX_LEGACY_DISABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmitx_parity_calc_en, 
>> HDMITX_PARITY_CALC_EN);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->vbit_ctl->replace_vbit, 
>> REPLACE_VBIT);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->vbit_ctl->vbit_stream, 
>> LINEAR_PCM_DATA);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmitx_ch_msb[0], ch_sts_buf1);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmitx_ch_lsb[0], ch_sts_buf0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_chs, 
>> HW_MODE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_chs_sel, 
>> SW_MODE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_usr, 
>> HW_MODE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_usr_sel, 
>> SW_MODE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->as_sdp_cc, channels - 1);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->as_sdp_ct, 
>> LPASS_META_DEFAULT_VAL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->aif_db4, 
>> LPASS_META_DEFAULT_VAL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->frequency, sampling_freq);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->mst_index, 
>> LPASS_META_DEFAULT_VAL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(meta_ctl->dptx_index, 
>> LPASS_META_DEFAULT_VAL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->sstream_en, 
>> LPASS_SSTREAM_DISABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->dma_sel, ch);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->auto_bbit_en, 
>> LPASS_SSTREAM_DEFAULT_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->layout, 
>> LPASS_SSTREAM_DEFAULT_DISABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->layout_sp, 
>> LPASS_LAYOUT_SP_DEFAULT);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->dp_audio, 
>> LPASS_SSTREAM_DEFAULT_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->set_sp_on_en, 
>> LPASS_SSTREAM_DEFAULT_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->dp_sp_b_hw_en, 
>> LPASS_SSTREAM_DEFAULT_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(sstream_ctl->dp_staffing_en, 
>> LPASS_SSTREAM_DEFAULT_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return ret;
>> +}
>> +
>> +static int lpass_hdmi_daiops_prepare(struct snd_pcm_substream 
>> *substream,
>> +        struct snd_soc_dai *dai)
>> +{
>> +    int ret;
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    ret = regmap_field_write(drvdata->sstream_ctl->sstream_en, 
>> LPASS_SSTREAM_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(drvdata->meta_ctl->mute, 
>> LPASS_MUTE_DISABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return ret;
>> +}
>> +
>> +static int lpass_hdmi_daiops_trigger(struct snd_pcm_substream 
>> *substream,
>> +        int cmd, struct snd_soc_dai *dai)
>> +{
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_dp_metadata_ctl *meta_ctl = drvdata->meta_ctl;
>> +    struct lpass_sstream_ctl *sstream_ctl = drvdata->sstream_ctl;
>> +    int ret = -EINVAL;
>> +
>> +    switch (cmd) {
>> +    case SNDRV_PCM_TRIGGER_START:
>> +    case SNDRV_PCM_TRIGGER_RESUME:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +        ret = regmap_field_write(sstream_ctl->sstream_en, 
>> LPASS_SSTREAM_ENABLE);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_DISABLE);
>> +        if (ret)
>> +            return ret;
>> +
>> +        break;
>> +    case SNDRV_PCM_TRIGGER_STOP:
>> +    case SNDRV_PCM_TRIGGER_SUSPEND:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +        ret = regmap_field_write(sstream_ctl->sstream_en, 
>> LPASS_SSTREAM_DISABLE);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_ENABLE);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ret = regmap_field_write(sstream_ctl->dp_audio, 0);
>> +        if (ret)
>> +            return ret;
>> +
>> +        break;
>> +    }
>> +    return ret;
>> +}
>> +
>> +const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops = {
>> +    .hw_params    = lpass_hdmi_daiops_hw_params,
>> +    .prepare    = lpass_hdmi_daiops_prepare,
>> +    .trigger    = lpass_hdmi_daiops_trigger,
>> +};
>> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_hdmi_dai_ops);
>> +
>
> [
>
>> +static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int i;
>> +
>> +    if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_DP_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
>> +        return true;
>> +    if (reg == LPASS_HDMITX_APP_IRQCLEAR_REG(v))
>> +        return true;
>> +
>> +    for (i = 0; i < v->hdmi_rdma_channels; i++) {
>> +        if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
>> +            return true;
>> +        if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
>> +            return true;
>> +        if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
>> +            return true;
>> +    }
>> +
>> +    for (i = 0; i < v->rdma_channels; ++i) {
>> +        if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
>> +            return true;
>> +    }
>> +    return false;
>> +}
>> +
>> +static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int i;
>> +
>> +    if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
>> +        return true;
>> +
>> +    for (i = 0; i < v->hdmi_rdma_channels; i++) {
>> +        if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
>> +            return true;
>> +        if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
>> +            return true;
>> +        if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
>> +            return true;
>> +    }
>> +
>> +    if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_DP_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
>> +        return true;
>> +    if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
>> +        return true;
>> +    if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
>> +        return true;
>> +
>> +    for (i = 0; i < v->rdma_channels; ++i) {
>> +        if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
>> +            return true;
>> +        if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int i;
>> +
>> +    if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
>> +        return true;
>> +    if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
>> +        return true;
>> +
>> +    for (i = 0; i < v->rdma_channels; ++i) {
>> +        if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
>> +            return true;
>> +    }
>> +    return false;
>> +}
>> +
>> +struct regmap_config lpass_hdmi_regmap_config = {
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .writeable_reg = lpass_hdmi_regmap_writeable,
>> +    .readable_reg = lpass_hdmi_regmap_readable,
>> +    .volatile_reg = lpass_hdmi_regmap_volatile,
>> +    .cache_type = REGCACHE_FLAT,
>> +};
>
> ]
> This should go into lpass-cpu.c
>
okay! Will move these APIs and struct to lpass-cpu.c.
> look below for the reasons!
>
>
>> +EXPORT_SYMBOL(lpass_hdmi_regmap_config);
>> +
>> +MODULE_DESCRIPTION("QTi LPASS HDMI Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/sound/soc/qcom/lpass-hdmi.h b/sound/soc/qcom/lpass-hdmi.h
>> new file mode 100644
>> index 0000000..93f0057
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-hdmi.h
>> @@ -0,0 +1,106 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>> + *
>> + * lpass_hdmi.h - Definitions for the QTi LPASS HDMI
>> + */
>> +
>> +#ifndef __LPASS_HDMI_H__
>> +#define __LPASS_HDMI_H__
>> +
>> +#include <linux/regmap.h>
>> +
>> +#define LPASS_HDMITX_LEGACY_DISABLE        0x0
>> +#define LPASS_HDMITX_LEGACY_ENABLE        0x1
>> +#define LPASS_DP_AUDIO_BITWIDTH16        0x0
>> +#define LPASS_DP_AUDIO_BITWIDTH24        0xb
>> +#define LPASS_DATA_FORMAT_SHIFT            0x1
>> +#define LPASS_FREQ_BIT_SHIFT            24
>> +#define LPASS_DATA_FORMAT_LINEAR        0x0
>> +#define LPASS_DATA_FORMAT_NON_LINEAR    0x1
>> +#define LPASS_SAMPLING_FREQ32            0x3
>> +#define LPASS_SAMPLING_FREQ44            0x0
>> +#define LPASS_SAMPLING_FREQ48            0x2
>> +#define LPASS_TX_CTL_RESET                0x1
>> +#define LPASS_TX_CTL_CLEAR                0x0
>> +#define LPASS_SSTREAM_ENABLE            1
>> +#define LPASS_SSTREAM_DISABLE            0
>> +#define LPASS_LAYOUT_SP_DEFAULT            0xf
>> +#define LPASS_SSTREAM_DEFAULT_ENABLE    1
>> +#define LPASS_SSTREAM_DEFAULT_DISABLE    0
>> +#define LPASS_MUTE_ENABLE                1
>> +#define LPASS_MUTE_DISABLE                0
>> +#define LPASS_META_DEFAULT_VAL            0
>> +#define HW_MODE                            1
>> +#define SW_MODE                            0
>> +#define LEGACY_LPASS_LPAIF                1
>> +#define LEGACY_LPASS_HDMI                0
>> +#define REPLACE_VBIT                    0x1
>> +#define LINEAR_PCM_DATA                    0x0
>> +#define NON_LINEAR_PCM_DATA                0x1
>> +#define HDMITX_PARITY_CALC_EN            0x1
>> +#define HDMITX_PARITY_CALC_DIS            0x0
>> +#define LPASS_DATA_FORMAT_MASK            GENMASK(1, 1)
>> +#define LPASS_WORDLENGTH_MASK            GENMASK(3, 0)
>> +#define LPASS_FREQ_BIT_MASK                GENMASK(27, 24)
>> +
>> +#define LPASS_HDMI_TX_CTL_ADDR(v) (v->hdmi_tx_ctl_addr)
>> +#define LPASS_HDMI_TX_LEGACY_ADDR(v) (v->hdmi_legacy_addr)
>> +#define LPASS_HDMI_TX_VBIT_CTL_ADDR(v) (v->hdmi_vbit_addr)
>> +#define LPASS_HDMI_TX_PARITY_ADDR(v) (v->hdmi_parity_addr)
>> +#define LPASS_HDMI_TX_DP_ADDR(v)        (v->hdmi_DP_addr)
>> +#define LPASS_HDMI_TX_SSTREAM_ADDR(v) (v->hdmi_sstream_addr)
>> +
>> +#define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
>> +        (v->hdmi_ch_lsb_addr + v->ch_stride * (port))
>> +#define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
>> +        (v->hdmi_ch_msb_addr + v->ch_stride * (port))
>> +#define LPASS_HDMI_TX_DMA_ADDR(v, port) \
>> +        (v->hdmi_dmactl_addr + v->hdmi_dma_stride * (port))
>> +
>> +struct lpass_sstream_ctl {
>> +    struct regmap_field *sstream_en;
>> +    struct regmap_field *dma_sel;
>> +    struct regmap_field *auto_bbit_en;
>> +    struct regmap_field *layout;
>> +    struct regmap_field *layout_sp;
>> +    struct regmap_field *set_sp_on_en;
>> +    struct regmap_field *dp_audio;
>> +    struct regmap_field *dp_staffing_en;
>> +    struct regmap_field *dp_sp_b_hw_en;
>> +};
>> +
>> +struct lpass_dp_metadata_ctl {
>> +    struct regmap_field *mute;
>> +    struct regmap_field *as_sdp_cc;
>> +    struct regmap_field *as_sdp_ct;
>> +    struct regmap_field *aif_db4;
>> +    struct regmap_field *frequency;
>> +    struct regmap_field *mst_index;
>> +    struct regmap_field *dptx_index;
>> +};
>> +
>> +struct lpass_hdmi_tx_ctl {
>> +    struct regmap_field *soft_reset;
>> +    struct regmap_field *force_reset;
>> +};
>> +
>> +struct lpass_hdmitx_dmactl {
>> +    struct regmap_field *use_hw_chs;
>> +    struct regmap_field *use_hw_usr;
>> +    struct regmap_field *hw_chs_sel;Please
>> +    struct regmap_field *hw_usr_sel;
>> +};
>> +
>> +struct lpass_vbit_ctrl {
>> +        struct regmap_field *replace_vbit;
>> +        struct regmap_field *vbit_stream;
>> +};
>> +
>> +extern int lpass_hdmi_init_bitfields(struct device *dev, struct 
>> regmap *map);
>> +extern struct regmap_config lpass_hdmi_regmap_config;
> I have already commented about this in my previous reviews, This is 
> not really going to work on other platforms that do not have HDMI 
> configs enabled.
> You will get "undefined reference" compile error when build for 
> apq8016 or other platforms.
Yeah.. Actually we thought of keeping all HDMI API's in one file. didn't 
think of it's affect. Thanks for pointing out it's impact.
>
> Move these to lpass-cpu.c as that is the only user for these two!
Okay!. We will move it.
>
> Also try to address comments before sending new versions, I see no 
> point in repeating same comments over multiple versions!

Okay!. Actually I have been addressing comments. But few comments after 
reply we encountered some ambiguity.

so is the reason we couldn't fix some comments. will take care next 
time. After verifying changes we will reply on review comments.

>
>> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops;
>> +
>> +
>> +
>> +#endif /* __LPASS_HDMI_H__ */
>> diff --git a/sound/soc/qcom/lpass-ipq806x.c 
>> b/sound/soc/qcom/lpass-ipq806x.c
>> index 72f09b3..832a916 100644
>> --- a/sound/soc/qcom/lpass-ipq806x.c
>> +++ b/sound/soc/qcom/lpass-ipq806x.c
>> @@ -96,7 +96,7 @@ static int ipq806x_lpass_exit(struct 
>> platform_device *pdev)
>>       return 0;
>>   }
>>   -static int ipq806x_lpass_alloc_dma_channel(struct lpass_data 
>> *drvdata, int dir)
>> +static int ipq806x_lpass_alloc_dma_channel(struct lpass_data 
>> *drvdata, int dir, unsigned int dai_id)
>>   {
>>       if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>>           return IPQ806X_LPAIF_RDMA_CHAN_MI2S;
>> @@ -104,7 +104,7 @@ static int ipq806x_lpass_alloc_dma_channel(struct 
>> lpass_data *drvdata, int dir)
>>           return -EINVAL;
>>   }
>>   -static int ipq806x_lpass_free_dma_channel(struct lpass_data 
>> *drvdata, int chan)
>> +static int ipq806x_lpass_free_dma_channel(struct lpass_data 
>> *drvdata, int chan, unsigned int dai_id)
>>   {
>>       return 0;
>>   }
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index db0d959..a5ab5f1 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -80,6 +80,23 @@ static int 
>> lpass_platform_alloc_dmactl_fields(struct device *dev,
>>                           &v->wrdma_intf, 6);
>>   }
>
> ...
>
>
>> @@ -232,16 +296,24 @@ static int 
>> lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>>               regval = LPAIF_DMACTL_WPSCNT_ONE;
>>               break;
>>           case 2:
>> -            regval = LPAIF_DMACTL_WPSCNT_TWO;
>> +            regval = (dai_id == LPASS_DP_RX ?
>> +            LPAIF_DMACTL_WPSCNT_ONE :
>> +            LPAIF_DMACTL_WPSCNT_TWO);
>>               break;
>>           case 4:
>> -            regval = LPAIF_DMACTL_WPSCNT_FOUR;
>> +            regval = (dai_id == LPASS_DP_RX ?
>> +            LPAIF_DMACTL_WPSCNT_TWO :
>> +            LPAIF_DMACTL_WPSCNT_FOUR);
>>               break;
>>           case 6:
>> -            regval = LPAIF_DMACTL_WPSCNT_SIX;
>> +            regval = (dai_id == LPASS_DP_RX ?
>> +            LPAIF_DMACTL_WPSCNT_THREE :
>> +            LPAIF_DMACTL_WPSCNT_SIX);
>>               break;
>>           case 8:
>> -            regval = LPAIF_DMACTL_WPSCNT_EIGHT;
>> +            regval = (dai_id == LPASS_DP_RX ?
>> +            LPAIF_DMACTL_WPSCNT_FOUR :
>> +            LPAIF_DMACTL_WPSCNT_EIGHT);
>>               break;
>>           default:
>>               dev_err(soc_runtime->dev,
>> @@ -251,7 +323,8 @@ static int lpass_platform_pcmops_hw_params(struct 
>> snd_soc_component *component,
>>           }
>>           break;
>>       default:
>> -        dev_err(soc_runtime->dev, "invalid PCM config given: bw=%d, 
>> ch=%u\n",
>> +        dev_err(soc_runtime->dev,
>> +            "invalid PCM config given: bw=%d,ch=%u\n",
>
> unnecessary change!
Okay!. Will revert this change.
>
>
>>               bitwidth, channels);
>>           return -EINVAL;
>>       }
> ...
>
>> +static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>> +{
>> +    struct lpass_data *drvdata = data;
>> +    struct lpass_variant *v = drvdata->variant;
>> +    unsigned int irqs;
>> +    int rv, chan;
>> +
>> +    rv = regmap_read(drvdata->hdmiif_map,
>> +            LPASS_HDMITX_APP_IRQSTAT_REG(v), &irqs);
>> +    if (rv) {
>> +        pr_err("error reading from irqstat reg: %d\n", rv);
>> +        return IRQ_NONE;
>> +    }
>> +
>> +    /* Handle per channel interrupts */
>> +    for (chan = 0; chan < LPASS_MAX_HDMI_DMA_CHANNELS; chan++) {
>> +        if (irqs & (LPAIF_IRQ_ALL(chan) | 
>> LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
>> +                LPAIF_IRQ_HDMI_METADONE |
>> +                LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan))
>> +            && drvdata->hdmi_substream[chan]) {
>> +            rv = lpass_dma_interrupt_handler(
>> +                        drvdata->hdmi_substream[chan],
>> +                        drvdata, chan, irqs);
>> +            if (rv != IRQ_HANDLED)
>> +                return rv;
>> +        }
>> +    }
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +
>
> 2 lines not required!
>
>>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>>                     struct snd_soc_pcm_runtime *soc_runtime)
>>   {
>> @@ -649,6 +880,32 @@ int asoc_qcom_lpass_platform_register(struct 
>> platform_device *pdev)
>>           return ret;
>>       }
>>   +    if (drvdata->hdmi_port_enable) {
>> +        drvdata->hdmiif_irq = platform_get_irq_byname(pdev, 
>> "lpass-irq-hdmi");
>> +        if (drvdata->hdmiif_irq < 0)
>> +            return -ENODEV;
>> +
>> +        ret = devm_request_irq(&pdev->dev, drvdata->hdmiif_irq,
>> +                lpass_platform_hdmiif_irq, 0, "lpass-irq-hdmi", 
>> drvdata);
>> +        if (ret) {
>> +            dev_err(&pdev->dev, "irq hdmi request failed: %d\n", ret);
>> +            return ret;
>> +        }
>> +        ret = regmap_write(drvdata->hdmiif_map,
>> +                LPASS_HDMITX_APP_IRQEN_REG(v), 0);
>> +        if (ret) {
>> +            dev_err(&pdev->dev, "error writing to hdmi irqen reg: 
>> %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        ret = lpass_platform_alloc_hdmidmactl_fields(&pdev->dev,
>> +                             drvdata->hdmiif_map);
>> +        if (ret) {
>> +            dev_err(&pdev->dev,
>> +                "error initializing hdmidmactl fields: %d\n", ret);
>> +            return ret;
>> +        }
>> +    }
>>       return devm_snd_soc_register_component(&pdev->dev,
>>               &lpass_component_driver, NULL, 0);
>>   }
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 7089d4c..2bbb0b9 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2010-2011,2013-2015 The Linux Foundation. All 
>> rights reserved.
>> + * Copyright (c) 2010-2011,2013-2015,2020 The Linux Foundation. All 
>> rights reserved.
>>    *
>>    * lpass.h - Definitions for the QTi LPASS
>>    */
>> @@ -12,10 +12,15 @@
>>   #include <linux/compiler.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>> +#include <dt-bindings/sound/sc7180-lpass.h>
>> +#include "lpass-hdmi.h"
>>     #define LPASS_AHBIX_CLOCK_FREQUENCY        131072000
>>   #define LPASS_MAX_MI2S_PORTS            (8)
>>   #define LPASS_MAX_DMA_CHANNELS            (8)
>> +#define LPASS_MAX_HDMI_DMA_CHANNELS        (4)
>> +
>> +
> no need for two empty lines here!
Okay!. will remove extra lines.
>
>>     struct lpaif_i2sctl {
>>       struct regmap_field *loopback;
>> @@ -37,6 +42,9 @@ struct lpaif_dmactl {
>>       struct regmap_field *fifowm;
>>       struct regmap_field *enable;
>>       struct regmap_field *dyncclk;
>> +    struct regmap_field *burst8;
>> +    struct regmap_field *burst16;
>> +    struct regmap_field *dynburst;
>>   };
>
> thanks,
> srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

