Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B57956505
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 09:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1EB1EC1;
	Mon, 19 Aug 2024 09:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1EB1EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724053987;
	bh=0K840/msskRjT2q+9Xr4aH29i04ioHV2zfboFzqrkHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nqvEHGvBSwR4GIAtDfj8daHfWayY54LbLCGc0Dg9e/TJ9oY+J6hXoCTv9OJpSTt69
	 82R9xBy8wC0zpjwrkQ3lfWSKC6DreRGYl2avX3JJMZJBAh0CM3ecleADHpAdF9L3Om
	 +z3YOYJ6W/E8P89wzO9SMoQTguO+zNb8B6f472fE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7D5F80517; Mon, 19 Aug 2024 09:52:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E8EF805AD;
	Mon, 19 Aug 2024 09:52:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFFB0F80496; Mon, 19 Aug 2024 09:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0052AF80107
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 09:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0052AF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HzEiCBa2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724053322; x=1755589322;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0K840/msskRjT2q+9Xr4aH29i04ioHV2zfboFzqrkHE=;
  b=HzEiCBa22JMxmh0n0PkAHlKQJJ5CAmjc6tHunw1r6a/N96mbtbR8WfLC
   N01HYEKtN5ZjM/TXXmj7zQctFrm6/L37pEWfx529yIO+HFBHDIhHFDzOY
   4pOX7B/Xx1WmQBdmY73gRrKhZ10uFP/wBVNAGrF104fE9la2zGgQtKrEf
   pu2hDVltSaoZ4HK3YiNen79reRFBfXNhpdbJqBSVqiwNhnRY6QvBtW02E
   Ymj1kYVCZ2sM2a+6x9d10LnrbNrmcYFM4vFn+DI4wELLPEaw1zufMwdQ7
   vmmKR+sT8I6Ua4ua8ny0pAiNPD4R8TNUWBL2s7rk8ZycZ3MkKHsPTitpy
   A==;
X-CSE-ConnectionGUID: y8By2E8hTO2x2krHYtd9mQ==
X-CSE-MsgGUID: 25duHQ6PT2WM8NedI4xLXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26079142"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600";
   d="scan'208";a="26079142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:41:56 -0700
X-CSE-ConnectionGUID: gqcRluUbTbiWOIuL2nGreg==
X-CSE-MsgGUID: L+FfEV28SeaeQ1SqYz+WhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600";
   d="scan'208";a="64677103"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.57])
 ([10.245.246.57])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:41:50 -0700
Message-ID: <5695d0ec-af07-4d8e-993f-d435537ea503@linux.intel.com>
Date: Mon, 19 Aug 2024 08:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
 <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
 <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
 <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
 <b323a813-b02e-488b-86f9-06796f9bbf50@quicinc.com>
 <e6e7533c-5665-458e-ba60-7cb843eb27e1@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e6e7533c-5665-458e-ba60-7cb843eb27e1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DCNBYUJS6OWB233EHQTEV7BYIUDTUDAQ
X-Message-ID-Hash: DCNBYUJS6OWB233EHQTEV7BYIUDTUDAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCNBYUJS6OWB233EHQTEV7BYIUDTUDAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>>>> +/**
>>>>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>>>>> USB port?
>>>> Noted, refer to the last comment.
>>>>>> + * @component: USB DPCM backend DAI component
>>>>>> + * @num_streams: number of offloading sessions supported
>>>>> same comment, is this direction-specific or not?
>>>> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>>>>> + * @data: private data
>>>>>> + *
>>>>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>>>>> + * are used in subsequent sequences.
>>>>>> + *
>>>>>> + */
>>>>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>>>>> +					      int num_streams, void *data)
>>>>>> +{
>>>>>> +	struct snd_soc_usb *usb;
>>>>>> +
>>>>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>>>>> +	if (!usb)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	usb->component = component;
>>>>>> +	usb->priv_data = data;
>>>>>> +	usb->num_supported_streams = num_streams;
>>>>>> +
>>>>>> +	return usb;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>>>>> +
>>>>>> +/**
>>>>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>>>>> + * @usb: allocated SOC USB device
>>>>>> +
>>>>>> + * Free and remove the SOC USB device from the available list of devices.
>>>>> Now I am lost again on the device:port relationship. I am sure you've
>>>>> explained this before but I forget things and the code isn't
>>>>> self-explanatory.
>>>>>
>>>> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.
>>> I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
>>> it's not quite right, USB audio works across hubs.
>>>
>> Remember, this is technically the term used to explain the channel created for ASoC to communicate w/ USB.  If we use a term like "device," USB devices come and go, but this ASoC path won't be unallocated along with the USB device, since it does service/know about all the available USB devices connected to the system. (ie through usb hubs)
>>
> How about snd_soc_usb_allocate_link()? This is technically allocating the soc-usb structure which is the entity that connects the ASoC to ALSA.

oh, so if this has nothing to do with a USB device proper, it'd be fine
to use 'port', but explain it in the comments, e.g. something along
those lines:

snd_soc_usb_allocate_port() - allocate a soc-usb port for offload support.

The soc-usb port may be used to stream data with ASoC support to
different connected USB devices. Plug-unplug events are signaled with a
notification but don't directly impact the soc-usb alloc/free.
