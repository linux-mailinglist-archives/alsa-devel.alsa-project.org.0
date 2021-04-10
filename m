Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A502A35AD40
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 14:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EED01658;
	Sat, 10 Apr 2021 14:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EED01658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618057541;
	bh=4qzEDEnAcwot3RW+EbtQVIxxBRYMyz3jNWZIJnrYEfg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coxZilG9gwoRnSBLf1j/fEM2paRPdwIEXUGgEBnn+1ln3MwQTgpthY0cfBflkfaQG
	 dC8Tx8PdO/ZTnmPCQUOUtc3j/MxoQzGZK2gGN/PP4PB/VEHh1VjKxUTaDql7DPBk7/
	 VAxxUaxujcZL50vQaH1s5Vwl8kIdO980roxNcWhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DE3F80246;
	Sat, 10 Apr 2021 14:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3F20F8020B; Sat, 10 Apr 2021 14:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA05F800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 14:24:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9ED5DA003F;
 Sat, 10 Apr 2021 14:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9ED5DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618057443; bh=GAiP52wflaxC8IHGl6j+SKM92APVihEWMoBQXfwYOvE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=336Ndp3rBvdS980H1NNNWodXatyn/iiYpzEnbJe6Tv3fBP+pxvipVbX3jE0T584FB
 +yivvP0h8WNzQp9FsstQaLKV7dFuNU42jo3zD+n/A1F8irCsw2oWRJqVn1Jgw8rgQo
 v7iNXscnnhxxeTU4D08plTDBQ6nsH0emu8l/sU9Q=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 10 Apr 2021 14:23:57 +0200 (CEST)
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210410120229.1172054-1-coding@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <df8cc177-f91d-28b1-c8df-1162dc136657@perex.cz>
Date: Sat, 10 Apr 2021 14:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210410120229.1172054-1-coding@diwic.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 10. 04. 21 v 14:02 David Henningsson napsal(a):
> This commit adds a new framing mode that frames all MIDI data into
> 32-byte frames with a timestamp.
> 
> The main benefit is that we can get accurate timestamps even if
> userspace wakeup and processing is not immediate.
> 
> Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
> compared to the in-kernel seq implementation which has a max jitter
> of 5 ms during idle and much worse when running scheduler stress tests
> in parallel.
> 
> Signed-off-by: David Henningsson <coding@diwic.se>
> ---
>  include/sound/rawmidi.h     |  2 ++
>  include/uapi/sound/asound.h | 26 ++++++++++++++--
>  sound/core/rawmidi.c        | 60 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 84 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
> index 334842daa904..b0057a193c31 100644
> --- a/include/sound/rawmidi.h
> +++ b/include/sound/rawmidi.h
> @@ -81,6 +81,8 @@ struct snd_rawmidi_substream {
>  	bool opened;			/* open flag */
>  	bool append;			/* append flag (merge more streams) */
>  	bool active_sensing;		/* send active sensing when close */
> +	u8 framing;			/* whether to frame input data */
> +	clockid_t clock_type;		/* clock source to use for input framing */
>  	int use_count;			/* use counter (for output) */
>  	size_t bytes;
>  	struct snd_rawmidi *rmidi;
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 535a7229e1d9..af8e60740218 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -710,7 +710,7 @@ enum {
>   *  Raw MIDI section - /dev/snd/midi??
>   */
>  
> -#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
> +#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
>  
>  enum {
>  	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
> @@ -736,12 +736,34 @@ struct snd_rawmidi_info {
>  	unsigned char reserved[64];	/* reserved for future use */
>  };
>  
> +enum {
> +	SNDRV_RAWMIDI_FRAMING_NONE = 0,
> +	SNDRV_RAWMIDI_FRAMING_TSTAMP,
> +	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP,
> +};
> +
> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
> +
> +struct snd_rawmidi_framing_tstamp {
> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
> +	 * types here. Applications are expected to skip unknown frame types.
> +	 */
> +	unsigned char frame_type;
> +	unsigned char length; /* number of valid bytes in data field */
> +	unsigned char reserved[2];
> +	unsigned int tv_nsec;		/* nanoseconds */
> +	unsigned long long tv_sec;	/* seconds */
> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
> +};
> +
>  struct snd_rawmidi_params {
>  	int stream;
>  	size_t buffer_size;		/* queue size in bytes */
>  	size_t avail_min;		/* minimum avail bytes for wakeup */
>  	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
> -	unsigned char reserved[16];	/* reserved for future use */
> +	unsigned char framing;		/* For input data only, frame incoming data */

We can move this flag to above 32-bit word (no_active_sensing). I'm not sure,
if we need 8 bits for this. It's first change after 20 years. Another flag may
obsolete this one.

> +	unsigned char clock_type;	/* Type of clock to use for framing, same as clockid_t */
> +	unsigned char reserved[14];	/* reserved for future use */
>  };
>  
>  #ifndef __KERNEL__
> diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> index aca00af93afe..d4b6b9b5c0e4 100644
> --- a/sound/core/rawmidi.c
> +++ b/sound/core/rawmidi.c
> @@ -683,6 +683,8 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
>  
>  	if (params->buffer_size < 32 || params->buffer_size > 1024L * 1024L)
>  		return -EINVAL;
> +	if (params->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP && params->buffer_size & 0x1f)

I would use '(a & b) != 0' here. It's more readable.

> +		return -EINVAL;
>  	if (params->avail_min < 1 || params->avail_min > params->buffer_size)
>  		return -EINVAL;
>  	if (params->buffer_size != runtime->buffer_size) {
> @@ -720,7 +722,16 @@ EXPORT_SYMBOL(snd_rawmidi_output_params);
>  int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
>  			     struct snd_rawmidi_params *params)
>  {
> +	if (params->framing) {
> +		if (params->framing > SNDRV_RAWMIDI_FRAMING_LAST)
> +			return -EINVAL;
> +		/* framing requires a valid clock type */
> +		if (params->clock_type != CLOCK_MONOTONIC_RAW && params->clock_type != CLOCK_MONOTONIC)
> +			return -EINVAL;

The CLOCK_REALTIME may be supported, too. For example, the input subsystem
supports those three timestamps and we support this in the PCM interface, too.

> +	}
>  	snd_rawmidi_drain_input(substream);
> +	substream->framing = params->framing;
> +	substream->clock_type = params->clock_type;
>  	return resize_runtime_buffer(substream->runtime, params, true);
>  }
>  EXPORT_SYMBOL(snd_rawmidi_input_params);
> @@ -963,6 +974,42 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
>  	return -ENOIOCTLCMD;
>  }
>  
> +static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
> +			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
> +{
> +	struct snd_rawmidi_runtime *runtime = substream->runtime;
> +	struct snd_rawmidi_framing_tstamp *dest_ptr;
> +	struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
> +
> +	int dest_frames = 0;
> +	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
> +
> +	if (snd_BUG_ON(runtime->hw_ptr & 0x1f || runtime->buffer_size & 0x1f || frame_size != 0x20))
> +		return -EINVAL;
> +	while (src_count > 0) {
> +		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
> +			runtime->xruns += src_count;
> +			return dest_frames * frame_size;
> +		}
> +		if (src_count >= SND_RAWMIDI_FRAMING_DATA_LENGTH)
> +			frame.length = SND_RAWMIDI_FRAMING_DATA_LENGTH;
> +		else {
> +			frame.length = src_count;
> +			memset(frame.data, 0, SND_RAWMIDI_FRAMING_DATA_LENGTH);

We know the length here, so we can skip the zeroing the copied bytes with
memcpy().

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
