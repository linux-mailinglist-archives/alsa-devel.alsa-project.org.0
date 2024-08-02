Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C33945DB4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A914052;
	Fri,  2 Aug 2024 14:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A914052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722600683;
	bh=eR+iu6/0WXfDTtplSQGsJVWxAt8YS165hY1VY+hKTf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XTijeAwhDhmHWGhbJxZ6r1vOozPvcXFAVs8Mh8H5ru6KrWslXJvezYX9dtesQdyDg
	 lM9SMjMhjTWmoQfd0cFtfI6dGsQCxawkcGejfPv5hn1QbpYt+EEU0I6uGcpNABFFuc
	 zNSNikZomcSns/lcebaB6AzslpMBv3h0n2dg+DYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F365DF805BF; Fri,  2 Aug 2024 14:11:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E45F805B0;
	Fri,  2 Aug 2024 14:11:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B27BF80588; Fri,  2 Aug 2024 14:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D9AEF800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9AEF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HmKVvvfg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722600649; x=1754136649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eR+iu6/0WXfDTtplSQGsJVWxAt8YS165hY1VY+hKTf8=;
  b=HmKVvvfgqvUyZnfyL/hhSFRihv2FC1ljAgRq/7xVaveJSd9nZQNqoU08
   /dZ/Y0eLt/SQXbY/OsEfNUfNxoLxMohBkDohsJgNrXIbvbFpkC1FQ1LOi
   5BEELz7SP0WGBJ73blPRA6lXVCYRW9XwJtks/6+MUkj4gu41TSAONeKq0
   sJ+jLI5CoYsvTXJKLUdAN0KQitvKuuw9CBWkZK1SR5CCc1bnXtmUe2Ahk
   t0M/HwzzCimxes9Dfyzl1zx1DjSUtMQRhgoSkqzy2eay+K099ItvRPrna
   057QMPCQin3g1bBuDs/2B3msdlq7Myb4zFiUiDbzpO7ScP4RAMz2NR9Kj
   Q==;
X-CSE-ConnectionGUID: SAKhToJNT8ujrWkXmiG95w==
X-CSE-MsgGUID: hciSOZGOQtatODAmCvBWeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24484194"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24484194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:10:46 -0700
X-CSE-ConnectionGUID: WeoaLZ5qS1yBmoKb3Bfcyg==
X-CSE-MsgGUID: UgZNmmCzQrqeVCUuSYL9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55978897"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.89])
 ([10.245.246.89])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:10:42 -0700
Message-ID: <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Date: Fri, 2 Aug 2024 08:26:10 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VO2Q2OBTKDP5MU6XJ74DNUMH4HFY2FLG
X-Message-ID-Hash: VO2Q2OBTKDP5MU6XJ74DNUMH4HFY2FLG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VO2Q2OBTKDP5MU6XJ74DNUMH4HFY2FLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 23:43, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:02 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +/**
>>> + * struct snd_soc_usb_device
>>> + * @card_idx - sound card index associated with USB device
>>> + * @pcm_idx - PCM device index associated with USB device
>>> + * @chip_idx - USB sound chip array index
>>> + * @num_playback - number of playback streams
>>> + * @num_capture - number of capture streams
>> so here we have a clear separation between playback and capture...
> 
> Thanks for the quick review of the series, I know that its a lot of work, so its much appreciated.
> 
> I guess in the past revisions there was some discussions that highlighted on the fact that, currently, in our QC USB offload implementation we're supporting playback only, and maybe it should be considered to also expand on the capture path.  I went ahead and added some sprinkles of that throughout the SOC USB layer, since its vendor agnostic, and some vendors may potentially have that type of support.  Is it safe to assume that this is the right thinking?  If so, I will go and review some of the spots that may need to consider both playback and capture paths ONLY for soc-usb. (as you highlighted one below)  Else, I can note an assumption somewhere that soc-usb supports playback only and add the capture path when implemented.

I don't think it's as simple as playback only or playback+capture. If
there is no support for capture, then there is also no support for
devices with implicit feedback - which uses the capture path. So you
gradually start drawing a jagged boundary of what is supported and what
isn't.

My preference would be to add capture in APIs where we can, with TODOs
added to make sure no one us under any illusion that the code is fully
tested. But at least some of the basic plumbing will be in place.

Takashi should chime in on this...

>>> + * @list - list head for SoC USB devices
>>> + **/
>>> +struct snd_soc_usb_device {
>>> +	int card_idx;
>>> +	int pcm_idx;
>>> +	int chip_idx;
>>> +	int num_playback;
>>> +	int num_capture;
>>> +	struct list_head list;
>>> +};
>>> +
>>> +/**
>>> + * struct snd_soc_usb
>>> + * @list - list head for SND SOC struct list
>>> + * @component - reference to ASoC component
>>> + * @num_supported_streams - number of supported concurrent sessions
>> ... but here we don't. And it's not clear what the working 'sessions'
>> means in the comment.
>>
>>> + * @connection_status_cb - callback to notify connection events
>>> + * @priv_data - driver data
>>> + **/
>>> +struct snd_soc_usb {
>>> +	struct list_head list;
>>> +	struct snd_soc_component *component;
>>> +	unsigned int num_supported_streams;
>>> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>> +			struct snd_soc_usb_device *sdev, bool connected);
>>> +	void *priv_data;
>>> +};
>>> +/**
>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>> USB port?
> Noted, refer to the last comment.
>>> + * @component: USB DPCM backend DAI component
>>> + * @num_streams: number of offloading sessions supported
>> same comment, is this direction-specific or not?
> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>> + * @data: private data
>>> + *
>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>> + * are used in subsequent sequences.
>>> + *
>>> + */
>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>> +					      int num_streams, void *data)
>>> +{
>>> +	struct snd_soc_usb *usb;
>>> +
>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>> +	if (!usb)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	usb->component = component;
>>> +	usb->priv_data = data;
>>> +	usb->num_supported_streams = num_streams;
>>> +
>>> +	return usb;
>>> +}
>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>> +
>>> +/**
>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>> + * @usb: allocated SOC USB device
>>> +
>>> + * Free and remove the SOC USB device from the available list of devices.
>> Now I am lost again on the device:port relationship. I am sure you've
>> explained this before but I forget things and the code isn't
>> self-explanatory.
>>
> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.

I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
it's not quite right, USB audio works across hubs.


