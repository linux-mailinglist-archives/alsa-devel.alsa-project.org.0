Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1934C2740DE
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9BB51719;
	Tue, 22 Sep 2020 13:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9BB51719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600774320;
	bh=5yIFvDjT1r4GJKIAXxfShr8f3UeaEs0ptqG2sZYvOI4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqq1K9p8BnsxyJJYSVGrduoV1p8RjCVxrwDBMZ5TYs1La9Lu1MCQ+jQ90WMay4RWk
	 Rgtcc/OpNoxm8Wqu47VEx4c1UPPJgrUPgeV7VFuorn14cabrdiYDBtOgzI3K4Z14TJ
	 +Yfnd3TCr19f10LxGCS+Bc6Lky3yU1Y9pTlHJbG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 045FAF8015F;
	Tue, 22 Sep 2020 13:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35967F80234; Tue, 22 Sep 2020 13:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75BA4F800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75BA4F800ED
IronPort-SDR: G76GS9EW6rf1H7xuLcv0E1ocBqQGlsvF2ZzPsYccgyYCFTb5dsf9UaM9BWbBkJLkLQY3CLmhte
 hzsQjWiSMkHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="222175323"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="222175323"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 04:30:54 -0700
IronPort-SDR: rhQ5WO6uG5cZi1OI1thThlPCd7oRMavKgxuzUFw7t1bOscAamdscF/GhI/FBFeNcv5ZAx2G7Su
 sLvlRb56h+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="338263555"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 04:30:50 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKgVS-0014y3-Qw; Tue, 22 Sep 2020 14:30:46 +0300
Date: Tue, 22 Sep 2020 14:30:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200922113046.GN3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
 <20200921184129.GH3956970@smile.fi.intel.com>
 <191afe965b1e46799bf776be3254d28f@intel.com>
 <20200922090442.GJ3956970@smile.fi.intel.com>
 <4e51e628f9df457c8253a3ef6d7095eb@intel.com>
 <20200922112910.GM3956970@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922112910.GM3956970@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Sep 22, 2020 at 02:29:10PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 11:04:31AM +0000, Rojewski, Cezary wrote:
> > On 2020-09-22 11:04 AM, Andy Shevchenko wrote:
> > > On Mon, Sep 21, 2020 at 08:48:12PM +0000, Rojewski, Cezary wrote:

...

> > > And here basically enough check is info against NULL, right?
> > > Just try to look at different possibilities how to make code simpler and neater.
> > > 
> > >> Didn't compile this, some typecheck fixes might be in order and so on.
> > > 
> > 
> > What you meant is:
> > 	if (i == 4 && !info) // instead of 'info < eof'
> > 
> > right?
> 
> Simply if (!info)...

	if (info)
		memcpy();

of course, otherwise it will crash.

> > If 4th space is last char in this string then info would end up being
> > non-NULL and equal to 'eof' and thus memcpy() would get invoked with
> > size=eof-info=0.
> 
> ...which is not a problem.

-- 
With Best Regards,
Andy Shevchenko


