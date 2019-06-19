Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC04B6C2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 13:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF404169E;
	Wed, 19 Jun 2019 13:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF404169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560942622;
	bh=o37pMFcqw1mwEp1bX47BlG9DLfn+9jSv4xeAYmElg6g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVUiZBbWxGF4kVnKUMkbeem8OOTeBWwBFKRJ/adtUfSaFnB6jBPbtHrKavBiyJWVx
	 6lT+3+9bgIFrnbkWEwVINxODhXiEMSqB2C9RK1GK/MuU0v2eFDzUw8jSKPRuaZ1mS4
	 c1qhpFQWRq1U1C7Y4RgqlaNKgNgqBaFFehv0g1bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A2AF89682;
	Wed, 19 Jun 2019 13:08:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 262A0F896B8; Wed, 19 Jun 2019 13:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA96F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 13:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA96F808AF
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 04:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="160342052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jun 2019 04:08:27 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hdYS2-0004Ks-Uq; Wed, 19 Jun 2019 14:08:26 +0300
Date: Wed, 19 Jun 2019 14:08:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190619110826.GC9224@smile.fi.intel.com>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
 <7ceb9ba8-74d9-4985-e760-40003dfbef3e@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ceb9ba8-74d9-4985-e760-40003dfbef3e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: Intel: use common helpers to
 detect CPUs
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

On Tue, Jun 18, 2019 at 09:26:50PM +0200, Cezary Rojewski wrote:
> On 2019-05-28 22:02, Pierre-Louis Bossart wrote:
> > We have duplicated code in multiple locations (atom, machine drivers,
> > SOF) to detect Baytrail, Cherrytrail and other SOCs. This is not very
> > elegant, and introduces dependencies on CONFIG_X86 that prevent
> > COMPILE_TEST from working.
> > 
> > Add common helpers to provide same functionality in a cleaner
> > way. This will also help support the DMI-based quirks being introduced
> > to handle SOF/SST autodetection.

> > +#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }

We have macros for this in intel-family.h.

> > +#define SOC_INTEL_IS_CPU(soc, type)				\
> > +static inline bool soc_intel_is_##soc(void)			\
> > +{								\
> > +	static const struct x86_cpu_id soc##_cpu_ids[] = {	\
> > +		ICPU(type),					\
> 
> I understand there is a separate discussion going on, hope I don't get fried
> for throwing small code review.
> 
> Consider using same arg name for both ICPU and SOC_INTEL_IS_CPU macros,
> whether it's "model" or "type". It's more readable that way.
> 
> > +		{}						\
> > +	};							\
> > +	const struct x86_cpu_id *id;				\
> > +								\
> > +	id = x86_match_cpu(soc##_cpu_ids);			\
> > +	if (id)							\
> > +		return true;					\
> > +	return false;						\
> 
> Tenary operator should prove usefull here.

In this way it is simple
	return !!x86_match_cpu(...);

No conditional needed at all.

> 
> > +}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
