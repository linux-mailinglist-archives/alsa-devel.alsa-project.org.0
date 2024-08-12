Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A694F386
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 18:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC6B2234;
	Mon, 12 Aug 2024 18:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC6B2234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723479528;
	bh=C+REZLQz14gUYtQxBQ4k0O1BXwqSNt7VLHOsQU2J85Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S81GRzoowQukTjkW+5/+qDueLn8hevt7BKl9IR7o+yPSIUCZPkf6F7FUyM15C8mTw
	 NdFhzdBjLbPSuoB8PlXYP90enAAbpVngMK+bDAAqKBwQsJAn2ZicnTJ+LxoH6K/0cJ
	 kkDlbbSbjw9hGsklJYbDxgLhtktC2DKzE3I8L3tE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17A51F80423; Mon, 12 Aug 2024 18:18:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CFEF80579;
	Mon, 12 Aug 2024 18:18:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B4BF80423; Mon, 12 Aug 2024 18:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87972F80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 18:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87972F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dmPZi4z5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723479313; x=1755015313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+REZLQz14gUYtQxBQ4k0O1BXwqSNt7VLHOsQU2J85Q=;
  b=dmPZi4z5XLeFJyBW0VVYrs5Urt8wnwK5jB56MgkP/ZAcyWp5p+1KbER+
   HDy63gYkrpJx4vhBGGLqjK4CD8Gc9QqHABVfUDSk2ac7Q2+8Go0Qd3KUW
   9ZOb8+09eM1vzTseklMNicSbXxFebK8U0KNqRWPG3cCwCIyP9VXmIQAtd
   HRxomjIE5UBDR9LQbppC2AQliv1gx2Wa5KL+7QJ6Qu5dXCx5ekPD/In/M
   7hHSqHWkeuQaD7AvmefM/ZZNYDxtHOBzR3fPUJE6pFxZnA2tn2Y8kKaL7
   r+62hgNdDlvN2cwHGsOr7lU8un+dfpebz+lpLZ+HBVTWGHVDcB18jybDO
   w==;
X-CSE-ConnectionGUID: ZgXnG+TwTRGoNdPRoEG5Gw==
X-CSE-MsgGUID: 0M2iMfYTR8OaT0+zkwk9kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32989739"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="32989739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 09:15:09 -0700
X-CSE-ConnectionGUID: pwoS+pHUSRy6bZDQeJILNw==
X-CSE-MsgGUID: 4hPne9QIRm6PtY6nbvIJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="63173826"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 09:15:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdXhG-0000000EPIo-2JWP;
	Mon, 12 Aug 2024 19:15:02 +0300
Date: Mon, 12 Aug 2024 19:15:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH 00/12] ASoC: Intel: Remove skylake driver
Message-ID: <Zro1Bslw-L2FfC0c@smile.fi.intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6YZ7J2LEBYZXONER763WQTTXXUFHXJJO
X-Message-ID-Hash: 6YZ7J2LEBYZXONER763WQTTXXUFHXJJO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YZ7J2LEBYZXONER763WQTTXXUFHXJJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 12, 2024 at 11:43:16AM +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> The skylake-driver related UAPI has been removed with "ASoC: Drop
> soc-topology ABI v4 support" [2].
> 
> For the official kernel tree the deprecation begun with v6.0. Most
> skylake-drivers users moved to avs- or SOF-driver when AudioDSP
> capabilities are available on the platform or to snd-hda-intel
> (sound/pci/hda) when such capabilities are not.
> 
> For the supported trees the deprecation begun with v5.4 with v5.15 being
> the first where the skylake-driver is disabled entirely.
> 
> All machine board drivers that consume this DSP driver have their
> replacements present within sound/soc/intel/avs/boards/ directory.

I like the idea of having better and unified equivalent!
FWIW,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


