Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB11FC24B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 01:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30794167C;
	Wed, 17 Jun 2020 01:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30794167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592350228;
	bh=kcyxnDyETlB+fkmm2FmIsSrYpXO++2rXZavIo3UEXM0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgLhiDz4g3hLPKCyGTMH28KNsYEX5sWt2hGYMNFRB+ERPWcRpTlhQwF+q9n657zg1
	 NdY79AtL+H5L2jz4zgAuP9EfCWvcO8D1M0qGg+Sm+nxf2AvlsQy/AVy693KgZQyhdd
	 at29YYKymLtB18nlyOgfiZCFEFyaWtcLSLuDS+po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FFFF80232;
	Wed, 17 Jun 2020 01:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22073F8022B; Wed, 17 Jun 2020 01:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C534CF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 01:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C534CF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e6gwvDdV"
Received: by mail-pj1-x1044.google.com with SMTP id ne5so98250pjb.5
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 16:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nokaqO/7ikLY/CaZfj8RUoWXt7iRv0GsTFng8UE3qCw=;
 b=e6gwvDdVsFAYgNKppHkmPneIamMoxYKb+W8s99Afmhxm/8zE417O3gj6Fzg1PDGboS
 xWiqlnxIQTI3upPI0UHHS6mWgN7nJBr01/atAzaO7z4KWBo/iZVWgAfrTHDWt03gc88A
 wmmCNj9DhLunFnQjlyo+OPRItLYaHz/Xn6FWfd5bNfAw6LaYen9/0w0E+B4VY33cLY+8
 P0R4wMuKjyxOZ7IG1XCcDhfPBbCrW7kcpF9Hw6Y4kkUCxW0ybg885R88J2XovyyCGUS4
 2CEApyQqeu7SO77ui569hu6N5IyIbbUvNmkx0ZGgZH8aJ1DeUJOuA0crga3hn7rJHQzl
 Sh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nokaqO/7ikLY/CaZfj8RUoWXt7iRv0GsTFng8UE3qCw=;
 b=b8EPZFxtarZxjK3xNkU3MJNs4sUS91zZj69goL70OZWHIP5ipDwlmkuOzFA3+Jnw9i
 Usl1F3hgrLIlVPG06ZLVDCa5IaSPtFZqoDQvAkJMmAs/Xxax42ADjOEc9z8//2VKBslL
 rt/LGOvS6XNiHpL0IsK6R+dGaSpbc13PQAsfWtdJ05xsT/13wJDRGjfS2me7Audq7Odi
 /xwKYbaSoBpLJdpCSbewaZZBmghzWzYGkKvafvKy/jbuBJPG7IJ+ynHrUeYkgwzLvt6v
 47aBqg4ddeNHVLF2zAblc35iE1aAPBgRpPww8K4J7Tb8NxhjonVP2nkk90hYZYymA8Jv
 d+rQ==
X-Gm-Message-State: AOAM532X2Yzj/Zzqp7h1jmx96ThHloCW106vKaCE5QBUIHijcVkRipIy
 B8SGycLXqAs8XW2k1m1hyug=
X-Google-Smtp-Source: ABdhPJyewwpFThwB7lVfDvCFj438Fo7Ix52QUxyvLW3sT2CUftR5ocnuBGDk+n7WlQXuxAkGZHplNg==
X-Received: by 2002:a17:902:ed14:: with SMTP id
 b20mr4118681pld.173.1592350108783; 
 Tue, 16 Jun 2020 16:28:28 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b1sm3547523pjc.33.2020.06.16.16.28.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 16:28:28 -0700 (PDT)
Date: Tue, 16 Jun 2020 16:28:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
Message-ID: <20200616232810.GA19896@Asurada-Nvidia>
References: <1592289761-29118-1-git-send-email-shengjiu.wang@nxp.com>
 <1592289761-29118-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592289761-29118-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Tue, Jun 16, 2020 at 02:42:41PM +0800, Shengjiu Wang wrote:
> The one difference on imx6sx platform is that the root clock
> is shared with ASRC module, so we add a new flags "ind_root_clk"
> which means the root clock is independent, then we will not
> do the clk_set_rate and clk_round_rate to avoid impact ASRC
> module usage.
> 
> As add a new flags, we include the soc specific data struct.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_spdif.c | 43 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 1b2e516f9162..00e06803d32f 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -42,6 +42,17 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
>  
>  #define DEFAULT_RXCLK_SRC	1
>  
> +/**
> + * struct fsl_spdif_soc_data: soc specific data
> + *
> + * @imx: for imx platform
> + * @ind_root_clk: flag for round clk rate
> + */
> +struct fsl_spdif_soc_data {
> +	bool imx;
> +	bool ind_root_clk;

"ind" doesn't look very straightforward; maybe "shared_root_clock"?

And for its comments:
	* @shared_root_clock: flag of sharing a clock source with others;
	*		      so the driver shouldn't set root clock rate

> +};
> +
>  /*
>   * SPDIF control structure
>   * Defines channel status, subcode and Q sub
> @@ -93,6 +104,7 @@ struct fsl_spdif_priv {
>  	struct snd_soc_dai_driver cpu_dai_drv;
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
> +	const struct fsl_spdif_soc_data *soc;

Looks better if we move it to the top of the list :)

> @@ -421,7 +448,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
>  	sysclk_df = spdif_priv->sysclk_df[rate];
>  
>  	/* Don't mess up the clocks from other modules */
> -	if (clk != STC_TXCLK_SPDIF_ROOT)
> +	if (clk != STC_TXCLK_SPDIF_ROOT || !spdif_priv->soc->ind_root_clk)
>  		goto clk_set_bypass;
>  
>  	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
> @@ -1186,7 +1213,8 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
>  			continue;
>  
>  		ret = fsl_spdif_txclk_caldiv(spdif_priv, clk, savesub, index,
> -					     i == STC_TXCLK_SPDIF_ROOT);
> +					     i == STC_TXCLK_SPDIF_ROOT &&
> +					     spdif_priv->soc->ind_root_clk);

Having more than one place that checks the condition, we can add:

/* Check if clk is a root clock that does not share clock source with others */
static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
{
	return (clk == STC_TXCLK_SPDIF_ROOT) && !spdif->soc->shared_root_clock;
}
