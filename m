Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F17AD1B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 18:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B70917C4;
	Tue, 30 Jul 2019 17:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B70917C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564502406;
	bh=0+GJ0MucEi8LOmBkhfcaONHmX2daZtybU20HAjof5/k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCn2fI9emNoMDB9SVhbICJq5phnk0LuLE5N/Sp6RV/2g5X704bwnjsT8TpqLug/b3
	 Q828l7VquYuYSs5t5EzrJdD2YpZLiraFTqiRnGFHoXj/rXl19+DGKsaSi+/AkHf+bv
	 nyFKQ8gkHDtiHsSxf6V0Tu7Mkyw1Lk4WVhXo7+AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8095F804CB;
	Tue, 30 Jul 2019 17:58:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE4ECF80482; Tue, 30 Jul 2019 17:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17DA4F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 17:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DA4F800AB
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 08:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="255645883"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2019 08:58:11 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hsUVt-0005F7-JJ; Tue, 30 Jul 2019 18:58:09 +0300
Date: Tue, 30 Jul 2019 18:58:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190730155809.GS23480@smile.fi.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
 <20190726190823.GD9224@smile.fi.intel.com>
 <5a16d9e6-0a9c-a0a8-3b11-d046247f3879@linux.intel.com>
 <20190730112157.GM23480@smile.fi.intel.com>
 <a1b383b3-7846-3545-38a5-beece3e52849@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1b383b3-7846-3545-38a5-beece3e52849@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 30, 2019 at 07:57:46AM -0500, Pierre-Louis Bossart wrote:
> On 7/30/19 6:21 AM, Andy Shevchenko wrote:
> > On Mon, Jul 29, 2019 at 05:07:39PM -0500, Pierre-Louis Bossart wrote:
> > > On 7/26/19 2:08 PM, Andy Shevchenko wrote:
> > > > On Fri, Jul 26, 2019 at 01:08:57PM -0500, Pierre-Louis Bossart wrote:
> > 
> > > > > -	if (ret < 0)
> > > > > +	if (ret < 0 && ret != -EACCES)
> > > > 
> > > > ...and here, the pm_runtime_put_noidle() call is missed.
> > > 
> > > yes but in the example you provided, they actually do more work than just
> > > decrement the device usage counter:
> > 
> > In their case they would like to do that. You decide what is appropriate call
> > in your case.
> > 
> > My point is, that reference counter in case of error handling should be
> > returned back to its value.
> 
> Agree on the reference count.
> I am however not clear on the next step and 'what is appropriate'.
> 
> If pm_runtime_get_sync() failed, then technically the device was not resumed

Not so straight. It depends on reference count. It might be true (most cases
I think), or not true, if device had been resumed previously by other call.

> so marking it as last_busy+autosuspend, or using a plain vanilla put() will
> not result in any action. I must be missing something here.

put_noidle(). Because if it failed on the first call and was resumed, put()
will try to shut it down (since reference count goes to no-user base).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
