Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8AB25BE7B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 11:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC6718F6;
	Thu,  3 Sep 2020 11:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC6718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599125537;
	bh=4rVqA/jjR/alLNrB4NZjHtkHXxQ2CQg3KH3712ntXI4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7bvA3S3MMcwwUGqmWxgM3lmYTxRGIaBGMd4BVHFZGfsNuMey01IIC+9Pys3Y538l
	 8CctsdSwakQe84V8qTVeIkUUMGPwIsqNL24lWqTxX3G814ij9adUV1xbSD1Lpj6Biy
	 kwxt2XKvBVGp5Gvt1DJkJA2biP7BxgMk2d00B1aY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58195F8020D;
	Thu,  3 Sep 2020 11:30:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8F2AF80217; Thu,  3 Sep 2020 11:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D61C2F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 11:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61C2F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="nNRBZTN3"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599125427; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V17ZsaD5D2v/6h9zbhOSana048DQtYuDfWpBwCQbkzU=;
 b=nNRBZTN3SATUxCV7VrOPakRjbyiiHRDq/7Jgsru1AsaG9AeVhbkkP5j1GSTxqX54X3ij3HXQ
 PC9uvPzf9C/S9clOPZN1rMoCDyLxagQfOvn1nTYEh+4Kbb4FL0Nzv3rTKqBBurMAMYWJrp+t
 9qMPj+wBBm5T7P6xAwGTbXIHplU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f50b78dcc683673f9024564 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 09:29:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BABAFC433C6; Thu,  3 Sep 2020 09:29:48 +0000 (UTC)
Received: from [10.131.172.121]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 06E20C433C9;
 Thu,  3 Sep 2020 09:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06E20C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <36672d15-78bf-ffe7-71a3-4a7ed8664149@codeaurora.org>
Date: Thu, 3 Sep 2020 14:59:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks Stephen for your time for review!!!

On 9/1/2020 1:06 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:22)
>> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
>> new file mode 100644
>> index 0000000..7e18113
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-hdmi.c
>> @@ -0,0 +1,684 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
> [...]
>> +
>> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
>> +               struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
> [...]
>> +       data_format = LPASS_DATA_FORMAT_LINEAR;
>> +       ch_sts_buf0 = (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPASS_DATA_FORMAT_MASK)
>> +                               | ((sampling_freq << LPASS_FREQ_BIT_SHIFT) & LPASS_FREQ_BIT_MASK));
>> +       ch_sts_buf1 = (word_length) & LPASS_WORDLENGTH_MASK;
>> +
>> +       ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_RESET);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to softreset enable : %d\n",
> All of these strings bloat the kernel image. Can we just return ret
> instead and if something goes wrong we can use a debug patch to figure
> out which register write failed? Would a register write even fail to
> begin with?
Will remove wherever possible.
>
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_CLEAR);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to softreset disable : %d\n",
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = regmap_field_write(drvdata->legacy->legacy_en,
>> +                               LPASS_HDMITX_LEGACY_DISABLE);
>> +       if (ret) {
>> +               dev_err(dai->dev, "%s error writing to legacy_en field : %d\n",
>> +                                       __func__, ret);
>> +               return ret;
>> +       }
>> +
> [...]
>>   #define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
>>   #define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BASE)
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index df692ed..607f4c4 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -553,7 +702,21 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>>   
>>          /* Handle per channel interrupts */
>>          for (chan = 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
>> -               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan]) {
>> +               switch (v->id) {
>> +               case HDMI_INTERFACE:
>> +                       val = LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
>> +                               LPAIF_IRQ_HDMI_METADONE |
>> +                               LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan);
>> +                       break;
>> +               case I2S_INTERFACE:
>> +                       val = 0;
>> +                       break;
>> +               default:
>> +                       pr_err("%s: invalid  %d interface\n", __func__, v->id);
> Any reason we can't use dev_err() here?

It's interrupt handler. Here dev variable is not available.

So we shall remove print as per your previous comment or keep as it is.

>
>> +                       return -EINVAL;
>> +               }
>> +               if (irqs & (LPAIF_IRQ_ALL(chan) | val)
>> +                       && drvdata->substream[chan]) {
>>                          rv = lpass_dma_interrupt_handler(
>>                                                  drvdata->substream[chan],
>>                                                  drvdata, chan, irqs);
>> @@ -644,15 +807,15 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>   
>>          /* ensure audio hardware is disabled */
>>          ret = regmap_write(drvdata->lpaif_map,
>> -                       LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
>> +                       IRQ_EN(v, LPAIF_IRQ_PORT_HOST), 0);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
>>                  return ret;
>>          }
>>   
>>          ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
>> -                       lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
>> -                       "lpass-irq-lpaif", drvdata);
>> +               lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
> Can we use the irq flags from the firmware, i.e. whatever the DT or ACPI
> tables say?
okay.
>
>> +               pdev->name, drvdata);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "irq request failed: %d\n", ret);
>>                  return ret;

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

