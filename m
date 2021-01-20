Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D62FCCB0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:28:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE3017DA;
	Wed, 20 Jan 2021 09:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE3017DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611131313;
	bh=akr8VYLLqCtmqq/e+25NpOq25K9Gy6CyCigK1rNVFbc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHhQU4H+k4KC6+6ei6wPRGsuE59f+mTvndFXWUzJznEYN6kTOFFTWTtMu4Nn27TXm
	 q+/WeS7X2H88i4SbUxWvaKs1nZr8kAvI0y19MHKbeu7FQ2lM8o9LjD6yc9DgjeI3PD
	 Zug9PkE30wYbS/HTuKaMrD4Jo+H5thMTFgShsKmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C62F80137;
	Wed, 20 Jan 2021 09:27:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BBD8F8016E; Wed, 20 Jan 2021 09:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC58F80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC58F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bJwPf9d1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611131211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I4y89ik/UngdXYNn2FDQ7MTqEan/5XQq9vDk0CRgKXQ=;
 b=bJwPf9d1cANNMEjuTW3pbz9ITqG2fPn6QtgH3FB/9yYzM63Zu2K6WYaDR4HVhF2vDKYVUO
 Bpa77HYLYGXz0oDtz8upQUytC9T94eyNFUwYl5TGwyzfyVv7JF1HMBYq+4nTqFVj2impRi
 SyUzY0Yneo1raFje05c+CA8sEwkzDdU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-79WcAiDvNPmMWbFQgQl2xw-1; Wed, 20 Jan 2021 03:26:48 -0500
X-MC-Unique: 79WcAiDvNPmMWbFQgQl2xw-1
Received: by mail-wr1-f69.google.com with SMTP id u29so11114281wru.6
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I4y89ik/UngdXYNn2FDQ7MTqEan/5XQq9vDk0CRgKXQ=;
 b=L2ri8Lbw/c3GIuwSKPicDUinbiEVNOy4xgd2RzV0yx1Yz57AQhjtVWx+9npNnojsrK
 UQX2OhLkUM8n8O2xcMkek4lneFYzBWks8N/nZTYLr0MO1QNarF4IvZiHMkt7XX2i3aHz
 Hb14Kb2ns2+IB4LxCF19cKvCDVwQqCRQu9Xx8fvNAiljSHdheNJrEOvyLDLSu3FSxEm6
 ti+U2I24g9HjZMxu5HeEZxIhbwdQGYnggt6E7UCHJlQvH6kXWaRsc7BdPD1rhYDig6pM
 o0XkfQxSIWRiCFXANp1foW5oKB4JwUza6WxFBDqOBkKAYeZBmnaifcOxt05NUn1GgH9D
 WHFw==
X-Gm-Message-State: AOAM532BLhv+ZiW2h5bDVp87dFVKzmtkixgFFIKNDqafDb8yYTey89uB
 SqKiI6UxgsTzHltcKBooYTO87BlMy3ePKkyEjiojm/ckqUMxl1ajEsYQ/m18uThUEzW1eaIcLrx
 nnOWisxRG8g4jrHZxcdUxzwc=
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr3223881wma.6.1611131206552;
 Wed, 20 Jan 2021 00:26:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK7hsnADs6bi9NqDlqc0qYJeO5Pw0w0UXlg1YGJoYiAW65sS7Dj6MpC+omZi5sn88hjDjonA==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr3223831wma.6.1611131205810;
 Wed, 20 Jan 2021 00:26:45 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id t4sm2538540wru.66.2021.01.20.00.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:26:44 -0800 (PST)
Date: Wed, 20 Jan 2021 03:26:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH 3/7] ALSA: virtio: add virtio sound driver
Message-ID: <20210120032319-mutt-send-email-mst@kernel.org>
References: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
 <20210120003638.3339987-4-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20210120003638.3339987-4-anton.yakovlev@opensynergy.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Jan 20, 2021 at 01:36:31AM +0100, Anton Yakovlev wrote:
> Introduce skeleton of the virtio sound driver. The driver implements
> the virtio sound device specification, which has become part of the
> virtio standard.
> 
> Initial initialization of the device, virtqueues and creation of an
> empty ALSA sound device. Also, handling DEVICE_NEEDS_RESET device
> status.
> 
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> ---
>  MAINTAINERS                   |   2 +
>  sound/Kconfig                 |   2 +
>  sound/Makefile                |   3 +-
>  sound/virtio/Kconfig          |  10 +
>  sound/virtio/Makefile         |   9 +
>  sound/virtio/virtio_card.c    | 473 ++++++++++++++++++++++++++++++
>  sound/virtio/virtio_card.h    |  92 ++++++
>  sound/virtio/virtio_ctl_msg.c | 293 +++++++++++++++++++
>  sound/virtio/virtio_ctl_msg.h | 122 ++++++++
>  sound/virtio/virtio_pcm.c     | 536 ++++++++++++++++++++++++++++++++++
>  sound/virtio/virtio_pcm.h     |  89 ++++++
>  11 files changed, 1630 insertions(+), 1 deletion(-)
>  create mode 100644 sound/virtio/Kconfig
>  create mode 100644 sound/virtio/Makefile
>  create mode 100644 sound/virtio/virtio_card.c
>  create mode 100644 sound/virtio/virtio_card.h
>  create mode 100644 sound/virtio/virtio_ctl_msg.c
>  create mode 100644 sound/virtio/virtio_ctl_msg.h
>  create mode 100644 sound/virtio/virtio_pcm.c
>  create mode 100644 sound/virtio/virtio_pcm.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dfd59eafe82..8a0e9f04402f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18939,8 +18939,10 @@ F:	include/uapi/linux/virtio_mem.h
>  VIRTIO SOUND DRIVER
>  M:	Anton Yakovlev <anton.yakovlev@opensynergy.com>
>  L:	virtualization@lists.linux-foundation.org
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	include/uapi/linux/virtio_snd.h
> +F:	sound/virtio/*
>  
>  VIRTUAL BOX GUEST DEVICE DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
> diff --git a/sound/Kconfig b/sound/Kconfig
> index 36785410fbe1..e56d96d2b11c 100644
> --- a/sound/Kconfig
> +++ b/sound/Kconfig
> @@ -99,6 +99,8 @@ source "sound/synth/Kconfig"
>  
>  source "sound/xen/Kconfig"
>  
> +source "sound/virtio/Kconfig"
> +
>  endif # SND
>  
>  endif # !UML
> diff --git a/sound/Makefile b/sound/Makefile
> index 797ecdcd35e2..04ef04b1168f 100644
> --- a/sound/Makefile
> +++ b/sound/Makefile
> @@ -5,7 +5,8 @@
>  obj-$(CONFIG_SOUND) += soundcore.o
>  obj-$(CONFIG_DMASOUND) += oss/dmasound/
>  obj-$(CONFIG_SND) += core/ i2c/ drivers/ isa/ pci/ ppc/ arm/ sh/ synth/ usb/ \
> -	firewire/ sparc/ spi/ parisc/ pcmcia/ mips/ soc/ atmel/ hda/ x86/ xen/
> +	firewire/ sparc/ spi/ parisc/ pcmcia/ mips/ soc/ atmel/ hda/ x86/ xen/ \
> +	virtio/
>  obj-$(CONFIG_SND_AOA) += aoa/
>  
>  # This one must be compilable even if sound is configured out
> diff --git a/sound/virtio/Kconfig b/sound/virtio/Kconfig
> new file mode 100644
> index 000000000000..094cba24ee5b
> --- /dev/null
> +++ b/sound/virtio/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# Sound card driver for virtio
> +
> +config SND_VIRTIO
> +	tristate "Virtio sound driver"
> +	depends on VIRTIO
> +	select SND_PCM
> +	select SND_JACK
> +	help
> +          This is the virtual sound driver for virtio. Say Y or M.
> diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
> new file mode 100644
> index 000000000000..69162a545a41
> --- /dev/null
> +++ b/sound/virtio/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
> +
> +virtio_snd-objs := \
> +	virtio_card.o \
> +	virtio_ctl_msg.o \
> +	virtio_pcm.o
> +
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> new file mode 100644
> index 000000000000..293d497f24e7
> --- /dev/null
> +++ b/sound/virtio/virtio_card.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/virtio_config.h>
> +#include <sound/initval.h>
> +#include <uapi/linux/virtio_ids.h>
> +
> +#include "virtio_card.h"
> +
> +int msg_timeout_ms = MSEC_PER_SEC;
> +module_param(msg_timeout_ms, int, 0644);
> +MODULE_PARM_DESC(msg_timeout_ms, "Message completion timeout in milliseconds");
> +
> +static int virtsnd_probe(struct virtio_device *vdev);
> +static void virtsnd_remove(struct virtio_device *vdev);
> +
> +/**
> + * virtsnd_event_send() - Add an event to the event queue.
> + * @vqueue: Underlying event virtqueue.
> + * @event: Event.
> + * @notify: Indicates whether or not to send a notification to the device.
> + * @gfp: Kernel flags for memory allocation.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_event_send(struct virtqueue *vqueue,
> +			      struct virtio_snd_event *event, bool notify,
> +			      gfp_t gfp)
> +{
> +	struct scatterlist sg;
> +	struct scatterlist *psgs[1] = { &sg };
> +	int rc;
> +
> +	/* reset event content */
> +	memset(event, 0, sizeof(*event));
> +
> +	sg_init_one(&sg, event, sizeof(*event));
> +
> +	rc = virtqueue_add_sgs(vqueue, psgs, 0, 1, event, gfp);
> +	if (rc)
> +		return rc;
> +
> +	if (notify)
> +		if (virtqueue_kick_prepare(vqueue))
> +			if (!virtqueue_notify(vqueue))
> +				return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
> + * @vqueue: Underlying event virtqueue.
> + *
> + * This callback function is called upon a vring interrupt request from the
> + * device.
> + *
> + * Context: Interrupt context.
> + */
> +static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
> +{
> +	struct virtio_snd *snd = vqueue->vdev->priv;
> +	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	while (queue->vqueue) {
> +		virtqueue_disable_cb(queue->vqueue);
> +
> +		for (;;) {
> +			struct virtio_snd_event *event;
> +			u32 length;
> +
> +			event = virtqueue_get_buf(queue->vqueue, &length);
> +			if (!event)
> +				break;
> +
> +			switch (le32_to_cpu(event->hdr.code)) {
> +			case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
> +			case VIRTIO_SND_EVT_PCM_XRUN: {
> +				virtsnd_pcm_event(snd, event);
> +				break;
> +			}
> +			default: {
> +				break;
> +			}
> +			}
> +
> +			virtsnd_event_send(queue->vqueue, event, true,
> +					   GFP_ATOMIC);
> +		}
> +
> +		if (unlikely(virtqueue_is_broken(queue->vqueue)))
> +			break;
> +
> +		if (virtqueue_enable_cb(queue->vqueue))
> +			break;
> +	}
> +	spin_unlock_irqrestore(&queue->lock, flags);
> +}
> +
> +/**
> + * virtsnd_find_vqs() - Enumerate and initialize all virtqueues.
> + * @snd: VirtIO sound device.
> + *
> + * After calling this function, interrupts are allowed only for the control
> + * queue, all other queues are disabled.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_find_vqs(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = { 0 };
> +	const char *names[VIRTIO_SND_VQ_MAX] = {
> +		[VIRTIO_SND_VQ_CONTROL] = "virtsnd-ctl",
> +		[VIRTIO_SND_VQ_EVENT] = "virtsnd-event",
> +		[VIRTIO_SND_VQ_TX] = "virtsnd-tx",
> +		[VIRTIO_SND_VQ_RX] = "virtsnd-rx"
> +	};
> +	struct virtqueue *vqs[VIRTIO_SND_VQ_MAX] = { 0 };
> +	unsigned int i;
> +	unsigned int n = 0;
> +	int rc;
> +
> +	callbacks[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb;
> +	callbacks[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb;
> +
> +	rc = virtio_find_vqs(vdev, VIRTIO_SND_VQ_MAX, vqs, callbacks, names,
> +			     NULL);
> +	if (rc) {
> +		dev_err(&vdev->dev, "failed to initialize virtqueues\n");
> +		return rc;
> +	}
> +
> +	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
> +		/*
> +		 * By default, disable callbacks for all queues except the
> +		 * control queue, since the device must be fully initialized
> +		 * first.
> +		 */
> +		if (i != VIRTIO_SND_VQ_CONTROL)
> +			virtqueue_disable_cb(vqs[i]);
> +
> +		snd->queues[i].vqueue = vqs[i];
> +	}
> +
> +	/* Allocate events and populate the event queue */
> +	n = virtqueue_get_vring_size(vqs[VIRTIO_SND_VQ_EVENT]);
> +
> +	snd->event_msgs = devm_kcalloc(&vdev->dev, n, sizeof(*snd->event_msgs),
> +				       GFP_KERNEL);
> +	if (!snd->event_msgs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n; ++i) {
> +		rc = virtsnd_event_send(vqs[VIRTIO_SND_VQ_EVENT],
> +					&snd->event_msgs[i], false, GFP_KERNEL);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_enable_vqs() - Enable the event, tx and rx virtqueues.
> + * @snd: VirtIO sound device.
> + *
> + * Context: Any context.
> + */
> +static void virtsnd_enable_vqs(struct virtio_snd *snd)
> +{
> +	struct virtqueue *vqueue;
> +
> +	vqueue = snd->queues[VIRTIO_SND_VQ_EVENT].vqueue;
> +	if (!virtqueue_enable_cb(vqueue))
> +		virtsnd_event_notify_cb(vqueue);
> +}
> +
> +/**
> + * virtsnd_disable_vqs() - Disable all virtqueues.
> + * @snd: VirtIO sound device.
> + *
> + * Also free all allocated events and control messages.
> + *
> + * Context: Any context.
> + */
> +static void virtsnd_disable_vqs(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	unsigned int i;
> +	unsigned long flags;
> +
> +	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
> +		struct virtio_snd_queue *queue = &snd->queues[i];
> +
> +		spin_lock_irqsave(&queue->lock, flags);
> +		/* Prohibit the use of the queue */
> +		if (queue->vqueue)
> +			virtqueue_disable_cb(queue->vqueue);
> +		queue->vqueue = NULL;
> +		/* Cancel all pending requests for the control queue */
> +		if (i == VIRTIO_SND_VQ_CONTROL) {
> +			struct virtio_snd_msg *msg;
> +			struct virtio_snd_msg *next;
> +
> +			list_for_each_entry_safe(msg, next, &snd->ctl_msgs,
> +						 list)
> +				virtsnd_ctl_msg_complete(snd, msg);
> +		}
> +		spin_unlock_irqrestore(&queue->lock, flags);
> +	}
> +
> +	if (snd->event_msgs)
> +		devm_kfree(&vdev->dev, snd->event_msgs);
> +
> +	snd->event_msgs = NULL;
> +}
> +
> +/**
> + * virtsnd_reset_fn() - Kernel worker's function to reset the device.
> + * @work: Reset device work.
> + *
> + * Context: Process context.
> + */
> +static void virtsnd_reset_fn(struct work_struct *work)
> +{
> +	struct virtio_snd *snd =
> +		container_of(work, struct virtio_snd, reset_work);
> +	struct virtio_device *vdev = snd->vdev;
> +	struct device *dev = &vdev->dev;
> +	int rc;
> +
> +	dev_info(dev, "sound device needs reset\n");
> +
> +	/*
> +	 * It seems that the only way to properly reset the device is to remove
> +	 * and re-create the ALSA sound card device.
> +	 */
> +	virtsnd_remove(vdev);
> +
> +	rc = virtsnd_probe(vdev);
> +	if (rc)
> +		dev_err(dev, "re-probe() failed: %d\n", rc);
> +}
> +
> +/**
> + * virtsnd_build_devs() - Read configuration and build ALSA devices.
> + * @snd: VirtIO sound device.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_build_devs(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	int rc;
> +
> +	rc = snd_card_new(&vdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
> +			  THIS_MODULE, 0, &snd->card);
> +	if (rc < 0)
> +		return rc;
> +
> +	snd->card->private_data = snd;
> +
> +	strscpy(snd->card->id, "viosnd", sizeof(snd->card->id));
> +	strscpy(snd->card->driver, "virtio_snd", sizeof(snd->card->driver));
> +	strscpy(snd->card->shortname, "VIOSND", sizeof(snd->card->shortname));
> +	strscpy(snd->card->longname, "VirtIO Sound Card",
> +		sizeof(snd->card->longname));
> +
> +	rc = virtsnd_pcm_parse_cfg(snd);
> +	if (rc)
> +		return rc;
> +
> +	if (snd->nsubstreams) {
> +		rc = virtsnd_pcm_build_devs(snd);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return snd_card_register(snd->card);
> +}
> +
> +/**
> + * virtsnd_validate() - Validate if the device can be started.
> + * @vdev: VirtIO parent device.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -EINVAL on failure.
> + */
> +static int virtsnd_validate(struct virtio_device *vdev)
> +{
> +	if (!vdev->config->get) {
> +		dev_err(&vdev->dev, "configuration access disabled\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!msg_timeout_ms) {
> +		dev_err(&vdev->dev, "msg_timeout_ms value cannot be zero\n");
> +		return -EINVAL;
> +	}
> +
> +	if (virtsnd_pcm_validate(vdev))
> +		return -EINVAL;
> +

I think you also need VIRTIO_F_VERSION_1.

> +	return 0;
> +}
> +
> +/**
> + * virtsnd_probe() - Create and initialize the device.
> + * @vdev: VirtIO parent device.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_probe(struct virtio_device *vdev)
> +{
> +	struct virtio_snd *snd;
> +	unsigned int i;
> +	int rc;
> +
> +	snd = devm_kzalloc(&vdev->dev, sizeof(*snd), GFP_KERNEL);
> +	if (!snd)
> +		return -ENOMEM;
> +
> +	snd->vdev = vdev;
> +	INIT_WORK(&snd->reset_work, virtsnd_reset_fn);
> +	INIT_LIST_HEAD(&snd->ctl_msgs);
> +	INIT_LIST_HEAD(&snd->pcm_list);
> +
> +	vdev->priv = snd;
> +
> +	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
> +		spin_lock_init(&snd->queues[i].lock);
> +
> +	rc = virtsnd_find_vqs(snd);
> +	if (rc)
> +		goto on_failure;
> +
> +	virtio_device_ready(vdev);
> +
> +	rc = virtsnd_build_devs(snd);
> +	if (rc)
> +		goto on_failure;
> +
> +	virtsnd_enable_vqs(snd);


Shouldn't virtsnd_enable_vqs happen first?
Looks like after virtsnd_build_devs Linux can already
try to make noise ...

> +
> +on_failure:
> +	if (rc)
> +		virtsnd_remove(vdev);
> +
> +	return rc;
> +}
> +
> +/**
> + * virtsnd_remove() - Remove VirtIO and ALSA devices.
> + * @vdev: VirtIO parent device.
> + *
> + * Context: Any context that permits to sleep.
> + */
> +static void virtsnd_remove(struct virtio_device *vdev)
> +{
> +	struct virtio_snd *snd = vdev->priv;
> +	struct virtio_pcm *pcm;
> +	struct virtio_pcm *pcm_next;
> +
> +	if (!snd)
> +		return;
> +
> +	virtsnd_disable_vqs(snd);

Here Linux can still try to use the device, so all
the cleanup we are doing is too early?

> +
> +	if (snd->card)
> +		snd_card_free(snd->card);
> +
> +	vdev->config->reset(vdev);
> +	vdev->config->del_vqs(vdev);
> +
> +	list_for_each_entry_safe(pcm, pcm_next, &snd->pcm_list, list) {
> +		unsigned int i;
> +
> +		list_del(&pcm->list);
> +
> +		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
> +			struct virtio_pcm_stream *stream = &pcm->streams[i];
> +
> +			if (stream->substreams)
> +				devm_kfree(&vdev->dev, stream->substreams);
> +		}
> +
> +		devm_kfree(&vdev->dev, pcm);
> +	}
> +
> +	if (snd->substreams)
> +		devm_kfree(&vdev->dev, snd->substreams);
> +
> +	devm_kfree(&vdev->dev, snd);
> +
> +	vdev->priv = NULL;
> +}
> +
> +/**
> + * virtsnd_config_changed() - Handle configuration change notification.
> + * @vdev: VirtIO parent device.
> + *
> + * This callback function is called upon a configuration change interrupt
> + * request from the device. Currently only used to handle NEEDS_RESET device
> + * status.
> + *
> + * Context: Interrupt context.
> + */
> +static void virtsnd_config_changed(struct virtio_device *vdev)
> +{
> +	struct virtio_snd *snd = vdev->priv;
> +	unsigned int status = vdev->config->get_status(vdev);
> +
> +	if (status & VIRTIO_CONFIG_S_NEEDS_RESET)
> +		schedule_work(&snd->reset_work);
> +	else
> +		dev_warn(&vdev->dev,
> +			 "sound device configuration was changed\n");
> +}
> +
> +static const struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_SOUND, VIRTIO_DEV_ANY_ID },
> +	{ 0 },
> +};
> +
> +static struct virtio_driver virtsnd_driver = {
> +	.driver.name = KBUILD_MODNAME,
> +	.driver.owner = THIS_MODULE,
> +	.id_table = id_table,
> +	.validate = virtsnd_validate,
> +	.probe = virtsnd_probe,
> +	.remove = virtsnd_remove,
> +	.config_changed = virtsnd_config_changed,
> +};
> +
> +static int __init init(void)
> +{
> +	return register_virtio_driver(&virtsnd_driver);
> +}
> +module_init(init);
> +
> +static void __exit fini(void)
> +{
> +	unregister_virtio_driver(&virtsnd_driver);
> +}
> +module_exit(fini);
> +
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +MODULE_DESCRIPTION("Virtio sound card driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
> new file mode 100644
> index 000000000000..be6651a6aaf8
> --- /dev/null
> +++ b/sound/virtio/virtio_card.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef VIRTIO_SND_CARD_H
> +#define VIRTIO_SND_CARD_H
> +
> +#include <linux/virtio.h>
> +#include <sound/core.h>
> +#include <uapi/linux/virtio_snd.h>
> +
> +#include "virtio_ctl_msg.h"
> +#include "virtio_pcm.h"
> +
> +struct virtio_pcm_substream;
> +
> +/**
> + * struct virtio_snd_queue - Virtqueue wrapper structure.
> + * @lock: Used to synchronize access to a virtqueue.
> + * @vqueue: Underlying virtqueue.
> + */
> +struct virtio_snd_queue {
> +	spinlock_t lock;
> +	struct virtqueue *vqueue;
> +};
> +
> +/**
> + * struct virtio_snd - VirtIO sound card device.
> + * @vdev: Underlying virtio device.
> + * @queues: Virtqueue wrappers.
> + * @reset_work: Reset device work.
> + * @card: ALSA sound card.
> + * @ctl_msgs: Pending control request list.
> + * @event_msgs: Device events.
> + * @pcm_list: VirtIO PCM device list.
> + * @substreams: VirtIO PCM substreams.
> + * @nsubstreams: Number of PCM substreams.
> + */
> +struct virtio_snd {
> +	struct virtio_device *vdev;
> +	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
> +	struct work_struct reset_work;
> +	struct snd_card *card;
> +	struct list_head ctl_msgs;
> +	struct virtio_snd_event *event_msgs;
> +	struct list_head pcm_list;
> +	struct virtio_pcm_substream *substreams;
> +	unsigned int nsubstreams;
> +};
> +
> +/* Message completion timeout in milliseconds (module parameter). */
> +extern int msg_timeout_ms;
> +
> +static inline struct virtio_snd_queue *
> +virtsnd_control_queue(struct virtio_snd *snd)
> +{
> +	return &snd->queues[VIRTIO_SND_VQ_CONTROL];
> +}
> +
> +static inline struct virtio_snd_queue *
> +virtsnd_event_queue(struct virtio_snd *snd)
> +{
> +	return &snd->queues[VIRTIO_SND_VQ_EVENT];
> +}
> +
> +static inline struct virtio_snd_queue *
> +virtsnd_tx_queue(struct virtio_snd *snd)
> +{
> +	return &snd->queues[VIRTIO_SND_VQ_TX];
> +}
> +
> +static inline struct virtio_snd_queue *
> +virtsnd_rx_queue(struct virtio_snd *snd)
> +{
> +	return &snd->queues[VIRTIO_SND_VQ_RX];
> +}
> +
> +#endif /* VIRTIO_SND_CARD_H */
> diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
> new file mode 100644
> index 000000000000..c1701756bc32
> --- /dev/null
> +++ b/sound/virtio/virtio_ctl_msg.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/moduleparam.h>
> +#include <linux/virtio_config.h>
> +
> +#include "virtio_card.h"
> +#include "virtio_ctl_msg.h"
> +
> +/**
> + * virtsnd_ctl_msg_alloc_ext() - Allocate and initialize a control message.
> + * @vdev: VirtIO parent device.
> + * @request_size: Size of request header (pointed to by sg_request field).
> + * @response_size: Size of response header (pointed to by sg_response field).
> + * @sgs: Additional data to attach to the message (may be NULL).
> + * @out_sgs: Number of scattergather elements to attach to the request header.
> + * @in_sgs: Number of scattergather elements to attach to the response header.
> + * @gfp: Kernel flags for memory allocation.
> + *
> + * The message will be automatically freed when the ref_count value is 0.
> + *
> + * Context: Any context. May sleep if @gfp flags permit.
> + * Return: Allocated message on success, ERR_PTR(-errno) on failure.
> + */
> +struct virtio_snd_msg *virtsnd_ctl_msg_alloc_ext(struct virtio_device *vdev,
> +						 size_t request_size,
> +						 size_t response_size,
> +						 struct scatterlist *sgs,
> +						 unsigned int out_sgs,
> +						 unsigned int in_sgs, gfp_t gfp)
> +{
> +	struct virtio_snd_msg *msg;
> +	size_t msg_size =
> +		sizeof(*msg) + (1 + out_sgs + 1 + in_sgs) * sizeof(*msg->sgs);
> +	unsigned int i;
> +
> +	msg = devm_kzalloc(&vdev->dev, msg_size + request_size + response_size,
> +			   gfp);
> +	if (!msg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sg_init_one(&msg->sg_request, (u8 *)msg + msg_size, request_size);
> +	sg_init_one(&msg->sg_response, (u8 *)msg + msg_size + request_size,
> +		    response_size);
> +
> +	INIT_LIST_HEAD(&msg->list);
> +	init_completion(&msg->notify);
> +	atomic_set(&msg->ref_count, 1);
> +
> +	msg->sgs[msg->out_sgs++] = &msg->sg_request;
> +	if (sgs)
> +		for (i = 0; i < out_sgs; ++i)
> +			msg->sgs[msg->out_sgs++] = &sgs[i];
> +
> +	msg->sgs[msg->out_sgs + msg->in_sgs++] = &msg->sg_response;
> +	if (sgs)
> +		for (i = out_sgs; i < out_sgs + in_sgs; ++i)
> +			msg->sgs[msg->out_sgs + msg->in_sgs++] = &sgs[i];
> +
> +	return msg;
> +}
> +
> +/**
> + * virtsnd_ctl_msg_send() - Send an (asynchronous) control message.
> + * @snd: VirtIO sound device.
> + * @msg: Control message.
> + *
> + * If a message is failed to be enqueued, it will be deleted. If message content
> + * is still needed, the caller must additionally to virtsnd_ctl_msg_ref/unref()
> + * it.
> + *
> + * Context: Any context. Takes and releases the control queue spinlock.
> + * Return: 0 on success, -errno on failure.
> + */
> +int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
> +	struct virtio_snd_hdr *response = sg_virt(&msg->sg_response);
> +	bool notify = false;
> +	unsigned long flags;
> +	int rc = -EIO;
> +
> +	/* Set the default status in case the message was not sent or was
> +	 * canceled.
> +	 */
> +	response->code = cpu_to_virtio32(vdev, VIRTIO_SND_S_IO_ERR);
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	if (queue->vqueue) {
> +		rc = virtqueue_add_sgs(queue->vqueue, msg->sgs, msg->out_sgs,
> +				       msg->in_sgs, msg, GFP_ATOMIC);
> +		if (!rc) {
> +			notify = virtqueue_kick_prepare(queue->vqueue);
> +			list_add_tail(&msg->list, &snd->ctl_msgs);
> +		}
> +	}
> +	spin_unlock_irqrestore(&queue->lock, flags);
> +
> +	if (!rc) {
> +		if (!notify || virtqueue_notify(queue->vqueue))
> +			return 0;
> +
> +		spin_lock_irqsave(&queue->lock, flags);
> +		list_del(&msg->list);
> +		spin_unlock_irqrestore(&queue->lock, flags);
> +	}
> +
> +	virtsnd_ctl_msg_unref(snd->vdev, msg);
> +
> +	return -EIO;
> +}
> +
> +/**
> + * virtsnd_ctl_msg_send_sync() - Send a (synchronous) control message.
> + * @snd: VirtIO sound device.
> + * @msg: Control message.
> + *
> + * After returning from this function, the message will be deleted. If message
> + * content is still needed, the caller must additionally to
> + * virtsnd_ctl_msg_ref/unref() it.
> + *
> + * The msg_timeout_ms module parameter defines the message completion timeout.
> + * If the message is not completed within this time, the function will return an
> + * error.
> + *
> + * Context: Any context. Takes and releases the control queue spinlock.
> + * Return: 0 on success, -errno on failure.
> + *
> + * The return value is a message status code (VIRTIO_SND_S_XXX) converted to an
> + * appropriate -errno value.
> + */
> +int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
> +			      struct virtio_snd_msg *msg)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	unsigned int js = msecs_to_jiffies(msg_timeout_ms);
> +	struct virtio_snd_hdr *response;
> +	int rc;
> +
> +	virtsnd_ctl_msg_ref(vdev, msg);
> +
> +	rc = virtsnd_ctl_msg_send(snd, msg);
> +	if (rc)
> +		goto on_failure;
> +
> +	rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
> +	if (rc <= 0) {
> +		if (!rc) {
> +			struct virtio_snd_hdr *request =
> +				sg_virt(&msg->sg_request);
> +
> +			dev_err(&vdev->dev,
> +				"control message (0x%08x) timeout\n",
> +				le32_to_cpu(request->code));
> +			rc = -EIO;
> +		}
> +
> +		goto on_failure;
> +	}
> +
> +	response = sg_virt(&msg->sg_response);
> +
> +	switch (le32_to_cpu(response->code)) {
> +	case VIRTIO_SND_S_OK:
> +		rc = 0;
> +		break;
> +	case VIRTIO_SND_S_BAD_MSG:
> +		rc = -EINVAL;
> +		break;
> +	case VIRTIO_SND_S_NOT_SUPP:
> +		rc = -EOPNOTSUPP;
> +		break;
> +	case VIRTIO_SND_S_IO_ERR:
> +		rc = -EIO;
> +		break;
> +	default:
> +		rc = -EPERM;
> +		break;
> +	}
> +
> +on_failure:
> +	virtsnd_ctl_msg_unref(vdev, msg);
> +
> +	return rc;
> +}
> +
> +/**
> + * virtsnd_ctl_msg_complete() - Complete a control message.
> + * @snd: VirtIO sound device.
> + * @msg: Control message.
> + *
> + * Context: Any context.
> + */
> +void virtsnd_ctl_msg_complete(struct virtio_snd *snd,
> +			      struct virtio_snd_msg *msg)
> +{
> +	list_del(&msg->list);
> +	complete(&msg->notify);
> +
> +	virtsnd_ctl_msg_unref(snd->vdev, msg);
> +}
> +
> +/**
> + * virtsnd_ctl_query_info() - Query the item configuration from the device.
> + * @snd: VirtIO sound device.
> + * @command: Control request code (VIRTIO_SND_R_XXX_INFO).
> + * @start_id: Item start identifier.
> + * @count: Item count to query.
> + * @size: Item information size in bytes.
> + * @info: Buffer for storing item information.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
> +			   int count, size_t size, void *info)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_snd_msg *msg;
> +	struct virtio_snd_query_info *query;
> +	struct scatterlist sg;
> +
> +	sg_init_one(&sg, info, count * size);
> +
> +	msg = virtsnd_ctl_msg_alloc_ext(vdev, sizeof(*query),
> +					sizeof(struct virtio_snd_hdr), &sg, 0,
> +					1, GFP_KERNEL);
> +	if (IS_ERR(msg))
> +		return PTR_ERR(msg);
> +
> +	query = sg_virt(&msg->sg_request);
> +	query->hdr.code = cpu_to_virtio32(vdev, command);
> +	query->start_id = cpu_to_virtio32(vdev, start_id);
> +	query->count = cpu_to_virtio32(vdev, count);
> +	query->size = cpu_to_virtio32(vdev, size);
> +
> +	return virtsnd_ctl_msg_send_sync(snd, msg);
> +}
> +
> +/**
> + * virtsnd_ctl_notify_cb() - Process all completed control messages.
> + * @vqueue: Underlying control virtqueue.
> + *
> + * This callback function is called upon a vring interrupt request from the
> + * device.
> + *
> + * Context: Interrupt context. Takes and releases the control queue spinlock.
> + */
> +void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
> +{
> +	struct virtio_snd *snd = vqueue->vdev->priv;
> +	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	while (queue->vqueue) {
> +		virtqueue_disable_cb(queue->vqueue);
> +
> +		for (;;) {
> +			struct virtio_snd_msg *msg;
> +			u32 length;
> +
> +			msg = virtqueue_get_buf(queue->vqueue, &length);
> +			if (!msg)
> +				break;
> +
> +			virtsnd_ctl_msg_complete(snd, msg);
> +		}
> +
> +		if (unlikely(virtqueue_is_broken(queue->vqueue)))
> +			break;
> +
> +		if (virtqueue_enable_cb(queue->vqueue))
> +			break;
> +	}
> +	spin_unlock_irqrestore(&queue->lock, flags);
> +}
> diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
> new file mode 100644
> index 000000000000..0f8de8f2fd2d
> --- /dev/null
> +++ b/sound/virtio/virtio_ctl_msg.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef VIRTIO_SND_MSG_H
> +#define VIRTIO_SND_MSG_H
> +
> +#include <linux/atomic.h>
> +#include <linux/virtio.h>
> +
> +struct virtio_snd;
> +
> +/**
> + * struct virtio_snd_msg - Control message.
> + * @sg_request: Scattergather element containing a device request (header).
> + * @sg_response: Scattergather element containing a device response (status).
> + * @list: Pending message list entry.
> + * @notify: Request completed notification.
> + * @ref_count: Reference count used to manage a message lifetime.
> + * @out_sgs: Number of read-only sg elements in the sgs array.
> + * @in_sgs: Number of write-only sg elements in the sgs array.
> + * @sgs: Array of sg elements to add to the control virtqueue.
> + */
> +struct virtio_snd_msg {
> +/* public: */
> +	struct scatterlist sg_request;
> +	struct scatterlist sg_response;
> +/* private: internal use only */
> +	struct list_head list;
> +	struct completion notify;
> +	atomic_t ref_count;
> +	unsigned int out_sgs;
> +	unsigned int in_sgs;
> +	struct scatterlist *sgs[0];
> +};
> +
> +/**
> + * virtsnd_ctl_msg_ref() - Increment reference counter for the message.
> + * @vdev: VirtIO parent device.
> + * @msg: Control message.
> + *
> + * Context: Any context.
> + */
> +static inline void virtsnd_ctl_msg_ref(struct virtio_device *vdev,
> +				       struct virtio_snd_msg *msg)
> +{
> +	atomic_inc(&msg->ref_count);
> +}
> +
> +/**
> + * virtsnd_ctl_msg_unref() - Decrement reference counter for the message.
> + * @vdev: VirtIO parent device.
> + * @msg: Control message.
> + *
> + * The message will be freed when the ref_count value is 0.
> + *
> + * Context: Any context.
> + */
> +static inline void virtsnd_ctl_msg_unref(struct virtio_device *vdev,
> +					 struct virtio_snd_msg *msg)
> +{
> +	if (!atomic_dec_return(&msg->ref_count))
> +		devm_kfree(&vdev->dev, msg);
> +}
> +
> +struct virtio_snd_msg *virtsnd_ctl_msg_alloc_ext(struct virtio_device *vdev,
> +						 size_t request_size,
> +						 size_t response_size,
> +						 struct scatterlist *sgs,
> +						 unsigned int out_sgs,
> +						 unsigned int in_sgs,
> +						 gfp_t gfp);
> +
> +/**
> + * virtsnd_ctl_msg_alloc() - Simplified control message allocation.
> + * @vdev: VirtIO parent device.
> + * @request_size: Size of request header (pointed to by sg_request field).
> + * @response_size: Size of response header (pointed to by sg_response field).
> + * @gfp: Kernel flags for memory allocation.
> + *
> + * The message will be automatically freed when the ref_count value is 0.
> + *
> + * Context: Any context. May sleep if @gfp flags permit.
> + * Return: Allocated message on success, ERR_PTR(-errno) on failure.
> + */
> +static inline
> +struct virtio_snd_msg *virtsnd_ctl_msg_alloc(struct virtio_device *vdev,
> +					     size_t request_size,
> +					     size_t response_size, gfp_t gfp)
> +{
> +	return virtsnd_ctl_msg_alloc_ext(vdev, request_size, response_size,
> +					 NULL, 0, 0, gfp);
> +}
> +
> +int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg);
> +
> +int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
> +			      struct virtio_snd_msg *msg);
> +
> +void virtsnd_ctl_msg_complete(struct virtio_snd *snd,
> +			      struct virtio_snd_msg *msg);
> +
> +int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
> +			   int count, size_t size, void *info);
> +
> +void virtsnd_ctl_notify_cb(struct virtqueue *vqueue);
> +
> +#endif /* VIRTIO_SND_MSG_H */
> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> new file mode 100644
> index 000000000000..036990b7b78a
> --- /dev/null
> +++ b/sound/virtio/virtio_pcm.c
> @@ -0,0 +1,536 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/moduleparam.h>
> +#include <linux/virtio_config.h>
> +
> +#include "virtio_card.h"
> +
> +static unsigned int pcm_buffer_ms = 160;
> +module_param(pcm_buffer_ms, uint, 0644);
> +MODULE_PARM_DESC(pcm_buffer_ms, "PCM substream buffer time in milliseconds");
> +
> +static unsigned int pcm_periods_min = 2;
> +module_param(pcm_periods_min, uint, 0644);
> +MODULE_PARM_DESC(pcm_periods_min, "Minimum number of PCM periods");
> +
> +static unsigned int pcm_periods_max = 16;
> +module_param(pcm_periods_max, uint, 0644);
> +MODULE_PARM_DESC(pcm_periods_max, "Maximum number of PCM periods");
> +
> +static unsigned int pcm_period_ms_min = 10;
> +module_param(pcm_period_ms_min, uint, 0644);
> +MODULE_PARM_DESC(pcm_period_ms_min, "Minimum PCM period time in milliseconds");
> +
> +static unsigned int pcm_period_ms_max = 80;
> +module_param(pcm_period_ms_max, uint, 0644);
> +MODULE_PARM_DESC(pcm_period_ms_max, "Maximum PCM period time in milliseconds");
> +
> +/* Map for converting VirtIO format to ALSA format. */
> +static const unsigned int g_v2a_format_map[] = {
> +	[VIRTIO_SND_PCM_FMT_IMA_ADPCM] = SNDRV_PCM_FORMAT_IMA_ADPCM,
> +	[VIRTIO_SND_PCM_FMT_MU_LAW] = SNDRV_PCM_FORMAT_MU_LAW,
> +	[VIRTIO_SND_PCM_FMT_A_LAW] = SNDRV_PCM_FORMAT_A_LAW,
> +	[VIRTIO_SND_PCM_FMT_S8] = SNDRV_PCM_FORMAT_S8,
> +	[VIRTIO_SND_PCM_FMT_U8] = SNDRV_PCM_FORMAT_U8,
> +	[VIRTIO_SND_PCM_FMT_S16] = SNDRV_PCM_FORMAT_S16_LE,
> +	[VIRTIO_SND_PCM_FMT_U16] = SNDRV_PCM_FORMAT_U16_LE,
> +	[VIRTIO_SND_PCM_FMT_S18_3] = SNDRV_PCM_FORMAT_S18_3LE,
> +	[VIRTIO_SND_PCM_FMT_U18_3] = SNDRV_PCM_FORMAT_U18_3LE,
> +	[VIRTIO_SND_PCM_FMT_S20_3] = SNDRV_PCM_FORMAT_S20_3LE,
> +	[VIRTIO_SND_PCM_FMT_U20_3] = SNDRV_PCM_FORMAT_U20_3LE,
> +	[VIRTIO_SND_PCM_FMT_S24_3] = SNDRV_PCM_FORMAT_S24_3LE,
> +	[VIRTIO_SND_PCM_FMT_U24_3] = SNDRV_PCM_FORMAT_U24_3LE,
> +	[VIRTIO_SND_PCM_FMT_S20] = SNDRV_PCM_FORMAT_S20_LE,
> +	[VIRTIO_SND_PCM_FMT_U20] = SNDRV_PCM_FORMAT_U20_LE,
> +	[VIRTIO_SND_PCM_FMT_S24] = SNDRV_PCM_FORMAT_S24_LE,
> +	[VIRTIO_SND_PCM_FMT_U24] = SNDRV_PCM_FORMAT_U24_LE,
> +	[VIRTIO_SND_PCM_FMT_S32] = SNDRV_PCM_FORMAT_S32_LE,
> +	[VIRTIO_SND_PCM_FMT_U32] = SNDRV_PCM_FORMAT_U32_LE,
> +	[VIRTIO_SND_PCM_FMT_FLOAT] = SNDRV_PCM_FORMAT_FLOAT_LE,
> +	[VIRTIO_SND_PCM_FMT_FLOAT64] = SNDRV_PCM_FORMAT_FLOAT64_LE,
> +	[VIRTIO_SND_PCM_FMT_DSD_U8] = SNDRV_PCM_FORMAT_DSD_U8,
> +	[VIRTIO_SND_PCM_FMT_DSD_U16] = SNDRV_PCM_FORMAT_DSD_U16_LE,
> +	[VIRTIO_SND_PCM_FMT_DSD_U32] = SNDRV_PCM_FORMAT_DSD_U32_LE,
> +	[VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME] =
> +		SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE
> +};
> +
> +/* Map for converting VirtIO frame rate to ALSA frame rate. */
> +struct virtsnd_v2a_rate {
> +	unsigned int alsa_bit;
> +	unsigned int rate;
> +};
> +
> +static const struct virtsnd_v2a_rate g_v2a_rate_map[] = {
> +	[VIRTIO_SND_PCM_RATE_5512] = { SNDRV_PCM_RATE_5512, 5512 },
> +	[VIRTIO_SND_PCM_RATE_8000] = { SNDRV_PCM_RATE_8000, 8000 },
> +	[VIRTIO_SND_PCM_RATE_11025] = { SNDRV_PCM_RATE_11025, 11025 },
> +	[VIRTIO_SND_PCM_RATE_16000] = { SNDRV_PCM_RATE_16000, 16000 },
> +	[VIRTIO_SND_PCM_RATE_22050] = { SNDRV_PCM_RATE_22050, 22050 },
> +	[VIRTIO_SND_PCM_RATE_32000] = { SNDRV_PCM_RATE_32000, 32000 },
> +	[VIRTIO_SND_PCM_RATE_44100] = { SNDRV_PCM_RATE_44100, 44100 },
> +	[VIRTIO_SND_PCM_RATE_48000] = { SNDRV_PCM_RATE_48000, 48000 },
> +	[VIRTIO_SND_PCM_RATE_64000] = { SNDRV_PCM_RATE_64000, 64000 },
> +	[VIRTIO_SND_PCM_RATE_88200] = { SNDRV_PCM_RATE_88200, 88200 },
> +	[VIRTIO_SND_PCM_RATE_96000] = { SNDRV_PCM_RATE_96000, 96000 },
> +	[VIRTIO_SND_PCM_RATE_176400] = { SNDRV_PCM_RATE_176400, 176400 },
> +	[VIRTIO_SND_PCM_RATE_192000] = { SNDRV_PCM_RATE_192000, 192000 }
> +};
> +
> +/**
> + * virtsnd_pcm_build_hw() - Parse substream config and build HW descriptor.
> + * @substream: VirtIO substream.
> + * @info: VirtIO substream information entry.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -EINVAL if configuration is invalid.
> + */
> +static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *substream,
> +				struct virtio_snd_pcm_info *info)
> +{
> +	struct virtio_device *vdev = substream->snd->vdev;
> +	unsigned int i;
> +	u64 values;
> +	size_t sample_max = 0;
> +	size_t sample_min = 0;
> +
> +	substream->features = le32_to_cpu(info->features);
> +
> +	/*
> +	 * TODO: set SNDRV_PCM_INFO_{BATCH,BLOCK_TRANSFER} if device supports
> +	 * only message-based transport.
> +	 */
> +	substream->hw.info =
> +		SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_BATCH |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_INTERLEAVED;
> +
> +	if (!info->channels_min || info->channels_min > info->channels_max) {
> +		dev_err(&vdev->dev,
> +			"SID %u: invalid channel range [%u %u]\n",
> +			substream->sid, info->channels_min, info->channels_max);
> +		return -EINVAL;
> +	}
> +
> +	substream->hw.channels_min = info->channels_min;
> +	substream->hw.channels_max = info->channels_max;
> +
> +	values = le64_to_cpu(info->formats);
> +
> +	substream->hw.formats = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(g_v2a_format_map); ++i)
> +		if (values & (1ULL << i)) {
> +			unsigned int alsa_fmt = g_v2a_format_map[i];
> +			int bytes = snd_pcm_format_physical_width(alsa_fmt) / 8;
> +
> +			if (!sample_min || sample_min > bytes)
> +				sample_min = bytes;
> +
> +			if (sample_max < bytes)
> +				sample_max = bytes;
> +
> +			substream->hw.formats |= (1ULL << alsa_fmt);
> +		}
> +
> +	if (!substream->hw.formats) {
> +		dev_err(&vdev->dev,
> +			"SID %u: no supported PCM sample formats found\n",
> +			substream->sid);
> +		return -EINVAL;
> +	}
> +
> +	values = le64_to_cpu(info->rates);
> +
> +	substream->hw.rates = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(g_v2a_rate_map); ++i)
> +		if (values & (1ULL << i)) {
> +			if (!substream->hw.rate_min ||
> +			    substream->hw.rate_min > g_v2a_rate_map[i].rate)
> +				substream->hw.rate_min = g_v2a_rate_map[i].rate;
> +
> +			if (substream->hw.rate_max < g_v2a_rate_map[i].rate)
> +				substream->hw.rate_max = g_v2a_rate_map[i].rate;
> +
> +			substream->hw.rates |= g_v2a_rate_map[i].alsa_bit;
> +		}
> +
> +	if (!substream->hw.rates) {
> +		dev_err(&vdev->dev,
> +			"SID %u: no supported PCM frame rates found\n",
> +			substream->sid);
> +		return -EINVAL;
> +	}
> +
> +	substream->hw.periods_min = pcm_periods_min;
> +	substream->hw.periods_max = pcm_periods_max;
> +
> +	/*
> +	 * We must ensure that there is enough space in the buffer to store
> +	 * pcm_buffer_ms ms for the combination (Cmax, Smax, Rmax), where:
> +	 *   Cmax = maximum supported number of channels,
> +	 *   Smax = maximum supported sample size in bytes,
> +	 *   Rmax = maximum supported frame rate.
> +	 */
> +	substream->hw.buffer_bytes_max =
> +		sample_max * substream->hw.channels_max * pcm_buffer_ms *
> +		(substream->hw.rate_max / MSEC_PER_SEC);
> +
> +	/* Align the buffer size to the page size */
> +	substream->hw.buffer_bytes_max =
> +		(substream->hw.buffer_bytes_max + PAGE_SIZE - 1) & -PAGE_SIZE;
> +
> +	/*
> +	 * We must ensure that the minimum period size is enough to store
> +	 * pcm_period_ms_min ms for the combination (Cmin, Smin, Rmin), where:
> +	 *   Cmin = minimum supported number of channels,
> +	 *   Smin = minimum supported sample size in bytes,
> +	 *   Rmin = minimum supported frame rate.
> +	 */
> +	substream->hw.period_bytes_min =
> +		sample_min * substream->hw.channels_min * pcm_period_ms_min *
> +		(substream->hw.rate_min / MSEC_PER_SEC);
> +
> +	/*
> +	 * We must ensure that the maximum period size is enough to store
> +	 * pcm_period_ms_max ms for the combination (Cmax, Smax, Rmax).
> +	 */
> +	substream->hw.period_bytes_max =
> +		sample_max * substream->hw.channels_max * pcm_period_ms_max *
> +		(substream->hw.rate_max / MSEC_PER_SEC);
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_prealloc_pages() - Preallocate substream hardware buffer.
> + * @substream: VirtIO substream.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +static int virtsnd_pcm_prealloc_pages(struct virtio_pcm_substream *substream)
> +{
> +	struct snd_pcm_substream *ksubstream = substream->substream;
> +	size_t size = substream->hw.buffer_bytes_max;
> +	struct device *data = snd_dma_continuous_data(GFP_KERNEL);
> +
> +	/*
> +	 * We just allocate a CONTINUOUS buffer as it should work in any setup.
> +	 *
> +	 * If there is a need to use DEV(_XXX), then add this case here and
> +	 * (probably) update the related source code in other places.
> +	 */
> +	snd_pcm_lib_preallocate_pages(ksubstream, SNDRV_DMA_TYPE_CONTINUOUS,
> +				      data, size, size);
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_find() - Find the PCM device for the specified node ID.
> + * @snd: VirtIO sound device.
> + * @nid: Function node ID.
> + *
> + * Context: Any context.
> + * Return: a pointer to the PCM device or ERR_PTR(-ENOENT).
> + */
> +struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid)
> +{
> +	struct virtio_pcm *pcm;
> +
> +	list_for_each_entry(pcm, &snd->pcm_list, list)
> +		if (pcm->nid == nid)
> +			return pcm;
> +
> +	return ERR_PTR(-ENOENT);
> +}
> +
> +/**
> + * virtsnd_pcm_find_or_create() - Find or create the PCM device for the
> + *                                specified node ID.
> + * @snd: VirtIO sound device.
> + * @nid: Function node ID.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: a pointer to the PCM device or ERR_PTR(-errno).
> + */
> +struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
> +					      unsigned int nid)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_pcm *pcm;
> +
> +	pcm = virtsnd_pcm_find(snd, nid);
> +	if (!IS_ERR(pcm))
> +		return pcm;
> +
> +	pcm = devm_kzalloc(&vdev->dev, sizeof(*pcm), GFP_KERNEL);
> +	if (!pcm)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pcm->nid = nid;
> +	list_add_tail(&pcm->list, &snd->pcm_list);
> +
> +	return pcm;
> +}
> +
> +/**
> + * virtsnd_pcm_validate() - Validate if the device can be started.
> + * @vdev: VirtIO parent device.
> + *
> + * Context: Any context.
> + * Return: 0 on success, -EINVAL on failure.
> + */
> +int virtsnd_pcm_validate(struct virtio_device *vdev)
> +{
> +	if (pcm_periods_min < 2 || pcm_periods_min > pcm_periods_max) {
> +		dev_err(&vdev->dev,
> +			"invalid range [%u %u] of the number of PCM periods\n",
> +			pcm_periods_min, pcm_periods_max);
> +		return -EINVAL;
> +	}
> +
> +	if (!pcm_period_ms_min || pcm_period_ms_min > pcm_period_ms_max) {
> +		dev_err(&vdev->dev,
> +			"invalid range [%u %u] of the size of the PCM period\n",
> +			pcm_period_ms_min, pcm_period_ms_max);
> +		return -EINVAL;
> +	}
> +
> +	if (pcm_buffer_ms < pcm_periods_min * pcm_period_ms_min) {
> +		dev_err(&vdev->dev,
> +			"pcm_buffer_ms(=%u) value cannot be < %u ms\n",
> +			pcm_buffer_ms, pcm_periods_min * pcm_period_ms_min);
> +		return -EINVAL;
> +	}
> +
> +	if (pcm_period_ms_max > pcm_buffer_ms / 2) {
> +		dev_err(&vdev->dev,
> +			"pcm_period_ms_max(=%u) value cannot be > %u ms\n",
> +			pcm_period_ms_max, pcm_buffer_ms / 2);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_parse_cfg() - Parse the stream configuration.
> + * @snd: VirtIO sound device.
> + *
> + * This function is called during initial device initialization.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_snd_pcm_info *info;
> +	unsigned int i;
> +	int rc;
> +
> +	virtio_cread(vdev, struct virtio_snd_config, streams,
> +		     &snd->nsubstreams);
> +	if (!snd->nsubstreams)
> +		return 0;
> +
> +	snd->substreams = devm_kcalloc(&vdev->dev, snd->nsubstreams,
> +				       sizeof(*snd->substreams), GFP_KERNEL);
> +	if (!snd->substreams)
> +		return -ENOMEM;
> +
> +	info = devm_kcalloc(&vdev->dev, snd->nsubstreams, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_PCM_INFO, 0,
> +				    snd->nsubstreams, sizeof(*info), info);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < snd->nsubstreams; ++i) {
> +		struct virtio_pcm_substream *substream = &snd->substreams[i];
> +		struct virtio_pcm *pcm;
> +
> +		substream->snd = snd;
> +		substream->sid = i;
> +
> +		rc = virtsnd_pcm_build_hw(substream, &info[i]);
> +		if (rc)
> +			return rc;
> +
> +		substream->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
> +
> +		pcm = virtsnd_pcm_find_or_create(snd, substream->nid);
> +		if (IS_ERR(pcm))
> +			return PTR_ERR(pcm);
> +
> +		switch (info[i].direction) {
> +		case VIRTIO_SND_D_OUTPUT: {
> +			substream->direction = SNDRV_PCM_STREAM_PLAYBACK;
> +			break;
> +		}
> +		case VIRTIO_SND_D_INPUT: {
> +			substream->direction = SNDRV_PCM_STREAM_CAPTURE;
> +			break;
> +		}
> +		default: {
> +			dev_err(&vdev->dev, "SID %u: unknown direction (%u)\n",
> +				substream->sid, info[i].direction);
> +			return -EINVAL;
> +		}
> +		}
> +
> +		pcm->streams[substream->direction].nsubstreams++;
> +	}
> +
> +	devm_kfree(&vdev->dev, info);
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_build_devs() - Build ALSA PCM devices.
> + * @snd: VirtIO sound device.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +int virtsnd_pcm_build_devs(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_pcm *pcm;
> +	unsigned int i;
> +	int rc;
> +
> +	list_for_each_entry(pcm, &snd->pcm_list, list) {
> +		unsigned int npbs =
> +			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].nsubstreams;
> +		unsigned int ncps =
> +			pcm->streams[SNDRV_PCM_STREAM_CAPTURE].nsubstreams;
> +
> +		if (!npbs && !ncps)
> +			continue;
> +
> +		rc = snd_pcm_new(snd->card, "virtio_snd", pcm->nid, npbs, ncps,
> +				 &pcm->pcm);
> +		if (rc) {
> +			dev_err(&vdev->dev, "snd_pcm_new[%u] failed: %d\n",
> +				pcm->nid, rc);
> +			return rc;
> +		}
> +
> +		pcm->pcm->info_flags = 0;
> +		pcm->pcm->dev_class = SNDRV_PCM_CLASS_GENERIC;
> +		pcm->pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
> +		strscpy(pcm->pcm->name, "VirtIO PCM", sizeof(pcm->pcm->name));
> +
> +		pcm->pcm->private_data = pcm;
> +
> +		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
> +			struct virtio_pcm_stream *stream = &pcm->streams[i];
> +
> +			if (!stream->nsubstreams)
> +				continue;
> +
> +			stream->substreams =
> +				devm_kcalloc(&vdev->dev,
> +					     stream->nsubstreams,
> +					     sizeof(*stream->substreams),
> +					     GFP_KERNEL);
> +			if (!stream->substreams)
> +				return -ENOMEM;
> +
> +			stream->nsubstreams = 0;
> +		}
> +	}
> +
> +	for (i = 0; i < snd->nsubstreams; ++i) {
> +		struct virtio_pcm_substream *substream = &snd->substreams[i];
> +		struct virtio_pcm_stream *stream;
> +
> +		pcm = virtsnd_pcm_find(snd, substream->nid);
> +		if (IS_ERR(pcm))
> +			return PTR_ERR(pcm);
> +
> +		stream = &pcm->streams[substream->direction];
> +		stream->substreams[stream->nsubstreams++] = substream;
> +	}
> +
> +	list_for_each_entry(pcm, &snd->pcm_list, list)
> +		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
> +			struct virtio_pcm_stream *stream = &pcm->streams[i];
> +			struct snd_pcm_str *kstream;
> +			struct snd_pcm_substream *ksubstream;
> +
> +			if (!stream->nsubstreams)
> +				continue;
> +
> +			kstream = &pcm->pcm->streams[i];
> +			ksubstream = kstream->substream;
> +
> +			while (ksubstream) {
> +				struct virtio_pcm_substream *substream =
> +					stream->substreams[ksubstream->number];
> +
> +				substream->substream = ksubstream;
> +				ksubstream = ksubstream->next;
> +
> +				rc = virtsnd_pcm_prealloc_pages(substream);
> +				if (rc)
> +					return rc;
> +			}
> +		}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtsnd_pcm_event() - Handle the PCM device event notification.
> + * @snd: VirtIO sound device.
> + * @event: VirtIO sound event.
> + *
> + * Context: Interrupt context.
> + */
> +void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
> +{
> +	struct virtio_pcm_substream *substream;
> +	unsigned int sid = le32_to_cpu(event->data);
> +
> +	if (sid >= snd->nsubstreams)
> +		return;
> +
> +	substream = &snd->substreams[sid];
> +
> +	switch (le32_to_cpu(event->hdr.code)) {
> +	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED: {
> +		/* TODO: deal with shmem elapsed period */
> +		break;
> +	}
> +	case VIRTIO_SND_EVT_PCM_XRUN: {
> +		break;
> +	}
> +	}
> +}
> diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
> new file mode 100644
> index 000000000000..73fb4d9dc524
> --- /dev/null
> +++ b/sound/virtio/virtio_pcm.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Sound card driver for virtio
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef VIRTIO_SND_PCM_H
> +#define VIRTIO_SND_PCM_H
> +
> +#include <linux/atomic.h>
> +#include <linux/virtio_config.h>
> +#include <sound/pcm.h>
> +
> +struct virtio_pcm;
> +
> +/**
> + * struct virtio_pcm_substream - VirtIO PCM substream.
> + * @snd: VirtIO sound device.
> + * @nid: Function group node identifier.
> + * @sid: Stream identifier.
> + * @direction: Stream data flow direction (SNDRV_PCM_STREAM_XXX).
> + * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
> + * @substream: Kernel ALSA substream.
> + * @hw: Kernel ALSA substream hardware descriptor.
> + */
> +struct virtio_pcm_substream {
> +	struct virtio_snd *snd;
> +	unsigned int nid;
> +	unsigned int sid;
> +	u32 direction;
> +	u32 features;
> +	struct snd_pcm_substream *substream;
> +	struct snd_pcm_hardware hw;
> +};
> +
> +/**
> + * struct virtio_pcm_stream - VirtIO PCM stream.
> + * @substreams: Virtio substreams belonging to the stream.
> + * @nsubstreams: Number of substreams.
> + */
> +struct virtio_pcm_stream {
> +	struct virtio_pcm_substream **substreams;
> +	unsigned int nsubstreams;
> +};
> +
> +/**
> + * struct virtio_pcm - VirtIO PCM device.
> + * @list: PCM list entry.
> + * @nid: Function group node identifier.
> + * @pcm: Kernel PCM device.
> + * @streams: VirtIO PCM streams (playback and capture).
> + */
> +struct virtio_pcm {
> +	struct list_head list;
> +	unsigned int nid;
> +	struct snd_pcm *pcm;
> +	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
> +};
> +
> +int virtsnd_pcm_validate(struct virtio_device *vdev);
> +
> +int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
> +
> +int virtsnd_pcm_build_devs(struct virtio_snd *snd);
> +
> +void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event);
> +
> +void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue);
> +
> +void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue);
> +
> +struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
> +
> +struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
> +					      unsigned int nid);
> +
> +#endif /* VIRTIO_SND_PCM_H */
> -- 
> 2.30.0
> 
> 

