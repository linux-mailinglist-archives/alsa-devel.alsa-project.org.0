Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB29B7B3
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CA91674;
	Fri, 23 Aug 2019 22:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CA91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592402;
	bh=RAOdtkIeX5ByswKL2rlAMpx368PnHO66Z0e1yUpHXy4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmTnQJAh59+g8EMpr99x0MrpBGdCl8cnMPqFn22sbauf2ztbngILkNW9PwjBwhoA1
	 ZIcjQVGTGy7YE49Cp9pIGvlzdDAe7NJ6Vv4qqIVNB+dCNuxsD3J+eltXZt3fIZ/GVC
	 ifzsJHMw8ZC7NENRqLfwfL8BiQyuqbrdC8SLRS8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4225F80641;
	Fri, 23 Aug 2019 22:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D17F80612; Fri, 23 Aug 2019 22:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F061F8036B
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F061F8036B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718190"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:04 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-14-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <151a28a5-f531-bd17-fad6-d13f48f25873@linux.intel.com>
Date: Fri, 23 Aug 2019 14:09:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-14-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 13/35] ASoC: Intel: Skylake: Reuse
 sst_dsp_new
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
> skl_dsp_ctx_init is dumplication of sst_dsp_new and usage of such

typo: duplication.

> bypasses natural DSP framework's flow. Remove it and reuse sst_dsp_new
> constructor which invokes sst specific init internally so nothing is
> missed.
> 
> Skylake does not even define any sst_ops::init so portion of existing
> skl_dsp_ctx_init can be regarded as DEADCODE.

this is also hard to review, you have lines like

 > -	return skl_dsp_acquire_irq(sst);
 > +	return 0;

that seem like a different change than what is described here.

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/bxt-sst.c       |  2 +-
>   sound/soc/intel/skylake/cnl-sst.c       |  2 +-
>   sound/soc/intel/skylake/skl-sst-dsp.c   | 28 -------------------------
>   sound/soc/intel/skylake/skl-sst-dsp.h   |  2 --
>   sound/soc/intel/skylake/skl-sst-utils.c |  6 +++++-
>   sound/soc/intel/skylake/skl-sst.c       |  2 +-
>   6 files changed, 8 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index e3614acff34d..a8a2783f9b37 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -588,7 +588,7 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   	INIT_DELAYED_WORK(&skl->d0i3.work, bxt_set_dsp_D0i3);
>   	skl->d0i3.state = SKL_DSP_D0I3_NONE;
>   
> -	return skl_dsp_acquire_irq(sst);
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(bxt_sst_dsp_init);
>   
> diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
> index 84dc6b82831d..0b0337f6ebff 100644
> --- a/sound/soc/intel/skylake/cnl-sst.c
> +++ b/sound/soc/intel/skylake/cnl-sst.c
> @@ -460,7 +460,7 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   	cnl->boot_complete = false;
>   	init_waitqueue_head(&cnl->boot_wait);
>   
> -	return skl_dsp_acquire_irq(sst);
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(cnl_sst_dsp_init);
>   
> diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
> index 1c4ecbcd7db7..9d8eb1af4798 100644
> --- a/sound/soc/intel/skylake/skl-sst-dsp.c
> +++ b/sound/soc/intel/skylake/skl-sst-dsp.c
> @@ -418,34 +418,6 @@ int skl_dsp_sleep(struct sst_dsp *ctx)
>   }
>   EXPORT_SYMBOL_GPL(skl_dsp_sleep);
>   
> -struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
> -		struct sst_pdata *pdata, int irq)
> -{
> -	int ret;
> -	struct sst_dsp *sst;
> -
> -	sst = devm_kzalloc(dev, sizeof(*sst), GFP_KERNEL);
> -	if (sst == NULL)
> -		return NULL;
> -
> -	spin_lock_init(&sst->spinlock);
> -	mutex_init(&sst->mutex);
> -	sst->dev = dev;
> -	sst->pdata = pdata;
> -	sst->irq = irq;
> -	sst->ops = pdata->ops;
> -	sst->thread_context = pdata->dsp;
> -
> -	/* Initialise SST Audio DSP */
> -	if (sst->ops->init) {
> -		ret = sst->ops->init(sst, NULL);
> -		if (ret < 0)
> -			return NULL;
> -	}
> -
> -	return sst;
> -}
> -
>   int skl_dsp_acquire_irq(struct sst_dsp *sst)
>   {
>   	int ret;
> diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
> index ba37433e4efa..1d579d59de60 100644
> --- a/sound/soc/intel/skylake/skl-sst-dsp.h
> +++ b/sound/soc/intel/skylake/skl-sst-dsp.h
> @@ -196,8 +196,6 @@ int skl_cldma_prepare(struct sst_dsp *ctx);
>   int skl_cldma_wait_interruptible(struct sst_dsp *ctx);
>   
>   void skl_dsp_set_state_locked(struct sst_dsp *ctx, int state);
> -struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
> -		struct sst_pdata *pdata, int irq);
>   int skl_dsp_acquire_irq(struct sst_dsp *sst);
>   bool is_skl_dsp_running(struct sst_dsp *ctx);
>   
> diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
> index 9061a9b17ea0..8e03a10855c4 100644
> --- a/sound/soc/intel/skylake/skl-sst-utils.c
> +++ b/sound/soc/intel/skylake/skl-sst-utils.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/pci.h>
>   #include <linux/slab.h>
>   #include <linux/uuid.h>
>   #include "../common/sst-dsp.h"
> @@ -360,10 +361,13 @@ int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
>   	struct skl_dev *skl = *dsp;
>   	struct sst_dsp *sst;
>   
> +	pdata->id = skl->pci->device;
> +	pdata->irq = irq;
> +	pdata->resindex_dma_base = -1;
>   	skl->dev = dev;
>   	pdata->dsp = skl;
>   	INIT_LIST_HEAD(&skl->uuid_list);
> -	skl->dsp = skl_dsp_ctx_init(dev, pdata, irq);
> +	skl->dsp = sst_dsp_new(dev, pdata);
>   	if (!skl->dsp) {
>   		dev_err(skl->dev, "%s: no device\n", __func__);
>   		return -ENODEV;
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index e55523826346..6bb003add9e2 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -550,7 +550,7 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   
>   	sst->fw_ops = skl_fw_ops;
>   
> -	return skl_dsp_acquire_irq(sst);
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(skl_sst_dsp_init);
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
