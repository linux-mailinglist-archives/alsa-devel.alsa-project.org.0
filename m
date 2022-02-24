Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129264C39D3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 00:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC45192E;
	Fri, 25 Feb 2022 00:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC45192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645746132;
	bh=gPf5X388chsMYIZUfMMKhPpEN0BMPnZ6BGKTOQS6MIM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sMscDGmpeql/3fWSJCwLoSTWLPzU1uEMPOSH06XhnJ8SXudBTcFZ6TTklg4SXmKkw
	 lWD14giDk5NhVKt8cQ9Gw29YXUhLHa3IJJVE8wex5wpYBSNFI9lg/AXByIE+FHWD64
	 9DmYxUlLs+T1cNms1blia5E7X04KpxtV3fsV92jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AAA8F800B6;
	Fri, 25 Feb 2022 00:41:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9766FF800B6; Fri, 25 Feb 2022 00:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE471F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 00:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE471F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oMgM+eo6"
Received: by mail-oi1-x233.google.com with SMTP id 12so5568028oix.12
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 15:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=3fp5mLpKZ3zy5G2P4hCvH5DKhH0aCoOyoqp6jDCbikU=;
 b=oMgM+eo6y7yBLKZtFIGN0z/xAVvy85Du3W+bVaDTEQ7kH7+wttbOMI58cXJtq3G41O
 1HbUb2InAJpF42m2aTi46ts1vn4JHH77930E8gNdZDIWc7oNevFKR8OmCr9CRIIc498l
 n7lVcjKE7QAknoybwZayw5Zqx7dXBNofkKUXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=3fp5mLpKZ3zy5G2P4hCvH5DKhH0aCoOyoqp6jDCbikU=;
 b=Fp2gE4Wu02xfmhxvPTEnh47XNkSsShh3m10phR3YUib8TJ67hcTm6od+J/iUq/ww5H
 nob63i53lPzq+84vsj4kI2AF+m7lmbW27JoITMD+wj8MM3wJrKc92JCaXNmnGhUajDvl
 b+CZXaylVrpEaCm+/JLj35uaDrj7F7gi4KLsEXJlK10Yt1k9977B/4Iq3RhuoQRS6eJy
 yCOMt/jpB12GAvZ2eMZi/6sjObz5FU76UFdPNtLYmWwSXYl3jCY1v54XMBNFA0YlPJRF
 mMPv1lyr3QmqK0QpBJz6Mkcj1AQCl13fW5cL6Nh0bjYmElrNxNkBQWCrOu0jSMi1kGdA
 se7A==
X-Gm-Message-State: AOAM532a1jCCdHx+BF81trSDQI+2Zxwxx8gsp66Cv3M2KrDV7v+Lli8Q
 01sxXDTkll6KxP2UtY4hOBEMSIQ13G4nWB1yyMQv5w==
X-Google-Smtp-Source: ABdhPJwrQs5ORikoc8jsUMv2we/zgkuo7iGssiNXOFNYXobkeXGSbZXD/80AC9Xijdn7PmK1dC4RT/B6HvI+ck/5CdM=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr294198oig.40.1645746057451; Thu, 24 Feb
 2022 15:40:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 15:40:56 -0800
MIME-Version: 1.0
In-Reply-To: <1645716828-15305-7-git-send-email-quic_srivasam@quicinc.com>
References: <1645716828-15305-1-git-send-email-quic_srivasam@quicinc.com>
 <1645716828-15305-7-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Feb 2022 15:40:56 -0800
Message-ID: <CAE-0n53K3Em52tTFK4zmcsf_ZzFbX4uQQ00_uH9=pq44chwyeg@mail.gmail.com>
Subject: Re: [PATCH v16 6/9] ASoC: qcom: Add support for codec dma driver
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2022-02-24 07:33:45)
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 198f27c..b3af971 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -684,6 +953,17 @@ static irqreturn_t lpass_dma_interrupt_handler(
>                 reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>                 val = 0;
>         break;
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               map = drvdata->rxtx_lpaif_map;
> +               reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
> +               val = 0;
> +       break;
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +               map = drvdata->va_lpaif_map;
> +               reg = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
> +               val = 0;
> +       break;

These breaks have the wrong indentation.

>         default:
>         dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
>         return -EINVAL;
> @@ -791,16 +1071,115 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>                                 return rv;
>                 }
>         }
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
> +{
> +       struct lpass_data *drvdata = data;
> +       struct lpass_variant *v = drvdata->variant;
> +       unsigned int irqs;
> +       irqreturn_t rv;
> +       int chan;
> +
> +       rv = regmap_read(drvdata->rxtx_lpaif_map,
> +                       LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
> +
> +       /* Handle per channel interrupts */
> +       for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
> +                       rv = lpass_dma_interrupt_handler(
> +                                               drvdata->rxtx_substream[chan],
> +                                               drvdata, chan, irqs);
> +                       if (rv != IRQ_HANDLED)
> +                               return rv;
> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
> +{
> +       struct lpass_data *drvdata = data;
> +       struct lpass_variant *v = drvdata->variant;
> +       unsigned int irqs;
> +       irqreturn_t rv;
> +       int chan;
> +
> +       rv = regmap_read(drvdata->va_lpaif_map,
> +                       LPAIF_VA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>
> +       /* Handle per channel interrupts */
> +       for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
> +                       rv = lpass_dma_interrupt_handler(
> +                                               drvdata->va_substream[chan],
> +                                               drvdata, chan, irqs);
> +                       if (rv != IRQ_HANDLED)
> +                               return rv;
> +               }
> +       }
>         return IRQ_HANDLED;
>  }
>
> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
> +                                                 struct snd_pcm *pcm, int dai_id)
> +{
> +       struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +       struct snd_pcm_substream *substream;
> +       struct snd_dma_buffer *buf;
> +
> +       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> +               substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
> +       else
> +               substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> +
> +       buf = &substream->dma_buffer;
> +       buf->dev.dev = pcm->card->dev;
> +       buf->private_data = NULL;
> +
> +       /* Assign Codec DMA buffer pointers */
> +       buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> +
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
> +               break;
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +               break;
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +               buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
> +               buf->addr = drvdata->va_cdc_dma_lpm_buf;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WT);

What's the cast and __force for now? MEMREMAP_WT is almost never used so
this looks wrong. Why can't MEMREMAP_WC be used? But if it's DMA then
why isn't dma_map_resource() being used?

> +
> +       return 0;
> +}
> +
>  static int lpass_platform_pcm_new(struct snd_soc_component *component,
>                                   struct snd_soc_pcm_runtime *soc_runtime)
>  {
>         struct snd_pcm *pcm = soc_runtime->pcm;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +       unsigned int dai_id = cpu_dai->driver->id;
> +
>         size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>
> +       /*
> +        * Lpass codec dma can access only lpass lpm hardware memory.
> +        * ioremap is for HLOS to access hardware memory.
> +        */
> +       if (is_cdc_dma_port(dai_id))
> +               return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
> +
>         return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
>                                             component->dev, size);
>  }
