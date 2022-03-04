Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A024CD904
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E401B39;
	Fri,  4 Mar 2022 17:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E401B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646410974;
	bh=K1UErz7SjdQP8GlBttDBpZ/LrQfLpd4Xa0nf6YaJNaQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJUMyVZ/v+lC2r7Z2vzLOvhyPG3BAov1v5daj6wW1/LMoZSo7DFPjzAuiz/fZtiz5
	 K71QUPCl6TgjECpAqP/uI9C6eA8EId+G6odRCRdTRoQtxFsiDHKHuQRU0PCazPj+xQ
	 ZmqO0XGFiBDo5MVa+rTeyoH7WwXaBmrZf8GXRsDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1465FF801F5;
	Fri,  4 Mar 2022 17:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0243EF801EC; Fri,  4 Mar 2022 17:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E009F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E009F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nSrBHsSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646410899; x=1677946899;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1UErz7SjdQP8GlBttDBpZ/LrQfLpd4Xa0nf6YaJNaQ=;
 b=nSrBHsSM7XrFAqwdH3kmaRg6mvNBbdTYOVyUkOI2HpKLnTlg2akE7lp2
 uquQzou7xyN/J7i26b5EctW8WGudTs8sHwkzZAIi6IjXSpl2Y79mML+fh
 6B7g2WmyVQtfKbgRWH1r6Wr6O1Snv8rbIZbazwIeLTtAh60PtcsNeAEqA
 o8g+26q31D+lGsPqgJj8S8VG5L3Q52GWXw7ip/MLBCHCrU5fGSUjityqt
 ZfGGbPDsHV0rXtlTeQL3rY6b6pl2ttPbSMYaK03mdZk/hHteEc4HfslkL
 iUlXoxhmYZSqbJCWnYEb0RYp4MlSFF+6APiPecAMx6W1jMfcwUvOZR2LR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233967025"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233967025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:21:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="686914823"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:21:35 -0800
Message-ID: <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:21:35 -0800
In-Reply-To: <20220304145755.2844173-8-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Firmware modules implement processing algorithms. Their lifecycle,
> similarly to pipelines is being controlled by IPCs: initialization,
> deletion and (un)binding.
> 
> Modules can be configured at runtime - runtime parameters. This is
> done
> with help of LARGE_CONFIG IPCs: getter and setter.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/ipc.c      |   8 +-
>  sound/soc/intel/avs/messages.c | 262
> +++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h |  53 +++++++
>  3 files changed, 322 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
> index c0722f8b195f..9770368a898e 100644
> --- a/sound/soc/intel/avs/ipc.c
> +++ b/sound/soc/intel/avs/ipc.c
> @@ -21,9 +21,15 @@ static void avs_dsp_receive_rx(struct avs_dev
> *adev, u64 header)
>  
>  	ipc->rx.header = header;
>  	/* Abort copying payload if request processing was
> unsuccessful. */
> -	if (!msg.status)
> +	if (!msg.status) {
> +		/* update size in case of LARGE_CONFIG_GET */
> +		if (msg.msg_target == AVS_MOD_MSG &&
> +		    msg.global_msg_type == AVS_MOD_LARGE_CONFIG_GET)
> +			ipc->rx.size =
> msg.ext.large_config.data_off_size;
> +
>  		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
>  			      ipc->rx.size);
> +	}
>  }
>  
>  static void avs_dsp_process_notification(struct avs_dev *adev, u64
> header)
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index de2d50f8c6b4..613c9452226d 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -6,6 +6,7 @@
>  //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
>  //
>  
> +#include <linux/slab.h>
>  #include "avs.h"
>  #include "messages.h"
>  
> @@ -139,3 +140,264 @@ int avs_ipc_get_pipeline_state(struct avs_dev
> *adev, u8 instance_id,
>  	*state = reply.rsp.ext.get_ppl_state.state;
>  	return ret;
>  }
> +
> +/*
> + * avs_ipc_init_instance - Initialize module instance
> + *
> + * @adev: Driver context
> + * @module_id: Module-type id
> + * @instance_id: Unique module instance id
> + * @ppl_id: Parent pipeline id
> + * @core_id: DSP core to allocate module on
> + * @domain: Processing domain (low latency or data processing)
> + * @param: Module-type specific configuration
> + * @param_size: Size of @param in bytes
> + *
> + * Argument verification, as well as pipeline state checks are done
> by the
> + * firmware.
> + *
> + * Note: @ppl_id and @core_id are independent of each other as
> single pipeline
> + * can be composed of module instances located on different DSP
> cores.
> + */
> +int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8
> instance_id,
> +			  u8 ppl_id, u8 core_id, u8 domain,
> +			  void *param, u32 param_size)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
> +	struct avs_ipc_msg request;
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	/* firmware expects size provided in dwords */
> +	msg.ext.init_instance.param_block_size =
> +			DIV_ROUND_UP(param_size, sizeof(u32));
> +	msg.ext.init_instance.ppl_instance_id = ppl_id;
> +	msg.ext.init_instance.core_id = core_id;
> +	msg.ext.init_instance.proc_domain = domain;
> +
> +	request.header = msg.val;
> +	request.data = param;
> +	request.size = param_size;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "init instance", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * avs_ipc_delete_instance - Delete module instance
> + *
> + * @adev: Driver context
> + * @module_id: Module-type id
> + * @instance_id: Unique module instance id
> + *
> + * Argument verification, as well as pipeline state checks are done
> by the
> + * firmware.
> + *
> + * Note: only standalone modules i.e. without a parent pipeline
> shall be
> + * deleted using this IPC message. In all other cases, pipeline
> owning the
> + * modules peforms cleanup automatically when it is deleted.
Can you please provide an example of such stand-alone modules? If they
aren't part of any pipeline, how do they get scheduled?

> + */
> +int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8
> instance_id)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "delete instance", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * avs_ipc_bind - Bind two module instances
> + *
> + * @adev: Driver context
> + * @module_id: Source module-type id
> + * @instance_id: Source module instance id
> + * @dst_module_id: Sink module-type id
> + * @dst_instance_id: Sink module instance id
> + * @dst_queue: Sink module pin to bind @src_queue with
> + * @src_queue: Source module pin to bind @dst_queue with
> + */
> +int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8
> instance_id,
> +		 u16 dst_module_id, u8 dst_instance_id,
> +		 u8 dst_queue, u8 src_queue)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(BIND);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	msg.ext.bind_unbind.dst_module_id = dst_module_id;
> +	msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
> +	msg.ext.bind_unbind.dst_queue = dst_queue;
> +	msg.ext.bind_unbind.src_queue = src_queue;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "bind modules", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * avs_ipc_unbind - Unbind two module instances
> + *
> + * @adev: Driver context
> + * @module_id: Source module-type id
> + * @instance_id: Source module instance id
> + * @dst_module_id: Sink module-type id
> + * @dst_instance_id: Sink module instance id
> + * @dst_queue: Sink module pin to unbind @src_queue from
> + * @src_queue: Source module pin to unbind @dst_queue from
> + */
Are there any rules for unbinding? For example if you have 2 modules
connected to a mixer? Can you unbind the module belonging to the host
pipeline that is getting stopped while the mixer is still active?

> +int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8
> instance_id,
> +		   u16 dst_module_id, u8 dst_instance_id,
> +		   u8 dst_queue, u8 src_queue)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(UNBIND);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	msg.ext.bind_unbind.dst_module_id = dst_module_id;
> +	msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
> +	msg.ext.bind_unbind.dst_queue = dst_queue;
> +	msg.ext.bind_unbind.src_queue = src_queue;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "unbind modules", ret);
> +
> +	return ret;
> +}
> +
> +static int __avs_ipc_set_large_config(struct avs_dev *adev, u16
> module_id, u8 instance_id,
> +				      u8 param_id, bool init_block,
> bool final_block,
> +				      u8 *request_data, size_t
> request_size, size_t off_size)
> +{
> +	union avs_module_msg msg =
> AVS_MODULE_REQUEST(LARGE_CONFIG_SET);
> +	struct avs_ipc_msg request;
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	msg.ext.large_config.data_off_size = off_size;
> +	msg.ext.large_config.large_param_id = param_id;
> +	msg.ext.large_config.final_block = final_block;
> +	msg.ext.large_config.init_block = init_block;
> +
> +	request.header = msg.val;
> +	request.data = request_data;
> +	request.size = request_size;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "large config set", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id,
> +			     u8 instance_id, u8 param_id,
> +			     u8 *request, size_t request_size)
> +{
> +	size_t remaining, tx_size;
> +	bool final;
> +	int ret;
> +
> +	remaining = request_size;
> +	tx_size = min_t(size_t, AVS_MAILBOX_SIZE, remaining);
> +	final = (tx_size == remaining);
> +
> +	/* Initial request states total payload size. */
> +	ret = __avs_ipc_set_large_config(adev, module_id, instance_id,
> +					 param_id, 1, final, request,
> tx_size,
> +					 request_size);
> +	if (ret)
> +		return ret;
> +
> +	remaining -= tx_size;
> +
> +	/* Loop the rest only when payload exceeds mailbox's size. */
> +	while (remaining) {
> +		size_t offset;
> +
> +		offset = request_size - remaining;
> +		tx_size = min_t(size_t, AVS_MAILBOX_SIZE, remaining);
> +		final = (tx_size == remaining);
> +
> +		ret = __avs_ipc_set_large_config(adev, module_id,
> instance_id,
> +						 param_id, 0, final,
> +						 request + offset,
> tx_size,
> +						 offset);
> +		if (ret)
> +			return ret;
> +
> +		remaining -= tx_size;
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8
> instance_id,
> +			     u8 param_id, u8 *request_data, size_t
> request_size,
> +			     u8 **reply_data, size_t *reply_size)
> +{
> +	union avs_module_msg msg =
> AVS_MODULE_REQUEST(LARGE_CONFIG_GET);
> +	struct avs_ipc_msg request;
> +	struct avs_ipc_msg reply = {{0}};
> +	size_t size;
> +	void *buf;
> +	int ret;
> +
> +	reply.data = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
> +	if (!reply.data)
> +		return -ENOMEM;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	msg.ext.large_config.data_off_size = request_size;
> +	msg.ext.large_config.large_param_id = param_id;
> +	/* final_block is always 0 on request. Updated by fw on reply.
> */
> +	msg.ext.large_config.final_block = 0;
> +	msg.ext.large_config.init_block = 1;
> +
> +	request.header = msg.val;
> +	request.data = request_data;
> +	request.size = request_size;
> +	reply.size = AVS_MAILBOX_SIZE;
> +
> +	ret = avs_dsp_send_msg(adev, &request, &reply);
> +	if (ret) {
> +		avs_ipc_err(adev, &request, "large config get", ret);
> +		kfree(reply.data);
> +		return ret;
> +	}
How come you dont have a loop here? What if the rec'd data size if
larger than the max size of IP payload?
Thanks,Ranjani

