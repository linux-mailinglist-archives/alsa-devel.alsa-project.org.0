Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13841401E5C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 18:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733391731;
	Mon,  6 Sep 2021 18:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733391731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630945933;
	bh=dyZJ7kWsiIBEWaLctLVyZ4x5Di86xxRZnmQBHaljV/w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIE6W2j98cmSNjpgKmpWnLgUavTogIXOew3f0h7jpcofpDm/8CUC0svyoGyxhOCvZ
	 InfIzK3M/vmrGc4sn40rIn4UH5U3BS37iDxpMXSQSHveeKrhyE7IetTwT8RrzO0jBr
	 FzuvvFT26b8QcWJhRhQZ4iVenoPa8J/Ztsyfv028=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1968F804FD;
	Mon,  6 Sep 2021 18:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF547F804FA; Mon,  6 Sep 2021 18:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E43F804F3
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 18:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E43F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YomIMTH2"
Received: by mail-wm1-x335.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso316040wmr.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iY3qdVaQmXsXvEP5fATLXAVn9OxzjPsHAwNGA3FfeYI=;
 b=YomIMTH2H3qpwa2K+7s2FaQsGsMkp3TUgW5Oih05btIBJJWmVZz+gmZsqIHdkCEsix
 A+UQo2jPj1Fs1HlJXCv4Xuy+753FXpBQOWxua2suZR/UeB8rrUJTxiSqtBrusAUqnKYs
 zRAsAHllEP69c3G11k9S3iN4gfMK2lne7i5MTZzTI3RYLsAMN24VB7XttAKVtTRhWH6u
 7NUizTh1Bby9JIM3p7nKtlzU2u4CmmnCgFngKieHx/KjSdohEA9XIGGZs4+aTg8AYM2R
 BmwYDDTTmpQ9ivMWxjjT+Taq1j5lut1I6Bz2yCh14gMxTOWP32ZMLFWYogYtRiIsmk9o
 64qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iY3qdVaQmXsXvEP5fATLXAVn9OxzjPsHAwNGA3FfeYI=;
 b=VjgGzVP2ivzgxdRYI7Q2fi8dtvMjmbHTYEBtZkhbpgNLR0GfroR9HMJ49hj2AWQcqk
 0lIO6t1taidWbcJxmUv6pcnmOarMhCJR1kVFHBnsW11uGGgVzIk2nehyGoPeuN2lyD6u
 Bt2hssxv0v06J2G0tyJL/MfwW03+4qniRCaJT2MiJTt5MArC0wPArJmc5Qx6QMK+BX9l
 +WSgUANp6SxvNKTkT85NG0sRHE7b+5dxXnvPyKdSFeLupWwJkiO091YmRaVQMeNRTKqu
 v/O3UPk88NgRqdbdd9do0ZskQRTkZ0rRwM2xiHBX/zZXedJbgyMp7D2RwbbpoDc9MxDf
 QjMw==
X-Gm-Message-State: AOAM531IXuLNXIZQwI5OJqGAu6+jug6fhvTTAFG7us+rf0h64Acoayxz
 GjoHr8LQChbMEBWQFTymbh2L8A==
X-Google-Smtp-Source: ABdhPJwFVVlq/+/NKqjIePSUwUg4IU0Pc3o1vJbMGQDoKjbzy2ZTCk9TZP00OxioWOCsjZuq0n/rxw==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr12282181wmk.17.1630945765929; 
 Mon, 06 Sep 2021 09:29:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id a6sm7910wmb.7.2021.09.06.09.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 09:29:25 -0700 (PDT)
Subject: Re: [PATCH v5 17/21] ASoC: qdsp6: audioreach: add topology support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-18-srinivas.kandagatla@linaro.org>
 <db7a4ab6-7015-25d8-c590-bcb637d1df1f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <da7a49eb-3549-ff5b-c1e6-70b196a227f1@linaro.org>
Date: Mon, 6 Sep 2021 17:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <db7a4ab6-7015-25d8-c590-bcb637d1df1f@linux.intel.com>
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

thanks Pierre for taking time to review the patches.

On 03/09/2021 16:31, Pierre-Louis Bossart wrote:
> 
> 
> 
>> +/**
>> + * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
>> + *
>> + * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:		Performance mode of subgraph
>> + *						APM_SUB_GRAPH_PERF_MODE_LOW_POWER = 1,
>> + *						APM_SUB_GRAPH_PERF_MODE_LOW_LATENCY = 2
>> + *
>> + * %AR_TKN_U32_SUB_GRAPH_DIRECTION:		Direction of subgraph
>> + *						APM_SUB_GRAPH_DIRECTION_TX = 1,
>> + *						APM_SUB_GRAPH_DIRECTION_RX = 2
> 
> can you have full-duplex? unclear how you would define the direction in
> the case of a voice call...


> 
>> + *
>> + * %AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:		Scenario ID for subgraph
>> + *						APM_SUB_GRAPH_SID_AUDIO_PLAYBACK = 1,
>> + *						APM_SUB_GRAPH_SID_AUDIO_RECORD = 2,
>> + *						APM_SUB_GRAPH_SID_VOICE_CALL = 3
>> + *
>> + * %AR_TKN_U32_CONTAINER_INSTANCE_ID:		Container Instance ID
>> + *
>> + * %AR_TKN_U32_CONTAINER_CAPABILITY_ID:		Container capability ID
>> + *						APM_CONTAINER_CAP_ID_PP = 1,
>> + *						APM_CONTAINER_CAP_ID_CD = 2,
>> + *						APM_CONTAINER_CAP_ID_EP = 3,
>> + *						APM_CONTAINER_CAP_ID_OLC = 4
> 
> Acronyms? PP, CD, EP, OLC?
> 
Post Processing, Compress/Decompress, Endpoint and Offload.
I will add some comments to make this more clear.

>> + *
>> + * %AR_TKN_U32_CONTAINER_STACK_SIZE:		Stack size in the container.
>> + *
>> + * %AR_TKN_U32_CONTAINER_GRAPH_POS:		Graph Position
>> + *						APM_CONT_GRAPH_POS_STREAM = 1,
>> + *						APM_CONT_GRAPH_POS_PER_STR_PER_DEV = 2,
>> + *						APM_CONT_GRAPH_POS_STR_DEV = 3,
>> + *						APM_CONT_GRAPH_POS_GLOBAL_DEV = 4
> 
> explain what this means?
This defines container's relative position in the graph. Containers 
provide scheduling context for the graph.

There is some documentation at 
https://source.codeaurora.org/quic/la/platform/vendor/opensource/arspf-headers/tree/apm_container_api.h

> 

>> + *
>> + * %AR_TKN_U32_CONTAINER_PROC_DOMAIN:		Processor domain of container
>> + *						APM_PROC_DOMAIN_ID_MDSP = 1,
>> + *						APM_PROC_DOMAIN_ID_ADSP = 2,
>> + *						APM_PROC_DOMAIN_ID_SDSP = 4,
>> + *						APM_PROC_DOMAIN_ID_CDSP = 5
> 
> what happened to 3, is it reserved/illegal?

As per 
https://source.codeaurora.org/quic/la/platform/vendor/opensource/arspf-headers/tree/apm_graph_properties.h
this is not defined. DSP commands will timeout if we try to run with 3 I 
guess.
> 
>> + *
>> + * %AR_TKN_U32_MODULE_ID:			Module ID
>> + *
>> + * %AR_TKN_U32_MODULE_INSTANCE_ID:		Module Instance ID.
>> + *
>> + * %AR_TKN_U32_MODULE_MAX_IP_PORTS:		Module maximum input ports
>> + *
>> + * %AR_TKN_U32_MODULE_MAX_OP_PORTS:		Module maximum output ports.
>> + *
>> + * %AR_TKN_U32_MODULE_IN_PORTS:			Number of in ports
>> + *
>> + * %AR_TKN_U32_MODULE_OUT_PORTS:		Number of out ports.
>> + *
>> + * %AR_TKN_U32_MODULE_SRC_OP_PORT_ID:		Source module output port ID
>> + *
>> + * %AR_TKN_U32_MODULE_DST_IN_PORT_ID:		Destination module input port ID
>> + *
>> + * %AR_TKN_U32_MODULE_HW_IF_IDX:		Interface index types for I2S/LPAIF
>> + *
>> + * %AR_TKN_U32_MODULE_HW_IF_TYPE:		Interface type
>> + *						LPAIF = 0,
>> + *						LPAIF_RXTX = 1,
>> + *						LPAIF_WSA = 2,
>> + *						LPAIF_VA = 3,
>> + *						LPAIF_AXI = 4
>> + *
>> + * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
>> + *						PCM_INTERLEAVED = 1,
>> + *						PCM_DEINTERLEAVED_PACKED = 2,
>> + *						PCM_DEINTERLEAVED_UNPACKED = 3
>> + *
>> + * %AR_TKN_U32_MODULE_FMT_DATA:			data format
>> + *						FIXED POINT = 1,
>> + *						IEC60958 PACKETIZED = 3,
>> + *						IEC60958 PACKETIZED NON LINEAR = 8,
>> + *						COMPR OVER PCM PACKETIZED = 7,
>> + *						IEC61937 PACKETIZED = 2,
> 
> isn't this precisely compressed over PCM?

These values are more specifically for I2S endpoint. 
(https://source.codeaurora.org/quic/la/platform/vendor/opensource/arspf-headers/tree/i2s_api.h#n232)

Am guessing that COMPR OVER PCM PACKETIZED mean audio stream formats 
other than IEC60958/61937, If you are keen on more details, I can ask 
DSP team for more info.


> 
>> + *						GENERIC COMPRESSED = 5
> 
> ??
> 
>> + *
>> + * %AR_TKN_U32_MODULE_FMT_FREQ:			bit rate
> 
> bit rate or frame rate (aka sampling frequency) ?

Yes, Will change this to AR_TKN_U32_MODULE_BIT_RATE to be more obvious.

> 
>> + *
>> + * %AR_TKN_U32_MODULE_FMT_BIT_DEPTH:		bit depth
> 
> 
>> +static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
>> +					struct snd_soc_tplg_private *private)
>> +{
>> +	struct audioreach_graph_info *info = NULL;
>> +	struct snd_soc_tplg_vendor_array *sg_array;
>> +	struct snd_soc_tplg_vendor_value_elem *sg_elem;
>> +	struct audioreach_sub_graph *sg;
>> +	int graph_id, sub_graph_id, tkn_count = 0;
>> +	bool found;
>> +
>> +	sg_array = audioreach_get_sg_array(private);
>> +	sg_elem = sg_array->value;
>> +
>> +	while (tkn_count <= (le32_to_cpu(sg_array->num_elems) - 1)) {
>> +		switch (le32_to_cpu(sg_elem->token)) {
>> +		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
>> +			sub_graph_id = le32_to_cpu(sg_elem->value);
>> +			sg = audioreach_tplg_alloc_sub_graph(apm, sub_graph_id, &found);
>> +			if (IS_ERR(sg)) {
>> +				return sg;
>> +			} else if (found) {
>> +				/* Already parsed data for this sub-graph */
>> +				return sg;
>> +			}
>> +			dev_err(apm->dev, "%s: New subgraph id : 0x%08x\n", __func__,
>> +				sub_graph_id);
>> +			break;
>> +		case AR_TKN_DAI_INDEX:
>> +			/* Sub graph is associated with predefined graph */
>> +			graph_id = le32_to_cpu(sg_elem->value);
>> +			info = audioreach_tplg_alloc_graph_info(apm, graph_id, &found);
>> +			if (IS_ERR(info))
>> +				return ERR_CAST(info);
>> +			break;
>> +		case AR_TKN_U32_SUB_GRAPH_PERF_MODE:
>> +			sg->perf_mode = le32_to_cpu(sg_elem->value);
>> +			break;
>> +		case AR_TKN_U32_SUB_GRAPH_DIRECTION:
>> +			sg->direction = le32_to_cpu(sg_elem->value);
>> +			break;
>> +		case AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:
>> +			sg->scenario_id = le32_to_cpu(sg_elem->value);
>> +			break;
>> +		default:
>> +			dev_err(apm->dev, "Not a valid token %d for graph\n",
>> +				sg_elem->token);
>> +		break;
> 
> indentation is off
> 
>> +
>> +		}
>> +		tkn_count++;
>> +		sg_elem++;
>> +	}
>> +
>> +	/* Sub graph is associated with predefined graph */
>> +	if (info) {
>> +		dev_err(apm->dev, "%s: adding subgraph id : 0x%08x -> %d\n", __func__,
>> +		sub_graph_id, graph_id);
>> +
>> +		audioreach_tplg_add_sub_graph(sg, info);
>> +	}
>> +
>> +	return sg;
>> +}
>> +
>> +static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
>> +						struct audioreach_sub_graph *sg,
>> +						struct snd_soc_tplg_private *private)
>> +{
>> +	struct snd_soc_tplg_vendor_array *cont_array;
>> +	struct snd_soc_tplg_vendor_value_elem *cont_elem;
>> +	struct audioreach_container *cont;
>> +	int container_id, tkn_count = 0;
>> +	bool found = false;
>> +
>> +	cont_array = audioreach_get_cont_array(private);
>> +	cont_elem = cont_array->value;
>> +
>> +	while (tkn_count <= (le32_to_cpu(cont_array->num_elems) - 1)) {
>> +		switch (le32_to_cpu(cont_elem->token)) {
>> +		case AR_TKN_U32_CONTAINER_INSTANCE_ID:
>> +			container_id = le32_to_cpu(cont_elem->value);
>> +			cont = audioreach_tplg_alloc_container(apm, sg, container_id, &found);
>> +			if (IS_ERR(cont))
>> +				return ERR_PTR(-ENOMEM);
>> +			else if (found) /* Already parsed container data */
>> +				return cont;
>> +
>> +			break;
>> +		case AR_TKN_U32_CONTAINER_CAPABILITY_ID:
>> +			cont->capability_id = le32_to_cpu(cont_elem->value);
>> +			break;
>> +		case AR_TKN_U32_CONTAINER_STACK_SIZE:
>> +			cont->stack_size = le32_to_cpu(cont_elem->value);
>> +			break;
>> +		case AR_TKN_U32_CONTAINER_GRAPH_POS:
>> +			cont->graph_pos = le32_to_cpu(cont_elem->value);
>> +			break;
>> +		case AR_TKN_U32_CONTAINER_PROC_DOMAIN:
>> +			cont->proc_domain = le32_to_cpu(cont_elem->value);
>> +			break;
>> +		default:
>> +			dev_err(apm->dev, "Not a valid token %d for graph\n",
>> +				cont_elem->token);
>> +		break;
> 
> indentation?
> 
>> +
>> +		}
>> +		tkn_count++;
>> +		cont_elem++;
>> +	}
>> +
>> +	return cont;
>> +}
>> +
> 
>> +static struct audioreach_module *audioreach_find_widget(struct snd_soc_component *comp,
>> +							const char *name)
>> +{
>> +	struct q6apm *apm = dev_get_drvdata(comp->dev);
>> +	struct audioreach_module *module;
>> +	int id = 0;
> 
> unnecessary init?
> 
>> +
>> +	idr_for_each_entry(&apm->modules_idr, module, id) {
>> +		if (!strcmp(name, module->widget->name))
>> +			return module;
>> +	}
>> +
>> +	return NULL;
>> +}
> 
>> +/* DAI link - used for any driver specific init */
>> +static int audioreach_link_load(struct snd_soc_component *component, int index,
>> +				struct snd_soc_dai_link *link,
>> +				struct snd_soc_tplg_link_config *cfg)
>> +{
>> +	link->nonatomic = true;
>> +	link->dynamic = true;
>> +	link->platforms->name = NULL;
>> +	link->platforms->of_node = of_get_compatible_child(component->dev->of_node,
>> +				"qcom,q6apm-dais");
>> +	link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
>> +	link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> 
> can you add a comment on why you don't use the default order for FE/BE
> triggers?
> 
>> +
>> +	return 0;
>> +}
>> +
> 
>> +static int audioreach_get_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
>> +	struct audioreach_module *mod = dw->dobj.private;
>> +
>> +	/* Check if the graph is active or not */
> 
> that comment seems like a copy/paste, there's no check.
> 
>> +	ucontrol->value.integer.value[0] = mod->gain;
>> +
>> +	return 0;
>> +}
>> +
>> +static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>> +				      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
>> +	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
>> +	struct audioreach_module *mod = dw->dobj.private;
>> +	struct q6apm *apm = dev_get_drvdata(c->dev);
>> +	int vol = ucontrol->value.integer.value[0];
>> +
>> +	/* Check if the graph is active or not */
>> +	if (dw->power) {
>> +		audioreach_gain_set_vol_ctrl(apm, mod, vol);
>> +		mod->gain = vol;
>> +		return 1;
>> +	}
> 
> shouldn't you cache the value and apply it when the graph is powered?

we could do that.

> 
> Also wondering why this isn't using pm_runtime or something? Is this
> re-inventing your own power management?
If you mean using dapm event callback, I can give that a try.

> 
>> +
>> +	dev_err(apm->dev, "Unable to set volume as graph is not	active\n");
>> +	return 0;
>> +
>> +}
>> +
>> +static int audioreach_control_load_mix(struct snd_soc_component *scomp,
>> +					  struct snd_ar_control *scontrol,
>> +					  struct snd_kcontrol_new *kc,
>> +					  struct snd_soc_tplg_ctl_hdr *hdr)
>> +{
>> +	struct snd_soc_tplg_mixer_control *mc;
>> +	struct snd_soc_tplg_vendor_array *c_array;
>> +	struct snd_soc_tplg_vendor_value_elem *c_elem;
>> +	int tkn_count = 0;
>> +
>> +	mc = container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
>> +	c_array = (struct snd_soc_tplg_vendor_array *)mc->priv.data;
>> +
>> +	c_elem = c_array->value;
>> +
>> +	while (tkn_count <= (le32_to_cpu(c_array->num_elems) - 1)) {
>> +		switch (le32_to_cpu(c_elem->token)) {
>> +		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
>> +			scontrol->sgid = le32_to_cpu(c_elem->value);
>> +			break;
>> +		default:
>> +			/* Ignore other tokens */
>> +		break;
> 
> indentation?
> 
>> +
>> +		}
>> +		c_elem++;
>> +		tkn_count++;
>> +	}
>> +
>> +	return 0;
>> +}
> 
>> +int audioreach_tplg_init(struct snd_soc_component *component)
>> +{
>> +	struct device *dev = component->dev;
>> +	const struct firmware *fw;
>> +	int ret;
>> +
>> +	ret = request_firmware(&fw, "audioreach.bin", dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "tplg fw audioreach.bin load failed with %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
>> +	if (ret < 0) {
>> +		dev_err(dev, "tplg component load failed%d\n", ret);
>> +		release_firmware(fw);
>> +		return -EINVAL;
>> +	}
> 
> should you not release the firmware on success as well? that's what we
> do for SOF"
> 
> 	ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
> 	if (ret < 0) {
> 		dev_err(scomp->dev, "error: tplg component load failed %d\n",
> 			ret);
> 		ret = -EINVAL;
> 	}
> 
> 	release_firmware(fw);
> 	return ret;

Thanks for hints, I updated it as suggested.

--srini
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(audioreach_tplg_init);
>>
