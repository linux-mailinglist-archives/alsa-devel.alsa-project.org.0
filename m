Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F340CA6D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8FD017BE;
	Wed, 15 Sep 2021 18:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8FD017BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723838;
	bh=l5TG2aZsbtqTeGnu+rXJzypl5GLHrRpaj/pgm8YOpd8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5EEuLzL7BKab8ZEhf3zF1OiTt10nSD2vAi9LWxIEi9CTKagSXfqABUliup9OueCe
	 wUR/toWNeQ7ZREGHFaZYZPgNrrPubL5jA2LgYy1diUJnZV/J+60dTF4BdTwYwIIzGp
	 elWSYYJsZjSCNZiTBXPJEANhwkIr7zsFI0Rw3DoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DF6F804F2;
	Wed, 15 Sep 2021 18:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F6DF804ED; Wed, 15 Sep 2021 18:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF8DEF8027C
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8DEF8027C
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286060922"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="286060922"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583352209"
Received: from mvetrive-mobl3.amr.corp.intel.com (HELO [10.212.69.198])
 ([10.212.69.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:40 -0700
Subject: Re: [PATCH v6 18/22] ASoC: qdsp6: audioreach: add topology support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-19-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bc93c17e-b65d-5885-f151-243d259f40ff@linux.intel.com>
Date: Wed, 15 Sep 2021 11:22:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915131333.19047-19-srinivas.kandagatla@linaro.org>
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


> +static int audioreach_widget_load_buffer(struct snd_soc_component *component,
> +					 int index, struct snd_soc_dapm_widget *w,
> +					 struct snd_soc_tplg_dapm_widget *tplg_w)
> +{
> +	struct snd_soc_tplg_vendor_array *mod_array;
> +	struct audioreach_module *mod;
> +	struct snd_soc_dobj *dobj;
> +	int ret;
> +
> +	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
> +	if (ret)
> +		return ret;
> +
> +	dobj = &w->dobj;
> +	mod = dobj->private;
> +
> +	mod_array = audioreach_get_module_array(&tplg_w->priv);
> +
> +	switch (mod->module_id) {
> +	case MODULE_ID_CODEC_DMA_SINK:
> +	case MODULE_ID_CODEC_DMA_SOURCE:
> +		audioreach_widget_dma_module_load(mod, mod_array);
> +		break;
> +	case MODULE_ID_DATA_LOGGING:
> +		audioreach_widget_log_module_load(mod, mod_array);
> +		break;
> +	case MODULE_ID_I2S_SINK:
> +	case MODULE_ID_I2S_SOURCE:
> +		audioreach_widget_i2s_module_load(mod, mod_array);
> +		break;

no default case?

> +	}
> +
> +	return 0;
> +}
> +

> +int audioreach_tplg_init(struct snd_soc_component *component)
> +{
> +	struct device *dev = component->dev;
> +	const struct firmware *fw;
> +	int ret;
> +
> +	ret = request_firmware(&fw, "audioreach.bin", dev);
> +	if (ret < 0) {
> +		dev_err(dev, "tplg fw audioreach.bin load failed with %d\n", ret);
> +		return ret;
> +	}

How does this work if you want to change the topology, which will happen
rather frequently if you have a framework precisely to change the DSP
graph? You need to override a file in userspace?

Shouldn't you have a means to identify what topology file you want on a
platform-basis?

Or at the very least a means to change the file name with a kernel
parameter or something.

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
