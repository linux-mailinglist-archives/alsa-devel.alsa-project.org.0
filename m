Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2965379F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 21:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7934416F1;
	Wed, 21 Dec 2022 21:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7934416F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671655049;
	bh=Tr42lq46OxEMAflQujqUZjJ9lgtTV0Wl3LVaxRAHraY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VKhnFotzzeuiGTy2uE9ReRKCCpq7hiVDWUTyo+9nnRdd17LAv7ufQw50B6Ae9BvB9
	 V8x2r0mV2V11scMAXIftezmKTSXjIul1vEmRHXoyL4c3Asdemdara682DR/UldVtYy
	 6aZ5T+IUgLTo8NwFUzcH67gr150z03BF5gdy/D1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F228F8024D;
	Wed, 21 Dec 2022 21:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6EDAF80022; Wed, 21 Dec 2022 21:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D07F80022
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 21:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D07F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KkUZIR8I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671654995; x=1703190995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Tr42lq46OxEMAflQujqUZjJ9lgtTV0Wl3LVaxRAHraY=;
 b=KkUZIR8IfSAErENZPbHZ7xB2V1wDL3lbE0BAuhnIxzPyA+FJHkm6GJyp
 qkRWGDFyT/iumkI+nNSkXfAk8ZtHQDqa6YQD5rRjbNweGchwiE4eu56iX
 HRY2DFubfs8ifWD+iVYKOG2j7NIfEongc3dVkpaOfclny0Lps50fwk3jc
 UmmfRbby+WUeVPJ1TptajFyCDUN/LqEiLXVfNle15eE+vb+D/smAH0ma2
 ext8P3EHSj0sPcqHq3lBRRbow7dz5/0Pw9R76P7y2dYnqzw28/vS+9Z5w
 v/ZHKw6SBcNtiMrGNX2M2AHopCISsinY0sDV1XUs5GSOABqjBC/IxvtF0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="300309136"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="300309136"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 12:36:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="683936938"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="683936938"
Received: from gaoyuanf-mobl.amr.corp.intel.com (HELO [10.212.85.133])
 ([10.212.85.133])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 12:36:28 -0800
Message-ID: <0c48007d-5d95-4d6b-9aad-80e77bd3111f@linux.intel.com>
Date: Wed, 21 Dec 2022 14:36:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
To: Alicja Michalska <ahplka19@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <Y6No3WsiZ7Sbg35u@tora>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y6No3WsiZ7Sbg35u@tora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
> +			       struct snd_soc_dai_link **dai_link)
> +{
> +	struct snd_soc_dai_link_component *platform;
> +	struct snd_soc_dai_link *dl;
> +
> +	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
> +	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> +	if (!dl || !platform)
> +		return -ENOMEM;
> +
> +	platform->name = platform_name;
> +
> +	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
> +	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
> +	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
> +	if (!dl->name || !dl->cpus || !dl->codecs)
> +		return -ENOMEM;
> +
> +	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
> +	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5663:00");
> +	dl->codecs->dai_name = RT5663_DAI_NAME;
> +	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
> +		return -ENOMEM;
> +
> +	dl->num_cpus = 1;
> +	dl->num_codecs = 1;
> +	dl->platforms = platform;
> +	dl->num_platforms = 1;
> +	dl->id = 0;
> +	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;

can I ask why it's necessary to hard-code the format, shouldn't this be
specified in the topology?

It's a generic question for AVS machine drivers, the same code is found
in other cases.

> +	dl->init = avs_rt5663_codec_init;
> +	dl->nonatomic = 1;
> +	dl->no_pcm = 1;
> +	dl->dpcm_capture = 1;
> +	dl->dpcm_playback = 1;
> +
> +	*dai_link = dl;
> +
> +	return 0;
> +}
