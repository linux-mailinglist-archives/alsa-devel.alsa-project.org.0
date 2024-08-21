Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC089959545
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 09:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C1AC832;
	Wed, 21 Aug 2024 09:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C1AC832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724223817;
	bh=8rUm72MnGLmHQNl/Pyxx0EYzyXtHSorMLOIHmsjfdMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qV1/JHGtnVbGIw+qes0IIRZZ9PTkmWH5uobCGA3zmHrHY5k8t3cL017h9+rH0MSHr
	 swV5V76wE5dFsjF8OV7ejyWybAzenF/wEvFDDBE7m0m6wBQPMsk7zCtA0MImcIaOHg
	 8MeW0KYaI0SPb2JgGtsTMRbSw3vYMEYY27XcK8ZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20091F8057A; Wed, 21 Aug 2024 09:03:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B67F805AB;
	Wed, 21 Aug 2024 09:03:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EDEEF80496; Wed, 21 Aug 2024 09:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF52EF8016E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 09:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF52EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XUvsjdh1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724223769; x=1755759769;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8rUm72MnGLmHQNl/Pyxx0EYzyXtHSorMLOIHmsjfdMk=;
  b=XUvsjdh1BniE6b0n78CtO+7rnS6+Xsf+xLEHOxh/ecGgfXZ0LuZ2UEel
   BBUA0mSJsjjw+TnI0qx8TIDPjaTH2AsPFZlgJKdYqkqwPPqp2kc+87tfv
   efYeDbdzQ7EUnqgkfHTNWGdsv+Msz8lTBhsyuRcE5u4NHjlOPW7zT9oA7
   P1Kn6y+7az28rHfSrm6AdY/6pEpNRLnMVIULz6ktxUmn9aJ59YFhRmWud
   n8eH6IvENXs7OmZUQS6xssdYoi1a0L7MmKjrHXPa5k6PzrWPhN9NeQKea
   ZRogMKQWsM2seJVjmHlHb+4FvIjUeY1D2S4YD/gbOGIDkGlK5z4WpPcBk
   Q==;
X-CSE-ConnectionGUID: SG1N7LJgTcSCISzdtpy7EA==
X-CSE-MsgGUID: N0P1j+clS/2lUa69ce1IPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22706003"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600";
   d="scan'208";a="22706003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:02:46 -0700
X-CSE-ConnectionGUID: r7X2J0LrR8ub329AoQ8R8g==
X-CSE-MsgGUID: fYBNYWdMTGy2tKnZxPcjmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600";
   d="scan'208";a="65871786"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.16])
 ([10.245.246.16])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:02:39 -0700
Message-ID: <7b3421f5-8d57-4138-9456-1bf0eb4662c0@linux.intel.com>
Date: Wed, 21 Aug 2024 09:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
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
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
 <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
 <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
 <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
 <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
 <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L4DK5N26F7RKFO4UEEXSSKOOJXHDU37U
X-Message-ID-Hash: L4DK5N26F7RKFO4UEEXSSKOOJXHDU37U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4DK5N26F7RKFO4UEEXSSKOOJXHDU37U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>>>>> +/**
>>>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>>>> + * @chip - USB SND chip device
>>>>>> + *
>>>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>>>> + * query for if there is an available USB audio offload path, and which
>>>>>> + * card is managing it.
>>>>>> + */
>>>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>>>> +{
>>>>>> +	struct usb_device *udev = chip->dev;
>>>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>>>> +	struct snd_usb_stream *as;
>>>>>> +	char ctl_name[37];
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>>>> +		chip_kctl->count = 1;
>>>>>> +		/*
>>>>>> +		 * Store the associated USB SND card number and PCM index for
>>>>>> +		 * the kctl.
>>>>>> +		 */
>>>>>> +		chip_kctl->private_value = as->pcm_index |
>>>>>> +					  chip->card->number << 16;
>>>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>>>> +			as->pcm_index);
>>>>>> +		chip_kctl->name = ctl_name;
>>>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>>>> +				  udev->bus->sysdev));
>>>>>> +		if (ret < 0)
>>>>>> +			break;
>>>>>> +	}
>>>>>> +
>>>>>> +	return ret;
>>>> Hi Pierre,
>>>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>>>> soc_usb framework instead of being added in the qcom/ stuff?
>>>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>>>
>>>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>>>
>>>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>>>
>>>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
>>> My comment was only referring to the location of the code, it's now in
>>> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
>>> specific to Qualcomm. I was not asking for any encapsulation inside of
>>> soc-usb, I was only suggesting a move of the code to a shared helper
>>> library so that this code can be reused as is and not duplicated if the
>>> QCOM parts are not compiled in.
>> Ah, great, thanks for the clarification.  Let me take a look with that perspective.
>>
> Going back on the history behind moving it into qcom/ was based off feedback that Takashi pointed out in v14[1].  It was mainly due to the fact that we would be adding another hard dependency between USB SND and the offloading components.  Hence the reason for moving it to within the QCOM offloading package. 
> 
> Thanks
> 
> Wesley Cheng
> 
> [1]: https://lore.kernel.org/linux-usb/87y1bt2acg.wl-tiwai@suse.de/

I don't see anything wrong with the initial proposal


 +config SND_USB_OFFLOAD_MIXER
 +	bool
 +
  config SND_USB_AUDIO_QMI
  	tristate "Qualcomm Audio Offload driver"
  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
  	select SND_PCM
 +	select SND_USB_OFFLOAD_MIXER


That would allows the SND_USB_OFFLOAD_MIXER to be build as a module, and
it would allow other non-QCON solutions to use the module.
Maybe just make it a tristate?
