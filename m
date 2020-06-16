Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF31FB350
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 16:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB47167C;
	Tue, 16 Jun 2020 16:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB47167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592316178;
	bh=FVwkofudanH+Bm3/CfIOsDhG5AF6PbgfBjDt6X+sH2E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyOc2PcsLwtoU73wKr0P4sGTFtiwhc9ux5cRrJvytGX4uh/grNxQq9D01PTrGLgd5
	 nIL6GghS0U8sOY6xCML4AuRPc+6k+nTYXa/e3WPhpPwWDcumcDGCIllzPSvQZdhG59
	 V44DUJuxKwWL+4sF/UFGyFijg/gZvH6QxtBPnhRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6E7F80232;
	Tue, 16 Jun 2020 16:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 086F6F8022B; Tue, 16 Jun 2020 16:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F0F2F80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 16:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F0F2F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="DXohuQul"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KkvhX8DkJQqoOET62+MFkwWYpAGrw+jrL/zWEZeFd8=; b=DXohuQulSj7za3BqZpgIv+nv8Q
 ATp0NV3VcsGscOikSMEupKnAgRuyhgKYdl0JKxiKt3NpiIUVQQT8JT9mpqUYmu/LGkXjC9oJBbvLC
 jobZ6PhU6c7LYjCuixm4jObRFR/nls71teZ5q257DmOhVReay1ewuAtkKHGeM7vuRoiscn2XygJn1
 XPs7m2/jOjOBcmWHrxv0SRQhdDobx6htQD8JCMhR6tjMJTCc5BxuwjssjF8sF1IC+Gcf8icvfQst3
 y0zM3nTr7YrwwaJwZCb01mlLQq94EhTH7s+kkSiclMnLOdpYaPV1IOHdmzl0RSvxjYB3KmAAXI/qX
 vx2E4gfA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlC9H-000Me9-Kr; Tue, 16 Jun 2020 15:01:11 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jlC9H-0004qk-9j; Tue, 16 Jun 2020 15:01:11 +0100
Date: Tue, 16 Jun 2020 15:01:11 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <s5hsgev16ck.wl-tiwai@suse.de>
Message-ID: <2006161451110.1865@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <s5hsgev16ck.wl-tiwai@suse.de>
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

> On Tue, 16 Jun 2020 15:17:43 +0200,
> Mark Hills wrote:
> > 
> > +/* Update software pointer to match the hardware
> > + *
> > + * Return: 1 if we crossed a period threshold, otherwise 0
> > + */
> > +static int snd_echo_poll_substream(struct snd_pcm_substream *substream)
> 
> This is a bit confusing name.  One would imagine from the function
> name as if it were about the handling of poll() syscall.

Poll felt intuitive to me; maybe from FreeBSD where network drivers can 
poll on a timer instead of interrupts. I do know about poll(), though.

How about snd_echo_update_substream()?
 
> > +{
> > +	struct snd_pcm_runtime *runtime = substream->runtime;
> > +	struct audiopipe *pipe = runtime->private_data;
> > +	unsigned counter, step, period, last_period;
> > +	size_t buffer_bytes;
> > +
> > +	if (pipe->state != PIPE_STATE_STARTED)
> > +		return 0;
> > +
> > +	counter = le32_to_cpu(*pipe->dma_counter);
> > +
> > +	period = bytes_to_frames(runtime, counter)
> > +		/ runtime->period_size;
> > +	last_period = bytes_to_frames(runtime, pipe->last_counter)
> > +		/ runtime->period_size;
> > +
> > +	if (period == last_period)
> > +		return 0;  /* don't do any work yet */
> > +
> > +	step = counter - pipe->last_counter;
> > +	pipe->last_counter = counter;
> 
> Dose this calculation consider the overlap of 32bit integer of the
> counter?  (I'm not sure whether the old code did it right, though.)

I believe it does, since (small - big) as unsigned gives small value. And 
period is checked only for equality (not greater than). I'll add a comment 
as such. I have run it with long streams.

Would it be clearer, or should it be that buffer_bytes to "unsigned"? 
Though size_t conveys that it is a byte length, in memory.

In general I haven't deviated from existing code without need to, so I 
inherited these types.

The same goes for the pattern of calculating "step" with unsigned values, 
and then using a loop to wrap it to the buffer:

    while (pipe->position >= buffer_bytes)
            pipe->position -= buffer_bytes;

I've assumed this was a recognised pattern in ALSA code, preferred over 
modulus.

-- 
Mark
