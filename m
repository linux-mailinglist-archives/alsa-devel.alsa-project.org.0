Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D973951979
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:55:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB76299D;
	Wed, 14 Aug 2024 12:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB76299D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632935;
	bh=wj88B6BBi8tG04+C5SWDMso/uHUJfPvBpn1JpU98qQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DGkvFGLcb234vUYFTi+f/QRr8jiL9GrbgeRHhLtL/2iOPs8SJiRiYcLqJXEn76gEJ
	 +bdEwwUHd05S85B2Jk4uYNaKEHQlpZO4JXjPxnWfuIz7Fs0Ih7gdImMRsf9mNdIEji
	 MmmS/B6R6+HJ97oUgb3AXiXcRW7cXhfskFYji2aQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B6DCF806E0; Wed, 14 Aug 2024 12:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72556F806E8;
	Wed, 14 Aug 2024 12:53:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C481BF80423; Wed, 14 Aug 2024 11:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E936F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 11:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E936F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MWfz/CfS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723627274; x=1755163274;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wj88B6BBi8tG04+C5SWDMso/uHUJfPvBpn1JpU98qQI=;
  b=MWfz/CfSCFa66TRz3ijjF4MVbLDUu6nqs7dMRwZotnCET03oXwhEDuI2
   G762ipPjwKeJ3JaQEv8SDQNbZUN8Co1MfsaoMGEUsK1VZxkrAPm5m95p4
   u/weVUOGwQKfcaP1PLlxc6uK8OFUWgU87leDJHHUaG+1+Lub+Fiq9sHL9
   FD6l+MUgHHTLvPdeM1s/NQp47SGts3yNcLL94Nkx3C4zVT0JNh+KTwmex
   bXt9X6rk1stH5I7C7s5gmahAh1G+mHUkL5lsXrhS9LOt6aUZ4fIrcTzj0
   SwYhFQfHDpuyGuhYssIccf3ZJ6G1MJrUfcrjLuk8wJSWiaagJzu0P382o
   Q==;
X-CSE-ConnectionGUID: iv886jiJRuqnsAGnvex+UQ==
X-CSE-MsgGUID: 9OoTGAoZSmewaSD4SIw6VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39282579"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="39282579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:21:08 -0700
X-CSE-ConnectionGUID: C5GMpR9eT82uHlsNZHJFaQ==
X-CSE-MsgGUID: MS7yrPWQTkWJMZoDPeQKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="58655845"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.67])
 ([10.245.246.67])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:21:03 -0700
Message-ID: <74d413f3-45ab-405d-8dff-122785ae7da5@linux.intel.com>
Date: Wed, 14 Aug 2024 11:20:59 +0200
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
 <6855763c-0230-4535-a603-343059de5202@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6855763c-0230-4535-a603-343059de5202@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KX3LUJ2KY4LK3DP5NEUV5B43ZYVDVFPI
X-Message-ID-Hash: KX3LUJ2KY4LK3DP5NEUV5B43ZYVDVFPI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KX3LUJ2KY4LK3DP5NEUV5B43ZYVDVFPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>>> + * @list - list head for SoC USB devices
>>>>> + **/
>>>>> +struct snd_soc_usb_device {
>>>>> +	int card_idx;
>>>>> +	int pcm_idx;
>>>>> +	int chip_idx;
>>>>> +	int num_playback;
>>>>> +	int num_capture;
>>>>> +	struct list_head list;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct snd_soc_usb
>>>>> + * @list - list head for SND SOC struct list
>>>>> + * @component - reference to ASoC component
>>>>> + * @num_supported_streams - number of supported concurrent sessions
>>>> ... but here we don't. And it's not clear what the working 'sessions'
>>>> means in the comment.
> 
> After taking a look at this "num_supported_streams" naming a bit more, I wanted to check with you to see adds to the complexity of the terminology being used across soc-usb.
> 
> The intention of this is to define how many concurrent USB devices the USB backend can support.  So for example, if the audio DSP did support multiple USB devices at the same time, this would denote that.  This is where I wanted to make sure the terminology was right....  So in this case, to me, it makes more sense if num_supported_streams --> num_supported_devices, because it determines how many USB devices the ASoC USB backend DAI can manage/support.  This adds a bit to the reason why I think using the term "port" for explaining the SOC USB context is reasonable.

IIRC the USB specs define a hierarchy of device/interface/endpoint
concepts. For streaming the only thing that really matters is the number
of data endpoints, isn't it? If you have two devices with a single
endpoint each or one device with two endpoints it should be the same
complexity at the DSP level?


