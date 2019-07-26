Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA42771EA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 21:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EC520E1;
	Fri, 26 Jul 2019 21:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EC520E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564168399;
	bh=mpVn4phbnA74bm0pRKNoSxBZn7Neplx27g1/bvCONBI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlGb7CjtXzzrnI1rogHAYqcc/eguBrXfcKaUuBRGmkVSlvY6A6JOrekKCTE391Oys
	 vcHm4VX8xPUcHYM+9zxn7mYKnYV2vcJMP5wlzD3lte7LMd8DHvQOtM6YWvTlfKxLh8
	 rAf251WoE5mD1US3bL3ADX9/hSvhe1dtl29d//mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119B9F80368;
	Fri, 26 Jul 2019 21:11:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91ADFF80393; Fri, 26 Jul 2019 21:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE378F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 21:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE378F800BE
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 12:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="181963387"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2019 12:11:10 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hr5cS-0006eY-Of; Fri, 26 Jul 2019 22:11:08 +0300
Date: Fri, 26 Jul 2019 22:11:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Message-ID: <20190726191108.GE9224@smile.fi.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
 <20190726182534.GO16003@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726182534.GO16003@ubuntu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Fri, Jul 26, 2019 at 08:25:35PM +0200, Guennadi Liakhovetski wrote:
> On Fri, Jul 26, 2019 at 01:08:57PM -0500, Pierre-Louis Bossart wrote:
> > On 7/25/19 6:40 PM, Pierre-Louis Bossart wrote:
> > > Not all platforms support runtime_pm for now, let's use runtime_pm
> > > only when enabled.

> > option2 (suggested by Jan Kotas): catch the -EACCESS error code
> > 
> >  	ret = pm_runtime_get_sync(slave->bus->dev);
> > -	if (ret < 0)
> > +	if (ret < 0 && ret != -EACCES)
> >  		return ret;

> Otherwise I'd go with (2), I think, since
> that's also the official purpose of the -EACCESS return code:
> 
> https://lists.linuxfoundation.org/pipermail/linux-pm/2011-June/031930.html

And at least we have examples in the kernel

drivers/gpu/drm/radeon/radeon_fb.c:57:  if (ret < 0 && ret != -EACCES) {

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
