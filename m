Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14528BF7F3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1341E0F;
	Wed,  8 May 2024 10:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1341E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715155396;
	bh=iLf9Ouu1QPRwGrPweRhD0n9EL/v/ovbHy4unzhJAu4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSUPuMDz9LuWzYe4t2wdmBY5mFgZhrkTJ0B64J0zNedhTyoFSYOKgIrduI8UYUvVD
	 0ISd+EcEm1cOXiCxhW59A0yyo93wYn88AWi8mBj3WUHl2wWx4v/iAOBXWJ5odnBHJs
	 StHUtG8cc6GePwP2RoD0d9TlZgyDs2YE9ycZQoLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D02D7F805B0; Wed,  8 May 2024 10:02:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1EC7F805B3;
	Wed,  8 May 2024 10:02:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE2DF8049C; Wed,  8 May 2024 10:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FB02F8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FB02F8024C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77BC3CE17F8;
	Wed,  8 May 2024 08:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F6BC113CC;
	Wed,  8 May 2024 08:01:00 +0000 (UTC)
Message-ID: <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
Date: Wed, 8 May 2024 10:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: 
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BN774JT2WMQ6IHNW3IV3PHZ3PIND3GLF
X-Message-ID-Hash: BN774JT2WMQ6IHNW3IV3PHZ3PIND3GLF
X-MailFrom: SRS0=unKQ=ML=xs4all.nl=hverkuil@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BN774JT2WMQ6IHNW3IV3PHZ3PIND3GLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/05/2024 10:49, Shengjiu Wang wrote:
> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>
>> Em Fri, 3 May 2024 10:47:19 +0900
>> Mark Brown <broonie@kernel.org> escreveu:
>>
>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>
>>>>> There are still time control associated with it, as audio and video
>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>
>>> ...
>>>
>>>> Just complementing: on media, we do this per video buffer (or
>>>> per half video buffer). A typical use case on cameras is to have
>>>> buffers transferred 30 times per second, if the video was streamed
>>>> at 30 frames per second.
>>>
>>> IIRC some big use case for this hardware was transcoding so there was a
>>> desire to just go at whatever rate the hardware could support as there
>>> is no interactive user consuming the output as it is generated.
>>
>> Indeed, codecs could be used to just do transcoding, but I would
>> expect it to be a border use case. See, as the chipsets implementing
>> codecs are typically the ones used on mobiles, I would expect that
>> the major use cases to be to watch audio and video and to participate
>> on audio/video conferences.
>>
>> Going further, the codec API may end supporting not only transcoding
>> (which is something that CPU can usually handle without too much
>> processing) but also audio processing that may require more
>> complex algorithms - even deep learning ones - like background noise
>> removal, echo detection/removal, volume auto-gain, audio enhancement
>> and such.
>>
>> On other words, the typical use cases will either have input
>> or output being a physical hardware (microphone or speaker).
>>
> 
> All, thanks for spending time to discuss, it seems we go back to
> the start point of this topic again.
> 
> Our main request is that there is a hardware sample rate converter
> on the chip, so users can use it in user space as a component like
> software sample rate converter. It mostly may run as a gstreamer plugin.
> so it is a memory to memory component.
> 
> I didn't find such API in ALSA for such purpose, the best option for this
> in the kernel is the V4L2 memory to memory framework I found.
> As Hans said it is well designed for memory to memory.
> 
> And I think audio is one of 'media'.  As I can see that part of Radio
> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> function is in DRM, part of HDMI function is in ALSA...
> So using V4L2 for audio is not new from this point of view.
> 
> Even now I still think V4L2 is the best option, but it looks like there
> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> a duplication of code (bigger duplication that just add audio support
> in V4L2 I think).

After reading this thread I still believe that the mem2mem framework is
a reasonable option, unless someone can come up with a method that is
easy to implement in the alsa subsystem. From what I can tell from this
discussion no such method exists.

>From the media side there are arguments that it adds extra maintenance
load, which is true, but I believe that it is quite limited in practice.

That said, perhaps we should make a statement that while we support the
use of audio m2m drivers, this is only for simple m2m audio processing like
this driver, specifically where there is a 1-to-1 mapping between input and
output buffers. At this point we do not want to add audio codec support or
similar complex audio processing.

Part of the reason is that codecs are hard, and we already have our hands
full with all the video codecs. Part of the reason is that the v4l2-mem2mem
framework probably needs to be forked to make a more advanced version geared
towards codecs since the current framework is too limiting for some of the
things we want to do. It was really designed for scalers, deinterlacers, etc.
and the codec support was added later.

If we ever allow such complex audio processing devices, then we would have
to have another discussion, and I believe that will only be possible if
most of the maintenance load would be on the alsa subsystem where the audio
experts are.

So my proposal is to:

1) add a clear statement to dev-audio-mem2mem.rst (patch 08/16) that only
   simple audio devices with a 1-to-1 mapping of input to output buffer are
   supported. Perhaps also in videodev2.h before struct v4l2_audio_format.

2) I will experiment a bit trying to solve the main complaint about creating
   new audio fourcc values and thus duplicating existing SNDRV_PCM_FORMAT_
   values. I have some ideas for that.

But I do not want to spend time on 2 until we agree that this is the way
forward.

Regards,

	Hans
