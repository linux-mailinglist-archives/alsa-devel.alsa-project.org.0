Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE91A015D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 01:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BECCA15E2;
	Tue,  7 Apr 2020 01:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BECCA15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586214093;
	bh=Bj9C+xbSshSl7KAeO0hMOzk6lRd4t328VURFOxr+C5Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxOILEuTpYhVQXh9Jmd/wpkG6dR6TqcVdYPk3Gi2PUM5DrjP1byaRJInd3V35en9k
	 s5psK4gOX3G7q042tJ6lcN5YM/9ILSdjm4NvUJIXJGhpaYV5pmpTJZVlX8Nfr2HMw8
	 NwzLce/TH5yvBno/C3sG/Ggye2Rkxb2+338wILDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3D1F80121;
	Tue,  7 Apr 2020 00:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C6C8F80143; Tue,  7 Apr 2020 00:59:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74181F80140
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 00:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74181F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N0jnGpAQ"
Received: by mail-pl1-x642.google.com with SMTP id e1so463809plt.9
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QabBQhlHvDhp4mCqAg3c+5phsRTL1odJr+vofj/Jd6U=;
 b=N0jnGpAQZkHqM2qyCjOqgHLclBH0mnCHDoPt2hEx5cT4hQMCCfS7llAe9nHscseUpJ
 M36pwwnl+ap0A9KQ8nuvLFxWLtV9TZRXoNVMF6PLUPb8g90jUoFcpxfghOXwdwslq99v
 DY9sdaA2//pFIAFXL4OXhjlf4fx9Nk2vmjOOX05h4V/vB9WaZPNmHQL7uukQCasVjF9s
 f5Tt7K93PUsZ/BEZaB9B+nydUbQVtYFZAFIaqn92j4FsYNs6UnVHT1qnk8q8+kAYRvI3
 7/dPM94KZRoOcVwKkd0mkF+XEQm3LgglgAgeSeMlUpD/JfZ4P1cDu+b/49TQI5C6QGQB
 vtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QabBQhlHvDhp4mCqAg3c+5phsRTL1odJr+vofj/Jd6U=;
 b=VHCzzu2Xd4u8WKrZbH0TTKgoCuji/yOUEvrKfnGtAhErWahqrZysG3Oo1rbJ6kyJCT
 Z7KyluKKO0zv6K9dcHqCUHUFfyrk+MztJhzsjreYQvj39Lvbi+53yDl9Ha8/SteJFI9m
 Dn1Qk1wkbShbFqBDgJ4aaurpG2R0hXkwt+LdcgGWY8VZ9btzJ+ZZk6V5ZwRJnjg7n+jF
 b/kd95lZ05l4URFdfrTNbFrLyCeI75Ei6VYnrlp4AkC3bMUWyEkRY7gEvp011bI1m/L0
 pt4n6i1kRdJx80DNMbcnCoFVJwnIFPEUpzfFL2xPn9zJLFsXYxmCixUBRYRE75h52EWL
 /BvQ==
X-Gm-Message-State: AGi0PubDq0QLdGBzn4TlxU7dF66L5eBbs0ELNRM0uw+pBOiuK+080mKQ
 QlJ2DlUtxhc/q3HItqfuoXE=
X-Google-Smtp-Source: APiQypJ1B/70Ak3FAawANFmM+3TECFxtBax+d2t7PbnhnVBThvOaaEXHLohLyb1PG3QFqsxDwm3y8A==
X-Received: by 2002:a17:90b:3c4:: with SMTP id
 go4mr1656393pjb.162.1586213985103; 
 Mon, 06 Apr 2020 15:59:45 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 66sm12650177pfb.150.2020.04.06.15.59.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 15:59:44 -0700 (PDT)
Date: Mon, 6 Apr 2020 15:59:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 3/7] ASoC: fsl-asoc-card: Support new property
 fsl,asrc-format
Message-ID: <20200406225949.GB20891@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <b8d6d9322e865f61f0c9cb17c69a399624e07676.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d6d9322e865f61f0c9cb17c69a399624e07676.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
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

On Wed, Apr 01, 2020 at 04:45:36PM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index bb33601fab84..a0f5eb27d61a 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -680,17 +680,20 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  			goto asrc_fail;
>  		}
>  
> -		ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &priv->asrc_format);
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to get output rate\n");
> -			ret = -EINVAL;
> -			goto asrc_fail;
> -		}
> +			/* Fallback to old binding; translate to asrc_format */
> +			ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +			if (ret) {
> +				dev_err(&pdev->dev, "failed to get output width\n");

Should warn 'format' over 'width', since it's preferable.

> +				return ret;

Should goto asrc_fail as we did prior to the change.

And some of lines are over 80 characters.

Let's try this:
		ret = of_property_read_u32(asrc_np, "fsl,asrc-format",
					   &priv->asrc_format);
		if (ret) {
			/* Fallback to old binding; translate to asrc_format */
			ret = of_property_read_u32(asrc_np, "fsl,asrc-width",
						   &width);
			if (ret) {
				dev_err(&pdev->dev,
					"failed to decide output format\n");
				goto asrc_fail;
			}

			if (width == 24)
				priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
			else
				priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
		}
