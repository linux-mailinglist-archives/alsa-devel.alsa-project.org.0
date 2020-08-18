Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8A2248437
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 13:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95A91753;
	Tue, 18 Aug 2020 13:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95A91753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597751569;
	bh=sdHwiepqYdoLouoCNamuLXSYsXBax5xPUxWrnVNkprM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EawfCHn0rdG2lSxetcOaMUo4AWkcvy/9D5VDgKK9YGBFRWUZWrk8CJrdlhTk/KVBa
	 LIyF0AabJNdbVrdsDLOcEBgt+GqGf36NkjPd+lbht6kqFn9vzFs2o1eA4x3rJ/7o1C
	 jEVV1epCet7pFUUJxbrIBgOa8nLl3qXHUy+4gkEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF7DF80228;
	Tue, 18 Aug 2020 13:51:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D047F8023F; Tue, 18 Aug 2020 13:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3265F80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 13:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3265F80104
IronPort-SDR: MKy2F8HebNcHwA6+LNOikeitnCa9QReQ8/zEG/b43HTMxg9Mke1W00PzkoQ5SpSJHyij5LMUWU
 jJ/hpvCh2H1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152293597"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="152293597"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 04:50:56 -0700
IronPort-SDR: gudfIXfj2oaBPIPuwbNIWs+15+bMKtS9KLKw99/aEh9+4RXY5F8WJmzNwA/18Jqbmx/AnpozF1
 aeNrvs4jwfhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="326708846"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 04:50:52 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k808g-009dZN-Fz; Tue, 18 Aug 2020 14:50:50 +0300
Date: Tue, 18 Aug 2020 14:50:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200818115050.GI1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
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

On Mon, Aug 17, 2020 at 01:12:01PM +0200, Cezary Rojewski wrote:
> On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> > On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
> > > Implement dsp lifecycle functions such as core RESET and STALL,
> > > SRAM power control and LP clock selection. This also adds functions for
> > > handling transport over DW DMA controller.
> 
> Thanks for your input Andy!

You're welcome!

...

> > > +#define CATPT_DMA_DEVID		1 /* dma engine used */
> > 
> > Not sure I understand what exactly this means.
> > 
> 
> Well, you may choose either engine 0 or 1 for loading images. Reference
> solution which I'm basing catpt on - Windows driver equivalent - makes use
> of engine 1. Goal of this implementation is to align closely to stable
> Windows solution wherever possible to reduce maintainance cost.

Please, give extended comment here.

...

> > > +	status = dma_wait_for_async_tx(desc);
> > 
> > > +	catpt_updatel_shim(cdev, HMDC,
> > > +			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
> > 
> > Update even in erroneous case?
> > 
> 
> Yes. This is based on stable Windows solution equivalent and get's updated
> even in failure case to disable access to HOST memory in demand more.

I guess this deserves a comment.

> > > +	return (status == DMA_COMPLETE) ? 0 : -EPROTO;

...

> > > +	new <<= __ffs(mask);
> > > +	new = ~(new) & mask;
> > 
> > Unneeded parentheses.
> > And perhaps in one line it will be better to understand:
> > 
> > 	new = ~(new << __ffs(mask)) & mask;
> > 
> 
> Was called out in the past not to combine everything in one-line like if I'm
> to hide something from reviewer.
> 
> No problem with combining these together in v5.

you also may consider to use u32_replace_bits() or so.

...

> > > +	bool lp;
> > > +
> > > +	if (list_empty(&cdev->stream_list))
> > > +		return catpt_dsp_select_lpclock(cdev, true, true);
> > > +
> > > +	lp = true;
> > > +	list_for_each_entry(stream, &cdev->stream_list, node) {
> > > +		if (stream->prepared) {
> > > +			lp = false;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return catpt_dsp_select_lpclock(cdev, lp, true);
> > 
> > Seems too much duplication.
> > 
> > 	struct catpt_stream_runtime *stream;
> > 
> > 	list_for_each_entry(stream, &cdev->stream_list, node) {
> > 		if (stream->prepared)
> > 			return catpt_dsp_select_lpclock(cdev, false, true);
> > 	}
> > 
> > 	return catpt_dsp_select_lpclock(cdev, true, true);
> > 
> > 
> > Better?
> 
> list_first_entry (part of list_for_each_entry) expects list to be non-empty.
> ->streal_list may be empty when invoking catpt_dsp_update_lpclock().

I didn't get this. Can you point out where is exactly problematic place?

-- 
With Best Regards,
Andy Shevchenko


