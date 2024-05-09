Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392108C15C9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA3B20C1;
	Thu,  9 May 2024 21:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA3B20C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284687;
	bh=KWpE0p6D5Mx4AC48PvOC39QYe6ueT3DevHp41Jg8ly4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MbTy654QWoRgrrNsEOmB8xVG/k+eZEu5+9zO3ZK0jSWQnRmZ6aDl6fNsRCHHj1GaH
	 JCNRIGFo9yQkUDKtOhXa9dIxMkAEuH7sgPtEZ1OYm6HD9JvhRXNQ3mnm03X2fZ2Lgf
	 49raJPIXa7X/QhXAxT+S+rWwLd1Nf5+Toeq/u1Ko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B697F8064C; Thu,  9 May 2024 21:56:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1812F8063C;
	Thu,  9 May 2024 21:56:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50DC0F805D9; Thu,  9 May 2024 21:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7580F805BB
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7580F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J9Mw3Uch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284588; x=1746820588;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KWpE0p6D5Mx4AC48PvOC39QYe6ueT3DevHp41Jg8ly4=;
  b=J9Mw3UchZBQbHyRAlNP7KKruD8M9mlOLsadZgbChgZ0YB+uOKvpXjL6Q
   lqDHNiCRCZQ88c2anZDwZp3hdn6KnmFYVRZtf8UzkTLLzP7+GvGzSP0Vr
   66kdumP0L0zpo53VYZDpvOar+mfw+K1QR4pNwSeRo8THGP7pR7eogXBzA
   79c8GIyNugoRIgl3pO4et9rIJt0YvI9Gxi0Q9AVWSTyWMi4xTIqIaCF0c
   jG76eyJl0XhjacfSbBh0e2wCB3LtK+6vF/mqKUyAMXR1UBfyr08+cR3r6
   m2OnV1GehDdRhkTg/AP0i/N8A1p4xHDuMBHXPkx8jGcvFjRsHz+SXwcPv
   w==;
X-CSE-ConnectionGUID: 42vN64JbSzuWhZHQdDW7gg==
X-CSE-MsgGUID: VVVVQhnoQZa03H42wzSMlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454296"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:26 -0700
X-CSE-ConnectionGUID: a41ju8XXQeG9r7e6NCexkA==
X-CSE-MsgGUID: lQw9T7pCRA6d3UjUMCy9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213124"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:23 -0700
Message-ID: <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
Date: Thu, 9 May 2024 08:11:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 34/39] ALSA: usb-audio: Add USB offloading capable
 kcontrol
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
 <20240507195116.9464-35-quic_wcheng@quicinc.com>
 <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
 <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
 <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SXPHI7HL6CRJY2JKMCCTXYXMNMQXSPP
X-Message-ID-Hash: 2SXPHI7HL6CRJY2JKMCCTXYXMNMQXSPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SXPHI7HL6CRJY2JKMCCTXYXMNMQXSPP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> It is expected for the USB offloading driver to add the kcontrol to the
>>>> sound card associated with the USB audio device.  An example output
>>>> would
>>>> look like:
>>>>
>>>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>>>> 0 (range -1->32)
>>>
>>> You already gave the following examples in patch 29:
>>>
>>> "
>>> USB offloading idle:
>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>> -->-1, -1 (range -1->32)
>>>
>>> USB offloading active(USB card#1 pcm#0):
>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>> -->1, 0 (range -1->32)
>>> "
>>>
>>> Can you clarify how many controls there would be in the end?
>>
>> For USB offload situations, there will be a set of controls for
>> playback status and playback select.  The offload jack will also be
>> there to tell us if there is an offload path available for the
>> platform ASoC sound card.
>>
>>> Also isn't tinymix -D N going to give you the controls for card N?
>>>
>>
>> Yes, since the offload portion is handled as a DPCM DAI link to the
>> platform ASoC card, it will be included as a kcontrol for that.
>>
>> Thanks
>> Wesley Cheng
>>
>>
> 
> Sorry for responding again.  I read your email again, and wanted to also
> add that aside from the above, which are all within the ASoC layer, as
> we discussed previously, we should have a kcontrol in the USB SND card
> to determine if there is an ASoC platform card capable of offloading.
> This is also available from the SND card created by the USB audio device.

That makes sense: if the application wanted to use a given endpoint, it
could check if there is a 'better' path exposed by another card. It'd be
a lot easier than reading controls from random cards.

Was this part of this patchset or more of an idea for a future addition?
