Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C5240318
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 10:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A731663;
	Mon, 10 Aug 2020 10:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A731663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597046537;
	bh=c5yabBYYn4GFy06WvKIzRNzsqzmOHxirMLVRPb3xKHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r334H9H/C/SYWtTI5e1pdkKH67FV4Cp9voUECQdZDLH11TAgTsGtBC7o3AIa48Sn6
	 u4W6orDz8425/BDGGs36OMDxNWJSoAI6yjDfCRVLhSraq757njlThmna5HsOPmXp0b
	 BAy51PhINwuT0urv7ZgjvuaPxhEuZm/wQnXrM7Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F9EEF8022B;
	Mon, 10 Aug 2020 10:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561D9F8022B; Mon, 10 Aug 2020 10:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 141DEF800CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141DEF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p6MuEI+X"
Received: by mail-pl1-x641.google.com with SMTP id r4so4367065pls.2
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zdq88gHxCb3jvrnqaljepUUsgAroF2d/K4zFPmR3yOk=;
 b=p6MuEI+XHuECK8OwzYOsOSGvE6HobWjnUYA/dLBvje7ek7CK2RJtTUwabVNR/CPshY
 alZdJZzx3Vum+SuA9bURQqqGZx8Zy8cQapS2hwbPXpmX9dJzmusmKy+1hRZrBty+HaWl
 r1vReZxNdXS2Y2f3U/kqS/I/+q4FXU/3kI9ad6rC5ljw085nCdc7Bz006PvJKbuidbND
 EjQdEVy66f3CuLilBwm+6pDuyytmwrt75zsB9pfBt6tV4KagZBBnO0k1LD8/2YOoww8/
 jj2GOO3ipclZ4+AKuCb5VBhDNM0ksSe0kiUwx9m0Ji+oGK5QJMUgZgDmvoHvGaSxX8Kd
 wXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zdq88gHxCb3jvrnqaljepUUsgAroF2d/K4zFPmR3yOk=;
 b=msUmgL/KExD+qhoR1Hk15Ljn1bFfxLWECoK9sl+SDY/Cx/7J5iuBB734lKSYShxcsE
 +svNyhp6sHE8+quH/ldSdsph6tI5ULUdo5GhplhaHv7f0LAsoxWBIyQF5dPCNQKfXNVR
 b057iR4WgBwBHOpyo0ILiYtJygN1H1LRu4edmG/7bqtkJDMQb+xjLJkAj84qsFQzSthv
 obQYEMInRdvQPQhx8ZdISlCj6NUbvSqpkSx7AwxwqNSMKIELOGozjuJ9XVIwaFoJFhUu
 CvTHrGoiDb++vmaj4Yp1UKvgawiMxwgvBYYA+lxKjrS2GCX6ll3A1lYTL/uweYBZzQ/9
 VQfg==
X-Gm-Message-State: AOAM532UAlbccbQwwXJBkX4xNuGy4LvLq7RYFpuY8H/cTqszldWmOgsM
 RAeoIBmEg/aBoEq3PdzOiAI=
X-Google-Smtp-Source: ABdhPJz5gK1nHWJYyHM/CxrATPUeMggaRaBYXWAmyQyHAsKFcQ7z9aOcwMDd5eU2YSfcwWQ8LhWD7g==
X-Received: by 2002:a17:90b:255:: with SMTP id
 fz21mr25805953pjb.50.1597046423161; 
 Mon, 10 Aug 2020 01:00:23 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f18sm17456266pgv.84.2020.08.10.01.00.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Aug 2020 01:00:23 -0700 (PDT)
Date: Mon, 10 Aug 2020 01:00:18 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap init
Message-ID: <20200810080018.GA13408@Asurada-Nvidia>
References: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, Aug 07, 2020 at 05:14:42PM +0800, Shengjiu Wang wrote:
> Regmap initialization may return -EPROBE_DEFER for clock
> may not be ready, so check -EPROBE_DEFER error type before
> start another Regmap initialization.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a22562f2df47..eb933fe9b6d1 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -927,7 +927,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  			"bus", base, &fsl_sai_regmap_config);
>  
>  	/* Compatible with old DTB cases */
> -	if (IS_ERR(sai->regmap))
> +	if (IS_ERR(sai->regmap) && PTR_ERR(sai->regmap) != -EPROBE_DEFER)
>  		sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
>  				"sai", base, &fsl_sai_regmap_config);
>  	if (IS_ERR(sai->regmap)) {

In that case, might need a !EPROBE_DEFER check for this
fallback devm_regmap_init_mmio_clk at "sai" clock too?
