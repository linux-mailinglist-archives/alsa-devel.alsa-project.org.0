Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4F1FF2EE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 15:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E5C1793;
	Thu, 18 Jun 2020 15:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E5C1793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592486655;
	bh=yfH7paTV5utxR6pdJDohoIotURt94IbHGCWKKAKSypo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4yP7LofCoqVPrRl6DcgfkcyhBBHehEd8D2vtsITqnfBmUXL81xc75Kb3eIrmYV+6
	 qQ/jwMcswOabY1M6+H/1pcTXCmvOhjjp6NaLI5HV7R0GRNd8Gkf8EQEhCfBvKyy8O0
	 m9IzfH+VTpclYc97bTC2dbs7ff2OmqYnd1inhRko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB969F80116;
	Thu, 18 Jun 2020 15:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98CC6F80116; Thu, 18 Jun 2020 15:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B43CF80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 15:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B43CF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="dB8dEPfn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1EXZP1VgfB5p7ZotK0pekxb7wL9GkOzwy8Sb5kFNyhk=; b=dB8dEPfng0GngeKJaaNSFKULfZ
 NgGjYm9SyUp7pmm179+hcbQc8vc9NqN922bmtTnGxzWZsm5ImsupTCvxNYdEnK3TrmKI0iFPOwWni
 tXJgh7eHyZXqZA+yRvgytTLrJK6JGeXc1B1iaOLtFao1UPe/WFCOD55SdmXxbVmUDRqVHXfZfIMGy
 vPmHss97e/B+dYbzFgWz7C1AaSNfGYb01He7PTNWWGqBW643krdfXG0GGxxhhjEBKyPHSkTkuPVbs
 hVYMotDia+nK7URWUL2QWWe38635jlp8wZkPudx7qkeVUaHrdXcJP6t0jfafo53tAwvXp/oR4RSRu
 d5GA+dZw==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jluUr-00028F-5g; Thu, 18 Jun 2020 14:22:25 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jluUq-0003uo-Qm; Thu, 18 Jun 2020 14:22:24 +0100
Date: Thu, 18 Jun 2020 14:22:24 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <2006181301290.3775@stax.localdomain>
Message-ID: <2006181412300.3775@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <s5hsgev16ck.wl-tiwai@suse.de>
 <2006161451110.1865@stax.localdomain> <s5hlfkn14cr.wl-tiwai@suse.de>
 <2006171134130.2561@stax.localdomain> <s5hmu50yehs.wl-tiwai@suse.de>
 <2006181008350.26846@stax.localdomain> <s5h7dw4y5zf.wl-tiwai@suse.de>
 <2006181301290.3775@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Thu, 18 Jun 2020, Mark Hills wrote:

> On Thu, 18 Jun 2020, Takashi Iwai wrote:
> 
> > On Thu, 18 Jun 2020 13:07:33 +0200,
> > Mark Hills wrote:
> > > 
> > > On Thu, 18 Jun 2020, Takashi Iwai wrote:
> > > 
> > > > On Wed, 17 Jun 2020 12:51:05 +0200,
> > > > Mark Hills wrote:
> > > [...]
> > > But could I please ask for help with the bigger picture? As it feels 
> > > mismatched.
> > > 
> > > * Code should take every possible opportunity to update the stream 
> > >   position; interrupts, or explicit pcm_pointer calls (whereas the docs 
> > >   guide towards doing it in the interrupt handler)
> > > 
> > > * I critiqued (elsewhere in thread) the older interrupt handler for 
> > >   checking the counter, unlocking, calling back into PCM core and checking 
> > >   again a moment later. Whereas this is considered good behaviour.
> > > 
> > > * Seems like the overall aim is for userland to be able (if it wants to)  
> > >   to poll the soundcard, even outside of periods.
> > 
> > Right, the user-space can query the current position at any time, and
> > the driver should return the position as precisely as possible.
> > 
> > Some applications (like PulseAudio) sets the interrupt as minimum as
> > possible while it does schedule the update by itself, judging the
> > position via the ioctl.  In such operational mode, the accuracy of the
> > current position query is vital.
> > 
> > > If all the above is true, I would expect interrupt handling to be very 
> > > simple -- it would straight away call into PCM core, join existing if the 
> > > codepaths (to take locks) and do a position update. PCM core would decide 
> > > if a period really elapsed, not the driver. But this is not how it works.
> > > 
> > > This now relates strongly to a question of locking:
> > > 
> > > I ran the code (top of this message) all day, with a few instances in 
> > > dmesg (at irregular intervals, not wrapping):
> > > 
> > >   [161644.076666] snd_echo3g 0000:09:02.0: invalid position: , pos = 4096, buffer size = 4096, period size = 64
> > >   [163232.392501] snd_echo3g 0000:09:02.0: invalid position: , pos = 4096, buffer size = 4096, period size = 64
> > >   [164976.098069] snd_echo3g 0000:09:02.0: invalid position: , pos = 4096, buffer size = 4096, period size = 64
> > >   [165054.946225] snd_echo3g 0000:09:02.0: invalid position: , pos = 4096, buffer size = 4096, period size = 64
> > >   [165312.141545] snd_echo3g 0000:09:02.0: invalid position: , pos = 4096, buffer size = 4096, period size = 64
> > > 
> > > A definite bug, of course.
> > > 
> > > However (and I am happy to be corrected) the function never finishes with 
> > > position == buffer size. Only way is a race between interrupt handler and 
> > > pcm_pointer.
> > > 
> > > Therefore one of these is needed:
> > > 
> > > * pcm_pointer locks chip->lock
> > > 
> > >   Even though the docs emphasise PCM core has exclusivity, it it not worth 
> > >   much as it does not protect against the interrupt handler.
> > > 
> > >   But now interrupt handler becomes ugly in total: take chip->lock, check 
> > >   the counter, release chip->lock, go to PCM core (which takes middle 
> > >   layer locks), take chip->lock again, check counter again, release 
> > >   chip->lock again.
> > 
> > Yes, that's the most robust way to go.  If the lock is really costing
> > too much, you can consider a fast-path by some flag for the irq ->
> > snd_pcm_period_elapsed() case.
> 
> I don't understand how a fast path could be made to work, as it can't pass 
> data across snd_pcm_period_elapsed() and it still must syncronise access 
> between reading dma_counter and writing pipe->position.
> 
> Hence questioning if a better design is simpler interrupt handlers that 
> just enter PCM core.
>  
> > Basically you can do everything in the pointer callback.  The only 
> > requirement in the interrupt handle is basically judge whether you need 
> > the call of snd_pcm_period_elapsed() and call it.  The rest update could 
> > be done in the other places.
> 
> Thanks, please just another clarification:
> 
> I presume that calls to pcm_pointer are completely independent of the 
> period notifications?
> 
> ie. period notifications are at regular intervals, regardless of whether 
> pcm_pointer is called inbetween. pcm_pointer must not reset any state used 
> by the interrupt.
> 
> Which means we must handle when non-interrupt call to pcm_pointer causes a 
> period to elapse. The next interrupt handler must notify.
> 
> I can see in the original code uses chip->last_period exclusively by the 
> interrupt handler, and I removed it. Some comments around the intent would 
> help. I'll cross reference the original code with my new understanding.
> 
> My instinct here is that to preserve
> 
> - regular period notifications
> 
> - handle period_size not aligning with 32-bit counter
> 
> - no races between interrupt and pcm_pointer
> 
> that the clearest and bug-free implementation may be to separate the 
> interrupt (notifications) and pointer updates to separate state.
> 
> Then there's no lock and the only crossover is an atomic read of 
> dma_counter.
> 
> And that's what I will try -- thanks.

Ok so the implementation would look something like this below,
which I will run for the rest of the day:

* Clear separation of the period notification from position updates; only 
  syncronising is around dma_counter, no need for locks

* All counting is accumulated to avoid bugs in the cases of wrapping
  and non-alignment

It's easier to see in the end results but of course I'll work on a clear 
diff.

---

/******************************************************************************
	IRQ Handling
******************************************************************************/
/* Check if a period has elapsed since last interrupt
 *
 * Don't make any updates to state; PCM core handles this with the
 * correct locks.
 *
 * \return true if a period has elapsed, otherwise false
 */
static bool period_has_elapsed(struct snd_pcm_substream *substream)
{
	struct snd_pcm_runtime *runtime = substream->runtime;
	struct audiopipe *pipe = runtime->private_data;
	u32 counter, step;
	size_t period_bytes;

	if (pipe->state != PIPE_STATE_STARTED)
		return false;

	period_bytes = frames_to_bytes(runtime, runtime->period_size);

	counter = le32_to_cpu(*pipe->dma_counter);  /* presumed atomic */

	step = counter - pipe->last_period;  /* handles wrapping */
	step -= step % period_bytes;  /* acknowledge whole periods only */

	if (step == 0)
		return false;  /* haven't advanced a whole period yet */

	pipe->last_period += step;  /* used exclusively by us */
	return true;
}

static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
{
	struct echoaudio *chip = dev_id;
	int ss, st;

	spin_lock(&chip->lock);
	st = service_irq(chip);
	if (st < 0) {
		spin_unlock(&chip->lock);
		return IRQ_NONE;
	}
	/* The hardware doesn't tell us which substream caused the irq,
	thus we have to check all running substreams. */
	for (ss = 0; ss < DSP_MAXPIPES; ss++) {
		struct snd_pcm_substream *substream;

		substream = chip->substream[ss];
		if (substream && period_has_elapsed(substream)) {
			spin_unlock(&chip->lock);
			snd_pcm_period_elapsed(substream);
			spin_lock(&chip->lock);
		}
	}
	spin_unlock(&chip->lock);

#ifdef ECHOCARD_HAS_MIDI
	if (st > 0 && chip->midi_in) {
		snd_rawmidi_receive(chip->midi_in, chip->midi_buffer, st);
		dev_dbg(chip->card->dev, "rawmidi_iread=%d\n", st);
	}
#endif
	return IRQ_HANDLED;
}


static snd_pcm_uframes_t pcm_pointer(struct snd_pcm_substream *substream)
{
	struct snd_pcm_runtime *runtime = substream->runtime;
	struct audiopipe *pipe = runtime->private_data;
	u32 counter, step;

	/*
	 * IRQ handling runs concurrently. Do not share tracking of
	 * counter with it, which would race or require locking
	 */

	counter = le32_to_cpu(*pipe->dma_counter);  /* presumed atomic */

	step = counter - pipe->last_counter;  /* handles wrapping */
	pipe->last_counter = counter;

	/* counter doesn't neccessarily wrap on a multiple of
	 * buffer_size, so can't derive the position; must
	 * accumulate */

	pipe->position += step;
	pipe->position %= frames_to_bytes(runtime, runtime->buffer_size); /* wrap */

	return bytes_to_frames(runtime, pipe->position);
}

-- 
Mark
