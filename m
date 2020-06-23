Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36D204CCA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 10:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384D91745;
	Tue, 23 Jun 2020 10:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384D91745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592901910;
	bh=5tgVRRRYZZHXpkFuuvactHsl3H++DFhD8sKfr10Je3c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILvGcF4YOcLexva3ldbxs3CkMYMQp5CyinmQ8OpCabNsSE/qxxA2Rtfe2OplhaYcM
	 8AlLhqCeDg8LvLRqZAGdDDie3b2In5E+ZOa5GQFiISy5RJSd/6zESC4cE0KicK2wvZ
	 /lQJOhK1AKI+hQG3hPulRWf39QQoCwYBLqizhKB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E4BF800B2;
	Tue, 23 Jun 2020 10:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AF27F80234; Tue, 23 Jun 2020 10:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E9D9F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 10:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9D9F800B2
IronPort-SDR: TKMlohuVDdCdyrRQss43BCTotRZkfY/PxRtamEJlMmW969+PpU2a7lpJuLfNDdlaTTA2NjuhEj
 ms6kWSFfm1Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143070321"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="143070321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 01:43:18 -0700
IronPort-SDR: TWW88uovgSK+VWhk9QKLCrP+CvqsWM4WsacBXUdioePd5In+8UFhJ3dydkgLp8vXePYLpAyg8M
 0orJ0mlPuzdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="275276325"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 23 Jun 2020 01:43:16 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jneWU-00FKMu-R9; Tue, 23 Jun 2020 11:43:18 +0300
Date: Tue, 23 Jun 2020 11:43:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Message-ID: <20200623084318.GN2428291@smile.fi.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <20200622181824.GG2428291@smile.fi.intel.com>
 <04af7e48-e694-7657-5477-81b6e2e8d1c1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04af7e48-e694-7657-5477-81b6e2e8d1c1@linux.intel.com>
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

On Mon, Jun 22, 2020 at 01:23:04PM -0500, Pierre-Louis Bossart wrote:
> On 6/22/20 1:18 PM, Andy Shevchenko wrote:
> > On Mon, Jun 22, 2020 at 10:42:38AM -0500, Pierre-Louis Bossart wrote:
> > > The mainline code currently prevents modules from being removed.
> > > 
> > > The BE dailink .init() function calls devm_gpiod_get() using the codec
> > > component device as argument. When the machine driver is removed, the
> > > references to the gpiod are not released, and it's not possible to
> > > remove the codec driver module - which is the only entity which could
> > > free the gpiod.
> > > 
> > > This conceptual deadlock can be avoided by invoking gpiod_get() in the
> > > .init() callback, and calling gpiod_put() in the exit() callback.
> > > 
> > > Tested on SAMUS Chromebook with SOF driver.
> > 
> > > +static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
> > > +{
> > > +	struct bdw_rt5677_priv *bdw_rt5677 =
> > > +			snd_soc_card_get_drvdata(rtd->card);
> > > +
> > > +	/*
> > > +	 * The .exit() can be reached without going through the .init()
> > > +	 * so explicitly test if the gpiod is valid
> > > +	 */
> > 
> > > +	if (!IS_ERR_OR_NULL(bdw_rt5677->gpio_hp_en))
> > 
> > _OR_NULL is redundant. gpiod_put() is explicitly NULL-aware.
> > 
> > IS_ERR() I suppose can be avoided by using gpiod_get_optional(), if it suits the case.
> > Otherwise it would be questionable why we got error pointer value on ->exit().
> 
> As I explained in the cover letter we can reach this function even if the
> init was not called or was not successful. There are tons of cases which
> reach the same probe_end label in the ASoC core.


> So I explicitly added a test for all possible cases. I don't mind removing
> the _OR_NULL if indeed it's safe, but showing this redundancy also shows an
> intent to deal with such cases.

Thanks for an explanation. I think it's an established practice to have
NULL-aware resource release-like functions.

Do you put always something like below in your code? No.

	if (foo)
		kfree(foo);

-- 
With Best Regards,
Andy Shevchenko


