Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257D11384
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F29E1785;
	Thu,  2 May 2019 08:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F29E1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556779606;
	bh=IxEBFAbrM3IaMp/AnYPm3BKqlxtaHUEEMkMTCfEAQ/k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEwbLXfaqdt3k2gKMNUnqbb7gvHc3mRKilyndWRtMYeQw6rsXcIXLK6COXX7A/cLX
	 tJ0EPgPc7j9s07Z8nswT355Vu/OKoMjgkQll+pV+Iq7WqJlzpDtqK3nJIluvhkcBTQ
	 PfLAJ04UbXihF2slN4EL7d2X6jJ0EjhBvuvsN+oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9DBF896EA;
	Thu,  2 May 2019 08:45:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174CBF896C7; Thu,  2 May 2019 08:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7478BF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 08:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7478BF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2qpWuJ26"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83AC5208C4;
 Thu,  2 May 2019 06:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556779492;
 bh=t0B0FuOVE7Lh7IadbKF9pKqOPoOYFk5qPf8OvxHkMEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2qpWuJ26/iHz3DAWERdoRtev8O+uc7f55BIyH1gkalCRJDUmvhdoqct1XmKBowpYf
 q8krZ94SMaLjce49NkHH7G5wJ9+EW73lc3quUdoYV1WI5EV0gRHKTWjWctFplnDt+u
 TbaZ+ZB7B/D7ZD5tSgXKNNncES2J7vwiVmSGaqxw=
Date: Thu, 2 May 2019 12:14:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190502064438.GJ3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-3-pierre-louis.bossart@linux.intel.com>
 <20190502051440.GA3845@vkoul-mobl.Dlink>
 <20190502063139.GA14347@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502063139.GA14347@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 02/22] soundwire: fix SPDX license for
	header files
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

On 02-05-19, 08:31, Greg KH wrote:
> On Thu, May 02, 2019 at 10:46:49AM +0530, Vinod Koul wrote:
> > On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> > > No C++ comments in .h files
> > > 
> > > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >  drivers/soundwire/bus.h            | 4 ++--
> > >  drivers/soundwire/cadence_master.h | 4 ++--
> > >  drivers/soundwire/intel.h          | 4 ++--
> > 
> > As I said previously this touches subsystem header as well as driver
> > headers which is not ideal.
> 
> What?  Who knows that?  Who cares?

Well at least Pierre knows that very well :) He is designate Reviewer of
this subsystem.

> This is doing "one logical thing" to all of the needed files.  Your
> split of "this is a driver" vs. "this is a subsystem" split is _VERY_
> arbritary.
> 
> That's just too picky and assumes a subsystem-internal-knowledge much
> deeper than anyone submitting a normal cleanup patch would ever know.

Sure I do agree that this assumes internal knowledge but the contributor
knows the subsystem extremely well and he knows the different parts. For
drive by contributor I agree things would be not that picky :)

Even considering the patch series, some split was even file based and in
this case not done. All I ask is for consistency in the series proposed.

> I think you have swung too far to the "too picky" side, you might want
> to dial it back.

Sure given that this is code cleanup I will split them up and push.
Shouldn't take much of my time.

Thanks for the advise.
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
