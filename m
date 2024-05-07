Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CE8BFE4C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F824857;
	Wed,  8 May 2024 15:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F824857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174202;
	bh=vVrb2QffCoJ3vhXc+JFVlfmhicKV2+XhcCMK/mhmbNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d7PGzYNaxLOTswp4g7xdAOBNXV+71qtMyVEx5TYjLvW6tWNE5CgiNgkypwfiCWBMo
	 hI6zX6mvbLNdPwwm3S7eyJl72z4/oniWrP0cfsGb6CCHZL+6LsuFpHNa8TeoildhQJ
	 VXkYuzT14eIa32eO9jysNJF4jvjDyH44y0AW1etI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8951EF805A1; Wed,  8 May 2024 15:16:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A661F80564;
	Wed,  8 May 2024 15:16:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1981BF804E7; Wed,  8 May 2024 15:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F09E8F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09E8F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=niP1okGf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174171; x=1746710171;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vVrb2QffCoJ3vhXc+JFVlfmhicKV2+XhcCMK/mhmbNc=;
  b=niP1okGfh7ouqsrYmf2vrCRCrczwqxwZLB2gDjdociS4JzOPakKLSILK
   B7KATxPe/F16qkU3KH1UcpFR2zjBMsX7gwnNljV6jxSL0Ng1AVlbw6haq
   dERUnMNSsPSIYu1WtC+6GgOAZf4RpdBXyIcooQJGMK28sqDYGn4vg8kBL
   faWp4rGgudN4ShCCSnbl0ExnVZbxcvJBhRleno8MPH1un2XyPTmM5LF3J
   mXZA18ozd8n4SJNG/iAVa9leM4FYfVexZx28iSAuPKalnZwwkXPyd1X/H
   TL/b18BY6zxaIsO2oZXqSFprwK9hlHjegZxoT3v28kkaaAGM/pFbd/VeO
   g==;
X-CSE-ConnectionGUID: jQ78MFYBQnyDYAfGEdUqqw==
X-CSE-MsgGUID: 0Upx+94hQ4yrWPMDtY7jQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413198"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:07 -0700
X-CSE-ConnectionGUID: BG53EO0uQn2K/bzllqF7BQ==
X-CSE-MsgGUID: 2orAWzXGQXSUs+sTMvostg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356733"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:06 -0700
Message-ID: <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
Date: Tue, 7 May 2024 15:26:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 07/39] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240507195116.9464-8-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-8-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RYDMDTSJG6Z5JYCJMPQVP37YJSGEGKFC
X-Message-ID-Hash: RYDMDTSJG6Z5JYCJMPQVP37YJSGEGKFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYDMDTSJG6Z5JYCJMPQVP37YJSGEGKFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +const char *snd_soc_usb_get_components_tag(bool playback)
> +{
> +	if (playback)
> +		return "usbplaybackoffload: 1";
> +	else
> +		return "usbcaptureoffload : 1";

why are there different spaces and do we need spaces in the first place?

> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
> +{
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;

make the function return void?

> +int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx == usb) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;

make this return void?


