Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1689493F2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACAC23BD7;
	Tue,  6 Aug 2024 16:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACAC23BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956238;
	bh=epnSmWwsAft3uM/meWwz3a3AEZDlLJA7Y6aLodABTZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bs+Gq6BPCTVRsKf0gAyTOJ+2tGz66ejNTSqm7y7h4IsXubfKDQ1XukcIcelsNR5z6
	 0c5k+KIGuVblETNy3aYMSRBaGQNqlN4KkcQfmWxIJGAKAIvH1QlP+F2q1AYmQSu7vZ
	 nzDCs+G/xsx9oaMdy4I6puClsuOCYW/Q3mr32BFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3751DF805D4; Tue,  6 Aug 2024 16:57:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF31F8049C;
	Tue,  6 Aug 2024 16:57:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B06DAF80448; Tue,  6 Aug 2024 16:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88FF2F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88FF2F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fBzIwIua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955876; x=1754491876;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=epnSmWwsAft3uM/meWwz3a3AEZDlLJA7Y6aLodABTZI=;
  b=fBzIwIuaplpFErt8Z5lA7Onbqty0h16OVDGQ4wl+YeR4wFm9wkNm/vU3
   FWj8/v6BvtyY1PfKp9YrSakqzuNiYtGh79YVj+GBrGWL3HBJ6I0G+kulV
   n+0EMSTmcqEe3LJ7RLaWGnGtQWADVrZJWUxGQCg2gzTfD+3hVo14RiVPP
   gGriS+0uuQWZnglAuzqinCDIqUfv7YvJcfxpX+PZAYc8KspEt6toXVocD
   6Rso/wf0o/RFkcopg6SxpDMBDELDsJFg94H/pNFNSoiIavrVSnDhVW0/B
   67G1PueYqxYpvMnutai7l2EPCMKVxhzzsaWl80IXah0lf/PkstiQkUcX+
   w==;
X-CSE-ConnectionGUID: WJya8rufQImMAd9iZAtxfw==
X-CSE-MsgGUID: MRfLU3e+RjCuD/8vB83Gsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101771"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21101771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:51:12 -0700
X-CSE-ConnectionGUID: ZZRHssqJRWOw10BSIhT3Ng==
X-CSE-MsgGUID: EorPW4FmRGWL+6V8mUVq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476658"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:51:06 -0700
Message-ID: <5c882055-85d5-41ba-98bf-da375a490c5b@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 conor+dt@kernel.org, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, tiwai@suse.com, gregkh@linuxfoundation.org,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
 <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
 <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JSIY4GYFBVRVJFGI6YKIVALCEJJLTLS
X-Message-ID-Hash: 5JSIY4GYFBVRVJFGI6YKIVALCEJJLTLS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JSIY4GYFBVRVJFGI6YKIVALCEJJLTLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/2/2024 12:43 AM, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:07 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>> +						 struct snd_soc_jack *jack)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>>> +{
>>> +	return -ENODEV;
>>> +}
>> usually fallback functions return 0, is the error code intentional?
> ACK.
>>
>>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>> +					struct snd_soc_jack *jack)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
>> do we need the reference to Playback?
> No, will remove.
>>> +					SND_JACK_HEADPHONE, jack);
>> wondering if there would be any merit in defining a new type of jack,
>> e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
>> device connected. The type of device does not really matter, does it?
>>
> Not as of now, but I think we discussed in the past that maybe depending on if playback and capture is supported, we can notify SND_JACK_HEADSET?  That is something I will need to change depending on how we want to handle the comments on patch#9
> 

I agree with Pierre that SND_JACK_HEADPHONE is too specific in this 
case, adding SND_JACK_USB sounds like good solution, as there are more 
device types than headset and headphones. Alternatively you could also 
consider defining some type of USB Audio Class mapping to existing 
SND_JACK types. (Look for UAC_INPUT_TERMINAL_*, UAC_OUTPUT_TERMINAL_* & 
UAC_BIDIR_TERMINAL_*.)

