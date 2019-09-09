Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66DADFC3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 22:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF3F166C;
	Mon,  9 Sep 2019 22:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF3F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568059454;
	bh=YnsdY7IBufMJA+bNqqcBVEs9tvN5PY+e55oeH92s+Ks=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdXJGmZXu9m4lztHQx9fdnbw5EzmnSLSaL9sV7mXDKLYnvvxE7mwkji8zcxUfDQOi
	 bzLnL3CSSd0oUsj/DI9LhX1TxEZIWbzvstZBOQWpHspcr+6wzTOFO6Nva5vhwOGojS
	 mwqki2g3rKl9EJAyu0bMTszlJQ9Xuf9WKxXMTO/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD899F80323;
	Mon,  9 Sep 2019 22:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF2DF80323; Mon,  9 Sep 2019 22:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C97F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 22:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C97F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IrWT20fb"
Received: by mail-pg1-x543.google.com with SMTP id n9so8459792pgc.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xW7EQcr0CjNApYbCMIe6HxKaG8AfbdjFuus/B7ASN4M=;
 b=IrWT20fbQOnXyNKinqp5OPc/kpar1wnCgipwXSgm71GIDrbS2sjQCkbzspksAGbCLH
 4i0o33F7A44k9WtSfCrUbvTAdNcg3yrKovUufCA2dtKvHtVka28le5119zq+0Cv2CIWw
 SwA5UHo9Bu1YXk+jtQsx6EU71AtPmYqSFsiV3rZRmVdSPmwGZOoVtugLG/3yN4Uzq/NH
 F70FnGSjwOeI1SAuHwBy0cn7IF+ly5AHiE6egoYGKDxl/UTvW4OhZrq2uoLTkkHAsbsE
 t/EQefOrA5vf7HPDMVmHT7ohO9JVZk/JS38HeqYsWcb/4D4mGO9/C7EwUDIy1zRNq2KV
 E0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xW7EQcr0CjNApYbCMIe6HxKaG8AfbdjFuus/B7ASN4M=;
 b=j4Or+1i7vH2p7K2no7LL9fL7G7+5mw8tgSMCbXf3BvUal6KbyBgSQ6AFmKIGt7vXmc
 QZ4iZnHC0Ua1KZgES6kiI9lOibzP4O7K9Tuwtq56rEk0/hgFxjKu13ZIGcifMrMKTzfj
 0rEwot9/3fV7zzKDE+ATxPf4qlTd9j2P85n+I2hIX8Pp5dR9aTVlE1/JFl1nrw5oVeQY
 ywUmt1juFVdSUCTq/Rm+3KZOHTxjnh4sZxJ3nc2jO2A43myv4XCo7kApZ5nqAdrtucBT
 Ubxs+weSg0LhoxiqomMBwJGvGFZVbUd5mHjezSCBQ/8gCgSSnkPx3hJQIEZe+5LNEYtc
 WYrQ==
X-Gm-Message-State: APjAAAWnrkdJZe9Kf9yfgsSTAcT8IsC4zL6WUNKW5wJ+KxCIAy530C8s
 5QzcmFXpAXV/ZP1aAB24BeA=
X-Google-Smtp-Source: APXvYqzTkwJBa3F0RxKnqmT5gOH5RbcRfdaf81JN1nzvoeP3MdObNZQOet8DwV8ZjCgD7GTvPLYVBA==
X-Received: by 2002:a63:3c5:: with SMTP id 188mr23042649pgd.394.1568059341642; 
 Mon, 09 Sep 2019 13:02:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id p17sm16111267pff.27.2019.09.09.13.02.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 13:02:21 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:01:57 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format
 instead of in(out)put_word_width
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

On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> snd_pcm_format_t is more formal than enum asrc_word_width, which has
> two property, width and physical width, which is more accurate than
> enum asrc_word_width. So it is better to use in(out)put_format
> instead of in(out)put_word_width.

Hmm...I don't really see the benefit of using snd_pcm_format_t
here...I mean, I know it's a generic one, and would understand
if we use it as a param for a common API. But this patch merely
packs the "width" by intentionally using this snd_pcm_format_t
and then adds another translation to unpack it.. I feel it's a
bit overcomplicated. Or am I missing something?

And I feel it's not necessary to use ALSA common format in our
own "struct asrc_config" since it is more IP/register specific. 

Thanks
Nicolin

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 56 +++++++++++++++++++++++++++-------------
>  sound/soc/fsl/fsl_asrc.h |  4 +--
>  2 files changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index cfa40ef6b1ca..4d3804a1ea55 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -265,6 +265,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	struct asrc_config *config = pair->config;
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
>  	enum asrc_pair_index index = pair->index;
> +	enum asrc_word_width input_word_width;
> +	enum asrc_word_width output_word_width;
>  	u32 inrate, outrate, indiv, outdiv;
>  	u32 clk_index[2], div[2];
>  	int in, out, channels;
> @@ -283,9 +285,32 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  		return -EINVAL;
>  	}
>  
> -	/* Validate output width */
> -	if (config->output_word_width == ASRC_WIDTH_8_BIT) {
> -		pair_err("does not support 8bit width output\n");
> +	switch (snd_pcm_format_width(config->input_format)) {
> +	case 8:
> +		input_word_width = ASRC_WIDTH_8_BIT;
> +		break;
> +	case 16:
> +		input_word_width = ASRC_WIDTH_16_BIT;
> +		break;
> +	case 24:
> +		input_word_width = ASRC_WIDTH_24_BIT;
> +		break;
> +	default:
> +		pair_err("does not support this input format, %d\n",
> +			 config->input_format);
> +		return -EINVAL;
> +	}
> +
> +	switch (snd_pcm_format_width(config->output_format)) {
> +	case 16:
> +		output_word_width = ASRC_WIDTH_16_BIT;
> +		break;
> +	case 24:
> +		output_word_width = ASRC_WIDTH_24_BIT;
> +		break;
> +	default:
> +		pair_err("does not support this output format, %d\n",
> +			 config->output_format);
>  		return -EINVAL;
>  	}
>  
> @@ -383,8 +408,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	/* Implement word_width configurations */
>  	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR1(index),
>  			   ASRMCR1i_OW16_MASK | ASRMCR1i_IWD_MASK,
> -			   ASRMCR1i_OW16(config->output_word_width) |
> -			   ASRMCR1i_IWD(config->input_word_width));
> +			   ASRMCR1i_OW16(output_word_width) |
> +			   ASRMCR1i_IWD(input_word_width));
>  
>  	/* Enable BUFFER STALL */
>  	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
> @@ -497,13 +522,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  				  struct snd_soc_dai *dai)
>  {
>  	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
> -	int width = params_width(params);
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct fsl_asrc_pair *pair = runtime->private_data;
>  	unsigned int channels = params_channels(params);
>  	unsigned int rate = params_rate(params);
>  	struct asrc_config config;
> -	int word_width, ret;
> +	snd_pcm_format_t format;
> +	int ret;
>  
>  	ret = fsl_asrc_request_pair(channels, pair);
>  	if (ret) {
> @@ -513,15 +538,10 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  
>  	pair->config = &config;
>  
> -	if (width == 16)
> -		width = ASRC_WIDTH_16_BIT;
> -	else
> -		width = ASRC_WIDTH_24_BIT;
> -
>  	if (asrc_priv->asrc_width == 16)
> -		word_width = ASRC_WIDTH_16_BIT;
> +		format = SNDRV_PCM_FORMAT_S16_LE;
>  	else
> -		word_width = ASRC_WIDTH_24_BIT;
> +		format = SNDRV_PCM_FORMAT_S24_LE;
>  
>  	config.pair = pair->index;
>  	config.channel_num = channels;
> @@ -529,13 +549,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  	config.outclk = OUTCLK_ASRCK1_CLK;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		config.input_word_width   = width;
> -		config.output_word_width  = word_width;
> +		config.input_format   = params_format(params);
> +		config.output_format  = format;
>  		config.input_sample_rate  = rate;
>  		config.output_sample_rate = asrc_priv->asrc_rate;
>  	} else {
> -		config.input_word_width   = word_width;
> -		config.output_word_width  = width;
> +		config.input_format   = format;
> +		config.output_format  = params_format(params);
>  		config.input_sample_rate  = asrc_priv->asrc_rate;
>  		config.output_sample_rate = rate;
>  	}
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index c60075112570..38af485bdd22 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -342,8 +342,8 @@ struct asrc_config {
>  	unsigned int dma_buffer_size;
>  	unsigned int input_sample_rate;
>  	unsigned int output_sample_rate;
> -	enum asrc_word_width input_word_width;
> -	enum asrc_word_width output_word_width;
> +	snd_pcm_format_t input_format;
> +	snd_pcm_format_t output_format;
>  	enum asrc_inclk inclk;
>  	enum asrc_outclk outclk;
>  };
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
