Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEECAB020
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 03:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C127167E;
	Fri,  6 Sep 2019 03:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C127167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567733438;
	bh=tzKnox6kO4imbVQoyjTUaxcajW2YCbyogHoZ+/sOk/c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbBiR0Pc5sLJ7hfsXNFqBxYN9SeafsbnRS5VlGKxN3tyNwXpzBcV8g81OFqxg+mGv
	 G5wwihrFhLBL+FWno4e+LgQwBczb8PYO/H0/VHeTf9GcrHvAlc/71W1Ntxj2iDYacH
	 cu7lT4xTuJrumQOxcJwRsRC42sOFPBeGX2TpgEvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1D35F80171;
	Fri,  6 Sep 2019 03:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABF59F8049B; Fri,  6 Sep 2019 03:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 315BFF80171
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 03:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315BFF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LLxnr0JE"
Received: by mail-pg1-x544.google.com with SMTP id n9so2509005pgc.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 18:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sEoTtCVr37b7oXmy+gvoKkzJJnuSTqH0meQQ6053Wm4=;
 b=LLxnr0JE4Z4CWrSnhcqlNRIC2d8xEpNueechntqus1WAPdfNrw5vi3KN8zSMRtZ9E7
 aiTRmWCIcAcaTcaXfN4XbZ6EZrXp4zlDDTiWQOjZsQweSHyJzpkHAi+Ao2GvyXunQbN1
 Kk7/QAmX0s5sR0H7znd19wpx1vXZb8JaMW/juvG7WTA9XhpCY3FUMDvzizXjkmq0kPuc
 Hkpd7MNdtnidTUxu9nttF4wZB3fIbKAqGk2eKY47VYtYOwXkiM+vPA3kglKUjcDWiM2j
 mw7Iy+MOWOwIGrpmJGXgafZE/6w+xV2uwWRS4azhU2JRux5BwJd4zwmAgpdydGabvwbq
 1u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sEoTtCVr37b7oXmy+gvoKkzJJnuSTqH0meQQ6053Wm4=;
 b=lQfficg3CqtqmdJj1vTOLFrLf7tFvQx726rIBNDbrnjCiqa6mQ4YsoF/h85OC2Srr6
 VMa74nUe1S2CwKWAn4sJQ3elHS3m4jtB9jQ4/EfKekMyjcm8ANFPzHKXqLZE6kTHxbbC
 UG05XaJ2lBA1eU4XdJCvrigLuYegsQmwSAdB0Ue44LncOCcioZZw/s1uy926v6fpiz5R
 8EnDYcwVhMhboFYmS2eU540/ZBC2TGWEig1Bs1aG++lwOC7/RF1eIQXD7zH6CJk5sPN7
 pcfcqjzudJ6UMsOR4ejGbPvjHNSVdY5Z3p5LdkteDPpPqiDoGxTqyPahVJ0NB+xuf0a2
 rAzA==
X-Gm-Message-State: APjAAAVERjGL8X0FtAs15iqlZAsX9wurXD4rJHDr80xMekrs3enjZpUR
 O5tNitMJdoTsX2tLcgaZWSZuOvFq
X-Google-Smtp-Source: APXvYqw34ECxlJhxS5GuecE+kJ5qkdhUN9hFocOlgPUycAu8bVz6ItjUepFxEW3gN0sCDl/W01/hOA==
X-Received: by 2002:a17:90a:3acf:: with SMTP id
 b73mr6434716pjc.88.1567733373322; 
 Thu, 05 Sep 2019 18:29:33 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f188sm3327847pfa.170.2019.09.05.18.29.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Sep 2019 18:29:32 -0700 (PDT)
Date: Thu, 5 Sep 2019 18:29:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190906012938.GB17926@Asurada-Nvidia.nvidia.com>
References: <20190830215910.31590-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830215910.31590-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Implement set_bclk_ratio
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

On Sat, Aug 31, 2019 at 12:59:10AM +0300, Daniel Baluta wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> This is to allow machine drivers to set a certain bitclk rate
> which might not be exactly rate * frame size.

Just a quick thought of mine: slot_width and slots could be
set via set_dai_tdm_slot() actually, while set_bclk_ratio()
would override that one with your change. I'm not sure which
one could be more important...so would you mind elaborating
your use case?

Thanks
Nicolin


> 
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 21 +++++++++++++++++++--
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index fe126029f4e3..e896b577b1f7 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -137,6 +137,16 @@ static int fsl_sai_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
>  	return 0;
>  }
>  
> +static int fsl_sai_set_dai_bclk_ratio(struct snd_soc_dai *dai,
> +				      unsigned int ratio)
> +{
> +	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
> +
> +	sai->bclk_ratio = ratio;
> +
> +	return 0;
> +}
> +
>  static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
>  		int clk_id, unsigned int freq, int fsl_dir)
>  {
> @@ -423,8 +433,14 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  		slot_width = sai->slot_width;
>  
>  	if (!sai->is_slave_mode) {
> -		ret = fsl_sai_set_bclk(cpu_dai, tx,
> -				slots * slot_width * params_rate(params));
> +		if (sai->bclk_ratio)
> +			ret = fsl_sai_set_bclk(cpu_dai, tx,
> +					       sai->bclk_ratio *
> +					       params_rate(params));
> +		else
> +			ret = fsl_sai_set_bclk(cpu_dai, tx,
> +					       slots * slot_width *
> +					       params_rate(params));
>  		if (ret)
>  			return ret;
>  
> @@ -640,6 +656,7 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
>  }
>  
>  static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
> +	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
>  	.set_sysclk	= fsl_sai_set_dai_sysclk,
>  	.set_fmt	= fsl_sai_set_dai_fmt,
>  	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 3a3f6f8e5595..f96f8d97489d 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -177,6 +177,7 @@ struct fsl_sai {
>  	unsigned int mclk_streams;
>  	unsigned int slots;
>  	unsigned int slot_width;
> +	unsigned int bclk_ratio;
>  
>  	const struct fsl_sai_soc_data *soc_data;
>  	struct snd_dmaengine_dai_dma_data dma_params_rx;
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
