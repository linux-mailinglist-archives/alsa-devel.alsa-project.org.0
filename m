Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6F20D582
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 21:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1052165D;
	Mon, 29 Jun 2020 21:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1052165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593458791;
	bh=NQfVhLd82tOgy+Bc30AUEkGdr8mJgATU0+ubiyO/qGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D2+GqfvoGqOOnsivYVNSpWG8xwZLxRu9F3ahD4Ce8sCRLqYO4PdPTgDFvaR5A2jAa
	 VuPpnkw6qguc7++kyHzoMrE8M18tOymb2M/rfpAZo2Mx5gNn0FSr1kAmYtN+Tzl8pA
	 HedezOy5J5/ZslFUl1ayzqE2mup8iAkHf9tv4RBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A38F800BA;
	Mon, 29 Jun 2020 21:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47593F800BA; Mon, 29 Jun 2020 21:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E951EF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 21:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E951EF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rJockAN7"
Received: by mail-pj1-x1041.google.com with SMTP id f6so4393664pjq.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9dKxVJjlaX8jxkeSh8T6e6YHQEcdayiIxfyFI+zqbOE=;
 b=rJockAN73JAGXobfkev1y93WYQunULGBKvkHTFKad7D/eGF6tMmDd+MraUFMuEk8ni
 uXbBn82EgTam3bfIUAMR/28dBeHDZ2Ju1ZhDVGhwDN9bLMd5ab7IeRqJMfACaETguWjG
 ydJZCKge5IZiRZi904cCLfh2TZuu6KY7ZhfNqBlHwNWPwI9tE1If8SAcbqLmottXPj2z
 dUzUTfjA2PoZRb1dYCcN7cbsFQ9P9PZ563y0ZDe94rzLrXbX9u3EhaD2a4MOmnplChLU
 xAtkHqY2Rt2UHA/D4yO4QtII2iv+pNwVnQmpL1QrBEoRA9UAfEiXm+JN7Dmtiu4oV4ev
 944A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9dKxVJjlaX8jxkeSh8T6e6YHQEcdayiIxfyFI+zqbOE=;
 b=V/if3yPQfVAflkHnNtbP8bqT2osRoFj6BM5a8RCguPIrZJmVCwN7q780EhOee4/AxG
 t2nx5r7SSZtXUQjxvTu9ZECTpBRLcwzGqp/73+7Nvd1OScFe0UY7Z3SV+88D67gyO0gd
 u+de50lhWcDgD9m9FjmG15l0rwcekwEaAN96eSN1n12U76MzwOoG7A8/NlIQdY43efoL
 tVg9ZrVmzjiIsJnbhXknzFwb6N/TI3R6bi98iryDKbc3LbJw8zPWofi7zBsJm4Xrv/zY
 20DHjn29AxuMu2u3p1vY7FGD/CNlvg4UT+rk3W+nF/0AHY/XAXobjpvgjtm1NwiN5UFW
 cnpA==
X-Gm-Message-State: AOAM53389tGnFl67poPE7yoCH44tjzYES+3nHZ/7USMYljqINMtWA5++
 tdIxnb6LnxiCGu0ta+aHnoWhASHFyx8=
X-Google-Smtp-Source: ABdhPJw2NTojIOVe1N+k9d1UhrBCtTCNAURgml2u7637EWsRsIvR4dZARYK0e7VEMzNZsiIfyPManQ==
X-Received: by 2002:a17:90b:698:: with SMTP id
 m24mr4120032pjz.15.1593458677861; 
 Mon, 29 Jun 2020 12:24:37 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y8sm278658pju.49.2020.06.29.12.24.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jun 2020 12:24:37 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:24:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Refine regcache usage with pm runtime
Message-ID: <20200629192402.GA27967@Asurada-Nvidia>
References: <1593412953-10897-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593412953-10897-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Jun 29, 2020 at 02:42:33PM +0800, Shengjiu Wang wrote:
> When there is dedicated power domain bound with device, after probing
> the power will be disabled, then registers are not accessible in
> fsl_sai_dai_probe(), so regcache only need to be enabled in end of
> probe() and regcache_mark_dirty should be moved to pm runtime resume
> callback function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
