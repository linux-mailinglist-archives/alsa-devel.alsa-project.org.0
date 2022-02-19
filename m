Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFBA4BCA51
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4FEB16AB;
	Sat, 19 Feb 2022 19:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4FEB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645296906;
	bh=vzSe+VkOswKMBCbDmldPEttT7HaZ4Cra5nNhdAMBBa0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFT/Q9SzVgKa6gAn26VX+7zabVFkuMQ3ppQ6Ns5Q4X6FfuV+Lmrp2PK/zKbRoT766
	 o8kPrjPX1f4S2YZITJAlKut26H+ml4pUqDElsr00OcDqTQ5Vs960dIrRDyxhsYwBRK
	 Zy0qz4Rw96Wp0LuAGWf2P0BRUyKo479AzgtlcIwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13791F8016B;
	Sat, 19 Feb 2022 19:54:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AACC4F8016A; Sat, 19 Feb 2022 19:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF799F800EB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF799F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="SAYjnl4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645296837; x=1676832837;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Y5YV2Itkx9DyJ/HeoMay/GiviimYAS6JzkM7IkguDJQ=;
 b=SAYjnl4Chiy946knlHTooEqASX/1a7Z0j45HHM0pPGYZF5LAvAARzz4p
 jD2bpV4WheXBHbOF3kP/3eHV4hcmwUYEMYxjMwMTV8oZKLJrChTM/RL9p
 35drMSzwi2E4jPi/CYmufexp1V1UDG+4DU9+I9J6H+eBZjc2swn8EU/fN 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Feb 2022 10:53:51 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:53:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:53:50 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:53:43 -0800
Message-ID: <770eaacc-26ec-2850-1d6c-6e32230e24bf@quicinc.com>
Date: Sun, 20 Feb 2022 00:23:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RESEND v13 07/10] ASoC: qcom: Add support for codec dma driver
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n507RB89eoTPGUemdWh4cbcXtWkxKLt_0nCy8xGeJhb1sA@mail.gmail.com>
 <0093b56c-95a0-7344-1480-2473f790db90@quicinc.com>
 <CAE-0n52+r5nN6HC6KQt-Yioh3r+9bgY_V-KA1yQ071-zY7qfEQ@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n52+r5nN6HC6KQt-Yioh3r+9bgY_V-KA1yQ071-zY7qfEQ@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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


On 2/18/2022 1:20 AM, Stephen Boyd wrote:
Thanks for your time and valuable comments Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-15 22:53:11)
>> On 2/15/2022 6:57 AM, Stephen Boyd wrote:
>> Thanks for your time and valuable review comments Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:25)
>>>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>>>> index 5d77240..12b8d40 100644
>>>> --- a/sound/soc/qcom/lpass-platform.c
>>>> +++ b/sound/soc/qcom/lpass-platform.c
> [...]
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       buf = &substream->dma_buffer;
>>>> +       buf->dev.dev = pcm->card->dev;
>>>> +       buf->private_data = NULL;
>>>> +
>>>> +       /* Assign Codec DMA buffer pointers */
>>>> +       buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
>>>> +
>>>> +       switch (dai_id) {
>>>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>>>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>>>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
>>>> +               break;
>>>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>>>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>>>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>>>> +               break;
>>>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>>>> +               buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>>>> +               buf->addr = drvdata->va_cdc_dma_lpm_buf;
>>>> +               break;
>>>> +       default:
>>>> +               break;
>>>> +       }
>>>> +
>>>> +       buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
>>> Why aren't we using the DMA mapping framework?
>> Here, Need to use hardware memory, that is LPASS LPM region for codec DMA.
> It does not look like iomem, so the usage of ioremap() is wrong. I
> understand that it is some place inside the audio subsystem used to DMA.
> ioremap() memory should be accessed through the io accessors,
> readl/writel, ioread/iowrite.
Okay. will change it to memremap() and re post it.
>
>>>> @@ -827,6 +1207,31 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>>>>           return regcache_sync(map);
>>>>    }
>>>>
>>>> +static int lpass_platform_copy(struct snd_soc_component *component,
>>>> +                              struct snd_pcm_substream *substream, int channel,
>>>> +                              unsigned long pos, void __user *buf, unsigned long bytes)
>>>> +{
>>>> +       struct snd_pcm_runtime *rt = substream->runtime;
>>>> +       unsigned int dai_id = component->id;
>>>> +       int ret = 0;
>>>> +
>>>> +       void __iomem *dma_buf = rt->dma_area + pos +
>>>> +                               channel * (rt->dma_bytes / rt->channels);
>>>> +
>>>> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>>> +               if (is_cdc_dma_port(dai_id))
>>>> +                       ret = copy_from_user_toio(dma_buf, buf, bytes);
>>>> +               else
>>>> +                       ret = copy_from_user((void __force *)dma_buf, buf, bytes);
>>>> +       } else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>>>> +               if (is_cdc_dma_port(dai_id))
>>>> +                       ret = copy_to_user_fromio(buf, dma_buf, bytes);
>>>> +               else
>>>> +                       ret = copy_to_user(buf, (void __force *)dma_buf, bytes);
>>> Having __force in here highlights the lack of DMA API usage. I guess
>>> there's a sound dma wrapper library in sound/core/memalloc.c? Why can't
>>> that be used?
>> Didn't see any memcopy wrapper functions in memalloc.c. Could You please
>> elaborate or share some example.
> Can you add some memcpy wrappers to memalloc.c? Or implement the copy
> wrapper you need?

Shall we use it as it is for now. If it's really matters, we shall 
update as a fresh patches on top of these patches as a fix,

after this series got accepted. Otherwise because of only this review 
comment, whole series getting blocked.

>
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>>
>>>>    static const struct snd_soc_component_driver lpass_component_driver = {
>>>>           .name           = DRV_NAME,
>>>> @@ -837,9 +1242,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>>>>           .prepare        = lpass_platform_pcmops_prepare,
>>>>           .trigger        = lpass_platform_pcmops_trigger,
>>>>           .pointer        = lpass_platform_pcmops_pointer,
>>>> +       .mmap           = lpass_platform_pcmops_mmap,
>>>>           .pcm_construct  = lpass_platform_pcm_new,
>>>>           .suspend                = lpass_platform_pcmops_suspend,
>>>>           .resume                 = lpass_platform_pcmops_resume,
>>>> +       .copy_user              = lpass_platform_copy,
>>>>
>>>>    };
>>>>
>>>> @@ -877,6 +1284,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>>>                   return ret;
>>>>           }
>>>>
>>>> +       if (drvdata->codec_dma_enable) {
>>>> +               ret = regmap_write(drvdata->rxtx_lpaif_map,
>>>> +                       LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>>>> +               if (ret) {
>>>> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>>>> +                       return ret;
>>>> +               }
>>>> +               ret = regmap_write(drvdata->va_lpaif_map,
>>>> +                       LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>>>> +               if (ret) {
>>>> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>>>> +                       return ret;
>>>> +               }
>>>> +               drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
>>>> +               if (drvdata->rxtxif_irq < 0)
>>>> +                       return -ENODEV;
>>>> +
>>>> +               ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
>>>> +                               lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
>>> Drop flags and get it from firmware please.
>> Same is followed in existing for other i2s and HDMI interrupts. Could
>> You please give some example if it's really matters?
> It matters in the case that the hardware team decides to change the pin
> to falling. DT already has the flags encoded, so having a zero here
> avoids conflicting with what DT has set and also alleviates us from
> having to set different flags on different devices. Everyone wins. Look
> around for drivers that pass 0 in place of IRQF_TRIGGER_RISING, there
> are many examples.
Okay. will replace flag with zero and resend it.
