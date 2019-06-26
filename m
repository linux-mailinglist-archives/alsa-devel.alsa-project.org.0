Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2675705F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 20:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21739168A;
	Wed, 26 Jun 2019 20:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21739168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561572930;
	bh=Dp0UnmDwiyxYUIaZ0YVz4Ti9few5yrw3glnpU5UsgVw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r84wntZEoGj77RpkE0j+/2dFAdLSI1BwbDnCX+ViNLrLsDvRXnmy4DcW6KjZoPiql
	 bSVBSclYO/gKGL968tmvEQ6IGpUXLnHXvSwRs9lsPcEuEWA17fUI7t+fcQk+12hPMC
	 3yOrXi53kxGTNvMGWVmxvxTrC+jlWdm45guLKevM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 606EBF896B7;
	Wed, 26 Jun 2019 20:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC33F8071F; Wed, 26 Jun 2019 20:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C53F8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 20:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C53F8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 11:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="360827757"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.194])
 ([10.252.15.194])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2019 11:13:06 -0700
To: pawel.harlozinski@linux.intel.com
References: <20190626093851.18474-1-pawel.harlozinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <d9bd7dcb-4780-1f05-e536-32005f2b0ab6@intel.com>
Date: Wed, 26 Jun 2019 20:13:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626093851.18474-1-pawel.harlozinski@linux.intel.com>
Content-Language: en-US
Cc: szymonx.mielczarek@intel.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Skylake: Recover BXT FW on
 DSP boot timeout error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-06-26 11:38, Pawel Harlozinski wrote:
> When DSP boots with timeout error, reinitialize, transfer
> and boot firmware to recover audio.
> 

This is so called "recovery". Say "why" we do it, not just "what" the 
sequence is.

> Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
> ---
>   sound/soc/intel/skylake/bxt-sst.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index 440bca7afbf1..a2844bdca1b8 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -455,13 +455,18 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)

What about its neighbour, cnl_set_dsp_D0?

>   	/* If core 1 was turned on for booting core 0, turn it off */
>   		skl_dsp_core_power_down(ctx, SKL_DSP_CORE_MASK(1));
>   		if (ret == 0) {
> -			dev_err(ctx->dev, "%s: DSP boot timeout\n", __func__);
> -			dev_err(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
> +			dev_warn(ctx->dev,
> +				"DSP boot timeout: Error code=0x%x: FW status=0x%x\n",

Log change (--log_level) without mention in commit msg. Maybe split this 
into separate commit? The entire log-polish thingy could be a theme for 
a patchset as this is not the only place where such changes are welcome.

>   				sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
>   				sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
> -			dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
> -			ret = -EIO;
> -			goto err;
> +
> +			ret = bxt_sst_init_fw(skl->dev, skl);
> +			dev_warn(ctx->dev, "Reload fw status: %d\n", ret);
> +			if (ret < 0) {
> +				dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
> +				ret = -EIO;
> +				goto err;
> +			}

Double message is unnecessary, routine is verbose enough. Either leave 
"always report stuff" and resign from mentioning anything at all on 
failure -or- do it only on failure explicitly.

>   		}
>   	}
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
