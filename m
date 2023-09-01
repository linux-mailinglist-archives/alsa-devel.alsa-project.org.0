Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5878FA47
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A126BC0;
	Fri,  1 Sep 2023 10:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A126BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693558475;
	bh=0r8fksdnkn/wKLJZct3yyHi/74DvYg2k1d4RE/twr2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ajnpke4zaa8PBws2bEAMH0cD8I0rOj+4g8hQHDKJ9JIdCs0bFMb1DnNBzZxKu828l
	 xiWzboaJp56bPGjJY9uapu7WyiFtqy41BEnJ0zx54bW3cfvbVfOJ891rXPIU2eA2HG
	 4wNExM8nRo8OUMNwiCYDE2CJNLxVTOvwhFc2AEaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E85DFF8032D; Fri,  1 Sep 2023 10:53:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA74F80155;
	Fri,  1 Sep 2023 10:53:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8E5AF80158; Fri,  1 Sep 2023 10:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6CC8F80094
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6CC8F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CkdrlwmK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693558419; x=1725094419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0r8fksdnkn/wKLJZct3yyHi/74DvYg2k1d4RE/twr2Q=;
  b=CkdrlwmKnMsx9n/ItiSV9Do3/329uhnPOpttHIsOV8XJW2qO1rFO803h
   nfbl/wkKZwS24+C02xAOSNDGA0JpuD1nctRyw5oRoz5ZxlycSpqNDRcRO
   c+1nqUyQjV1XRzIEfUW/97UzxdpIv/9yJ6vPa1735LoRYzbjZmcOnqh+t
   Z3LyuQFeGHTBK+cIhg7XZv0vF+QCVja5iykG6VR2bPlfPcyuApvlm9EGU
   +nHCd5t1CBmEdN1jGgJvJyonQWhWi6HNwiPNNDTaoJNsr3Z/XLyleBf/m
   FoiGOm5ZycXrR1iFKoddIrgQPvRY5Bp/DqsnNlqj6G+eH/bWkZWxAfJZH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379956916"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="379956916"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774917377"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="774917377"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:53:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbzuD-005cqE-33;
	Fri, 01 Sep 2023 11:53:29 +0300
Date: Fri, 1 Sep 2023 11:53:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: wm8580: Remove trailing comma in the
 terminator entry
Message-ID: <ZPGmiWDErxnjGlMR@smile.fi.intel.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ADXELSSFUO5WNAGLDI3XTOJ5YTXTRULF
X-Message-ID-Hash: ADXELSSFUO5WNAGLDI3XTOJ5YTXTRULF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADXELSSFUO5WNAGLDI3XTOJ5YTXTRULF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 01, 2023 at 07:59:51AM +0100, Biju Das wrote:
> Remove trailing comma in the terminator entry for OF table.

You are so fast :-)
This will produce an unneeded churn as you touch the same line twice in a row.

Just combine them and mention both changes in the commit message.

With that done,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


