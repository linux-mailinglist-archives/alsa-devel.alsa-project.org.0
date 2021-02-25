Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156FF324FBF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 13:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFE51693;
	Thu, 25 Feb 2021 13:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFE51693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614255376;
	bh=uFDgy+KoJ0VbtXjl8aAaApVtmL6eBmYsyrTZoYx4nMk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbWzPqOQbJnUKWuM+0dVE1OkmRKCQXlSq37+powu/yGULKNJWtwcdx8RvGOavFCp3
	 F2XfJXDwrOY5qtqXSnrPb9OltjylWJu3L2S8YO3Cxjj9mF34mLCoPTZ6ysB1tKjFcz
	 4xn3r5qWAitUTFjPTRFv2X1OpiqtTZYXxtUyrI+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B90F8016D;
	Thu, 25 Feb 2021 13:14:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33B0F8016A; Thu, 25 Feb 2021 13:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72095F800D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 13:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72095F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="G84w91d1"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 44471A06F5;
 Thu, 25 Feb 2021 13:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=tsvHDlnqSzD6
 yifbwIkb7LBXJuGwyXOyWV+yVzi4100=; b=G84w91d1T9lH3djLLcOGRc4cIZ4v
 djJeKodpta0rHWo8XqOqFYCrvJR/pbd+e/0qggFRXzKFvmv7AmJ9z/AnGR4832KL
 kzz1FeygLg0MA0XYDyZanT+CZ+tjorlXscycxAN176GW4aDD20q3pC7VMvRic6mR
 ESw3CoT1Fa4X4oanD6fgCGeTu5LCc2kd5hcSCnTeLTqpFE+1PQNieX829jtJ6uRB
 3Hlf6df6K1Bfqt1UykpiGlc/Gh/nrHTKfxKI0f3G2KLP80afENBYh/hlHgb4ut0+
 LNrWQyz1HiaBbzUl+UEQ0fPOpmJzckdPtwEAcoslNZBKfokyPCftiDPs2w==
Subject: Re: [PATCH v5 6/9] ALSA: virtio: PCM substream operators
To: Takashi Iwai <tiwai@suse.de>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210222153444.348390-7-anton.yakovlev@opensynergy.com>
 <s5h35xkquvj.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <d9b6e8fa-7356-1cbf-029b-6f7c8bad4994@opensynergy.com>
Date: Thu, 25 Feb 2021 13:14:37 +0100
MIME-Version: 1.0
In-Reply-To: <s5h35xkquvj.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
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

On 25.02.2021 11:55, Takashi Iwai wrote:
> On Mon, 22 Feb 2021 16:34:41 +0100,
> Anton Yakovlev wrote:
>> +static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
>> +{
>> +     struct virtio_pcm *vpcm = snd_pcm_substream_chip(substream);
>> +     struct virtio_pcm_substream *vss = NULL;
>> +
>> +     if (vpcm) {
>> +             switch (substream->stream) {
>> +             case SNDRV_PCM_STREAM_PLAYBACK:
>> +             case SNDRV_PCM_STREAM_CAPTURE: {
> 
> The switch() here looks superfluous.  The substream->stream must be a
> good value in the callback.  If any, you can put WARN_ON() there, but
> I don't think it worth.

At least it doesn't do any harm. If something really went wrong, we can
check it right in the open callback, which is called the very first.


>> +static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
>> +                              struct snd_pcm_hw_params *hw_params)
>> +{
> ....
>> +     return virtsnd_pcm_msg_alloc(vss, periods, period_bytes);
> 
> We have the allocation, but...
> 
>> +static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
>> +{
>> +     return 0;
> 
> ... no release at hw_free()?
> I know that the free is present in the allocator, but it's only for
> re-allocation case, I suppose.

When the substream stops, sync_ptr waits until the device has completed
all pending messages. This wait can be interrupted either by a signal or
due to a timeout. In this case, the device can still access messages
even after calling hw_free(). It can also issue an interrupt, and the
interrupt handler will also try to access message structures. Therefore,
freeing of already allocated messages occurs either in hw_params() or in
dev->release(), since there it is 100% safe.


> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

