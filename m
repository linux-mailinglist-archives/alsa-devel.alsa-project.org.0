Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF065F62F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 22:50:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41FED12189;
	Thu,  5 Jan 2023 22:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41FED12189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672955428;
	bh=uPhaNTNENZf5mGw9EH+DvbTe4+iskK+IX8fyXCEc/b8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sO7dfkvuuUbL0FV8AxNT4n85FBUmXrqv2VFH30wxbtEEJ/cooxy5wcAqJH6bUobLu
	 jpPjCjPROK8GrL09aUtNNz12T4wz9rT3E4UfgQ0puYkgRhbBrRmHp5karEy6aSna3K
	 BHOHUpa4AKS6yj4uEHM05FtCbXXQpewGhDbu+afY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1065FF8022B;
	Thu,  5 Jan 2023 22:49:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4EE2F80238; Thu,  5 Jan 2023 22:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1702F8022B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 22:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1702F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k1vQhvrw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6250B81BFE;
 Thu,  5 Jan 2023 21:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1758C433F0;
 Thu,  5 Jan 2023 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672955359;
 bh=uPhaNTNENZf5mGw9EH+DvbTe4+iskK+IX8fyXCEc/b8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k1vQhvrwks9De8sHyhAVIDK96HEI3Qp6V6J/94JngqUfbWfnIhx0UxaqicJ6hfvMk
 6CjUqB4QjufqDBU2QaCZE22uIVoavl90IpYuTbynfhyv7/7wkt9Msv9yJ2x/1IoLdZ
 mBJGTLs2MNdLKXL3kEm2sbtG4fzlOOoFm+EX0V/t3yB1/CumMZfn02p5ZQOaMrHf1T
 nNIV2z3/Z1NcB53mCXZB7r1CsY83CJutYcLT7wyf+hEWvaplYYW89cWvvvju1Pbr5U
 F7ZeKW9t745T3t3LFVdog+vp7wd79YtTcmhtFaxcunAL2XJKxfFAhqtKb/0h4r+CMS
 EyFOXQpLG9b/w==
Date: Thu, 5 Jan 2023 14:49:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] ASoC: amd: Return ENODEV if acp63 is not found.
Message-ID: <Y7dF3VvQs6l7rr3p@dev-arch.thelio-3990X>
References: <20230105211912.824250-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105211912.824250-1-trix@redhat.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, ndesaulniers@google.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, Syed.SabaKareem@amd.com,
 Vijendar.Mukunda@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Tom,

On Thu, Jan 05, 2023 at 04:19:12PM -0500, Tom Rix wrote:
> The clang build fails with
> sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used
>   uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>         default:
>         ^~~~~~~
> 
> When no device is found -ENODEV should be returned.
> A switch with a single case is overkill, change to if-else.
> 
> Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch! I sent basically the same thing earlier today
(sorry for forgetting to Cc you directly) and was told it was not
correct:

https://lore.kernel.org/6bb126b7-1cb4-0c4c-d357-fadc3ffdd3f9@amd.com/

I am just waiting for some feedback before sending a v2.

> ---
>  sound/soc/amd/ps/pci-ps.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 401cfd0036be..cba8800ab4ea 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -205,8 +205,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>  		memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	}
>  
> -	switch (adata->pdev_mask) {
> -	case ACP63_PDM_DEV_MASK:
> +	if (adata->pdev_mask == ACP63_PDM_DEV_MASK) {
>  		adata->pdm_dev_index  = 0;
>  		acp63_fill_platform_dev_info(&pdevinfo[0], parent, NULL, "acp_ps_pdm_dma",
>  					     0, adata->res, 1, NULL, 0);
> @@ -214,8 +213,8 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>  					     0, NULL, 0, NULL, 0);
>  		acp63_fill_platform_dev_info(&pdevinfo[2], parent, NULL, "acp_ps_mach",
>  					     0, NULL, 0, NULL, 0);
> -		break;
> -	default:
> +	} else {
> +		ret = -ENODEV;
>  		dev_dbg(&pci->dev, "No PDM devices found\n");
>  		goto de_init;
>  	}
> -- 
> 2.27.0
> 
> 
