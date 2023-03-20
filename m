Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5566C1174
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 13:05:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD7A1EE;
	Mon, 20 Mar 2023 13:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD7A1EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679313943;
	bh=GHNgQDtEZjCnGMuwNlBJyZHNNRb8rnJjRti1IoCuDR0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvalBlHo9qDrviT+FmppI2hXawL4+zE/ObtSHlZ/KMjCs2rnHjO8nvYv3aednQ+pZ
	 HlowddcHUtpeEbydQ57M834L+d7qt07KYVmS+xIRBNLQD0UNKEh8DVMFNJEZtYK9yf
	 8U9LZjpL0mFnJp8u3x3X8rBUhKYSulxnc7jeAOog=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6912AF80254;
	Mon, 20 Mar 2023 13:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEF81F8027B; Mon, 20 Mar 2023 13:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FDBBF800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 13:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FDBBF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metanate.com header.i=@metanate.com header.a=rsa-sha256
 header.s=stronger header.b=5uI2GYfM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=KRIkPkMhr0cR8OOqYZ2Hs0N+hv13ll5cx/2JsJmztHM=; b=5uI2G
	YfMg9tIIcuumRq2eV3bKxF3MFzTGJC0pwsHHBoimO/hZpKFdIvqlVP3sRtc8pUwSSosn6zx+CujG+
	1tMATNYceFatD3sClQiH7EbhQzEvpIXKPuW0KKIwtzPtvBQQs5/7NZVudyj+twI+/sn5H23NiEzj4
	clCFU3wTD9yzfcNvXJD8zLR+APzU4TNEwMWlciMpSlLxiXKHzTNCoZUnEHW6p88pEBqYVpCzo4GnR
	flhfXjNdk+0nR7p8sizm7TovTwYLgfIFa0nFaeWgSfkKSE5pXTzL992kW4Knn6CW3TyvLTHqKSYuy
	tdoDaUdY5RUIIveHZ98t74znWgQ2Q==;
Received: from [81.174.171.191] (helo=donbot)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <john@metanate.com>)
	id 1peEFT-0005I3-Mo;
	Mon, 20 Mar 2023 12:04:24 +0000
Date: Mon, 20 Mar 2023 12:04:22 +0000
From: John Keeping <john@metanate.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Fix recursive locking on XRUN
Message-ID: <ZBhLxq+CuzVcbcHa@donbot>
References: <20230317195128.3911155-1-john@metanate.com>
 <20230318002005.GA84781@workstation>
 <20230319032853.GA99783@workstation>
 <87sfe1mawg.wl-tiwai@suse.de>
 <878rftm790.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rftm790.wl-tiwai@suse.de>
X-Authenticated: YES
Message-ID-Hash: ZNJZCEOC4VOSECG7JN5AFQ7KCNNPOLID
X-Message-ID-Hash: ZNJZCEOC4VOSECG7JN5AFQ7KCNNPOLID
X-MailFrom: john@metanate.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNJZCEOC4VOSECG7JN5AFQ7KCNNPOLID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Mar 19, 2023 at 10:15:55AM +0100, Takashi Iwai wrote:
> On Sun, 19 Mar 2023 08:57:03 +0100,
> Takashi Iwai wrote:
> > 
> > On Sun, 19 Mar 2023 04:28:53 +0100,
> > Takashi Sakamoto wrote:
> > > 
> > > Hi,
> > > 
> > > On Sat, Mar 18, 2023 at 09:20:05AM +0900, Takashi Sakamoto wrote:
> > > > On Fri, Mar 17, 2023 at 07:51:27PM +0000, John Keeping wrote:
> > > > > snd_usb_queue_pending_output_urbs() may be called from
> > > > > snd_pcm_ops::ack() which means the PCM stream is locked.
> > > > > 
> > > > > For the normal case where the call back into the PCM core is via
> > > > > prepare_output_urb() the "_under_stream_lock" variant of
> > > > > snd_pcm_period_elapsed() is called, but when an error occurs and the
> > > > > stream is stopped as XRUN then snd_pcm_xrun() tries to recursively lock
> > > > > the stream which results in deadlock.
> > > > > 
> > > > > Follow the example of snd_pcm_period_elapsed() by adding
> > > > > snd_pcm_xrun_under_stream_lock() and use this when the PCM substream
> > > > > lock is already held.
> > > > > 
> > > > > Signed-off-by: John Keeping <john@metanate.com>
> > > > > ---
> > > > >  include/sound/pcm.h     |  1 +
> > > > >  sound/core/pcm_native.c | 28 ++++++++++++++++++++++++----
> > > > >  sound/usb/endpoint.c    | 18 +++++++++++-------
> > > > >  3 files changed, 36 insertions(+), 11 deletions(-)
> > > >  
> > > > The name of added kernel API implies me that you refer to existent
> > > > 'snd_pcm_period_elapsed_under_stream_lock()' which I added to Linux
> > > > v5.14.
> > > > 
> > > > In my opinion, unlike the version of period elapsed API, the version of
> > > > XRUN API seems not to be necessarily required to ALSA PCM core, since PCM
> > > > device drivers can implement .pointer callback in the part of PCM operation.
> > > > When the callback returns SNDRV_PCM_POS_XRUN, ALSA PCM application get
> > > > occurence of XRUN as a result of any operation relevant to hwptr movement
> > > > (e.g. SNDRV_PCM_IOCTL_HWSYNC).
> > > > 
> > > > Therefore I think it possible to fix the issue without the proposed
> > > > kernel API. I can assume some scenario:
> > > > 
> > > > 1. Failure at tasklet for URB completion
> > > > 
> > > > It is softIRQ context. The stream lock is not acquired. It doesn't
> > > > matter to call current XRUN API.
> > > > 
> > > > 2. Failure at PCM operation called by ALSA PCM application
> > > > 
> > > > It is process context. The stream lock is acquired before calling driver
> > > > code. When detecting any type of failure, driver code stores the state.
> > > > Then .pointer callback should return SNDRV_PCM_POS_XRUNrefering to
> > > > the state.
> > > 
> > > Although being inexperienced to hack driver for USB audio device class,
> > > I attempt to post the patch to fix the issue of recursive stream lock.
> > > I apologies in advance since the patch is not tested yet...
> > > 
> > > The 'in_xrun' member is newly added to 'struct snd_usb_substream'. When
> > > detecting any failure, false is assigned to the member. The assignment
> > > is expected to be done in both softIRQ context, and process context with
> > > stream lock, thus no need to take care of cocurrent access (e.g. by usage
> > > of WRITE_ONCE/READ_ONCE).
> > > 
> > > Typical ALSA PCM application periodically calls PCM operation which calls
> > > .pointer in driver code. As I described, returning SNDRV_PCM_POS_XRUN
> > > takes ALSA PCM core to handle XRUN state of PCM substream in the timing.
> > > 
> > > The negative point of the patch is the delay of XRUN notification to user
> > > space application. In the point, I think the new kernel API introduced by
> > > your patch has advantage.
> > > 
> > > The in_xrun member can be replaced with a kind of EP_STATE_
> > > enumerations; i.e. EP_STATE_XRUN. In the case, we need some care so that
> > > the state should be referred from pcm.c.
> > 
> > Thanks for the patch.  That would work, but the shortcoming side of
> > this implementation is that it misses stopping / reporting the error
> > immediately but waiting for the next pointer update.
> > 
> > It might be simpler if we perform the xrun handling in the caller
> > side, i.e. a change like below:
> > 
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -2155,6 +2155,8 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
> >  		ret = substream->ops->ack(substream);
> >  		if (ret < 0) {
> >  			runtime->control->appl_ptr = old_appl_ptr;
> > +			if (ret == -EPIPE)
> > +				__snd_pcm_xrun(substream);
> >  			return ret;
> >  		}
> >  	}
> > 
> > ... and let the caller returning -EPIPE for XRUN:
> 
> and that misses the XRUN in the case of non-stream-lock.
> A revised version is below.

Yes, it looks like this also solves the problem.  If you roll this into
a proper patch feel free to add:

Tested-by: John Keeping <john@metanate.com>

> 
> -- 8< --
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -2155,6 +2155,8 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
>  		ret = substream->ops->ack(substream);
>  		if (ret < 0) {
>  			runtime->control->appl_ptr = old_appl_ptr;
> +			if (ret == -EPIPE)
> +				__snd_pcm_xrun(substream);
>  			return ret;
>  		}
>  	}
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -455,8 +455,8 @@ static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
>   * This function is used both for implicit feedback endpoints and in low-
>   * latency playback mode.
>   */
> -void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
> -				       bool in_stream_lock)
> +int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
> +				      bool in_stream_lock)
>  {
>  	bool implicit_fb = snd_usb_endpoint_implicit_feedback_sink(ep);
>  
> @@ -480,7 +480,7 @@ void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
>  		spin_unlock_irqrestore(&ep->lock, flags);
>  
>  		if (ctx == NULL)
> -			return;
> +			break;
>  
>  		/* copy over the length information */
>  		if (implicit_fb) {
> @@ -495,11 +495,14 @@ void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
>  			break;
>  		if (err < 0) {
>  			/* push back to ready list again for -EAGAIN */
> -			if (err == -EAGAIN)
> +			if (err == -EAGAIN) {
>  				push_back_to_ready_list(ep, ctx);
> -			else
> +				break;
> +			}
> +
> +			if (!in_stream_lock)
>  				notify_xrun(ep);
> -			return;
> +			return -EPIPE;
>  		}
>  
>  		err = usb_submit_urb(ctx->urb, GFP_ATOMIC);
> @@ -507,13 +510,16 @@ void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
>  			usb_audio_err(ep->chip,
>  				      "Unable to submit urb #%d: %d at %s\n",
>  				      ctx->index, err, __func__);
> -			notify_xrun(ep);
> -			return;
> +			if (!in_stream_lock)
> +				notify_xrun(ep);
> +			return -EPIPE;
>  		}
>  
>  		set_bit(ctx->index, &ep->active_mask);
>  		atomic_inc(&ep->submitted_urbs);
>  	}
> +
> +	return 0;
>  }
>  
>  /*
> --- a/sound/usb/endpoint.h
> +++ b/sound/usb/endpoint.h
> @@ -52,7 +52,7 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
>  int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
>  				      struct snd_urb_ctx *ctx, int idx,
>  				      unsigned int avail);
> -void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
> -				       bool in_stream_lock);
> +int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
> +				      bool in_stream_lock);
>  
>  #endif /* __USBAUDIO_ENDPOINT_H */
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1639,7 +1639,7 @@ static int snd_usb_pcm_playback_ack(struct snd_pcm_substream *substream)
>  	 * outputs here
>  	 */
>  	if (!ep->active_mask)
> -		snd_usb_queue_pending_output_urbs(ep, true);
> +		return snd_usb_queue_pending_output_urbs(ep, true);
>  	return 0;
>  }
>  
