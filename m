Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E818C7F348
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Nov 2025 08:38:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360E360206;
	Mon, 24 Nov 2025 08:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360E360206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763969923;
	bh=owh2dQTcZvus5C8V4A/hK3/MF41Gy0WTVum1crE0+9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZL3C+Rbv051SnYWXKDQhb9LXmdfzhQ4++5LYhw5SUt1Zti2Nf62GXpqheGUrqEsUZ
	 WnaPFn2CEkYD6dH00C02+C36HvJGsnGJsQ/BD83qAm+bgLb13aaZ9D/hQDuaMl9AGx
	 cOgQjTYX+Qd/ko4nxly0YOU09QjhPflrUiN5ufAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C6AAF805D3; Mon, 24 Nov 2025 08:38:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73636F805C1;
	Mon, 24 Nov 2025 08:38:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEF5EF8026A; Mon, 24 Nov 2025 08:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47CD9F800BF
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 08:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CD9F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ahdD8O+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763969818; x=1795505818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owh2dQTcZvus5C8V4A/hK3/MF41Gy0WTVum1crE0+9w=;
  b=ahdD8O+enGgv+ztb7UagSzisnijYyPjllBuNOVbpesUYYoxrXtUXu2Ek
   nYLa3U/UnmwQEURaKgS0+CXST/mGjdI4P0kUalw3MIMV5hcpWZeLFD+X6
   Og3CY1w8NyrKcKaGmypbxBraOLS1tmzurK7IA3WSNwrgiQjnZY8tzujQ7
   KoIpIDQV7GyecxOtHfKYULxbqBXy4Bf+hmZmDHkX69JIfmQtVTIzjSmuh
   VaqEDzrdA6qqKaXTy2qORItZ6i4m00EFLaP8YjFOEPMh+hPNc8FHVr5MZ
   qVBfo7akQDXzgspy0Dtt03B9dGXvWMAVnlvsE3A9beRzHP3SHiwOLuYHq
   Q==;
X-CSE-ConnectionGUID: 3TcYzxrIS4mlGwbrTpOrUA==
X-CSE-MsgGUID: elYV5BW1Ruqo8Z2aPQTIYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91448801"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="91448801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:36:53 -0800
X-CSE-ConnectionGUID: 36cD+iiFRBKDNRwZbusgNQ==
X-CSE-MsgGUID: vf+brltTSkiIVNRhZ4sAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="197190315"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:36:51 -0800
Date: Mon, 24 Nov 2025 09:36:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore irq for I2C device
Message-ID: <aSQLEZCLM0t3BbHl@smile.fi.intel.com>
References: <20251122095903.2239-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122095903.2239-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: ICQ3E4TWA7SOQ2FOKBCLQGCAKNRVAMBG
X-Message-ID-Hash: ICQ3E4TWA7SOQ2FOKBCLQGCAKNRVAMBG
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICQ3E4TWA7SOQ2FOKBCLQGCAKNRVAMBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Nov 22, 2025 at 05:59:03PM +0800, Baojun Xu wrote:
> In some projects (HP Lampass), no GPIO was assigned for irq,
> it would be better to ignore it.

I don't think this is correct approach, but Hans probably knows better
the code.

Also when touching this kind of drivers, please provide ACPI DSDT excerpt
to show the Device object description in question.

-- 
With Best Regards,
Andy Shevchenko


