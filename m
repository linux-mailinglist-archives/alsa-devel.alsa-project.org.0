Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93CFBF5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 16:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEE316BC;
	Tue, 30 Apr 2019 16:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEE316BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556636209;
	bh=D7+q20QUo9yPsO2ZK7ntqYRCwPGiEUm9lgwcF6j1vcQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utmfLALdnn3S0BOUSQPN0wqpOEuBwW2SqEzazDYp8HGLb4jygp1Lkds2Akcn7Juui
	 ZHS9kt9wHRVbuFFawgNVYRGJbgEzLjV4ZE8uA1Nr8ldJRkwR6Jv1Rg30igK7xPIwaW
	 pS050MB6egbudbY7iactV9HBdgtLkoLbx5AXvRFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2725F8962C;
	Tue, 30 Apr 2019 16:55:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 491D7F896AA; Tue, 30 Apr 2019 16:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46238F8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 16:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46238F8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U7z2ZvdX"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D71D620652;
 Tue, 30 Apr 2019 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556636095;
 bh=KGHJGNKItq5UbhYl4NJMJ+ljpiVIQwfC+IdlHirwk8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U7z2ZvdXUL9TMTE45FxRiQ3r/chwS3nqlHWidlx2FgfRoO1XGHspIXuksdrqW0P6+
 tNBeqDxxkty5tBBLq3c/M3ttInQ5mnPYc5gzIZVwurMIDJ6dk5M9tiaNjpKc7i5uuC
 07VHnm47yy6B0oyvBytZNwPaKnYR7DhSWymk0eFg=
Date: Tue, 30 Apr 2019 20:24:44 +0530
From: Vfiinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190430145444.GU3845@vkoul-mobl.Dlink>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
 <20190430085153.GS3845@vkoul-mobl.Dlink>
 <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
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

On 30-04-19, 08:38, Pierre-Louis Bossart wrote:
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
> sort of details. 

Thats fine, it is upto people, everyone has different views, mine is
different from Takashi's. We all know for example networking has
different stable and code style rule. That is how it is and I dont think
we would have one rule for all kernel.

All I ask is to be able to review and split up accordingly, I guess that
is a fair request

> The fact that the series was tagged as Reviewed by Takashi
> on April 11 and we are still discussing trivial changes tells me the
> integration model is broken. 

Is it? you got feedback on 15th (that too after my 2 week conf/vacation
break) and I got called crazy for that, not helping!!


> It's not just me the patches related to
> runtime-pm from your own Linaro colleagues posted on March 28 went nowhere
> either.

Does it matter it was a Linaro colleague or not, a patch was posted,
feedback given (similar to cadence one) we agreed that the fix
is not correct and so patch was not applied. I don't think Srini cried
over it!

> Moving forward, I suggest we merge SoundWire-related patches through the
> sound tree. There will be dependencies in the coming weeks between SOF and
> SoundWire and it makes no sense to have separate maintainers and make the
> life of early adopters more complicated than it needs to be. If we have
> 3-week delays for trivial stuff, I can't imagine what the pace will be when
> I publish the next 20-odd patches I am still working on, and the code needed
> for the SoundWire audio device class being standardized as we speak. Things
> were fine up to now since no one was actually using the code, we are in a
> different model now.

I disagree and wont accept it. I dont think you understand that you are
not the most important person in the whole world, the 20 patches series
you are cooking would sure be greatest ever, but that is not the point.
The kernel has a process, you got a feedback, please fix that and post
v2 rather than cribbing, complaining and calling crazy. The energy would
have been better spent on fixing the feedback provided.

Dependencies are _always_ there in kernel development and we know how to
deal with it. Am sure Takashi, Mark and me can come to reasonable
agreement, I wouldn't worry about that!

What we dont do is create new model for your 20 patches.

And I guess I dont have anything more to say on this thread, so I wont
bother replying, please feel free to post v2 and I shall review.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
