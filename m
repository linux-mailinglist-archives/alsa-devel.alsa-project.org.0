Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9A413A5D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 20:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B16882A;
	Tue, 21 Sep 2021 20:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B16882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632250361;
	bh=2kBJA6AFBjtzwLw93LeL/fr2dixM1D6XI1htLZPiixo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBCdO8whCee9aYetK61nMfuTcxl/T6NPLYUm5HTVAD2MLVn0LSVAHiv7tlvXqH1AZ
	 hHkUvi6T6kzGiOXiTxQRbbxuuEfuUkshGKZZS0pBfzTgO7tXSJXZcyChWebfVwY4PH
	 V6PghSz/yyIDLrlSqlhYazqx56iDbRRpQSuEfbfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32987F804F3;
	Tue, 21 Sep 2021 20:50:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CFABF804A9; Tue, 21 Sep 2021 20:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0286F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 20:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0286F80124
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210521547"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="210521547"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:50:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512431749"
Received: from rudymgal-mobl1.amr.corp.intel.com (HELO [10.212.82.111])
 ([10.212.82.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:50:02 -0700
Subject: Re: [PATCH v7 18/22] ASoC: qdsp6: audioreach: add topology support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-19-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7021cdec-382b-faa9-cf6c-ee06edbf19a7@linux.intel.com>
Date: Tue, 21 Sep 2021 13:44:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921133709.4973-19-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
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


> +static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
> +							      struct audioreach_container *cont,
> +							      struct snd_soc_dapm_widget *w,
> +							      uint32_t module_id, bool *found)
> +{
> +	struct audioreach_module *mod;
> +	int ret;
> +
> +	mutex_lock(&apm->lock);
> +	mod = idr_find(&apm->modules_idr, module_id);
> +	mutex_unlock(&apm->lock);
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
> +	mutex_lock(&apm->lock);
> +	if (!module_id) { /* alloc module id dynamically */
> +		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
> +	} else {
> +		ret = idr_alloc(&apm->modules_idr, mod, module_id, module_id + 1, GFP_KERNEL);
> +	}
> +	mutex_unlock(&apm->lock);
> +
> +	if (ret < 0) {
> +		dev_err(apm->dev,
> +			"Failed to allocate Module Instance ID (%x)\n", module_id);
> +		kfree(mod);
> +		return ERR_PTR(ret);
> +	}
> +
> +	mod->instance_id = ret;
> +	dev_err(apm->dev, "Module Instance ID (0x%08x) allocated\n", ret);

dev_dbg?

> +	/* add to module list */
> +	list_add_tail(&mod->node, &cont->modules_list);
> +	mod->container = cont;
> +	mod->widget = w;
> +	cont->num_modules++;
> +
> +	return mod;
> +}

> +static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
> +						       struct snd_soc_tplg_private *private)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *sg_elem;
> +	struct snd_soc_tplg_vendor_array *sg_array;
> +	struct audioreach_graph_info *info = NULL;
> +	int graph_id, sub_graph_id, tkn_count = 0;
> +	struct audioreach_sub_graph *sg;
> +	bool found;
> +
> +	sg_array = audioreach_get_sg_array(private);
> +	sg_elem = sg_array->value;
> +
> +	while (tkn_count <= (le32_to_cpu(sg_array->num_elems) - 1)) {
> +		switch (le32_to_cpu(sg_elem->token)) {
> +		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
> +			sub_graph_id = le32_to_cpu(sg_elem->value);
> +			sg = audioreach_tplg_alloc_sub_graph(apm, sub_graph_id, &found);
> +			if (IS_ERR(sg)) {
> +				return sg;
> +			} else if (found) {
> +				/* Already parsed data for this sub-graph */
> +				return sg;
> +			}
> +			dev_err(apm->dev, "%s: New subgraph id : 0x%08x\n", __func__,
> +				sub_graph_id);

dev_dbg()

> +			break;
> +		case AR_TKN_DAI_INDEX:
> +			/* Sub graph is associated with predefined graph */
> +			graph_id = le32_to_cpu(sg_elem->value);
> +			info = audioreach_tplg_alloc_graph_info(apm, graph_id, &found);
> +			if (IS_ERR(info))
> +				return ERR_CAST(info);
> +			break;
> +		case AR_TKN_U32_SUB_GRAPH_PERF_MODE:
> +			sg->perf_mode = le32_to_cpu(sg_elem->value);
> +			break;
> +		case AR_TKN_U32_SUB_GRAPH_DIRECTION:
> +			sg->direction = le32_to_cpu(sg_elem->value);
> +			break;
> +		case AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:
> +			sg->scenario_id = le32_to_cpu(sg_elem->value);
> +			break;
> +		default:
> +			dev_err(apm->dev, "Not a valid token %d for graph\n",
> +				sg_elem->token);
> +			break;
> +
> +		}
> +		tkn_count++;
> +		sg_elem++;
> +	}
> +
> +	/* Sub graph is associated with predefined graph */
> +	if (info) {
> +		dev_err(apm->dev, "%s: adding subgraph id : 0x%08x -> %d\n", __func__,
> +		sub_graph_id, graph_id);

dev_dbg

> +
> +		audioreach_tplg_add_sub_graph(sg, info);
> +	}
> +
> +	return sg;
> +}
> +


> +static int audioreach_widget_ready(struct snd_soc_component *component,
> +				   int index, struct snd_soc_dapm_widget *w,
> +				   struct snd_soc_tplg_dapm_widget *tplg_w)
> +{
> +	switch (w->id) {
> +	case snd_soc_dapm_aif_in:
> +	case snd_soc_dapm_aif_out:
> +		audioreach_widget_load_buffer(component, index, w, tplg_w);
> +		break;
> +	case snd_soc_dapm_decoder:
> +	case snd_soc_dapm_encoder:
> +	case snd_soc_dapm_src:
> +		audioreach_widget_load_enc_dec_cnv(component, index, w, tplg_w);
> +		break;
> +	case snd_soc_dapm_buffer:
> +		audioreach_widget_load_buffer(component, index, w, tplg_w);
> +		break;
> +	case snd_soc_dapm_mixer:
> +		return audioreach_widget_load_mixer(component, index, w, tplg_w);
> +	case snd_soc_dapm_pga:
> +		return audioreach_widget_load_pga(component, index, w, tplg_w);
> +	case snd_soc_dapm_dai_link:
> +	case snd_soc_dapm_scheduler:
> +	case snd_soc_dapm_out_drv:
> +	default:
> +		dev_err(component->dev, "Widget type (0x%x) not yet supported\n", w->id);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +

spurious newline

> +static int audioreach_widget_unload(struct snd_soc_component *scomp,
> +				    struct snd_soc_dobj *dobj)
> +{
> +	struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
> +	struct q6apm *apm = dev_get_drvdata(scomp->dev);
> +	struct audioreach_container *cont;
> +	struct audioreach_module *mod;
> +
> +	mod = dobj->private;
> +	cont = mod->container;
> +
> +	if (w->id == snd_soc_dapm_mixer) {
> +		/* virtual widget */
> +		kfree(dobj->private);
> +		return 0;
> +	}
> +
> +	mutex_lock(&apm->lock);
> +	idr_remove(&apm->modules_idr, mod->instance_id);
> +	cont->num_modules--;
> +
> +	list_del(&mod->node);
> +	kfree(mod);
> +
> +	if (list_empty(&cont->modules_list)) { /* remove container */
> +		struct audioreach_sub_graph *sg = cont->sub_graph;
> +
> +		idr_remove(&apm->containers_idr, cont->container_id);
> +		list_del(&cont->node);
> +		sg->num_containers--;
> +		kfree(cont);
> +		if (list_empty(&sg->container_list)) { /* remove sg */
> +			struct audioreach_graph_info *info = sg->info;
> +
> +			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
> +			list_del(&sg->node);
> +			info->num_sub_graphs--;
> +			kfree(sg);
> +			if (list_empty(&info->sg_list)) { /* remove graph info */
> +				idr_remove(&apm->graph_info_idr, info->id);
> +				kfree(info);
> +			}
> +		}
> +	}

It's not very clear if the nested removes actually free-up everything?
You may want to add a comment on the hierarchy.

> +
> +	mutex_unlock(&apm->lock);
> +
> +	return 0;
> +}
> +

> +int audioreach_tplg_init(struct snd_soc_component *component)
> +{
> +	struct snd_soc_card *card = component->card;
> +	struct device *dev = component->dev;
> +	const struct firmware *fw;
> +	char tplg_fw_name[128];
> +	int ret;
> +
> +	/* Inline with Qualcomm UCM configs and linux-firmware path */
> +	snprintf(tplg_fw_name, sizeof(tplg_fw_name), "qcom/%s/%s-tplg.bin", card->driver_name,
> +		 card->name);

use kasprintf instead of fixed 128-char array?

Also you should use a qcom/audioreach/ prefix to possible interference
with other parts of qcom...

> +
> +	ret = request_firmware(&fw, tplg_fw_name, dev);
> +	if (ret < 0) {
> +		dev_info(dev, "loading %s failed %d, falling back to dfw-audioreach-tplg.bin\n",
> +			 tplg_fw_name, ret);
> +		/* default firmware */
> +		ret = request_firmware(&fw, "dfw-audioreach-tplg.bin", dev);
> +		if (ret < 0) {
> +			dev_err(dev, "tplg fw dfw-audioreach-tplg.bin load failed with %d\n", ret);

the dfw prefix isn't very helpful...Intel's example of "dfw_sst.bin" is
a historical reference, not something you should reuse.

> +			return ret;
> +		}
> +	}
> +
> +	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
> +	if (ret < 0) {
> +		dev_err(dev, "tplg component load failed%d\n", ret);
> +		ret = -EINVAL;
> +	}
> +
> +	release_firmware(fw);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(audioreach_tplg_init);
> 
