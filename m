Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62789B16CF
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 01:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65081679;
	Fri, 13 Sep 2019 01:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65081679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568332607;
	bh=UeqUOsv9Ib5qWhtovGAx0O4wP/izWztUWYveyAYvY/Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3NQwjwDoURjZbIyYiCehn7WIIODC3MdNHkrGmgkdDneI9mPjjKCFQ1JUeUzRTgx2
	 8WMFZQgHNNh+FiEL05O6ElRRzUE/2BczTZu3p3biHR3gsUZNkCO+b8wEm1tfBsM9RE
	 RuyCt4Ainc1S7Or1+n1VzoJ9yvXE0LEqULFriMns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E520F80444;
	Fri, 13 Sep 2019 01:55:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BCC3F8036F; Fri, 13 Sep 2019 01:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39EDEF80143
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 01:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EDEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KGMLqA+9"
Received: by mail-pf1-x441.google.com with SMTP id b13so16928077pfo.8
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T7BSUypNwre1fAFwesmjDN9junQB0DZurUQ7dcfihpM=;
 b=KGMLqA+9S193uykKYP1g338SZWE6VX2GBpIzq0AkInh392UupWvTerKl+5SlUdyTzz
 XwOJLT2M0xyMpTXXdAzTKpgqDKSmkzD67ZrQ3LiAg4yc7HfBaw/fky0gLGdxJqDG72Q1
 fR4iWcxFtGyBpGpw7t/gFBFB0S3JrCq4j+06fT58EFEU9okyUNCQwDAPNr3+YoWBsfz1
 SyHz4g3mxIoEIOZIZDgQrEIlbJoSxEV3iZfe0GZQn4HncFDnRhepSLHN6xs2ogB5hdaO
 3nCtNZnSDfVSWBTvaj8NWO5d9iQdxZwki1KLVo4TfkAQD2VBCQ+zTBT9043nV4na3/Tu
 /uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T7BSUypNwre1fAFwesmjDN9junQB0DZurUQ7dcfihpM=;
 b=T+C+n+JtwfKA9Wp2d7/bmOieV64zEdeINDqNkDldS9Kko4OazxTMCVLdNWdYK+20tw
 5+5HULzZ5w2FVNj6WDxbvM/lahclDyPGHclAYKTjperytL3OqHtEyn9pTzzc7yqtHaFF
 2/jtCkyifQydJgz1HQxrS+URsSVgBCZeeL3RDxzc9VVfjOHFN6Rm3vEKK3cnmAh14ilv
 qNzOZrDdsjU2hIpl4DFZn86uV4oBDM18cNite+A5UcaJai9CBHmmb3I+VMiZhbVzYRNr
 KSjqQrejjwPSn5qyXiHwKiHjXJZKZNgmgRAr/9dOPApaIaCR7s+NPmSzgOLLKUakOM1q
 lPoA==
X-Gm-Message-State: APjAAAUt2Sm3OVKu29YlwM37gXfVr5lLREtg6J5GTb1HSmxuK94qPsqK
 pc0+IlBBLSy/f4SQ597CZcQ=
X-Google-Smtp-Source: APXvYqxd3HfuYstwynQJibP1ASKMlPK6lONo6c3uSBbgYJAkuEQve5IJTEE5AetFeHQiNVnFYyMTrQ==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
 o101mr1548500pjo.71.1568332513966; 
 Thu, 12 Sep 2019 16:55:13 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id j128sm35672488pfg.51.2019.09.12.16.55.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:55:13 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:54:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190912235451.GF24937@Asurada-Nvidia.nvidia.com>
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
> 
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

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
