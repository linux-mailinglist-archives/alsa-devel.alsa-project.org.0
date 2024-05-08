Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA98BF83E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A3E845;
	Wed,  8 May 2024 10:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A3E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156086;
	bh=o6dYzqcug6bjp99QH0Xc2b/Mh3Ae4lgbbIbqMs9s1So=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cHk11lLNWmF8pgvYjFMZzytioq86Ff4tST/DTQu2n9HvE/2EXWzG3WG7/a+zbhGGm
	 6OzabMKmC7886YOEET++EFaBfFcF1LfEH/ZkkbNxAPeSdEhbA7lRq1l16JPXeKhGFG
	 dBqCuQ54grDCMwSfk3tGRk8HHx/TlwzvDb2Wcj84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34436F8057B; Wed,  8 May 2024 10:14:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E71DF804F2;
	Wed,  8 May 2024 10:14:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AE52F8049C; Wed,  8 May 2024 10:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27354F8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27354F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YzogaM6X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715156048; x=1746692048;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o6dYzqcug6bjp99QH0Xc2b/Mh3Ae4lgbbIbqMs9s1So=;
  b=YzogaM6Xd8oNDxEG6FdRqrBJjj2lpOww7LuotDqBOJH+Xyr9ghh2u+zg
   HaPSxmBaFuGoN8bERXhpKDuRqH1KmHXPA3ggP9WW7CwHiE1JtAJBn5svL
   MXIOEOrQpfJaQZu1ikOGAMrTnJs6RHq0nisOd7zDtliaFnpaBmzx+1GAk
   1u7DjajtKEHDOQeiZsJ2SyQ+r/kJkadNePTeH7pj7X+WB2F9SuUsuW3a2
   cV4bEp+DaUgvI3K2PwndITNkNVxXMLs54rEMQguzD7aaF5gK4rGu02VyV
   8YG+u2VWbWQF6V2VJLW9UByMdK5WnEvXa+GB+FkvYRwr+EQHhSorvykjJ
   A==;
X-CSE-ConnectionGUID: RFvewdR2Tqeta2AWJkSYUw==
X-CSE-MsgGUID: nGeEsYD3SDO1DwFIYE0nRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28474502"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000";
   d="scan'208";a="28474502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 01:14:04 -0700
X-CSE-ConnectionGUID: aABURBGITHyA0xz96lfbdA==
X-CSE-MsgGUID: 8uRx8TfuRU256ZN4Nutk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000";
   d="scan'208";a="59662273"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 01:13:57 -0700
Message-ID: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
Date: Wed, 8 May 2024 10:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
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
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EMV3HGAK337EFGII6XMMNDWDU6J2YWNH
X-Message-ID-Hash: EMV3HGAK337EFGII6XMMNDWDU6J2YWNH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMV3HGAK337EFGII6XMMNDWDU6J2YWNH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> On 06/05/2024 10:49, Shengjiu Wang wrote:
>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>
>>> Em Fri, 3 May 2024 10:47:19 +0900
>>> Mark Brown <broonie@kernel.org> escreveu:
>>>
>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>
>>>>>> There are still time control associated with it, as audio and video
>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>
>>>> ...
>>>>
>>>>> Just complementing: on media, we do this per video buffer (or
>>>>> per half video buffer). A typical use case on cameras is to have
>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>> at 30 frames per second.
>>>>
>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>> desire to just go at whatever rate the hardware could support as there
>>>> is no interactive user consuming the output as it is generated.
>>>
>>> Indeed, codecs could be used to just do transcoding, but I would
>>> expect it to be a border use case. See, as the chipsets implementing
>>> codecs are typically the ones used on mobiles, I would expect that
>>> the major use cases to be to watch audio and video and to participate
>>> on audio/video conferences.
>>>
>>> Going further, the codec API may end supporting not only transcoding
>>> (which is something that CPU can usually handle without too much
>>> processing) but also audio processing that may require more
>>> complex algorithms - even deep learning ones - like background noise
>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>> and such.
>>>
>>> On other words, the typical use cases will either have input
>>> or output being a physical hardware (microphone or speaker).
>>>
>>
>> All, thanks for spending time to discuss, it seems we go back to
>> the start point of this topic again.
>>
>> Our main request is that there is a hardware sample rate converter
>> on the chip, so users can use it in user space as a component like
>> software sample rate converter. It mostly may run as a gstreamer plugin.
>> so it is a memory to memory component.
>>
>> I didn't find such API in ALSA for such purpose, the best option for this
>> in the kernel is the V4L2 memory to memory framework I found.
>> As Hans said it is well designed for memory to memory.
>>
>> And I think audio is one of 'media'.  As I can see that part of Radio
>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>> function is in DRM, part of HDMI function is in ALSA...
>> So using V4L2 for audio is not new from this point of view.
>>
>> Even now I still think V4L2 is the best option, but it looks like there
>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>> a duplication of code (bigger duplication that just add audio support
>> in V4L2 I think).
> 
> After reading this thread I still believe that the mem2mem framework is
> a reasonable option, unless someone can come up with a method that is
> easy to implement in the alsa subsystem. From what I can tell from this
> discussion no such method exists.
> 

Hi,

my main question would be how is mem2mem use case different from 
loopback exposing playback and capture frontends in user space with DSP 
(or other piece of HW) in the middle?

Amadeusz

