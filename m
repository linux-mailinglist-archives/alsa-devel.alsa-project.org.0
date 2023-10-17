Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 141A97CFC2C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C3B741;
	Thu, 19 Oct 2023 16:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C3B741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724724;
	bh=4b0ucOKeifmku0zuaHI29777k3wi6A/KTUXfrvaAyYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bFvQuVbY00fqETpP5T5BVrXWhJxK2nMe4XwmbIYWEZ5g5zhuUwj7Y8d7BjyBJaing
	 AspxrHKcgTS1As8gAEcEPsWGbdxHgx75p2Bq7g5AIef5/EuRD6pMyNWq5phVR3pjaI
	 nqq63CPXFau7HUpEqUj3S6NTQf5KdPAD+/LZSSyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD8A1F805AB; Thu, 19 Oct 2023 16:10:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 532ACF8059F;
	Thu, 19 Oct 2023 16:10:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2059BF8025F; Tue, 17 Oct 2023 14:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D58BF8019B
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 14:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D58BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fqzqKxV9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697546717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBNpc8RAW/PE5aU8phLj91cR6wABDA4tTEpwyo7nQ9M=;
	b=fqzqKxV9/qhbIw+wrRl2fvKDwMn22gpkZtVX5Ydzfbigz1wOcOL65jwW2JKUWc0dYxa0os
	0q6xVcmrxIpbxiiGvDpkPFBbIUplSBG8gsrgN5UNRzoWxiKKG2EY1zqcqGe07NVKGuCMhy
	V3vExJeCOFAr9YiX4LAazIACdIG9/+M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-aCukIL4mNCKCTCGpjwQFbQ-1; Tue, 17 Oct 2023 08:45:11 -0400
X-MC-Unique: aCukIL4mNCKCTCGpjwQFbQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6564dbde089so103070816d6.1
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 05:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697546710; x=1698151510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBNpc8RAW/PE5aU8phLj91cR6wABDA4tTEpwyo7nQ9M=;
        b=NEUHilk1YW0EpcPuPCDGDik+yye9plCi0faFVco0k6FBebAQOlaCcFXjtZaYfx7Yrm
         Plz/ykQ964T+7aU5d/798nYI8Oht+8endAVGXRLkOp+GIGLeaVwlsaIUCBamP2zUXvNn
         tjF6b5L3mmUKx8dElBAU9D2rcisrfQ2usTDOV7CKceMBMNi7O1ROSP1o/7lZYyXWoRDE
         S+nRSc8Na8Nobx8kHwoX/7CFRkBCBohLyplTt/be9+AX+oVa0V4GSr23UTd9gLZEwDpN
         RqdKyv8aE5Qr6+xIU8tGsCy8Z3A4mFJqdqD1m39qqH3PddaEk+kIXFKEnibGmrRGL2fs
         TKqQ==
X-Gm-Message-State: AOJu0YyooUGT11uDDfvRr6GqUp/G/8HX04d8DgXmRG6MJJdM8KLtxxwG
	6sxs90UbhsoO/XYS+Fw4550GLO6/a9DBkliKbqd8LCO7jUXXM9XdMf+FzZiRjPpbI+trTpmbkbO
	ZIi8Xe1h3FiffA2vuirFN4Jg=
X-Received: by 2002:a0c:8e85:0:b0:656:3045:5638 with SMTP id
 x5-20020a0c8e85000000b0065630455638mr1738099qvb.16.1697546710344;
        Tue, 17 Oct 2023 05:45:10 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IEiyLhB2c1PSuhfY8KvsNDSjPL19UYsGniCAPLdRDZBdJF7LR+v/M7QaHy5b9dzDsM4U8PngQ==
X-Received: by 2002:a0c:8e85:0:b0:656:3045:5638 with SMTP id
 x5-20020a0c8e85000000b0065630455638mr1738054qvb.16.1697546709852;
        Tue, 17 Oct 2023 05:45:09 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id
 f4-20020ad442c4000000b006648514e276sm511692qvr.78.2023.10.17.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:45:09 -0700 (PDT)
Date: Tue, 17 Oct 2023 14:45:05 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, anton.yakovlev@opensynergy.com,
	mst@redhat.com, virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: Re: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <ZS6B0XVRF4KOxbJi@fedora>
References: <ZSgMeoMx6NX2zCx/@fedora>
 <20231016151000.GE119987@fedora>
 <87h6mpn16j.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87h6mpn16j.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: mvaralar@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FDWNZ3H5PYQPQXUUFMFX7KGBHPZCTHQW
X-Message-ID-Hash: FDWNZ3H5PYQPQXUUFMFX7KGBHPZCTHQW
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:10:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDWNZ3H5PYQPQXUUFMFX7KGBHPZCTHQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 17, 2023 at 09:44:04AM +0200, Takashi Iwai wrote:
> On Mon, 16 Oct 2023 17:10:00 +0200,
> Stefan Hajnoczi wrote:
> > 
> > On Thu, Oct 12, 2023 at 05:10:50PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > This commit replaces the mmap mechanism with the copy() and
> > > fill_silence() callbacks for both capturing and playback for the
> > > virtio-sound driver. This change is required to prevent the updating of
> > > the content of a buffer that is already in the available ring.
> > > 
> > > The current mechanism splits a dma buffer into descriptors that are
> > > exposed to the device. This dma buffer is shared with the user
> > > application. When the device consumes a buffer, the driver moves the
> > > request from the used ring to available ring.
> > > 
> > > The driver exposes the buffer to the device without knowing if the
> > > content has been updated from the user. The section 2.8.21.1 of the
> > > virtio spec states that: "The device MAY access the descriptor chains
> > > the driver created and the memory they refer to immediately". If the
> > > device picks up buffers from the available ring just after it is
> > > notified, it happens that the content may be old.
> > > 
> > > By providing the copy() callback, the driver first updates the content
> > > of the buffer, and then, exposes the buffer to the device by enqueuing
> > > it in the available ring. Thus, device always picks up a buffer that is
> > > updated.
> > > 
> > > For capturing, the driver starts by exposing all the available buffers
> > > to device. After device updates the content of a buffer, it enqueues it
> > > in the used ring. It is only after the copy() for capturing is issued
> > > that the driver re-enqueues the buffer in the available ring.
> > > 
> > > Note that the copy() function assumes that user is always writing a
> > > period. Testing shows that this is true but I may be wrong. This RFC
> > > aims at clarifying this.
> > 
> > This sounds like an ALSA driver API question.
> > 
> > Jaroslav and Takashi: Any thoughts?
> 
> The size of the transfer is determined solely by PCM appl_ptr and
> hw_ptr values.  The former is what applications update via the mmap
> commit or the normal read/write operations, while the latter is
> updated via PCM position() op.  So basically the granularity depends
> on the values returned from PCM position op.
> 
> 

Thanks for your comment, I'll send a second version without the
assumption that applications always update a single period.

Matias

> Takashi
> 
> > 
> > Stefan
> > 
> > > 
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > >  sound/virtio/virtio_pcm.c     | 11 ++--
> > >  sound/virtio/virtio_pcm.h     |  9 +++-
> > >  sound/virtio/virtio_pcm_msg.c | 50 ++++++++++++++++---
> > >  sound/virtio/virtio_pcm_ops.c | 94 +++++++++++++++++++++++++++++++----
> > >  4 files changed, 137 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> > > index c10d91fff2fb..bfe982952303 100644
> > > --- a/sound/virtio/virtio_pcm.c
> > > +++ b/sound/virtio/virtio_pcm.c
> > > @@ -104,8 +104,6 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
> > >  	 * only message-based transport.
> > >  	 */
> > >  	vss->hw.info =
> > > -		SNDRV_PCM_INFO_MMAP |
> > > -		SNDRV_PCM_INFO_MMAP_VALID |
> > >  		SNDRV_PCM_INFO_BATCH |
> > >  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> > >  		SNDRV_PCM_INFO_INTERLEAVED |
> > > @@ -471,12 +469,11 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
> > >  			for (kss = ks->substream; kss; kss = kss->next)
> > >  				vs->substreams[kss->number]->substream = kss;
> > >  
> > > -			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
> > > +			if (i == SNDRV_PCM_STREAM_CAPTURE)
> > > +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_capture_ops);
> > > +			else
> > > +				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_playback_ops);
> > >  		}
> > > -
> > > -		snd_pcm_set_managed_buffer_all(vpcm->pcm,
> > > -					       SNDRV_DMA_TYPE_VMALLOC, NULL,
> > > -					       0, 0);
> > >  	}
> > >  
> > >  	return 0;
> > > diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
> > > index 062eb8e8f2cf..1c1106ec971f 100644
> > > --- a/sound/virtio/virtio_pcm.h
> > > +++ b/sound/virtio/virtio_pcm.h
> > > @@ -50,6 +50,8 @@ struct virtio_pcm_substream {
> > >  	struct work_struct elapsed_period;
> > >  	spinlock_t lock;
> > >  	size_t buffer_bytes;
> > > +	u8 *buffer;
> > > +	size_t buffer_sz;
> > >  	size_t hw_ptr;
> > >  	bool xfer_enabled;
> > >  	bool xfer_xrun;
> > > @@ -90,7 +92,8 @@ struct virtio_pcm {
> > >  	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
> > >  };
> > >  
> > > -extern const struct snd_pcm_ops virtsnd_pcm_ops;
> > > +extern const struct snd_pcm_ops virtsnd_pcm_playback_ops;
> > > +extern const struct snd_pcm_ops virtsnd_pcm_capture_ops;
> > >  
> > >  int virtsnd_pcm_validate(struct virtio_device *vdev);
> > >  
> > > @@ -117,7 +120,9 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
> > >  
> > >  void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
> > >  
> > > -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
> > > +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single);
> > > +
> > > +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single);
> > >  
> > >  unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
> > >  
> > > diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> > > index aca2dc1989ba..9a5f9814cb62 100644
> > > --- a/sound/virtio/virtio_pcm_msg.c
> > > +++ b/sound/virtio/virtio_pcm_msg.c
> > > @@ -132,7 +132,6 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
> > >  int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
> > >  			  unsigned int periods, unsigned int period_bytes)
> > >  {
> > > -	struct snd_pcm_runtime *runtime = vss->substream->runtime;
> > >  	unsigned int i;
> > >  
> > >  	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
> > > @@ -142,7 +141,7 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
> > >  	vss->nmsgs = periods;
> > >  
> > >  	for (i = 0; i < periods; ++i) {
> > > -		u8 *data = runtime->dma_area + period_bytes * i;
> > > +		u8 *data = vss->buffer + period_bytes * i;
> > >  		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
> > >  		struct virtio_pcm_msg *msg;
> > >  
> > > @@ -186,10 +185,12 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
> > >  /**
> > >   * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
> > >   * @vss: VirtIO PCM substream.
> > > + * @single: true to enqueue a single message, false to enqueue all of them.
> > >   *
> > >   * All messages are organized in an ordered circular list. Each time the
> > > - * function is called, all currently non-enqueued messages are added to the
> > > - * virtqueue. For this, the function keeps track of two values:
> > > + * function is called, first non-enqueued message is added to the virtqueue.
> > > + * When single is True, only the first message is enqueued. When False, all the
> > > + * available messages are enqueued.  The function keeps track of two values:
> > >   *
> > >   *   msg_last_enqueued = index of the last enqueued message,
> > >   *   msg_count = # of pending messages in the virtqueue.
> > > @@ -198,7 +199,7 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
> > >   *          spinlocks to be held by caller.
> > >   * Return: 0 on success, -errno on failure.
> > >   */
> > > -int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
> > > +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single)
> > >  {
> > >  	struct snd_pcm_runtime *runtime = vss->substream->runtime;
> > >  	struct virtio_snd *snd = vss->snd;
> > > @@ -211,6 +212,13 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
> > >  	i = (vss->msg_last_enqueued + 1) % runtime->periods;
> > >  	n = runtime->periods - vss->msg_count;
> > >  
> > > +	if (single) {
> > > +		if (n < 1)
> > > +			return -EFAULT;
> > > +
> > > +		n = 1;
> > > +	}
> > > +
> > >  	for (; n; --n, i = (i + 1) % runtime->periods) {
> > >  		struct virtio_pcm_msg *msg = vss->msgs[i];
> > >  		struct scatterlist *psgs[] = {
> > > @@ -250,6 +258,36 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
> > >  	return 0;
> > >  }
> > >  
> > > +/**
> > > + * virtsnd_pcm_msg_send_locked() - Send asynchronous I/O messages.
> > > + * @vss: VirtIO PCM substream.
> > > + * @single: true to enqueue a single message, false to enqueue all of them.
> > > + *
> > > + * This function holds the tx/rx queue and the VirtIO substream spinlocks
> > > + * before calling virtsnd_pcm_msg_send(). This is a wrapper function to ease
> > > + * the invocation of virtsnd_pcm_msg_send().
> > > + *
> > > + * Context: Any context.
> > > + * Return: 0 on success, -errno on failure.
> > > + */
> > > +
> > > +int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single)
> > > +{
> > > +	struct virtio_snd_queue *queue;
> > > +	int rc;
> > > +	unsigned long flags;
> > > +
> > > +	queue = virtsnd_pcm_queue(vss);
> > > +
> > > +	spin_lock_irqsave(&queue->lock, flags);
> > > +	spin_lock(&vss->lock);
> > > +	rc = virtsnd_pcm_msg_send(vss, single);
> > > +	spin_unlock(&vss->lock);
> > > +	spin_unlock_irqrestore(&queue->lock, flags);
> > > +
> > > +	return rc;
> > > +}
> > > +
> > >  /**
> > >   * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
> > >   * @vss: VirtIO substream.
> > > @@ -320,8 +358,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
> > >  					le32_to_cpu(msg->status.latency_bytes));
> > >  
> > >  		schedule_work(&vss->elapsed_period);
> > > -
> > > -		virtsnd_pcm_msg_send(vss);
> > >  	} else if (!vss->msg_count) {
> > >  		wake_up_all(&vss->msg_empty);
> > >  	}
> > > diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
> > > index f8bfb87624be..a208439dbff8 100644
> > > --- a/sound/virtio/virtio_pcm_ops.c
> > > +++ b/sound/virtio/virtio_pcm_ops.c
> > > @@ -238,6 +238,11 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
> > >  	 */
> > >  	virtsnd_pcm_msg_free(vss);
> > >  
> > > +	vss->buffer_sz = params_buffer_bytes(hw_params);
> > > +	vss->buffer = alloc_pages_exact(vss->buffer_sz, GFP_KERNEL);
> > > +	if (!vss->buffer)
> > > +		return -ENOMEM;
> > > +
> > >  	return virtsnd_pcm_msg_alloc(vss, params_periods(hw_params),
> > >  				     params_period_bytes(hw_params));
> > >  }
> > > @@ -257,6 +262,11 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
> > >  	if (!virtsnd_pcm_msg_pending_num(vss))
> > >  		virtsnd_pcm_msg_free(vss);
> > >  
> > > +	if (vss->buffer) {
> > > +		free_pages_exact(vss->buffer, vss->buffer_sz);
> > > +		vss->buffer = NULL;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -331,15 +341,18 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
> > >  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > >  		queue = virtsnd_pcm_queue(vss);
> > >  
> > > -		spin_lock_irqsave(&queue->lock, flags);
> > > -		spin_lock(&vss->lock);
> > > -		rc = virtsnd_pcm_msg_send(vss);
> > > -		if (!rc)
> > > -			vss->xfer_enabled = true;
> > > -		spin_unlock(&vss->lock);
> > > -		spin_unlock_irqrestore(&queue->lock, flags);
> > > -		if (rc)
> > > -			return rc;
> > > +		// The buffers should be exposed first during capturing so that
> > > +		// the device can consume them. Capturing cannot begin
> > > +		// otherwise.
> > > +		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
> > > +			rc = virtsnd_pcm_msg_send_locked(vss, false);
> > > +			if (rc)
> > > +				return rc;
> > > +		}
> > > +
> > > +		spin_lock_irqsave(&vss->lock, flags);
> > > +		vss->xfer_enabled = true;
> > > +		spin_unlock_irqrestore(&vss->lock, flags);
> > >  
> > >  		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
> > >  						GFP_KERNEL);
> > > @@ -450,8 +463,66 @@ virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
> > >  	return hw_ptr;
> > >  }
> > >  
> > > -/* PCM substream operators map. */
> > > -const struct snd_pcm_ops virtsnd_pcm_ops = {
> > > +static int virtsnd_pcm_pb_copy(struct snd_pcm_substream *substream,
> > > +			       int channel, unsigned long pos, struct iov_iter
> > > +			       *src, unsigned long count)
> > > +{
> > > +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> > > +
> > > +	if (unlikely(pos + count > vss->buffer_sz))
> > > +		return -EINVAL;
> > > +
> > > +	if (copy_from_iter(vss->buffer + pos, count, src) != count)
> > > +		return -EFAULT;
> > > +
> > > +	return virtsnd_pcm_msg_send_locked(vss, true);
> > > +}
> > > +
> > > +static int virtsnd_pcm_cap_copy(struct snd_pcm_substream *substream,
> > > +				int channel, unsigned long pos, struct iov_iter
> > > +				*dst, unsigned long count)
> > > +{
> > > +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> > > +
> > > +	if (unlikely(pos + count > vss->buffer_sz))
> > > +		return -EINVAL;
> > > +
> > > +	if (copy_to_iter(vss->buffer + pos, count, dst) != count)
> > > +		return -EFAULT;
> > > +
> > > +	return virtsnd_pcm_msg_send_locked(vss, true);
> > > +}
> > > +
> > > +static int virtsnd_pcm_pb_silence(struct snd_pcm_substream *substream, int channel,
> > > +				  unsigned long pos, unsigned long count)
> > > +{
> > > +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> > > +
> > > +	if (unlikely(pos + count > vss->buffer_sz))
> > > +		return -EINVAL;
> > > +
> > > +	memset(vss->buffer + pos, 0, count);
> > > +
> > > +	return virtsnd_pcm_msg_send_locked(vss, true);
> > > +}
> > > +
> > > +/* PCM substream operators map for playback. */
> > > +const struct snd_pcm_ops virtsnd_pcm_playback_ops = {
> > > +	.open = virtsnd_pcm_open,
> > > +	.close = virtsnd_pcm_close,
> > > +	.ioctl = snd_pcm_lib_ioctl,
> > > +	.hw_params = virtsnd_pcm_hw_params,
> > > +	.hw_free = virtsnd_pcm_hw_free,
> > > +	.prepare = virtsnd_pcm_prepare,
> > > +	.trigger = virtsnd_pcm_trigger,
> > > +	.sync_stop = virtsnd_pcm_sync_stop,
> > > +	.pointer = virtsnd_pcm_pointer,
> > > +	.copy = virtsnd_pcm_pb_copy,
> > > +	.fill_silence = virtsnd_pcm_pb_silence,
> > > +};
> > > +
> > > +/* PCM substream operators map for capturing. */
> > > +const struct snd_pcm_ops virtsnd_pcm_capture_ops = {
> > >  	.open = virtsnd_pcm_open,
> > >  	.close = virtsnd_pcm_close,
> > >  	.ioctl = snd_pcm_lib_ioctl,
> > > @@ -461,4 +532,5 @@ const struct snd_pcm_ops virtsnd_pcm_ops = {
> > >  	.trigger = virtsnd_pcm_trigger,
> > >  	.sync_stop = virtsnd_pcm_sync_stop,
> > >  	.pointer = virtsnd_pcm_pointer,
> > > +	.copy = virtsnd_pcm_cap_copy,
> > >  };
> > > 
> > > base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> > > -- 
> > > 2.41.0
> > > 
> > Verifying...
> 

