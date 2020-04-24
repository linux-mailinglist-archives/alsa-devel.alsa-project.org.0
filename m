Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575161B70F5
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 11:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A1616C2;
	Fri, 24 Apr 2020 11:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A1616C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587720722;
	bh=A9fOLUh1XSzfMYBhpMPel7JQbD0JV6mCWHnkJzkpXvE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdIS15SyVkPDhHgyvu69/jNPXqwuVPrPGlnWtQ96dMg1FcMVgExli/pXj3waX5jJc
	 FWMkwOzibmbebOpLfDxny/tp3Mq6A/ptyVeFfow7iCWe+nOA0fXG75yLj630NwR7wF
	 7lRsvoyVR1IQxjNTiZjPGrWg+87ihDmUFzf9W4XE=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5261F80117;
	Fri, 24 Apr 2020 11:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E718DF80142; Fri, 24 Apr 2020 11:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFE9F80117
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFE9F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="LeaVYslt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=+uD+oaVYBQecOgujphxMIfmFbVVymF4SlPKPlRF1cMk=; b=LeaVYslts4hX/oe8+KjKOLRj3/
 1iWo5atCVATGKGLZF3ClpgNDHATQv4vtkzhXqLabYEp8FZcONZG8htSbK3Gw9DfvpoGtcauOPvVfx
 4isClO3ra/pMB/ttjhCHYMS5lMKEN2yiPN2dj3FLB22xa6CWnvowYMie+DqcgAZakA5I=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRueg-00023V-Da; Fri, 24 Apr 2020 12:29:54 +0300
Message-ID: <a876d867496c2c58866a626430dd2f174f16c107.camel@tsoy.me>
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Improve frames size computation
From: Alexander Tsoy <alexander@tsoy.me>
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
Date: Fri, 24 Apr 2020 12:29:53 +0300
In-Reply-To: <11dca14b-39a7-635a-a62f-ea10f21aa697@ivitera.com>
References: <20200424022449.14972-1-alexander@tsoy.me>
 <11dca14b-39a7-635a-a62f-ea10f21aa697@ivitera.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Gregor Pintar <grpintar@gmail.com>,
 Roope Salmi <rpsalmi@gmail.com>
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

В Пт, 24/04/2020 в 11:19 +0200, Pavel Hofman пишет:
> Dne 24. 04. 20 v 4:24 Alexander Tsoy napsal(a):
> > For computation of the the next frame size current value of fs/fps
> > and
> > accumulated fractional parts of fs/fps are used, where values are
> > stored
> > in Q16.16 format. This is quite natural for computing frame size
> > for
> > asynchronous endpoints driven by explicit feedback, since in this
> > case
> > fs/fps is a value provided by the feedback endpoint and it's
> > already in
> > the Q format. If an error is accumulated over time, the device can
> > adjust fs/fps value to prevent buffer overruns/underruns.
> > 
> > But for synchronous endpoints the accuracy provided by these
> > computations
> > is not enough. Due to accumulated error the driver periodically
> > produces
> > frames with incorrect size (+/- 1 audio sample).
> > 
> > This patch fixes this issue by implementing a different algorithm
> > for
> > frame size computation. It is based on accumulating of the
> > remainders
> > from division fs/fps and it doesn't accumulate errors over time.
> > This
> > new method is enabled for synchronous and adaptive playback
> > endpoints.
> > 
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> >  sound/usb/card.h     |  4 ++++
> >  sound/usb/endpoint.c | 43 ++++++++++++++++++++++++++++++++++++++
> > -----
> >  sound/usb/endpoint.h |  1 +
> >  sound/usb/pcm.c      |  2 ++
> >  4 files changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/sound/usb/card.h b/sound/usb/card.h
> > index 395403a2d33f..820e564656ed 100644
> > --- a/sound/usb/card.h
> > +++ b/sound/usb/card.h
> > @@ -84,6 +84,10 @@ struct snd_usb_endpoint {
> >  	dma_addr_t sync_dma;		/* DMA address of syncbuf
> > */
> >  
> >  	unsigned int pipe;		/* the data i/o pipe */
> > +	unsigned int framesize[2];	/* small/large frame sizes in
> > samples */
> > +	unsigned int sample_rem;	/* remainder from division fs/fps
> > */
> > +	unsigned int sample_accum;	/* sample accumulator */
> > +	unsigned int fps;		/* frames per second */
> >  	unsigned int freqn;		/* nominal sampling rate in fs/fps
> > in Q16.16 format */
> >  	unsigned int freqm;		/* momentary sampling rate in
> > fs/fps in Q16.16 format */
> >  	int	   freqshift;		/* how much to shift the feedback
> > value to get Q16.16 */
> > diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> > index 4a9a2f6ef5a4..d8dc7cb56d43 100644
> > --- a/sound/usb/endpoint.c
> > +++ b/sound/usb/endpoint.c
> > @@ -124,12 +124,12 @@ int
> > snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint
> > *ep)
> >  
> >  /*
> >   * For streaming based on information derived from sync endpoints,
> > - * prepare_outbound_urb_sizes() will call next_packet_size() to
> > + * prepare_outbound_urb_sizes() will call slave_next_packet_size()
> > to
> >   * determine the number of samples to be sent in the next packet.
> 
> Please should not this read
> 
> "For streaming based on information derived from async endpoints,"
> 
> or
> 
> "For streaming based on information derived from sync-master
> endpoints,"?

"sync endpoints" actually means "feedback endpoints" here. This is the
terminology used by the driver. So it is not the type of
synchronization of the endpoint for which this function is being
called. :)

Probably comment I made for snd_usb_endpoint_next_packet_size() is
slightly inaccurate, because this function will be also used for
asynchronous endpoints in the case feedback endpoint is not configured
for some reason.

> 
> Because the next method says:
> 
> For adaptive and synchronous endpoints,
> prepare_outbound_urb_sizes()...
> 
> Thanks for the great patch,
> 
> Pavel.

