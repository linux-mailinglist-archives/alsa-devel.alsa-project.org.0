Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57421AEA148
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jun 2025 16:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F025D601B4;
	Thu, 26 Jun 2025 16:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F025D601B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750949538;
	bh=OC/Lm+Sj1ZFHm4RteakCRy/zKFGfAMdeuqZwsCH+AL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jps1daOJysaCRUKIvD44qi1iVQgOTHB0fW1uN9Fbfa9NAQB1M5cQQ6rNEeGRQwf9Y
	 x83Gydt42lGRZbKsPqoxqKgmkpFU48k7RWlvEVGoDjrA1BNt+fbhU9GeoVEI/WqObx
	 vVF+TuOML9C4sreV6UhbhffejEIdh9lRK+4dZ8pU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84A85F805BD; Thu, 26 Jun 2025 16:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF56F805C6;
	Thu, 26 Jun 2025 16:51:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9CAAF8016E; Thu, 26 Jun 2025 16:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95F67F80124
	for <alsa-devel@alsa-project.org>; Thu, 26 Jun 2025 16:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F67F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mCWBfwnI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750949500; x=1782485500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OC/Lm+Sj1ZFHm4RteakCRy/zKFGfAMdeuqZwsCH+AL4=;
  b=mCWBfwnIvC/4cfJggOxvBfUUZrn64Bf/yAasMCQm21kL4h5m1OtHb4/6
   RQOcnnKRzV0gS6IDlUGyPHBODzH0ubMT7tfUeUbZBXBPBgcTrvttAmswo
   AtylK6iIuixnOouJz2z+zmZfwt2G1BVDDs8Ad8mbUZLFpjFW3d+AFxirt
   rNYu2sZCVzGyfwaMLQHLUgsIzOruOXOAvlvVIRUfZTBmgSGlM40kaeJVW
   fWyiUlfxMNOI9TIK8OMTHO/B+THYRkJLgBQbErY28TycdJDv2O2YSpEnP
   NIS8pWYIFWNyLQvvZEA/VyTovXAEVEHZlkhtvwZg0/wAeeDXFgV/Bfcxn
   g==;
X-CSE-ConnectionGUID: rX+cjl4jQM2JUKEPikcGOw==
X-CSE-MsgGUID: 0GviIREbQ5eMLXh56lcLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53120994"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600";
   d="scan'208";a="53120994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:51:33 -0700
X-CSE-ConnectionGUID: iMYeGbfqQmSrW5siuk92zA==
X-CSE-MsgGUID: HlBZi9y6SzG5ykUUk6igKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600";
   d="scan'208";a="183568505"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:51:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUnwl-0000000ACmc-3Tgf;
	Thu, 26 Jun 2025 17:51:27 +0300
Date: Thu, 26 Jun 2025 17:51:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Xu, Baojun" <baojun.xu@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v2 2/4] Asoc: tac5x1x: document tac5x1x codec
Message-ID: <aF1eb-7WO29lqe_5@smile.fi.intel.com>
References: <02bd6e338b114622993ae829fb0d4f5b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bd6e338b114622993ae829fb0d4f5b@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: KW447UEMAWAJ7KZ4EN4DA7KZK52OTGTC
X-Message-ID-Hash: KW447UEMAWAJ7KZ4EN4DA7KZK52OTGTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KW447UEMAWAJ7KZ4EN4DA7KZK52OTGTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 26, 2025 at 02:23:43PM +0000, Holalu Yogendra, Niranjan wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, June 25, 2025 8:01 PM
> > On Tue, Jun 24, 2025 at 09:07:40PM +0530, Niranjan H Y wrote:
> > > tac5x1x family are series of low-power and high performance
> > > mono/stereo audio codecs consists of ADC and DAC combinations.
> > 
> > Aren't DT bindings changes supposed to follow the common template in the
> > Subject?
> Is it okay to change the subject in the next patch or keep using the 
> same subject tracking?  please suggest.

I think you need to play their rules.

-- 
With Best Regards,
Andy Shevchenko


