Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293FDB95F
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 23:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928D11614;
	Thu, 17 Oct 2019 23:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928D11614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571349436;
	bh=ngkSd8YUBte+Jxw5NV6Jz5kFJ7psgdadotCJpBK5lo0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXsaqcbrpyAUZVY/eqB+OIucFQxExOZOe9Azjg20iJJ2bkTvEA6TDv35TSq3w4lwq
	 1DzU+2OOJwG5IFZNyp4HRRI3GPONnvmioQOjTGnjOSCsNlZ5o7J9ECZZKVXfHdl86N
	 ZlBpqYVrEke/aTSt7bfEDPslUeZTuVhW1f4S7JHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91C66F804AA;
	Thu, 17 Oct 2019 23:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3549CF804AA; Thu, 17 Oct 2019 23:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B27F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 23:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B27F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jeyw1ZDd"
Received: by mail-pg1-x544.google.com with SMTP id p12so2118889pgn.6
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 14:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MJq2EdV7BErF5lJZPOikwtBvnPNcMCKE+E09QYJDAoE=;
 b=Jeyw1ZDd5uAKRjJQmfyb+T0v/f6rIVWTceUIwX20g2+Ga6I91WfJuBnTL/DPxTZL5z
 HKJjnkJAncD5XImoBq7AkDzdyK97rJN/7OH0yKTx8fzWkLRU1nyrjtxhEcw8zzso+0U2
 DJNGBkyCFX7HUwCQF+cTvU0l7AsQXoDkoevKLz3/HfKu55M/n9GQXtxQkwzao4e7UJAt
 W44oCFETT+1Hrfn9p/iGgjnkyGZMFObQP/F3nt5x+0IWbC4EIUW38BB7Srk5IZT63tzm
 SCfHVu2649tchRM12hl8UrKMunl00VbS/rcr8+rQayKOIAhfuW3jbPskVlbfAmqjS92i
 ygcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MJq2EdV7BErF5lJZPOikwtBvnPNcMCKE+E09QYJDAoE=;
 b=RM8TQhECs1StOyXCeu7EUhcDZRIeyxxqTFvBZH/23oTSuznDMS4bl7mjt4yv1/JlET
 pU6aMp4ibTu4EKjqtDe5jHfVIol0VWPqUAEGs1XmR5A0t9eRPhStkxIazJ8aXMmoq91p
 QgBKWB9FYQoKmsRGg1aoua2a7hHUEbkKEDKMexAdnziYY836xjSZdJdEfiubbmlNjEUp
 WF0eOfZtCmaiQekEVXYW71kQ2Ll1qrcZq4RLnMzG8NYWlxwZW7cAgnyyRyWk2Byk71mw
 Tvg3enmajcRIEBHRr/K8W47mLG4B2R6AAc4zN+WmVHqlk+AAZBg027DduqZRdbhtmhUt
 mR2g==
X-Gm-Message-State: APjAAAXefF3LgEMJhDFCHDJ8JmfzLnIWGleDEZPDSA8WrWxVNak18yIA
 EkgR4gkDGJpeV+nW8ijRQ5c=
X-Google-Smtp-Source: APXvYqw78bUK9yECzvnmzVx8o9WcY5erYsU7dMfmJka8ZozhZHP1ynlTvAkvFQxYqlruVSaWIpHZTg==
X-Received: by 2002:aa7:93de:: with SMTP id y30mr2552141pff.98.1571349321994; 
 Thu, 17 Oct 2019 14:55:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y8sm3577837pgs.34.2019.10.17.14.55.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 14:55:21 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:54:53 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191017215452.GA19069@Asurada-Nvidia.nvidia.com>
References: <1571293268-5146-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571293268-5146-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_asrc: refine the setting of
 internal clock divider
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

Hello Shengjiu,

On Thu, Oct 17, 2019 at 02:21:08PM +0800, Shengjiu Wang wrote:
> For P2P output, the output divider should align with the output sample

I think we should avoid "P2P" (or "M2M") keyword in the mainline
code as we know M2M will never get merged while somebody working
with the mainline and caring about new feature might be confused.

> rate, if use ideal sample rate, there will be a lot of overload, which
> would cause underrun.

If I understand it correctly, setting to ideal ratio provides a
faster converting speed but increases the load of the processor
of ASRC. So we choose a slower converting speed here since real-
time playback mode doesn't really need a faster conversion?

It makes sense to me, yet I feel that the delay at the beginning
of the audio playback might be longer as a compromise. I am okay
with this decision though...

> The maximum divider of asrc clock is 1024, but there is no judgement
> for this limitaion in driver, which may cause the divider setting not
> correct.
> 
> For non-ideal ratio mode, the clock rate should divide the sample rate
> with no remainder, and the quotient should be less than 1024.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 40 +++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 0bf91a6f54b9..44d05ec28bd3 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -260,7 +260,7 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
>   * of struct asrc_config which includes in/output sample rate, width, channel
>   * and clock settings.
>   */
> -static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
> +static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool p2p)
>  {
>  	struct asrc_config *config = pair->config;
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
> @@ -268,7 +268,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	enum asrc_word_width input_word_width;
>  	enum asrc_word_width output_word_width;
>  	u32 inrate, outrate, indiv, outdiv;
> -	u32 clk_index[2], div[2];
> +	u32 clk_index[2], div[2], rem[2];
> +	u64 clk_rate;
>  	int in, out, channels;
>  	int pre_proc, post_proc;
>  	struct clk *clk;
> @@ -351,7 +352,9 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	/* We only have output clock for ideal ratio mode */
>  	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
>  
> -	div[IN] = clk_get_rate(clk) / inrate;
> +	clk_rate = clk_get_rate(clk);

The fsl_asrc.c file has config.inclk being set to INCLK_NONE and
this sets the "ideal" in this function to true. So, although we
tend to not use ideal ratio setting for p2p cases, yet the input
clock is still not physically connected, so we still use output
clock for div[IN] calculation?

I am thinking something simplier: if we decided not to use ideal
ratio for "P2P", instead of adding "bool p2p" with the confusing
"ideal" in this function, could we just set config.inclk to the
same clock as the output one for "P2P"? By doing so, "P2P" won't
go through ideal ratio mode while still having a clock rate from
the output clock for div[IN] calculation here.

> +	rem[IN] = do_div(clk_rate, inrate);
> +	div[IN] = (u32)clk_rate;
>  	if (div[IN] == 0) {

Could we check div[IN] and rem[IN] here? Like:
  	if (div[IN] == 0 || div[IN] > 1024) {
		pair_err();
		goto out;
	}

	if (!ideal && rem[IN]) {
		pair_err();
		goto out;
	}

According to your commit log, I think the max-1024 limitation
should be applied to all cases, not confined to "!ideal" cases
right? And we should add some comments also, indicating it is
limited by hardware.

>  		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
>  				inrate, clk_index[ideal ? OUT : IN]);
> @@ -360,11 +363,20 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  
>  	clk = asrc_priv->asrck_clk[clk_index[OUT]];
>  
> -	/* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> -	if (ideal)
> -		div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
> -	else
> -		div[OUT] = clk_get_rate(clk) / outrate;
> +	/*
> +	 * When P2P mode, output rate should align with the out samplerate.
> +	 * if set too high output rate, there will be lots of Overload.
> +	 * When M2M mode, output rate should also need to align with the out

For this "should", do you actually mean "M2M could also"? Sorry,
I'm just trying to understand everyting here, not intentionally
being picky at words. My understanding is that we still keep the
ideal ratio setting because "M2M" still uses it.

> +	 * samplerate, but M2M must use less time to achieve good performance.
> +	 */
> +	clk_rate = clk_get_rate(clk);
> +	if (p2p || !ideal) {
> +		rem[OUT] = do_div(clk_rate, outrate);
> +		div[OUT] = clk_rate;
> +	} else {
> +		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
> +		div[OUT] = clk_rate;
> +	}
>  
>  	if (div[OUT] == 0) {
>  		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
> @@ -372,6 +384,16 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  		return -EINVAL;
>  	}
>  
> +	if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 ||
> +		       rem[IN] != 0 || rem[OUT] != 0)) {
> +	if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 || rem[IN] || rem[OUT] != 0)) {

So for ideal == true, these limitaions are not applied any more?
Remember that the "ideal" is true for "p2p == true" cases here.

> +		pair_err("The divider can't be used for non ideal mode\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Divider range is [1, 1024] */
> +	div[IN] = min_t(u32, 1024, div[IN]);
> +	div[OUT] = min_t(u32, 1024, div[OUT]);

Hmm, this looks like we want to allow ideal ratio cases and p2p
cases to operate any way, even if the divider wasn't within the
range to get the in/out rates from the output clock?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
