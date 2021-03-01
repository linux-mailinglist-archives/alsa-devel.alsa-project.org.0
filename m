Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45F327FC5
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2F4168B;
	Mon,  1 Mar 2021 14:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2F4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606240;
	bh=gkbMvC82vIbJJ6FzwzwBA8HMrYIBip+t1XoKESN8vnU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dhuknd3Fa6qrGnOgbo9aiBA4m8a9cRMFXZPXIwCBQWVA4OhjQncHpD5EfVSbGYmFM
	 3PCV3EI/9NDXQsdk7eOz8ljMQXM7HIFZ6JxEqqwWniKv5RhYqTcJTy+n3y/DOtvt4S
	 JNlYXnTa/muDdQhNxFnPprXjumtAqzSHtW5bnlIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14384F804AB;
	Mon,  1 Mar 2021 11:03:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC7EAF804D9; Mon,  1 Mar 2021 11:03:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43898F804D1
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 11:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43898F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="y+hHA5oy"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 84EF2A1344;
 Mon,  1 Mar 2021 11:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=TYThy1gXWt2N
 GLWZE4+BNvfDquT8rOEI1kVicn0HVsg=; b=y+hHA5oyvhs9pArzHttMuyoKdxP1
 Fwlbcir93mQ/6UUIuo+Ic+uw7QoZBRETjmBckBQT2dbKzSu1eTdQmrf8S6/mpmv7
 mMEIknuE/CU/jezBM/VLDdDgSqiCggLP8iPwWnLfGBPLAlIg8vdsqEjjrqn8p9wY
 yvZLGk+qhwhmzvATxARQSyAPebd142F+ve1d0HyZ+q09n4HzhZ/lRy/Lgwxj6wB/
 aBwAkiW6/G3XqPE4DgEWh5V5dpfd5LA6IfwyJhUnHfwIKObPXChG5vsWdjBNNV1h
 d7BogU8h562dy0T9lSWv6/M+agyifUWIv/XhelwNk/RYqwbsZ7QttVLNhg==
Subject: Re: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume
 support
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
 <s5hpn0kjt31.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <54854cb9-99c3-4c05-3b43-f41d89a29aec@opensynergy.com>
Date: Mon, 1 Mar 2021 11:03:04 +0100
MIME-Version: 1.0
In-Reply-To: <s5hpn0kjt31.wl-tiwai@suse.de>
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

On 28.02.2021 13:05, Takashi Iwai wrote:
> On Sat, 27 Feb 2021 09:59:56 +0100,
> Anton Yakovlev wrote:
>>
>> All running PCM substreams are stopped on device suspend and restarted
>> on device resume.
>>
>> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> ---
>>   sound/virtio/virtio_card.c    | 56 +++++++++++++++++++++++++++++++++++
>>   sound/virtio/virtio_pcm.c     |  1 +
>>   sound/virtio/virtio_pcm_ops.c | 41 ++++++++++++++++++++-----
>>   3 files changed, 90 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
>> index 59455a562018..c7ae8801991d 100644
>> --- a/sound/virtio/virtio_card.c
>> +++ b/sound/virtio/virtio_card.c
>> @@ -323,6 +323,58 @@ static void virtsnd_remove(struct virtio_device *vdev)
>>        kfree(snd->event_msgs);
>>   }
>>
>> +#ifdef CONFIG_PM_SLEEP
>> +/**
>> + * virtsnd_freeze() - Suspend device.
>> + * @vdev: VirtIO parent device.
>> + *
>> + * Context: Any context.
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +static int virtsnd_freeze(struct virtio_device *vdev)
>> +{
>> +     struct virtio_snd *snd = vdev->priv;
>> +
>> +     virtsnd_ctl_msg_cancel_all(snd);
>> +
>> +     vdev->config->del_vqs(vdev);
>> +     vdev->config->reset(vdev);
>> +
>> +     kfree(snd->event_msgs);
>> +
>> +     /*
>> +      * If the virtsnd_restore() fails before re-allocating events, then we
>> +      * get a dangling pointer here.
>> +      */
>> +     snd->event_msgs = NULL;
>> +
>> +     return 0;
> 
> I suppose some cancel of inflight works is needed?
> Ditto for the device removal, too.

It's not necessary here, since the device is reset and all of this are
happened automatically. But in the device remove it makes sense also to
disable events before calling snd_card_free(), since the device is still
able to send notifications at that moment. Thanks!


>> --- a/sound/virtio/virtio_pcm.c
>> +++ b/sound/virtio/virtio_pcm.c
>> @@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>                SNDRV_PCM_INFO_BATCH |
>>                SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>                SNDRV_PCM_INFO_INTERLEAVED |
>> +             SNDRV_PCM_INFO_RESUME |
>>                SNDRV_PCM_INFO_PAUSE;
> 
> Actually you don't need to set SNDRV_PCM_INFO_RESUME.
> This flag means that the driver supports the full resume procedure,
> which isn't often the case; with this, the driver is supposed to
> resume the stream exactly from the suspended position.

If I understood you right, that's exactly how resume is implemented now
in the driver. Although we fully restart substream on the device side,
from an application point of view it is resumed exactly at the same
position.


> Most drivers don't set this but implement only the suspend-stop
> action.  Then the application (or the sound backend) will re-setup the
> stream and restart accordingly.

And an application must be aware of such possible situation? Since I
have no doubt in alsa-lib, but I don't think that for example tinyalsa
can handle this right.


>> @@ -309,6 +318,21 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
>>        int rc;
>>
>>        switch (command) {
>> +     case SNDRV_PCM_TRIGGER_RESUME: {
>> +             /*
>> +              * We restart the substream by executing the standard command
>> +              * sequence.
>> +              */
>> +             rc = virtsnd_pcm_hw_params(substream, NULL);
>> +             if (rc)
>> +                     return rc;
>> +
>> +             rc = virtsnd_pcm_prepare(substream);
>> +             if (rc)
>> +                     return rc;
> 
> And this won't work at all unless nonatomic PCM ops.
> 
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

