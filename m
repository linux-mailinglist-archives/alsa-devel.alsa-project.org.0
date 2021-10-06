Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFC424295
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1008836;
	Wed,  6 Oct 2021 18:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1008836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537581;
	bh=08GV4lmQXqOCYu5eyzDM5qsul+20vKMpVFJi0X14+/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJWlXH56HzCaDRll9Lo4KwLDRncwwLomkVUvnsa7aigjXP+sKx2P8vE4i1nznuk8B
	 zwzYI7cgaQSQj56KFz0JZCD6xxRWjw5YtAAsPr4by2jYpm+9IigJDTIT80E+Pr2Bz5
	 B6RSMWBdtYjz0eq6sLZdsgN9jQLcBhJ4tPIZ0xUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BC1F8032D;
	Wed,  6 Oct 2021 18:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBBFAF8032D; Wed,  6 Oct 2021 18:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4C82F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C82F800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249317593"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="249317593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:23:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439175129"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:23:05 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mY9h8-009FoT-9J; Wed, 06 Oct 2021 19:23:02 +0300
Date: Wed, 6 Oct 2021 19:23:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
Message-ID: <YV3NZnb6mg43nUC1@smile.fi.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Oct 06, 2021 at 10:51:52AM -0500, Pierre-Louis Bossart wrote:
> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> > The devm_clk_get_optional() helper returns NULL when devm_clk_get()
> > returns -ENOENT. This makes things slightly cleaner. The added benefit
> > is mostly cosmetic.

...

> >  	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > -		if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
> > -			ret = clk_prepare_enable(priv->mclk);
> > -			if (ret < 0) {
> > -				dev_err(card->dev,
> > -					"could not configure MCLK state");
> > -				return ret;
> > -			}
> > +		ret = clk_prepare_enable(priv->mclk);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "could not configure MCLK state");
> > +			return ret;
> >  		}
> 
> I don't get why you removed the test on the BYT_RT5651_MCLK_EN quirk,
> see below it was designed as a fall-back mode. We don't want to return
> an error when we know the clock is not present/desired.

Why should we do a unneeded test? When we switch to the optional, there
will be no error from these CCF APIs. Besides that it drops indentation
level and makes code neat.

...

> same here, why was the quirk removed?

Same answer.

...

> that part in the probe looks fine, but the changes above are controversial.

I didn't get. How controversial? Why? The whole point of _optional is to get
rid of unneeded checks (since they are _anyway_ be called).

-- 
With Best Regards,
Andy Shevchenko


