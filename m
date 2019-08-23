Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C43359B7B2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE91165F;
	Fri, 23 Aug 2019 22:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE91165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592354;
	bh=QLXu/nD/bveuWQjMpaWJLjcQL3Nd3LUkVugLDRtUmIo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqzInlkx6bUkWQ92Q4tbDEReILrBz5ALruCh9op6M8Csp29SwPsuOYPVhZtzts02F
	 xr+S8MQvZlG72QCIdwYVHwm0jARbjpD3/KqcdgUkXblsCZvlXb6xP0tcssYb9LLgvU
	 KMeYVmY8d3gu5tXggBoBuJOTrYO0TCDH79jzlRWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DDA7F80638;
	Fri, 23 Aug 2019 22:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B444F8060E; Fri, 23 Aug 2019 22:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A30EF8036A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A30EF8036A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718187"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:03 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-13-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d902a188-f870-6745-be42-9df637c7634e@linux.intel.com>
Date: Fri, 23 Aug 2019 14:07:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-13-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 12/35] ASoC: Intel: Skylake: Reuse
 sst_dsp_free
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
> Skylake is sst_dsp descendant. Rather than bypassing framework's flow,
> embrace it. sst_dsp_free invokes sst specific handler internally so
> nothing is missed.

for clarity you should also add the free_irq is also handled internally 
in sst_dsp_free(), otherwise this looks like a mistake to the reviewer 
that's not even half-way through the series...

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/cnl-sst-dsp.c | 1 -
>   sound/soc/intel/skylake/skl-sst-dsp.c | 1 -
>   sound/soc/intel/skylake/skl-sst.c     | 2 +-
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.c b/sound/soc/intel/skylake/cnl-sst-dsp.c
> index 189c1c7086e3..48b465939ef8 100644
> --- a/sound/soc/intel/skylake/cnl-sst-dsp.c
> +++ b/sound/soc/intel/skylake/cnl-sst-dsp.c
> @@ -215,7 +215,6 @@ void cnl_dsp_free(struct sst_dsp *dsp)
>   	sst_ipc_fini(&skl->ipc);
>   	cnl_ipc_int_disable(dsp);
>   
> -	free_irq(dsp->irq, dsp);
>   	cnl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
>   }
>   EXPORT_SYMBOL_GPL(cnl_dsp_free);
> diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
> index 348e69226e46..1c4ecbcd7db7 100644
> --- a/sound/soc/intel/skylake/skl-sst-dsp.c
> +++ b/sound/soc/intel/skylake/skl-sst-dsp.c
> @@ -468,7 +468,6 @@ void skl_dsp_free(struct sst_dsp *dsp)
>   	sst_ipc_fini(&skl->ipc);
>   	skl_ipc_int_disable(dsp);
>   
> -	free_irq(dsp->irq, dsp);
>   	skl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
>   }
>   EXPORT_SYMBOL_GPL(skl_dsp_free);
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index 72ee3d8a1d7d..e55523826346 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -622,7 +622,7 @@ void skl_sst_dsp_cleanup(struct skl_dev *skl)
>   	skl_clear_module_table(dsp);
>   
>   	skl_freeup_uuid_list(skl);
> -	dsp->ops->free(dsp);
> +	sst_dsp_free(dsp);
>   
>   	if (skl->boot_complete && dsp->cl_dev.bufsize) {
>   		dsp->cl_dev.ops.cl_cleanup_controller(dsp);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
