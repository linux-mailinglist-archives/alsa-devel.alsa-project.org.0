Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF62C3E96
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 11:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92B3D1729;
	Wed, 25 Nov 2020 11:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92B3D1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606301996;
	bh=RAlg7DcQvYsdpNf0CvzrKNTNyUPVVRoy7QQrmQ0WDbk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mp6zZy9PXOrly5tfTw3YMWThhGPFCg/r4M1wwjNrY3AuGpnTsX/mUtLB0LlVDioZr
	 /4DqfxerWPAjETEy3rgpXf6Cd+DwUSCkmrPQlA7d//Gk5jPQ6IfjbXwBWEq9iOVji3
	 CK+cj/QzxNxORdanDPYH38b4XMA77mDDztNdHBaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE2AF80218;
	Wed, 25 Nov 2020 11:58:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F35F8019D; Wed, 25 Nov 2020 11:58:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A601BF800D2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 11:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A601BF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PQSjAu6l"
Received: from localhost (unknown [122.179.120.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AD0820678;
 Wed, 25 Nov 2020 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606301890;
 bh=RAlg7DcQvYsdpNf0CvzrKNTNyUPVVRoy7QQrmQ0WDbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQSjAu6lfdjKDTO0Ps5PqClhbMmmqKLqRUBVam7twGBSkTL8UqrdzxU2Hdx2Lqqgp
 4juWDuiuZ6hq2gDIMKGBrWEaH4VelgeZc/MtBit5MfuKkTWsY2eLLONlOur3YYtgeA
 qZ78HP5J87ZkLUxJ9QdI5DuxIeaJ5h7s2wY+pHFI=
Date: Wed, 25 Nov 2020 16:28:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Gyeongtaek Lee <gt82.lee@samsung.com>
Subject: Re: [PATCH v2] ALSA: compress: allow pause and resume during draining
Message-ID: <20201125105805.GF8403@vkoul-mobl>
References: <CGME20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6@epcas2p1.samsung.com>
 <000501d6ac04$85019b50$8f04d1f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000501d6ac04$85019b50$8f04d1f0$@samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 'Takashi Iwai' <tiwai@suse.de>, tiwai@suse.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 kimty@samsung.com, hmseo@samsung.com, s47.kang@samsung.com,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

On 27-10-20, 10:57, Gyeongtaek Lee wrote:
> With a stream with low bitrate, user can't pause or resume the stream
> near the end of the stream because current ALSA doesn't allow it.
> If the stream has very low bitrate enough to store whole stream into
> the buffer, user can't do anything except stop the stream and then
> restart it from the first because most of applications call draining
> after sending last frame to the kernel.
> If pause, resume are allowed during draining, user experience can be
> enhanced.
> To prevent malfunction in HW drivers which don't support pause
> during draining, pause during draining will only work if HW driver
> enable this feature explicitly by calling
> snd_compr_use_pause_in_draining().
> 
> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  include/sound/compress_driver.h | 17 +++++++++++++
>  sound/core/compress_offload.c   | 44 +++++++++++++++++++++++++++------
>  2 files changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
> index 70cbc5095e72..5a0d6737de5e 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -67,6 +67,7 @@ struct snd_compr_runtime {
>   * @metadata_set: metadata set flag, true when set
>   * @next_track: has userspace signal next track transition, true when set
>   * @partial_drain: undergoing partial_drain for stream, true when set
> + * @pause_in_draining: paused during draining state, true when set
>   * @private_data: pointer to DSP private data
>   * @dma_buffer: allocated buffer if any
>   */
> @@ -80,6 +81,7 @@ struct snd_compr_stream {
>  	bool metadata_set;
>  	bool next_track;
>  	bool partial_drain;
> +	bool pause_in_draining;
>  	void *private_data;
>  	struct snd_dma_buffer dma_buffer;
>  };
> @@ -142,6 +144,7 @@ struct snd_compr_ops {
>   * @direction: Playback or capture direction
>   * @lock: device lock
>   * @device: device id
> + * @use_pause_in_draining: allow pause in draining, true when set
>   */
>  struct snd_compr {
>  	const char *name;
> @@ -152,6 +155,7 @@ struct snd_compr {
>  	unsigned int direction;
>  	struct mutex lock;
>  	int device;
> +	bool use_pause_in_draining;
>  #ifdef CONFIG_SND_VERBOSE_PROCFS
>  	/* private: */
>  	char id[64];
> @@ -166,6 +170,19 @@ int snd_compress_deregister(struct snd_compr *device);
>  int snd_compress_new(struct snd_card *card, int device,
>  			int type, const char *id, struct snd_compr *compr);
>  
> +/**
> + * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
> + * @substream: compress substream to set
> + *
> + * Allow pause and resume in draining state.
> + * Only HW driver supports this transition can call this API.
> + */
> +static inline void snd_compr_use_pause_in_draining(
> +					struct snd_compr_stream *substream)
> +{
> +	substream->device->use_pause_in_draining = true;
> +}
> +
>  /* dsp driver callback apis
>   * For playback: driver should call snd_compress_fragment_elapsed() to let the
>   * framework know that a fragment has been consumed from the ring buffer
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 0e53f6f31916..a071485383ed 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -708,11 +708,24 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
>  {
>  	int retval;
>  
> -	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
> +	switch (stream->runtime->state) {
> +	case SNDRV_PCM_STATE_RUNNING:
> +		retval = stream->ops->trigger(stream,
> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);

this seems to fit single line with new 100char limit and makes it a
better read, can we please do that here and few places below .. The line
split is making it look bit ugly IMO

> +		if (!retval)
> +			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
> +		break;
> +	case SNDRV_PCM_STATE_DRAINING:
> +		if (!stream->device->use_pause_in_draining)
> +			return -EPERM;

I am expecting patches to tinycompress to handle pause while drain. Esp
this case..

> +		retval = stream->ops->trigger(stream,
> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
> +		if (!retval)
> +			stream->pause_in_draining = true;
> +		break;
> +	default:
>  		return -EPERM;
> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
> -	if (!retval)
> -		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
> +	}
>  	return retval;
>  }
>  
> @@ -720,11 +733,25 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
>  {
>  	int retval;
>  
> -	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
> +	switch (stream->runtime->state) {
> +	case SNDRV_PCM_STATE_PAUSED:
> +		retval = stream->ops->trigger(stream,
> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
> +		if (!retval)
> +			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
> +		break;
> +	case SNDRV_PCM_STATE_DRAINING:
> +		if (!stream->device->use_pause_in_draining ||
> +		    !stream->pause_in_draining)
> +			return -EPERM;

does this condition make sense for resume part..? We have already
checked for this while going into pause. I am not expecting drain state
to change while we are paused :)

> +		retval = stream->ops->trigger(stream,
> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
> +		if (!retval)
> +			stream->pause_in_draining = false;
> +		break;
> +	default:
>  		return -EPERM;
> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
> -	if (!retval)
> -		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
> +	}
>  	return retval;
>  }
>  
> @@ -767,6 +794,7 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
>  		/* clear flags and stop any drain wait */
>  		stream->partial_drain = false;
>  		stream->metadata_set = false;
> +		stream->pause_in_draining = false;
>  		snd_compr_drain_notify(stream);
>  		stream->runtime->total_bytes_available = 0;
>  		stream->runtime->total_bytes_transferred = 0;
> -- 
> 2.21.0
> 

-- 
~Vinod
