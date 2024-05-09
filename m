Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A98C0E2D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 12:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82003E94;
	Thu,  9 May 2024 12:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82003E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715250555;
	bh=WyFpQ0k8HdqYaWkmfZ1u2cEJdO2FRTL/hHX9iaGsmUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GKwZxO6cVBcN9/PG4n1cPE/Xo0rbRGyvDgiT97n1TmxFZvwA1IJuZRvbeSdKKHTTy
	 75aW6DbL4EJI+MA4CZ4fRYUgj8PI+ZGMz5swx2qN9p0Djzw5Q9CZly9QUKgsp/IOQQ
	 aIz7NIiBdziUej9iQdmKTV5gEz8cCC1Ma1CfsPk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD158F804FB; Thu,  9 May 2024 12:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 557D5F805A0;
	Thu,  9 May 2024 12:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 985F3F80423; Thu,  9 May 2024 12:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD261F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD261F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PWvvzY9/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715250498; x=1746786498;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WyFpQ0k8HdqYaWkmfZ1u2cEJdO2FRTL/hHX9iaGsmUo=;
  b=PWvvzY9/GwGk6w/7MjLSiopR1iQE8e9OUb6VtaWM5MqHgN9bO2JUPwke
   LTPeRfqGiN1q8yxC8+qkgCS1v4ntKoXQf38VghK4JFsPE5VjkVAOEzMFc
   9+L4nn2ijFkC4aJU2l/Kg3Zo50xpqSxDMI/iDGwbizvstPbocE3oSI1zs
   C2YYovgrhEReZw8Ms2znwjhFQUxy4Ub9JwZWjiDZYEf5RiZbXjS5Hqc0w
   EgP9kyIVHVS/7bxGYvLW/6sBiOJzRvfrc23QG0SBmiCUWjJ4Q2T0S82JU
   +6p2dAUqspUm8peLqQjz6vfX+9u5SOwOsrPoc+AdFhLLRWIDNLKLpuV+y
   A==;
X-CSE-ConnectionGUID: cuIHBiaaQ5qjbtjh0rNlCw==
X-CSE-MsgGUID: TIlTAI/LQsirzTwDiWAzyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11323103"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="11323103"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:28:10 -0700
X-CSE-ConnectionGUID: n6mAF0lMSFOEwlyT/akNtw==
X-CSE-MsgGUID: phT5cmTqTSmNBKWBoblhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="29274939"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:28:05 -0700
Message-ID: <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
Date: Thu, 9 May 2024 12:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>,
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
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZAUS3O7X46JCHGTHKTVT2OQLMJHBPKDX
X-Message-ID-Hash: ZAUS3O7X46JCHGTHKTVT2OQLMJHBPKDX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAUS3O7X46JCHGTHKTVT2OQLMJHBPKDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/9/2024 12:12 PM, Shengjiu Wang wrote:
> On Thu, May 9, 2024 at 5:50 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
>>> On Wed, May 8, 2024 at 4:14 PM Amadeusz Sławiński
>>> <amadeuszx.slawinski@linux.intel.com> wrote:
>>>>
>>>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
>>>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
>>>>>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>>>>>
>>>>>>> Em Fri, 3 May 2024 10:47:19 +0900
>>>>>>> Mark Brown <broonie@kernel.org> escreveu:
>>>>>>>
>>>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>>>>>
>>>>>>>>>> There are still time control associated with it, as audio and video
>>>>>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>>>>>
>>>>>>>> ...
>>>>>>>>
>>>>>>>>> Just complementing: on media, we do this per video buffer (or
>>>>>>>>> per half video buffer). A typical use case on cameras is to have
>>>>>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>>>>>> at 30 frames per second.
>>>>>>>>
>>>>>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>>>>>> desire to just go at whatever rate the hardware could support as there
>>>>>>>> is no interactive user consuming the output as it is generated.
>>>>>>>
>>>>>>> Indeed, codecs could be used to just do transcoding, but I would
>>>>>>> expect it to be a border use case. See, as the chipsets implementing
>>>>>>> codecs are typically the ones used on mobiles, I would expect that
>>>>>>> the major use cases to be to watch audio and video and to participate
>>>>>>> on audio/video conferences.
>>>>>>>
>>>>>>> Going further, the codec API may end supporting not only transcoding
>>>>>>> (which is something that CPU can usually handle without too much
>>>>>>> processing) but also audio processing that may require more
>>>>>>> complex algorithms - even deep learning ones - like background noise
>>>>>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>>>>>> and such.
>>>>>>>
>>>>>>> On other words, the typical use cases will either have input
>>>>>>> or output being a physical hardware (microphone or speaker).
>>>>>>>
>>>>>>
>>>>>> All, thanks for spending time to discuss, it seems we go back to
>>>>>> the start point of this topic again.
>>>>>>
>>>>>> Our main request is that there is a hardware sample rate converter
>>>>>> on the chip, so users can use it in user space as a component like
>>>>>> software sample rate converter. It mostly may run as a gstreamer plugin.
>>>>>> so it is a memory to memory component.
>>>>>>
>>>>>> I didn't find such API in ALSA for such purpose, the best option for this
>>>>>> in the kernel is the V4L2 memory to memory framework I found.
>>>>>> As Hans said it is well designed for memory to memory.
>>>>>>
>>>>>> And I think audio is one of 'media'.  As I can see that part of Radio
>>>>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>>>>>> function is in DRM, part of HDMI function is in ALSA...
>>>>>> So using V4L2 for audio is not new from this point of view.
>>>>>>
>>>>>> Even now I still think V4L2 is the best option, but it looks like there
>>>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>>>>>> a duplication of code (bigger duplication that just add audio support
>>>>>> in V4L2 I think).
>>>>>
>>>>> After reading this thread I still believe that the mem2mem framework is
>>>>> a reasonable option, unless someone can come up with a method that is
>>>>> easy to implement in the alsa subsystem. From what I can tell from this
>>>>> discussion no such method exists.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> my main question would be how is mem2mem use case different from
>>>> loopback exposing playback and capture frontends in user space with DSP
>>>> (or other piece of HW) in the middle?
>>>>
>>> I think loopback has a timing control,  user need to feed data to playback at a
>>> fixed time and get data from capture at a fixed time.  Otherwise there
>>> is xrun in
>>> playback and capture.
>>>
>>> mem2mem case: there is no such timing control,  user feeds data to it
>>> then it generates output,  if user doesn't feed data, there is no xrun.
>>> but mem2mem is just one of the components in the playback or capture
>>> pipeline, overall there is time control for whole pipeline,
>>>
>>
>> Have you looked at compress streams? If I remember correctly they are
>> not tied to time due to the fact that they can pass data in arbitrary
>> formats?
>>
>> From:
>> https://docs.kernel.org/sound/designs/compress-offload.html
>>
>> "No notion of underrun/overrun. Since the bytes written are compressed
>> in nature and data written/read doesn’t translate directly to rendered
>> output in time, this does not deal with underrun/overrun and maybe dealt
>> in user-library"
> 
> I checked the compress stream. mem2mem case is different with
> compress-offload case
> 
> compress-offload case is a full pipeline,  the user sends a compress
> stream to it, then DSP decodes it and renders it to the speaker in real
> time.
> 
> mem2mem is just like the decoder in the compress pipeline. which is
> one of the components in the pipeline.

I was thinking of loopback with endpoints using compress streams, 
without physical endpoint, something like:

compress playback (to feed data from userspace) -> DSP (processing) -> 
compress capture (send data back to userspace)

Unless I'm missing something, you should be able to process data as fast 
as you can feed it and consume it in such case.

Amadeusz
