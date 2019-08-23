Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6C9B7C7
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3587E167A;
	Fri, 23 Aug 2019 22:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3587E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592927;
	bh=8MIA+/S/NwnCJXYL1OvkRBNwSCNrJYMZ6lLfDtkwu7g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7sdOYNRVU668AQMUPjPH/0IEmzUux+THMzaH3PrFZfmaHt6w77SSyE+DI3p5v5jN
	 8O6LNKWqxgMNJgQrLAAYZb2Z9nz6rdyWgnlqgXhTNYA/4bmrhDwIrThHsnJCMUpEVU
	 EeWrzXQFWNLoMP44tArfSroBkJGbf92Wi/fnjPVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B99F80737;
	Fri, 23 Aug 2019 22:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E708F805E2; Fri, 23 Aug 2019 22:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C43EF80610
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C43EF80610
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718257"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:26 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-34-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c90b4fb9-f12b-41f5-2e7d-da556dab880a@linux.intel.com>
Date: Fri, 23 Aug 2019 15:25:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-34-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 33/35] ASoC: Intel: Skylake: Privatize SST
 init handlers
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
> With initialization order repaired, sst_ops::init overloads can be
> privatized for Skylake platofmrs. Let's do so.

platforms

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/bxt-sst.c     | 25 ++++++++++++-------------
>   sound/soc/intel/skylake/cnl-sst-dsp.h |  2 --
>   sound/soc/intel/skylake/cnl-sst.c     | 25 ++++++++++++-------------
>   sound/soc/intel/skylake/skl-sst-dsp.h |  2 --
>   sound/soc/intel/skylake/skl-sst.c     | 23 +++++++++++------------
>   5 files changed, 35 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index 79728e418176..1edc38069615 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -533,18 +533,7 @@ static const struct skl_dsp_fw_ops bxt_fw_ops = {
>   	.load_library = bxt_load_library,
>   };
>   
> -struct sst_ops apl_sst_ops = {
> -	.irq_handler = skl_dsp_sst_interrupt,
> -	.thread_fn = skl_dsp_irq_thread_handler,
> -	.write = sst_shim32_write,
> -	.read = sst_shim32_read,
> -	.ram_read = sst_memcpy_fromio_32,
> -	.ram_write = sst_memcpy_toio_32,
> -	.init = bxt_sst_dsp_init,
> -	.free = skl_dsp_free,
> -};
> -
> -int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
> +static int bxt_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   {
>   	struct skl_dev *skl = sst->thread_context;
>   	void __iomem *mmio;
> @@ -578,7 +567,17 @@ int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(bxt_sst_dsp_init);
> +
> +struct sst_ops apl_sst_ops = {
> +	.irq_handler = skl_dsp_sst_interrupt,
> +	.thread_fn = skl_dsp_irq_thread_handler,
> +	.write = sst_shim32_write,
> +	.read = sst_shim32_read,
> +	.ram_read = sst_memcpy_fromio_32,
> +	.ram_write = sst_memcpy_toio_32,
> +	.init = bxt_sst_init,
> +	.free = skl_dsp_free,
> +};

should these structures be static if they are not exported?
sparse should tell you that: make -C 2

>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Intel Broxton IPC driver");
> diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
> index 7810ae11954a..a1ea242e9539 100644
> --- a/sound/soc/intel/skylake/cnl-sst-dsp.h
> +++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
> @@ -87,6 +87,4 @@ void cnl_ipc_op_int_enable(struct sst_dsp *ctx);
>   void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
>   bool cnl_ipc_int_status(struct sst_dsp *ctx);
>   
> -int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
> -
>   #endif /*__CNL_SST_DSP_H__*/
> diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
> index 58efeb6c8a8a..360e54d3c587 100644
> --- a/sound/soc/intel/skylake/cnl-sst.c
> +++ b/sound/soc/intel/skylake/cnl-sst.c
> @@ -409,18 +409,7 @@ static int cnl_ipc_init(struct device *dev, struct skl_dev *cnl)
>   	return 0;
>   }
>   
> -struct sst_ops cnl_sst_ops = {
> -	.irq_handler = cnl_dsp_sst_interrupt,
> -	.thread_fn = cnl_dsp_irq_thread_handler,
> -	.write = sst_shim32_write,
> -	.read = sst_shim32_read,
> -	.ram_read = sst_memcpy_fromio_32,
> -	.ram_write = sst_memcpy_toio_32,
> -	.init = cnl_sst_dsp_init,
> -	.free = cnl_dsp_free,
> -};
> -
> -int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
> +static int cnl_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   {
>   	struct skl_dev *cnl = sst->thread_context;
>   	void __iomem *mmio;
> @@ -449,7 +438,17 @@ int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(cnl_sst_dsp_init);
> +
> +struct sst_ops cnl_sst_ops = {
> +	.irq_handler = cnl_dsp_sst_interrupt,
> +	.thread_fn = cnl_dsp_irq_thread_handler,
> +	.write = sst_shim32_write,
> +	.read = sst_shim32_read,
> +	.ram_read = sst_memcpy_fromio_32,
> +	.ram_write = sst_memcpy_toio_32,
> +	.init = cnl_sst_init,
> +	.free = cnl_dsp_free,
> +};
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Intel Cannonlake IPC driver");
> diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
> index a3714b706b8e..3294826d5cf7 100644
> --- a/sound/soc/intel/skylake/skl-sst-dsp.h
> +++ b/sound/soc/intel/skylake/skl-sst-dsp.h
> @@ -206,8 +206,6 @@ int skl_dsp_get_core(struct sst_dsp *ctx, unsigned int core_id);
>   int skl_dsp_put_core(struct sst_dsp *ctx, unsigned int core_id);
>   
>   int skl_dsp_boot(struct sst_dsp *ctx);
> -int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
> -int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
>   int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
>   		int lib_count);
>   
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index 8e1d02e29a32..209f45e3d5d0 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -505,17 +505,7 @@ static const struct skl_dsp_fw_ops skl_fw_ops = {
>   	.unload_mod = skl_unload_module,
>   };
>   
> -struct sst_ops skl_sst_ops = {
> -	.irq_handler = skl_dsp_sst_interrupt,
> -	.write = sst_shim32_write,
> -	.read = sst_shim32_read,
> -	.ram_read = sst_memcpy_fromio_32,
> -	.ram_write = sst_memcpy_toio_32,
> -	.init = skl_sst_dsp_init,
> -	.free = skl_dsp_free,
> -};
> -
> -int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
> +static int skl_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   {
>   	struct skl_dev *skl = sst->thread_context;
>   	void __iomem *mmio;
> @@ -541,7 +531,16 @@ int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(skl_sst_dsp_init);
> +
> +struct sst_ops skl_sst_ops = {
> +	.irq_handler = skl_dsp_sst_interrupt,
> +	.write = sst_shim32_write,
> +	.read = sst_shim32_read,
> +	.ram_read = sst_memcpy_fromio_32,
> +	.ram_write = sst_memcpy_toio_32,
> +	.init = skl_sst_init,
> +	.free = skl_dsp_free,
> +};
>   
>   int skl_sst_init_fw(struct skl_dev *skl)
>   {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
