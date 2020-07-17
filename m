Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9322468A
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jul 2020 01:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5077D1680;
	Sat, 18 Jul 2020 01:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5077D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595027257;
	bh=IHZDK3X014L6OnqIcg3QogBdxT2B/6RnXjnFXRgIQbU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWMdFW49UNEz7yscVYZl6H8MC4ZPA5LmSrZTrsV/RyG+eUmY0tVE2R5PwR/tTxGya
	 /frtnu7jRlWj391riIDdC8JPS8F1g8ACmtItdtqlNtWoXjWbkbn9VxOnWvN9fhIHKW
	 Td/KrxvW7sZGHdqelfVcud1x6ERgofH7C2+Nj+/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70433F8021D;
	Sat, 18 Jul 2020 01:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF60F80217; Sat, 18 Jul 2020 01:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 634E3F8014E
 for <alsa-devel@alsa-project.org>; Sat, 18 Jul 2020 01:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 634E3F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ByVp6Wt5"
Received: by mail-pg1-x543.google.com with SMTP id n5so7353016pgf.7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3H0Vh00IRKzCqaSJWt5u8CYfkWTwsm78qHc8X28mKmc=;
 b=ByVp6Wt5m/FeQUoUFlfMLR1rwwN6YgIRsuPzcRru2QEwKI8UBS5HKM+/CBU8MvUzRs
 UPeOmEMN3veeGhpgplkMswkEmXua57k3BVDoKgiE7m8xEW3aZDmc4Ux+d1dpEzExQjC9
 UoHbdraS05REdNWuylTFdGmd3it5FEmQDw1U4ByNrZubRrTTBcbhHusqn8PF92g8rMM5
 bqwwqwg9ZRG26fTSju4/DKEiVWuPp6o+NNeC6qhpNMrvszg9EukXypLChoUQXB9lCnTo
 ldJuh1boWO2Iud6v7S78gk2mlNUf7Vt1ndFmWmTVRnXlvytOraKnwwEIRGCC4yOkwDrw
 RKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3H0Vh00IRKzCqaSJWt5u8CYfkWTwsm78qHc8X28mKmc=;
 b=bp/UR/A5FIeScF0bELRN1rPf09+9QYdM4l+90DgHQOS6QncumXV5Brx5g40tjy/1mN
 wDn1E/S5x5Nld1rlacIMkq5zepCZ68BM7znyl1xwXGvhWu3Q8KnV6iLp+8Mw2HcsJIn6
 NbosJHsjhkZPm6LfWkcRT0bkRvOMltmwvOvyTAnHgVlrYhFyLky4MS3vHkO9IVStmjfW
 4g3GTfdjX6VTnOMuLlS2XpNDjGz/lXOxBWp1ukH6ZyF8rj27cNWg8gKfEz9AJE6iTEkD
 TGtg+IKuZVzek3adUBNPtPhX3z3xn/yCCEb3AsY1bpfx0IC9PwlJQi67uIxwF2j6pQm4
 o9dg==
X-Gm-Message-State: AOAM532K8vc2btKjNwLXKLEZQEGgcLtjcW247zDJ/H7SsGaIQ0laNpNH
 GrYu860D+VDYQ+zxeDSf16o=
X-Google-Smtp-Source: ABdhPJyKgCSrMLmiluhbf331goesNHl+jb4YRWG/2E7K5OCBCavw+EXkU0fOpqtvaaCAuUheyerpzw==
X-Received: by 2002:a65:60ce:: with SMTP id r14mr10914462pgv.85.1595027140212; 
 Fri, 17 Jul 2020 16:05:40 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id h3sm3724821pjz.23.2020.07.17.16.05.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jul 2020 16:05:39 -0700 (PDT)
Date: Fri, 17 Jul 2020 16:05:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v3 1/1] ASoC: fsl_asrc: make sure the input and output
 clocks are different
Message-ID: <20200717230511.GA8495@Asurada-Nvidia>
References: <20200716232000.GA27246@Asurada-Nvidia>
 <20200717103857.31877-1-arnaud.ferraris@collabora.com>
 <20200717103857.31877-2-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717103857.31877-2-arnaud.ferraris@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, Jul 17, 2020 at 12:38:58PM +0200, Arnaud Ferraris wrote:
> The current clock selection algorithm might select the same clock for
> both input and output when, for instance, the output sample rate is a
> multiple of the input rate.
> 
> In that case, both selectable clocks will be multiples of both the input
> and output sample rates, and therefore the first of these clocks will be
> selected for both input and output, leading to miscalculation of the
> dividers for either the input or output side.
> 
> Example:
>   Input uses clock A (512kHz) and has a sample rate of 8kHz
>   Output uses clock B (1024kHz) and has a sample rate of 16kHz
> 
>   In this case, the algorithm will select clock A for both input and
>   output: the input divider will therefore be calculated properly
>   (512 / 8 => 64), but the output divider's value will be only half
>   the expected value (512 / 16 => 32 instead of 1024 / 16 => 64).
> 
> This patch makes sure it always selects distinct input and output
> clocks.

Please allow me to take some time to review the use case and
the changes. And I'd love to wait for a review from Shengjiu
also, as he introduced this auto-selection function and he's
more familiar with internal ratio mode.

Thanks

> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 02c81d2e34ad..de10c208d3c8 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -608,8 +608,8 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
>  {
>  	struct fsl_asrc_pair_priv *pair_priv = pair->private;
>  	struct asrc_config *config = pair_priv->config;
> -	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> -	int clk_rate, clk_index;
> +	int rate[2], select_clk[2], clk_index[2]; /* Array size 2 means IN and OUT */
> +	int clk_rate;
>  	int i = 0, j = 0;
>  
>  	rate[IN] = in_rate;
> @@ -618,11 +618,15 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
>  	/* Select proper clock source for internal ratio mode */
>  	for (j = 0; j < 2; j++) {
>  		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> -			clk_index = asrc_priv->clk_map[j][i];
> -			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> -			/* Only match a perfect clock source with no remainder */
> +			clk_index[j] = asrc_priv->clk_map[j][i];
> +			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index[j]]);
> +			/*
> +			 * Only match a perfect clock source with no remainder
> +			 * and make sure the input & output clocks are different
> +			 */
>  			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> -			    (clk_rate % rate[j]) == 0)
> +			    (clk_rate % rate[j]) == 0 &&
> +			    (j == 0 || clk_index[j] != clk_index[j - 1]))
>  				break;
>  		}
>  
> -- 
> 2.27.0
> 
