Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C63290E7F
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Oct 2020 03:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF3C180D;
	Sat, 17 Oct 2020 03:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF3C180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602898427;
	bh=yxDdTUSnVw1Ii+fMk5wldVld1ghXFwsFoEs0EKWvwSU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oP6RpbUBYNq55ScDAlA0o98Fby7odxSobWEkcdH0edpBNlKWWQocjIYD7sj98Jcdo
	 70jj8MCutSTqBBnLHffWr3PqTcp6xIIW+rem9Uw8zF9/Blm0yitD5hwmwSbdwHalJO
	 EupPYbL5GJmOv8IdEmEAYOf+Y2z3rHZHi+DDaRQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DB7F8012A;
	Sat, 17 Oct 2020 03:32:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85807F80217; Sat, 17 Oct 2020 03:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED4B3F80115
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 03:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED4B3F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xwl7fTXa"
Received: by mail-pg1-x541.google.com with SMTP id x13so2440789pgp.7
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 18:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6ZC06D0iTTUO33G/T+lGdFmHtlewUgM9PFYLzb4iwrw=;
 b=Xwl7fTXakw+Id+GamJRignbC3wIuvgG4DCZ5BdtMm3nt5spLmoBywf2pjwTIYCZwB9
 Q6wf6g5wn9q//ujl3fgP8S0Y/j77hmpsX4GHZCbSCVX1d7OhJIgCHmqjV96PzfA4FgGE
 RMaNFr/6rdNbBIomEVktNvrwhioUCH5x5IAs6/56kx5FdqYpIOnxG09rYttZVJYXsEsQ
 0IgfprM38tLVQj526n5jQCshEC4qbYe0sPbqjUfwAom+5J5aRThUgOE5WmCCvuXs115m
 Ob2l1rJNAIAQht+Nml/KSb/0QuBX5n27I52MgWgIlbZvoX3v5EATNoXn/UzMsP8KP4nk
 QEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6ZC06D0iTTUO33G/T+lGdFmHtlewUgM9PFYLzb4iwrw=;
 b=WvRdyF9JQR1Tn4lmfIaWCYh0qVH8fbGAtAr1+jhjkv5GS849ZjfF4xPMqvJkczOBbx
 e6hfC9q7bUH77uFQWBGLBGxgaPzeXevwxlTFZBKv4aM+Ycko6Rmci4ucebkjuL3rQZB2
 jJbyR2qBgcOkwGtSEi2saio2IATcsHB46rSJ1owKjqRnMp3nN4XF7fwNcGjeA4DomfbY
 lKseFPejozjGeN0Mgc9VNiQ0F3Xlj6g71H5sdxyVZWdO+iQ76RZtGUcslqhk3leKZzqE
 +gVipjR36BDJ2ZmT8oa6EN/u9HdsWR5jU6Cv8/fBnS63YoQEkRaGXUshIKjqgdCRIFcy
 GDag==
X-Gm-Message-State: AOAM532YMqRzgdz2vJXV30lu+6aNGzQXn+JtBE5IpCi2aV2V0j9Lj0ug
 XoQaUwjUXOK+Df4boYo4CCs=
X-Google-Smtp-Source: ABdhPJy9Sq3Gb2gNQVBxCZsnLTyNuwhLGfjeZ3YDfcSBoV/3Kocl9r/EvT9sZigEX7aCkakAlBPdNw==
X-Received: by 2002:a63:3e41:: with SMTP id l62mr5514054pga.419.1602898315175; 
 Fri, 16 Oct 2020 18:31:55 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 194sm3958054pfz.182.2020.10.16.18.31.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 18:31:54 -0700 (PDT)
Date: Fri, 16 Oct 2020 18:23:26 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_spdif: Add support for i.MX8QM platform
Message-ID: <20201017012325.GB7203@Asurada-Nvidia>
References: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
 <1602739728-4433-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602739728-4433-2-git-send-email-shengjiu.wang@nxp.com>
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

On Thu, Oct 15, 2020 at 01:28:48PM +0800, Shengjiu Wang wrote:
> On i.MX8QM, there are separate interrupts for TX and RX.
> 
> As the EDMA can't be configured to swing back to first FIFO
> after writing the second FIFO, so we need to force the burst
> size to be 2 on i.MX8QM. And EDMA don't support to shift
> the data from S24_LE to S16_LE, so the supported TX format
> is also different on i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

One small nit, yet I am okay if you don't resend. So:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

>  /* Check if clk is a root clock that does not share clock source with others */
> @@ -1283,6 +1313,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
>  	/* Initialize this copy of the CPU DAI driver structure */
>  	memcpy(&spdif_priv->cpu_dai_drv, &fsl_spdif_dai, sizeof(fsl_spdif_dai));
>  	spdif_priv->cpu_dai_drv.name = dev_name(&pdev->dev);
> +	spdif_priv->cpu_dai_drv.playback.formats =
> +				spdif_priv->soc->tx_formats;

Kernel no longer has strict 80-character limit now, and it seems
to fits 80 characters?
