Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5478F62C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 01:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A491FE;
	Fri,  1 Sep 2023 01:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A491FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693524584;
	bh=XpEWba524RIoP+5DZMrL0z79tE0WJ/a8ttDAttiTwO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r4tdrjKVHa/cv/cV8bEQ8cL77jkmjWfDqntDPjhyIA9b0uwtOMOk8wCNwdbz/Uv8O
	 yrowJoBb9EZOkKQ/Z3N9fRCT5H57asvtxAv2VFWx00nQ/oIhbrNuasMfpApkDbesg1
	 mI3Ko5gm+lzqM193JP2hsrGVO+nApPg035AXO0Z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6109AF8032D; Fri,  1 Sep 2023 01:28:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBCEF80074;
	Fri,  1 Sep 2023 01:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A6BF80158; Fri,  1 Sep 2023 01:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37D0BF80094
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 01:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D0BF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZLBPlhlO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693524521; x=1725060521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XpEWba524RIoP+5DZMrL0z79tE0WJ/a8ttDAttiTwO0=;
  b=ZLBPlhlOKdAc3J5WBuLu0iyGRo1PqqHzUEqbkyO3yziShNaojAbesRa2
   f/zLWSLpDORun/0bWGgyttnZloT0FrgzuuwsWmnrl6h/bCRWUqK9jJcbT
   7EDEdK0LR0tMHmxFhOWjaVjbAO+sTm+iqxuFmURjgFKfwUVxrtMTwpf6F
   3j6/JNjJ2mCppStsJc3Mys/34rUusjTkIv31vRxNdUJ5YHdNMS1zHiVZD
   wJqdzf8Vv7wx7L+OR4PHfueVPcnShLcjjx7BuouqVI0QbknvzM5JbtQNO
   xFlHRluJWPoWQREJ/VBFBXvLS+svyoc6yQlaMaFmeoFh6Gw7PctjMMRtI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374995289"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000";
   d="scan'208";a="374995289"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739724928"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000";
   d="scan'208";a="739724928"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:28:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbr5Q-005WpK-0L;
	Fri, 01 Sep 2023 02:28:28 +0300
Date: Fri, 1 Sep 2023 02:28:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: wm8580: Move OF table
Message-ID: <ZPEiGxftpGsHrhdc@smile.fi.intel.com>
References: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
 <20230831201429.94554-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831201429.94554-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: NCM6CODO2J42RTPRNQFQF3ESO5NLISG4
X-Message-ID-Hash: NCM6CODO2J42RTPRNQFQF3ESO5NLISG4
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCM6CODO2J42RTPRNQFQF3ESO5NLISG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 31, 2023 at 09:14:29PM +0100, Biju Das wrote:
> Move OF table near to the user.

It does a bit more that that.

-- 
With Best Regards,
Andy Shevchenko


