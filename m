Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB158C46A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 09:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AE8F836;
	Mon,  8 Aug 2022 09:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AE8F836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659945153;
	bh=w2oVn/9yhFWn7yqZ9M6VgmJBgHr61NGPEcOPgx2ofJ8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJcxCCfndUHf04+8omLuvclKVxXKAuekOdgU9104AxoYBh36Ku3b8es4vo6gdYA3l
	 rRyT//vWQPXBs7k7G2LLEjLdSmJzo9uXbleaVB/2t62V+Mq1RVwPWmKA8EEphKaZkB
	 0A1wB0sKNFIN6vQzro6TrithsTZoXnvJjpqPkPCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 101ECF804B1;
	Mon,  8 Aug 2022 09:51:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BA36F8049C; Mon,  8 Aug 2022 09:51:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFEE2F8013D
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 09:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFEE2F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nsBstlTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659945090; x=1691481090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w2oVn/9yhFWn7yqZ9M6VgmJBgHr61NGPEcOPgx2ofJ8=;
 b=nsBstlTSErVrbI2l2y21Esrz9Kp4G47IKYfyZ+yt9+L5FmMNmdm+pT/6
 nTbPTK0vS4pLKCphIXeDm2fJW010nifuY9QzJ5XfWdT6mvD/Ualtaj795
 GXIgMmpCVoUI4x4DPBT6i/rYTAj1umiE5JZCChxUmqcF3TUw9DrP+M5Ma
 CcGWHwMsEAxuNhZpDKhXoKxt91dsggT2V1WuyLrC0hg6gjuOSu1xNwTaM
 QGiZX4yjphzHN0Wa6xg6BUyYa0uiwbsbeBFKo2dZLapsuKoUzDYOKAUAT
 U7VOMtWG0nNHquaFnKdazQhb8fONjMPSx88YOWCIAH8w6EJYQMXLMTBtn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="290538168"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="290538168"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 00:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="672382302"
Received: from ajanoscz-mobl1.ger.corp.intel.com (HELO [10.252.35.108])
 ([10.252.35.108])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 00:51:15 -0700
Message-ID: <91d05e59-8123-de3f-55da-62b74ac96ddd@linux.intel.com>
Date: Mon, 8 Aug 2022 09:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Simplify clk_get() usage
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Harsha Priya <harshapriya.n@intel.com>,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Sriram Periyasamy <sriramx.periyasamy@intel.com>
References: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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



On 8/7/22 22:18, Christophe JAILLET wrote:
> If clk_get() returns -ENOENT, there is no need to defer the driver, -ENOENT
> will be returned the same for each retries.
> So, return the error code directly instead of -EPROBE_DEFER.
> 
> Remove this special case and use dev_err_probe() to simplify code. It will
> also be less verbose if the clk is really deferred.
> 
> Fixes: f7f61e08fe58 ("ASoC: Intel: kbl: Enable mclk and ssp sclk early")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This is based on my understanding of clk_get().
> Review with care.
> 
> Not sure the Fixes tag is needed. The patch does not fix anything.
> If devm_clk_get() returns -ENOENT, it will just loop several time until
> the framework gives up.
> If it returns -EPROBE_DEFER, this case is already handled by the
> "return ret;"
> 
> So this patch should be a no-op, just a clean-up.

I can't pretend understanding the clk framework in depth, but the only
case where -ENOENT is returned seems to be this block in clk_hw_create_clk()

	if (!try_module_get(core->owner)) {
		free_clk(clk);
		return ERR_PTR(-ENOENT);
	}

I have no idea why this would be converted to a -EPROBE_DEFER. May to
account for module loading?

> ---
>  sound/soc/intel/boards/kbl_rt5663_max98927.c | 31 ++++----------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> index 2d4224c5b152..07b00af2fa3c 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> @@ -989,7 +989,6 @@ static int kabylake_audio_probe(struct platform_device *pdev)
>  {
>  	struct kbl_rt5663_private *ctx;
>  	struct snd_soc_acpi_mach *mach;
> -	int ret;
>  
>  	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -1009,32 +1008,14 @@ static int kabylake_audio_probe(struct platform_device *pdev)
>  			&constraints_dmic_2ch : &constraints_dmic_channels;
>  
>  	ctx->mclk = devm_clk_get(&pdev->dev, "ssp1_mclk");
> -	if (IS_ERR(ctx->mclk)) {
> -		ret = PTR_ERR(ctx->mclk);
> -		if (ret == -ENOENT) {
> -			dev_info(&pdev->dev,
> -				"Failed to get ssp1_sclk, defer probe\n");
> -			return -EPROBE_DEFER;
> -		}
> -
> -		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
> -								ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ctx->mclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ctx->mclk),
> +				     "Failed to get ssp1_mclk\n");
>  
>  	ctx->sclk = devm_clk_get(&pdev->dev, "ssp1_sclk");
> -	if (IS_ERR(ctx->sclk)) {
> -		ret = PTR_ERR(ctx->sclk);
> -		if (ret == -ENOENT) {
> -			dev_info(&pdev->dev,
> -				"Failed to get ssp1_sclk, defer probe\n");
> -			return -EPROBE_DEFER;
> -		}
> -
> -		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
> -								ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ctx->sclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ctx->sclk),
> +				     "Failed to get ssp1_sclk\n");
>  
>  	return devm_snd_soc_register_card(&pdev->dev, kabylake_audio_card);
>  }
