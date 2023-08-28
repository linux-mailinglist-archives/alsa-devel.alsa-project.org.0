Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923578AE8F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 13:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DD6DEC;
	Mon, 28 Aug 2023 13:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DD6DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693221321;
	bh=Ielm4fiHyy4Yk788Tz/YZQ8rqp2NrphwYV2ioBRdgyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AjJSFdGfUBGhoynzpdznikONyQm//DbxyukhspxWHV66H+ZgH/5Mi/FSVjaa/SEtw
	 Mg6iMJWTaM4EObsuJBCfbQs+/GXpcVxcqzpzUEJ6j9e6KXmLRc3yJsaCEO8w1D1moN
	 vWYjfmcv9b0VJmHR0rgTc4NgPzD0Frrkl3wN0rUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16861F80155; Mon, 28 Aug 2023 13:14:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D666BF8023B;
	Mon, 28 Aug 2023 13:14:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87EF7F8025F; Mon, 28 Aug 2023 13:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F5B5F80158
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 13:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F5B5F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hO5aAtVG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221266; x=1724757266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ielm4fiHyy4Yk788Tz/YZQ8rqp2NrphwYV2ioBRdgyA=;
  b=hO5aAtVGxGVniNNnWfgQaDmCTekoS3+9y/SS17Hpi85vASdCLkl1rLEO
   bSJOV145adG+71u/1pDxLmXPvc3EW1xzWYzPo8DdTIO2TutxjlqZ93hRq
   6+l35yQn3BRUlNDps9F2L7YWLnqbF5y9Pj5VlGOnEaxOj+dOkc8N+EIEg
   beRtY8GZkF+skX5cKh1E3VZfPmBw3uVbI70lqZiTFHR5RoCCI62H5lenn
   Onpq3bcCFIKd13oQA4b/GAU4mS4fqjMXNM1hbDewqs6COlsjoENeKeeuI
   0JC1jhhu4kXdjly/xeXwtGkUfXWBEtfs/Y1AJgLDKG0sQKEyX3aTbUh+n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461446972"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="461446972"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 04:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="773233007"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="773233007"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 04:14:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaaCA-00FiOP-0C;
	Mon, 28 Aug 2023 14:14:10 +0300
Date: Mon, 28 Aug 2023 14:14:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Message-ID: <ZOyBgXfn6bzeFh5e@smile.fi.intel.com>
References: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WSPDTT5YGZZLZW6XW6EI2MBMIHBUSSOZ
X-Message-ID-Hash: WSPDTT5YGZZLZW6XW6EI2MBMIHBUSSOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSPDTT5YGZZLZW6XW6EI2MBMIHBUSSOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 27, 2023 at 09:09:31AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.

Again, -EINVAL -> ENODEV is not explained in the above.

-- 
With Best Regards,
Andy Shevchenko


