Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C9FB0C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 16:07:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BB316BA;
	Tue, 30 Apr 2019 16:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BB316BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556633243;
	bh=INVoaGIqZEJIBn6J8J/ZTGe6laIDnhvPhFjLO6+St/4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRUv+SalArv63Lvt9ksTzsQptYYzTcYXAEDCz8Lvy7EeQHlCjIzKwok7dk+B94ZRO
	 KtNrRMqpUkmlV7tdLK6+20d0fWgtYuX3bfV6vTP4zWtITI5shrxA4Ve1DF56+PBTA1
	 7Xn3lkdghlYh8nW0LfR/7qzYyWI28m1Gjk6tV07M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97917F896EC;
	Tue, 30 Apr 2019 16:05:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69D54F8962C; Tue, 30 Apr 2019 16:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CDA5F80759
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CDA5F80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XO/1XkYs"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D35E82087B;
 Tue, 30 Apr 2019 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556633129;
 bh=9ZJWdF9SsTB6SA6IlPmBNvu9i4begnuPan4SVaTH7C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XO/1XkYslcvewRRAsFHBIitR5RAe4LM+HHpRsmO27GfE3GZYiaPcKUMG+ox70Rofz
 gVbcZVG5JmRE0f1MhnwhpgkNULch9gSn5CX/EohFg8g2tDQaqctq3PS8Zz/0ud/UlK
 29eVTW66hFK0HQUALY9R7Ra5mkVuMkadA4QdDLuc=
Date: Tue, 30 Apr 2019 16:05:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190430140526.GB18986@kroah.com>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
 <20190430085153.GS3845@vkoul-mobl.Dlink>
 <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/5] soundwire: fix style issues
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

On Tue, Apr 30, 2019 at 08:38:01AM -0500, Pierre-Louis Bossart wrote:
> On 4/30/19 3:51 AM, Vinod Koul wrote:
> > On 15-04-19, 08:09, Pierre-Louis Bossart wrote:
> > > 
> > > > > 
> > > > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > > > ---
> > > > >    drivers/soundwire/Kconfig          |   2 +-
> > > > >    drivers/soundwire/bus.c            |  87 ++++++++--------
> > > > >    drivers/soundwire/bus.h            |  16 +--
> > > > >    drivers/soundwire/bus_type.c       |   4 +-
> > > > >    drivers/soundwire/cadence_master.c |  87 ++++++++--------
> > > > >    drivers/soundwire/cadence_master.h |  22 ++--
> > > > >    drivers/soundwire/intel.c          |  87 ++++++++--------
> > > > >    drivers/soundwire/intel.h          |   4 +-
> > > > >    drivers/soundwire/intel_init.c     |  12 +--
> > > > >    drivers/soundwire/mipi_disco.c     | 116 +++++++++++----------
> > > > >    drivers/soundwire/slave.c          |  10 +-
> > > > >    drivers/soundwire/stream.c         | 161 +++++++++++++++--------------
> > > > 
> > > > I would prefer this to be a patch per module. It doesnt help to have a
> > > > single patch for all the files!
> > > > 
> > > > It would be great to have cleanup done per logical group, for example
> > > > typos in a patch, aligns in another etc...
> > > 
> > > You've got to be kidding. I've never seen people ask for this sort of
> > > detail.
> > 
> > Nope this is the way it should be. A patch is patch and which
> > should do one thing! Even if it is a cleanup one.
> > 
> > I dislike a patch which touches everything, core, modules, so please
> > split up. As a said in review it takes guesswork to find why a change
> > was done, was it whitespace fix, indentation or not, so please split up
> > based on type of fixes.
> 
> With all due respect, you are not helping here but rather slowing things
> down. I've done dozens of cleanups in the ALSA tree and I didn't go in this
> sort of details. The fact that the series was tagged as Reviewed by Takashi
> on April 11 and we are still discussing trivial changes tells me the
> integration model is broken. It's not just me, the patches related to
> runtime-pm from your own Linaro colleagues posted on March 28 went nowhere
> either.

My patch-bot would reject a patch that tried to do multiple types of
different cleanups on the same file(s).  Has done so for _years_, this
is not a new thing.

Remember, maintainer/reviewer time is scarce, engineer time is prolific,
we optimize for reviewers, not the people writing the patches.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
