Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6822886FB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 12:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B1441;
	Fri,  9 Oct 2020 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B1441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602239532;
	bh=KshFDkiWD+IM/t7kaaQeKdfRAntuN1jhXg3Hhqqb2i4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EoZDXhI4AvFKrgCJJDVXfhZOVEfb2Uc4gpu4wqL1PJnL5liCq9W8zkcqDFW5YzGno
	 qYIyNRO2SPpy+2W10DUJ1J8x8rXr+QvrYJ0svrHUauh+3c1uWv6hV0bwAVzk9Pu+Ez
	 tUPs9AnupW/j3cU4ATyxluVdGUAR86DibEsU0w2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16509F80128;
	Fri,  9 Oct 2020 12:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07075F8014D; Fri,  9 Oct 2020 12:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C611F800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 12:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C611F800BF
IronPort-SDR: XWmtpIwAnmbATlXcfIrRe6bK0RQ2sn895ijSEHZBFwTZ+jkfREEfhSSJW4UWRJtRUi/2aVzeW5
 A0bxy7XACdDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="227116678"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="227116678"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 03:30:23 -0700
IronPort-SDR: 3799F6JtjtF4jp2tjteXcsemdBwEwWq7xcvYkUVCNpYxaoviccIzo0J2zA3T3GbNzeqy5AQ4GJ
 GomPOthhpFRw==
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="316994899"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 03:30:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kQpgK-002WZ3-Q2; Fri, 09 Oct 2020 13:31:24 +0300
Date: Fri, 9 Oct 2020 13:31:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201009103124.GT4077@smile.fi.intel.com>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009102751.GS4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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

On Fri, Oct 09, 2020 at 01:27:51PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 08, 2020 at 05:11:05PM +0100, Mark Brown wrote:
> > We intentionally do not return an error if we get a permanent failure
> > from dma_request_chan() in order to support systems which have TX only
> > or RX only channels. Add a comment documenting this.

> > --- a/sound/soc/soc-generic-dmaengine-pcm.c
> > +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> > @@ -386,6 +386,11 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
> >  			name = config->chan_names[i];
> >  		chan = dma_request_chan(dev, name);
> >  		if (IS_ERR(chan)) {
> > +			/*
> > +			 * Only report probe deferral errors, channels
> > +			 * might not be present for devices that
> > +			 * support only TX or only RX.
> > +			 */
> >  			if (PTR_ERR(chan) == -EPROBE_DEFER)
> >  				return -EPROBE_DEFER;
> >  			pcm->chan[i] = NULL;

Now I would like to continue discussion from this point.

What is the best way for individual ASoC drivers to be sure that at load time
they have or have not DMA resources available?

Now, seems the approach is to check dma-names property present and thus, try to
switch to DMA mode, otherwise PIO. But this seems to me a bit fragile. Why ASoC
core can't simple recognize DMA resources as optional (for the drivers that
want to know if they available or not)?

-- 
With Best Regards,
Andy Shevchenko


