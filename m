Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0E788B78
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 16:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A9083B;
	Fri, 25 Aug 2023 16:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A9083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692973046;
	bh=WF81HItmLhcamYJ61blP/cQN/qo5FWxWc7o0kyx/by4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dZmU4808dBy+XKyMnADi16jYHRw6hE8fksrTwXNy3c/gt6UBLzhJmEnzcjZf0kDyn
	 kw6ek/W/dpJ/AcfXgok/UvJGgFD9yAkJ6+hSaMHgXV1b/I8/3wAP9oFPJjcVeusUlm
	 rp2/9BYt6Jc5Om6hz/4NpUMvNPH631c1GVp4v/nI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D674F80074; Fri, 25 Aug 2023 16:16:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D176BF800D1;
	Fri, 25 Aug 2023 16:16:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C2AF800F5; Fri, 25 Aug 2023 16:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-7.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 260D1F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 16:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260D1F80074
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFBBD622FC;
	Fri, 25 Aug 2023 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F3CC433C8;
	Fri, 25 Aug 2023 14:15:54 +0000 (UTC)
Message-ID: <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
Date: Fri, 25 Aug 2023 16:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Content-Language: en-US, nl
To: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
 <87wmxk8jaq.wl-tiwai@suse.de> <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
 <CAA+D8AM_pqbjQaE59n6Qm5gypLb8zPAwOpJR+_ZEG89-q3B8pg@mail.gmail.com>
 <8735076xdn.wl-tiwai@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <8735076xdn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7N3INWUC6TS6U3PXQ4NRWXKFVBW6EK4
X-Message-ID-Hash: O7N3INWUC6TS6U3PXQ4NRWXKFVBW6EK4
X-MailFrom: SRS0=D0gj=EK=xs4all.nl=hverkuil@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7N3INWUC6TS6U3PXQ4NRWXKFVBW6EK4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/08/2023 15:54, Takashi Iwai wrote:
> On Fri, 25 Aug 2023 05:46:43 +0200,
> Shengjiu Wang wrote:
>>
>> On Fri, Aug 25, 2023 at 4:21 AM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> On Thu, Aug 24, 2023 at 07:03:09PM +0200, Takashi Iwai wrote:
>>>> Shengjiu Wang wrote:
>>>
>>>>> But there are several issues:
>>>>> 1. Need to create sound cards.  ASRC module support multi instances, then
>>>>> need to create multi sound cards for each instance.
>>>
>>>> Hm, why can't it be multiple PCM instances instead?
>>>
>>> I'm having a hard time following this one too.
>>>
>>>>> 2. The ASRC is an entirety but with DPCM we need to separate input port and
>>>>> output port to playback substream and capture stream. Synchronous between
>>>>> playback substream and capture substream is a problem.
>>>>> How to start them and stop them at the same time.
>>>
>>>> This could be done by enforcing the full duplex and linking the both
>>>> PCM streams, I suppose.
>>>
>>>>> So shall we make the decision that we can go to the V4L2 solution?
>>>
>>>> Honestly speaking, I don't mind much whether it's implemented in V2L4
>>>> or not -- at least for the kernel part, we can reorganize / refactor
>>>> things internally.  But, the biggest remaining question to me is
>>>> whether this user-space interface is the most suitable one.  Is it
>>>> well defined, usable and maintained for the audio applications?  Or
>>>> is it meant to be a stop-gap for a specific use case?
>>>
>>> I'm having a really hard time summoning much enthusiasm for using v4l
>>> here, it feels like this is heading down the same bodge route as DPCM
>>> but directly as ABI so even harder to fix properly.  That said all the
>>> ALSA APIs are really intended to be used in real time and this sounds
>>> like a non real time application?  I don't fully understand what the
>>> actual use case is here.
>>
>> Thanks for your reply.
>>
>> This asrc memory to memory (memory ->asrc->memory) case is a non
>> real time use case.
>>
>> User fills the input buffer to the asrc module,  after conversion, then asrc
>> sends back the output buffer to user. So it is not a traditional ALSA playback
>> and capture case. I think it is not good to create sound card for it,  it is
>> not a sound card actually.
>>
>> It is a specific use case,  there is no reference in current kernel.
>> v4l2 memory to memory is the closed implementation,  v4l2 current
>> support video, image, radio, tuner, touch devices, so it is not
>> complicated to add support for this specific audio case.
>>
>> Maybe you can go through these patches first.  Because we
>> had implemented the "memory -> asrc ->i2s device-> codec"
>> use case in ALSA.  Now the "memory->asrc->memory" needs
>> to reuse the code in asrc driver, so the first 3 patches is for refining
>> the code to make it can be shared by the "memory->asrc->memory"
>> driver.
>>
>> The main change is in the v4l2 side, A /dev/vl42-audio will be created,
>> user applications only use the ioctl of v4l2 framework.
> 
> Ah, now I'm slowly understanding.  So, what you want is to have an
> interface to perform the batch conversion of a data stream from an
> input to an output?  And ALSA PCM interface doesn't fit fully for that
> purpose because the data handling is batched and it's not like a
> normal PCM streaming?
> 
> Basically the whole M2M arguments are rather subtle.  Those are
> implementation details that can be resolved in several different ways
> in the kernel side.  But the design of the operation is the crucial
> point.
> 
> Maybe we can consider implementing a similar feature in ALSA API, too.
> But it's too far-stretched for now.
> 
> So, if v4l2 interface provides the requested feature (the batched
> audio stream conversion), it's OK to ride on it.

The V4L2 M2M interface is simple: you open a video device and then you can
pass data to the hardware, it processes it and you get the processed data back.

The hardware just processes the data as fast as it can. Each time you open
the video device a new instance is created, and each instance can pass jobs
to the hardware.

Currently it is used for video scalers, deinterlacers, colorspace converters and
codecs, but in the end it is just data in, data out with some job scheduling (fifo)
towards the hardware. So supporting audio using the same core m2m framework wouldn't
be a big deal. We'd probably make a /dev/v4l-audio device for that.

It doesn't come for free: it is a new API, so besides adding support for it, it
also needs to be documented, we would need compliance tests, and very likely I
would want a new virtual driver for this (vim2m.c would be a good template).

Regards,

	Hans
