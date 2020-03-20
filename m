Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B577B18D263
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 16:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3D91660;
	Fri, 20 Mar 2020 16:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3D91660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584716967;
	bh=aXCMXevHKRcdOt+Kl3TUjnQToeEmyryr+uvD5bSpjzE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ku37bTgOilEM/78A5bhLwIYYstfXRk941zHBiFbKKMdxjRffwN02yzdqKkS8kZgmH
	 HUjscz8u4yiJl2KinIDk7olKvX3f8hkBDg5FJqrv7reO5vkPFN0ULxqUxyayXsgvAk
	 rjLxLeMWymJy/YbpZnGQ8XrtVmZ80J9ftdtH8kV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 368A6F80162;
	Fri, 20 Mar 2020 16:07:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF38F8015B; Fri, 20 Mar 2020 16:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D6BF800C0;
 Fri, 20 Mar 2020 16:07:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D6BF800C0
IronPort-SDR: gL+bz+uRJTQ7EFjOhUkUomODU2l3Gcl2G3Wc0cQfkQZXw509NXqkmyukS+jwn0Dk7IviGbdfOy
 YnVtezXZnUEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 08:07:29 -0700
IronPort-SDR: O6djZM0BXaAnsVaLen+wd0zRGkwLZiuiqvYsOitkJDfC+EZMy6U+beqX+t+WKuZMmylYVsV4DL
 jl1M/2+PtuEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="237250392"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.57.199])
 by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2020 08:07:28 -0700
Date: Fri, 20 Mar 2020 16:07:27 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/14] ASoC: SOF: add a power status IPC
Message-ID: <20200320150727.GD2130@ubuntu>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-7-guennadi.liakhovetski@linux.intel.com>
 <20200313143956.GJ5528@sirena.org.uk>
 <20200320115203.GA2130@ubuntu>
 <20200320121952.GC3961@sirena.org.uk>
 <20200320132732.GC2130@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320132732.GC2130@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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

On Fri, Mar 20, 2020 at 02:27:32PM +0100, Guennadi Liakhovetski wrote:
> On Fri, Mar 20, 2020 at 12:19:52PM +0000, Mark Brown wrote:
> > On Fri, Mar 20, 2020 at 12:52:03PM +0100, Guennadi Liakhovetski wrote:
> > > On Fri, Mar 13, 2020 at 02:39:56PM +0000, Mark Brown wrote:
> > > > On Thu, Mar 12, 2020 at 03:44:21PM +0100, Guennadi Liakhovetski wrote:
> > 
> > > > >  #endif
> > > > > +	atomic_set(&sdev->reset_count, 0);
> > > > >  	dev_set_drvdata(dev, sdev);
> > 
> > > > Do we really need to use atomics for this?  They are hard to use
> > > > correctly.
> > 
> > > This variable is accessed from 2 contexts: it's incremented by the SOF 
> > > driver, when the firmware has booted and it's read by the SOF
> > > VirtIO backend vhost-be.c when receiving a resume request from the guest. 
> > > Timewise the variable will only be incremented during the DSP resume / 
> > > power up, while the VirtIO back end is waiting for the resume to complete in 
> > > pm_runtime_get_sync(). And only after that it reads the variable. But that 
> > > can happen on different CPUs. Whereas I think that runtime PM will sync 
> > > caches somewhere during the process, I think it is better to access the 
> > > variable in an SMP-safe way, e.g. using atomic operations.
> > 
> > That doesn't address my concern - to repeat, my concern is that atomics
> > are hard to use correctly.  Is there no other concurrency primitive (for
> > example this sounds like a completion) which can be used?
> 
> No, this isn't a completion - it's a counter. I've used atomic variables 
> before, I cannot remember seeing any difficulties with their correct use 
> described. Do you have a pointer?
> 
> Thinking about it, one problem I see is wrapping, it isn't currently 
> handled, but that would happen after quite a few PM suspend / resume 
> cycles... Still it can and should be fixed. But this isn't the concern, 
> that you have?

Actually I'd even say this isn't a problem. I think it's safe to say, you 
won't suspend and resume your audio interface more often than every 10 
seconds. That makes under 3200000 cycles per year. Even with 31 bits for a 
signed integer that makes more than 600 years. I think we're safe.

Thanks
Guennadi
