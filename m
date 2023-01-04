Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7AA65DC69
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 19:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C84C04A;
	Wed,  4 Jan 2023 19:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C84C04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672858604;
	bh=O6CS1YaqJdLRkKNpM+ISDo/CBjJK7EGwS7kmRWufSFo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EhHR5S4O0JDEBpaTWgMzpxGQUohJJt6ct2tE65eldOomv/cEg/JOO6+lpOr6Twp3R
	 LYq41UN0QwkM51Y1bD48thAMbKxz3/4kAkiOniS1e0qu4uH6fNP/PitnD1pdHEe7D9
	 PeqZYB86eav8YbaYX2URNsss4xxw2Y45o1A48XtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F08F800C0;
	Wed,  4 Jan 2023 19:55:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DB8DF80240; Wed,  4 Jan 2023 19:55:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3D8F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 19:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3D8F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ksn41A/9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672858541; x=1704394541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O6CS1YaqJdLRkKNpM+ISDo/CBjJK7EGwS7kmRWufSFo=;
 b=Ksn41A/9+U4fXsFsmkTYF8O3WiGxBI/AAaH1YIUfcUSI44REdK9kQuU4
 qB3bP8TXP2DMZqkxB6PLSxM+mHAgOPtOU9Rg+QhQEiFhzCUe6IBmwGk1V
 isq6WdvhH76sFLWelXd99TEUbw0jaWiMEjl5DZkh9umMx7TgVJPMRL2V8
 3yBe5hlUBvC7u+CPpTq3p56C9EbxJlZU/XxO4WDe1SRiOmh6EtjokRK5S
 D7wCO97uesegIIjelJVMZ0vnad9RXti13PwZ5vXySQIisuFXiN2bgzfV5
 f35DbWlyJQDgBiVso4S1s+EKphD+On7F5RLwnzw1jH4bSRASQaYijTO72 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319721354"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="319721354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 10:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="657214817"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="657214817"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2023 10:55:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pD8vD-004RD0-2V; Wed, 04 Jan 2023 20:55:31 +0200
Date: Wed, 4 Jan 2023 20:55:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7XLo8febtiSLGAD@smile.fi.intel.com>
References: <Y7WtywhUZCTx3akM@smile.fi.intel.com>
 <Y7W0VOJKlMtaIp13@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7W0VOJKlMtaIp13@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 04, 2023 at 05:16:04PM +0000, Mark Brown wrote:
> On Wed, Jan 04, 2023 at 06:48:11PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 04, 2023 at 04:42:28PM +0000, Mark Brown wrote:
> 
> > > According to b4 you've only acked the first patch here because Andy
> > > doesn't send cover letters :/
> 
> > Is b4 capable to spread tags from cover letter to the whole series?
> > (Sorry, I'm a bit outdated with all Swiss-knife possibilities that
> >  b4 provides)
> 
> Yes, it does that.

Oh, cool to know! So it makes a lot of sense to create the cover letters
even for straightforward independent changes that are united into the
series for the easy handling.

Thank you!

P.S. Tell me if I need to resend with tags applied this time?

-- 
With Best Regards,
Andy Shevchenko


