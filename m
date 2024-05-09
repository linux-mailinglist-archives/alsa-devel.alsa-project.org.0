Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634828C0DC9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1FCE7F;
	Thu,  9 May 2024 11:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1FCE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715248283;
	bh=i8Tcy47JtAfE3qGJMX+JxGT4J+DXn0tOPIC16byV3A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVpxzGWDC/twCX7VJS2anzg3eoWqGeXq29sZfJiQRG1QjMw5nsSJD+R1DQX4Hp6oW
	 Vtcrvkfb94Z91HAIIt83Mz8vz9B8/J17hptsu2/+8G6ees1sM7RaJWLvzqW9yQiQfi
	 brb5eFG5QzCQIbtEe7W0hG3cPTaAt+pCMMWSEt2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABAB4F805AE; Thu,  9 May 2024 11:50:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15ED7F805A1;
	Thu,  9 May 2024 11:50:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 045E4F80423; Thu,  9 May 2024 11:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E33E2F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 11:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E33E2F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IddiY/hy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715248230; x=1746784230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i8Tcy47JtAfE3qGJMX+JxGT4J+DXn0tOPIC16byV3A8=;
  b=IddiY/hyTRfSvnzDpuvMyDO2PJHTwwk5O5IYdD07K3h0b4wNWy/C8Om5
   VTRuU/hGgMbqihtmfYEVLYSvQSxobMQ1JzYwm7dNxBsvgb5sHNiSAqjVi
   mNRW2beK9p6NxaH1WgcvQjWukdTcJF5VW0hIQplYyGx6vJEpUPxh2IXM+
   U+J3xPhkzXhe8wLUV5VTNyONdm+0WLI1hdDs9WWVugvQguNlVC/GF1fDS
   qOOgaAkj/4Z41PvCgfxZhhP1WjoC/CDLElrwANmeywiMp4pLTumZ1q3iL
   268exoC7fF4z/Xd2BOTdA7qcdlCXEN2LS+bqwrCD817QFymiwiY+TnwqP
   g==;
X-CSE-ConnectionGUID: VR/xqFVkQx2CRRwEJ68DEQ==
X-CSE-MsgGUID: LTbwEL7mS9O1BvNlXurciw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11027317"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="11027317"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 02:50:27 -0700
X-CSE-ConnectionGUID: 6vFJtDrKTBGjOGnCrQwHrw==
X-CSE-MsgGUID: r+G2E7a9R/2WR9uMvSaRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="33984324"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 02:50:22 -0700
Message-ID: <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
Date: Thu, 9 May 2024 11:50:19 +0200
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZVHUJX3KIJXFALHZPDAO6BSEJMFR33Z
X-Message-ID-Hash: 3ZVHUJX3KIJXFALHZPDAO6BSEJMFR33Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZVHUJX3KIJXFALHZPDAO6BSEJMFR33Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> On Wed, May 8, 2024 at 4:14 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
>>>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>>>
>>>>> Em Fri, 3 May 2024 10:47:19 +0900
>>>>> Mark Brown <broonie@kernel.org> escreveu:
>>>>>
>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>>>
>>>>>>>> There are still time control associated with it, as audio and video
>>>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> Just complementing: on media, we do this per video buffer (or
>>>>>>> per half video buffer). A typical use case on cameras is to have
>>>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>>>> at 30 frames per second.
>>>>>>
>>>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>>>> desire to just go at whatever rate the hardware could support as there
>>>>>> is no interactive user consuming the output as it is generated.
>>>>>
>>>>> Indeed, codecs could be used to just do transcoding, but I would
>>>>> expect it to be a border use case. See, as the chipsets implementing
>>>>> codecs are typically the ones used on mobiles, I would expect that
>>>>> the major use cases to be to watch audio and video and to participate
>>>>> on audio/video conferences.
>>>>>
>>>>> Going further, the codec API may end supporting not only transcoding
>>>>> (which is something that CPU can usually handle without too much
>>>>> processing) but also audio processing that may require more
>>>>> complex algorithms - even deep learning ones - like background noise
>>>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>>>> and such.
>>>>>
>>>>> On other words, the typical use cases will either have input
>>>>> or output being a physical hardware (microphone or speaker).
>>>>>
>>>>
>>>> All, thanks for spending time to discuss, it seems we go back to
>>>> the start point of this topic again.
>>>>
>>>> Our main request is that there is a hardware sample rate converter
>>>> on the chip, so users can use it in user space as a component like
>>>> software sample rate converter. It mostly may run as a gstreamer plugin.
>>>> so it is a memory to memory component.
>>>>
>>>> I didn't find such API in ALSA for such purpose, the best option for this
>>>> in the kernel is the V4L2 memory to memory framework I found.
>>>> As Hans said it is well designed for memory to memory.
>>>>
>>>> And I think audio is one of 'media'.  As I can see that part of Radio
>>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>>>> function is in DRM, part of HDMI function is in ALSA...
>>>> So using V4L2 for audio is not new from this point of view.
>>>>
>>>> Even now I still think V4L2 is the best option, but it looks like there
>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>>>> a duplication of code (bigger duplication that just add audio support
>>>> in V4L2 I think).
>>>
>>> After reading this thread I still believe that the mem2mem framework is
>>> a reasonable option, unless someone can come up with a method that is
>>> easy to implement in the alsa subsystem. From what I can tell from this
>>> discussion no such method exists.
>>>
>>
>> Hi,
>>
>> my main question would be how is mem2mem use case different from
>> loopback exposing playback and capture frontends in user space with DSP
>> (or other piece of HW) in the middle?
>>
> I think loopback has a timing control,  user need to feed data to playback at a
> fixed time and get data from capture at a fixed time.  Otherwise there
> is xrun in
> playback and capture.
> 
> mem2mem case: there is no such timing control,  user feeds data to it
> then it generates output,  if user doesn't feed data, there is no xrun.
> but mem2mem is just one of the components in the playback or capture
> pipeline, overall there is time control for whole pipeline,
> 

Have you looked at compress streams? If I remember correctly they are 
not tied to time due to the fact that they can pass data in arbitrary 
formats?

From:
https://docs.kernel.org/sound/designs/compress-offload.html

"No notion of underrun/overrun. Since the bytes written are compressed 
in nature and data written/read doesn’t translate directly to rendered 
output in time, this does not deal with underrun/overrun and maybe dealt 
in user-library"

Amadeusz
