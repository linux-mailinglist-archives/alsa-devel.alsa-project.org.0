Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1587C7141
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 17:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62BE83B;
	Thu, 12 Oct 2023 17:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62BE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697123894;
	bh=wkNatcmAAsiN89y/BEjMEPTf0SckBa0ujMJ8mn3C4FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ncyg6FnKsqN3lqk65IQ7V/o/QNRwFRoBKeMBQTOHrreqp5PZQmfRepehGWpuj4ifs
	 9cWuBeQaypoOybVUaaVZsIHsukxW0NMH/N3uunwqKNMxbz+f9SGGdMn44BHimJoVE1
	 50BVzmTdRy7b2DGK1iYIypAlL9alvFxBhyLXgM/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2901EF80552; Thu, 12 Oct 2023 17:17:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C79ACF8027B;
	Thu, 12 Oct 2023 17:17:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4499AF802BE; Thu, 12 Oct 2023 17:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD771F80130
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 17:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD771F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NgZ9O8mL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697123827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N61O7dqOv5z704fPtB1xO3U6E0vm18ayN3uykalF+0E=;
	b=NgZ9O8mLHfE3kDFAULyvQat2wyhr4nDcrOxab0H7D5LKNnzMkdj8xQjCMbPWqxpv+J29RM
	swhgJkAj9tv7Gm+dACZipSYGw2+rsOL2DKa7JdQGYPIrDzwrpdZFjCpTpmo8+/434XJDFf
	IM2ClNHkRnrhFyhgPWIAC+KVJ5Swouk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-QJ1WJur0MPys-Xc6ZUjU-w-1; Thu, 12 Oct 2023 11:16:59 -0400
X-MC-Unique: QJ1WJur0MPys-Xc6ZUjU-w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32d931872cbso371693f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Oct 2023 08:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123818; x=1697728618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N61O7dqOv5z704fPtB1xO3U6E0vm18ayN3uykalF+0E=;
        b=v73y2POVLl2hLuCf6h8JDHEYjoyXyT+iw6E2D+6vqBAW9x+c4LA1mq55NCt5JIL5VU
         3bSSgFUnP8AmIpeBOC17stijCjkBmAK4S1RwhR+kx1zf0ogyKAtA1yOSpHF4UlU7qrO+
         y7qWPBHxNXKlKZ7sH8oxK2wnfugs/58Xh8Fa9aKCeMmE6nGPEPJ2XcLM8PdDeRuzNYJz
         SwVWwosditRJyV2C6YLFVCz7/en6QTRq96p9UtCbQ3tBOdHX+Kv9vSyB3Q6gwzIDf4wj
         4uGdrMWFfH9pJ1ZiS2sq1pnls4CjEb4IDk45CH2gXC6sC6qSkMsvDDOaPiRGsFRFEzj3
         BY3g==
X-Gm-Message-State: AOJu0YxqizPyOfs6AXShtClw9C9LjH8DUjRQS1zOyP+RLygOBAyiyPb8
	TeGAymFZIRRQKe/hpqAnyyNaMmGAlvNeuQ3hPGe4XZeuY9fVh4v/uIKpTn0jur04p9aMGbe2b50
	vXKWO925guS5lHkhszH+wCdI=
X-Received: by 2002:adf:ef8f:0:b0:31f:a718:4cb6 with SMTP id
 d15-20020adfef8f000000b0031fa7184cb6mr19319519wro.46.1697123818305;
        Thu, 12 Oct 2023 08:16:58 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IHAFMy3JuuSbtpHzX18yLnNQpgdXSKnknNcM2R6XmpX/8dk97710VScPX4tGnGORP82f1D0NA==
X-Received: by 2002:adf:ef8f:0:b0:31f:a718:4cb6 with SMTP id
 d15-20020adfef8f000000b0031fa7184cb6mr19319482wro.46.1697123817569;
        Thu, 12 Oct 2023 08:16:57 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b00326dd5486dcsm18711740wrf.107.2023.10.12.08.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 08:16:56 -0700 (PDT)
Date: Thu, 12 Oct 2023 11:16:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: anton.yakovlev@opensynergy.com, perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: Re: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <20231012111525-mutt-send-email-mst@kernel.org>
References: <ZSgMeoMx6NX2zCx/@fedora>
MIME-Version: 1.0
In-Reply-To: <ZSgMeoMx6NX2zCx/@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 72LYZFCOR75K6OZXEWGZBYZHAXE5E7B6
X-Message-ID-Hash: 72LYZFCOR75K6OZXEWGZBYZHAXE5E7B6
X-MailFrom: mst@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72LYZFCOR75K6OZXEWGZBYZHAXE5E7B6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 12, 2023 at 05:10:50PM +0200, Matias Ezequiel Vara Larsen wrote:
> This commit replaces the mmap mechanism with the copy() and
> fill_silence() callbacks for both capturing and playback for the
> virtio-sound driver. This change is required to prevent the updating of
> the content of a buffer that is already in the available ring.
> 
> The current mechanism splits a dma buffer into descriptors that are
> exposed to the device. This dma buffer is shared with the user
> application. When the device consumes a buffer, the driver moves the
> request from the used ring to available ring.
> 
> The driver exposes the buffer to the device without knowing if the
> content has been updated from the user. The section 2.8.21.1 of the
> virtio spec states that: "The device MAY access the descriptor chains
> the driver created and the memory they refer to immediately". If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content may be old.
> 
> By providing the copy() callback, the driver first updates the content
> of the buffer, and then, exposes the buffer to the device by enqueuing
> it in the available ring. Thus, device always picks up a buffer that is
> updated.
> 
> For capturing, the driver starts by exposing all the available buffers
> to device. After device updates the content of a buffer, it enqueues it
> in the used ring. It is only after the copy() for capturing is issued
> that the driver re-enqueues the buffer in the available ring.
> 
> Note that the copy() function assumes that user is always writing a
> period. Testing shows that this is true but I may be wrong. This RFC
> aims at clarifying this.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>


Thank you for working on this!

> ---
>  sound/virtio/virtio_pcm.c     | 11 ++--
>  sound/virtio/virtio_pcm.h     |  9 +++-
>  sound/virtio/virtio_pcm_msg.c | 50 ++++++++++++++++---
>  sound/virtio/virtio_pcm_ops.c | 94 +++++++++++++++++++++++++++++++----
>  4 files changed, 137 insertions(+), 27 deletions(-)
> 
> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> index c10d91fff2fb..bfe982952303 100644
> --- a/sound/virtio/virtio_pcm.c
> +++ b/sound/virtio/virtio_pcm.c
> @@ -104,8 +104,6 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>  	 * only message-based transport.
>  	 */
>  	vss->hw.info =
> -		SNDRV_PCM_INFO_MMAP |
> -		SNDRV_PCM_INFO_MMAP_VALID |
>  		SNDRV_PCM_INFO_BATCH |
>  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>  		SNDRV_PCM_INFO_INTERLEAVED |
> @@ -471,12 +469,11 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
>  			for (kss = ks->substream; kss; kss = kss->next)
>  				vs->substreams[kss->number]->substream = kss;
>  
> -			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
> +			if (i == SNDRV_PCM_STREAM_CAPTURE)
> +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_capture_ops);
> +			else
> +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_playback_ops);
>  		}
> -
> -		snd_pcm_set_managed_buffer_all(vpcm->pcm,
> -					       SNDRV_DMA_TYPE_VMALLOC, NULL,
> -					       0, 0);
>  	}
>  
>  	return 0;
> diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
> index 062eb8e8f2cf..1c1106ec971f 100644
> --- a/sound/virtio/virtio_pcm.h
> +++ b/sound/virtio/virtio_pcm.h
> @@ -50,6 +50,8 @@ struct virtio_pcm_substream {
>  	struct work_struct elapsed_period;
>  	spinlock_t lock;
>  	size_t buffer_bytes;
> +	u8 *buffer;
> +	size_t buffer_sz;
>  	size_t hw_ptr;
>  	bool xfer_enabled;
>  	bool xfer_xrun;
> @@ -90,7 +92,8 @@ struct virtio_pcm {
>  	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
>  };
>  
> -extern const struct snd_pcm_ops virtsnd_pcm_ops;
> +extern const struct snd_pcm_ops virtsnd_pcm_playback_ops;
> +extern const struct snd_pcm_ops virtsnd_pcm_capture_ops;
>  
>  int virtsnd_pcm_validate(struct virtio_device *vdev);
>  
> @@ -117,7 +120,9 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>  
>  void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
>  
> -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single);
> +
> +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single);
>  
>  unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
>  
> diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> index aca2dc1989ba..9a5f9814cb62 100644
> --- a/sound/virtio/virtio_pcm_msg.c
> +++ b/sound/virtio/virtio_pcm_msg.c
> @@ -132,7 +132,6 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
>  int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>  			  unsigned int periods, unsigned int period_bytes)
>  {
> -	struct snd_pcm_runtime *runtime = vss->substream->runtime;
>  	unsigned int i;
>  
>  	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
> @@ -142,7 +141,7 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>  	vss->nmsgs = periods;
>  
>  	for (i = 0; i < periods; ++i) {
> -		u8 *data = runtime->dma_area + period_bytes * i;
> +		u8 *data = vss->buffer + period_bytes * i;
>  		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
>  		struct virtio_pcm_msg *msg;
>  
> @@ -186,10 +185,12 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
>  /**
>   * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
>   * @vss: VirtIO PCM substream.
> + * @single: true to enqueue a single message, false to enqueue all of them.
>   *
>   * All messages are organized in an ordered circular list. Each time the
> - * function is called, all currently non-enqueued messages are added to the
> - * virtqueue. For this, the function keeps track of two values:
> + * function is called, first non-enqueued message is added to the virtqueue.
> + * When single is True, only the first message is enqueued. When False, all the
> + * available messages are enqueued.  The function keeps track of two values:
>   *
>   *   msg_last_enqueued = index of the last enqueued message,
>   *   msg_count = # of pending messages in the virtqueue.
> @@ -198,7 +199,7 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
>   *          spinlocks to be held by caller.
>   * Return: 0 on success, -errno on failure.
>   */
> -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single)
>  {
>  	struct snd_pcm_runtime *runtime = vss->substream->runtime;
>  	struct virtio_snd *snd = vss->snd;
> @@ -211,6 +212,13 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
>  	i = (vss->msg_last_enqueued + 1) % runtime->periods;
>  	n = runtime->periods - vss->msg_count;
>  
> +	if (single) {
> +		if (n < 1)
> +			return -EFAULT;
> +
> +		n = 1;
> +	}
> +
>  	for (; n; --n, i = (i + 1) % runtime->periods) {
>  		struct virtio_pcm_msg *msg = vss->msgs[i];
>  		struct scatterlist *psgs[] = {
> @@ -250,6 +258,36 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
>  	return 0;
>  }
>  
> +/**
> + * virtsnd_pcm_msg_send_locked() - Send asynchronous I/O messages.
> + * @vss: VirtIO PCM substream.
> + * @single: true to enqueue a single message, false to enqueue all of them.
> + *
> + * This function holds the tx/rx queue and the VirtIO substream spinlocks
> + * before calling virtsnd_pcm_msg_send(). This is a wrapper function to ease
> + * the invocation of virtsnd_pcm_msg_send().
> + *
> + * Context: Any context.
> + * Return: 0 on success, -errno on failure.
> + */
> +
> +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single)
> +{
> +	struct virtio_snd_queue *queue;
> +	int rc;
> +	unsigned long flags;
> +
> +	queue = virtsnd_pcm_queue(vss);
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	spin_lock(&vss->lock);
> +	rc = virtsnd_pcm_msg_send(vss, single);
> +	spin_unlock(&vss->lock);
> +	spin_unlock_irqrestore(&queue->lock, flags);
> +
> +	return rc;
> +}
> +
>  /**
>   * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
>   * @vss: VirtIO substream.
> @@ -320,8 +358,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
>  					le32_to_cpu(msg->status.latency_bytes));
>  
>  		schedule_work(&vss->elapsed_period);
> -
> -		virtsnd_pcm_msg_send(vss);
>  	} else if (!vss->msg_count) {
>  		wake_up_all(&vss->msg_empty);
>  	}
> diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
> index f8bfb87624be..a208439dbff8 100644
> --- a/sound/virtio/virtio_pcm_ops.c
> +++ b/sound/virtio/virtio_pcm_ops.c
> @@ -238,6 +238,11 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
>  	 */
>  	virtsnd_pcm_msg_free(vss);
>  
> +	vss->buffer_sz = params_buffer_bytes(hw_params);
> +	vss->buffer = alloc_pages_exact(vss->buffer_sz, GFP_KERNEL);
> +	if (!vss->buffer)
> +		return -ENOMEM;
> +
>  	return virtsnd_pcm_msg_alloc(vss, params_periods(hw_params),
>  				     params_period_bytes(hw_params));
>  }
> @@ -257,6 +262,11 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
>  	if (!virtsnd_pcm_msg_pending_num(vss))
>  		virtsnd_pcm_msg_free(vss);
>  
> +	if (vss->buffer) {
> +		free_pages_exact(vss->buffer, vss->buffer_sz);
> +		vss->buffer = NULL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -331,15 +341,18 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		queue = virtsnd_pcm_queue(vss);
>  
> -		spin_lock_irqsave(&queue->lock, flags);
> -		spin_lock(&vss->lock);
> -		rc = virtsnd_pcm_msg_send(vss);
> -		if (!rc)
> -			vss->xfer_enabled = true;
> -		spin_unlock(&vss->lock);
> -		spin_unlock_irqrestore(&queue->lock, flags);
> -		if (rc)
> -			return rc;
> +		// The buffers should be exposed first during capturing so that
> +		// the device can consume them. Capturing cannot begin
> +		// otherwise.
> +		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
> +			rc = virtsnd_pcm_msg_send_locked(vss, false);
> +			if (rc)
> +				return rc;
> +		}
> +
> +		spin_lock_irqsave(&vss->lock, flags);
> +		vss->xfer_enabled = true;
> +		spin_unlock_irqrestore(&vss->lock, flags);
>  
>  		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
>  						GFP_KERNEL);
> @@ -450,8 +463,66 @@ virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
>  	return hw_ptr;
>  }
>  
> -/* PCM substream operators map. */
> -const struct snd_pcm_ops virtsnd_pcm_ops = {
> +static int virtsnd_pcm_pb_copy(struct snd_pcm_substream *substream,
> +			       int channel, unsigned long pos, struct iov_iter
> +			       *src, unsigned long count)
> +{
> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> +
> +	if (unlikely(pos + count > vss->buffer_sz))
> +		return -EINVAL;
> +
> +	if (copy_from_iter(vss->buffer + pos, count, src) != count)
> +		return -EFAULT;
> +
> +	return virtsnd_pcm_msg_send_locked(vss, true);
> +}
> +
> +static int virtsnd_pcm_cap_copy(struct snd_pcm_substream *substream,
> +				int channel, unsigned long pos, struct iov_iter
> +				*dst, unsigned long count)
> +{
> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> +
> +	if (unlikely(pos + count > vss->buffer_sz))
> +		return -EINVAL;
> +
> +	if (copy_to_iter(vss->buffer + pos, count, dst) != count)
> +		return -EFAULT;
> +
> +	return virtsnd_pcm_msg_send_locked(vss, true);
> +}
> +
> +static int virtsnd_pcm_pb_silence(struct snd_pcm_substream *substream, int channel,
> +				  unsigned long pos, unsigned long count)
> +{
> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> +
> +	if (unlikely(pos + count > vss->buffer_sz))
> +		return -EINVAL;
> +
> +	memset(vss->buffer + pos, 0, count);
> +
> +	return virtsnd_pcm_msg_send_locked(vss, true);
> +}
> +
> +/* PCM substream operators map for playback. */
> +const struct snd_pcm_ops virtsnd_pcm_playback_ops = {
> +	.open = virtsnd_pcm_open,
> +	.close = virtsnd_pcm_close,
> +	.ioctl = snd_pcm_lib_ioctl,
> +	.hw_params = virtsnd_pcm_hw_params,
> +	.hw_free = virtsnd_pcm_hw_free,
> +	.prepare = virtsnd_pcm_prepare,
> +	.trigger = virtsnd_pcm_trigger,
> +	.sync_stop = virtsnd_pcm_sync_stop,
> +	.pointer = virtsnd_pcm_pointer,
> +	.copy = virtsnd_pcm_pb_copy,
> +	.fill_silence = virtsnd_pcm_pb_silence,
> +};
> +
> +/* PCM substream operators map for capturing. */
> +const struct snd_pcm_ops virtsnd_pcm_capture_ops = {
>  	.open = virtsnd_pcm_open,
>  	.close = virtsnd_pcm_close,
>  	.ioctl = snd_pcm_lib_ioctl,
> @@ -461,4 +532,5 @@ const struct snd_pcm_ops virtsnd_pcm_ops = {
>  	.trigger = virtsnd_pcm_trigger,
>  	.sync_stop = virtsnd_pcm_sync_stop,
>  	.pointer = virtsnd_pcm_pointer,
> +	.copy = virtsnd_pcm_cap_copy,
>  };
> 
> base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> -- 
> 2.41.0

