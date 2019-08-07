Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2BE8543B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 22:02:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4FD1667;
	Wed,  7 Aug 2019 22:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4FD1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565208147;
	bh=tDroYpgVID7AtHd6PxqK2+bhM78kw3cAX4qQlWlZ4Do=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G44RFAIAGpTv06AXT7eJTO5MoX/gMRBFhrBvrx6Ojv+tNK1l9EfMk67fjc7U1yBUi
	 GPqDlMrkDPoXCbply7VOWk5xbK1Fl0t1ROOad/QMrI8yFmh8XBVnQ/v6iPsdhmo8Mg
	 u1CyvcPLvaaJVHsAuYXFfxh6XYJSDmx4a3/Ae3Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8144F80290;
	Wed,  7 Aug 2019 22:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6597DF80290; Wed,  7 Aug 2019 22:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ACDBF800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 22:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ACDBF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 13:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="165455119"
Received: from mwdryfus-mobl.amr.corp.intel.com (HELO [10.254.191.107])
 ([10.254.191.107])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2019 13:00:32 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190807134745.1648-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4b0e1051-946b-ea7c-1e09-93e0825e5ac8@linux.intel.com>
Date: Wed, 7 Aug 2019 15:00:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807134745.1648-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v3] ASoC: Intel: Skylake:
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

I find this patch quite convoluted, so I ordered my comments to make 
them linear.

> LARGE_CONFIG_GET is among the most crucial IPCs. Host is expected to
> send single request first to obtain total payload size from received
> header's data_off_size. From then on, it loops for each frame exceeding
> inbox size until entire payload is read. If entire payload is contained
> within the very first frame, no looping is performed.

so there's got to be a test that defines if looping is required or not 
but see [1] below.

> 
> LARGE_CONFIG_GET is a flexible IPC, it not only receives payload but may
> carry one with them to provide list of params DSP module should return
> info for. This behavior is usually reserved for vendors and IPC handler
> should not touch that content. To achieve that, simply pass provided
> payload and bytes to sst_ipc_tx_message_wait as a part of request.

[2] And this has nothing to do with the loops,  does it?

> In current state, LARGE_CONFIG_GET message handler does nothing of that,
> in consequence making it dysfunctional. Overhaul said handler allowing
> rightful king of IPCs to return back on his throne - kingdom he shares
> with his twin brother: LARGE_CONFIG_SET.

[3] what is dysfunctional? the unnecessary loops or handling data in the 
IPC that should only be handled in vendor-specific parts. And btw I 
don't see vendor-specific parts in the Skylake driver, so not sure how 
those vendor-specific thingies are handled at all.

> The looping has not been added in this update as payloads of such size
> do not exist in practice. Will need to create custom module specifically
> for that very case and test against it before that feature can be added.

[1] here you are just saying that the looping is really not required so 
there are no tests at all...

[4] So shouldn't you split the two parts of this patch and separate 
looping from not touching the data that's vendor-specific?

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/skl-messages.c |  3 +-
>   sound/soc/intel/skylake/skl-sst-ipc.c  | 54 +++++++++++---------------
>   sound/soc/intel/skylake/skl-sst-ipc.h  |  3 +-
>   3 files changed, 27 insertions(+), 33 deletions(-)
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
> index a2b69a02aab2..9d269a5f8bd9 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.c
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.c
> @@ -969,12 +969,17 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
>   EXPORT_SYMBOL_GPL(skl_ipc_set_large_config);
>   
>   int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
> -		struct skl_ipc_large_config_msg *msg, u32 *param)
> +		struct skl_ipc_large_config_msg *msg,
> +		unsigned int **payload, size_t *bytes)
>   {
>   	struct skl_ipc_header header = {0};
> -	struct sst_ipc_message request = {0}, reply = {0};
> -	int ret = 0;
> -	size_t sz_remaining, rx_size, data_offset;
> +	struct sst_ipc_message request, reply = {0};
> +	unsigned int *buf;
> +	int ret;
> +
> +	reply.data = kzalloc(SKL_ADSP_W1_SZ, GFP_KERNEL);
> +	if (!reply.data)
> +		return -ENOMEM;
>   
>   	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
>   	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
> @@ -987,34 +992,21 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
>   	header.extension |= IPC_FINAL_BLOCK(1);
>   	header.extension |= IPC_INITIAL_BLOCK(1);
>   
> -	sz_remaining = msg->param_data_size;
> -	data_offset = 0;
> -
> -	while (sz_remaining != 0) {
> -		rx_size = sz_remaining > SKL_ADSP_W1_SZ
> -				? SKL_ADSP_W1_SZ : sz_remaining;
> -		if (rx_size == sz_remaining)
> -			header.extension |= IPC_FINAL_BLOCK(1);
> -
> -		request.header = *(u64 *)(&header);
> -		reply.data = ((char *)param) + data_offset;
> -		reply.size = msg->param_data_size;
> -		ret = sst_ipc_tx_message_wait(ipc, request, &reply);
> -		if (ret < 0) {
> -			dev_err(ipc->dev,
> -				"ipc: get large config fail, err: %d\n", ret);
> -			return ret;
> -		}
> -		sz_remaining -= rx_size;
> -		data_offset = msg->param_data_size - sz_remaining;
> +	request.header = *(u64 *)&header;
> +	request.data = *payload;
> +	request.size = *bytes;
> +	reply.size = SKL_ADSP_W1_SZ;
>   
> -		/* clear the fields */
> -		header.extension &= IPC_INITIAL_BLOCK_CLEAR;
> -		header.extension &= IPC_DATA_OFFSET_SZ_CLEAR;
> -		/* fill the fields */
> -		header.extension |= IPC_INITIAL_BLOCK(1);
> -		header.extension |= IPC_DATA_OFFSET_SZ(data_offset);
> -	}
> +	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
> +	if (ret < 0)
> +		dev_err(ipc->dev, "ipc: get large config fail: %d\n", ret);
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
