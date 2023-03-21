Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0596C28FA
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 05:04:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7C81F1;
	Tue, 21 Mar 2023 05:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7C81F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679371494;
	bh=dMQi12IVsPxWGKLYwvXme7CY0iHjdvuL3QSXZMhcWt0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b39YIZ/vzRV+wXmNuD8P1sEZJMTXVdcCSBK749E3qjsu6EnIy+THvPCnnyFcbwibH
	 LAKOYkg/eJatwMKKoRbnyx3it39mvrj9YuEYbV/gcRP3T3mAnxHi9cSxc3i4blZcPA
	 QU3NBxo75OdHMckJLHvmXShQzqXtnBVknuSsexjQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9478BF80105;
	Tue, 21 Mar 2023 05:04:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07D3F80254; Tue, 21 Mar 2023 05:03:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC053F800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 05:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC053F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=hGdANAQT;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AAldSW0I
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 98D603200AA7;
	Tue, 21 Mar 2023 00:03:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 21 Mar 2023 00:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1679371383; x=
	1679457783; bh=0g3T+cCNoR1oj1mdKsHNAaouTdAPcrjk5K+sJFWn1ok=; b=h
	GdANAQTtooWh8pj1fzqnihUity+kEbj1Ze7TKdyPeLrEtB30LMUkXs3sgNMG9nFM
	ycS/PjdsFvHbR26YfrVOipH0ya+VDhzm6hpLlyGSX1e2IQ4lQwnPCkhJFQzZybWv
	bVvENyYKdfXG8QXycl3Rx8oyORxGwyLz6PDwKf8c4kJU8qs/ZoQ4i2nejq85TBrJ
	jE7T8Cv3nWPBj+iWFtt7i0IhKD3S9s+teISKk9Q6Nz0ujhmU/TYSSoX24smmNJFu
	e4SDisrLM/dXSvfv/Xfuxm7tC3xKMSB5ZyXkv89AgCh3PKPZhsHFTw27xOXlUAsQ
	BwOBDjl5hB1NIqjPungWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679371383; x=1679457783; bh=0g3T+cCNoR1oj
	1mdKsHNAaouTdAPcrjk5K+sJFWn1ok=; b=AAldSW0INBsvz/iEZ+zrKtjOaN65F
	ASx5R0NjNfvprU98oUzpNpb3Uc0ckSiNiKNMoEbPZGhZcndODsWSz2nNHPCCfnB1
	T6RLk9Mko+ULGZ4zgq9hX+u4DNGb7sNSL2GmBcet32uKohJ7xs14CgTjw2a/+3wU
	QB7lT98oLVo25DE4VzU/B639vUVY6XR5WpDu+qhdRzb5zqqIsvqDp0LkIRTjSTMN
	wIBNsnioIksRgTJkNl+RZBY6hKtWHz7Dq39u7vNwCL4Ip6HDgjEVidzZhD7Yf2RX
	1UGAjOqpnE+zM1xSRkVPmQbocAzeoUwqqw+2DRFa4Sqfx1Z4SfzepoLXA==
X-ME-Sender: <xms:diwZZCfMpXUhGN6kr62nUOlzvEMfV7D_FVf0ilv6ZKTkS2YRe27paw>
    <xme:diwZZMMS7VrPw2d1zaKr_ZbND6F57uSXsZDIprXvlYhdVGA6imlBTHlYfbD3acIiK
    QQR3_-0nn-z1hI-W74>
X-ME-Received: 
 <xmr:diwZZDiH8BJQgGAZu8XLbt5WJOEKn7bHr2_y93lU-YbGRpgU9PXM7ptj2ECa8gVgIQoqcfEgEo2WN0txKepDSm0IHRQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdefledgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
    ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:diwZZP9OaaafhR8izipDHsIjni4nnGqlXz91cqYw_DIuF6ih8dB5tw>
    <xmx:diwZZOuAJ6kYagoJ7qlGjMv8iZZfkzLFExnKR5HHkrTqRVrxS4Ph1Q>
    <xmx:diwZZGGiL6fQGMSUDdH4SEU984-YfjA3lezsFXh3UpUtC55CjIYn4w>
    <xmx:dywZZDWb1cLFIDxW0nYebmr7qLDe6xEqXhY_0IinPmi7YRRPoaDXQg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 00:03:01 -0400 (EDT)
Date: Tue, 21 Mar 2023 13:02:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Fix recursive locking at XRUN during
 syncing
Message-ID: <20230321040258.GA164337@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	John Keeping <john@metanate.com>
References: <20230320142838.494-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320142838.494-1-tiwai@suse.de>
Message-ID-Hash: 6SSOYBSXCPE5ISG6ZN3ICPMWETXFRWHI
X-Message-ID-Hash: 6SSOYBSXCPE5ISG6ZN3ICPMWETXFRWHI
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, John Keeping <john@metanate.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SSOYBSXCPE5ISG6ZN3ICPMWETXFRWHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, Mar 20, 2023 at 03:28:38PM +0100, Takashi Iwai wrote:
> The recent support of low latency playback in USB-audio driver made
> the snd_usb_queue_pending_output_urbs() function to be called via PCM
> ack ops.  In the new code path, the function is performed alread in

's/alread/already/' or slang.

> the PCM stream lock.  The problem is that, when an XRUN is detected,
> the  function calls snd_pcm_xrun() to notify, but snd_pcm_xrun() is

's/the  function/the function/'

> supposed to be called only outside the stream lock.  As a result, it
> leads to a deadlock of PCM stream locking.
> 
> For avoiding such a recursive locking, this patch adds an additional
> check to the code paths in PCM core that call the ack callback; now it
> checks the error code from the callback, and if it's -EPIPE, the XRUN
> is handled in the PCM core side gracefully.  Along with it, the
> USB-audio driver code is changed to follow that, i.e. -EPIPE is
> returned instead of the explicit snd_pcm_xrun() call when the function
> is performed already in the stream lock.
 
Practically, the implementation of 'pcm_hw' in alsa-lib never evaluates
the return value (see 'snd_pcm_hw_mmap_commit()' and the others). I guess
that it is inconvenient for the low-latency mode of USB Audio device class
driver for the case of failure.

My additional concern is PCM indirect layer, since typically the layer
is used by drivers with SNDRV_PCM_INFO_SYNC_APPLPTR. But as long as I
read, the change does not matter to them.

> Fixes: d5f871f89e21 ("ALSA: usb-audio: Improved lowlatency playback support")
> Reported-and-tested-by: John Keeping <john@metanate.com>
> Link: https://lore.kernel.org/r/20230317195128.3911155-1-john@metanate.com
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/pcm_lib.c |  2 ++
>  sound/usb/endpoint.c | 22 ++++++++++++++--------
>  sound/usb/endpoint.h |  4 ++--
>  sound/usb/pcm.c      |  2 +-
>  4 files changed, 19 insertions(+), 11 deletions(-)
 
Anyway, John Keeping reports the change works well to solve the issue. I
have no objection to it.

Reviewed-by; Takashi Sakamoto <o-takashi@sakamocchi.jp>

It is also convenient to IEC 61883-1/6 packet streaming engine for audio
and music unit in IEEE 1394 bus. I will post patches enough later for it.

> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 8b6aeb8a78f7..02fd65993e7e 100644
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
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 419302e2057e..647fa054d8b1 100644
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
> diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
> index 924f4351588c..c09f68ce08b1 100644
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
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index d959da7a1afb..eec5232f9fb2 100644
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
> -- 
> 2.35.3


Thanks

Takashi Sakamoto
