Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83082221690
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 22:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD461662;
	Wed, 15 Jul 2020 22:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD461662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594846186;
	bh=d+YOFSKw4YDYKoEWuxCARqVLlZI0PrTidmbFEz1yCMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Na4qIMVATqVqZGXzJpgcn4InRAjy9/1pswwzc1S46DqJvNL047fwH8IDDe5T8G8dy
	 PxfVzi25xnD3cZ4Uhy7orZIa5lHvM/FbI7+Rm+7CD9nK/pWS+NZLPGNtR4gawyNBn/
	 x6E3E6BePwrX+XiSmVP3XxWYxyjnKFsWgHKOP1kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C364BF8023F;
	Wed, 15 Jul 2020 22:48:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A73BF80229; Wed, 15 Jul 2020 22:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B109F80217
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 22:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B109F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WfhBj627"
Received: by mail-pj1-x1042.google.com with SMTP id f16so3567498pjt.0
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YwtQ+qIZRMu1aHjFHPtF40fPrwJ9tfeRwj/jvnsJYBE=;
 b=WfhBj627Y0WOtyr1wRjCUf4CYVWiv9xzOas2x0/JPpSflqWZmNEp95WvwJiPslkU2d
 Kios/eGN2XcbMmUIQ9klS1VhHOTkfjtPmpIyJJFaAHb8FJTBq5kGR2CZ5/HY+l2RjpVi
 i2grx16HFurjU299NUhstWKgdpL5bNT08QT9ZevBaeFxDI/+RZ00qhq2VPxTxwsiKmce
 UdGnoQzlQXNtlhig++nO4/kAuwBPXjZL9/gLz8HWgggqzUUDW+WHz1bxHPcvq1ta8lSr
 6+f9FCbLIynLkNZbyxGHPGbSHsrIRaKOoIb8D841N/GpaWFnWcg4hUlqmD0RJpDt+jrL
 bWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YwtQ+qIZRMu1aHjFHPtF40fPrwJ9tfeRwj/jvnsJYBE=;
 b=SGvuETRdfvr3TpmHwXGEyuQIasX2JG7XXRwlTrOBw8bN+VFMzvnfqICjb9PDAwFP3P
 1tMttNrjEw61xkr115ZKytOdo/RbkGj23GIpMXYvo1eybjlcdOh41bsS5llXJBeJ4Lqc
 URrgwt4Bc7z1FqDG4W4gnoeoTlzfwuqiI+pT9EqdRUG3yVl1OdaI2273ZJAegj9A85+E
 VwA/rDzMT284qavK5GnWnGTacW/I3BIH+0n5fEsQ97rMLJB5rGlfFYX2Lm0UzacrIqh5
 ojcrVlRKLeIqlP8Pf4HDwZC8XsJzhxz+B/z5oYUhIC54IAeJgCj+crgZi7k3DfQe2NW5
 G1kw==
X-Gm-Message-State: AOAM533h+ZF6XZJG5LX81KgCI6uiDpnY7eHjqliQD74JhnxVMdU7JKxc
 SDDragJaCREmtkz497D1vs8=
X-Google-Smtp-Source: ABdhPJz1GJ2Ik7lZDPIUXV5ePwyu/YwogLbPU4apDaOlkhisq+aJKtFRAA1r//dZtZBvcY/zN4hOBQ==
X-Received: by 2002:a17:90a:a413:: with SMTP id
 y19mr1460097pjp.59.1594846114095; 
 Wed, 15 Jul 2020 13:48:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id w9sm2983563pja.39.2020.07.15.13.48.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jul 2020 13:48:33 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:48:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix
 misspelling of 'exists'
Message-ID: <20200715204809.GA14565@Asurada-Nvidia>
References: <20200715150009.407442-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715150009.407442-1-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 15, 2020 at 04:00:09PM +0100, Lee Jones wrote:
> Cc: Timur Tabi <timur@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index faac6ce9a82cb..dbacdd25dfe76 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -92,7 +92,7 @@ struct fsl_asoc_card_priv {
>  };
>  
>  /*
> - * This dapm route map exits for DPCM link only.
> + * This dapm route map exists for DPCM link only.
>   * The other routes shall go through Device Tree.
>   *
>   * Note: keep all ASRC routes in the second half
> -- 
> 2.25.1
> 
