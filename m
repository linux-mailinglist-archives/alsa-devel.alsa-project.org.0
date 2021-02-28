Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAA3273D1
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Feb 2021 19:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157281660;
	Sun, 28 Feb 2021 19:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157281660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614537694;
	bh=tIXuGBi3AThTZ4DD53Yl9s8SkTFuE0tbhPoOk7r8cLY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6IWmC4eN2GFgTeOd8xwLnGjVxlA+kDnBZjDijfdSvQj6xaq8Df08xIk2zRQHArlN
	 pKC2LkzLX0LsWMtKbigMhJboN3jn1n8EGKseewXmuxABx1CnPIesLFoMRvmUIvw9X4
	 2RDkM905OnWwb4oNes8+HgW01Q96kozeFnyYg1B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F81F80269;
	Sun, 28 Feb 2021 19:40:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 038B1F8025B; Sun, 28 Feb 2021 19:40:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 657DAF8010A
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 19:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 657DAF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="IXKlbZs2"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id DD430A12C6;
 Sun, 28 Feb 2021 19:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=TQGOK+H3KWlj
 CSgBxmVAZ5kqTgWKUCfHswD0WpIouoI=; b=IXKlbZs23ot8LKgE30mND+jN51/N
 yEm/tla4svftVORM8an8h+YMkxY64UbQRbGJfPrmpfXhWUrDqyWgsdwNfSEmD7CJ
 FF6ANT/rpfw4Qu1LDvEfuTl5bkd1ElTZ64uVTJXoTAuvtsNrzsnelDPHJDnwASxU
 ZQXTXZiva3pDzFWWBHERmLGGwgJPYWvQpGU/3EdSsJFw6/BurM1zVbnuF5OgjTEl
 6YR2KDf+c7k3RyFsZPncc5Zrdqw1tbttFFLio8kV+dsbvPG14Mj7okA63k/Y5fdj
 9qPQm4bcDEBdhUJ2iubQEglb7noAT3kHVY4a4fFP0/LL351ClHlQxl+IgA==
Subject: Re: [PATCH v6 3/9] ALSA: virtio: handling control messages
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-4-anton.yakovlev@opensynergy.com>
 <s5hv9acjvw6.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <174d09dd-ed8a-ecda-a392-48a2971b06cf@opensynergy.com>
Date: Sun, 28 Feb 2021 19:39:49 +0100
MIME-Version: 1.0
In-Reply-To: <s5hv9acjvw6.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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

On 28.02.2021 12:04, Takashi Iwai wrote:> On Sat, 27 Feb 2021 09:59:50 
+0100,
> Anton Yakovlev wrote:
>>
>> --- a/sound/virtio/virtio_card.c
>> +++ b/sound/virtio/virtio_card.c
>> @@ -11,6 +11,10 @@
>>
>>   #include "virtio_card.h"
>>
>> +int msg_timeout_ms = MSEC_PER_SEC;
>> +module_param(msg_timeout_ms, int, 0644);
>> +MODULE_PARM_DESC(msg_timeout_ms, "Message completion timeout in milliseconds");
> 
> If it's a global variable, better to set a prefix to make it unique,
> and use module_param_named().

Yes, it makes sense.


> And, it should be unsigned int, no? (unless a negative value has any meaning)
> Otherwise...

And yes, it must be unsigned!


>> +     if (!msg_timeout_ms) {
>> +             dev_err(&vdev->dev, "msg_timeout_ms value cannot be zero\n");
>> +             return -EINVAL;
> 
> Here a negative value would pass.
> 
> (snip)
>> +int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
>> +                      struct scatterlist *out_sgs,
>> +                      struct scatterlist *in_sgs, bool nowait)
>> +{
>> +     struct virtio_device *vdev = snd->vdev;
>> +     struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
>> +     unsigned int js = msecs_to_jiffies(msg_timeout_ms);
>> +     struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
>> +     struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
>> +     unsigned int nouts = 0;
>> +     unsigned int nins = 0;
>> +     struct scatterlist *psgs[4];
>> +     bool notify = false;
>> +     unsigned long flags;
>> +     int rc;
>> +
>> +     virtsnd_ctl_msg_ref(msg);
>> +
>> +     /* Set the default status in case the message was canceled. */
>> +     response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
>> +
>> +     psgs[nouts++] = &msg->sg_request;
>> +     if (out_sgs)
>> +             psgs[nouts++] = out_sgs;
>> +
>> +     psgs[nouts + nins++] = &msg->sg_response;
>> +     if (in_sgs)
>> +             psgs[nouts + nins++] = in_sgs;
>> +
>> +     spin_lock_irqsave(&queue->lock, flags);
>> +     rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
>> +                            GFP_ATOMIC);
> 
> It's a bit pity that we have to use GFP_ATOMIC always here...
> As long as it's in spinlock, it's the only way.

Well, here we have no other choices, since we share the queue with
an interrupt handler.


> However, this reminds me of another question: may the virtio event be
> handled in an atomic context, e.g. the period elapsed or xrun events?
> If so, the current implementation with non-atomic PCM mode is wrong.
> Since the non-atomic PCM uses mutex instead of spinlock, it'll lead to
> a sleep-in-atomic in snd_pcm_period_elapsed() handling.
> 
> I suggested the non-atomic PCM *iff* the all contexts are sleepable;
> then the sync can be done in each callback, which makes the code much
> simpler usually.  But you've already implemented the sync via
> sync_stop call, hence the non-atomic PCM has little benefit by its
> own.

The device provides 4 separate queues for communication with the driver,
and different data is transmitted over these queues:

The control queue (actually shared between all driver components) for
sending commands to the device. These requests must be synchronous. For
each request, the device must send a response, and we must wait for it.
What you can see in PCM ops are exactly sending these commands (set
params, prepare, start and so on). But since some ops could be called in
atomic context, there was no other choice but to add asynchronous
messages and return from the operator without waiting for a response
from the device. Because of this, the START command was a headache. We
could not say for sure if the substream started at all on the device
side. Also, the virtualization overhead was not taken into account
(application might think that the substream is already running, but
actually it was not).

Then there are 2 queues for sending/receiving PCM frames. These contain
i/o messages carrying actual buffer sliced into periods. Actually,
snd_pcm_period_elapsed() is called from interrupt handlers here.

And then there is an additional queue for events.

All of these are handled in different ways.


> 
> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

