Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBD20D8BA
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 22:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A221655;
	Mon, 29 Jun 2020 22:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A221655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593461408;
	bh=TpA5Lfr5tZC5oqEYlD9p4V2YYLnpt1vtuEp7LCnUbtI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFRf9wKY6pUj5KLVddUOcfn24N6BsXDImWh8IzBNppxNeuD1WzAEeroD9W7teWX+d
	 B19y/S+u6UPwHmW8JOH/BobgCJL5xCfs2iEmzV/h6i5BThNYNIUxYPGCT3KrgvO43f
	 vIYZeKad1scRsU1KZeR3vwPAvVZ3R4D96hAdTiB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48BC1F80256;
	Mon, 29 Jun 2020 22:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80007F80229; Mon, 29 Jun 2020 22:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2295DF80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2295DF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YJBNPwOj"
Received: by mail-pg1-x541.google.com with SMTP id d194so5429941pga.13
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dk9Y/T99sdQ3PfvJ9tzS88PlXk+29r6HaUnDmfo2AIs=;
 b=YJBNPwOj22wBFdvzais+fblphrAroRFtJc3OzQ8RRLvsojoV0C3WM/buNqASfskOyT
 zIA4r/pM0/v3TRqNNZxBpcOJGSD29gOelOc2e9T2RgAxFq53QEMhIdN7zA/nBhWS+qmm
 Y8jRoreByc494Td0CMc5wZbjcCS87hohVxhtz7jj6Ix58a1hsPo6sl3iYvyX9dbReAa9
 GDz4K05C9Dmut4rRqMPkKNiBr6X2XbdHSOnGE6PyNHPDAZA/Ck3K6jAQVo/GgatdQdQ4
 L5D2QyfKR42ohh4zzhShlTZSmIgwd7VHZLY0uwIU2hNP0T3rbqObAKV+bA5s46B8iGbO
 OuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dk9Y/T99sdQ3PfvJ9tzS88PlXk+29r6HaUnDmfo2AIs=;
 b=alnyPPs8G7p+kYJxfbl1o+CeisccByY3RWwyEATxc531smGYRqcUVebN7h4IXdcs8E
 EJlqnvY8XRSRCJ42LlZKfISmzA3vy8Wbp7QJKLahJgPk72JmO4n8zg/cFcTqEFgevnTi
 8oL0Sf56smPzSukEAWtgvcXZg8tZBB6MHZidAO1IDyY+5149al7/uvwV9npxR9TuYciQ
 /yFBQZnceLnlg2zGBophP8Y6LxP38se3g/BRroPF+XfyVKn5gmC4fTPBu5TChRgOygs0
 6I5R6R3bHIPVAhKK7PZv5cNPXLJOnQWANZRPiKfh1QLfhJZtUUD1fAjDoihnpLWwhWvh
 Rdvg==
X-Gm-Message-State: AOAM532ABr+6nUOX7xgMKLTifvglhfiCA0/lLLxbiq4hM/3xoPe0qUl4
 6MBcUfsiAyG6Ob8qg15E/JQ=
X-Google-Smtp-Source: ABdhPJw9k+cyjMxkvZCZ4AoSCBXsw6VLdn1xIUlzJKIwRHnIfMovFVz5gBkCQyh6fguu6A9iRlF4Gg==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr16229603pff.60.1593461326205; 
 Mon, 29 Jun 2020 13:08:46 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id 137sm534234pgg.72.2020.06.29.13.08.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jun 2020 13:08:46 -0700 (PDT)
Date: Mon, 29 Jun 2020 13:08:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
Message-ID: <20200629200813.GB27967@Asurada-Nvidia>
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Jun 29, 2020 at 09:58:35PM +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.
> 
> For internal rato mode, the rate of clock source should be divided
> with no remainder by sample rate, otherwise there is sound
> distortion.
> 
> Add function fsl_asrc_select_clk() to find proper clock source for
> internal ratio mode, if the clock source is available then internal
> ratio mode will be selected.
> 
> With change, the ideal ratio mode is not the only option for user.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

> +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> +			       struct fsl_asrc_pair *pair,
> +			       int in_rate,
> +			       int out_rate)
> +{
> +	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> +	struct asrc_config *config = pair_priv->config;
> +	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> +	int clk_rate, clk_index;
> +	int i = 0, j = 0;
> +	bool clk_sel[2];
> +
> +	rate[0] = in_rate;
> +	rate[1] = out_rate;
> +
> +	/* Select proper clock source for internal ratio mode */
> +	for (j = 0; j < 2; j++) {
> +		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> +			clk_index = asrc_priv->clk_map[j][i];
> +			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);

+			/* Only match a perfect clock source with no remainder */

> +			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> +			    (clk_rate % rate[j]) == 0)
> +				break;
> +		}
> +
> +		if (i == ASRC_CLK_MAP_LEN) {
> +			select_clk[j] = OUTCLK_ASRCK1_CLK;
> +			clk_sel[j] = false;
> +		} else {
> +			select_clk[j] = i;
> +			clk_sel[j] = true;
> +		}
> +	}
> +
> +	/* Switch to ideal ratio mode if there is no proper clock source */
> +	if (!clk_sel[IN] || !clk_sel[OUT])
> +		select_clk[IN] = INCLK_NONE;

Could get rid of clk_set:

	for (j) {
		for (i) {
			if (match)
				break;
		}

		clk[j] = i;
	}

	if (clk[IN] == ASRC_CLK_MAP_LEN || clk[OUT] == ASRC_CLK_MAP_LEN)

And it only overrides clk[IN] setting but leaving clk[OUT] to
to the searching result. This means that clk[OUT] may be using
a clock source other than OUTCLK_ASRCK1_CLK if sel[IN] happens
to be false while sel[OUT] happens to be true. Not sure if it
is intended...but I feel it would probably be safer to use the
previous settings: INCLK_NONE + OUTCLK_ASRCK1_CLK?
