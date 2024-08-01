Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7694479E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C810C37CC;
	Thu,  1 Aug 2024 11:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C810C37CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503589;
	bh=tscyAirBL6Y/hiFr/fYWfIAghFNfqHxPlsqlAVXu9hE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VQ0efsiMoBTIykae7gFIkbmbLr/J+svoFl/PbEC5x39fSHL6NpH2dtLZ+M60owEGO
	 MIfuc4niAF0MuSb/Ji8RUPQ1fNDfImpbU/fQh6fBgJoesKHfU0HLsKkKz1/jLCoG0Z
	 Ki566lsJxhkmzosai2ZwOAPuDyVXW9qXv/+Spwdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644A1F805E9; Thu,  1 Aug 2024 11:12:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A3CF805E3;
	Thu,  1 Aug 2024 11:12:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 015BEF8057A; Thu,  1 Aug 2024 11:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2F27F8026A
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F27F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kr80wOQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503520; x=1754039520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tscyAirBL6Y/hiFr/fYWfIAghFNfqHxPlsqlAVXu9hE=;
  b=kr80wOQMyscN1r9XcUA9cyZedwMed7+++We+6KLYRrq8hfjIlYm2Tx9/
   CSd7FC73gDy31VCMxa4Emmr30uaqpuzUG1xCUKlw7utSq2pOeqXADWsdg
   12MtYkGWZ1vzsXzt0pOLzkuo67DupNvM/sPzySVhK5L1updCYtYVor5Ia
   nzDnhSqJBNjh3O60H/v8CsatQXg70Z3sednyxYY3LCE+xKYvU8fy+fWsj
   Vor6eDcNC/m06lSajz21/0QOB2VGrKVgOqSrlfkazJharBSLZCZIPVMRL
   aUUPBbu2GIjPKKCL3Efslqdr4KHOpWhsoIu2NwA9KrW+0PDK08MQGw+z2
   g==;
X-CSE-ConnectionGUID: b2h1p+0zTrG77T9lsLFWvQ==
X-CSE-MsgGUID: x5YJEPWlRjuGxmDLySQtCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383461"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:15 -0700
X-CSE-ConnectionGUID: X/4AQvn4RX2vRaRVo8BBHw==
X-CSE-MsgGUID: nybOwouiQnOiwizSYTfNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089811"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:08 -0700
Message-ID: <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Date: Thu, 1 Aug 2024 10:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2P4NPURM7ZZTTDR3DWCY246UNMAWIYRP
X-Message-ID-Hash: 2P4NPURM7ZZTTDR3DWCY246UNMAWIYRP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2P4NPURM7ZZTTDR3DWCY246UNMAWIYRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +						 struct snd_soc_jack *jack)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
> +{
> +	return -ENODEV;
> +}

usually fallback functions return 0, is the error code intentional?


> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",

do we need the reference to Playback?

> +					SND_JACK_HEADPHONE, jack);

wondering if there would be any merit in defining a new type of jack,
e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
device connected. The type of device does not really matter, does it?


> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
