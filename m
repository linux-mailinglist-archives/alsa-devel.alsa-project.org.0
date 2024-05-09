Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9538C15CB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D06210F;
	Thu,  9 May 2024 21:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D06210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284696;
	bh=+Xg6sg0lsspm+oGIl2gKYWFJ9L1HRkPP8JWiP000C8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FM57lPx/KB/diIHccFcQorc2zHMh7q9h8Z2mqV72FLARz6iV6V+zGZIiqSIxtlVTI
	 Pxr0Ltq7w+avazMMzd/RlmBdp76pPowEgpvRmtdmkQbdGBpE/YggvUUI7IxoNXO+Yl
	 QUwkbVWkR/2Dx73IefQN4oDulSalu6nfP2NfyfNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0800F80152; Thu,  9 May 2024 21:56:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DED9F80681;
	Thu,  9 May 2024 21:56:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B2EF80630; Thu,  9 May 2024 21:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DA3BF80623
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA3BF80623
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gpGW4apG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284595; x=1746820595;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Xg6sg0lsspm+oGIl2gKYWFJ9L1HRkPP8JWiP000C8Y=;
  b=gpGW4apGJySMVwvQW6F3K9q25qg2bucYSh3lm+6XeHjNYo7GRgwk6vIo
   3PJyuBqo7caWKHSBcmkqNFjHAOIKSJe+zPEBTQhN9YA34WbG2CDN39SNc
   LtvX6VxaP7mVz7SAVEDJx6B1erCS+KBw7te2fb+31ZqhhkzBbD1aXUZvc
   /XLbD0Qv5OpFuYBwdsAWcNioyNhsqyBb6qO3zZlICZJWuMaVYmdpup8dJ
   Xx/8h+phTgXJgyaMzfVEmdPcqPWtUJuiLVjOimgNcv5emrFx0BCidejPY
   2VXb2tcR03zT22twpBQGtoJ7GW47t+GyGpdAJCfSZLlwFVlHjrSWr9AER
   w==;
X-CSE-ConnectionGUID: J0uQSDg2RVy5b5CRvPZ+NA==
X-CSE-MsgGUID: dmRMBuktR7SPagGuXU812Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454303"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:32 -0700
X-CSE-ConnectionGUID: 1ox1AHb5TkOlj5+tCcFZIQ==
X-CSE-MsgGUID: qXDyMCKMR7Opd+vqjTIr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213141"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:28 -0700
Message-ID: <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
Date: Thu, 9 May 2024 08:17:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
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
 <20240507195116.9464-39-quic_wcheng@quicinc.com>
 <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
 <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QGKVCGGZCRR5RWFTQC23TQMWKWUTH5DU
X-Message-ID-Hash: QGKVCGGZCRR5RWFTQC23TQMWKWUTH5DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGKVCGGZCRR5RWFTQC23TQMWKWUTH5DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/8/24 15:06, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:40 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/7/24 14:51, Wesley Cheng wrote:
>>> For userspace to know about certain capabilities of the current platform
>>> card, add tags to the components string that it can use to enable
>>> support
>>> for that audio path.  In case of USB offloading, the "usboffldplybk:
>>> 1" tag
>>
>> usboffloadplayback?
>>
>> same question as before, do we need spaces?
>>
> 
> I think spaces are currently used as a delimiter, so I'll remove the
> spaces.
> 
>> And if we have controls, why do we need component strings? The component
>> string is not dynamic to the best of my knowledge, this could be
>> problematic if the card is no longer capable of supporting this stream,
>> while a control can be updated at will.
>>
> 
> Maybe I misunderstood your comment here:
> 
> https://lore.kernel.org/linux-usb/925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com/
> 
> At the time, I didn't include the kcontrols on the USB SND portion of
> it, which was added after this series.  My interpretation was that there
> were userspace entities that could query for general information about
> what the card supports based on the components string, or sound card
> name.  I treated this as an independent identifier, since the change to
> add the offload capable jack was present.

My comment at the time stands: it's very hard to figure out that a
random card supports USB and is connected to a given endpoint.

It'd be much easier as you wrote in the comments on patch 34 to have a
control in the "regular" USB card to point to the 'better' offloaded
path exposed by another card. Applications wouldn't need to know what
this other card is, they would then use the card:device information
directly.
