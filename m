Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F74F302855
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 18:01:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3680517FC;
	Mon, 25 Jan 2021 18:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3680517FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611594057;
	bh=mb6GPUEFHahH8rdKYxX0XQHGmgjCcg/fG/Z5t67ulbw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSC8ShlNwVITN0UEaBB3e1RYjTZH/acOpKhACD4lKAu9k/mJ6yudaaDt9XN+KvOsU
	 H/kmWw7Q3RTsThD5DRNC1ltylIw4JBSkSgNZG120Xgdtv47mtMbIEYqULLcEeKGEi4
	 wFF4enzFFcfalco1Q/YPrObAZzIeXnHxjv9blKBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E66DF80260;
	Mon, 25 Jan 2021 17:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D3CF80259; Mon, 25 Jan 2021 17:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB214F80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 17:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB214F80130
IronPort-SDR: OV3wGz+z4RHW0G4k/gZiSDiCisURj2Yqd0XoCrqK/+f9Lq6TcxKvJc/GePYZ+R5vm1sRIXYTzV
 XhtXv6slZS2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="177189873"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="177189873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 08:59:12 -0800
IronPort-SDR: pONRZTpEtEfmhFaQ89E5gnGXV7ibicYbzBDpUDLKNSeVgNRHw/kMcGNiBhSE/45osSvWCDAIph
 cJIqxzqJWvFQ==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="387460794"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.45.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 08:59:09 -0800
Date: Mon, 25 Jan 2021 17:59:06 +0100 (CET)
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH v2 6/9] ALSA: virtio: PCM substream operators
In-Reply-To: <20210124165408.1122868-7-anton.yakovlev@opensynergy.com>
Message-ID: <7b4fa4c1-4af1-47b5-d2e6-bb2f81e75488@intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-7-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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


On Sun, 24 Jan 2021, Anton Yakovlev wrote:

> Introduce the operators required for the operation of substreams.
>
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> ---
> sound/virtio/Makefile         |   3 +-
> sound/virtio/virtio_pcm.c     |   5 +-
> sound/virtio/virtio_pcm.h     |   2 +
> sound/virtio/virtio_pcm_ops.c | 513 ++++++++++++++++++++++++++++++++++
> 4 files changed, 521 insertions(+), 2 deletions(-)
> create mode 100644 sound/virtio/virtio_pcm_ops.c

[snip]

> diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
> new file mode 100644
> index 000000000000..19882777fcd6
> --- /dev/null
> +++ b/sound/virtio/virtio_pcm_ops.c
> @@ -0,0 +1,513 @@

[snip]

> +/**
> + * virtsnd_pcm_release() - Release the PCM substream on the device side.
> + * @substream: VirtIO substream.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static inline bool virtsnd_pcm_released(struct virtio_pcm_substream *substream)
> +{
> +	/*
> +	 * The spec states that upon receipt of the RELEASE command "the device
> +	 * MUST complete all pending I/O messages for the specified stream ID".
> +	 * Thus, we consider the absence of I/O messages in the queue as an
> +	 * indication that the substream has been released.
> +	 */
> +	return atomic_read(&substream->msg_count) == 0;

Also here having it atomic doesn't really seem to help. This just means, 
that at some point of time it was == 0.

> +}
> +
> +static int virtsnd_pcm_release(struct virtio_pcm_substream *substream)

kernel-doc missing

> +{
> +	struct virtio_snd *snd = substream->snd;
> +	struct virtio_snd_msg *msg;
> +	unsigned int js = msecs_to_jiffies(msg_timeout_ms);
> +	int rc;
> +
> +	msg = virtsnd_pcm_ctl_msg_alloc(substream, VIRTIO_SND_R_PCM_RELEASE,
> +					GFP_KERNEL);
> +	if (IS_ERR(msg))
> +		return PTR_ERR(msg);
> +
> +	rc = virtsnd_ctl_msg_send_sync(snd, msg);
> +	if (rc)
> +		return rc;
> +
> +	return wait_event_interruptible_timeout(substream->msg_empty,
> +						virtsnd_pcm_released(substream),
> +						js);
> +}
> +
> +/**
> + * virtsnd_pcm_open() - Open the PCM substream.
> + * @substream: Kernel ALSA substream.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
> +{
> +	struct virtio_pcm *pcm = snd_pcm_substream_chip(substream);
> +	struct virtio_pcm_substream *ss = NULL;
> +
> +	if (pcm) {
> +		switch (substream->stream) {
> +		case SNDRV_PCM_STREAM_PLAYBACK:
> +		case SNDRV_PCM_STREAM_CAPTURE: {
> +			struct virtio_pcm_stream *stream =
> +				&pcm->streams[substream->stream];
> +
> +			if (substream->number < stream->nsubstreams)

Can this condition ever be false?

> +				ss = stream->substreams[substream->number];
> +			break;
> +		}
> +		}
> +	}
> +
> +	if (!ss)
> +		return -EBADFD;
> +
> +	substream->runtime->hw = ss->hw;
> +	substream->private_data = ss;
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_close() - Close the PCM substream.
> + * @substream: Kernel ALSA substream.
> + *
> + * Context: Any context.
> + * Return: 0.
> + */
> +static int virtsnd_pcm_close(struct snd_pcm_substream *substream)
> +{
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_hw_params() - Set the parameters of the PCM substream.
> + * @substream: Kernel ALSA substream.
> + * @hw_params: Hardware parameters (can be NULL).
> + *
> + * The function can be called both from the upper level (in this case,
> + * @hw_params is not NULL) or from the driver itself (in this case, @hw_params
> + * is NULL, and the parameter values are taken from the runtime structure).
> + *
> + * In all cases, the function:
> + *   1. checks the state of the virtqueue and, if necessary, tries to fix it,
> + *   2. sets the parameters on the device side,
> + *   3. allocates a hardware buffer and I/O messages.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *hw_params)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
> +	struct virtio_device *vdev = ss->snd->vdev;
> +	struct virtio_snd_msg *msg;
> +	struct virtio_snd_pcm_set_params *request;
> +	snd_pcm_format_t format;
> +	unsigned int channels;
> +	unsigned int rate;
> +	unsigned int buffer_bytes;
> +	unsigned int period_bytes;
> +	unsigned int periods;
> +	unsigned int i;
> +	int vformat = -1;
> +	int vrate = -1;
> +	int rc;
> +
> +	/*
> +	 * If we got here after ops->trigger() was called, the queue may
> +	 * still contain messages. In this case, we need to release the
> +	 * substream first.
> +	 */
> +	if (atomic_read(&ss->msg_count)) {
> +		rc = virtsnd_pcm_release(ss);
> +		if (rc) {
> +			dev_err(&vdev->dev,
> +				"SID %u: invalid I/O queue state\n",
> +				ss->sid);
> +			return rc;
> +		}
> +	}
> +
> +	/* Set hardware parameters in device */
> +	if (hw_params) {
> +		format = params_format(hw_params);
> +		channels = params_channels(hw_params);
> +		rate = params_rate(hw_params);
> +		buffer_bytes = params_buffer_bytes(hw_params);
> +		period_bytes = params_period_bytes(hw_params);
> +		periods = params_periods(hw_params);
> +	} else {
> +		format = runtime->format;
> +		channels = runtime->channels;
> +		rate = runtime->rate;
> +		buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
> +		period_bytes = frames_to_bytes(runtime, runtime->period_size);
> +		periods = runtime->periods;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(g_a2v_format_map); ++i)
> +		if (g_a2v_format_map[i].alsa_bit == format) {
> +			vformat = g_a2v_format_map[i].vio_bit;
> +
> +			break;
> +		}
> +
> +	for (i = 0; i < ARRAY_SIZE(g_a2v_rate_map); ++i)
> +		if (g_a2v_rate_map[i].rate == rate) {
> +			vrate = g_a2v_rate_map[i].vio_bit;
> +
> +			break;
> +		}
> +
> +	if (vformat == -1 || vrate == -1)
> +		return -EINVAL;
> +
> +	msg = virtsnd_pcm_ctl_msg_alloc(ss, VIRTIO_SND_R_PCM_SET_PARAMS,
> +					GFP_KERNEL);
> +	if (IS_ERR(msg))
> +		return PTR_ERR(msg);
> +
> +	request = sg_virt(&msg->sg_request);
> +
> +	request->buffer_bytes = cpu_to_virtio32(vdev, buffer_bytes);
> +	request->period_bytes = cpu_to_virtio32(vdev, period_bytes);
> +	request->channels = channels;
> +	request->format = vformat;
> +	request->rate = vrate;

I presume the latter three fields don't have to be endienness-converted, 
perhaps they're 8-bit wide only.

> +
> +	if (ss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING))
> +		request->features |=
> +			cpu_to_virtio32(vdev,
> +					1U << VIRTIO_SND_PCM_F_MSG_POLLING);
> +
> +	if (ss->features & (1U << VIRTIO_SND_PCM_F_EVT_XRUNS))
> +		request->features |=
> +			cpu_to_virtio32(vdev,
> +					1U << VIRTIO_SND_PCM_F_EVT_XRUNS);
> +
> +	rc = virtsnd_ctl_msg_send_sync(ss->snd, msg);

Wouldn't it be better to only try to send the message after below 
allocations completed successfully?

> +	if (rc)
> +		return rc;
> +
> +	/* If the buffer was already allocated earlier, do nothing. */
> +	if (runtime->dma_area)
> +		return 0;
> +
> +	/* Allocate hardware buffer */
> +	rc = snd_pcm_lib_malloc_pages(substream, buffer_bytes);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* Allocate and initialize I/O messages */
> +	rc = virtsnd_pcm_msg_alloc(ss, periods, runtime->dma_area,
> +				   period_bytes);
> +	if (rc)
> +		snd_pcm_lib_free_pages(substream);
> +
> +	return rc;
> +}
> +
> +/**
> + * virtsnd_pcm_hw_free() - Reset the parameters of the PCM substream.
> + * @substream: Kernel ALSA substream.
> + *
> + * The function does the following:
> + *   1. tries to release the PCM substream on the device side,
> + *   2. frees the hardware buffer.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
> +	int rc;
> +
> +	rc = virtsnd_pcm_release(ss);
> +
> +	/*
> +	 * Even if we failed to send the RELEASE message or wait for the queue
> +	 * flush to complete, we can safely delete the buffer. Because after
> +	 * receiving the STOP command, the device must stop all I/O message
> +	 * processing. If there are still pending messages in the queue, the
> +	 * next ops->hw_params() call should deal with this.
> +	 */
> +	snd_pcm_lib_free_pages(substream);
> +
> +	return rc;
> +}
> +
> +/**
> + * virtsnd_pcm_hw_params() - Prepare the PCM substream.

copy-paste: this is virtsnd_pcm_prepare()

> + * @substream: Kernel ALSA substream.
> + *
> + * The function can be called both from the upper level or from the driver
> + * itself.
> + *
> + * In all cases, the function:
> + *   1. checks the state of the virtqueue and, if necessary, tries to fix it,
> + *   2. prepares the substream on the device side.
> + *
> + * Context: Any context that permits to sleep. May take and release the tx/rx
> + *          queue spinlock.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
> +	struct virtio_snd_queue *queue = virtsnd_pcm_queue(ss);
> +	struct virtio_snd_msg *msg;
> +	unsigned long flags;
> +	int rc;
> +
> +	/*
> +	 * If we got here after ops->trigger() was called, the queue may
> +	 * still contain messages. In this case, we need to reset the
> +	 * substream first.
> +	 */
> +	if (atomic_read(&ss->msg_count)) {
> +		rc = virtsnd_pcm_hw_params(substream, NULL);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	ss->msg_last_enqueued = -1;
> +	spin_unlock_irqrestore(&queue->lock, flags);
> +
> +	/*
> +	 * Since I/O messages are asynchronous, they can be completed
> +	 * when the runtime structure no longer exists. Since each
> +	 * completion implies incrementing the hw_ptr, we cache all the
> +	 * current values needed to compute the new hw_ptr value.
> +	 */
> +	ss->frame_bytes = substream->runtime->frame_bits >> 3;
> +	ss->period_size = substream->runtime->period_size;
> +	ss->buffer_size = substream->runtime->buffer_size;
> +
> +	atomic_set(&ss->hw_ptr, 0);
> +	atomic_set(&ss->xfer_xrun, 0);
> +	atomic_set(&ss->msg_count, 0);
> +
> +	msg = virtsnd_pcm_ctl_msg_alloc(ss, VIRTIO_SND_R_PCM_PREPARE,
> +					GFP_KERNEL);
> +	if (IS_ERR(msg))
> +		return PTR_ERR(msg);
> +
> +	return virtsnd_ctl_msg_send_sync(ss->snd, msg);
> +}
> +
> +/**
> + * virtsnd_pcm_trigger() - Process command for the PCM substream.
> + * @substream: Kernel ALSA substream.
> + * @command: Substream command (SNDRV_PCM_TRIGGER_XXX).
> + *
> + * Depending on the command, the function does the following:
> + *   1. enables/disables data transmission,
> + *   2. starts/stops the substream on the device side.
> + *
> + * Context: Atomic context. May take and release the tx/rx queue spinlock.

Really? Cannot .trigger() sleep? E.g. I see mdelay(25) in 
snd_es18xx_playback1_trigger()

> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
> +{
> +	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
> +	struct virtio_snd *snd = ss->snd;
> +	struct virtio_snd_queue *queue = virtsnd_pcm_queue(ss);
> +	struct virtio_snd_msg *msg;
> +
> +	switch (command) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: {
> +		int rc;
> +
> +		spin_lock(&queue->lock);
> +		rc = virtsnd_pcm_msg_send(ss);
> +		spin_unlock(&queue->lock);

Maybe it would be good to explain why locking is required here and isn't 
required in most other locations, where messages are sent?

Thanks
Guennadi

> +		if (rc)
> +			return rc;
> +
> +		atomic_set(&ss->xfer_enabled, 1);
> +
> +		msg = virtsnd_pcm_ctl_msg_alloc(ss, VIRTIO_SND_R_PCM_START,
> +						GFP_ATOMIC);
> +		if (IS_ERR(msg))
> +			return PTR_ERR(msg);
> +
> +		return virtsnd_ctl_msg_send(snd, msg);
> +	}
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: {
> +		atomic_set(&ss->xfer_enabled, 0);
> +
> +		msg = virtsnd_pcm_ctl_msg_alloc(ss, VIRTIO_SND_R_PCM_STOP,
> +						GFP_ATOMIC);
> +		if (IS_ERR(msg))
> +			return PTR_ERR(msg);
> +
> +		return virtsnd_ctl_msg_send(snd, msg);
> +	}
> +	default: {
> +		return -EINVAL;
> +	}
> +	}
> +}
> +
> +/**
> + * virtsnd_pcm_pointer() - Get the current hardware position for the PCM
> + *                         substream.
> + * @substream: Kernel ALSA substream.
> + *
> + * Context: Atomic context.
> + * Return: Hardware position in frames inside [0 ... buffer_size) range.
> + */
> +static snd_pcm_uframes_t
> +virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
> +{
> +	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
> +
> +	if (atomic_read(&ss->xfer_xrun))
> +		return SNDRV_PCM_POS_XRUN;
> +
> +	return (snd_pcm_uframes_t)atomic_read(&ss->hw_ptr);
> +}
> +
> +/* PCM substream operators map. */
> +const struct snd_pcm_ops virtsnd_pcm_ops = {
> +	.open = virtsnd_pcm_open,
> +	.close = virtsnd_pcm_close,
> +	.ioctl = snd_pcm_lib_ioctl,
> +	.hw_params = virtsnd_pcm_hw_params,
> +	.hw_free = virtsnd_pcm_hw_free,
> +	.prepare = virtsnd_pcm_prepare,
> +	.trigger = virtsnd_pcm_trigger,
> +	.pointer = virtsnd_pcm_pointer,
> +};
> -- 
> 2.30.0
>
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>
