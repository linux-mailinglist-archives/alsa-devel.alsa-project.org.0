Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49E8CD332
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 15:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F2E857;
	Thu, 23 May 2024 15:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F2E857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716469531;
	bh=YMmJlwEO6z/2N4gfb/N1NI+yIAQXzLQrbPEn8oT4pI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aof8smSxibZHfp2ZDGm2jANqwuQHxKkcgWz86TzTzY06ifX3QsvStlsoWI3Ka5hFU
	 PzTzc6W001QZpVmTNQT+cNFvd2+y5xcLKBxi8arnOvhDhnEjfTJj2pWbLIUWq9m91v
	 Ao2/2h2Qh+nQXqonjh1O8HuXijwI3XOhsasbAB+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B94F1F805A0; Thu, 23 May 2024 15:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 260EAF8051F;
	Thu, 23 May 2024 15:04:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C72FF8026A; Thu, 23 May 2024 15:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C3F2F8016B
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 15:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3F2F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Au+WKyWn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716469422; x=1748005422;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YMmJlwEO6z/2N4gfb/N1NI+yIAQXzLQrbPEn8oT4pI4=;
  b=Au+WKyWnx/4/SesEOof5YhpOflP0cOqCAa3M0guVfuSve26a2YRqIMSG
   JV0B++8UZtwuQ2FOdDyfFT3AZniRkaRM+kfyw3h7RnM0Alzsri24vpfZg
   rOUi4E7WDK9ypW470yL4NkdaSDwcP6tb7Pg+ZQSzGvcSCQC8vH7xObyQt
   YrYxjDOBupJOZ7NjNvv6ojCK1OPfFB9g6dGWblKmhwC/smx1RQxHn4//h
   p3Ihf1mJwW5X7RrxLF09/VrW7cFP+yb8GLvvPw7v+LUwnZpFQlzlbBZwX
   UG0URYHtTEGe8IiWOJKua9U71lldcV+2FLFQdyGBdUoFdeVutxYe5CpJg
   w==;
X-CSE-ConnectionGUID: /2su7xkrT9Gm8hkn9tlPFg==
X-CSE-MsgGUID: qmUtZzFqSECy0xf1Na+zFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12632739"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000";
   d="scan'208";a="12632739"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:03:34 -0700
X-CSE-ConnectionGUID: 7ZpvCSp4QXCbrj5RfMdAuA==
X-CSE-MsgGUID: mPnkKae6STypwEWjPV8wCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000";
   d="scan'208";a="33550442"
Received: from unknown (HELO [10.125.110.41]) ([10.125.110.41])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:03:32 -0700
Message-ID: <9dd05175-a5a4-409e-88aa-4a3d5800724d@linux.intel.com>
Date: Wed, 22 May 2024 08:40:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols and tas2563
 digtial gain for Chromebook
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, judyhsiao@google.com, alsa-devel@alsa-project.org,
 i-salazar@ti.com, linux-kernel@vger.kernel.org, j-chadha@ti.com,
 liam.r.girdwood@intel.com, bard.liao@intel.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, kevin-lu@ti.com,
 yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com, navada@ti.com, cujomalainey@google.com, aanya@ti.com,
 nayeem.mahmud@ti.com
References: <20240522112942.994-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240522112942.994-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GZZNYLW4EBWYGURN5TK6KG5UPJ5C36K4
X-Message-ID-Hash: GZZNYLW4EBWYGURN5TK6KG5UPJ5C36K4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZZNYLW4EBWYGURN5TK6KG5UPJ5C36K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



Could you move this sort of renaming/editing to a first patch?

>  /*Software Reset */
> -#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0X0, 0x01)
> -#define TAS2781_REG_SWRESET_RESET	BIT(0)
> +#define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x00, 0X00, 0x01)
> +#define TASDEVICE_REG_SWRESET_RESET	BIT(0)

> -// tas2781-lib.c -- TAS2781 Common functions for HDA and ASoC Audio drivers
> +// tas2781-comlib.c -- TAS2781 Common functions for HDA and ASoC Audio drivers
>  //
> -// Copyright 2023 Texas Instruments, Inc.
> +// Copyright 2023 - 2024 Texas Instruments, Inc.

> @@ -254,8 +281,8 @@ void tas2781_reset(struct tasdevice_priv *tas_dev)
>  	} else {
>  		for (i = 0; i < tas_dev->ndev; i++) {
>  			ret = tasdevice_dev_write(tas_dev, i,
> -				TAS2781_REG_SWRESET,
> -				TAS2781_REG_SWRESET_RESET);
> +				TASDEVICE_REG_SWRESET,
> +				TASDEVICE_REG_SWRESET_RESET);

> @@ -591,8 +1470,8 @@ static const struct snd_soc_component_driver
>  	soc_codec_driver_tasdevice = {
>  	.probe			= tasdevice_codec_probe,
>  	.remove			= tasdevice_codec_remove,
> -	.controls		= tas2781_snd_controls,
> -	.num_controls		= ARRAY_SIZE(tas2781_snd_controls),
> +	.controls		= tasdevice_snd_controls,
> +	.num_controls		= ARRAY_SIZE(tasdevice_snd_controls),
>  	.dapm_widgets		= tasdevice_dapm_widgets,
>  	.num_dapm_widgets	= ARRAY_SIZE(tasdevice_dapm_widgets),
>  	.dapm_routes		= tasdevice_audio_map,

And then add functional changes in a second patch? It'd be simpler to
review really...
