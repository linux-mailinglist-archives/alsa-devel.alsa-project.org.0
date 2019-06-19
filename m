Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5614B967
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 15:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F8616B1;
	Wed, 19 Jun 2019 15:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F8616B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560949569;
	bh=3HV247oHT9QAqz7q2ATj2nDnkr03mI6s02d4toluX3g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WhKUEIIUyLhmcwuZF7YYNMAXmrCiW31Ji+aGRe/kgYl4UlMylmdx75Ss0D82eUav+
	 rZ6d1tNnUP58VGlWX433U4PuB6iEn6mwcgiNUa+W2ecGZmLDm/i36j5vv8sxvsF0Fe
	 fw/J/jfNLJb6ysQ6kB7xEaq8rWB9OQoUPyLoOrzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8039F896B8;
	Wed, 19 Jun 2019 15:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E832F896B8; Wed, 19 Jun 2019 15:04:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF23F80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 15:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF23F80CC4
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 06:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="150602023"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga007.jf.intel.com with ESMTP; 19 Jun 2019 06:04:15 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hdaG5-0005NU-Ur; Wed, 19 Jun 2019 16:04:13 +0300
Date: Wed, 19 Jun 2019 16:04:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190619130413.GG9224@smile.fi.intel.com>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
 <7ceb9ba8-74d9-4985-e760-40003dfbef3e@intel.com>
 <20190619110826.GC9224@smile.fi.intel.com>
 <8710d43c-4612-14ab-46e4-4f95ceb4c70b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8710d43c-4612-14ab-46e4-4f95ceb4c70b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 alsa-devel@alsa-project.org
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

On Wed, Jun 19, 2019 at 01:52:57PM +0200, Pierre-Louis Bossart wrote:
> 
> > > > Add common helpers to provide same functionality in a cleaner
> > > > way. This will also help support the DMI-based quirks being introduced
> > > > to handle SOF/SST autodetection.
> > 
> > > > +#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> > 
> > We have macros for this in intel-family.h.
> 
> Andy, just to double-check, were you referring to the following macro?
> #define INTEL_CPU_FAM6(_model, _driver_data)

Yes, and my patch to move pointer elsewhere.
Now I realize that the macro without data pointer wasn't accepted by some reason.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
