Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028649B7B5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC3D84A;
	Fri, 23 Aug 2019 22:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC3D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592447;
	bh=rOYznH2JSw05RK6KDxEDZv3ZDIIdMl1Zy9R6gNXvbpY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2VncoonIdLpCo45QzQPKFW81VqJArPMGvFlYpyPlOZWougBoELOZPboBJ5HPKrSw
	 Nk/zTfCdT1yKTBWUHwhIR9LjfdmP0C6cU76gBJLQz2ImY81Lr8O6rKXySwADcUZ/gI
	 VQuy4Fuky4FawMKDxeeUwx7BvIIXxKhQpso0+YLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36295F805F5;
	Fri, 23 Aug 2019 22:28:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B2CCF80641; Fri, 23 Aug 2019 22:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F5EDF80518
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5EDF80518
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718196"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:05 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-16-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d334cfab-34c9-a75b-598a-8527ffc89f54@linux.intel.com>
Date: Fri, 23 Aug 2019 14:17:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-16-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 15/35] ASoC: Intel: Skylake: Use dsp
 loading functions directly
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



On 8/22/19 2:04 PM, Cezary Rojewski wrote:
> None of skl_dsp_loader_ops are actually extended as any parameter that
> could be "extended" is already part of given function's parameter list.
> Rather than obfustace non-derived calls with ops and dereferences, make

A typo on obfuscate could be intentional?

> use of said operation directly. Takes part in remal of

removal?

> skl_dsp_loader_ops structure.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/bxt-sst.c       | 18 +++++++++---------
>   sound/soc/intel/skylake/cnl-sst.c       | 10 +++++-----
>   sound/soc/intel/skylake/skl-messages.c  | 10 +++++-----
>   sound/soc/intel/skylake/skl-sst-cldma.c | 10 +++++-----
>   sound/soc/intel/skylake/skl-sst-dsp.h   |  9 +++++++++
>   5 files changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index a8a2783f9b37..1ca4fba0f35f 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -60,7 +60,7 @@ bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo, int lib_count)
>   		if (ret < 0)
>   			goto load_library_failed;
>   
> -		stream_tag = ctx->dsp_ops.prepare(ctx->dev, 0x40,
> +		stream_tag = skl_dsp_prepare(ctx->dev, 0x40,
>   					stripped_fw.size, &dmab);

fits on one line now?

>   		if (stream_tag <= 0) {
>   			dev_err(ctx->dev, "Lib prepare DMA err: %x\n",
> @@ -72,14 +72,14 @@ bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo, int lib_count)
>   		dma_id = stream_tag - 1;
>   		memcpy(dmab.area, stripped_fw.data, stripped_fw.size);
>   
> -		ctx->dsp_ops.trigger(ctx->dev, true, stream_tag);
> +		skl_dsp_trigger(ctx->dev, true, stream_tag);
>   		ret = skl_sst_ipc_load_library(&skl->ipc, dma_id, i, true);
>   		if (ret < 0)
>   			dev_err(ctx->dev, "IPC Load Lib for %s fail: %d\n",
>   					linfo[i].name, ret);

indent?

>   
> -		ctx->dsp_ops.trigger(ctx->dev, false, stream_tag);
> -		ctx->dsp_ops.cleanup(ctx->dev, &dmab, stream_tag);
> +		skl_dsp_trigger(ctx->dev, false, stream_tag);
> +		skl_dsp_cleanup(ctx->dev, &dmab, stream_tag);
>   	}
>   
>   	return ret;
> @@ -100,7 +100,7 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
>   {
>   	int stream_tag, ret;
>   
> -	stream_tag = ctx->dsp_ops.prepare(ctx->dev, 0x40, fwsize, &ctx->dmab);
> +	stream_tag = skl_dsp_prepare(ctx->dev, 0x40, fwsize, &ctx->dmab);
>   	if (stream_tag <= 0) {
>   		dev_err(ctx->dev, "Failed to prepare DMA FW loading err: %x\n",
>   				stream_tag);
> @@ -162,7 +162,7 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
>   	return ret;
>   
>   base_fw_load_failed:
> -	ctx->dsp_ops.cleanup(ctx->dev, &ctx->dmab, stream_tag);
> +	skl_dsp_cleanup(ctx->dev, &ctx->dmab, stream_tag);
>   	skl_dsp_core_power_down(ctx, SKL_DSP_CORE_MASK(1));
>   	skl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);

those macros look confusing. COREx_MASK or CORE_MASK(x), choose one.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
