Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A754BAA53
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 20:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF04018CA;
	Thu, 17 Feb 2022 20:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF04018CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645127503;
	bh=qteCh13Hv1agdpEJwI1/QQ5XnvmQsR2+zXkfUV9KZok=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u65drKLr++By3EfSQwMDytzpvvGg1nDsixzVHn8Q6/tovK6W+E2oQ3KwBOfK50Tz4
	 9VNIpn6HDLRFnr9XhLS7edQmukAOpxoSS/xn164B6PYDkgRIkL1mSJ58hFmmEknpc0
	 B3gyZnw8NUN1nwKo4y8r8um+9QlwchQgypQ+YyLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77487F80246;
	Thu, 17 Feb 2022 20:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6EE6F800C0; Thu, 17 Feb 2022 20:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F295CF800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 20:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F295CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PQ/+IxLu"
Received: by mail-oo1-xc35.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so881850oov.3
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eWaEdeMD4Xv456vmrRGc9qq+PbUbRsqsTAjVK+O/A3k=;
 b=PQ/+IxLufKEfZw3+3BxKwa39k5Der0KnGqK9LOeDgyvMzu+9rYUbaXvDW5F2sDCK9i
 rHPE+pmib/x+k9+D9i9Y2t5i4znFUgb3PS9gS6vVcNu/X78T5zEaV8RnW8dYBHe5ADrl
 33JqjY3PS+zvUy8ZV8YPmX2cw56SZNWHf5DW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eWaEdeMD4Xv456vmrRGc9qq+PbUbRsqsTAjVK+O/A3k=;
 b=m1QuuTlFSRZ4MRhzIFGrkrcKgsow/FM5NczLCK1w2FwAryv91rbcBJWXy6VYv0xYHb
 oknDHOZGh02XISifOe4A5UdD9nlPYwZ5/RsKLSJa9zPsHJlLF5JliIO+Q4nQqXXsl9jM
 vsYu+57m81jVBTb3qVekvb5jHLoSFK+m0+A0vD0Bs1Xt9CmptmysmO6FIqyBkrxAX5tS
 kgwRxRd+JZt+IiFooYwrCvqoLEtbaZLjMsswW2vcOvftOGy9AiOtr9XUfXh5gnnUOLLq
 YyN9CLD0rj8O+GJBP9TFrB9JLpEDTRxGfA5SUrZOkDWr6ytizpED6Tf3yV5/55kshjaW
 g1Xw==
X-Gm-Message-State: AOAM531SKSaw/sGY9onaFgQlGGc5kODwCRecoORTqbH+GhR+xEEpe4ZC
 ZqEVUgXSxqaRMPRFNRYV7vz4TJpBqBDn7Jt/HCx2wQ==
X-Google-Smtp-Source: ABdhPJygWUf+9oy/v+5ILtSSdP1c6aKp1Fl/1GiMiljIGiyPEsgSm7xOdBhhbwj67EUli0MEDgFysnA46NQ92dSAXMk=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr1722376oap.54.1645127431001; Thu, 17
 Feb 2022 11:50:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 11:50:30 -0800
MIME-Version: 1.0
In-Reply-To: <0093b56c-95a0-7344-1480-2473f790db90@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n507RB89eoTPGUemdWh4cbcXtWkxKLt_0nCy8xGeJhb1sA@mail.gmail.com>
 <0093b56c-95a0-7344-1480-2473f790db90@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Feb 2022 11:50:30 -0800
Message-ID: <CAE-0n52+r5nN6HC6KQt-Yioh3r+9bgY_V-KA1yQ071-zY7qfEQ@mail.gmail.com>
Subject: Re: [RESEND v13 07/10] ASoC: qcom: Add support for codec dma driver
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

Quoting Srinivasa Rao Mandadapu (2022-02-15 22:53:11)
>
> On 2/15/2022 6:57 AM, Stephen Boyd wrote:
> Thanks for your time and valuable review comments Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:25)
> >> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> >> index 5d77240..12b8d40 100644
> >> --- a/sound/soc/qcom/lpass-platform.c
> >> +++ b/sound/soc/qcom/lpass-platform.c
[...]
> >
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       buf = &substream->dma_buffer;
> >> +       buf->dev.dev = pcm->card->dev;
> >> +       buf->private_data = NULL;
> >> +
> >> +       /* Assign Codec DMA buffer pointers */
> >> +       buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> >> +
> >> +       switch (dai_id) {
> >> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> >> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> >> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
> >> +               break;
> >> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> >> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> >> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> >> +               break;
> >> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> >> +               buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
> >> +               buf->addr = drvdata->va_cdc_dma_lpm_buf;
> >> +               break;
> >> +       default:
> >> +               break;
> >> +       }
> >> +
> >> +       buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
> > Why aren't we using the DMA mapping framework?
> Here, Need to use hardware memory, that is LPASS LPM region for codec DMA.

It does not look like iomem, so the usage of ioremap() is wrong. I
understand that it is some place inside the audio subsystem used to DMA.
ioremap() memory should be accessed through the io accessors,
readl/writel, ioread/iowrite.

> >> @@ -827,6 +1207,31 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
> >>          return regcache_sync(map);
> >>   }
> >>
> >> +static int lpass_platform_copy(struct snd_soc_component *component,
> >> +                              struct snd_pcm_substream *substream, int channel,
> >> +                              unsigned long pos, void __user *buf, unsigned long bytes)
> >> +{
> >> +       struct snd_pcm_runtime *rt = substream->runtime;
> >> +       unsigned int dai_id = component->id;
> >> +       int ret = 0;
> >> +
> >> +       void __iomem *dma_buf = rt->dma_area + pos +
> >> +                               channel * (rt->dma_bytes / rt->channels);
> >> +
> >> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> >> +               if (is_cdc_dma_port(dai_id))
> >> +                       ret = copy_from_user_toio(dma_buf, buf, bytes);
> >> +               else
> >> +                       ret = copy_from_user((void __force *)dma_buf, buf, bytes);
> >> +       } else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> >> +               if (is_cdc_dma_port(dai_id))
> >> +                       ret = copy_to_user_fromio(buf, dma_buf, bytes);
> >> +               else
> >> +                       ret = copy_to_user(buf, (void __force *)dma_buf, bytes);
> > Having __force in here highlights the lack of DMA API usage. I guess
> > there's a sound dma wrapper library in sound/core/memalloc.c? Why can't
> > that be used?
> Didn't see any memcopy wrapper functions in memalloc.c. Could You please
> elaborate or share some example.

Can you add some memcpy wrappers to memalloc.c? Or implement the copy
wrapper you need?

> >
> >> +       }
> >> +
> >> +       return ret;
> >> +}
> >>
> >>   static const struct snd_soc_component_driver lpass_component_driver = {
> >>          .name           = DRV_NAME,
> >> @@ -837,9 +1242,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
> >>          .prepare        = lpass_platform_pcmops_prepare,
> >>          .trigger        = lpass_platform_pcmops_trigger,
> >>          .pointer        = lpass_platform_pcmops_pointer,
> >> +       .mmap           = lpass_platform_pcmops_mmap,
> >>          .pcm_construct  = lpass_platform_pcm_new,
> >>          .suspend                = lpass_platform_pcmops_suspend,
> >>          .resume                 = lpass_platform_pcmops_resume,
> >> +       .copy_user              = lpass_platform_copy,
> >>
> >>   };
> >>
> >> @@ -877,6 +1284,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
> >>                  return ret;
> >>          }
> >>
> >> +       if (drvdata->codec_dma_enable) {
> >> +               ret = regmap_write(drvdata->rxtx_lpaif_map,
> >> +                       LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> >> +               if (ret) {
> >> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> >> +                       return ret;
> >> +               }
> >> +               ret = regmap_write(drvdata->va_lpaif_map,
> >> +                       LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> >> +               if (ret) {
> >> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> >> +                       return ret;
> >> +               }
> >> +               drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
> >> +               if (drvdata->rxtxif_irq < 0)
> >> +                       return -ENODEV;
> >> +
> >> +               ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
> >> +                               lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
> > Drop flags and get it from firmware please.
> Same is followed in existing for other i2s and HDMI interrupts. Could
> You please give some example if it's really matters?

It matters in the case that the hardware team decides to change the pin
to falling. DT already has the flags encoded, so having a zero here
avoids conflicting with what DT has set and also alleviates us from
having to set different flags on different devices. Everyone wins. Look
around for drivers that pass 0 in place of IRQF_TRIGGER_RISING, there
are many examples.
