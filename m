Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE684C5410
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 06:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E49921AA1;
	Sat, 26 Feb 2022 06:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E49921AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645855170;
	bh=aN2Q9St2kmUedyuTbcxgsecv+hl8SeufkHaIqrK6aHU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTbr1bwYq7si0U11o5zDTKr0Mvr6+lMBbrJPnfcL62jqBbJgOWazRv6K4sIyaUd+/
	 seuemdU5+7e+zdfCg8iIR2lLzj8WjfPHJunUbAKAXXJ9Ld2OlZGsL9XJPDu9agFGn3
	 tdoiDRzCUiKAa14pLBBqB4mPODqivYGP9I/lVAeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA25F8012B;
	Sat, 26 Feb 2022 06:58:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 597F9F8012B; Sat, 26 Feb 2022 06:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0385EF800E1
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 06:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0385EF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="nyi3/w9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645855099; x=1677391099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AmXUBSuHFySHyrVMXfN8pTiAjw657UhHtMjurHCjX2M=;
 b=nyi3/w9hTc8Z9XMX0Qb74t5srmGL/to6xn92//AFvYsQEaqIohhyRdQt
 gOqETPtJEzF0YMerxE5HEpNx0U6ZNHWGcCadVjw1l+m+UJTUdUFhhPCNS
 2+TpAkyfq6TH7tRMHKFWuinzMsPokYd5tekSs66zNDD5ltVW4tMng7W9i g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Feb 2022 21:58:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 21:58:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 21:58:12 -0800
Received: from [10.216.53.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 25 Feb
 2022 21:58:06 -0800
Message-ID: <6e498021-bf08-3fd8-a3b8-2fcba054f4a0@quicinc.com>
Date: Sat, 26 Feb 2022 11:28:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v16 6/9] ASoC: qcom: Add support for codec dma driver
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1645716828-15305-1-git-send-email-quic_srivasam@quicinc.com>
 <1645716828-15305-7-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53K3Em52tTFK4zmcsf_ZzFbX4uQQ00_uH9=pq44chwyeg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n53K3Em52tTFK4zmcsf_ZzFbX4uQQ00_uH9=pq44chwyeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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


On 2/25/2022 5:10 AM, Stephen Boyd wrote:
Thanks for your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-24 07:33:45)
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 198f27c..b3af971 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -684,6 +953,17 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>                  reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>>                  val = 0;
>>          break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               map = drvdata->rxtx_lpaif_map;
>> +               reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +               val = 0;
>> +       break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               map = drvdata->va_lpaif_map;
>> +               reg = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +               val = 0;
>> +       break;
> These breaks have the wrong indentation.
Okay. will fix it.
>
>>          default:
>>          dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
>>          return -EINVAL;
>> @@ -791,16 +1071,115 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>>                                  return rv;
>>                  }
>>          }
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
>> +{
>> +       struct lpass_data *drvdata = data;
>> +       struct lpass_variant *v = drvdata->variant;
>> +       unsigned int irqs;
>> +       irqreturn_t rv;
>> +       int chan;
>> +
>> +       rv = regmap_read(drvdata->rxtx_lpaif_map,
>> +                       LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>> +
>> +       /* Handle per channel interrupts */
>> +       for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
>> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
>> +                       rv = lpass_dma_interrupt_handler(
>> +                                               drvdata->rxtx_substream[chan],
>> +                                               drvdata, chan, irqs);
>> +                       if (rv != IRQ_HANDLED)
>> +                               return rv;
>> +               }
>> +       }
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
>> +{
>> +       struct lpass_data *drvdata = data;
>> +       struct lpass_variant *v = drvdata->variant;
>> +       unsigned int irqs;
>> +       irqreturn_t rv;
>> +       int chan;
>> +
>> +       rv = regmap_read(drvdata->va_lpaif_map,
>> +                       LPAIF_VA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>>
>> +       /* Handle per channel interrupts */
>> +       for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
>> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
>> +                       rv = lpass_dma_interrupt_handler(
>> +                                               drvdata->va_substream[chan],
>> +                                               drvdata, chan, irqs);
>> +                       if (rv != IRQ_HANDLED)
>> +                               return rv;
>> +               }
>> +       }
>>          return IRQ_HANDLED;
>>   }
>>
>> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
>> +                                                 struct snd_pcm *pcm, int dai_id)
>> +{
>> +       struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>> +       struct snd_pcm_substream *substream;
>> +       struct snd_dma_buffer *buf;
>> +
>> +       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>> +       else
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +
>> +       buf = &substream->dma_buffer;
>> +       buf->dev.dev = pcm->card->dev;
>> +       buf->private_data = NULL;
>> +
>> +       /* Assign Codec DMA buffer pointers */
>> +       buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
>> +
>> +       switch (dai_id) {
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
>> +               break;
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->va_cdc_dma_lpm_buf;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>> +       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WT);
> What's the cast and __force for now? MEMREMAP_WT is almost never used so
Here dma_buffer structure has virtual address(buf->area) of unsigned 
char pointer but memremap returns void pointer.
> this looks wrong. Why can't MEMREMAP_WC be used? But if it's DMA then
Okay. Will update the flag MEMREMAP_WT
> why isn't dma_map_resource() being used?

I am sorry bit confused here. You mean some thing like below.

For Physical address mapping: buf->addr = dma_map_resource(pcm->card->dev, drvdata->va_cdc_dma_lpm_buf,
			     buf->bytes, DMA_BIDIRECTIONAL, 0);
For virtual address mapping. buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WC);

>
>> +
>> +       return 0;
>> +}
>> +
>>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>>                                    struct snd_soc_pcm_runtime *soc_runtime)
>>   {
>>          struct snd_pcm *pcm = soc_runtime->pcm;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +       unsigned int dai_id = cpu_dai->driver->id;
>> +
>>          size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>>
>> +       /*
>> +        * Lpass codec dma can access only lpass lpm hardware memory.
>> +        * ioremap is for HLOS to access hardware memory.
>> +        */
>> +       if (is_cdc_dma_port(dai_id))
>> +               return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
>> +
>>          return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
>>                                              component->dev, size);
>>   :
