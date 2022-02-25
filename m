Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC14C5036
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269931FA5;
	Fri, 25 Feb 2022 21:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269931FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822601;
	bh=81YUSMtoE3CseyFJ+850t7/l7y2zBQ1FtsOSaHCnc+I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bi86wsDY+CfXzCMOwEyfJ/GespdXSd1PPCNzjkQSUEBQSlsCVS5nR9YqEVwfjTJu8
	 eJnt4o4DwY/hDbUQqOSt6Aa+6G5UnE/moppADmXM9IhuV1kd/1EkqO2zythdixfvYH
	 DswBIyAC3VZGp7S3uaxdR/pXT6cfbcZAeIS9xIms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90ABFF80542;
	Fri, 25 Feb 2022 21:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB06F80528; Fri, 25 Feb 2022 21:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4831F80132
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4831F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TTqY89Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822360; x=1677358360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=81YUSMtoE3CseyFJ+850t7/l7y2zBQ1FtsOSaHCnc+I=;
 b=TTqY89Gyb2o4IDCnMjDP5RDI7fVH5EnPvGB8tFQ2UruQM53NxhJnDQ/O
 Op7ndlOyo5rAf+8U+H6+zPN5JoAXtO/O9QlO2psdpj1lDoTC4KFIWXY+S
 x5J+moM7fa0N/u0BJMfjrVAmIX71GX7+WykL1wc4k2lelu8ucueF5LVVI
 YBOwyd3IeyqBSLKtCM42mbx5U/uzuRGK+pJUuu9jiaUBhEieRVleMlXb+
 Y9qh8jwrh4NzueQKNEYZmXvb1guefMPMwC7eyFc48RC6fD/DuF0Rpf/h5
 ge6H7MQtvHrk61n11aLTX5PFJma86XUA0xJxqBl5hGKIUKuZ9+hypH7VC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296136"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296136"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520582"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:38 -0800
Message-ID: <49fcc185-f954-1811-729f-5969fcb68125@linux.intel.com>
Date: Fri, 25 Feb 2022 13:42:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 10/13] ASoC: Intel: avs: Path state management
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-11-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-11-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/7/22 07:25, Cezary Rojewski wrote:
> Add functions to ease with state changing of all objects found in the
> path. Each represents either a BIND/UNBIND or SET_PIPEPILE_STATE IPC.

SET_PIPELINE?

> DSP pipelines follow simple state machine scheme:
> CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE>
> There is no STOP, PAUSE serves that purpose instead.

that's not fully correct, the STOP can be handled in two steps due to
DMA programming flows.

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/path.c | 130 +++++++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/path.h |   5 ++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> index 272d868bedc9..c6db3f091e66 100644
> --- a/sound/soc/intel/avs/path.c
> +++ b/sound/soc/intel/avs/path.c
> @@ -285,3 +285,133 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
>  
>  	return path;
>  }
> +
> +int avs_path_bind(struct avs_path *path)
> +{
> +	struct avs_path_pipeline *ppl;
> +	struct avs_dev *adev = path->owner;
> +	int ret;
> +
> +	list_for_each_entry(ppl, &path->ppl_list, node) {
> +		struct avs_path_binding *binding;
> +
> +		list_for_each_entry(binding, &ppl->binding_list, node) {
> +			struct avs_path_module *source, *sink;
> +
> +			source = binding->source;
> +			sink = binding->sink;
> +
> +			ret = avs_ipc_bind(adev, source->module_id,
> +					   source->instance_id, sink->module_id,
> +					   sink->instance_id, binding->sink_pin,
> +					   binding->source_pin);
> +			if (ret) {
> +				dev_err(adev->dev, "bind path failed: %d\n", ret);
> +				return AVS_IPC_RET(ret);

so what happens for all the previously bound path?

Is there an error-unwinding loop somewhere?

> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_path_unbind(struct avs_path *path)
> +{
> +	struct avs_path_pipeline *ppl;
> +	struct avs_dev *adev = path->owner;
> +	int ret;
> +
> +	list_for_each_entry(ppl, &path->ppl_list, node) {
> +		struct avs_path_binding *binding;
> +
> +		list_for_each_entry(binding, &ppl->binding_list, node) {
> +			struct avs_path_module *source, *sink;
> +
> +			source = binding->source;
> +			sink = binding->sink;
> +
> +			ret = avs_ipc_unbind(adev, source->module_id,
> +					     source->instance_id, sink->module_id,
> +					     sink->instance_id, binding->sink_pin,
> +					     binding->source_pin);
> +			if (ret) {
> +				dev_err(adev->dev, "unbind path failed: %d\n", ret);
> +				return AVS_IPC_RET(ret);

what happens then? reboot?

> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_path_reset(struct avs_path *path)
> +{
> +	struct avs_path_pipeline *ppl;
> +	struct avs_dev *adev = path->owner;
> +	int ret;
> +
> +	if (path->state == AVS_PPL_STATE_RESET)
> +		return 0;
> +
> +	list_for_each_entry(ppl, &path->ppl_list, node) {
> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
> +						 AVS_PPL_STATE_RESET);
> +		if (ret) {
> +			dev_err(adev->dev, "reset path failed: %d\n", ret);
> +			path->state = AVS_PPL_STATE_INVALID;
> +			return AVS_IPC_RET(ret);
> +		}
> +	}
> +
> +	path->state = AVS_PPL_STATE_RESET;
> +	return 0;
> +}
> +
> +int avs_path_pause(struct avs_path *path)
> +{
> +	struct avs_path_pipeline *ppl;
> +	struct avs_dev *adev = path->owner;
> +	int ret;
> +
> +	if (path->state == AVS_PPL_STATE_PAUSED)
> +		return 0;
> +
> +	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {

does the order actually matter?

> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
> +						 AVS_PPL_STATE_PAUSED);
> +		if (ret) {
> +			dev_err(adev->dev, "pause path failed: %d\n", ret);
> +			path->state = AVS_PPL_STATE_INVALID;
> +			return AVS_IPC_RET(ret);
> +		}
> +	}
> +
> +	path->state = AVS_PPL_STATE_PAUSED;
> +	return 0;
> +}

it looks like you could use a helper since the flows are identical.

> +
> +int avs_path_run(struct avs_path *path, int trigger)
> +{
> +	struct avs_path_pipeline *ppl;
> +	struct avs_dev *adev = path->owner;
> +	int ret;
> +
> +	if (path->state == AVS_PPL_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
> +		return 0;
> +
> +	list_for_each_entry(ppl, &path->ppl_list, node) {
> +		if (ppl->template->cfg->trigger != trigger)
> +			continue;
> +
> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
> +						 AVS_PPL_STATE_RUNNING);
> +		if (ret) {
> +			dev_err(adev->dev, "run path failed: %d\n", ret);
> +			path->state = AVS_PPL_STATE_INVALID;
> +			return AVS_IPC_RET(ret);
> +		}
> +	}
> +
> +	path->state = AVS_PPL_STATE_RUNNING;
> +	return 0;
> +}
> diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
> index 3843e5a062a1..04a06473f04b 100644
> --- a/sound/soc/intel/avs/path.h
> +++ b/sound/soc/intel/avs/path.h
> @@ -62,5 +62,10 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
>  				 struct avs_tplg_path_template *template,
>  				 struct snd_pcm_hw_params *fe_params,
>  				 struct snd_pcm_hw_params *be_params);
> +int avs_path_bind(struct avs_path *path);
> +int avs_path_unbind(struct avs_path *path);
> +int avs_path_reset(struct avs_path *path);
> +int avs_path_pause(struct avs_path *path);
> +int avs_path_run(struct avs_path *path, int trigger);
>  
>  #endif
