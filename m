Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF39447B5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285663881;
	Thu,  1 Aug 2024 11:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285663881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503658;
	bh=w0McOUyWwUuqt/eulPkwOwH5rxC2a3weyECk1ou2zkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=io49Hwl2kK+oePVzfnGR73/RcOCKOGiALs1zNL40aAoGbjgeG8F5fcXJs+Iu9a222
	 N94F+r+wIgSYslBwxR45kmVe5wx9E1ylYQsHirqRNBLw3n7S4eXt+QxZc/VwokHDk0
	 rSs9dtZ8jWPBFpQj8tdEPgl0RHNRlWoJFjroAWD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE73F80623; Thu,  1 Aug 2024 11:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B79F805D6;
	Thu,  1 Aug 2024 11:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B81E9F805EC; Thu,  1 Aug 2024 11:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8E6EF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E6EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y0dpTsap
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503529; x=1754039529;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w0McOUyWwUuqt/eulPkwOwH5rxC2a3weyECk1ou2zkg=;
  b=Y0dpTsapK15doq5cPSfPpMIAzt2k5aw7q5EL5XVAYoMffBYM5i0cuK6i
   c1WDVnW+n3Q+jyti5YxhlzFFsyG46ba7YX/69SeGoA9AqWE/dtWwKe4gP
   U5vc7fMeMPhryxz2hD1wbCSIRVO66AKReDHgi1rjeGB4UMNCWqa2jO8iW
   EPdIC5NVs4L7Vj89OGfDT6as142K6oC+uHjITwYIDZmfaK/aynlTe7DiP
   uR2xi/DGPhijcUm4iAxLPzGc35ASinvlvfIRi2u1DuWq2MV8j35Kv0zV7
   rHU13AsKF17KHP+/CIo0TvDHBZe3ip2kF0MV4svy1hig5SqSdE4h0EhK8
   A==;
X-CSE-ConnectionGUID: H7Qqt+fZRLOI9rT1dkYfUw==
X-CSE-MsgGUID: iPhjstJuTS6fn2XtY7gQmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383625"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:00 -0700
X-CSE-ConnectionGUID: qzka40OKSsyRNpJ1IZoG5w==
X-CSE-MsgGUID: yQbFYnn9RiivaEUKaMOqXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59090084"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:50 -0700
Message-ID: <5b5d06b8-8ada-49dd-a9c5-477258a9a72a@linux.intel.com>
Date: Thu, 1 Aug 2024 10:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 19/34] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
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
 <20240801011730.4797-20-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-20-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FIDIPRHFB6NOP43KIH3OOEND3WL2USBK
X-Message-ID-Hash: FIDIPRHFB6NOP43KIH3OOEND3WL2USBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIDIPRHFB6NOP43KIH3OOEND3WL2USBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> +static int q6usb_get_offload_dev(struct snd_soc_component *component,
> +				 int card, int pcm, enum snd_soc_usb_kctl route)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +	struct snd_soc_usb_device *sdev;
> +	int ret = -1;
> +
> +	mutex_lock(&data->mutex);
> +
> +	if (list_empty(&data->devices))
> +		goto out;
> +
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	if ((card == sdev->card_idx) && (pcm == sdev->pcm_idx)) {
> +		if (route == SND_SOC_USB_KCTL_CARD_ROUTE)
> +			ret = component->card->snd_card->number;
> +		else if (route == SND_SOC_USB_KCTL_PCM_ROUTE)
> +			ret = q6usb_get_pcm_id(component);
> +	}
> +
> +out:
> +	mutex_unlock(&data->mutex);
> +
> +	return ret;
> +}

well I obviously didn't get how this function worked until now, it's
supposed to be call TWICE with a different argument.

Not sure it's really wise with the locking, why not get both in one shot?

Also how does this update the kcontrol value?
