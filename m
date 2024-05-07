Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1A8BFE6F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E61DF9;
	Wed,  8 May 2024 15:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E61DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174307;
	bh=Pbghh143acCbPWT9OSSfKb3SaczwJwuLEG9zgGuWUjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gAhTQcByCnsffs5qGIDqHalWsFL0ZmeOteSF/VFWBMWe0+9vJIq13OtJ4TuD2XbEa
	 H9muG3WvKT8g3c8jLw6AX8q0crtPCHdqIt/pNi1BmBEF1sd+HCTQaj3/+GvEeeTcag
	 +7IyO0cLX+ftmSK0KkS2A39jmGRTIsfCZZYc43uA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C2E4F80683; Wed,  8 May 2024 15:16:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F6BF80691;
	Wed,  8 May 2024 15:16:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A822F805FC; Wed,  8 May 2024 15:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 468CDF805E1
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 468CDF805E1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kd9Jip5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174184; x=1746710184;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Pbghh143acCbPWT9OSSfKb3SaczwJwuLEG9zgGuWUjc=;
  b=Kd9Jip5fcmiPlv3xxNN5PKliHZYCDa0WdYx2ZQ/XWy+DryhAw2oOSM0T
   DsxAvhgRNJAB6ME21LVe+fTGH1PD8UTaxlmtPFtFp+hd7DRpDo/ycduHC
   03q9+7al18arKu1rwtbhKAcCrOssJCcdnYL4C8UPvjLAoD7bSektwkIwL
   6T9Z52xKKOdRy7IUGnwHZlKN9yOXzfcXRSzQjxcQO0dS4hRZ/Jmqp91wV
   g6nBEJ4nwt6ylsFjYyi/UOv/wzVoapfwm+VS2RfVucJ6m/qLCIC7A13Xa
   WJYzjvqeJFBXg9wb8J6dzqzHgUSxLOO2JANgVOTZQf1VLkcB7yjllqeSC
   g==;
X-CSE-ConnectionGUID: xsX2WFRhQ3ajZs4zaAf53w==
X-CSE-MsgGUID: yOEP0cX9Te2mKm9HFUrpPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413294"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:20 -0700
X-CSE-ConnectionGUID: MQxi/U5oS8ewAq1bHz0clQ==
X-CSE-MsgGUID: yinIUFupQ928TFhDXIeDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356817"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:19 -0700
Message-ID: <6fe8f489-d8a2-4951-96fa-875ac9b29d23@linux.intel.com>
Date: Tue, 7 May 2024 16:33:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 33/39] ASoC: usb: Fetch ASoC sound card information
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-34-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-34-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XV4ZU3XHKRQRAB4EETUL656MHE76QPKW
X-Message-ID-Hash: XV4ZU3XHKRQRAB4EETUL656MHE76QPKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XV4ZU3XHKRQRAB4EETUL656MHE76QPKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +/**
> + * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
> + * @dev: the device to find in SOC USB
> + *
> + * Finds the component linked to a specific SOC USB instance, and returns
> + * the sound card number for the platform card supporting offloading.
> + *
> + */
> +int snd_soc_usb_device_offload_available(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	return ctx->component->card->snd_card->number;
> +}

Presumably there's a notification to help applications discard this
information on removal?
