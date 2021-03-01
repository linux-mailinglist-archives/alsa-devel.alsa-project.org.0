Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BA328287
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA7E16B4;
	Mon,  1 Mar 2021 16:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA7E16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614612754;
	bh=qjipA8BfqI024AtnTZO4xuP/tcimv3EqFld8rKft+WA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txwr7albpRYnitpVc5w2UIVw51TD3f573UBJnBcf08q7aXcJblkt3zx8xFKcvQkMb
	 6pyuGj/OMPoRM9m9CfN5w8MPIaq5V+LnVCpuhQwNPylspTyVd9L6jaAryb0iZYC6kK
	 X9fOyCAu1G5O8X342DT542Uq8qDk+TQrHHrWQ3/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC242F8027D;
	Mon,  1 Mar 2021 16:31:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A764BF80275; Mon,  1 Mar 2021 16:31:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ED22F80272
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ED22F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="1xa44Ndf"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id D0845A135A;
 Mon,  1 Mar 2021 16:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=v4QKZoyEhUUl
 8eHO+sgtVV5pWRE+dBrdSzOgE4nihEc=; b=1xa44NdfhI89Ixk8UlhPryNc5vVr
 4AUZxU2udGJCZaGsHMNXmaddj45tBMOdTsmcvJeksOl8/01R78QdAn6nlGWgSb9f
 MLBxVr0kjriaw5bp56t4krjwhqW1JiNvlqhUSvLQ9oiUJshRjVOMUegd66Ai0pbE
 XjdKowsTuAUMxWYtb05K5AB9enxtcNfaBm/8kHPSqsnf/Zb1EXz5deTlDOFqS94M
 SSkySeIvlKsQqZ88iMFWB0zAE3b2Jn6zmVU7641+Wvz6ccXo0+XoLlxlgV2f66ah
 +ZUQFPSjMCYH5OzgYs5jPK+VyfYQ5U848MolYZbvrNS3FoDN15gqBPStwQ==
Subject: Re: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume
 support
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
 <s5hpn0kjt31.wl-tiwai@suse.de>
 <54854cb9-99c3-4c05-3b43-f41d89a29aec@opensynergy.com>
 <s5hzgznhu3n.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <438961dc-b546-562a-26dc-53cf46ee74b6@opensynergy.com>
Date: Mon, 1 Mar 2021 16:30:55 +0100
MIME-Version: 1.0
In-Reply-To: <s5hzgznhu3n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
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

On 01.03.2021 14:38, Takashi Iwai wrote:
> On Mon, 01 Mar 2021 11:03:04 +0100,
> Anton Yakovlev wrote:
>>
>> On 28.02.2021 13:05, Takashi Iwai wrote:
>>> On Sat, 27 Feb 2021 09:59:56 +0100,
>>> Anton Yakovlev wrote:
>>>>
>>>> All running PCM substreams are stopped on device suspend and restarted
>>>> on device resume.
>>>>
>>>> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>>>> ---
>>>>    sound/virtio/virtio_card.c    | 56 +++++++++++++++++++++++++++++++++++
>>>>    sound/virtio/virtio_pcm.c     |  1 +
>>>>    sound/virtio/virtio_pcm_ops.c | 41 ++++++++++++++++++++-----
>>>>    3 files changed, 90 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
>>>> index 59455a562018..c7ae8801991d 100644
>>>> --- a/sound/virtio/virtio_card.c
>>>> +++ b/sound/virtio/virtio_card.c
>>>> @@ -323,6 +323,58 @@ static void virtsnd_remove(struct virtio_device *vdev)
>>>>         kfree(snd->event_msgs);
>>>>    }
>>>>
>>>> +#ifdef CONFIG_PM_SLEEP
>>>> +/**
>>>> + * virtsnd_freeze() - Suspend device.
>>>> + * @vdev: VirtIO parent device.
>>>> + *
>>>> + * Context: Any context.
>>>> + * Return: 0 on success, -errno on failure.
>>>> + */
>>>> +static int virtsnd_freeze(struct virtio_device *vdev)
>>>> +{
>>>> +     struct virtio_snd *snd = vdev->priv;
>>>> +
>>>> +     virtsnd_ctl_msg_cancel_all(snd);
>>>> +
>>>> +     vdev->config->del_vqs(vdev);
>>>> +     vdev->config->reset(vdev);
>>>> +
>>>> +     kfree(snd->event_msgs);
>>>> +
>>>> +     /*
>>>> +      * If the virtsnd_restore() fails before re-allocating events, then we
>>>> +      * get a dangling pointer here.
>>>> +      */
>>>> +     snd->event_msgs = NULL;
>>>> +
>>>> +     return 0;
>>>
>>> I suppose some cancel of inflight works is needed?
>>> Ditto for the device removal, too.
>>
>> It's not necessary here, since the device is reset and all of this are
>> happened automatically.
> 
> Hrm, but the reset call itself might conflict with the inflight reset
> work?  I haven't see any work canceling or flushing, so...

There maybe the following:

1. Some pending control requests -> these are cancelled in the
virtsnd_ctl_msg_cancel_all() call.

2. PCM messages -> these must not be cancelled, since they will be
requeued by driver on resume (starting with suspended position).

3. Some pending events from the device. These will be lost. Yeah, I
think we can process all pending events before destroying virtqueue.

Other that these, there are no other inflight works or so.


>> But in the device remove it makes sense also to
>> disable events before calling snd_card_free(), since the device is still
>> able to send notifications at that moment. Thanks!
>>
>>
>>>> --- a/sound/virtio/virtio_pcm.c
>>>> +++ b/sound/virtio/virtio_pcm.c
>>>> @@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>>>                 SNDRV_PCM_INFO_BATCH |
>>>>                 SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>>>                 SNDRV_PCM_INFO_INTERLEAVED |
>>>> +             SNDRV_PCM_INFO_RESUME |
>>>>                 SNDRV_PCM_INFO_PAUSE;
>>>
>>> Actually you don't need to set SNDRV_PCM_INFO_RESUME.
>>> This flag means that the driver supports the full resume procedure,
>>> which isn't often the case; with this, the driver is supposed to
>>> resume the stream exactly from the suspended position.
>>
>> If I understood you right, that's exactly how resume is implemented now
>> in the driver. Although we fully restart substream on the device side,
>> from an application point of view it is resumed exactly at the same
>> position.
>>
>>
>>> Most drivers don't set this but implement only the suspend-stop
>>> action.  Then the application (or the sound backend) will re-setup the
>>> stream and restart accordingly.
>>
>> And an application must be aware of such possible situation? Since I
>> have no doubt in alsa-lib, but I don't think that for example tinyalsa
>> can handle this right.
> 
> Tiny ALSA should work, too.  Actually there are only few drivers that
> have the full PCM resume.  The majority of drivers are without the
> resume support (including a large one like HD-audio).

Then it's a great news! Since we can simplify code a lot.


> And, with the resume implementation, I'm worried by the style like:
> 
>>>> @@ -309,6 +318,21 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
>>>>         int rc;
>>>>
>>>>         switch (command) {
>>>> +     case SNDRV_PCM_TRIGGER_RESUME: {
>>>> +             /*
>>>> +              * We restart the substream by executing the standard command
>>>> +              * sequence.
>>>> +              */
>>>> +             rc = virtsnd_pcm_hw_params(substream, NULL);
>>>> +             if (rc)
>>>> +                     return rc;
>>>> +
>>>> +             rc = virtsnd_pcm_prepare(substream);
>>>> +             if (rc)
>>>> +                     return rc;
> 
> ... and this is rather what the core code should do, and it's exactly
> the same procedure that would be done without RESUME flag.
> 
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

