Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E43EDCC5
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463A416A5;
	Mon, 16 Aug 2021 20:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463A416A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629137032;
	bh=B2jyaNj79A42m28exuRget68ed7+1u8WgVhr2RwnPkY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=A4FRmvFQrOTQnOap1suDW2PtB7xmdsYg/NHsNZwljnrBJcZK+UD3GrHJhbDlESXec
	 j2/vxiLqWXP1mS0g1ExhW1+NEk89K5LcNAptbsV3VHWKgIgYxNuYh/gPIy0vnk46gE
	 Pzl7zQq0SDZ8/8hYvM8REByueqeSWI1Mv7tb2P88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C145CF80259;
	Mon, 16 Aug 2021 20:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65662F80249; Mon, 16 Aug 2021 20:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C945EF80154
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C945EF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YozBxOdS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFC3160462;
 Mon, 16 Aug 2021 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629136934;
 bh=B2jyaNj79A42m28exuRget68ed7+1u8WgVhr2RwnPkY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YozBxOdSA4wdQxQTcgrxfYHbJVGLAIgbuqAJW5BL25XSn5gcEXpkSTERuIKdJIv4w
 EdRxQ2e59ucRTjQqaY05rKXCb1t18D9/dTpg5TNNisvhs5ci9Q39hi4FhuFMdt/kR8
 CwLhCdaKRIZdkPC2oHPJ4lOzHT/NhIvtNXkOsHtFpoNHl+f5rCrOuHq8qW1v1Gc3QI
 yIAz8+EVKnuRXWeAdwNkjg/8+6kjeKdfD9O4+qBtkCZ5zFbXwOwFAnuUYB+Wae9y5l
 BV4B2Sw7PwvrkzsLSQYgHQAdAqplCWFHIJHPz6mwnl5mf+uhNYXv5AdjJ9QyCsF0NQ
 KQ7QQmXDLhfSw==
Date: Mon, 16 Aug 2021 13:02:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816180212.GA2933142@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
> 
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index b3e1df693381..0ac109b32329 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -518,7 +518,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>  	void __iomem *regs_apbif, *regs_ahub;
>  	int ret = 0;
>  
> -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);

I think this is incorrect.

  const struct of_device_id *of_match_device(...)
  const void *of_device_get_match_data(...)

of_match_device() returns "struct of_device_id *", i.e., "match".

of_device_get_match_data() calls of_match_device() internally, then
returns "match->data".

>  	if (!match)
>  		return -EINVAL;
>  	soc_data = match->data;
> -- 
> 2.32.0
> 
