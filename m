Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B87324F7C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:53:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28D61686;
	Thu, 25 Feb 2021 12:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28D61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614253995;
	bh=ZC26VNjZ8FNzSGu3vEqAQS84q107gckLzcUypv/sNmg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OjRaF9w9eG3Yti+tGiBONPdm5YTojCPj3eMnqeYxaxryvXHE/78+cJfPesWF5YaCT
	 a0qmhcbGNbbOvetdhLb/1XjaM6SaX3rP1UGiP5CfMV0R/+lOa/53B5+BbLXINrH9X7
	 TNSZm9zpFL4bPR4mfbNEx93x4S7g9L5dWOn7DVWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2273F800D2;
	Thu, 25 Feb 2021 12:51:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA1DF8016A; Thu, 25 Feb 2021 12:51:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F4C1F800E4
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 12:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F4C1F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="FSfYe2+c"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 6C466A06F5;
 Thu, 25 Feb 2021 12:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=TAhy5sA5EuJA
 cioqsfiM0ihVQ+DRllhVv2+0h39aJRA=; b=FSfYe2+cHjQSpdAgRO0K0EwGjSoE
 sk+pRqYuJHY/NMoIfl0gLsM39at7/fRFpL+T0B6aSEO+X1N83R7JNbXnYDr5Ul90
 sBHnzHqCm+ef74GlzwclYVV9i4Ba0SU/cOEYMXhIkjj4+yzXySxaohmYIqyAmyxX
 qLHu6CvcKWapJwGhPdvUk1sCWA26ddTT+9iz8q+yIeZXPDOTk3Fyav1OFo26crIk
 caU2lFu2crsrKfda6cArThtbmjIZuO9gOgySg5xkYP2SIvazJ8ODNGxy9zswALSQ
 JAnKl1qXj0tGpoo8NHGt+QjZnw5KDMxZiZGHtsEW3pBqn7ZZ3tk0CIlxYQ==
Subject: Re: [PATCH v5 2/9] ALSA: virtio: add virtio sound driver
To: Takashi Iwai <tiwai@suse.de>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210222153444.348390-3-anton.yakovlev@opensynergy.com>
 <s5h7dmwqvo4.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <cea4164d-345e-393b-9328-731c2f874eb7@opensynergy.com>
Date: Thu, 25 Feb 2021 12:51:36 +0100
MIME-Version: 1.0
In-Reply-To: <s5h7dmwqvo4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, Takashi Iwai <tiwai@suse.com>,
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

On 25.02.2021 11:38, Takashi Iwai wrote:
> On Mon, 22 Feb 2021 16:34:37 +0100,
> Anton Yakovlev wrote:
>> +static int virtsnd_find_vqs(struct virtio_snd *snd)
>> +{
>> +     struct virtio_device *vdev = snd->vdev;
>> +     vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = {
>> +             [VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb
>> +     };
>> +     const char *names[VIRTIO_SND_VQ_MAX] = {
> 
> Shouldn't be static?

Well, yes. Although in this particular case, I do not think it is that
critical. :)


> Also it's often const char * const names[] = { ... }
> unless you overwrite something.

I tried to use the same type names as in the function prototype.
Otherwise the compiler or static analyzer may complain.


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
>> +      * It seems that the only way to properly reset the device is to remove
>> +      * and re-create the ALSA sound card device.
>> +      */
>> +     rc = device_reprobe(dev);
>> +     if (rc)
>> +             dev_err(dev, "failed to reprobe sound device: %d\n", rc);
> 
> Now I'm wondering whether it's safe to do that from this place.
> Basically device_reprobe() unbinds the device that releases the full
> resources once including the devm_* stuff.  And this work itself is in
> a part of devm allocated resource, so it'll be released there.  That
> said, we might hit use-after-free...  This needs to be verified.

It's safe. Suicide kernel workers are funny but possible things. Since
the kernel itself (AFAIU) assumes such a situation and does not access
the worker structure after the callback function call.


> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

