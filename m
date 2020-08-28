Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E32555EB
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 10:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB4A187A;
	Fri, 28 Aug 2020 10:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB4A187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598601737;
	bh=oUZCAVbtcMydjvoZYyf2WwWg8pwGlx2bq516aI+fa7c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iV9F9391wjxdnqREZH6ItZU/yDZwzuDW5AU+7b9nR6SFsL2piY+/Ux6KIGSaxZ3kD
	 v6vLi3Csy7yB9h7t296evZowVQfJiIhSYNUIze6ruGPR04q+nivVeGXi+aECdMBokW
	 leHhNV7QwCVKq5cDo26l9A/jb9lGZ3Kv1VT8LnqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC99F800EB;
	Fri, 28 Aug 2020 10:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA59F8016F; Fri, 28 Aug 2020 10:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F9BF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 10:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F9BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P76Uz+Cc"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23AD2205CB;
 Fri, 28 Aug 2020 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598601629;
 bh=oUZCAVbtcMydjvoZYyf2WwWg8pwGlx2bq516aI+fa7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P76Uz+CcmzajUs1I4wD15bQoWu7IxT1hgqj+U4LnwzO7wHBUkwQppOAQmIR9Jm8J+
 rGcjLhdsqJHe66Nh9+IuRMrkw0PGKGb+iPgFBZZwQQ/IpgE95QwlO9IgNWRIj8mFcQ
 f3ky0upcSAi3+o5ZVimpIhk6M3V7tWgpIyvo3IJI=
Date: Fri, 28 Aug 2020 13:30:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
Message-ID: <20200828080024.GP2639@vkoul-mobl>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
 <20200819090637.GE2639@vkoul-mobl>
 <8d60fa6f-bb7f-daa8-5ae2-51386b87ccad@linux.intel.com>
 <20200821050758.GI2639@vkoul-mobl>
 <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 21-08-20, 10:17, Pierre-Louis Bossart wrote:
> 
> 
> > > cancel_work_sync() will either
> > > a) wait until the current work completes, or
> > > b) prevent a new one from starting.
> > > 
> > > there's no way to really 'abort' a workqueue, 'cancel' means either complete
> > > or don't start.
> > 
> > Quite right, as that is how everyone deals with it. Stop the irq from
> > firing first and then wait until work is cancelled or completed, hence
> > cancel_work_sync()
> 
> No, this cannot work... The work queue in progress will initiate
> transactions which would never complete because the interrupts are disabled.

Okay that makes sense then

> > > if you disable the interrupts then cancel the work, you have a risk of not
> > > letting the work complete if it already started (case a).
> > > 
> > > The race is
> > > a) the interrupt thread (this function) starts
> > > b) the work is scheduled and starts
> > > c) the suspend handler starts and disables interrupts in [1] below.
> > > d) the work initiates transactions which will never complete since Cadence
> > > interrupts have been disabled.
> > 
> > Would it not be better to let work handle the case of interrupts
> > disabled and not initiates transactions which wont complete here? That
> > sounds more reasonable to do rather than complete the work which anyone
> > doesn't matter as you are suspending
> 
> A in-progress workqueue has no notion that interrupts are disabled, nor that
> the device is in the process of suspending. It writes into a fifo and blocks
> with wait_for_completion(). the complete() is done in an interrupt thread,
> triggered when the RX Fifo reaches a watermark.
> 
> So if you disable interrupts, the complete() never happens.
> 
> The safe way to do things with the current code is to let the workqueue
> complete, then disable interrupts.
> 
> We only disable interrupts on suspend, we don't need to test if interrupts
> are enabled for every single byte that's transmitted on the bus. Not to
> mention that this additional test would be racy as hell and require yet
> another synchronization primitive making the code more complicated.
> 
> So yes, the current transactions will complete and will be ignored, but it's
> a lot better than trying to prevent these transactions from happening with
> extra layers of complexity that will impact *every* transaction.
> 
> BTW I looked at another alternative based on the msg lock, so that
> interrupts cannot be disabled while a message is being sent. However because
> a workqueue may send multiple messages, e.g. to read registers are
> non-contiguous locations, there is no way to guarantee what happens how
> messages and interrupt disabling are scheduled, so there'd still be a case
> of a workqueue not completing and being stuck on a mutex_lock(), not so good
> either.
> 
> In short, this is the simplest way to fix the timeout on resume.

Is this timeout for suspend or resume? Somehow I was under the
assumption that it is former? Or is the result seen on resume?

Rereading the race describe above in steps, I think this should be
handled in step c above. Btw is that suspend or runtime suspend which
causes this? Former would be bigger issue as we should not have work
running when we return from suspend call. Latter should be dealt with
anyway as device might be off after suspend.

-- 
~Vinod
