Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A332328087
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 15:19:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A71167C;
	Mon,  1 Mar 2021 15:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A71167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614608340;
	bh=WZslZZga5ymQjqh7dc57LSIgwggxeCRu1ZUaxiyQ2ik=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKftpqc/Y0N0Z15KTyDFg3gTjvdB55npUBfDJO24BoTTjfdyrpOi4R1GoXjC2YKUr
	 QQUBgICN5NnqIX6kkCXkhsUyKThfvulTZbH29VUCFkyWrWp6Reqb7G/cUPPTjdmv0m
	 4OptXzFqVEH9FMp5qBOoi8C9y3QtgyeF37QZa6+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1D4F80272;
	Mon,  1 Mar 2021 10:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB244F8027D; Mon,  1 Mar 2021 10:29:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A891DF80272
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 10:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A891DF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="njrad0q9"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 98005A1340;
 Mon,  1 Mar 2021 10:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=AF2+aLbHpYk6
 yxg/KMusF89bfRVX3X9/VCCjZ8mooHU=; b=njrad0q9gBYFdXuKLLKrdMQiJrmC
 2BkUzmkCM+/7GTmtBRL4KEei2E9d4aTwbewItdx8ywzFTZ+Wq+o0YIf8ctZOxS6s
 pWUn/fd83sGZ/mCG1K5YR5fADtw4ahaRbEnXVRkPL6sL2RWJlDxJ4xow1k7GxPEl
 wsNo0I+0+kfO+5odG3fJVrIfyApV8XWZNWyz1D/U2mYX25e+aY8VQk5NmK18oKUf
 AXuAStUtmc5vLAuHdldToU4L4wQobXvwR0KNh3CO0PUQIgSbPn1tUFY+nQuOALEY
 zXBiH5ZcCoYx9U6bwN5/r1O8apbH0HBuDUG76grDuZ0I2zjZIrk1jMc/Zw==
Subject: Re: [PATCH v6 6/9] ALSA: virtio: PCM substream operators
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-7-anton.yakovlev@opensynergy.com>
 <s5hr1l0juld.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <f8a4bbf5-3bee-f336-0efd-94410184fb2b@opensynergy.com>
Date: Mon, 1 Mar 2021 10:29:24 +0100
MIME-Version: 1.0
In-Reply-To: <s5hr1l0juld.wl-tiwai@suse.de>
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

On 28.02.2021 12:32, Takashi Iwai wrote:
> On Sat, 27 Feb 2021 09:59:53 +0100,
> Anton Yakovlev wrote:
>>


[snip]


>> +static snd_pcm_uframes_t
>> +virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
>> +{
>> +     struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
>> +     snd_pcm_uframes_t hw_ptr = SNDRV_PCM_POS_XRUN;
>> +     unsigned long flags;
>> +
>> +     spin_lock_irqsave(&vss->lock, flags);
>> +     if (!vss->xfer_xrun)
>> +             hw_ptr = bytes_to_frames(substream->runtime, vss->hw_ptr);
>> +     spin_unlock_irqrestore(&vss->lock, flags);
> 
> Oh, and if we drop nonatomc PCM, both trigger and pointer callbacks
> are guaranteed to be called inside the spinlock, hence you can remove
> *_irqsave() but just us spin_lock() in those two callbacks.

As I understand, spin_lock_irqsave() disables only local interrupts. But
what about other CPU cores?


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

