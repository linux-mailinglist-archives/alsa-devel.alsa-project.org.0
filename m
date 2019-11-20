Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275661042C9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 19:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F90F1762;
	Wed, 20 Nov 2019 19:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F90F1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272939;
	bh=ge1OOFdOM/6bjvLrHcpdzhsNwcHArlIiRz4viIWhfGQ=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjvrwqgUqhu8w99hQVE91jOP0frtlWvzyAgZB2pcYxcXEztr8Ip9ItVFPwukE8G0G
	 YfvqKXapvUGPYez61EdF7C9CWSa8HuYpx4BvZna4jIShLZX2nqdOIS8GXa/onOkkTq
	 OR35O1LZLH9BidVZiDk4Hs1ONYXQ4YA2W61OCfpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9AEF80214;
	Wed, 20 Nov 2019 18:57:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64543F80212; Wed, 20 Nov 2019 18:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F81F8020B
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F81F8020B
IronPort-SDR: 5aF1M6aM8hwEJHUBQKll2VFqaAqCNXi98dquRKazb6Rc3NWYoVPR4Oyn9NPTp8ZGmD50m7xrOI
 /oFA9Vu0TNmtu/T0ala2AVKPqdB9zOYPQi5XJ8rojLQWfbxNLNzpu1n8jE56Vjyyj1lTYPb23T
 IYgVK+jep7Y09Sz2AcdJPLQpFxuFrX2yaSNitby9lLod0Jd5i4ZEXb0T7G1cMFNGDrqGx7zyBi
 6piiXDeKvSd142xDRBe4m/Ruwwo1q32buPkm6NXHyFZXEfahou04W3sNHf+ZUar21NsdXvXyYy
 ups=
X-IronPort-AV: E=Sophos;i="5.69,222,1571731200"; d="scan'208";a="43363166"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 20 Nov 2019 09:57:19 -0800
IronPort-SDR: U4ezTC14YwiNdT+RwZz7ugpGkGTNSs7V9ZU80RveK2zNvt5qQ67NJjXD1KEXK8NW7GDBd33Fxx
 mgV1RvycdnXc2mtPA8bS/wIGhW7Npn2p3DUaFkstaev0YfX75cjVQuncsTZ+H7Yhju3t9xe/PQ
 SvH/P3+ln8EDX9aJoFzFnDBdCa3Jr5oEFcVAGP9pr04sGZQmRMpY9MermLkt6ZiIUegX/My5OQ
 ieXitmKSWQoAEEKPuSGUoZZFO0CztTKDMPGcsEvcKKwN40Jv9yQDVDxEhV3ffsYCE48I+xu56a
 JFc=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20191120115856.4125-1-andrew_gabbasov@mentor.com>	<20191120115856.4125-2-andrew_gabbasov@mentor.com>	<20191120115856.4125-3-andrew_gabbasov@mentor.com>	<20191120115856.4125-4-andrew_gabbasov@mentor.com>	<20191120115856.4125-5-andrew_gabbasov@mentor.com>	<20191120115856.4125-6-andrew_gabbasov@mentor.com>	<20191120115856.4125-7-andrew_gabbasov@mentor.com>	<s5hh82y8vn5.wl-tiwai@suse.de>	<000001d59fb6$4ca36aa0$e5ea3fe0$@mentor.com>	<s5h5zje8sxl.wl-tiwai@suse.de>	<000101d59fb8$a288a280$e799e780$@mentor.com>
 <s5h36ei8rph.wl-tiwai@suse.de>
In-Reply-To: <s5h36ei8rph.wl-tiwai@suse.de>
Date: Wed, 20 Nov 2019 20:56:31 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000201d59fcb$d895a180$89c0e480$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVn7tmhCAU3Kkkmk2hDkJrcybUyqeUV53A
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v4 6/7] ALSA: aloop: Support selection of
	snd_timer instead of jiffies
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

Hello Takashi,

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Wednesday, November 20, 2019 6:59 PM
> To: Gabbasov, Andrew
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Jaroslav
> Kysela; Takashi Iwai; Timo Wischer
> Subject: Re: [PATCH v4 6/7] ALSA: aloop: Support selection of snd_timer
> instead of jiffies
> 
> On Wed, 20 Nov 2019 16:39:00 +0100,
> Andrew Gabbasov wrote:
> >
> > Hello Takashi,
> >
> > > -----Original Message-----
> > > From: Takashi Iwai [mailto:tiwai@suse.de]
> > > Sent: Wednesday, November 20, 2019 6:32 PM
> > > To: Gabbasov, Andrew
> > > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
Jaroslav
> > > Kysela; Takashi Iwai; Timo Wischer
> > > Subject: Re: [PATCH v4 6/7] ALSA: aloop: Support selection of
snd_timer
> > > instead of jiffies
> > >
> > > On Wed, 20 Nov 2019 16:21:36 +0100,
> > > Andrew Gabbasov wrote:
> > > >
> > > > Hello Takashi,
> > > >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai [mailto:tiwai@suse.de]
> > > > > Sent: Wednesday, November 20, 2019 5:34 PM
> > > > > To: Gabbasov, Andrew
> > > > > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
> > Jaroslav
> > > > > Kysela; Takashi Iwai; Timo Wischer
> > > > > Subject: Re: [PATCH v4 6/7] ALSA: aloop: Support selection of
> > snd_timer
> > > > > instead of jiffies
> > > > >
> > > > > On Wed, 20 Nov 2019 12:58:55 +0100,
> > > > > Andrew Gabbasov wrote:
> > > > > > +/* call in loopback->cable_lock */
> > > > > > +static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
> > > > > > +{
> > > > > > +	int err = 0;
> > > > > > +	struct snd_timer_id tid = {
> > > > > > +		.dev_class = SNDRV_TIMER_CLASS_PCM,
> > > > > > +		.dev_sclass = SNDRV_TIMER_SCLASS_APPLICATION,
> > > > > > +	};
> > > > > > +	struct snd_timer_instance *timeri;
> > > > > > +	struct loopback_cable *cable = dpcm->cable;
> > > > > > +
> > > > > > +	spin_lock_irq(&cable->lock);
> > > > > > +
> > > > > > +	/* check if timer was already opened. It is only opened once
> > > > > > +	 * per playback and capture subdevice (aka cable).
> > > > > > +	 */
> > > > > > +	if (cable->snd_timer.instance)
> > > > > > +		goto unlock;
> > > > > > +
> > > > > > +	err = loopback_parse_timer_id(dpcm->loopback->timer_source,
> > > &tid);
> > > > > > +	if (err < 0) {
> > > > > > +		pcm_err(dpcm->substream->pcm,
> > > > > > +			"Parsing timer source \'%s\' failed with
> > %d",
> > > > > > +			dpcm->loopback->timer_source, err);
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	cable->snd_timer.stream = dpcm->substream->stream;
> > > > > > +	cable->snd_timer.id = tid;
> > > > > > +
> > > > > > +	timeri = snd_timer_instance_new(dpcm->loopback->card->id);
> > > > > > +	if (!timeri) {
> > > > > > +		err = -ENOMEM;
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +	/* The callback has to be called from another tasklet. If
> > > > > > +	 * SNDRV_TIMER_IFLG_FAST is specified it will be called from
> > > the
> > > > > > +	 * snd_pcm_period_elapsed() call of the selected sound card.
> > > > > > +	 * snd_pcm_period_elapsed() helds
> > > snd_pcm_stream_lock_irqsave().
> > > > > > +	 * Due to our callback loopback_snd_timer_function() also
> > > calls
> > > > > > +	 * snd_pcm_period_elapsed() which calls
> > > > > snd_pcm_stream_lock_irqsave().
> > > > > > +	 * This would end up in a dead lock.
> > > > > > +	 */
> > > > > > +	timeri->flags |= SNDRV_TIMER_IFLG_AUTO;
> > > > > > +	timeri->callback = loopback_snd_timer_function;
> > > > > > +	timeri->callback_data = (void *)cable;
> > > > > > +	timeri->ccallback = loopback_snd_timer_event;
> > > > > > +
> > > > > > +	/* snd_timer_close() and snd_timer_open() should not be
> > called
> > > with
> > > > > > +	 * locked spinlock because both functions can block on a
> > > mutex. The
> > > > > > +	 * mutex loopback->cable_lock is kept locked. Therefore
> > > > > snd_timer_open()
> > > > > > +	 * cannot be called a second time by the other device of the
> > > same
> > > > > cable.
> > > > > > +	 * Therefore the following issue cannot happen:
> > > > > > +	 * [proc1] Call loopback_timer_open() ->
> > > > > > +	 *	   Unlock cable->lock for snd_timer_close/open()
> > call
> > > > > > +	 * [proc2] Call loopback_timer_open() -> snd_timer_open(),
> > > > > > +	 *	   snd_timer_start()
> > > > > > +	 * [proc1] Call snd_timer_open() and overwrite running timer
> > > > > > +	 *	   instance
> > > > > > +	 */
> > > > > > +	spin_unlock_irq(&cable->lock);
> > > > > > +	err = snd_timer_open(timeri, &cable->snd_timer.id, current-
> > > >pid);
> > > > > > +	if (err < 0) {
> > > > > > +		pcm_err(dpcm->substream->pcm,
> > > > > > +			"snd_timer_open (%d,%d,%d) failed with %d",
> > > > > > +			cable->snd_timer.id.card,
> > > > > > +			cable->snd_timer.id.device,
> > > > > > +			cable->snd_timer.id.subdevice,
> > > > > > +			err);
> > > > > > +		snd_timer_instance_free(timeri);
> > > > > > +		return err;
> > > > > > +	}
> > > > > > +	spin_lock_irq(&cable->lock);
> > > > > > +
> > > > > > +	cable->snd_timer.instance = timeri;
> > > > > > +
> > > > > > +	/* initialise a tasklet used for draining */
> > > > > > +	tasklet_init(&cable->snd_timer.event_tasklet,
> > > > > > +		     loopback_snd_timer_tasklet, (unsigned
> > > long)timeri);
> > > > >
> > > > > This has to be set before snd_timer_open().  The callback might be
> > > > > called immediately after snd_timer_open().
> > > >
> > > > This tasklet is used/scheduled only in ccallback (not regular tick
> > > > callback),
> > > > and only for SNDRV_TIMER_EVENT_MSTOP event. Can this event really
> happen
> > > > immediately after snd_timer_open()?
> > >
> > > Why not?  The master timer can be stopped at any time, even between
> > > these two lines.
> > >
> > > Beware that there are fuzzer programs that can trigger such racy
> > > things, and you're adding the code to the target that is actively
> > > slapped by them :)
> >
> > OK, got it.
> > I'll move this initialization to before snd_timer_open() in the next
> > update together with the fixes for the other issues you will find
> > in this version.
> 
> I have no other issues, so you can just resubmit only that patch,
> too.

I'm not sure how to correctly format resubmitting of a single patch from
a patch set, so I'm submitting the next version v5 of the whole patch set:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158939.h
tml

Thanks!

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
