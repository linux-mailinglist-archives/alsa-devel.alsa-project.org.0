Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871C77BB03
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A5E828;
	Mon, 14 Aug 2023 16:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A5E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692022158;
	bh=7S1IyHGHSebJast9hBeMM//N2B1gf7ilFZZS88LviEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJuO6bs1A2RI0lWQI62FOshRfe0kuuVA0u+0hZoEIN3tp5c+UoakdOyXaSZoZlH/1
	 6C/dUEYp2hP45YmDeFJQHc/MwCmQiCQc10I4fdh/kfzSe/jWNLb8FE9A/AJIaqtLTW
	 r55hjK4YXMJS8mOfHZCTYXw8aNaNk2/YGs0qci5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0974F80551; Mon, 14 Aug 2023 16:07:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 636F1F80558;
	Mon, 14 Aug 2023 16:07:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14F81F80290; Mon, 14 Aug 2023 16:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 253B0F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253B0F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H7FvVsN/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022049; x=1723558049;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7S1IyHGHSebJast9hBeMM//N2B1gf7ilFZZS88LviEI=;
  b=H7FvVsN/kHcF9M6VY3G7e9qxSGo56jiF2RZAABcxk+S/yO7RseGG/6If
   mSMFh9Jp9BSu3bW611VUl/SDdcd48/7shBngU6/57osWXswSO32/Sal/U
   NmCWmVlzCgRuhhACYRhMlL9bcD5x3kXK/2qsjYhqSRI2BxIDFBG5xnTFY
   0+YoD04QzLHx/VHmCwjh92zGCf5aICuMJ+kR0tHjHMoj9OCA0SrTNXpW1
   11cMyH+3IoLdxzBMgWRBZLLRCXeYSubGsBxlf+lQzGJQyrX3a+Da2zsSH
   bEvbMEOdiXHzDqHlgbCnIl/38NHjXYJ6wxgTyUQubYqmc1xdulCCQ1++m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370943675"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="370943675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798825220"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="798825220"
Received: from ryana2x-mobl.amr.corp.intel.com (HELO [10.212.126.76])
 ([10.212.126.76])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:23 -0700
Message-ID: <dfdc7097-6286-f3a5-be41-eafd73fe128b@linux.intel.com>
Date: Mon, 14 Aug 2023 08:54:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Content-Language: en-US
To: Brady Norander <bradynorander@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@linux.intel.com,
 perex@perex.cz, tiwai@suse.de
References: <20230814012637.487602-1-bradynorander@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230814012637.487602-1-bradynorander@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MUMPCTGB2QSMVDE6VXVP3QYZ4UNTVDTL
X-Message-ID-Hash: MUMPCTGB2QSMVDE6VXVP3QYZ4UNTVDTL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUMPCTGB2QSMVDE6VXVP3QYZ4UNTVDTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/13/23 20:26, Brady Norander wrote:
> AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> default. Add a quirk to use the SOF driver on these platforms, which is
> needed for functional internal audio.

that would be wise indeed, I must admit not recalling why this isn't the
case. Curtis?


> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,

Humm, that doesn't seem like a supported configuration, IIRC all the PX
skews are for embedded Linux stuff.

> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},

>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
>  	},
> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,

same here, I don't think we can blindly add quirks.

One might argue it doesn't hurt but not all SKUs are supported by Chrome.

> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
