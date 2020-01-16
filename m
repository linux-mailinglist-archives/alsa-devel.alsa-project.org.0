Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADC13D401
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 06:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13C117AD;
	Thu, 16 Jan 2020 06:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13C117AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579154219;
	bh=a7jgdBSVeZUVNKymftoAbihkcLLfEy2TSLzHMehcSjA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ih7CUAekrTAY+0qzG8O6pVAzUDPo8UlnxWCl2woKqzd/7Un3N3i5FxHWnQcFN/nbH
	 Q3CqUMvlUkD/16+vLZYEyhzgkyMCnaT2jla9/NsdyVsqhCmcJlp4Y9oLO8JgBQVISY
	 /dVWPD1taCL7V0jTH3XchHfKsFSyAjYGi7dP9/2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8054F8014E;
	Thu, 16 Jan 2020 06:55:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6353FF8014E; Thu, 16 Jan 2020 06:55:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28DEF800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 06:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28DEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FAPgEX95"
Received: by mail-wr1-x443.google.com with SMTP id c9so17844247wrw.8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 21:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGGRCbRsjloWfYF2cHg3taqwmJTEu8ejz3Fhy/MiNIg=;
 b=FAPgEX95Okm1PYWx+lYdAYkeQZFYdkQpx4INTn3yuTeEPggTIkb+SSmpiN1DrTzTMR
 F8YAzV3LpIE8v/+DzLESZGFiolINqohluQXIo5pP4qfGoAv4WuvIl09MTLyH/FgA1uED
 xrvzH0NNnXsLoP7bi/MMapp889FaW2xsFrvqd9tgZSywMra+//L2O3Mv0Qxb5MadOSHP
 jz223DZjqzt/Nu4ZBN1vXyCUZyN/lHZMeD3lyK1qC5WaiY3J1zUCz+M5X+Kbrc/ZBLL7
 l6i3rSH3TITt2pQsDv9MJNDyHG9uJQQzOv14/uixxkDS9KoFz7btgVg7iRx2X6f/H1vU
 VCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGGRCbRsjloWfYF2cHg3taqwmJTEu8ejz3Fhy/MiNIg=;
 b=WFKkc6k/3AfCHtp4KEQ3u/fx0RbxE8kI3gEE08zdY1vLIW3ndQf2j8GluJpAWfdqrc
 Nu36XhzuQM0jmLpA0B0XI6VB2iBtDg0vLiQtA0ZRauEQ+gIZl0hOkKvNuwo4+lkHjYtw
 g497hGlZOO2V/RUVxFPGuzWxJTBJ7dCvY4Gb/Tl0gZWVEVhgfHOsygC0MS5pM61OObCK
 G0oN/YRfYE2rwxV7nrWkNtK8dyQ9S/3b/Im63AYPcmJhG1vGWuJpIZY9BcuwcETs2oRf
 4kAjRJyHwQoE0uyFljW/hnlwdVLEdlD82jhKadrzpc2WBO9+SpGQ/hYka/dgOZP2QITW
 HgHw==
X-Gm-Message-State: APjAAAXoMMdPTeik5WfQMnnJOF91pzPGcP5NLl+cbXqjuabjtN2mMshb
 inRuiOvwN9VNyMSw0uPpxRO20MOmlMWW3oOkpdI=
X-Google-Smtp-Source: APXvYqygaiL9IxcZBDeOlGW0IjTYd9QUt9aNCyzyH/CPff3tMmmEB2RiYIW6FqMd9/9j6NWJe0bNxet3KikGqZP6xRw=
X-Received: by 2002:adf:d850:: with SMTP id k16mr1193679wrl.96.1579154104574; 
 Wed, 15 Jan 2020 21:55:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
 <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
In-Reply-To: <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 15 Jan 2020 21:54:54 -0800
Message-ID: <CANcMJZCuU_-Xii=YT5Rp5DAyxboptJCrpp51jForuYUpeMuhmQ@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>, nicoleotsuka@gmail.com,
 broonie@kernel.org, festevam@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V6 3/4] ASoC: pcm_dmaengine: Extract
	snd_dmaengine_pcm_refine_runtime_hwparams
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 8, 2020 at 8:58 PM John Stultz <john.stultz@linaro.org> wrote:
> On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > When set the runtime hardware parameters, we may need to query
> > the capability of DMA to complete the parameters.
> >
> > This patch is to Extract this operation from
> > dmaengine_pcm_set_runtime_hwparams function to a separate function
> > snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> > which need this feature can call this function.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> As a heads up, this patch seems to be causing a regression on the HiKey board.
>
> On boot up I'm seeing:
> [   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
> f7118000.i2s: -6
>
> And HDMI audio isn't working. With this patch reverted, audio works again.
>
>
> > diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> > index 89a05926ac73..5749a8a49784 100644
> > --- a/sound/core/pcm_dmaengine.c
> > +++ b/sound/core/pcm_dmaengine.c
> > @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
> ...
> > +       ret = dma_get_slave_caps(chan, &dma_caps);
> > +       if (ret == 0) {
> > +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> > +
> > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > +                       addr_widths = dma_caps.dst_addr_widths;
> > +               else
> > +                       addr_widths = dma_caps.src_addr_widths;
> > +       }
>
> It seems a failing ret from dma_get_slave_caps() here is being returned...
>
> > +
> > +       /*
> > +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> > +        * hw.formats set to 0, meaning no restrictions are in place.
> > +        * In this case it's the responsibility of the DAI driver to
> > +        * provide the supported format information.
> > +        */
> > +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> > +               /*
> > +                * Prepare formats mask for valid/allowed sample types. If the
> > +                * dma does not have support for the given physical word size,
> > +                * it needs to be masked out so user space can not use the
> > +                * format which produces corrupted audio.
> > +                * In case the dma driver does not implement the slave_caps the
> > +                * default assumption is that it supports 1, 2 and 4 bytes
> > +                * widths.
> > +                */
> > +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> > +                       int bits = snd_pcm_format_physical_width(i);
> > +
> > +                       /*
> > +                        * Enable only samples with DMA supported physical
> > +                        * widths
> > +                        */
> > +                       switch (bits) {
> > +                       case 8:
> > +                       case 16:
> > +                       case 24:
> > +                       case 32:
> > +                       case 64:
> > +                               if (addr_widths & (1 << (bits / 8)))
> > +                                       hw->formats |= pcm_format_to_bits(i);
> > +                               break;
> > +                       default:
> > +                               /* Unsupported types */
> > +                               break;
> > +                       }
> > +               }
> > +
> > +       return ret;
>
> ... down here.
>
> Where as in the old code...
>
> > diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> > index 748f5f641002..b9f147eaf7c4 100644
> > --- a/sound/soc/soc-generic-dmaengine-pcm.c
> > +++ b/sound/soc/soc-generic-dmaengine-pcm.c
>
> > @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
> >         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
> >                 hw.info |= SNDRV_PCM_INFO_BATCH;
> >
> > -       ret = dma_get_slave_caps(chan, &dma_caps);
> > -       if (ret == 0) {
> > -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> > -
> > -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > -                       addr_widths = dma_caps.dst_addr_widths;
> > -               else
> > -                       addr_widths = dma_caps.src_addr_widths;
> > -       }
>
> ...the ret from dma_get_slave_caps()  checked above, but is not
> actually returned.
>
> Suggestions on how to sort this out?

Just wanted to check in on this, as I'm still seeing this regression with -rc6.

thanks
-john
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
