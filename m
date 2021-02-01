Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528330B362
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 00:22:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F079E177A;
	Tue,  2 Feb 2021 00:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F079E177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612221721;
	bh=lAJ2VifTzUQTeVFOKJu+ehDial5byr22z8f0jITNvXs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZwRo1tpDoZyicvkMubYWqRk1WmW0lAfE2114Z8t6F0IFgbubG2c4Du9bMu20vo4oV
	 W6zMujR8mxsJjSO4tfZMPePHzCsoo76K96K8jK+9G4J2a0WkL5ozWWTidjoSt1tlkj
	 Zkj+dpqCPk3eymkn7mwUsT6ZmkdV7YjscooAHC/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D85DF8021D;
	Tue,  2 Feb 2021 00:21:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA013F80234; Tue,  2 Feb 2021 00:21:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFA12F80151
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 00:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA12F80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="4Ea9ONIz"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 411F1A1570;
 Tue,  2 Feb 2021 00:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=DPue/G9QZAQP
 P2U/tuia7SnZrLEKRrkWEwYzlrIEBcE=; b=4Ea9ONIzRQmD3gywsImocKT4ikrU
 S2Bjv3mmUU4uxrTxTa0vYvE8DhIlc21B3+y6Mu7e4SyxOB9XrO5y/uhKkJe9kBBe
 PtQOt22EzRvQ7KWMqB/NaawsiRxJURFiXgDcTe4FxziMTjjFIEe3iDHLgAz+MJqW
 D4sn6kFDs5NLbjvedzn1iYjLImZKcpgyKHkikk/2Ijz3xG4CrQ2JStXWtrrr+Si5
 6DS85msi+2bJNM2E6rDKsPVr7oLho6H3lMemeUlTu4ERnoOOvBj94PdFyiVrx8B/
 gJ9s92u/I9YS9qM+Yg1mmB8WqPR+/garmc8bBFbwr/wQjNhhE3Z3uXmH1A==
Subject: Re: [PATCH v2 5/9] ALSA: virtio: handling control and I/O messages
 for the PCM device
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-6-anton.yakovlev@opensynergy.com>
 <e19f65d-9b2b-246-572f-de394ad3662b@intel.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <492ce6e3-57f5-09e7-b7b8-d2a1d1aa685c@opensynergy.com>
Date: Tue, 2 Feb 2021 00:20:56 +0100
MIME-Version: 1.0
In-Reply-To: <e19f65d-9b2b-246-572f-de394ad3662b@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
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



On 25.01.2021 17:25, Guennadi Liakhovetski wrote:

...[snip]...

 >> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
 >> index 036990b7b78a..1ab50dcc88c8 100644
 >> --- a/sound/virtio/virtio_pcm.c
 >> +++ b/sound/virtio/virtio_pcm.c
 >> @@ -376,6 +376,7 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 >>
 >>               substream->snd = snd;
 >>               substream->sid = i;
 >> +             init_waitqueue_head(&substream->msg_empty);
 >>
 >>               rc = virtsnd_pcm_build_hw(substream, &info[i]);
 >>               if (rc)
 >> @@ -530,6 +531,8 @@ void virtsnd_pcm_event(struct virtio_snd *snd,
 >> struct virtio_snd_event *event)
 >>               break;
 >>       }
 >>       case VIRTIO_SND_EVT_PCM_XRUN: {
 >> +             if (atomic_read(&substream->xfer_enabled))
 >
 > Why does .xfer_enabled have to be atomic? It only takes two values - 
0 and
 > 1, I don't see any incrementing, or test-and-set type operations or
 > anything similar. Also I don't see .xfer_enabled being set to 1 anywhere
 > in this patch, presumably that happens in one of later patches.
 >
 >> +                     atomic_set(&substream->xfer_xrun, 1);
 >
 > Ditto.
 >

Yes, maybe I was not very good at breaking the code into patches.
.xfer_enabled and .xfer_xrun are used in callback functions for
operators (next patch). Basically, these two contain boolean values.


...[snip]...


 >> +
 >> +/**
 >> + * enum pcm_msg_sg_index - Scatter-gather element indexes for an I/O
 >> message.
 >> + * @PCM_MSG_SG_XFER: Element containing a virtio_snd_pcm_xfer 
structure.
 >> + * @PCM_MSG_SG_DATA: Element containing a data buffer.
 >> + * @PCM_MSG_SG_STATUS: Element containing a virtio_snd_pcm_status
 >> structure.
 >> + * @PCM_MSG_SG_MAX: The maximum number of elements in the
 >> scatter-gather table.
 >> + *
 >> + * These values are used as the index of the payload scatter-gather
 >> table.
 >> + */
 >> +enum pcm_msg_sg_index {
 >> +     PCM_MSG_SG_XFER = 0,
 >> +     PCM_MSG_SG_DATA,
 >> +     PCM_MSG_SG_STATUS,
 >> +     PCM_MSG_SG_MAX
 >> +};
 >
 > If I understand correctly, messages are sent to the back-end driver in
 > this specific order, so this is a part of the ABI, isn't it? Is it also a
 > part of the spec? If so this should be defined in your ABI header?

Yes, this is a part of the spec. But the spec only defines a "layout" of
the message, and does not limit or in any way define the number of
descriptors to transmit each of the parts of the message. Hence, this
enum cannot be defined as part of the ABI. However, since this driver
uses only one descriptor for each part, it is more convenient to use an
enum to make the code more readable.


 >> +
 >> +/**
 >> + * struct virtio_pcm_msg - VirtIO I/O message.
 >> + * @substream: VirtIO PCM substream.
 >> + * @xfer: Request header payload.
 >> + * @status: Response header payload.
 >> + * @sgs: Payload scatter-gather table.
 >> + */
 >> +struct virtio_pcm_msg {
 >> +     struct virtio_pcm_substream *substream;
 >> +     struct virtio_snd_pcm_xfer xfer;
 >> +     struct virtio_snd_pcm_status status;
 >> +     struct scatterlist sgs[PCM_MSG_SG_MAX];
 >> +};
 >> +
 >> +/**
 >> + * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
 >> + * @substream: VirtIO PCM substream.
 >> + * @nmsg: Number of messages (equal to the number of periods).
 >> + * @dma_area: Pointer to used audio buffer.
 >> + * @period_bytes: Period (message payload) size.
 >> + *
 >> + * The function slices the buffer into nmsg parts (each with the 
size of
 >> + * period_bytes), and creates nmsg corresponding I/O messages.
 >> + *
 >> + * Context: Any context that permits to sleep.
 >> + * Return: 0 on success, -ENOMEM on failure.
 >> + */
 >> +int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *substream,
 >> +                       unsigned int nmsg, u8 *dma_area,
 >> +                       unsigned int period_bytes)
 >> +{
 >> +     struct virtio_device *vdev = substream->snd->vdev;
 >> +     unsigned int i;
 >> +
 >> +     if (substream->msgs)
 >> +             devm_kfree(&vdev->dev, substream->msgs);
 >> +
 >> +     substream->msgs = devm_kcalloc(&vdev->dev, nmsg,
 >> +                                    sizeof(*substream->msgs),
 >> GFP_KERNEL);
 >> +     if (!substream->msgs)
 >> +             return -ENOMEM;
 >> +
 >> +     for (i = 0; i < nmsg; ++i) {
 >> +             struct virtio_pcm_msg *msg = &substream->msgs[i];
 >> +
 >> +             msg->substream = substream;
 >> +
 >> +             sg_init_table(msg->sgs, PCM_MSG_SG_MAX);
 >
 > Why do you need to initialise a table of 3 meddages if you then 
initialise
 > each of them separately immediately below?

Hm, good point! I forgot to delete this line, thanks.


 >> +             sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
 >> +                         sizeof(msg->xfer));
 >> +             sg_init_one(&msg->sgs[PCM_MSG_SG_DATA],
 >> +                         dma_area + period_bytes * i, period_bytes);
 >> +             sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
 >> +                         sizeof(msg->status));
 >> +     }
 >> +
 >> +     return 0;
 >> +}
 >> +
 >> +/**
 >> + * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
 >> + * @substream: VirtIO PCM substream.
 >> + *
 >> + * All messages are organized in an ordered circular list. Each 
time the
 >> + * function is called, all currently non-enqueued messages are added
 >> to the
 >> + * virtqueue. For this, the function keeps track of two values:
 >> + *
 >> + *   msg_last_enqueued = index of the last enqueued message,
 >> + *   msg_count = # of pending messages in the virtqueue.
 >> + *
 >> + * Context: Any context.
 >> + * Return: 0 on success, -EIO on failure.
 >> + */
 >> +int virtsnd_pcm_msg_send(struct virtio_pcm_substream *substream)
 >> +{
 >> +     struct snd_pcm_runtime *runtime = substream->substream->runtime;
 >> +     struct virtio_snd *snd = substream->snd;
 >> +     struct virtio_device *vdev = snd->vdev;
 >> +     struct virtqueue *vqueue = virtsnd_pcm_queue(substream)->vqueue;
 >> +     int i;
 >> +     int n;
 >> +     bool notify = false;
 >> +
 >> +     if (!vqueue)
 >> +             return -EIO;
 >
 > Is this actually possible? That would mean a data corruption or a bug in
 > the driver, right? In either case it can be NULL or 1 or any other 
invalid
 > value, so checking for NULL doesn't seem to help a lot?

Yes it is possible. The virtio device may ask the driver to reset itself.
This can happen at any time, including when the device is actively used.
In such case, we disable the use of virtqueues by setting the .vqueue
values to NULL.


 >> +
 >> +     i = (substream->msg_last_enqueued + 1) % runtime->periods;
 >> +     n = runtime->periods - atomic_read(&substream->msg_count);
 >> +
 >> +     for (; n; --n, i = (i + 1) % runtime->periods) {
 >> +             struct virtio_pcm_msg *msg = &substream->msgs[i];
 >> +             struct scatterlist *psgs[PCM_MSG_SG_MAX] = {
 >> +                     [PCM_MSG_SG_XFER] = &msg->sgs[PCM_MSG_SG_XFER],
 >> +                     [PCM_MSG_SG_DATA] = &msg->sgs[PCM_MSG_SG_DATA],
 >> +                     [PCM_MSG_SG_STATUS] = &msg->sgs[PCM_MSG_SG_STATUS]
 >> +             };
 >> +             int rc;
 >> +
 >> +             msg->xfer.stream_id = cpu_to_virtio32(vdev,
 >> substream->sid);
 >> +             memset(&msg->status, 0, sizeof(msg->status));
 >> +
 >> +             atomic_inc(&substream->msg_count);
 >
 > .msg_count is also accessed in virtsnd_pcm_msg_complete() which is why
 > presumably you use atomic access. But here you already increment the 
count
 > before you even begin adding the message to the virtqueue. So if
 > virtsnd_pcm_msg_complete() preempts you here the .msg_count will be
 > inconsistent? Possibly you need to protect both operations together:
 > incrementing the counter and adding messages to queues.

It is not necessary here. As virtqueue_add_sgs requires the virtqueue to
be protected by the caller using an external lock, so all calls to
virtsnd_pcm_msg_send are wrapped with spinlocks (with disabled interrupts
for the current core) for the tx/rx virtqueues.


 >> +
 >> +             if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK)
 >> +                     rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
 >> +                                            GFP_ATOMIC);
 >> +             else
 >> +                     rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
 >> +                                            GFP_ATOMIC);
 >> +
 >> +             if (rc) {
 >> +                     atomic_dec(&substream->msg_count);
 >> +                     return -EIO;
 >> +             }
 >> +
 >> +             substream->msg_last_enqueued = i;
 >> +     }
 >> +
 >> +     if (!(substream->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
 >> +             notify = virtqueue_kick_prepare(vqueue);
 >> +
 >> +     if (notify)
 >> +             if (!virtqueue_notify(vqueue))
 >> +                     return -EIO;
 >> +
 >> +     return 0;
 >> +}
 >> +
 >> +/**
 >> + * virtsnd_pcm_msg_complete() - Complete an I/O message.
 >> + * @msg: I/O message.
 >> + * @size: Number of bytes written.
 >> + *
 >> + * Completion of the message means the elapsed period.
 >> + *
 >> + * The interrupt handler modifies three fields of the substream
 >> structure
 >> + * (hw_ptr, xfer_xrun, msg_count) that are used in operator
 >> functions. These
 >> + * values are atomic to avoid frequent interlocks with the interrupt
 >> handler.
 >> + * This becomes especially important in the case of multiple running
 >> substreams
 >> + * that share both the virtqueue and interrupt handler.
 >> + *
 >> + * Context: Interrupt context.
 >> + */
 >> +static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 >> size_t size)
 >> +{
 >> +     struct virtio_pcm_substream *substream = msg->substream;
 >> +     snd_pcm_uframes_t hw_ptr;
 >> +     unsigned int msg_count;
 >> +
 >> +     /*
 >> +      * hw_ptr always indicates the buffer position of the first I/O
 >> message
 >> +      * in the virtqueue. Therefore, on each completion of an I/O
 >> message,
 >> +      * the hw_ptr value is unconditionally advanced.
 >> +      */
 >> +     hw_ptr = (snd_pcm_uframes_t)atomic_read(&substream->hw_ptr);
 >
 > Also unclear why this has to be atomic, especially taking into account
 > that it's only accessed in "interrupt context."

The general situation looks like this:
.hw_ptr and .xfer_xrun
   written in the virtsnd_pcm_msg_complete()
   read in the pointer() substream operator
.xfer_enabled
   written in the trigger() substream operator
   read in the virtsnd_pcm_msg_complete()

ALSA takes some substream locks while calling for trigger/pointer().
Unfortunately, we cannot use the same substream locks here, as it opens
up many control paths leading to deadlock. And all that remains is either
to use atomic fields, or to introduce our own spinlock for each substream
(to protect these fields). Personally, I don't know which would be better.
But the code with atomic fields looks at least simpler.


 >> +
 >> +     /*
 >> +      * If the capture substream returned an incorrect status, then 
just
 >> +      * increase the hw_ptr by the period size.
 >> +      */
 >> +     if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK ||
 >> +         size <= sizeof(msg->status)) {
 >> +             hw_ptr += substream->period_size;
 >> +     } else {
 >> +             size -= sizeof(msg->status);
 >> +             hw_ptr += size / substream->frame_bytes;
 >> +     }
 >> +
 >> +     atomic_set(&substream->hw_ptr, (u32)(hw_ptr %
 >> substream->buffer_size));
 >> +     atomic_set(&substream->xfer_xrun, 0);
 >> +
 >> +     msg_count = atomic_dec_return(&substream->msg_count);
 >> +
 >> +     if (atomic_read(&substream->xfer_enabled)) {
 >> +             struct snd_pcm_runtime *runtime =
 >> substream->substream->runtime;
 >> +
 >> +             runtime->delay =
 >> +                     bytes_to_frames(runtime,
 >> +
 >> le32_to_cpu(msg->status.latency_bytes));
 >> +
 >> +             snd_pcm_period_elapsed(substream->substream);
 >> +
 >> +             virtsnd_pcm_msg_send(substream);
 >> +     } else if (!msg_count) {
 >> +             wake_up_all(&substream->msg_empty);
 >> +     }
 >> +}
 >
 > Thanks
 > Guennadi
 >
-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

www.opensynergy.com

