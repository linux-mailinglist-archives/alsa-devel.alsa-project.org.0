Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A979976CCA8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D90823;
	Wed,  2 Aug 2023 14:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D90823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690979374;
	bh=TXuAgxHunLJJxrL5wSYaAHeTtJZzlzBxCWH0S+5j/40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VzcMT4IBI1dMlL5ZKJMJ9Bl3J0uhVSIde05GypubofzmHv2DIy7Qu4ALr2oqkHMC9
	 vPSVG2gcmM2xzRaLIIvVBokwJWw4eHgzzqfkf/w3dp/MbVHT8a7Y4G8g4qUJ8r+KL+
	 XNR+fwPPJH9d1weSF4kPWBJg0S1hTwr6AQZxeYgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ECB3F80425; Wed,  2 Aug 2023 14:28:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FDFDF8025A;
	Wed,  2 Aug 2023 14:28:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D62DF802BE; Wed,  2 Aug 2023 14:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C59AF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C59AF80149
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA9FA61957;
	Wed,  2 Aug 2023 12:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6596C433C7;
	Wed,  2 Aug 2023 12:28:15 +0000 (UTC)
Message-ID: <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
Date: Wed, 2 Aug 2023 14:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: 
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJAI363CKBUSRW6WQJP4VYZSJMUT3P4E
X-Message-ID-Hash: GJAI363CKBUSRW6WQJP4VYZSJMUT3P4E
X-MailFrom: SRS0=Vcmq=DT=xs4all.nl=hverkuil@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJAI363CKBUSRW6WQJP4VYZSJMUT3P4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/08/2023 14:02, Shengjiu Wang wrote:
> On Wed, Aug 2, 2023 at 7:22 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Wed, 02 Aug 2023 09:32:37 +0200,
>> Hans Verkuil wrote:
>>>
>>> Hi all,
>>>
>>> On 25/07/2023 08:12, Shengjiu Wang wrote:
>>>> Audio signal processing has the requirement for memory to
>>>> memory similar as Video.
>>>>
>>>> This patch is to add this support in v4l2 framework, defined
>>>> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
>>>> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
>>>> for audio case usage.
>>>>
>>>> The created audio device is named "/dev/audioX".
>>>>
>>>> And add memory to memory support for two kinds of i.MX ASRC
>>>> module
>>>
>>> Before I spend time on this: are the audio maintainers OK with doing
>>> this in V4L2?
>>>
>>> I do want to have a clear statement on this as it is not something I
>>> can decide.
>>
>> Well, I personally don't mind to have some audio capability in v4l2
>> layer.  But, the only uncertain thing for now is whether this is a
>> must-have or not.
>>
> 
> Thanks,  I am also not sure about this.  I am also confused that why
> there is no m2m implementation for audio in the kernel.  Audio also
> has similar decoder encoder post-processing as video.
> 
>>
>> IIRC, the implementation in the sound driver side was never done just
>> because there was no similar implementation?  If so, and if the
>> extension to the v4l2 core layer is needed, shouldn't it be more
>> considered for the possible other route?
>>
> 
> Actually I'd like someone could point me to the other route. I'd like to
> try.
> 
> The reason why I select to extend v4l2 for such audio usage is that v4l2
> looks best for this audio m2m implementation.  v4l2 is designed for m2m
> usage.  if we need implement another 'route',  I don't think it can do better
> that v4l2.
> 
> I appreciate that someone can share his ideas or doable solutions.
> And please don't ignore my request, ignore my patch.

To give a bit more background: if it is decided to use the v4l API for this
(and I have no objection to this from my side since API/framework-wise it is a
good fit for this), then there are a number of things that need to be done to
get this into the media subsystem:

- documentation for the new uAPI
- add support for this to v4l2-ctl
- add v4l2-compliance tests for the new device
- highly desirable: have a virtual driver (similar to vim2m) that supports this:
  it could be as simple as just copy input to output. This helps regression
  testing.
- it might need media controller support as well. TBD.

None of this is particularly complex, but taken all together it is a fair
amount of work that also needs a lot of review time from our side.

I want to add one more option to the mix: drivers/media/core/v4l2-mem2mem.c is
the main m2m framework, but it relies heavily on the videobuf2 framework for
the capture and output queues.

The core vb2 implementation in drivers/media/common/videobuf2/videobuf2-core.c
is independent of V4L2 and can be used by other subsystems (in our case, it is
also used by the DVB API). It is a possibility to create an alsa version of
v4l2-mem2mem.c that uses the core vb2 code with an ALSA uAPI on top.

So in drivers/media/common/videobuf2/ you would have a videobuf2-alsa.c besides
the already existing videobuf2-v4l2.c and -dvb.c.

Perhaps parts of v4l2-mem2mem.c can be reused as well in that case, but I am
not sure if it is worth the effort. I suspect copying it to an alsa-mem2mem.c
and adapting it for alsa is easiest if you want to go that way.

Regards,

	Hans
