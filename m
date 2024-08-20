Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB3957EAB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 08:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85D582C;
	Tue, 20 Aug 2024 08:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85D582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724136750;
	bh=/hHiRcXgLHm4sUaUmn1kvv9aDZlbaGSXQTZLN7Klh8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MVNMD7X7YiFVYQoVdJrlkKRqW2Wi0oRHNpXfgzZAvNC2cH7lygUXM3fL+1CFaUhng
	 GcJjkc9SoypXS4cIu2R0DW8Qw1FBuvrNhFPnVKFPWMrWfqHFfY/tVKF4EA4LY29xPZ
	 NBsqldgI2j8nvP6hO6dxn80pn7FYRWD80/YS7Rr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00047F805B5; Tue, 20 Aug 2024 08:51:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA723F805B1;
	Tue, 20 Aug 2024 08:51:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C0EF80494; Tue, 20 Aug 2024 08:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98C4AF8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 08:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98C4AF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A3c46FSY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724136011; x=1755672011;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/hHiRcXgLHm4sUaUmn1kvv9aDZlbaGSXQTZLN7Klh8Q=;
  b=A3c46FSYn4f8+rtp+JE0TECZWrqvVBC4iaxKiBeGKerNJK5j8IpClFan
   hrzKM/jDzrLX68sCGsY4JOMGaeBu4Hrlakclsdga3kl6cbtjy3FoBYsc5
   7x0z8J6ZPiH+iQBaT1CiavZDr62u7F9zOcwvP+Fgck4nNmudmrITkqBRs
   q7U3ZK7P+2dXmf93EcNmDbpKYrZ3FgZb2S/8gqkvM1+EaJJblOYmoO9oJ
   9ETYXBMsb8Nt5X1b8z8R+kH042Ryq04zBKPOMb9VFr82wjxsCe1DalRgh
   1V8XHoRaXaiT5Df0MOy5C9YR5QFAjZvz/2OoMMFKIDje8Yrk3tODVDDbJ
   w==;
X-CSE-ConnectionGUID: qtjGL9/aTKupXYypXQs9Yw==
X-CSE-MsgGUID: V7vHq5WfSFWUyHdEUOo8pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22297505"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="22297505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 23:40:05 -0700
X-CSE-ConnectionGUID: BsfZeq6bQjGX4UIBe0hLfA==
X-CSE-MsgGUID: efE7EHc2Sbe1ViKK24ig2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="91394800"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176])
 ([10.245.246.176])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 23:39:59 -0700
Message-ID: <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
Date: Tue, 20 Aug 2024 08:39:56 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5ZOXKELIEKY62NALESK2WAEMPTTI7N3H
X-Message-ID-Hash: 5ZOXKELIEKY62NALESK2WAEMPTTI7N3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZOXKELIEKY62NALESK2WAEMPTTI7N3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +/**
>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>> + * @chip - USB SND chip device
>>> + *
>>> + * Creates a sound control for a USB audio device, so that applications can
>>> + * query for if there is an available USB audio offload path, and which
>>> + * card is managing it.
>>> + */
>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>> +{
>>> +	struct usb_device *udev = chip->dev;
>>> +	struct snd_kcontrol_new *chip_kctl;
>>> +	struct snd_usb_stream *as;
>>> +	char ctl_name[37];
>>> +	int ret;
>>> +
>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>> +		chip_kctl->count = 1;
>>> +		/*
>>> +		 * Store the associated USB SND card number and PCM index for
>>> +		 * the kctl.
>>> +		 */
>>> +		chip_kctl->private_value = as->pcm_index |
>>> +					  chip->card->number << 16;
>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>> +			as->pcm_index);
>>> +		chip_kctl->name = ctl_name;
>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>> +				  udev->bus->sysdev));
>>> +		if (ret < 0)
>>> +			break;
>>> +	}
>>> +
>>> +	return ret;
> Hi Pierre,
>> None of this looks Qualcomm-specific, shouldn't this be part of the
>> soc_usb framework instead of being added in the qcom/ stuff?
> 
> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
> 
> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
> 
> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
> 
> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.

My comment was only referring to the location of the code, it's now in
sound/usb/qcom/mixer_usb_offload.c but does not contain anything
specific to Qualcomm. I was not asking for any encapsulation inside of
soc-usb, I was only suggesting a move of the code to a shared helper
library so that this code can be reused as is and not duplicated if the
QCOM parts are not compiled in.
