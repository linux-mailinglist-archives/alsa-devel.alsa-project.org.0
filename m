Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6A37A8BA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:15:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 906AC17D4;
	Tue, 11 May 2021 16:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 906AC17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620742510;
	bh=arV8oOgE3x2O+5GW/C7uzPCMCn4lOK01+scSUmzZcpA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXrICnqQfiBIogCT1v4iVp6oEoCqw7okRehL2qD3lWwHIKEV1OzeDQEMORkYgIyQ8
	 PmH3gIA/c4kvhKfQxXHiT4B3U5o057RfQSYGMSebVUeqaW63rxy6FBz0RxPOBf091q
	 yehwsfP0QCpHCpbk1/0kOGACEdmP6pd3iDO79Qqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04896F8016B;
	Tue, 11 May 2021 16:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6DB7F80163; Tue, 11 May 2021 16:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC92F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC92F80129
IronPort-SDR: 2hVBHEI24PTPaWftEmEctfs3nWS0uPyi20gXwuswQDi1SOq2Xs6oVww7UKW5l05PQOptB2DGkr
 J5dt3utx0WbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220411361"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="220411361"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:13:30 -0700
IronPort-SDR: XWeliyNGUr1fBJgpmzQTk+wnAEIVoQ1NpxHUGgP7CmAWCiSgGYYn/E7tC/qPno4JAxIXTlmLzj
 GElIT6wMfHhw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="541660559"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:13:27 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgT8W-00BSqe-Oy; Tue, 11 May 2021 17:13:24 +0300
Date: Tue, 11 May 2021 17:13:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <YJqRBIdTlvnsCYsn@smile.fi.intel.com>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
 <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
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

On Tue, May 11, 2021 at 04:56:05PM +0300, Andy Shevchenko wrote:
> On Tue, May 11, 2021 at 4:52 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, May 11, 2021 at 4:47 PM Mark Brown <broonie@kernel.org> wrote:
> > >
> > > On Tue, May 11, 2021 at 03:28:18PM +0300, Andy Shevchenko wrote:
> > > > On Tue, May 11, 2021 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:
> > >
> > > > > On Fri, 23 Apr 2021 21:24:27 +0300, Andy Shevchenko wrote:
> > > > > > Set of cleanups here and there related to the SPI PXA2xx driver.
> > > > > > On top of them, adding the special type for Intel Merrifield.
> > >
> > > > > [07/14] spi: pxa2xx: Introduce int_stop_and_reset() helper
> > > > >         (no commit info)
> > >
> > > > The above patches are effectively missed.
> > > > Anything to fix in your scripts / my patches?
> > >
> > > Like I said, patch 7 didn't apply so you should check and resend.
> >
> > I didn't get it. I have effectively rebased the entire series and resend as v2.
> 
> v2 --> v3
> 
> v3
> https://lore.kernel.org/linux-spi/20210510124134.24638-1-andriy.shevchenko@linux.intel.com/T/#t
> 
> 
> > I can speculate that your scripts have a bug since they might try v1
> 
> v1 --> v1 and / or v2
> 
> > as well (as far as I can see they usually send a confirmation of
> > application for all versions of the series in question).
> >
> > Sorry, but I do not see an issue.

Just in case I'll send a v4 with only patches that missed.
Otherwise it will be the same as in v3 (see above).

-- 
With Best Regards,
Andy Shevchenko


