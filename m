Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CF222EEF
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 01:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CABCD886;
	Fri, 17 Jul 2020 01:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CABCD886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594941740;
	bh=y4+AS+TXeCYxOcxgdK7gKTf2g9ZzYVUIzWjM5LiLnYA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dz4TAc8EHT4Jg8ESPW5ttCcOy8WjsSd7h3aZaiEJUGLa1oLDTIdJp++Ko0gYQcyb+
	 r7marLk6VIIgd08CSNuGMXRshPfczbdhuW6aJCb83vntLHNnI5bQYUHSxMsnLqBjz2
	 VbENHV32ovczIBIP8RqvXwD7XnzFJIxlAEV/2i5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC97FF8014C;
	Fri, 17 Jul 2020 01:20:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B319F801EC; Fri, 17 Jul 2020 01:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC61CF8014C
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC61CF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eHayiyg0"
Received: by mail-pj1-x1041.google.com with SMTP id cm21so5594873pjb.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 16:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rRlvvHVOlssZOjqWIkzRzCMnvlmtUd7Tnvbrt5nzg9E=;
 b=eHayiyg0bfJPU1GbuLYA++YcuhbGdyxqWe29Vgabr+F//AYpjSn5hx+bdQvykpDmsc
 ezsY+2hZn+5I7jW0hkEAVggqN2D1cABrwQQ1q1jdU9obkJLL5ze9Cv5A0xsfXpFZfjqo
 gajcWV9fpnCR9mpdItqaY1+cFqI+OC3yuo9qcpH69Fg1SZS9t8nAJN3ZsRrct2vVjaye
 //CVtLwhW8SMwVwggvOItzEYVUWRWUC28SBV/Bem0hfFp2g20SIgJKyU/VBeVAqn9/8l
 IScUuZSAgaFQypVHjyJ2AYP5k/PTvyLAtyC+ZIy2gLxHfdbl9vspQM3mNujgf4GtaFJH
 lsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rRlvvHVOlssZOjqWIkzRzCMnvlmtUd7Tnvbrt5nzg9E=;
 b=uUFci/DeYYGsmA1hUYhHZgotnvoeUi2YpaykL2B1KdGVwkmv7sWBVE4v5bg3OgYWSW
 qlKB2qs5oyXbStMvtmxq53s1tRhJPFWpDXHarX+0MawwcfEJgYGx7fBs4uNB6WGG0I5V
 ELBmkso8IjRoEt/BTifZS3KQvGteWDvcHBtxqUmyKqtj8pj5aPx8dThS//19lBvJXuHi
 Qmx+0JA2Gx1ljk8xN3KyV7kPMdLVG02aCSZ7iZli8WpvK9uDucRn8+CLsHUs1RVz+GUN
 78F4NXvN5Nnrxgs4UXuQmap7K0C6inKGLmrCBzgcUE3Em98v4ozraAD0Hjd2dEGS5lOF
 wtLw==
X-Gm-Message-State: AOAM5315vOd/lYQO/s6KMMQNubqDVByvsoanLIVj16qzaBtpbG7/IfTF
 ESdhgcZ7WeSD4Qh5tUNg2qs=
X-Google-Smtp-Source: ABdhPJwccEGhJhK3ui84CiJebJJII81e0U4AhifSXr6ZP/zd5rdwyPeQYX8mPtghFCLxzkHPX38VBQ==
X-Received: by 2002:a17:90a:7c4f:: with SMTP id
 e15mr6671510pjl.133.1594941628897; 
 Thu, 16 Jul 2020 16:20:28 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id nk22sm912733pjb.51.2020.07.16.16.20.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Jul 2020 16:20:28 -0700 (PDT)
Date: Thu, 16 Jul 2020 16:20:02 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_asrc: make sure the input and output
 clocks are different
Message-ID: <20200716232000.GA27246@Asurada-Nvidia>
References: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-2-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716151352.193451-2-arnaud.ferraris@collabora.com>
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

On Thu, Jul 16, 2020 at 05:13:52PM +0200, Arnaud Ferraris wrote:
> The current clock selection algorithm might select the same clock for
> both input and output. This can happen when, for instance, the output
> sample rate is a multiple of the input rate.

What's the issue when selecting the same clock source for both
input and output? Please explain it in the commit logs.

> This patch makes sure it always selects distinct input and output
> clocks.
> 
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 02c81d2e34ad..6d43cab6c885 100644
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
> @@ -618,11 +618,12 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
>  	/* Select proper clock source for internal ratio mode */
>  	for (j = 0; j < 2; j++) {
>  		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> -			clk_index = asrc_priv->clk_map[j][i];
> -			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> +			clk_index[j] = asrc_priv->clk_map[j][i];
> +			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index[j]]);
>  			/* Only match a perfect clock source with no remainder */

Better to update the comments here as there's a new condition.

>  			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> -			    (clk_rate % rate[j]) == 0)
> +			    (clk_rate % rate[j]) == 0 &&
> +			    (j == 0 || clk_index[j] != clk_index[j-1]))

clk_index[j - 1]
