Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE96DD843
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 12:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82025F06;
	Tue, 11 Apr 2023 12:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82025F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681210116;
	bh=JqnbvCrUITYYJu5uAvOwc6PBU7Ti+dSfxTm46tf28B4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gxJUc9cZ/JwQ0HFGjni2XFQXE+KaEfo6oGqd7l8ELCF+SQ/ZJiSNSiMWLvOJLZSli
	 6A9dHdTkMQBYVvjtaue73PmuXMglecbua4uIjm/qpxF04ggcBT4IGi9CJGcZLiyium
	 XD0tkxz0NMsKlC/UQMJe5ZPwLgs2c68NqW0lhL7k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE2CF8025E;
	Tue, 11 Apr 2023 12:47:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A65FDF8032B; Tue, 11 Apr 2023 12:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F03E6F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 12:47:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4464011D4;
	Tue, 11 Apr 2023 12:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4464011D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681210050; bh=+6OvRYlnBhN9AtbssAmX3dUE2d/IdgGIGdR/g/iLXGw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Q8zSEGy0lo2lI9bh6L7kZ6ec96+v8RG6rY0LTv8CyQ9RqFoTWn//89pyDdBtqU0Si
	 iRf+QVQ8fvlQIw4KvbsyEDgWfuZNTP0GwY+fAHLLhG+PNGlosU/3XMzcvsWiRvAo43
	 ygPAgEFap0D3LXFqtu7gY82wDb8j+QVMw1tGwhrc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 11 Apr 2023 12:47:27 +0200 (CEST)
Message-ID: <8a3a2490-eb0f-7b76-3bc6-58ef5473d360@perex.cz>
Date: Tue, 11 Apr 2023 12:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QQ4BG2IDZNBXZYZCSV3Y4HSFAGX3VODU
X-Message-ID-Hash: QQ4BG2IDZNBXZYZCSV3Y4HSFAGX3VODU
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ4BG2IDZNBXZYZCSV3Y4HSFAGX3VODU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
> The auto-silencer supports two modes: "thresholded" to fill up "just
> enough", and "top-up" to fill up "as much as possible". The two modes
> used rather distinct code paths, which this patch unifies. The only
> remaining distinction is how much we actually want to fill.
> 
> This fixes a bug in thresholded mode, where we failed to use new_hw_ptr,
> resulting in under-fill.

I don't follow what you refer here. The old code uses 
snd_pcm_playback_hw_avail() thus new hw_ptr for the threshold mode, too.

> Top-up mode is now more well-behaved and much easier to understand in
> corner cases.
> 
> This also updates comments in the proximity of silencing-related data
> structures.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
>   .../kernel-api/writing-an-alsa-driver.rst     | 14 +--
>   include/sound/pcm.h                           | 14 +--
>   include/uapi/sound/asound.h                   |  9 +-
>   sound/core/pcm_lib.c                          | 86 ++++++++-----------
>   sound/core/pcm_local.h                        |  3 +-
>   sound/core/pcm_native.c                       |  6 +-
>   6 files changed, 62 insertions(+), 70 deletions(-)
> 
> diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> index a368529e8ed3..f2834a016473 100644
> --- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> +++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> @@ -1577,14 +1577,16 @@ are the contents of this file:
>             unsigned int period_step;
>             unsigned int sleep_min;		/* min ticks to sleep */
>             snd_pcm_uframes_t start_threshold;
> -          snd_pcm_uframes_t stop_threshold;
> -          snd_pcm_uframes_t silence_threshold; /* Silence filling happens when
> -                                                  noise is nearest than this */
> -          snd_pcm_uframes_t silence_size;	/* Silence filling size */
> +          // The following two thresholds alleviate playback buffer underruns; when
> +          // hw_avail drops below the threshold, the respective action is triggered:
> +          snd_pcm_uframes_t stop_threshold;	/* stop playback */
> +          snd_pcm_uframes_t silence_threshold;	/* pre-fill buffer with silence */
> +          snd_pcm_uframes_t silence_size;		/* msx size of silence pre-fill */
>             snd_pcm_uframes_t boundary;	/* pointers wrap point */
>     
> -          snd_pcm_uframes_t silenced_start;
> -          snd_pcm_uframes_t silenced_size;
> +          // internal data of auto-silencer
> +          snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
> +          snd_pcm_uframes_t silence_filled; /* size filled with silence */
>     
>             snd_pcm_sync_id_t sync;		/* hardware synchronization ID */
>     
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 27040b472a4f..f20400bb7032 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -378,18 +378,18 @@ struct snd_pcm_runtime {
>   	unsigned int rate_den;
>   	unsigned int no_period_wakeup: 1;
>   
> -	/* -- SW params -- */
> -	int tstamp_mode;		/* mmap timestamp is updated */
> +	/* -- SW params; see struct snd_pcm_sw_params for comments -- */
> +	int tstamp_mode;
>     	unsigned int period_step;
>   	snd_pcm_uframes_t start_threshold;
>   	snd_pcm_uframes_t stop_threshold;
> -	snd_pcm_uframes_t silence_threshold; /* Silence filling happens when
> -						noise is nearest than this */
> -	snd_pcm_uframes_t silence_size;	/* Silence filling size */
> -	snd_pcm_uframes_t boundary;	/* pointers wrap point */
> +	snd_pcm_uframes_t silence_threshold;
> +	snd_pcm_uframes_t silence_size;
> +	snd_pcm_uframes_t boundary;
>   
> +	// internal data of auto-silencer

I would use traditional C-style comment style here (to match other descriptions).

>   	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
> -	snd_pcm_uframes_t silence_filled; /* size filled with silence */
> +	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
>   
>   	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
>   
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index de6810e94abe..50aa1d98873f 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -429,9 +429,12 @@ struct snd_pcm_sw_params {
>   	snd_pcm_uframes_t avail_min;		/* min avail frames for wakeup */
>   	snd_pcm_uframes_t xfer_align;		/* obsolete: xfer size need to be a multiple */
>   	snd_pcm_uframes_t start_threshold;	/* min hw_avail frames for automatic start */
> -	snd_pcm_uframes_t stop_threshold;	/* min avail frames for automatic stop */
> -	snd_pcm_uframes_t silence_threshold;	/* min distance from noise for silence filling */
> -	snd_pcm_uframes_t silence_size;		/* silence block size */
> +	// The following two thresholds alleviate playback buffer underruns; when
> +	// hw_avail drops below the threshold, the respective action is triggered:

Traditional C-style comments.

> +	snd_pcm_uframes_t stop_threshold;	/* stop playback */
> +	snd_pcm_uframes_t silence_threshold;	/* pre-fill buffer with silence */
> +	snd_pcm_uframes_t silence_size;		/* max size of silence pre-fill; when >= boundary,
> +						 * fill played area with silence immediately */
>   	snd_pcm_uframes_t boundary;		/* pointers wrap point */
>   	unsigned int proto;			/* protocol version */
>   	unsigned int tstamp_type;		/* timestamp type (req. proto >= 2.0.12) */
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 02fd65993e7e..b074c5b926db 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -42,70 +42,58 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
>    *
>    * when runtime->silence_size >= runtime->boundary - fill processed area with silence immediately
>    */
> -void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_uframes_t new_hw_ptr)
> +void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
>   {
>   	struct snd_pcm_runtime *runtime = substream->runtime;
> +	snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
> +	snd_pcm_sframes_t hw_avail, added, noise_dist;
>   	snd_pcm_uframes_t frames, ofs, transfer;
>   	int err;
>   
> +	// This will "legitimately" turn negative on underrun, and will be mangled
> +	// into a huge number by the boundary crossing handling. The initial state
> +	// might also be not quite sane. The code below MUST account for these cases.
> +	hw_avail = appl_ptr - runtime->status->hw_ptr;
> +	if (hw_avail < 0)
> +		hw_avail += runtime->boundary;
> +	else if ((snd_pcm_uframes_t) hw_avail >= runtime->boundary)
> +		hw_avail -= runtime->boundary;

If hw_avail is above runtime->boundary then the initial condition is totaly 
bogus. I would use snd_BUG_ON() and direct return here.

> +
> +	added = appl_ptr - runtime->silence_start;
> +	if (added) {
> +		if (added < 0)
> +			added += runtime->boundary;
> +		if ((snd_pcm_uframes_t)added < runtime->silence_filled)
> +			runtime->silence_filled -= added;
> +		else
> +			runtime->silence_filled = 0;
> +		runtime->silence_start = appl_ptr;
> +	}
> +
> +	noise_dist = hw_avail + runtime->silence_filled;
>   	if (runtime->silence_size < runtime->boundary) {
> -		snd_pcm_sframes_t noise_dist, n;

...

> -		if (noise_dist >= (snd_pcm_sframes_t) runtime->silence_threshold)
> -			return;
>   		frames = runtime->silence_threshold - noise_dist;
> +		if ((snd_pcm_sframes_t) frames <= 0)
> +			return;

The retyping does not look good here. Could we move the if before frames 
assignment like:

   if (runtime->silence_threshold <= noise_dist)
     return;
   frames = runtime->silence_threshold - noise_dist;

>   		if (frames > runtime->silence_size)
>   			frames = runtime->silence_size;
>   	} else {
> -		if (new_hw_ptr == ULONG_MAX) {	/* initialization */

...

> -		frames = runtime->buffer_size - runtime->silence_filled;
> +		frames = runtime->buffer_size - noise_dist;
> +		if ((snd_pcm_sframes_t) frames <= 0)
> +			return;

Similar thing, move the check before the frames assignment.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

