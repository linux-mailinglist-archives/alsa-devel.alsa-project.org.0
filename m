Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C38BFE75
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F95E7D;
	Wed,  8 May 2024 15:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F95E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174329;
	bh=gQ4XL8BmkP07oBddLqlnRnQ5uY4XUZH2ALIHdrPqhas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N0Awc++EgLA/vT9Oe7jvJi5G//N2sdWAyykUH09UhSOQPCv5YJtmddD1QjyWxituP
	 uOpRZyrN+J7+8KKeZf9S7fLCbETbRH9nSby/KQ9yC5SFMYAw6Rhd1kKBoyYRFK4Xsa
	 ZojfIScPTUHaII0nqaKTdeLwYLNG21dyKIxSaBbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E32D9F806B0; Wed,  8 May 2024 15:16:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFC4F806B5;
	Wed,  8 May 2024 15:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A32F80610; Wed,  8 May 2024 15:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4373F805E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4373F805E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hdVT42ho
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174185; x=1746710185;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gQ4XL8BmkP07oBddLqlnRnQ5uY4XUZH2ALIHdrPqhas=;
  b=hdVT42hoZOXmDYe0O6ZuxAFVQ+4Ge757N5oEn9/tOhRcCdKC6fNro+gO
   dPl4BgaRN0BpdInnwIRTRdWobSVZSojGJ+TT74OiZ9kE88NcoYi9aMRUD
   Zvs73OMOh6dCxxbj0WLaaRRzqjFW0GSflXXItSFcPhOU/99gn7ixKWzS1
   vOKjkirjSMcQeueEJYKvPXsZOcj8T0l0iKf2lU8WWYDqEVELouXSrGEGU
   oQ3d3Cds7iYBIKBZnXEDEcC6BIv6du5nOiQfUMGy7pM/u6RFNOumvCUbQ
   H5tzPYA2RGgKI0YPdhdpK1oRLsT1+pwCw1UoRGFq/xnC0mOUB2o73lrAJ
   w==;
X-CSE-ConnectionGUID: j22P+hZSREKzq3TR2klNPg==
X-CSE-MsgGUID: JulGYmZXTHqAF2SJ0EgFow==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413311"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:23 -0700
X-CSE-ConnectionGUID: DZNJ1++zQUamCAy0Wc3MPw==
X-CSE-MsgGUID: p99V4mIHQi6lXjfwtugazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356839"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:21 -0700
Message-ID: <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
Date: Tue, 7 May 2024 16:37:01 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W6N2IFURMWMHCIFA5TONVMUXFGXXYEGD
X-Message-ID-Hash: W6N2IFURMWMHCIFA5TONVMUXFGXXYEGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6N2IFURMWMHCIFA5TONVMUXFGXXYEGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/7/24 14:51, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> index is associated with the ASoC platform card supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.  SOC USB will expose more
> details about the current offloading status, which includes the USB sound
> card and USB PCM device indexes currently being used.
> 
> It is expected for the USB offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Capable Card'
> 0 (range -1->32)

You already gave the following examples in patch 29:

"
USB offloading idle:
tinymix -D 0 get 'USB Offload Playback Route Status'
-->-1, -1 (range -1->32)

USB offloading active(USB card#1 pcm#0):
tinymix -D 0 get 'USB Offload Playback Route Status'
-->1, 0 (range -1->32)
"

Can you clarify how many controls there would be in the end?
Also isn't tinymix -D N going to give you the controls for card N?

