Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D905630B351
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 00:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB111761;
	Tue,  2 Feb 2021 00:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB111761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612221596;
	bh=kTjbFd7AV3lrJnt+wJaQiWn7seD4nlRWMPJKR717Nrk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfRBY/SvXQBhyK4VuDSfIz38V8ieATZK9d+U9Ow2COG6L+oDwZ5yoRjUFPy1ZFkI/
	 gSNXanRoIPBeqyPfoQkP1K1dkLVm2EObPxmkcJu8/ctHIWkCD5l/rg+hKGLV7TbLZq
	 rXde3RCq0lirIG4g+3iBD336//0LHEvpE6m6j83w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0872F800E9;
	Tue,  2 Feb 2021 00:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFD6F80152; Tue,  2 Feb 2021 00:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B11CF80151
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 00:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B11CF80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="TkEsI5KL"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 80A95A1569;
 Tue,  2 Feb 2021 00:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=lUMI46TQw0fr
 jF2ARY5V4xhdbBHFJlxLuLVTz4ns2iQ=; b=TkEsI5KLXCuVRFyJkEdLrRZI97d0
 x0e1DpOxZ34WCeJucEcMvvUokEBuXuT9ZcESYewcCwCHu2a3i4OmAHKs/KBbRsKZ
 So5yoUc61267K8VfzO6qL3SEB86qQyDAicDRcqBUtjWvMoM9Cs8A5DwsD4XbwmJI
 YDYSjuHAiHz0BEd/1eHF9hYDBAohHvFdKtu493uJJ8JUVdL0ufOzng8OOQsRx0/H
 zkwPFb0oU1g6xUNSFoG6hGBnh+1DCEg2mI2Lt28e94SyU2uWe6GFpA8z+lCQmTEX
 Rrjpm8gnqLmj/X0W6N/BEPD1vmjqXzXDuQLzymE7ShOwqb9WiaqElkvK8A==
Subject: Re: [virtio-dev] Re: [PATCH v2 2/9] ALSA: virtio: add virtio sound
 driver
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-3-anton.yakovlev@opensynergy.com>
 <8754dae8-114-6383-510-de2ba9dc4fa@intel.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <52f71ac6-3ec7-2884-7a64-1995f416d20a@opensynergy.com>
Date: Tue, 2 Feb 2021 00:18:09 +0100
MIME-Version: 1.0
In-Reply-To: <8754dae8-114-6383-510-de2ba9dc4fa@intel.com>
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

Hi Guennadi,

Sorry for the late reply and thanks for your comments, they helped me a
lot! Please see my answers inline.


On 25.01.2021 15:54, Guennadi Liakhovetski wrote:

...[snip]...

 >
 >> + * 1. Redistributions of source code must retain the above copyright
 >> + *    notice, this list of conditions and the following disclaimer.
 >> + * 2. Redistributions in binary form must reproduce the above copyright
 >> + *    notice, this list of conditions and the following disclaimer in
 >> the
 >> + *    documentation and/or other materials provided with the
 >> distribution.
 >> + * 3. Neither the name of OpenSynergy GmbH nor the names of its
 >> contributors
 >> + *    may be used to endorse or promote products derived from this
 >> software
 >> + *    without specific prior written permission.
 >> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 >> + * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 >> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 >> + * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
 >
 > IBM? Also no idea whether this warranty disclaimer is appropriate here. I
 > thought we were transitioning to those SPDX identifiers to eliminate all
 > these headers.

It was a copy-paste mistake, I will edit these lines.


...[snip]...

 >> +
 >> +/**
 >> + * virtsnd_disable_vqs() - Disable all virtqueues.
 >> + * @snd: VirtIO sound device.
 >> + *
 >> + * Also free all allocated events and control messages.
 >> + *
 >> + * Context: Any context.
 >> + */
 >> +static void virtsnd_disable_vqs(struct virtio_snd *snd)
 >> +{
 >> +     struct virtio_device *vdev = snd->vdev;
 >> +     unsigned int i;
 >> +     unsigned long flags;
 >> +
 >> +     for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
 >> +             struct virtio_snd_queue *queue = &snd->queues[i];
 >> +
 >> +             spin_lock_irqsave(&queue->lock, flags);
 >> +             /* Prohibit the use of the queue */
 >> +             if (queue->vqueue)
 >> +                     virtqueue_disable_cb(queue->vqueue);
 >> +             queue->vqueue = NULL;
 >> +             spin_unlock_irqrestore(&queue->lock, flags);
 >> +     }
 >> +
 >> +     if (snd->event_msgs)
 >
 > Check not needed, kfree(NULL) is ok.

Yes, you are right here. I didn't notice that devm_kfree() now works
fine with NULL argument too.


 >> +             devm_kfree(&vdev->dev, snd->event_msgs);
 >
 > I think there are very few cases when managed resources have to be
 > explicitly freed. If explicit freeing is always required, then there's no
 > need to have them managed. If there's a clear case for managed resources,
 > usually you don't need to free them explicitly. Here.event_msgs are
 > allocated in virtsnd_find_vqs() above, which is only called during
 > probing. And this function is only called during release. So, I'd assume,
 > that you don't need to free memory explicitly here.

Here, the reason for explicitly freeing managed resources is in the
current device reset handling logic. At the moment, executing the reset
worker results in a call to virtsnd_disable_vqs. After which the device
is recreated. And since in this case the driver is not detached from the
device, the managed resources are not automatically freed. On the other
hand, managed resources allow not to worry about deallocation if the
probing function returns an error.


 >> +
 >> +     snd->event_msgs = NULL;
 >
 > snd is about to be freed, so do you really need this?

No :)


 >> +}
 >> +
 >> +/**
 >> + * virtsnd_reset_fn() - Kernel worker's function to reset the device.
 >> + * @work: Reset device work.
 >> + *
 >> + * Context: Process context.
 >> + */
 >> +static void virtsnd_reset_fn(struct work_struct *work)
 >> +{
 >> +     struct virtio_snd *snd =
 >> +             container_of(work, struct virtio_snd, reset_work);
 >> +     struct virtio_device *vdev = snd->vdev;
 >> +     struct device *dev = &vdev->dev;
 >> +     int rc;
 >> +
 >> +     dev_info(dev, "sound device needs reset\n");
 >> +
 >> +     /*
 >> +      * It seems that the only way to properly reset the device is to
 >> remove
 >> +      * and re-create the ALSA sound card device.
 >> +      *
 >> +      * Also resetting the device involves a number of steps with
 >> setting the
 >> +      * status bits described in the virtio specification. And the
 >> easiest
 >> +      * way to get everything right is to use the virtio bus interface.
 >> +      */
 >> +     rc = dev->bus->remove(dev);
 >> +     if (rc)
 >> +             dev_warn(dev, "bus->remove() failed: %d", rc);
 >> +
 >> +     rc = dev->bus->probe(dev);
 >> +     if (rc)
 >> +             dev_err(dev, "bus->probe() failed: %d", rc);
 >
 > This looks very suspicious to me. Wondering what ALSA maintainers 
will say
 > to this.

I'm also wondering what the virtio people have to say. This part is a
purely virtio specific thing. And since none of the existing virtio
drivers processes the request to reset the device, it is not clear what
is the best way to proceed here. For this reason, the most
straightforward and simple solution was chosen.


...[snip]...

 >
 > Thanks
 > Guennadi
 >
 > ---------------------------------------------------------------------
 > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
 > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
 >
 >
-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

www.opensynergy.com

