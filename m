Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BDC71B44
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65A118EF;
	Tue, 23 Jul 2019 17:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65A118EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894964;
	bh=sAgKzAbPwRj06AdZCSH77U8IvoE449CGamvQGTL9mHs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CY/rpVagPtnwfc22nFr16nhU4xE850TdprL4ALm7fTr/Zc1hlVFe3pCb+ywsQZZFi
	 bLjIfwfXchR+k9g5O3IteiU3IqMAEMocSMGBq9j3f3BjxVwByP2x4QKbaRMfWmYGf7
	 W0aL06qNDWicVgQWAbTDLFO2K4T3uJWbzmOAsM/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A2FF80447;
	Tue, 23 Jul 2019 17:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C4DF80447; Tue, 23 Jul 2019 17:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11C6EF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 17:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C6EF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 08:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="344770569"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga005.jf.intel.com with ESMTP; 23 Jul 2019 08:14:08 -0700
To: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190708140248.14304-1-pawel.harlozinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <8842953f-32ad-6318-9de0-8410dc1f95e1@intel.com>
Date: Tue, 23 Jul 2019 17:14:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708140248.14304-1-pawel.harlozinski@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, Szymon Mielczarek <szymonx.mielczarek@intel.com>,
 broonie@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: Skylake: Recover BXT FW on
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

On 2019-07-08 16:02, Pawel Harlozinski wrote:
> When DSP boots with timeout error try to reload firmware
> to keep best user expeirience.
> 
> Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
> Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
> ---
>   sound/soc/intel/skylake/bxt-sst.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index 440bca7afbf1..dd0260557530 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -455,13 +455,19 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
>   	/* If core 1 was turned on for booting core 0, turn it off */
>   		skl_dsp_core_power_down(ctx, SKL_DSP_CORE_MASK(1));
>   		if (ret == 0) {
> -			dev_err(ctx->dev, "%s: DSP boot timeout\n", __func__);
> -			dev_err(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
> +			dev_warn(ctx->dev,
> +				"DSP boot timeout: Error code=0x%x: FW status=0x%x\n",
>   				sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
>   				sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
> -			dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
> -			ret = -EIO;
> -			goto err;
> +			dev_warn(ctx->dev,"Reloading FW\n");
> +
> +			ret = bxt_sst_init_fw(skl->dev, skl);
> +			if (ret < 0) {
> +				dev_err(ctx->dev, "Reload fw failed: %d\n", ret);
> +				dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
> +				ret = -EIO;
> +				goto err;
> +			}

First, I'm sorry for the delay in response.

Now, where were we..
I'd combine there dump messages together - that is both dev_warns and 
both dev_errs. No need to spam 2 lines when there is single a message to 
communicate on each occasion.

Any reason for ignoring return code of bxt_sst_init_fw and overwriting 
it with -EIO? If the reason is _good_ then you can skip assignment an do 
if (bxt_sst_init_fw()) directly.

Apart from that, I'd like to see a FIXME comment or something of that 
sort. FW preparation is being updated in patches to come and if this fix 
cannot wait, it's good to mention it targets BXT platforms only, while 
SKL/ CNL descendants are left alone.

Czarek

>   		}
>   	}
>   
> @@ -486,7 +492,6 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
>   	if (core_id == SKL_DSP_CORE0_ID)
>   		core_mask |= SKL_DSP_CORE_MASK(1);
>   	skl_dsp_disable_core(ctx, core_mask);
> -
>   	return ret;
>   }
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
