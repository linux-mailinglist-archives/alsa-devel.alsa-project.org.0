Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D31BF822
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 14:20:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABDD8168A;
	Thu, 30 Apr 2020 14:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABDD8168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588249217;
	bh=WuAj7CujJVQg2QGmb7VuVZBHuB0DBpvRKzAoAmqHk+g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFxUPt2Mz+PtVDs6ilsBBCcZeVW3y85ElKwIpTnEw8D69HhUPK5/C9t5939vmjfXE
	 shOoT1Z1+HWfxTTo00Yn30Dllf0dlB42qXnKEhZINBHjrunfOYwTHfxr/NJs/Lwxkw
	 K8cCBPLTFunrUTwh0g+jWiuW4/ndjdFRW/ATcoQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1DBF800B6;
	Thu, 30 Apr 2020 14:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC91F801DB; Thu, 30 Apr 2020 14:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EAB4F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 14:18:01 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B85EAA0049;
 Thu, 30 Apr 2020 14:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B85EAA0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1588249080; bh=kSThcjYaLU2W/yRFT3bl2//s2xiXdaMIN34TmTupPbM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rDENUDqq6gH+CqMSLpyhawXMIvFESCSgdmJRsGDTpH6YOaVe5EIZz6AsFgOz5PfC4
 4Wh2MLRXCU6ectWORTcWaW1MmytYI4gCGYpa8+KOUhsSLI4b9QD8h9Wr4d5B++FLSg
 0tiFg/od2pzJnHz2N3yO0cqSQkjfUMkOxbVIC4/Y=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 30 Apr 2020 14:17:56 +0200 (CEST)
Subject: Re: Functionality of pcm_notify in snd-aloop?
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
 <61d837f1-de1a-7aa6-ca8f-d0cfaa36ea69@perex.cz>
 <28a05a44-55bf-1831-aa3c-875e0499caea@ivitera.com>
 <28063dd1-71ab-a313-04b8-f4d97312b1b5@ivitera.com>
 <a325c165-5ced-618b-0b71-c0c4381473a1@perex.cz>
 <s5hmu6vlin9.wl-tiwai@suse.de>
 <alpine.DEB.2.21.2004281910520.2957@eliteleevi.tm.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f6fa39ec-9675-ce3c-c77e-3a438433ea6b@perex.cz>
Date: Thu, 30 Apr 2020 14:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004281910520.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Dne 28. 04. 20 v 18:19 Kai Vehmanen napsal(a):
> Hey,
> 
> On Tue, 28 Apr 2020, Takashi Iwai wrote:
> 
>> I believe the missing piece here is a generic way to tell user-space
>> that the stream got invalidated.  This would be useful not only for
>> aloop but can be applied in general when a stream becomes temporarily
>> unavailable (e.g. the HDMI monitor disconnected or the DSP route
>> switched).
> 
> ack on that. I've been preparing this patch to add -ENODATA to alsa-lib
> documentation:
> "[RFC] pcm: add documentation for -ENODATA error code handling"
> https://github.com/kv2019i/alsa-lib/commit/87b298106e04054489ee93b26a610e37f99a3171
> 
> Have not yet had time to send a proper version to the list, but it's
> addressing specifically this need. This would serve as the interface for
> SOF DSP to tell that a given PCM node will not be providing data (as the
> DSP topology is not fully connected) [1].
> 
> To test the above, I've used a small hack to aplay/arecord that keeps
> trying to restart the PCM after a delay, in case -ENODATA is returned:
> https://github.com/kv2019i/alsa-utils/commit/a2ba541ea0b3e86a65687de88a41f10cf0a8ddc2

This code calls wrongly snd_pcm_resume() here. Also, we should really think 
about the whole mechanism when the stream cannot be activated (also for 
playback - Intel HDMI LPE driver [2]). I mean that the poll multiplexer should 
handle this state, too. If we don't find a way to notify the user space that 
the stream can be started using the poll(), we can use another interface like 
control API for the notifications.

We may also instroduce a new PCM state "WAIT" to wait on the hardware / link 
availability (SETUP -> -ENODATA -> WAIT -> use poll() for the link status -> 
success -> SETUP -> PREPARE) - talking about SNDRV_PCM_STATE states here.

					Jaroslav


> [1] https://github.com/thesofproject/sof/issues/2564

[2] 
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/blob/36a4923f9bd05d4c5e2e8b1765f18edf452b9251/src/modules/alsa/module-alsa-card.c#L928-933


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
