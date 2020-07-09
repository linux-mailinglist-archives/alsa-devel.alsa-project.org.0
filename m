Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A321A546
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5910B1616;
	Thu,  9 Jul 2020 18:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5910B1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594313722;
	bh=NgM36XtRAyjtHGHgNvvHlXd1XnKi4ZRs0Q5ZhAeuNPM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwluZv9ycwODmIweMSLcc40waJgi6+/1hx8Md/5ajPkmL6syICKKRgbILcMG5SNcB
	 tbPQRF5RwBsR5A9g6yZ0hTZ1qTWpgaq17mmOCelR8wczlZt2V5tF9j1padH+SNrAJ1
	 hjovZStmJl7f8vlJ2I4vYmqKeegxD2uEJsMF09Cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BDAF8011F;
	Thu,  9 Jul 2020 18:53:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D240BF80117; Thu,  9 Jul 2020 18:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37756F80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37756F80117
IronPort-SDR: MIQ4Vh8s/A8tmsREdBDyQX1xJ5H8f1fn66TEsJDiFVEDdDGdatCggXqJ51DZJ+0E+2juQ7L0vk
 bN24gHoofJxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="127626860"
X-IronPort-AV: E=Sophos;i="5.75,332,1589266800"; d="scan'208";a="127626860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:53:24 -0700
IronPort-SDR: Wfl4DjtewN9y8lcEqx4mIg3O24jMaRiJiaPADj4LdYQdAQsGMIduDLoSz9zrw7NJXWISQtLIrM
 CzRnXHnkAHbw==
X-IronPort-AV: E=Sophos;i="5.75,332,1589266800"; d="scan'208";a="284216674"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO [10.255.231.43])
 ([10.255.231.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:53:24 -0700
Subject: Re: [PATCH] ASoC: Intel: boards: eve: Fix DMIC records zero
To: vamshi.krishna.gopal@intel.com, lma@semihalf.com,
 harshapriya.n@intel.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20200709152526.15764-1-vamshi.krishna.gopal@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <79866874-1ec3-50a1-1034-39bc116264fd@linux.intel.com>
Date: Thu, 9 Jul 2020 11:53:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709152526.15764-1-vamshi.krishna.gopal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sathya.prakash.m.r@intel.com, brndt@google.com
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



On 7/9/20 10:25 AM, vamshi.krishna.gopal@intel.com wrote:
> From: Brent Lu <brent.lu@intel.com>
> 
> Add a dapm route to provide ssp mclk/sclk early
> for DMIC  on SSP0(rt5514) and Headset on SSP1(rt5663)
> since sclk for both codecs are different the
> struct now defines SSP0 and SSP1 mclk , sclk separately
> This change ensures the DMIC PCM port
> will not return all-zero data
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> ---
>   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 150 ++++++++++++------
>   1 file changed, 102 insertions(+), 48 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index b34cf6cf1139..584e4f9cedc2 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -53,8 +53,10 @@ struct kbl_codec_private {
>   	struct snd_soc_jack kabylake_headset;
>   	struct list_head hdmi_pcm_list;
>   	struct snd_soc_jack kabylake_hdmi[2];
> -	struct clk *mclk;
> -	struct clk *sclk;
> +	struct clk *ssp0_mclk;
> +	struct clk *ssp0_sclk;
> +	struct clk *ssp1_mclk;
> +	struct clk *ssp1_sclk;

The definition of a per-SSP MCLK is just wrong. there are 2 MCLKs 
regardless of the number of SSPs, this should be MCLK0 and MCLK1.

It probably works in your case since you have 2 SSPs, but the Skylake 
driver exposes ssp2..5_mclk clocks that don't exist in hardware. Oh well.

If you don't mind I'd prefer it if you used mclk0 and mclk1 and drop the 
ssp_ prefix. You can still use the "ssp0_mclk" and "ssp1_mclk" strings 
when calling devm_clk_get(), but that way if the Skylake driver is fixed 
at some point we will not have to change the code in this driver, only 
the clock names.

[...]

> @@ -757,6 +800,29 @@ static struct snd_soc_card kabylake_audio_card = {
>   	.late_probe = kabylake_card_late_probe,
>   };
>   
> +static int kabylake_audio_clk_get(struct device *dev, const char *id,
> +	struct clk **clk)
> +{
> +	int ret = 0;
> +
> +	if (!clk)
> +		return -EINVAL;
> +
> +	*clk = devm_clk_get(dev, id);
> +	if (IS_ERR(*clk)) {
> +		ret = PTR_ERR(*clk);
> +		if (ret == -ENOENT) {
> +			dev_info(dev, "Failed to get %s, defer probe\n", id);
> +			return -EPROBE_DEFER;
> +		}
> +
> +		dev_err(dev, "Failed to get %s with err:%d\n", id, ret);
> +		return ret;

nit-pick: you can remove this return since you already have one two 
lines below.

> +	}
> +
> +	return ret;
> +}
> +

