Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE767CC4C3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 15:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB393200;
	Tue, 17 Oct 2023 15:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB393200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697549389;
	bh=gVBfrkH+WQvimBimH4R7r+86yGiCyHVXGO5mZ1GE73Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CzfqGbVgHdhq4/wrg4Iz5pAywGGyCFrDSAZXIrMvkb1rC2a3EGUYzMJX7EAtjPagH
	 C/tFQyj2pgBJBc6ZX1hcSodCEt2XmrCYNh+RAg6VXok2iYEOfRLBIh4+p7STaUEC7m
	 LaWsq/LYSJlepNo8R7IBFPZ98WMihc3iARcHcRto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06A0CF8024E; Tue, 17 Oct 2023 15:28:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD4CF8024E;
	Tue, 17 Oct 2023 15:28:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67178F8025F; Tue, 17 Oct 2023 15:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A0EEF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 15:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A0EEF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LQsVsuz8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697549315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhVqTbabL6sq7HN9XgiUy3YMvpy6i23xCHUppYbkIyo=;
	b=LQsVsuz82lI/7p5wmJFg1C/RmL8eGS4oGz0UUtasF3eSqJJ3nen5cj6X9lA9CMw4lnAGVk
	VAkJIaupIJdSEwkFKaDi8FoZlmEAPX+ta0pC9H9xRAnbZVQtERbXGXlQpU5RHgvfe1GZJa
	zGqPEhmSblw3Ku43nVnaCW54xX8t1vM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-jtH9342nNJa_5q9S3E8g6A-1; Tue, 17 Oct 2023 09:28:33 -0400
X-MC-Unique: jtH9342nNJa_5q9S3E8g6A-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3ae5ac8de14so8733652b6e.2
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 06:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549313; x=1698154113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhVqTbabL6sq7HN9XgiUy3YMvpy6i23xCHUppYbkIyo=;
        b=w7+a7pGUGgCZtxZrWb5mtFIyfe1j4laltoMJ49Cq7I0drcWdCRpkaxfEpUj3qDxybJ
         ZyyZl/wE9bVtKqCpGx2AtNh1bVciC8j3mJLYc1D1TpWJfHddoS/02AwNVPL1dqJA0F5Q
         XZMhaiAoghJn9Gp2l7lld7YVgPhzJe81jAT0zGv7PpPY27DcR6vjANbXYx+mWIg9o5ZT
         XL6F7hLVbaOZjtoQ+hCTrAgBwgPTEPnhLZ2zUQ0/o3VfO2clIubhziz8aQQetuI39n3t
         aN2RKMxXK/Q8DNpEBvXrhUDbJTrtBnuroQRI8hXLlVfN6Z7JUjcx8hjBgCAQhGJaQ4cN
         o2jw==
X-Gm-Message-State: AOJu0YyJUweprGJvc+W457qUrKPfHsXmVKSapjaoG93kKt+TocfC7NQa
	8iTc3AuWzRHhxWm+cfDasYnDB3kvlepQ1BK4EJvAu1ChXKG7KZan7QOjNrmTEelq5S2XFgrZ8Sx
	Y1mXB2Mq/0o4Wu+31CUY8KUA=
X-Received: by 2002:a05:6808:4d6:b0:3a7:2598:ab2c with SMTP id
 a22-20020a05680804d600b003a72598ab2cmr2405577oie.7.1697549313041;
        Tue, 17 Oct 2023 06:28:33 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IEmNw+G5EzFy/KsOuP+UAGm3kI1m0UlUNmnuPcxkv/nPe5RZHf5Bux/Bi8iFz94fB4vQTIW5g==
X-Received: by 2002:a05:6808:4d6:b0:3a7:2598:ab2c with SMTP id
 a22-20020a05680804d600b003a72598ab2cmr2405528oie.7.1697549312492;
        Tue, 17 Oct 2023 06:28:32 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-185-56.business.telecomitalia.it.
 [87.12.185.56])
        by smtp.gmail.com with ESMTPSA id
 e7-20020a0caa47000000b0064f5d70d072sm553752qvb.37.2023.10.17.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:28:31 -0700 (PDT)
Date: Tue, 17 Oct 2023 15:28:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	anton.yakovlev@opensynergy.com, perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, manos.pitsidianakis@linaro.org,
	mripard@redhat.com
Subject: Re: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <g7hi2yqqiee5tyehuyn422uzxz6tc3kfbahgjaykrnpm43zisn@prfjfy7isuv7>
References: <ZSgMeoMx6NX2zCx/@fedora>
 <20231012111525-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231012111525-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Message-ID-Hash: VPZAIVCYE3FCPAOPWM3HJOHBFNPTJWXP
X-Message-ID-Hash: VPZAIVCYE3FCPAOPWM3HJOHBFNPTJWXP
X-MailFrom: sgarzare@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPZAIVCYE3FCPAOPWM3HJOHBFNPTJWXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 12, 2023 at 11:16:54AM -0400, Michael S. Tsirkin wrote:
>On Thu, Oct 12, 2023 at 05:10:50PM +0200, Matias Ezequiel Vara Larsen wrote:
>> This commit replaces the mmap mechanism with the copy() and
>> fill_silence() callbacks for both capturing and playback for the
>> virtio-sound driver. This change is required to prevent the updating of
>> the content of a buffer that is already in the available ring.
>>
>> The current mechanism splits a dma buffer into descriptors that are
>> exposed to the device. This dma buffer is shared with the user
>> application. When the device consumes a buffer, the driver moves the
>> request from the used ring to available ring.
>>
>> The driver exposes the buffer to the device without knowing if the
>> content has been updated from the user. The section 2.8.21.1 of the
>> virtio spec states that: "The device MAY access the descriptor chains
>> the driver created and the memory they refer to immediately". If the
>> device picks up buffers from the available ring just after it is
>> notified, it happens that the content may be old.
>>
>> By providing the copy() callback, the driver first updates the content
>> of the buffer, and then, exposes the buffer to the device by enqueuing
>> it in the available ring. Thus, device always picks up a buffer that is
>> updated.
>>
>> For capturing, the driver starts by exposing all the available buffers
>> to device. After device updates the content of a buffer, it enqueues it
>> in the used ring. It is only after the copy() for capturing is issued
>> that the driver re-enqueues the buffer in the available ring.
>>
>> Note that the copy() function assumes that user is always writing a
>> period. Testing shows that this is true but I may be wrong. This RFC
>> aims at clarifying this.
>>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>
>
>Thank you for working on this!

Yep, +1!

@Michael do you think we should cc stable and add a Fixes tag since
the driver is not following the virtio spec?

Or it is too risky?

IIUC snd_pcm_ops is changed a bit from previous versions, so we may have
to adapt the patch for stable branches.

Stefano

>
>> ---
>>  sound/virtio/virtio_pcm.c     | 11 ++--
>>  sound/virtio/virtio_pcm.h     |  9 +++-
>>  sound/virtio/virtio_pcm_msg.c | 50 ++++++++++++++++---
>>  sound/virtio/virtio_pcm_ops.c | 94 +++++++++++++++++++++++++++++++----
>>  4 files changed, 137 insertions(+), 27 deletions(-)
>>
>> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
>> index c10d91fff2fb..bfe982952303 100644
>> --- a/sound/virtio/virtio_pcm.c
>> +++ b/sound/virtio/virtio_pcm.c
>> @@ -104,8 +104,6 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>  	 * only message-based transport.
>>  	 */
>>  	vss->hw.info =
>> -		SNDRV_PCM_INFO_MMAP |
>> -		SNDRV_PCM_INFO_MMAP_VALID |
>>  		SNDRV_PCM_INFO_BATCH |
>>  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>  		SNDRV_PCM_INFO_INTERLEAVED |
>> @@ -471,12 +469,11 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
>>  			for (kss = ks->substream; kss; kss = kss->next)
>>  				vs->substreams[kss->number]->substream = kss;
>>
>> -			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
>> +			if (i == SNDRV_PCM_STREAM_CAPTURE)
>> +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_capture_ops);
>> +			else
>> +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_playback_ops);
>>  		}
>> -
>> -		snd_pcm_set_managed_buffer_all(vpcm->pcm,
>> -					       SNDRV_DMA_TYPE_VMALLOC, NULL,
>> -					       0, 0);
>>  	}
>>
>>  	return 0;
>> diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
>> index 062eb8e8f2cf..1c1106ec971f 100644
>> --- a/sound/virtio/virtio_pcm.h
>> +++ b/sound/virtio/virtio_pcm.h
>> @@ -50,6 +50,8 @@ struct virtio_pcm_substream {
>>  	struct work_struct elapsed_period;
>>  	spinlock_t lock;
>>  	size_t buffer_bytes;
>> +	u8 *buffer;
>> +	size_t buffer_sz;
>>  	size_t hw_ptr;
>>  	bool xfer_enabled;
>>  	bool xfer_xrun;
>> @@ -90,7 +92,8 @@ struct virtio_pcm {
>>  	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
>>  };
>>
>> -extern const struct snd_pcm_ops virtsnd_pcm_ops;
>> +extern const struct snd_pcm_ops virtsnd_pcm_playback_ops;
>> +extern const struct snd_pcm_ops virtsnd_pcm_capture_ops;
>>
>>  int virtsnd_pcm_validate(struct virtio_device *vdev);
>>
>> @@ -117,7 +120,9 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>>
>>  void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
>>
>> -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
>> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single);
>> +
>> +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single);
>>
>>  unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
>>
>> diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
>> index aca2dc1989ba..9a5f9814cb62 100644
>> --- a/sound/virtio/virtio_pcm_msg.c
>> +++ b/sound/virtio/virtio_pcm_msg.c
>> @@ -132,7 +132,6 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
>>  int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>>  			  unsigned int periods, unsigned int period_bytes)
>>  {
>> -	struct snd_pcm_runtime *runtime = vss->substream->runtime;
>>  	unsigned int i;
>>
>>  	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
>> @@ -142,7 +141,7 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
>>  	vss->nmsgs = periods;
>>
>>  	for (i = 0; i < periods; ++i) {
>> -		u8 *data = runtime->dma_area + period_bytes * i;
>> +		u8 *data = vss->buffer + period_bytes * i;
>>  		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
>>  		struct virtio_pcm_msg *msg;
>>
>> @@ -186,10 +185,12 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
>>  /**
>>   * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
>>   * @vss: VirtIO PCM substream.
>> + * @single: true to enqueue a single message, false to enqueue all of them.
>>   *
>>   * All messages are organized in an ordered circular list. Each time the
>> - * function is called, all currently non-enqueued messages are added to the
>> - * virtqueue. For this, the function keeps track of two values:
>> + * function is called, first non-enqueued message is added to the virtqueue.
>> + * When single is True, only the first message is enqueued. When False, all the
>> + * available messages are enqueued.  The function keeps track of two values:
>>   *
>>   *   msg_last_enqueued = index of the last enqueued message,
>>   *   msg_count = # of pending messages in the virtqueue.
>> @@ -198,7 +199,7 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
>>   *          spinlocks to be held by caller.
>>   * Return: 0 on success, -errno on failure.
>>   */
>> -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
>> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single)
>>  {
>>  	struct snd_pcm_runtime *runtime = vss->substream->runtime;
>>  	struct virtio_snd *snd = vss->snd;
>> @@ -211,6 +212,13 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
>>  	i = (vss->msg_last_enqueued + 1) % runtime->periods;
>>  	n = runtime->periods - vss->msg_count;
>>
>> +	if (single) {
>> +		if (n < 1)
>> +			return -EFAULT;
>> +
>> +		n = 1;
>> +	}
>> +
>>  	for (; n; --n, i = (i + 1) % runtime->periods) {
>>  		struct virtio_pcm_msg *msg = vss->msgs[i];
>>  		struct scatterlist *psgs[] = {
>> @@ -250,6 +258,36 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
>>  	return 0;
>>  }
>>
>> +/**
>> + * virtsnd_pcm_msg_send_locked() - Send asynchronous I/O messages.
>> + * @vss: VirtIO PCM substream.
>> + * @single: true to enqueue a single message, false to enqueue all of them.
>> + *
>> + * This function holds the tx/rx queue and the VirtIO substream spinlocks
>> + * before calling virtsnd_pcm_msg_send(). This is a wrapper function to ease
>> + * the invocation of virtsnd_pcm_msg_send().
>> + *
>> + * Context: Any context.
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +
>> +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single)
>> +{
>> +	struct virtio_snd_queue *queue;
>> +	int rc;
>> +	unsigned long flags;
>> +
>> +	queue = virtsnd_pcm_queue(vss);
>> +
>> +	spin_lock_irqsave(&queue->lock, flags);
>> +	spin_lock(&vss->lock);
>> +	rc = virtsnd_pcm_msg_send(vss, single);
>> +	spin_unlock(&vss->lock);
>> +	spin_unlock_irqrestore(&queue->lock, flags);
>> +
>> +	return rc;
>> +}
>> +
>>  /**
>>   * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
>>   * @vss: VirtIO substream.
>> @@ -320,8 +358,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
>>  					le32_to_cpu(msg->status.latency_bytes));
>>
>>  		schedule_work(&vss->elapsed_period);
>> -
>> -		virtsnd_pcm_msg_send(vss);
>>  	} else if (!vss->msg_count) {
>>  		wake_up_all(&vss->msg_empty);
>>  	}
>> diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
>> index f8bfb87624be..a208439dbff8 100644
>> --- a/sound/virtio/virtio_pcm_ops.c
>> +++ b/sound/virtio/virtio_pcm_ops.c
>> @@ -238,6 +238,11 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
>>  	 */
>>  	virtsnd_pcm_msg_free(vss);
>>
>> +	vss->buffer_sz = params_buffer_bytes(hw_params);
>> +	vss->buffer = alloc_pages_exact(vss->buffer_sz, GFP_KERNEL);
>> +	if (!vss->buffer)
>> +		return -ENOMEM;
>> +
>>  	return virtsnd_pcm_msg_alloc(vss, params_periods(hw_params),
>>  				     params_period_bytes(hw_params));
>>  }
>> @@ -257,6 +262,11 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
>>  	if (!virtsnd_pcm_msg_pending_num(vss))
>>  		virtsnd_pcm_msg_free(vss);
>>
>> +	if (vss->buffer) {
>> +		free_pages_exact(vss->buffer, vss->buffer_sz);
>> +		vss->buffer = NULL;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -331,15 +341,18 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
>>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>  		queue = virtsnd_pcm_queue(vss);
>>
>> -		spin_lock_irqsave(&queue->lock, flags);
>> -		spin_lock(&vss->lock);
>> -		rc = virtsnd_pcm_msg_send(vss);
>> -		if (!rc)
>> -			vss->xfer_enabled = true;
>> -		spin_unlock(&vss->lock);
>> -		spin_unlock_irqrestore(&queue->lock, flags);
>> -		if (rc)
>> -			return rc;
>> +		// The buffers should be exposed first during capturing so that
>> +		// the device can consume them. Capturing cannot begin
>> +		// otherwise.
>> +		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
>> +			rc = virtsnd_pcm_msg_send_locked(vss, false);
>> +			if (rc)
>> +				return rc;
>> +		}
>> +
>> +		spin_lock_irqsave(&vss->lock, flags);
>> +		vss->xfer_enabled = true;
>> +		spin_unlock_irqrestore(&vss->lock, flags);
>>
>>  		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
>>  						GFP_KERNEL);
>> @@ -450,8 +463,66 @@ virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
>>  	return hw_ptr;
>>  }
>>
>> -/* PCM substream operators map. */
>> -const struct snd_pcm_ops virtsnd_pcm_ops = {
>> +static int virtsnd_pcm_pb_copy(struct snd_pcm_substream *substream,
>> +			       int channel, unsigned long pos, struct iov_iter
>> +			       *src, unsigned long count)
>> +{
>> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
>> +
>> +	if (unlikely(pos + count > vss->buffer_sz))
>> +		return -EINVAL;
>> +
>> +	if (copy_from_iter(vss->buffer + pos, count, src) != count)
>> +		return -EFAULT;
>> +
>> +	return virtsnd_pcm_msg_send_locked(vss, true);
>> +}
>> +
>> +static int virtsnd_pcm_cap_copy(struct snd_pcm_substream *substream,
>> +				int channel, unsigned long pos, struct iov_iter
>> +				*dst, unsigned long count)
>> +{
>> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
>> +
>> +	if (unlikely(pos + count > vss->buffer_sz))
>> +		return -EINVAL;
>> +
>> +	if (copy_to_iter(vss->buffer + pos, count, dst) != count)
>> +		return -EFAULT;
>> +
>> +	return virtsnd_pcm_msg_send_locked(vss, true);
>> +}
>> +
>> +static int virtsnd_pcm_pb_silence(struct snd_pcm_substream *substream, int channel,
>> +				  unsigned long pos, unsigned long count)
>> +{
>> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
>> +
>> +	if (unlikely(pos + count > vss->buffer_sz))
>> +		return -EINVAL;
>> +
>> +	memset(vss->buffer + pos, 0, count);
>> +
>> +	return virtsnd_pcm_msg_send_locked(vss, true);
>> +}
>> +
>> +/* PCM substream operators map for playback. */
>> +const struct snd_pcm_ops virtsnd_pcm_playback_ops = {
>> +	.open = virtsnd_pcm_open,
>> +	.close = virtsnd_pcm_close,
>> +	.ioctl = snd_pcm_lib_ioctl,
>> +	.hw_params = virtsnd_pcm_hw_params,
>> +	.hw_free = virtsnd_pcm_hw_free,
>> +	.prepare = virtsnd_pcm_prepare,
>> +	.trigger = virtsnd_pcm_trigger,
>> +	.sync_stop = virtsnd_pcm_sync_stop,
>> +	.pointer = virtsnd_pcm_pointer,
>> +	.copy = virtsnd_pcm_pb_copy,
>> +	.fill_silence = virtsnd_pcm_pb_silence,
>> +};
>> +
>> +/* PCM substream operators map for capturing. */
>> +const struct snd_pcm_ops virtsnd_pcm_capture_ops = {
>>  	.open = virtsnd_pcm_open,
>>  	.close = virtsnd_pcm_close,
>>  	.ioctl = snd_pcm_lib_ioctl,
>> @@ -461,4 +532,5 @@ const struct snd_pcm_ops virtsnd_pcm_ops = {
>>  	.trigger = virtsnd_pcm_trigger,
>>  	.sync_stop = virtsnd_pcm_sync_stop,
>>  	.pointer = virtsnd_pcm_pointer,
>> +	.copy = virtsnd_pcm_cap_copy,
>>  };
>>
>> base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
>> --
>> 2.41.0
>

