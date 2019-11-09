Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5965F5D18
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 03:49:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4448F1674;
	Sat,  9 Nov 2019 03:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4448F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573267756;
	bh=a+ZEOa9/CHKTG9DXikLYusGq7HlSSVYELgftdsSrU0U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgnTPWVw0XcW3HDe2coESOJGy/lZRMQ28r554DuBEzNlvGBef+kFyonzq96C3QX1x
	 5PhGEKBZuaNa7f1YN0E2N+bo7TJVlcvsxdFuaOXP7fwEkZ79vxBxgYu+KvdM0I+mJe
	 DGmIOZcgM82E0a4paC9IBWwd0W2HlIZq1JSASdNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 746B1F8049B;
	Sat,  9 Nov 2019 03:47:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC29F8049B; Sat,  9 Nov 2019 03:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5346FF800EA
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 03:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5346FF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BHLDbjp2"
Received: by mail-pf1-x441.google.com with SMTP id s5so6357246pfh.9
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 18:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cq4ckbPSNxVgpRvUOo2jxu08YcSsyOPv7EiFLNFV+wY=;
 b=BHLDbjp2/rjicvCl9Y6Pk/ehYvuXqPBXedtlwLQJ6829OC8HZwQ967is0orJ2YDroL
 HldAwgVrojmuko3zckLESNvoKOwgmP/HsWZVX7T8/ZDhtHij+BgfUJXCM1gWHTjxToas
 f8Xsbu71sf7NSixiLXUTZ2/i/1NCF61PFr8DOI91U8Mri732IefQkVCYXJLhovCFTgvM
 XL+kC0wSm1LX0crJx6yNQNTUDsqh3Y4zycOSS5BVxpjzVPLyaxqztoc/U6kaoiv8upxP
 aGNVu4M6PMMFMA41rZKciCsvXqgN90bXWvHb7lUfm7xPfMGJJGNqdi/zhgqfhaFxN/v1
 GfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cq4ckbPSNxVgpRvUOo2jxu08YcSsyOPv7EiFLNFV+wY=;
 b=rTgmg8HwLhPxZPgmru3lcJxvanhQAf2s2D2WX+gUTa5WMxs3fMNuaM2wdYruOz1IrI
 4MVIF1r3buGF4f2wh1yWVu0boOYTwHLkgRdOnC0tjgUgsmo/yOU2UBNpJZA9pFqDdGUd
 rZWWK8Xn5fGlUHqnC895zYllMtvfndKCOIpqjEL6ayyBY14nj9t2JdOHHvXAg8TUjQhP
 1u4ahhD3Ctr/4JzJ5cuBWVWbBHj/nfa4mgxRZtEC/WmZstBHVVa7mxJY06U4DB/jMYt8
 s2gftvtsdvIgPbnwZfNOmTQyRqD5cpOhxPm8J5EvnL9+zpnkht/iyXXKSK80xqDxucHB
 foYw==
X-Gm-Message-State: APjAAAUXroylkssNu7+eeRJKC+xpSGV6f40cus/Qr9M/wUdJNyfQSOIw
 3jjZNEKWjofEwZaNmCbD73E=
X-Google-Smtp-Source: APXvYqzOaurDRWYu9ke1kM+bB+a8DNEavcWgckpha8tyYpW7pnfmEP7gMnK3Q1hF+tuDBY5QVGIRDA==
X-Received: by 2002:a63:644:: with SMTP id 65mr7421600pgg.306.1573267629257;
 Fri, 08 Nov 2019 18:47:09 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r184sm8643749pfc.106.2019.11.08.18.47.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Nov 2019 18:47:09 -0800 (PST)
Date: Fri, 8 Nov 2019 18:45:02 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
	tdms
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

On Wed, Nov 06, 2019 at 03:27:45PM +0800, Shengjiu Wang wrote:
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
> 
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.

Feels like a bug fix to me, so  might be better to have a "Fixes"
line and CC stable tree?

Anyway, change looks good to me:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  				  struct snd_soc_dai *dai)
>  {
>  	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +	unsigned long lock_flags;
>  
>  	/* Capture stream shall not be handled */
>  	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		spin_lock_irqsave(&priv->lock, lock_flags);
>  		priv->tdms |= BIT(dai->driver->id);
> +		spin_unlock_irqrestore(&priv->lock, lock_flags);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		spin_lock_irqsave(&priv->lock, lock_flags);
>  		priv->tdms &= ~BIT(dai->driver->id);
> +		spin_unlock_irqrestore(&priv->lock, lock_flags);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -491,6 +496,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->ipg_clk);
>  	}
>  
> +	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
>  	pm_runtime_enable(dev);
>  
> diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
> index 7812ffec45c5..479f05695d53 100644
> --- a/sound/soc/fsl/fsl_audmix.h
> +++ b/sound/soc/fsl/fsl_audmix.h
> @@ -96,6 +96,7 @@ struct fsl_audmix {
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
>  	struct clk *ipg_clk;
> +	spinlock_t lock; /* Protect tdms */
>  	u8 tdms;
>  };
>  
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
