Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44ED3DF02F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 16:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C63918C0;
	Tue,  3 Aug 2021 16:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C63918C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628000555;
	bh=FmkiUqPEeBOoW3T1Y0pOnGZPS1Nl65AYbuhtZC5Djzs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKW/gLVPu9Lx1uI6A1VRMRJjBYlgI93Ix07VjBa3C7EjLUHXPJ89v+uguA7oibI5D
	 XWXCdYBxYCE6W28Yd9UIx1a32Hw0FdUBbsmB2eCE51l5xSEoTXnFkl6MxjZ/yt3vb+
	 /oV+kH25gyaxt/j/l+yxQuu2HuV3L9iJCvIxMs3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C93F804E1;
	Tue,  3 Aug 2021 16:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18283F804D8; Tue,  3 Aug 2021 16:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C984F8016D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 16:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C984F8016D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200891499"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="200891499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:21:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="521269339"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.77])
 ([10.237.180.77])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:21:03 -0700
Subject: Re: [PATCH v3 16/20] ASoC: qdsp6: audioreach: add topology support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-17-srinivas.kandagatla@linaro.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <05f85ed8-01ce-632b-c744-3fe8995bd17a@linux.intel.com>
Date: Tue, 3 Aug 2021 16:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803125411.28066-17-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

On 8/3/2021 2:54 PM, Srinivas Kandagatla wrote:
> Add ASoC topology support in audioreach
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

...

> +
> +/* DAI Tokens */
> +#define AR_TKN_DAI_INDEX			1
> +/* SUB GRAPH Tokens */
> +#define AR_TKN_U32_SUB_GRAPH_INSTANCE_ID	2
> +#define AR_TKN_U32_SUB_GRAPH_PERF_MODE		3
> +#define AR_TKN_U32_SUB_GRAPH_DIRECTION		4
> +#define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID	5
> +
> +/* Container Tokens */
> +#define AR_TKN_U32_CONAINER_INSTANCE_ID		100
> +#define AR_TKN_U32_CONAINER_CAPABILITY_ID	101
> +#define AR_TKN_U32_CONAINER_STACK_SIZE		102
> +#define AR_TKN_U32_CONAINER_GRAPH_POS		103
> +#define AR_TKN_U32_CONAINER_PROC_DOMAIN		104

typo in all of the above and in comment documenting them
AR_TKN_U32_CONTAINER_ *


>   #define APM_AUDIO_DRV_NAME "q6apm-audio"
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> new file mode 100644
> index 000000000000..409e19486d57
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -0,0 +1,1114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020, Linaro Limited
> +
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/pcm.h>
> +#include <sound/control.h>
> +#include <sound/asound.h>
> +#include <linux/firmware.h>
> +#include <sound/soc-topology.h>
> +#include <sound/soc-dpcm.h>
> +#include <uapi/sound/snd_ar_tokens.h>
> +#include <linux/kernel.h>
> +#include <linux/wait.h>
> +#include "q6apm.h"
> +#include "audioreach.h"
> +
> +struct snd_ar_control {
> +	u32 sgid; /* Sub Graph ID */
> +	struct snd_soc_component *scomp;
> +};
> +
> +static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(
> +					struct q6apm *apm, uint32_t graph_id,
> +					bool *found)
> +{
> +	struct audioreach_graph_info *info;
> +	int ret;
> +
> +	spin_lock(&apm->lock);
> +	info = idr_find(&apm->graph_info_idr, graph_id);
> +	spin_unlock(&apm->lock);
> +
> +	if (info) {
> +		*found = true;
> +		return info;
> +	}
> +
> +	*found = false;
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +
> +
> +	INIT_LIST_HEAD(&info->sg_list);
> +	spin_lock_init(&info->sg_list_lock);
> +
> +	spin_lock(&apm->lock);
> +	ret = idr_alloc(&apm->graph_info_idr, info, graph_id,
> +			graph_id + 1, GFP_ATOMIC);
> +	spin_unlock(&apm->lock);
> +
> +	if (ret < 0) {
> +		dev_err(apm->dev, "Failed to allocate Graph ID (%x)\n", graph_id);
> +		return ERR_PTR(ret);
> +	}
need to free info here?

> +
> +	info->id = ret;
> +
> +	return info;
> +}
> +
> +static void audioreach_tplg_add_sub_graph(struct audioreach_sub_graph *sg,
> +					  struct audioreach_graph_info *info)
> +{
> +	list_add_tail(&sg->node, &info->sg_list);
> +	sg->info = info;
> +	info->num_sub_graphs++;
> +}
> +
> +
> +static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(
> +						struct q6apm *apm,
> +						uint32_t sub_graph_id,
> +						bool *found)
> +{
> +	struct audioreach_sub_graph *sg = NULL;
> +	int ret;
> +
> +	if (!sub_graph_id)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Find if there is already a matching sub-graph */
> +	spin_lock(&apm->lock);
> +	sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
> +	spin_unlock(&apm->lock);
> +
> +
> +	if (sg) {
> +		*found = true;
> +		return sg;
> +	}
> +
> +	*found = false;
> +	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
> +	if (!sg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&sg->container_list);
> +
> +	spin_lock(&apm->lock);
> +	ret = idr_alloc(&apm->sub_graphs_idr, sg, sub_graph_id,
> +			sub_graph_id + 1, GFP_ATOMIC);
> +	spin_unlock(&apm->lock);
> +
> +	if (ret < 0) {
> +		dev_err(apm->dev,
> +			"Failed to allocate Sub-Graph Instance ID (%x)\n",
> +			sub_graph_id);
> +		return ERR_PTR(ret);
> +	}
need to free sg here?

> +
> +	sg->sub_graph_id = ret;
> +
> +	return sg;
> +}
> +
> +static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm *apm,
> +						struct audioreach_sub_graph *sg,
> +						uint32_t container_id,
> +						bool *found)
> +{
> +	struct audioreach_container *cont = NULL;
> +	int ret;
> +
> +	if (!container_id)
> +		return ERR_PTR(-EINVAL);
> +
> +	spin_lock(&apm->lock);
> +	cont = idr_find(&apm->containers_idr, container_id);
> +	spin_unlock(&apm->lock);
> +
> +	if (cont) {
> +		*found = true;
> +		return cont;
> +	}
> +	*found = false;
> +
> +	cont = kzalloc(sizeof(*cont), GFP_KERNEL);
> +	if (!cont)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&cont->modules_list);
> +
> +	spin_lock(&apm->lock);
> +	ret = idr_alloc(&apm->containers_idr, cont, container_id,
> +				container_id + 1, GFP_ATOMIC);
> +	spin_unlock(&apm->lock);
> +
> +	if (ret < 0) {
> +		dev_err(apm->dev,
> +			"Failed to allocate Container Instance ID (%x)\n",
> +			container_id);
> +		return ERR_PTR(ret);
> +	}
need to free cont here?
> +
> +	cont->container_id = ret;
> +	cont->sub_graph = sg;
> +	/* add to container list */
> +	list_add_tail(&cont->node, &sg->container_list);
> +	sg->num_containers++;
> +
> +	return cont;
> +}
> +
> +static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
> +					struct audioreach_container *cont,
> +					struct snd_soc_dapm_widget *w,
> +					uint32_t module_id,
> +					bool *found)
> +{
> +	struct audioreach_module *mod;
> +	int ret;
> +
> +	spin_lock(&apm->lock);
> +	mod = idr_find(&apm->modules_idr, module_id);
> +	spin_unlock(&apm->lock);
> +
> +	if (mod) {
> +		*found = true;
> +		return mod;
> +	}
> +	*found = false;
> +	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
> +	if (!mod)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock(&apm->lock);
> +	if (!module_id) { /* alloc module id dynamically */
> +		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_END,
> +				       GFP_ATOMIC);
> +	} else {
> +		ret = idr_alloc(&apm->modules_idr, mod, module_id,
> +			  module_id + 1, GFP_ATOMIC);
> +	}
> +	spin_unlock(&apm->lock);
> +
> +	if (ret < 0) {
> +		dev_err(apm->dev,
> +			"Failed to allocate Module Instance ID (%x)\n", module_id);
> +		return ERR_PTR(ret);
> +	}
need to free mod here?

> +
> +	mod->instance_id = ret;
> +	dev_err(apm->dev, "Module Instance ID (0x%08x) allocated\n", ret);
> +	/* add to module list */
> +	list_add_tail(&mod->node, &cont->modules_list);
> +	mod->container = cont;
> +	mod->widget = w;
> +	cont->num_modules++;
> +
> +	return mod;
> +}
> +

...

