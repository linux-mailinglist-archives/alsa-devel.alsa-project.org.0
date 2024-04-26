Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054C08B386F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 15:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F92D14E9;
	Fri, 26 Apr 2024 15:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F92D14E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714138057;
	bh=+uYe9/x+IyHqzkvDA3Df7sQhXUVBGynf8X0Ns4EUF9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X0IucPF9mIBeQNr624MH3lJUAvDFTio7e1ooKvyp+auGGXxFHZ79GpHYjAvsa0hqj
	 5tvKNRG0ZcnbtgQcd/vp7279rePu6ABFQgpCJaNm+IjZFgucrmNkbWy7n/K9gGIy+/
	 U4hjIDttIPaO+fcHdbSRV1tACA901V+5WKSr7TuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26813F8057E; Fri, 26 Apr 2024 15:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 368E0F8059F;
	Fri, 26 Apr 2024 15:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EFECF80423; Fri, 26 Apr 2024 15:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A83CAF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 15:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83CAF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kN4nDgAs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714138018; x=1745674018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+uYe9/x+IyHqzkvDA3Df7sQhXUVBGynf8X0Ns4EUF9E=;
  b=kN4nDgAsfobOG6+IXfBa0ocbcFwvHGvyr7pH4uA5J2Cyt6z4+67wBKqL
   g2SRUHvW241g9pfIDX2GkYtqWZiEsf5LQ8MYfWHCbAHMxorfm11Y0hSrY
   gOos3fPCjWr3A5m6P7W3oHxUwwc0ImozsE4H5py2aA7yaF4sPhfDodP3U
   9XndUfnHFhgcDI1bVmEVSfzHlxFFUPEXZBxknbp2F2tArLc1vh8/pqk06
   z3JCUv4f21EcS6o4hPM5PG22GogKzdkFWeyaY+snBbmPKMtXwLN2RHHa0
   VAJREmASly1fnYWCVX86F6ODtpnbAYD9VIbDkGFRTRzWeW9uf/s+hHL/s
   A==;
X-CSE-ConnectionGUID: tTDsC1AyS0OZJ6vDSrPYPA==
X-CSE-MsgGUID: 9LX0Gi4pTruWZmfM2rHe2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27388609"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="27388609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:26:50 -0700
X-CSE-ConnectionGUID: xwgeRoRqT4ugnI1Te21ZzA==
X-CSE-MsgGUID: 7L/JNJSaTgeljesKbElbtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25302283"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:26:45 -0700
Message-ID: <c8bd16e8-b204-471b-a702-36e14c8695c5@linux.intel.com>
Date: Fri, 26 Apr 2024 15:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 33/41] ASoC: usb: Create SOC USB SND jack kcontrol
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-34-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240425215125.29761-34-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ADU3PHIPONO36YLNIW5OJA6QI7OVR42J
X-Message-ID-Hash: ADU3PHIPONO36YLNIW5OJA6QI7OVR42J
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADU3PHIPONO36YLNIW5OJA6QI7OVR42J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/25/2024 11:51 PM, Wesley Cheng wrote:
> Expose API for creation of a jack control for notifying of available
> devices that are plugged in/discovered, and that support offloading.  This
> allows for control names to be standardized across implementations of USB
> audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

(...)

>   /* SOC USB sound kcontrols */
> +/**
> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
> + * @component: USB DPCM backend DAI component
> + * @jack: jack structure to create
> + *
> + * Creates a jack device for notifying userspace of the availability
> + * of an offload capable device.
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
> +					SND_JACK_HEADPHONE, jack);
> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_warn(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
> +
>   static int snd_soc_usb_get_offload_card_status(struct snd_kcontrol *kcontrol,
>   				   struct snd_ctl_elem_value *ucontrol)
>   {
> 

I'm not sure if this should be handled in generic USB API, this feels 
like something that should be handled in specific device driver side, 
like all users currently do.

Anyway I think there should also be some function that tears jack down, 
by calling:
snd_soc_component_set_jack(component, NULL, NULL);
so it can get cleaned up properly?
