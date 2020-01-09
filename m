Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF046135251
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 06:00:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71BA6172E;
	Thu,  9 Jan 2020 05:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71BA6172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578546019;
	bh=qualQkE8m6+p+ybuXoIYKZh4ihh79I6VVgTlvSjS8SY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhcxGSiaKTXMYSO468JK8ENsano0WPDK2Wi/kO6veshFmuuUBl8qli/BgRglR1ylf
	 GMkpGrwtT8pZMl1qi3fasewyBxEiZxD3FLPbzfJJiXVDPls8DpRiCQjsaSyogOUVEv
	 TlctJjm2OIQ8M73FqDbHomXZ5Ehw8yE7cTNOQdhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F79F801EB;
	Thu,  9 Jan 2020 05:58:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC5A4F80101; Thu,  9 Jan 2020 05:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE1FAF80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 05:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE1FAF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ag8nqYeW"
Received: by mail-wm1-x344.google.com with SMTP id p17so1331931wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 08 Jan 2020 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VMi5RKokSD1bSLba837QPSe93h6ZNWDgrRnva2rnDU=;
 b=ag8nqYeWGk2pLTA0jJLgOeLPs6j/8VzJrYnQflUrxpAuHEVC545WyJuOXttmHNsluR
 2ZH1X28E9gpXSqn3YiRnWsqI1l5a4IhoFaMKgH2WI8DjxScbecbQm4qB9TN3Wdi4pXSN
 zOl7Tn/UsEHSTnZEl1pQhc5Swjg1eW7aWK1ayjVqOTck9E8bGRamt65sOZCNXcQaD/53
 IO0RwTVbet55WKsk3d696k0Ite+YoCHee/1AP5OuScjTBQh7c+JKQ5+QgMJuKz/paBD0
 gK5CJ4Biuo94bkQquF3KhJiAdb5aL3zDPDJ4Fve8sdy/x6liyacgigvgwia0FqOrI6yD
 ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VMi5RKokSD1bSLba837QPSe93h6ZNWDgrRnva2rnDU=;
 b=iQdaSPa3f3fdgn+mHqsvGleuqVZxdTvV5gDgYKWCTITyfYctJeTAlnQWZDK4yIlHMP
 eZFCTuFX63ujIymEFO0D37KFSth71qtvHUrUz8ikw8oVR7zD93//j3IdJnih1GJFjh2D
 wu5gVQ6oFYfdMKGVEyWRxGnnd8NpaE2+Uf96c3LVNvVM8TR032QMFwrCSwbdJC+pEryZ
 enuO+WJsoxPs2MABciexODgzAtht2ycxCZe4Cgbh7zJ4hoHNLHQbbWdt0e2W3ZhYRSFG
 4utN+ya7Y86Rf5CgFaCpQGwNE6GjvODPFUExR9LaHoJK2XFv9ZXoTlnzq/pJ5dRC9Fqc
 V9mg==
X-Gm-Message-State: APjAAAXNY45KCD0tyZPLh9d+0ZmueYa2qIXmV2eyE92zyOQIA+MKQeMR
 bLYQYGSpCuhAY97rUOfngEzM29dbicFLwt1SXmg=
X-Google-Smtp-Source: APXvYqwYFA/wMpc6nvrIl61VRVfUPbN3ir93M5LfqjI+X4VbbeKgVjzJrn0QKex0Xjtz1VOP6CJpnivX1VhkTpB4cnc=
X-Received: by 2002:a1c:488a:: with SMTP id v132mr2154030wma.153.1578545906700; 
 Wed, 08 Jan 2020 20:58:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
In-Reply-To: <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 8 Jan 2020 20:58:15 -0800
Message-ID: <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
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

On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> When set the runtime hardware parameters, we may need to query
> the capability of DMA to complete the parameters.
>
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> which need this feature can call this function.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

As a heads up, this patch seems to be causing a regression on the HiKey board.

On boot up I'm seeing:
[   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
f7118000.i2s: -6

And HDMI audio isn't working. With this patch reverted, audio works again.


> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 89a05926ac73..5749a8a49784 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
...
> +       ret = dma_get_slave_caps(chan, &dma_caps);
> +       if (ret == 0) {
> +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> +
> +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +                       addr_widths = dma_caps.dst_addr_widths;
> +               else
> +                       addr_widths = dma_caps.src_addr_widths;
> +       }

It seems a failing ret from dma_get_slave_caps() here is being returned...

> +
> +       /*
> +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> +        * hw.formats set to 0, meaning no restrictions are in place.
> +        * In this case it's the responsibility of the DAI driver to
> +        * provide the supported format information.
> +        */
> +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> +               /*
> +                * Prepare formats mask for valid/allowed sample types. If the
> +                * dma does not have support for the given physical word size,
> +                * it needs to be masked out so user space can not use the
> +                * format which produces corrupted audio.
> +                * In case the dma driver does not implement the slave_caps the
> +                * default assumption is that it supports 1, 2 and 4 bytes
> +                * widths.
> +                */
> +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> +                       int bits = snd_pcm_format_physical_width(i);
> +
> +                       /*
> +                        * Enable only samples with DMA supported physical
> +                        * widths
> +                        */
> +                       switch (bits) {
> +                       case 8:
> +                       case 16:
> +                       case 24:
> +                       case 32:
> +                       case 64:
> +                               if (addr_widths & (1 << (bits / 8)))
> +                                       hw->formats |= pcm_format_to_bits(i);
> +                               break;
> +                       default:
> +                               /* Unsupported types */
> +                               break;
> +                       }
> +               }
> +
> +       return ret;

... down here.

Where as in the old code...

> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 748f5f641002..b9f147eaf7c4 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c

> @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
>         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
>                 hw.info |= SNDRV_PCM_INFO_BATCH;
>
> -       ret = dma_get_slave_caps(chan, &dma_caps);
> -       if (ret == 0) {
> -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> -
> -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -                       addr_widths = dma_caps.dst_addr_widths;
> -               else
> -                       addr_widths = dma_caps.src_addr_widths;
> -       }

...the ret from dma_get_slave_caps()  checked above, but is not
actually returned.

Suggestions on how to sort this out?

thanks
-john
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
