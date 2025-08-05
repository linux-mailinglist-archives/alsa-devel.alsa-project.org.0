Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E392B1BBCF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Aug 2025 23:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D586029D;
	Tue,  5 Aug 2025 23:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D586029D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754429853;
	bh=bvg20eZHbAjBzTXGeTHpnNdERiU2rFxDpliw0tBwoPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SFP2GAYm2foSK1P5UP40Br4Jouo0N5o6wAGiYM60kv1MGaUkSQRl0psuQHJA70iQJ
	 upf6kMJZscIi4sYIA0Mzqfm2m1lFhPtfy0udKDd0ApCFxMrmdMV3WcweTbZoNuH90Y
	 xjoneqyki0mjFF0t0WsMAErTo4zpDPKJnr9ZBVwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF45F805D3; Tue,  5 Aug 2025 23:36:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10668F805C5;
	Tue,  5 Aug 2025 23:36:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDF4EF804B3; Tue,  5 Aug 2025 23:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0232FF800FE
	for <alsa-devel@alsa-project.org>; Tue,  5 Aug 2025 23:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0232FF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EjPsImCH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754429790; x=1785965790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvg20eZHbAjBzTXGeTHpnNdERiU2rFxDpliw0tBwoPE=;
  b=EjPsImCHUICnhXfOZd/vIVzL9+wMGk848E4EplzBG5Z/8GKxIaB/91Wn
   GkVxskFOkoMoeonVpCNvflX5H4vVFQxTxOoJ8jFABPdXs5NTQXFFJHaAA
   yEH47h0SgV9KKyFBbkJdMrBtHUzOx6tFMKTHQgx65Wdd3nVjPTk66B3LL
   I5N4ZZFpVsdZQeULuEeqApyby/R6RCSB4W11TVfF0Teg2gVwSSQXTfATO
   sVgViluVHVz+d0mi4HW7b9q6/awNx87sW90WO9wRSC1GjIVdGNW8YXxLH
   +hS+OZrfOvk9tR0wucUbARmuD60J1+3hINzNiVTdGSwVQhyyVF0kFnQTO
   Q==;
X-CSE-ConnectionGUID: kz0uwjp/Seawam1+A+1osQ==
X-CSE-MsgGUID: +FHJlaOkRPWpI3WqI2LC2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56701690"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400";
   d="scan'208";a="56701690"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 14:36:24 -0700
X-CSE-ConnectionGUID: nOC0iUIlSl+MAHietDD5yg==
X-CSE-MsgGUID: 9PWR2VPuRp2nQ5Sw9S/twg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400";
   d="scan'208";a="169870691"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 14:36:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPKU-00000003rKU-1KDk;
	Wed, 06 Aug 2025 00:36:18 +0300
Date: Wed, 6 Aug 2025 00:36:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda: Fix the wrong register was used for DVC of
 TAS2770
Message-ID: <aJJ5UgpSw8A5IqeG@smile.fi.intel.com>
References: <20250729125938.54696-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729125938.54696-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: ZAZX2VL5KJ3KSRSMKW3NPAXFL7PKTHGT
X-Message-ID-Hash: ZAZX2VL5KJ3KSRSMKW3NPAXFL7PKTHGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAZX2VL5KJ3KSRSMKW3NPAXFL7PKTHGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 29, 2025 at 08:59:38PM +0800, Baojun Xu wrote:
> The wrong register was used for digital volume control of TAS2770,
> The definition was changed, and usage was also updated.

> Fixes: ab29b3460c5c ("ALSA: hda: Add TAS2770 support")
> 

To make Fixes to be a tag, remove this blank line.

> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

-- 
With Best Regards,
Andy Shevchenko


