Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2D204CA3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 10:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97371743;
	Tue, 23 Jun 2020 10:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97371743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592901652;
	bh=xxbKlgh22SHtafKdTn6tgJeq+RLoqidXfwlevCi12jY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkATatNgve+lbArFJ330C9+eqwTFNFdH5N+OyV0l1bCkwTl4mYADPA7EivDmJmSZD
	 j8FV0e9gKK/69vlO5Y+ZIPvmAzAVHln0WY5/bFRKIg9FJ6oInnk1b3Ro1rpaYKiF+O
	 TD4z2GaBMP4dWXRXFHg4LtPt+Aia2Oi+xf3UDZPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0B7F8023E;
	Tue, 23 Jun 2020 10:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3066F80234; Tue, 23 Jun 2020 10:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50FF9F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 10:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50FF9F8010E
IronPort-SDR: EQENYvLasPoTHhoaiI/hmjDhoHIGdCaZrd3aYCL1EdxXlDruttumb2Vn81F/+v2Fig8ATCcMbd
 wIx0BJicDvHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142259833"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="142259833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 01:39:03 -0700
IronPort-SDR: Rw4gpTI+yndqeDGLEUszkfxCRU9eo48+r01JnPh8MUGBfW/Fy9uSo/laYpKNt7mgPxMt2bNcVA
 mzeKzeyCaeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="310389106"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 23 Jun 2020 01:39:01 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jneSN-00FKKG-6G; Tue, 23 Jun 2020 11:39:03 +0300
Date: Tue, 23 Jun 2020 11:39:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/5] ASoC: Intel: kbl-rt5660: use .exit() dailink
 callback to release gpiod
Message-ID: <20200623083903.GL2428291@smile.fi.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-4-pierre-louis.bossart@linux.intel.com>
 <20200622182009.GH2428291@smile.fi.intel.com>
 <b9452bbd-d8ee-5697-12fe-52644eae9bb4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9452bbd-d8ee-5697-12fe-52644eae9bb4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org
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

On Mon, Jun 22, 2020 at 01:26:15PM -0500, Pierre-Louis Bossart wrote:
> On 6/22/20 1:20 PM, Andy Shevchenko wrote:
> > On Mon, Jun 22, 2020 at 10:42:39AM -0500, Pierre-Louis Bossart wrote:
> > > The gpiod handling is inspired from the bdw-rt5677 code. Apply same
> > > fix to avoid reference count issue while removing modules for
> > > consistency.
> > 
> > ...
> > 
> > > -	ctx->gpio_lo_mute = devm_gpiod_get(component->dev, "lineout-mute",
> > > -					   GPIOD_OUT_HIGH);
> > > +	ctx->gpio_lo_mute = gpiod_get(component->dev, "lineout-mute",
> > > +				      GPIOD_OUT_HIGH);
> > >   	if (IS_ERR(ctx->gpio_lo_mute)) {
> > >   		dev_err(component->dev, "Can't find GPIO_MUTE# gpio\n");
> > >   		return PTR_ERR(ctx->gpio_lo_mute);
> > 
> > Is it fatal? Then IS_ERR() is not needed below. For NULL I already told.
> 
> this patch only fixes a deadlock, whether or not this is fatal or not is a
> different question. I would assert if if you can't mute your audio is
> broken.

Ah, sorry, I mean IS_ERR() is not needed for an optional case. Since it is
fatal, it's fine.

> > > +	/*
> > > +	 * The .exit() can be reached without going through the .init()
> > > +	 * so explicitly test if the gpiod is valid
> > > +	 */
> > 
> > This comment should be amended after fixing the code.
> > 
> > > +	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
> > > +		gpiod_put(ctx->gpio_lo_mute);
> > > +}
> > 

-- 
With Best Regards,
Andy Shevchenko


