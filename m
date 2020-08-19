Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F024A1A8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 16:23:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCA51851;
	Wed, 19 Aug 2020 16:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCA51851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597847006;
	bh=qUHCr5DXl8CktUDfuqBMKfpSkpefGCTQrDh2OYnidZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nfp6oE8SC2tjRE3uRs5ifT0CzXPWmFhEtS6x6L7/ukgIlp97CaB6ALY3GYVdD2Rbc
	 +capvqTay10CbP2Dn/hp962vSJI8AuCD1ol5brPeAkNALDNtAeL+wQZXMC9iBvEAFb
	 GLK0fsJQrxl2zEtUv2Pjx0yDKMm74epo0xx/RElI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8862DF80114;
	Wed, 19 Aug 2020 16:21:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB17EF80218; Wed, 19 Aug 2020 16:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A8CFF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 16:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A8CFF80114
IronPort-SDR: 2I3Xc8onKaifIjiHRV0R929JxqMfe4aGrsvD/8N9OJq1pLIcLcWvhYhYra1KVJF439rj4BNcuF
 tIdR+RTg55TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173159433"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="173159433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 07:21:34 -0700
IronPort-SDR: aIdkXcW/9eo9ipWcuZQY8k/swEIS1M5HMUXXdZBXSCytEPUC3vfQgyDbVw1Up9JtQsdGBiQQnC
 ooHCM4wXCclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="327102646"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 07:21:30 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k8Oy0-009tTP-J7; Wed, 19 Aug 2020 17:21:28 +0300
Date: Wed, 19 Aug 2020 17:21:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200819142128.GP1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <20200818115050.GI1891694@smile.fi.intel.com>
 <9a733e30-8d44-edf7-1bae-5b6f935628d2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a733e30-8d44-edf7-1bae-5b6f935628d2@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On Wed, Aug 19, 2020 at 03:46:30PM +0200, Cezary Rojewski wrote:
> On 2020-08-18 1:50 PM, Andy Shevchenko wrote:
> > On Mon, Aug 17, 2020 at 01:12:01PM +0200, Cezary Rojewski wrote:
> > > On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> > > > On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:

...

> > > > > +	bool lp;
> > > > > +
> > > > > +	if (list_empty(&cdev->stream_list))
> > > > > +		return catpt_dsp_select_lpclock(cdev, true, true);
> > > > > +
> > > > > +	lp = true;
> > > > > +	list_for_each_entry(stream, &cdev->stream_list, node) {
> > > > > +		if (stream->prepared) {
> > > > > +			lp = false;
> > > > > +			break;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return catpt_dsp_select_lpclock(cdev, lp, true);
> > > > 
> > > > Seems too much duplication.
> > > > 
> > > > 	struct catpt_stream_runtime *stream;
> > > > 
> > > > 	list_for_each_entry(stream, &cdev->stream_list, node) {
> > > > 		if (stream->prepared)
> > > > 			return catpt_dsp_select_lpclock(cdev, false, true);
> > > > 	}
> > > > 
> > > > 	return catpt_dsp_select_lpclock(cdev, true, true);
> > > > 
> > > > 
> > > > Better?
> > > 
> > > list_first_entry (part of list_for_each_entry) expects list to be non-empty.
> > > ->streal_list may be empty when invoking catpt_dsp_update_lpclock().
> > 
> > I didn't get this. Can you point out where is exactly problematic place?
> > 
> 
> list_for_each_entry makes use of list_first_entry when initializing 'pos'
> index variable.

Correct.

> Documentation for list_first_entry reads: "Note, that list
> is expected to be not empty"

Correct.

> so I'm validating list's status before moving
> on to the loop as stream_list may be empty when catpt_dsp_update_lpclock()
> gets called.

But here you missed the second part of the for-loop, i.e. exit conditional.

If your assumption (that list_for_each_*() is not empty-safe) is correct,
it would be disaster in global kernel source level.

-- 
With Best Regards,
Andy Shevchenko


