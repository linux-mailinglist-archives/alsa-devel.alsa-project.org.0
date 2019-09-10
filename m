Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28263AE229
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 03:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABEE1662;
	Tue, 10 Sep 2019 03:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABEE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568080476;
	bh=6hZFm+1X2e68/hWvKkDq4SEqxaks9IdGYb5EaYlRcyY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kK4QxEsMQTMPjPLLFurVgq/rPo1hwAxpuqOp0pIAOyl8SMk7o/f2vHR2+pxkaoYLO
	 jjSA0ZIQqOitW9QhWVUpns4mOnajYeKtm8AbXeOnpBrw2nVq4RZpksgvRXjnQxukLc
	 xsN/ryL9kuerMKaeMPPVj6EvvziW3852XX4k/EUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DECA6F800E9;
	Tue, 10 Sep 2019 03:52:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C3B9F80368; Tue, 10 Sep 2019 03:52:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EA39F800E9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 03:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EA39F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="shhRrPrh"
Received: by mail-pl1-x642.google.com with SMTP id k1so7666939pls.11
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qfJzXboXCRBNelkZrAt1/0iVQ/ZKJddQGja1BPXvviM=;
 b=shhRrPrhXyTGuEalYtMpzidF6Xec5xOUTNWtJZ8Aw9uAAWIAQzY+cVEcanTfT+K/7u
 4jPUgRAvrc7wBB/b/a/T25241nVrKuEmf3imAKfhq37779giWrBIH+aQ2Q7z+kpUtbu2
 ZmNynhByaa33d+K8JjQH3AhWwv55nS/MItOSJl0CGlaYtgycsCu7TbykdbDRYCcPcYSZ
 jWkZr1qAh/Y+VAs/oe5HhV4xjc0yKHTifQFFC5CXWW1G1TOS94Kr6fTKVDGgNG49aqJu
 4K3L/z9FH/1pyHqv9gFTjxMSgCna/iMDh99gcUv9dprDXwoaiTO+9AjXWe8XWgUDJCYz
 YdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qfJzXboXCRBNelkZrAt1/0iVQ/ZKJddQGja1BPXvviM=;
 b=FGV4i4Xwcuk93TORyGHPv0QbuQVT9sbB4B3l746UjHYTon52D/yT+fb/UUyIwToR1w
 Tse2ZcDgAgN6lJgfpEPPSbrZ7pmCfFUK8+NoHeTN69X+z7oA2eVqkwugAj5wjIvxp8p1
 555irvd0ZIJ81hNGIZUAT9/xBsdVTXNduS1Ka4LTdmCDcbEF6tnLiO+8Ux6+uT/ASOm6
 cfUABWoCxhXxQJatRWSCp+NS9lBzuA+6h64jc2zjnuEMR9XULhyHXnKwlrhDv8qPnS75
 siPH/MrZPqP6dW3OZK3m3TFacHZSFWNDBsydx7/q7dlvI+tQVlqs35kHF4ZfBbEKDcno
 dDGQ==
X-Gm-Message-State: APjAAAXbqTZaZoAYWBp3Apjv245FBW/XOwDcY5cghlhgG2JAc2izeTtj
 ZKsdQRiLrtiigFWGWmmR4RU=
X-Google-Smtp-Source: APXvYqysAsbMGI3zdULC6/X/imQskDG3HnEoqSyFcHk5MkIVU7u1IpRc4H845OVvdTppQVmg1Rq9Pg==
X-Received: by 2002:a17:902:5c3:: with SMTP id
 f61mr26049403plf.98.1568080359475; 
 Mon, 09 Sep 2019 18:52:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 19sm714031pjc.25.2019.09.09.18.52.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 18:52:39 -0700 (PDT)
Date: Mon, 9 Sep 2019 18:52:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
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

On Mon, Sep 09, 2019 at 06:33:21PM -0400, Shengjiu Wang wrote:
> There is error "aplay: pcm_write:2023: write error: Input/output error"
> on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> 
> In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> sample, but we didn't add any constraint, that cause issues.
> 
> So we need to query the caps of dma, then update the hw parameters
> according to the caps.

> @@ -285,8 +293,81 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> -	snd_pcm_hw_constraint_integer(substream->runtime,
> -				      SNDRV_PCM_HW_PARAM_PERIODS);
> +	ret = snd_pcm_hw_constraint_integer(substream->runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set pcm hw params periods\n");
> +		return ret;
> +	}
> +
> +	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> +
> +	/* Request a temp pair, which is release in the end */
> +	fsl_asrc_request_pair(1, pair);

Not sure if it'd be practical, but a pair request could fail. Will
probably need to check return value.

And a quick feeling is that below code is mostly identical to what
is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
could abstract a helper function somewhere in the ASoC core: Mark?

Thanks
Nicolin

> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "can't get dma channel\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = dma_get_slave_caps(tmp_chan, &dma_caps);
> +	if (ret == 0) {
> +		if (dma_caps.cmd_pause)
> +			snd_imx_hardware.info |= SNDRV_PCM_INFO_PAUSE |
> +						 SNDRV_PCM_INFO_RESUME;
> +		if (dma_caps.residue_granularity <=
> +			DMA_RESIDUE_GRANULARITY_SEGMENT)
> +			snd_imx_hardware.info |= SNDRV_PCM_INFO_BATCH;
> +
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			addr_widths = dma_caps.dst_addr_widths;
> +		else
> +			addr_widths = dma_caps.src_addr_widths;
> +	}
> +
> +	/*
> +	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> +	 * hw.formats set to 0, meaning no restrictions are in place.
> +	 * In this case it's the responsibility of the DAI driver to
> +	 * provide the supported format information.
> +	 */
> +	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> +		/*
> +		 * Prepare formats mask for valid/allowed sample types. If the
> +		 * dma does not have support for the given physical word size,
> +		 * it needs to be masked out so user space can not use the
> +		 * format which produces corrupted audio.
> +		 * In case the dma driver does not implement the slave_caps the
> +		 * default assumption is that it supports 1, 2 and 4 bytes
> +		 * widths.
> +		 */
> +		for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> +			int bits = snd_pcm_format_physical_width(i);
> +
> +			/*
> +			 * Enable only samples with DMA supported physical
> +			 * widths
> +			 */
> +			switch (bits) {
> +			case 8:
> +			case 16:
> +			case 24:
> +			case 32:
> +			case 64:
> +				if (addr_widths & (1 << (bits / 8)))
> +					snd_imx_hardware.formats |= (1LL << i);
> +				break;
> +			default:
> +				/* Unsupported types */
> +				break;
> +			}
> +		}
> +
> +	if (tmp_chan)
> +		dma_release_channel(tmp_chan);
> +	fsl_asrc_release_pair(pair);
> +
>  	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
>  
>  	return 0;
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
