Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60591415C2
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2020 05:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE8717D9;
	Sat, 18 Jan 2020 05:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE8717D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579320252;
	bh=gzRqiyXmjdvEqr9JpYGTaUOyPqedqRBMsW6qhJvATIE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7sR/jcqZ4mZBAIHHoFGuO7HUMTogfEJzvjQNyj65lL9lhNy5Z08/AVXcA5AFE/7M
	 Gr1R2IcRGOMjLHAqJIPkgmuHEWPaZHmeIDVm2IaEtfNF4UN9JO3/B+VHvtvB1Sy+CE
	 1M9UXg8PJvQbcxdZW21pwf4zHaUIh1WcDf/LeTi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA9CF8014E;
	Sat, 18 Jan 2020 05:02:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF7A6F8014E; Sat, 18 Jan 2020 05:02:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C876F80126
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 05:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C876F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oJRPpWc8"
Received: by mail-ot1-x341.google.com with SMTP id k14so24379290otn.4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 20:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vb5cyWLJV5ZR0F5iDmlf/8PvEYOZeZfUNSdNGtLvZJI=;
 b=oJRPpWc86aW8ElClMpbeSmGps0a3/zd+opvvpOkEBC8hVNCtjdLp5PzynS4G4c56BU
 3VSWjMLxP2DgfZAY4Ynqq28PxgwynoAx/Ega1iY5vHADe1nx28Ss+oVjWt9i17loT/Tn
 /hJnGFOj25AP5GZ9CftweA9mgLEHxvhOGHMWu4SjXw7OsNretKxT+LYInNxlwjS8R8tX
 Kvx6LsE4imBsm/FB7RCiHcxLA7Gd4WNxHPzi9y/zW+G3PDYWzBmvAJI8YG+Bi4dU8j07
 3cRGWMsJ6Qcd04JnH4bRW0YK5AQHQQcVmjuz3NgVrXoa9eJdOhYIIChJqAExfXq0gD00
 gpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vb5cyWLJV5ZR0F5iDmlf/8PvEYOZeZfUNSdNGtLvZJI=;
 b=ncFXgN2cq0THxIx/Oxc6OVSqPKmYhNDnThtnffGk9a8Z/tyVARvhFVR759ITsrW7pW
 /iaIZIzICva6uq9/x1nqCCvwKFvjLN8iqfBIzHD+VwuAiMxgPQCZVUlj972Ks3f+NjEH
 dMO4dfbTqJmARQkAK85BzHodxIPZBMY5cOhVr0FAg9ztYXreWfJwThxVEnNcdtso5d6Z
 k8WVXPztugJnnQB0XTWKWNBAmuUIwV1zf8UMmk7ELE+8cIbVpFqt7k2PaNNcQ83gKtJi
 Ivv8Jb7tpnbJMPx2w8ayhcmRYZ6q3ZscPF70MPC3RUsVNkKWZQbXWJ4mGC5MDuagXI3z
 apyw==
X-Gm-Message-State: APjAAAUGzcagfg48/SmnyXXcrQ6J7H9YYTm1VZLIr4GDzy8Rmiw/nc2d
 QIn6p3FJzl9mv7wjcBQWKQ0DyfSPW5iM9ZeAume8bQ==
X-Google-Smtp-Source: APXvYqxzZjCff57xw2STewj8hvzXGMNapCy6Befwm57vvCLoE09f+Ii81TVHsJjBeSvPmeIU9AkG5ERsKsyGqT2FA8Q=
X-Received: by 2002:a9d:66ca:: with SMTP id t10mr8495244otm.352.1579320135542; 
 Fri, 17 Jan 2020 20:02:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
 <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
 <CANcMJZCuU_-Xii=YT5Rp5DAyxboptJCrpp51jForuYUpeMuhmQ@mail.gmail.com>
 <CAA+D8AP39bo6EsHvWhVXvAYAho_xMnWmePPAK6dBsOh5wsz48Q@mail.gmail.com>
In-Reply-To: <CAA+D8AP39bo6EsHvWhVXvAYAho_xMnWmePPAK6dBsOh5wsz48Q@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 17 Jan 2020 20:02:04 -0800
Message-ID: <CALAqxLVapiMC-qPX4fza9cPCKFqvoi2KWhZkJa42DiHwOqGe8Q@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
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

On Thu, Jan 16, 2020 at 11:11 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi
>
> On Thu, Jan 16, 2020 at 1:56 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Jan 8, 2020 at 8:58 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > > >
> > > > When set the runtime hardware parameters, we may need to query
> > > > the capability of DMA to complete the parameters.
> > > >
> > > > This patch is to Extract this operation from
> > > > dmaengine_pcm_set_runtime_hwparams function to a separate function
> > > > snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> > > > which need this feature can call this function.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > >
> > > As a heads up, this patch seems to be causing a regression on the HiKey board.
> > >
> > > On boot up I'm seeing:
> > > [   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
> > > f7118000.i2s: -6
> > >
> > > And HDMI audio isn't working. With this patch reverted, audio works again.
> > >
> > >
> > > > diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> > > > index 89a05926ac73..5749a8a49784 100644
> > > > --- a/sound/core/pcm_dmaengine.c
> > > > +++ b/sound/core/pcm_dmaengine.c
> > > > @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
> > > ...
> > > > +       ret = dma_get_slave_caps(chan, &dma_caps);
> > > > +       if (ret == 0) {
> > > > +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > > > +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > > > +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > > > +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> > > > +
> > > > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > > > +                       addr_widths = dma_caps.dst_addr_widths;
> > > > +               else
> > > > +                       addr_widths = dma_caps.src_addr_widths;
> > > > +       }
> > >
> > > It seems a failing ret from dma_get_slave_caps() here is being returned...
> > >
> > > > +
> > > > +       /*
> > > > +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> > > > +        * hw.formats set to 0, meaning no restrictions are in place.
> > > > +        * In this case it's the responsibility of the DAI driver to
> > > > +        * provide the supported format information.
> > > > +        */
> > > > +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> > > > +               /*
> > > > +                * Prepare formats mask for valid/allowed sample types. If the
> > > > +                * dma does not have support for the given physical word size,
> > > > +                * it needs to be masked out so user space can not use the
> > > > +                * format which produces corrupted audio.
> > > > +                * In case the dma driver does not implement the slave_caps the
> > > > +                * default assumption is that it supports 1, 2 and 4 bytes
> > > > +                * widths.
> > > > +                */
> > > > +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> > > > +                       int bits = snd_pcm_format_physical_width(i);
> > > > +
> > > > +                       /*
> > > > +                        * Enable only samples with DMA supported physical
> > > > +                        * widths
> > > > +                        */
> > > > +                       switch (bits) {
> > > > +                       case 8:
> > > > +                       case 16:
> > > > +                       case 24:
> > > > +                       case 32:
> > > > +                       case 64:
> > > > +                               if (addr_widths & (1 << (bits / 8)))
> > > > +                                       hw->formats |= pcm_format_to_bits(i);
> > > > +                               break;
> > > > +                       default:
> > > > +                               /* Unsupported types */
> > > > +                               break;
> > > > +                       }
> > > > +               }
> > > > +
> > > > +       return ret;
> > >
> > > ... down here.
> > >
> > > Where as in the old code...
> > >
> > > > diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> > > > index 748f5f641002..b9f147eaf7c4 100644
> > > > --- a/sound/soc/soc-generic-dmaengine-pcm.c
> > > > +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> > >
> > > > @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
> > > >         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
> > > >                 hw.info |= SNDRV_PCM_INFO_BATCH;
> > > >
> > > > -       ret = dma_get_slave_caps(chan, &dma_caps);
> > > > -       if (ret == 0) {
> > > > -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > > > -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > > > -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > > > -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> > > > -
> > > > -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > > > -                       addr_widths = dma_caps.dst_addr_widths;
> > > > -               else
> > > > -                       addr_widths = dma_caps.src_addr_widths;
> > > > -       }
> > >
> > > ...the ret from dma_get_slave_caps()  checked above, but is not
> > > actually returned.
> > >
> > > Suggestions on how to sort this out?
> >
> > Just wanted to check in on this, as I'm still seeing this regression with -rc6.
> >
> Compare with the old code. it seems that we shouldn't check the return value.
>
> Could you help to test below changes?
>
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -138,12 +138,10 @@ dmaengine_pcm_set_runtime_hwparams(struct
> snd_soc_component *component,
>         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
>                 hw.info |= SNDRV_PCM_INFO_BATCH;
>
> -       ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +       snd_dmaengine_pcm_refine_runtime_hwparams(substream,
>                                                         dma_data,
>                                                         &hw,
>                                                         chan);
> -       if (ret)
> -               return ret;
>
>         return snd_soc_set_runtime_hwparams(substream, &hw);
>  }

Yes, thanks for taking a look at this! Your patch does appear to avoid
the regression.
(Though you'll want to drop the ret declaration to avoid "warning:
unused variable 'ret'" compiler warnings.)

thanks
-john
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
