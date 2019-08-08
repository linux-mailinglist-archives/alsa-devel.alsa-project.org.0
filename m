Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D67864D8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87096166A;
	Thu,  8 Aug 2019 16:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87096166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565275955;
	bh=6/kgq2i+4hXKSAq6g71NBdlKEfgDQmyhdFDdnMEfZG4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lc1DgbiyqntdKas0WCOibZNGnZ6YWYauvXfqEykbjH2bjgWZgZZOV7E6dS5S9nt3i
	 E2TBAPzwvMWpyMrHOkfcSQyXmMbNA5JlSxsOY8LDkVunQKMmEAkEUCvwYP22NJVdsf
	 nL+fsk5f1d0NKMHRTM6uusqsLdhee/Hrl0tyMv5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D805BF80535;
	Thu,  8 Aug 2019 16:50:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 867B6F804FF; Thu,  8 Aug 2019 16:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96F92F80534
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F92F80534
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 07:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="182614808"
Received: from spenceke-mobl1.amr.corp.intel.com (HELO [10.251.157.200])
 ([10.251.157.200])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2019 07:50:31 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190808102447.16639-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <17f3b2a4-35c1-3763-4d7d-7eec09230bfc@linux.intel.com>
Date: Thu, 8 Aug 2019 09:50:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808102447.16639-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v4 2/2] ASoC: Intel: Skylake:
 large_config_get overhaul
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

Thanks Cezary, the split makes it much easier to review. I have a couple 
of minor comments below, looks good otherwise.

On 8/8/19 5:24 AM, Cezary Rojewski wrote:
> LARGE_CONFIG_GET is mainly used to retrieve requested module parameters
> but it may also carry TX payload with them. Update its implementation to
> account for both TX and RX data.
> First reply.header carries total payload size within data_off_sizefield.
> Make use of reply.header to realloc returned buffer with correct size.
> 
> Failure of IPC request is permissive - error-payload may be returned, an
> informative data why GET for given param failed - and thus function
> should not collapse before entire processing is finished. Caller is
> responsible for checking returned payload and bytes parameters.

but that is the same as before, yes? this patch does not change the 
behavior on errors?

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/skl-messages.c |  3 ++-
>   sound/soc/intel/skylake/skl-sst-ipc.c  | 27 ++++++++++++++++++++------
>   sound/soc/intel/skylake/skl-sst-ipc.h  |  3 ++-
>   3 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
> index e8cc710f092b..84f0e6f58eb5 100644
> --- a/sound/soc/intel/skylake/skl-messages.c
> +++ b/sound/soc/intel/skylake/skl-messages.c
> @@ -1379,11 +1379,12 @@ int skl_get_module_params(struct skl_dev *skl, u32 *params, int size,
>   			  u32 param_id, struct skl_module_cfg *mcfg)
>   {
>   	struct skl_ipc_large_config_msg msg;
> +	size_t bytes = size;
>   
>   	msg.module_id = mcfg->id.module_id;
>   	msg.instance_id = mcfg->id.pvt_id;
>   	msg.param_data_size = size;
>   	msg.large_param_id = param_id;
>   
> -	return skl_ipc_get_large_config(&skl->ipc, &msg, params);
> +	return skl_ipc_get_large_config(&skl->ipc, &msg, &params, &bytes);
>   }
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
> index 196c80dadb1f..9d269a5f8bd9 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.c
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.c
> @@ -969,12 +969,18 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
>   EXPORT_SYMBOL_GPL(skl_ipc_set_large_config);
>   
>   int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
> -		struct skl_ipc_large_config_msg *msg, u32 *param)
> +		struct skl_ipc_large_config_msg *msg,
> +		unsigned int **payload, size_t *bytes)

is there a specific reason why we don't use e.g. u32 for the payload? 
u32 and u64 are used everywhere except here, is this intentional?

>   {
>   	struct skl_ipc_header header = {0};
> -	struct sst_ipc_message request = {0}, reply = {0};
> +	struct sst_ipc_message request, reply = {0};
> +	unsigned int *buf;
>   	int ret;
>   
> +	reply.data = kzalloc(SKL_ADSP_W1_SZ, GFP_KERNEL);
> +	if (!reply.data)
> +		return -ENOMEM;
> +
>   	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
>   	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
>   	header.primary |= IPC_GLB_TYPE(IPC_MOD_LARGE_CONFIG_GET);
> @@ -986,12 +992,21 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
>   	header.extension |= IPC_FINAL_BLOCK(1);
>   	header.extension |= IPC_INITIAL_BLOCK(1);
>   
> -	request.header = *(u64 *)(&header);
> -	reply.data = param;
> -	reply.size = msg->param_data_size;
> +	request.header = *(u64 *)&header;
> +	request.data = *payload;
> +	request.size = *bytes;
> +	reply.size = SKL_ADSP_W1_SZ;
> +
>   	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
>   	if (ret < 0)
> -		dev_err(ipc->dev, "ipc: get large config fail, err: %d\n", ret);
> +		dev_err(ipc->dev, "ipc: get large config fail: %d\n", ret);

nit-pick: cosmetic change unrelated to this patch.

> +
> +	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
> +	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +	*payload = buf;
> +	*bytes = reply.size;
>   
>   	return ret;
>   }
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
> index 93af08cf41d2..a7ab2c589cc5 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.h
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.h
> @@ -139,7 +139,8 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
>   		struct skl_ipc_large_config_msg *msg, u32 *param);
>   
>   int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
> -		struct skl_ipc_large_config_msg *msg, u32 *param);
> +		struct skl_ipc_large_config_msg *msg,
> +		unsigned int **payload, size_t *bytes);
>   
>   int skl_sst_ipc_load_library(struct sst_generic_ipc *ipc,
>   			u8 dma_id, u8 table_id, bool wait);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
