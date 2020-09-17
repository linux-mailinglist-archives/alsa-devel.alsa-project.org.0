Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74726D0E7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 03:55:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32EFD1671;
	Thu, 17 Sep 2020 03:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32EFD1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600307734;
	bh=SGMkKGWfWVLIda8hQeToQIb+2HexmKXGBlk/aCKDKrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ol9dRo+gy36fRpIgze182OIgPQPcC4V/5qWdryFohl2b4QGx4CPJlcqtSInVU+9uD
	 dljMiLSXXBbLopis7NRQd/CKF9ljdphRf0Bwrx9CWk/rPBkfwgmoFXhNaTupjngOTG
	 Z92gmDjAi0crQ6R02t779ytOyZ7GpbMt2qju3sIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 814D7F80134;
	Thu, 17 Sep 2020 03:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7821DF80276; Thu, 17 Sep 2020 03:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CDEF80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 03:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CDEF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kKCLvI75"
Received: by mail-pf1-x441.google.com with SMTP id o20so195058pfp.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 18:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dgnODGIAWL13nIbhEz3ezEHyZ73l+QamiC/feoln9pA=;
 b=kKCLvI754VQRS48l6o9prlDOUU+078HIdKfltH5m2ufXjuitexI7+27BaPPbM7YOID
 U4w8RnHLvpLY6DPhDtH3pQ47Rn2QsEssszplv8yr+YnXJ+rGa7Z5m2m57TcVX7Ak+Oy1
 HsAT+RyItKoLxTRjYInlcUVR46IQszNC9caKIBbvexWbuSURvAc4MRb7ULAPtnXFWxEl
 0SKF+LI7ZsEnX+o8uZzG1pKsT4P50TqHlS4lKHl8Qt/9CH5Q6Y7YqZxoZAf/k5zH6tAb
 TUp/JF4nyi97FbyqS/39j2QdLJ2Vz7Ueo6qTZqvhHjxpgIPFFbbJpThvMPx6urXE0CfF
 SDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dgnODGIAWL13nIbhEz3ezEHyZ73l+QamiC/feoln9pA=;
 b=YFkcfN+2dTzV7jEaoWISXDrSrTfX42EWfxGfWP6N3627GXdhLOw3jgJiF8A5/NT1MJ
 GskGJm4BiZJaXWwzGvO2/oAa5BBUywFGzNtnkiVtg39OHWGs4OsaCRr7mk4gPxym3uvl
 HMD6IliQGJ0jfV0YM1Wqj5yBk09qlmypkY62D+VnSPOiK71onhSYp9tY+YmLQUOcQS91
 grZMm/RF8rY3ohN1k2TKilXmRg9m1R3VzsJBFj4IClEnrM7ClgFhUU6XS+PXjzqRMy/y
 T44e7/hjcF5P8YnnloqgLwu4Ok1RqTqKZiPZUzr6klJhh+BE73rafesmsA1HmLzp1Zo0
 DVgg==
X-Gm-Message-State: AOAM533TO9GKESrNmnkttYCmIPyD1aMTUlR7Kz2Hg6aX5Xix+QD7a+Vb
 U/BXI6jcCgNUd1Z7ZerWq2g=
X-Google-Smtp-Source: ABdhPJxnNOKTfJ7qLfSj/RIBwWtTsFveH5xnCH12xhYaBkeSNyJehUmbC9p4FCNpFJCk1tW0zIOOLg==
X-Received: by 2002:aa7:9635:0:b029:142:2501:3980 with SMTP id
 r21-20020aa796350000b029014225013980mr9025261pfg.69.1600307640882; 
 Wed, 16 Sep 2020 18:54:00 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id gd14sm4050934pjb.0.2020.09.16.18.54.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 18:54:00 -0700 (PDT)
Date: Wed, 16 Sep 2020 18:50:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: Set MCLK input or output direction
Message-ID: <20200917015048.GD22566@Asurada-Nvidia>
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <1600251387-1863-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600251387-1863-4-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
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

On Wed, Sep 16, 2020 at 06:16:27PM +0800, Shengjiu Wang wrote:
> SAI support select MCLK direction with version.major > 3
> and version.minor > 1, the default direction is input,
> set it to be output according to DT property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_sai.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 738b4dda7847..5117c1cd5682 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1117,6 +1117,13 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
>  
> +	/* Select MCLK direction */
> +	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
> +	    sai->verid.major >= 3 && sai->verid.minor >= 1) {
> +		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
> +				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
> +	}
> +
>  	pm_runtime_enable(&pdev->dev);
>  	regcache_cache_only(sai->regmap, true);
>  
> -- 
> 2.27.0
> 
