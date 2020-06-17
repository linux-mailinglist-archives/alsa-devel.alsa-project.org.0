Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846761FCB6D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 12:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8361679;
	Wed, 17 Jun 2020 12:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8361679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592391177;
	bh=8W+nwAklwPYl8KwM+rv3ZZxKOHQKiSkyO4Max6Ozdlw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILXerH0t/qL8oS2+gYyfZVTDANdExUfM1Ey4nDVWNHUUZGtw6bpFW5Jfjr+kOPmWp
	 phx/MbjQ9f4v7NjVDol8P47iX3bzZa+xM1Hyomib8DV9bdZFTNss6c0kpoouU/Nyle
	 rB6BAHG6f4Pyc7cXRXOUxS+n16iOppo+ofpt0Kok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331C5F80116;
	Wed, 17 Jun 2020 12:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19672F80171; Wed, 17 Jun 2020 12:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_32,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E044F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 12:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E044F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="jB6aORBe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRrgJvYsZBJQ0MJmRIHngZEuAo0oxfLqnz0vrc/8q14=; b=jB6aORBenATaPP8NZK1f08gY4u
 0UWFRTWXq8hGZMdC//3SI2iNsraCp56IWEwJLaJI9X/A0QMBXTNaLnUd9B+DXJXUy9i0Db5ZEjtpy
 mKncrSi6cuOl+DRLVo2M6b9hTKePsfxS5wb3SF5g7S4E3bgY89Z0mJSCC7ykCaTB4o63p6NJFHteR
 8UVz3FVByVdEZTmMh5+pIfe9We4Ko3+nnOXfVQIxUuTWEl7S/uhoRNwyMt4jFbh9dMyQtWdoObJ5w
 2J94gHKGxKjAGRgRUkTHdRjyh4Z72nKKmxbC/q4pPo7dvL29hnY5xAzHWC+LW3PW5VGmIgdtDHP5/
 2ZdTkZbQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlVer-000P3B-Ut; Wed, 17 Jun 2020 11:51:05 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jlVer-0005N4-Ll; Wed, 17 Jun 2020 11:51:05 +0100
Date: Wed, 17 Jun 2020 11:51:05 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <s5hlfkn14cr.wl-tiwai@suse.de>
Message-ID: <2006171134130.2561@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <s5hsgev16ck.wl-tiwai@suse.de>
 <2006161451110.1865@stax.localdomain> <s5hlfkn14cr.wl-tiwai@suse.de>
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

On Tue, 16 Jun 2020, Takashi Iwai wrote:

> On Tue, 16 Jun 2020 16:01:11 +0200,
> Mark Hills wrote:
> > 
> > On Tue, 16 Jun 2020, Takashi Iwai wrote:
> > 
> > > On Tue, 16 Jun 2020 15:17:43 +0200,
> > > Mark Hills wrote:
> > > > 
> > > > +/* Update software pointer to match the hardware
> > > > + *
> > > > + * Return: 1 if we crossed a period threshold, otherwise 0
> > > > + */
> > > > +static int snd_echo_poll_substream(struct snd_pcm_substream *substream)
> > > 
> > > This is a bit confusing name.  One would imagine from the function
> > > name as if it were about the handling of poll() syscall.
> > 
> > Poll felt intuitive to me; maybe from FreeBSD where network drivers can 
> > poll on a timer instead of interrupts. I do know about poll(), though.
> > 
> > How about snd_echo_update_substream()?
> 
> Yes, it's more self-explanatory.  Or even better
> snd_echo_update_substream_position() :)

Out of interest, these are static but the names are globally qualified. I 
see this elsewhere, so I followed, but is this agreed convention?

Because it could be update_substream_position() :)

> > > > +{
> > > > +	struct snd_pcm_runtime *runtime = substream->runtime;
> > > > +	struct audiopipe *pipe = runtime->private_data;
> > > > +	unsigned counter, step, period, last_period;
> > > > +	size_t buffer_bytes;
> > > > +
> > > > +	if (pipe->state != PIPE_STATE_STARTED)
> > > > +		return 0;
> > > > +
> > > > +	counter = le32_to_cpu(*pipe->dma_counter);
> > > > +
> > > > +	period = bytes_to_frames(runtime, counter)
> > > > +		/ runtime->period_size;
> > > > +	last_period = bytes_to_frames(runtime, pipe->last_counter)
> > > > +		/ runtime->period_size;
> > > > +
> > > > +	if (period == last_period)
> > > > +		return 0;  /* don't do any work yet */
> > > > +
> > > > +	step = counter - pipe->last_counter;
> > > > +	pipe->last_counter = counter;
> > > 
> > > Dose this calculation consider the overlap of 32bit integer of the
> > > counter?  (I'm not sure whether the old code did it right, though.)
> > 
> > I believe it does, since (small - big) as unsigned gives small value. And 
> > period is checked only for equality (not greater than). I'll add a comment 
> > as such. I have run it with long streams.
> 
> The problem is that the last_period calculation can be wrong if the
> period size isn't aligned.  e.g. when period size is 44100, around the
> boundary position, it gets a different last_period value although it
> still in the same period.

Agreed, yes.

In which case I think it's clearer to not infer anything about periods 
from the current counter or position, and (effectively) accumulate it.

Would you please make suggestions on the code below?

Because it allowed for further simplification whilst fixing the bugs.

In the end, modulo became clearer than loops and I think it has the bonus 
of being less risky should the counter make a large step.

I'll run for a longer test today.

---

/* Update software pointer to match the hardware
 *
 * \pre chip->lock is held
 */
static void snd_echo_update_substream_position(struct echoaudio *chip,
					struct snd_pcm_substream *substream)
{
	struct snd_pcm_runtime *runtime = substream->runtime;
	struct audiopipe *pipe = runtime->private_data;
	u32 counter, step;
	size_t period_bytes;

	if (pipe->state != PIPE_STATE_STARTED)
		return;

	period_bytes = frames_to_bytes(runtime, runtime->period_size);

	counter = le32_to_cpu(*pipe->dma_counter);

	step = counter - pipe->last_counter;  /* handles wrapping of counter */
	step -= step % period_bytes;  /* acknowledge whole periods only */

	if (step == 0)
		return;  /* haven't advanced a whole period yet */

	pipe->last_counter += step;  /* does not always wrap on a period */
	pipe->position += step;

	/* wraparound the buffer */
	pipe->position %= frames_to_bytes(runtime, runtime->buffer_size);

	/* notify only once, even if multiple periods elapsed */
	spin_unlock(&chip->lock);
	snd_pcm_period_elapsed(substream);
	spin_lock(&chip->lock);
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
		if (substream)
			snd_echo_update_substream_position(chip, substream);
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

	return bytes_to_frames(runtime, pipe->position);
}

-- 
Mark
