Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 383904146ED
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 12:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB70415DC;
	Wed, 22 Sep 2021 12:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB70415DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632307553;
	bh=yGbROibzXX6OsoNmoVM4gEGKYoytJ8ynXDsRYXnqnIM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGyljiHEU+GGUc4po5VnUcQduylBPqTypiQq4MxAb9bS94wPigGxufeNYU9/ZvggM
	 w/Cb8K6ivbYLk715TcxloI5KXKKDbzvoDgyInjIDA6Qmhb98DO+itkGAwDMJBETeIk
	 YwuHaGxiURBd+zzk7bF93Q+LNGGJfKumVbhxRuiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FA77F80246;
	Wed, 22 Sep 2021 12:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 643CEF8025D; Wed, 22 Sep 2021 12:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77891F8014E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 12:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77891F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MNn+5ujs"
Received: by mail-ed1-x532.google.com with SMTP id c21so8339405edj.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wBxn+2k6RvEYUK7AfFHOy4KNBTZBFkuipAkF57OjMHg=;
 b=MNn+5ujsin8JBNMdMT9MAhT94AyYH4CZK+5+Doaefq3skVf1bnqZPuRPX6EH5u5ViZ
 wY7HKQXXRCnBgVdMD0+I8S5Z/PyTxOxydrp8EJqqSykcsQO3CzhuM1/sv2ApEvOro7yT
 mcdqzvkZpQN9kfUO9D/7pCPFAthzq39nF4gFKdiIuoYPHRKlzVBXNOD6uyx248+rcjWM
 5gqLy2qg52F1J2Z8LEvGpI1gl6rBtraslfVOtzRG1/NT0jt2V+LFLSeKpk9d5QnvCaj2
 GWFpzfhBM4PRll7bCByEOaZg17MpjjkHxKQzckCcstQFHxOjDEjlMfwaXa0sOlhId4Cl
 ow7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBxn+2k6RvEYUK7AfFHOy4KNBTZBFkuipAkF57OjMHg=;
 b=C6WK6RuXOIaSNhBKySzOWkO8sFFtjrdNJSeM6Zz/jUKqk4e//6iMcU3F2GV5SnQ4ib
 F7K16fy9BAZ6f2q1jx1BuT/VFN1Y3p4j23caVrbev/5wP9c2fe6fflDUOQyg+nvLv9Ln
 //kMqvDsr9mKHS14iDktofzG7o3m5tAMeo427AXkxZLGyypEUxGPTktxZ6U4isfwJ/b3
 /cZ6kBJqM0EqXWWXnOPjxrz6511kzu4A/Tw5KXHfRw5TkEfv/g1rSqcpaKI1HaQwlo6j
 yfrlaDidaCdtdio1suOggllUFgKvHcsZH1e/vr0UWtAeUzgmVm4C29NcjRGgtQVFnQQK
 tZvA==
X-Gm-Message-State: AOAM5331eHz60KXfi2TyWDUMtgWlJUkQ/UCP5l8HShc7lgrRxpePfXr5
 Hil7pHCFjPAndpd0B8iRTsM0sg==
X-Google-Smtp-Source: ABdhPJxF24aaYxRmvcxGoVQJQ5ToT6GoLi39f9ASs2RYkHoWH6AGJjBBgDp9hzVv8dhA5qQT5rWjBQ==
X-Received: by 2002:a17:906:f0d4:: with SMTP id
 dk20mr41189221ejb.199.1632307469899; 
 Wed, 22 Sep 2021 03:44:29 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id m13sm887573ejn.3.2021.09.22.03.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:44:29 -0700 (PDT)
Subject: Re: [PATCH v7 18/22] ASoC: qdsp6: audioreach: add topology support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-19-srinivas.kandagatla@linaro.org>
 <7021cdec-382b-faa9-cf6c-ee06edbf19a7@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9ea759db-f2ae-8b26-eff9-8557267803d2@linaro.org>
Date: Wed, 22 Sep 2021 11:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7021cdec-382b-faa9-cf6c-ee06edbf19a7@linux.intel.com>
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

Thanks Pierre for quick review,

On 21/09/2021 19:44, Pierre-Louis Bossart wrote:
> 
>> +static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
>> +							      struct audioreach_container *cont,
>> +							      struct snd_soc_dapm_widget *w,
>> +							      uint32_t module_id, bool *found)
>> +{
>> +	struct audioreach_module *mod;
>> +	int ret;
>> +
>> +	mutex_lock(&apm->lock);
>> +	mod = idr_find(&apm->modules_idr, module_id);
>> +	mutex_unlock(&apm->lock);
>> +
>> +	if (mod) {
>> +		*found = true;
>> +		return mod;
>> +	}
>> +	*found = false;
>> +	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
>> +	if (!mod)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mutex_lock(&apm->lock);
>> +	if (!module_id) { /* alloc module id dynamically */
>> +		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
>> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
>> +				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
>> +	} else {
>> +		ret = idr_alloc(&apm->modules_idr, mod, module_id, module_id + 1, GFP_KERNEL);
>> +	}
>> +	mutex_unlock(&apm->lock);
>> +
>> +	if (ret < 0) {
>> +		dev_err(apm->dev,
>> +			"Failed to allocate Module Instance ID (%x)\n", module_id);
>> +		kfree(mod);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	mod->instance_id = ret;
>> +	dev_err(apm->dev, "Module Instance ID (0x%08x) allocated\n", ret);
> 
> dev_dbg?
> 

Sure, I removed these in next version.
>> +	/* add to module list */
>> +	list_add_tail(&mod->node, &cont->modules_list);
>> +	mod->container = cont;
>> +	mod->widget = w;
>> +	cont->num_modules++;
>> +
>> +	return mod;
>> +}
> 
> 
> 
>> +static int audioreach_widget_ready(struct snd_soc_component *component,
>> +				   int index, struct snd_soc_dapm_widget *w,
>> +				   struct snd_soc_tplg_dapm_widget *tplg_w)
>> +{
>> +	switch (w->id) {
>> +	case snd_soc_dapm_aif_in:
>> +	case snd_soc_dapm_aif_out:
>> +		audioreach_widget_load_buffer(component, index, w, tplg_w);
>> +		break;
>> +	case snd_soc_dapm_decoder:
>> +	case snd_soc_dapm_encoder:
>> +	case snd_soc_dapm_src:
>> +		audioreach_widget_load_enc_dec_cnv(component, index, w, tplg_w);
>> +		break;
>> +	case snd_soc_dapm_buffer:
>> +		audioreach_widget_load_buffer(component, index, w, tplg_w);
>> +		break;
>> +	case snd_soc_dapm_mixer:
>> +		return audioreach_widget_load_mixer(component, index, w, tplg_w);
>> +	case snd_soc_dapm_pga:
>> +		return audioreach_widget_load_pga(component, index, w, tplg_w);
>> +	case snd_soc_dapm_dai_link:
>> +	case snd_soc_dapm_scheduler:
>> +	case snd_soc_dapm_out_drv:
>> +	default:
>> +		dev_err(component->dev, "Widget type (0x%x) not yet supported\n", w->id);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
> 
> spurious newline
> 
>> +static int audioreach_widget_unload(struct snd_soc_component *scomp,
>> +				    struct snd_soc_dobj *dobj)
>> +{
>> +	struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
>> +	struct q6apm *apm = dev_get_drvdata(scomp->dev);
>> +	struct audioreach_container *cont;
>> +	struct audioreach_module *mod;
>> +
>> +	mod = dobj->private;
>> +	cont = mod->container;
>> +
>> +	if (w->id == snd_soc_dapm_mixer) {
>> +		/* virtual widget */
>> +		kfree(dobj->private);
>> +		return 0;
>> +	}
>> +
>> +	mutex_lock(&apm->lock);
>> +	idr_remove(&apm->modules_idr, mod->instance_id);
>> +	cont->num_modules--;
>> +
>> +	list_del(&mod->node);
>> +	kfree(mod);
>> +
>> +	if (list_empty(&cont->modules_list)) { /* remove container */
>> +		struct audioreach_sub_graph *sg = cont->sub_graph;
>> +
>> +		idr_remove(&apm->containers_idr, cont->container_id);
>> +		list_del(&cont->node);
>> +		sg->num_containers--;
>> +		kfree(cont);
>> +		if (list_empty(&sg->container_list)) { /* remove sg */
>> +			struct audioreach_graph_info *info = sg->info;
>> +
>> +			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
>> +			list_del(&sg->node);
>> +			info->num_sub_graphs--;
>> +			kfree(sg);
>> +			if (list_empty(&info->sg_list)) { /* remove graph info */
>> +				idr_remove(&apm->graph_info_idr, info->id);
>> +				kfree(info);
>> +			}
>> +		}
>> +	}
> 
> It's not very clear if the nested removes actually free-up everything?
> You may want to add a comment on the hierarchy.
I will remove the module and check if the container is empty and then 
remove the container and checks if sub-graph is empty and then removes 
subgraphs.
Hierarchy was mentioned in cover letter, but I will add some comment 
here for more clarity to readers.
> 
>> +
>> +	mutex_unlock(&apm->lock);
>> +
>> +	return 0;
>> +}
>> +
> 
>> +int audioreach_tplg_init(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_card *card = component->card;
>> +	struct device *dev = component->dev;
>> +	const struct firmware *fw;
>> +	char tplg_fw_name[128];
>> +	int ret;
>> +
>> +	/* Inline with Qualcomm UCM configs and linux-firmware path */
>> +	snprintf(tplg_fw_name, sizeof(tplg_fw_name), "qcom/%s/%s-tplg.bin", card->driver_name,
>> +		 card->name);
> 
> use kasprintf instead of fixed 128-char array?
I moved this to kasprintf in next version.

> 
> Also you should use a qcom/audioreach/ prefix to possible interference
> with other parts of qcom...
> 

So Qualcomm linux-firmwares are arranged something like

qcom/sdm845/*
qcom/sm8250/*
qcom/sm8150/*

and UCM something like 
this:Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf

Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf


Atleast in Qualcomm soundcard case we have driver name set to SoC name 
and we tend to reuse this driver across multiple platforms.

second part card name actually is from model device tree property, in 
this case which is "Qualcomm-RB5-WSA8815-Speakers-DMIC0"

so we will endup looking for
/lib/firmare/qcom/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0-tplg.bin

AFAIU, it should not interface with any other qcom parts.

for Other qcom parts this model will change so the topology file name.


>> +
>> +	ret = request_firmware(&fw, tplg_fw_name, dev);
>> +	if (ret < 0) {
>> +		dev_info(dev, "loading %s failed %d, falling back to dfw-audioreach-tplg.bin\n",
>> +			 tplg_fw_name, ret);
>> +		/* default firmware */
>> +		ret = request_firmware(&fw, "dfw-audioreach-tplg.bin", dev);
>> +		if (ret < 0) {
>> +			dev_err(dev, "tplg fw dfw-audioreach-tplg.bin load failed with %d\n", ret);
> 
> the dfw prefix isn't very helpful...Intel's example of "dfw_sst.bin" is
> a historical reference, not something you should reuse.

Rethinking on this once again, Am not sure if it even makes sense to 
support this default setup. It will be very hard to get a working 
defalut tplg on every platform. So am planning to remove this in next 
version.

Do you see any issues?

--srini
> 
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
>> +	if (ret < 0) {
>> +		dev_err(dev, "tplg component load failed%d\n", ret);
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	release_firmware(fw);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(audioreach_tplg_init);
>>
