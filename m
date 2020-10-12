Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90128BE0A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 18:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3819F168F;
	Mon, 12 Oct 2020 18:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3819F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602520364;
	bh=lJIyCipF9MWUkTRmA2HxUvDomd7YVeeyC79El/icFHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jtlK45xTtDZ4E6dcIqSgXDrcy3GjT1rZG05jzOLBG187Gam+QQBXJzrU6MY03A8FI
	 12TS5g5s5ti/Klxqfql56CyfdmmgkjEDfwzZveLJq457FKal9DmR86NWZseghl8JEQ
	 TLrRQEVonzQqXX6UQN2Noyuw+q+VqNNISVffWhQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE5D5F800D8;
	Mon, 12 Oct 2020 18:31:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD5FF80217; Mon, 12 Oct 2020 18:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2673F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 18:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2673F80141
IronPort-SDR: WiI4YriWY9OYsmFIXXh9VTn6WEjNkWMcmD3xHVFSXn50bkKIDd8+iLVEG059JN5O53On1i0kLd
 0VB9nJMdJafw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="162299658"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="162299658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 09:30:46 -0700
IronPort-SDR: 178M4lRgd4nyVSqcVhr0R+tMw31Yrv74Xayv/+HZwkKLCVIYDJYL9UarTCGX5/GJp9SAH7ZqXR
 1IUNFeey+9oA==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="344941574"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 09:30:44 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kS0jj-0058wb-0Y; Mon, 12 Oct 2020 19:31:47 +0300
Date: Mon, 12 Oct 2020 19:31:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201012163147.GD4077@smile.fi.intel.com>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
 <20201009103124.GT4077@smile.fi.intel.com>
 <20201012133745.GD4332@sirena.org.uk>
 <20201012135527.GW4077@smile.fi.intel.com>
 <20201012154803.GG4332@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012154803.GG4332@sirena.org.uk>
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

On Mon, Oct 12, 2020 at 04:48:03PM +0100, Mark Brown wrote:
> On Mon, Oct 12, 2020 at 04:55:27PM +0300, Andy Shevchenko wrote:
> 
> > Currently those drivers need to do something like:
> 
> > 	if (of_property_is_present("dma-names"))
> > 		ret = try DMA mode;
> > 	else
> > 		ret = try PIO mode;
> 
> > but this seems to me a bit stricter than needed. What if DMA mode fails, shall
> > we fail the probe of the driver?
> 
> They can also just try registering DMA and fall back to PIO.

There is no possibility to do like this right now.

> > If ASoC supports optional DMA resources, above can be simplified to something
> > like:
> 
> > 	ret = try DMA mode;
> > 	if (ret != DMA mode ok)
> > 		ret = try PIO mode;
> 
> > which makes OF dependent parts gone along with relying on the properties rather
> > than real resource availability.
> 
> I don't understand the blocker to writing that code at the minute?

Return code in both cases DMA okay, DMA is not okay is 0.

-- 
With Best Regards,
Andy Shevchenko


