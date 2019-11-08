Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38639F5348
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 19:12:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71D71677;
	Fri,  8 Nov 2019 19:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71D71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573236744;
	bh=jCeQrtNyCWTt7u2UpZFlJSDS2jw5yB4Vf5LWbRMNApU=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9Qbwdtw1xXM/p0H3bcy34BQmQ/+sVVxblaSpBbL7DbeHJRUTkF+xB6KvyNO6qv5H
	 VoFE2Lf0f4jPt7xygKyd4FbSI2tFwFx0+KRvYs5blmDLsyts1a3dBaVUcJJrjgNwIu
	 ib+xPFJJYKGyAwOJA3kMKo3K+odDpkc6btROXZbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D31F8045F;
	Fri,  8 Nov 2019 19:10:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3884F803D0; Fri,  8 Nov 2019 19:10:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2297F80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 19:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2297F80111
IronPort-SDR: 6O2sq7uo7aA/GoDNKlhnAmjOml2fTo75iuMz7eSWxwr+tn8TaRMUzl2HVWXj2DmAYlcxg3T2vv
 /iDnxo8+0JYdTFI6ezSuwBJWvzwlL6fqOr7iFcIJT4pWB3NsdQKORj1QGabkLAFuWI4CWGgO5u
 1mZBpvuG+WzPs41kSoZ1OT+UoZODnhUDP86978TQNnNGmssa/UIPFroAE9afFOVj8lWanO0BAi
 0Yy9P+K/G0FHlzwmXd7bjZipkSlbjvkf7ZW3UmtuX65CJimLMBm/7YJYtWIUQuCozCOpo+jjlM
 ueY=
X-IronPort-AV: E=Sophos;i="5.68,282,1569312000"; d="scan'208";a="43007495"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 08 Nov 2019 10:10:25 -0800
IronPort-SDR: cJ2HoOQvWhF2kgqOONtw7dTLSUBbSQhARRgpLNdOm56y0+Zz/d4pC7X9wCb0W/+esi3Ui+AK0I
 OelaEfNmlar+YzaLsHO8sAgGFebumZDNoZlF3ulCEWjQTFNw5ZSULTj8+K7Q+CIlr14OGR7ZRC
 CKVQpxDEvCBScstQyvVBAWlQ7aKOucbdREEPevqolIE4AraoH0cs0PeH6XPLsMT0+t7X7Nc170
 AUkLwrmVZpwwMusLMfNImLDFnUiuD/y8FZaMlbDE/FdmWYXjusnq+E8HCFTQQ4+FNYWe+615l3
 g7E=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>	<20191105143218.5948-2-andrew_gabbasov@mentor.com>	<20191105143218.5948-3-andrew_gabbasov@mentor.com>	<20191105143218.5948-4-andrew_gabbasov@mentor.com>	<20191105143218.5948-5-andrew_gabbasov@mentor.com>	<20191105143218.5948-6-andrew_gabbasov@mentor.com>	<20191105143218.5948-7-andrew_gabbasov@mentor.com>	<20191105143218.5948-8-andrew_gabbasov@mentor.com>
 <s5hlfss862t.wl-tiwai@suse.de>
In-Reply-To: <s5hlfss862t.wl-tiwai@suse.de>
Date: Fri, 8 Nov 2019 21:09:22 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d5965f$b1926ac0$14b74040$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVk+YmK3KlOO6PeUGxcY472O0ao6d/XF4AgAB4QPA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 7/8] ALSA: aloop: Support selection of
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

Thank you very much for your feedback.

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Thursday, November 07, 2019 11:05 AM

> On Tue, 05 Nov 2019 15:32:17 +0100,
> Andrew Gabbasov wrote:
> > @@ -102,6 +106,13 @@ struct loopback_cable {
> >  	unsigned int pause;
> >  	/* timer specific */
> >  	struct loopback_ops *ops;
> > +	/* If sound timer is used */
> > +	struct {
> > +		int owner;
> 
> The term "owner" is a bit confusing here.  It seems holding the PCM
> direction, but most people expect it being a process-id or something
> like that from the word.

Will be fixed in next update.

> 
> > +		struct snd_timer_id id;
> > +		struct tasklet_struct event_tasklet;
> 
> You don't need to make own tasklet.  The timer core calls it via
> tasklet in anyway unless you pass SNDRV_TIMER_IFLG_FAST -- see below.
> 
> And the tasklet is no longer recommended infrastructure in the recent
> kernel, we should avoid it as much as possible.

See below about the tasklet.

> 
> >  struct loopback_setup {
> > @@ -122,6 +133,7 @@ struct loopback {
> >  	struct loopback_cable *cables[MAX_PCM_SUBSTREAMS][2];
> >  	struct snd_pcm *pcm[2];
> >  	struct loopback_setup setup[MAX_PCM_SUBSTREAMS][2];
> > +	char *timer_source;
> 
> This can be const char *, I suppose.

Yes, this will be fixed.

> > +static void loopback_snd_timer_period_elapsed(
> > +		struct loopback_cable * const cable,
> > +		const int event, const unsigned long resolution)
> > +{
> > +	struct loopback_pcm *dpcm_play =
> > +			cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
> > +	struct loopback_pcm *dpcm_capt =
> > +			cable->streams[SNDRV_PCM_STREAM_CAPTURE];
> 
> You shouldn't assign them outside the cable->lock.

I'll move these assigns to after obtaining the lock.

> > +	struct snd_pcm_runtime *valid_runtime;
> > +	unsigned int running, elapsed_bytes;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&cable->lock, flags);
> > +	running = cable->running ^ cable->pause;
> > +	/* no need to do anything if no stream is running */
> > +	if (!running) {
> > +		spin_unlock_irqrestore(&cable->lock, flags);
> > +		return;
> > +	}
> > +
> > +	if (event == SNDRV_TIMER_EVENT_MSTOP) {
> > +		if (!dpcm_play || !dpcm_play->substream ||
> > +		    !dpcm_play->substream->runtime ||
> > +		    !dpcm_play->substream->runtime->status ||
> 
> Would these conditions really happen?

This seems to be kind of over cautiousness ;-)
I remove all intermediate members checks.

> > +		    dpcm_play->substream->runtime->status->state !=
> > +		    SNDRV_PCM_STATE_DRAINING) {
> 
> What's special with DRAINING state?  The code doesn't show or explain
> it.  And for other conditions, we keep going even if the event is
> MSTOP?

There are some comments below in loopback_snd_timer_event() function.
When the sound timer stops and the stream is in the draining state,
we still need to flush the data remaining in the buffer, and the regular
"elapsed" functions are called for that.

> > +			spin_unlock_irqrestore(&cable->lock, flags);
> > +			return;
> > +		}
> > +	}
> > +
> > +	valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
> > +				dpcm_play->substream->runtime :
> > +				dpcm_capt->substream->runtime;
> > +
> > +	/* resolution is only valid for SNDRV_TIMER_EVENT_TICK events */
> > +	if (event == SNDRV_TIMER_EVENT_TICK) {
> > +		/* The hardware rules guarantee that playback and capture
> period
> > +		 * are the same. Therefore only one device has to be checked
> > +		 * here.
> > +		 */
> > +		if (loopback_snd_timer_check_resolution(valid_runtime,
> > +							resolution) < 0) {
> > +			spin_unlock_irqrestore(&cable->lock, flags);
> > +			if (cable->running & (1 <<
SNDRV_PCM_STREAM_PLAYBACK))
> > +				snd_pcm_stop_xrun(dpcm_play->substream);
> > +			if (cable->running & (1 <<
SNDRV_PCM_STREAM_CAPTURE))
> > +				snd_pcm_stop_xrun(dpcm_capt->substream);
> 
> Referencing outside the lock isn't really safe.  In the case of
> jiffies timer code, it's a kind of OK because it's done in the timer
> callback function that is assigned for each stream open -- that is,
> the stream runtime is guaranteed to be present in the timer callback.
> But I'm not sure about your case...

I re-structure this code a little to make all de-referencing inside the
lock.

> > @@ -749,6 +1037,152 @@ static struct loopback_ops
> loopback_jiffies_timer_ops = {
> >  	.dpcm_info = loopback_jiffies_timer_dpcm_info,
> >  };
> >
> > +static int loopback_parse_timer_id(const char * const str,
> > +				   struct snd_timer_id *tid)
> > +{
> > +	/* [<pref>:](<card name>|<card idx>)[{.,}<dev idx>[{.,}<subdev
> idx>]] */
> > +	const char * const sep_dev = ".,";
> > +	const char * const sep_pref = ":";
> > +	const char *name = str;
> > +	char save, *sep;
> > +	int card = 0, device = 0, subdevice = 0;
> > +	int err;
> > +
> > +	sep = strpbrk(str, sep_pref);
> > +	if (sep)
> > +		name = sep + 1;
> > +	sep = strpbrk(name, sep_dev);
> > +	if (sep) {
> > +		save = *sep;
> > +		*sep = '\0';
> > +	}
> > +	err = kstrtoint(name, 0, &card);
> > +	if (err == -EINVAL) {
> > +		/* Must be the name, not number */
> > +		for (card = 0; card < snd_ecards_limit; card++) {
> > +			if (snd_cards[card] &&
> > +			    !strcmp(snd_cards[card]->id, name)) {
> > +				err = 0;
> > +				break;
> > +			}
> > +		}
> > +	}
> 
> As kbuildbot reported, this is obviously broken with the recent
> kernel.  snd_cards[] is no longer exported!  And I don't want to
> export again.
> 
> IOW, if we need this kind of thing, it's better to modify the existing
> code in sound/core/init.c and export that function.

Yes, I realized it a little late ;-)
So far I changed the loop to something like

	for (card_idx = 0; card_idx < snd_ecards_limit; card_idx++) {
		struct snd_card *card = snd_card_ref(card_idx);
		if (card) {
			if (!strcmp(card->id, name))
				err = 0;
			snd_card_unref(card);
		}
		if (!err)
			break;
	}

Of course, adding a separate lookup helper function to sound/core/init.c,
like, for example,
	struct snd_card *snd_card_find_id(const char *id)
that makes similar loop in a more "atomic" way, with proper locking and
reference incrementing for the result, would be more efficient, so if you
decide to create such a helper, that would help to eliminate this loop
from here.

> > +/* call in loopback->cable_lock */
> > +static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
> > +{
> > +	int err = 0;
> > +	unsigned long flags;
> > +	struct snd_timer_id tid = {
> > +		.dev_class = SNDRV_TIMER_CLASS_PCM,
> > +		.dev_sclass = SNDRV_TIMER_SCLASS_APPLICATION,
> > +	};
> > +	struct snd_timer_instance *timer = NULL;
> 
> Why initialing to NULL here?

Will be fixed too.

> > +	spin_lock_irqsave(&dpcm->cable->lock, flags);
> 
> You need no irqsave version but spin_lock_irq() for the context like
> open/close that is guaranteed to be sleepable.

And this will be fixed.

> > +	spin_lock_irqsave(&dpcm->cable->lock, flags);
> > +
> > +	/* The callback has to be called from another tasklet. If
> > +	 * SNDRV_TIMER_IFLG_FAST is specified it will be called from the
> > +	 * snd_pcm_period_elapsed() call of the selected sound card.
> 
> Well, you're the one who specifies SNDRV_TIMER_IFLG_XXX, so you know
> that the flag isn't set.  So tasklet makes little sense.

Indeed, that flag is not set, and the regular callback is already called
from the tasklet. That's why the callback function, registered here
(loopback_snd_timer_function) does not use the tasklet.
However, the ccallback event handler is called by sound core directly,
without a tasklet, and within "spin_lock_irqsave(&timer->lock, flags)".
So, it's not possible to call snd_pcm_period_elapsed() directly
from ccallback function (loopback_snd_timer_event). In order to
be able to make this call, the local tasklet is used.

> > +	 * snd_pcm_period_elapsed() helds snd_pcm_stream_lock_irqsave().
> > +	 * Due to our callback loopback_snd_timer_function() also calls
> > +	 * snd_pcm_period_elapsed() which calls
> snd_pcm_stream_lock_irqsave().
> > +	 * This would end up in a dead lock.
> > +	 */
> > +	timer->flags |= SNDRV_TIMER_IFLG_AUTO;
> > +	timer->callback = loopback_snd_timer_function;
> > +	timer->callback_data = (void *)dpcm->cable;
> > +	timer->ccallback = loopback_snd_timer_event;
> 
> This reminds me that we need a safer way to assign these stuff in
> general...  But it's above this patch set, in anyway.
> 

I'm preparing the next version of this patch set with the changes,
described above, and some more code cleanup. It will be submitted soon.

Thanks!

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
