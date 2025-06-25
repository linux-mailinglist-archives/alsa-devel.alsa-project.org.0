Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61599AE868D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 16:32:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63E49601F7;
	Wed, 25 Jun 2025 16:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63E49601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750861973;
	bh=rCq+10V8kvQVQDCpo3gDQO1W/xhhokZmr/PSfH38bpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BYKb48E+fzj6ybvTmtsbNdmVnpDBsV4VktkeE90Pqnd9A6Pj/ReL69cyWqc1zbiRL
	 D6QiimFBSbwAql2m4ifNcvg63z+oyoOyDWvor8gcExKS6sf9Q0Wv3/mCbyyy+s2XUZ
	 M/gbaHHZ1JorX5d5sHNzS/3UHnBjq3kYiOu1j/OM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10BD7F805BD; Wed, 25 Jun 2025 16:32:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2517F805C7;
	Wed, 25 Jun 2025 16:32:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60A3F804FB; Wed, 25 Jun 2025 16:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F6FF800B6
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 16:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F6FF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BMOHLRZt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750861934; x=1782397934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCq+10V8kvQVQDCpo3gDQO1W/xhhokZmr/PSfH38bpI=;
  b=BMOHLRZt+ERItfDpweeTTct5XazlqqviP3MT8/Ikws/zU4GO2c+ItODK
   AsoLirg4NLoaoVDycqRZ78T7JUcIcmItRwe/q9TUB1sf4fU/OGDTZ38Do
   zFFVvPPjMaPRGwghpHXEcAueVjA0y4ONoQIXeiXZTFr9sbu2lVyvz5jU+
   7rt4+VyWvBeNPlEZuVYgdOx0iDGYG2TpehMZg+6T+VwCtdgLmN2eU4EMH
   gK2FIaR54G3f3qmAGDwgCN6agFNrwwxARNxZuMa+tfXZKb9QVwqRoZxH5
   TGe9jgy/PP9bvm46xMtAAJW/A8IOslik5Pp2VNeS1GADTrwkBzC4Et+o4
   Q==;
X-CSE-ConnectionGUID: TfFg9jh2T4SNq02wRsG2gQ==
X-CSE-MsgGUID: j0lTesWNQyCioKOXkMjtlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63737750"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600";
   d="scan'208";a="63737750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:32:08 -0700
X-CSE-ConnectionGUID: 7hRUrgYkTA+5k8UPvD7FLQ==
X-CSE-MsgGUID: VhfC+rgERpaF9NjLsQkh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600";
   d="scan'208";a="152942933"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:32:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uURAR-00000009ns2-3Ee7;
	Wed, 25 Jun 2025 17:32:03 +0300
Date: Wed, 25 Jun 2025 17:32:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, alsa-devel@alsa-project.org,
	baojun.xu@ti.com, shenghao-ding@ti.com, liam.r.girdwood@intel.com,
	navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2 4/4] ASoc: pcm6240: dt-bindings device support list
 update
Message-ID: <aFwIY98_PzcVogoW@smile.fi.intel.com>
References: <20250624153742.1507-1-niranjan.hy@ti.com>
 <20250624153742.1507-5-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624153742.1507-5-niranjan.hy@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: NFB57UPVCIOIPLQ4IGSNRF77ZFWMRDLU
X-Message-ID-Hash: NFB57UPVCIOIPLQ4IGSNRF77ZFWMRDLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFB57UPVCIOIPLQ4IGSNRF77ZFWMRDLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 24, 2025 at 09:07:42PM +0530, Niranjan H Y wrote:
> Removed taa* and tad* device from the support list
> as these devices are supported by tac5x1x codec driver

Same question, why are DT mailing list and maintainers excluded from the
distribution?

-- 
With Best Regards,
Andy Shevchenko


