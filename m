Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DA1C879F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 13:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1103180B;
	Thu,  7 May 2020 13:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1103180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588849774;
	bh=/mtZ5WGXzOosl2v22r9XjAbR7pSmnQHFt3goB++zb3s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJsQ65WRNsR76+0eDOpDJ6/twwlvLYoMnv+4PXu0V6Dogx+sUSbhwK7NZ2x7ZrhFd
	 2fWqNvHfzDwZn5yqJb3bFMEQy1SFBCPrTpJdUUSvF1/NinQIKgAqXSZWbf4/1y5inr
	 cqhO8mk69kKbzFgVhFsk37RDtt2auX4i4aeZGGb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23684F80162;
	Thu,  7 May 2020 13:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 853FDF8015F; Thu,  7 May 2020 13:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB6FF800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 13:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB6FF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KNeNNF7Y"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA76D20736;
 Thu,  7 May 2020 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588849656;
 bh=/mtZ5WGXzOosl2v22r9XjAbR7pSmnQHFt3goB++zb3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNeNNF7Y/NCRmE8u/rkprCOAGhY4BJOCn/v4MIRqiuzP7rCLNghrnwhUffiou7oME
 +clc7XtcOH+NxDRlmbGawLwFU/3RNWps/8ZA6fjah+/ViKzbjSpjlIb/UQbu0275yl
 Ij9NRdR7oOID00T9O3tkqpI1oHNsAbughyNfs2Uk=
Date: Thu, 7 May 2020 13:07:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: KASAN: use-after-free Write in snd_rawmidi_kernel_write1
Message-ID: <20200507110734.GA1490467@kroah.com>
References: <CAFcO6XMGT42wFBxEa01Ee5Msuecm+WiXnn4rc-VWkC4vTzycPg@mail.gmail.com>
 <20200507082302.GF1024567@kroah.com> <s5h8si45ard.wl-tiwai@suse.de>
 <20200507101310.GA1311017@kroah.com> <s5hsggc3v4p.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsggc3v4p.wl-tiwai@suse.de>
Cc: security@kernel.org, alsa-devel@alsa-project.org,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, syzkaller <syzkaller@googlegroups.com>
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

On Thu, May 07, 2020 at 12:19:18PM +0200, Takashi Iwai wrote:
> On Thu, 07 May 2020 12:13:10 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > On Thu, May 07, 2020 at 11:56:22AM +0200, Takashi Iwai wrote:
> > > On Thu, 07 May 2020 10:23:02 +0200,
> > > Greg Kroah-Hartman wrote:
> > > > 
> > > > On Thu, May 07, 2020 at 04:04:25PM +0800, butt3rflyh4ck wrote:
> > > > > I report a bug (in linux-5.7-rc1) found by syzkaller.
> > > > > 
> > > > > kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.7.0-rc1.config
> > > > > reproducer: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/repro.cprog
> > > > > 
> > > > > I test the reproducer in linux-5.7-rc4 and crash too.
> > > > 
> > > > Great, care to create a fix for this and send it to the proper
> > > > maintainers?  That's the best way to get it fixed, otherwise it just
> > > > goes in the file with the rest of the syzbot reports we are burried
> > > > under.
> > > 
> > > Don't worry, I already prepared a fix patch below :)
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > > 
> > > -- 8< --
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Subject: [PATCH] ALSA: rawmidi: Fix racy buffer resize under concurrent
> > >  accesses
> > > 
> > > The rawmidi core allows user to resize the runtime buffer via ioctl,
> > > and this may lead to UAF when performed during concurrent reads or
> > > writes.
> > > 
> > > This patch fixes the race by introducing a reference counter for the
> > > runtime buffer access and returns -EBUSY error when the resize is
> > > performed concurrently.
> > > 
> > > Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> > > Cc: <stable@vger.kernel.org>
> > > Link: https://lore.kernel.org/r/CAFcO6XMWpUVK_yzzCpp8_XP7+=oUpQvuBeCbMffEDkpe8jWrfg@mail.gmail.com
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  include/sound/rawmidi.h |  1 +
> > >  sound/core/rawmidi.c    | 29 ++++++++++++++++++++++++++++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
> > > index a36b7227a15a..334842daa904 100644
> > > --- a/include/sound/rawmidi.h
> > > +++ b/include/sound/rawmidi.h
> > > @@ -61,6 +61,7 @@ struct snd_rawmidi_runtime {
> > >  	size_t avail_min;	/* min avail for wakeup */
> > >  	size_t avail;		/* max used buffer for wakeup */
> > >  	size_t xruns;		/* over/underruns counter */
> > > +	int buffer_ref;		/* buffer reference count */
> > >  	/* misc */
> > >  	spinlock_t lock;
> > >  	wait_queue_head_t sleep;
> > > diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> > > index 20dd08e1f675..4185d9e81e3c 100644
> > > --- a/sound/core/rawmidi.c
> > > +++ b/sound/core/rawmidi.c
> > > @@ -120,6 +120,17 @@ static void snd_rawmidi_input_event_work(struct work_struct *work)
> > >  		runtime->event(runtime->substream);
> > >  }
> > >  
> > > +/* buffer refcount management: call with runtime->lock held */
> > > +static inline void snd_rawmidi_buffer_ref(struct snd_rawmidi_runtime *runtime)
> > > +{
> > > +	runtime->buffer_ref++;
> > > +}
> > > +
> > > +static inline void snd_rawmidi_buffer_unref(struct snd_rawmidi_runtime *runtime)
> > > +{
> > > +	runtime->buffer_ref--;
> > > +}
> > 
> > Why not use the reference count structure?
> 
> The context accessing the buffer is always with the spinlock, so we
> don't need expensive atomic ops there.
> 
> Usually this kind of check can be a simple boolean flag, but in this
> case, there is one place that goes out of lock due to
> copy_from/to_user, so a refcount is used in this patch instead.

Ah, ok, thanks for the explanation.

greg k-h
