Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4737F8BF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 15:27:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775BA17CC;
	Thu, 13 May 2021 15:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775BA17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620912424;
	bh=+6NtOz42zYwTqAMVC1Wz/4ok7baL7gQA5JGY88vmwm4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyFqjBz/dyWvak+5BIfPkvpcbvOMr2rn81PRUX6qS6BsUcLwryzfNmIkWp+YKw9WA
	 DeWm6QydtAIW/X+rBCF8+9TzIu5Cx+TD/ZDhbDHMjkYL+8vjV2bESXREl5AYoXOdV/
	 Fg3tzU+oFQMaWKl+DJospNI20+LFJHtsbn8BZmsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5FEF8016B;
	Thu, 13 May 2021 15:25:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FA0F80163; Thu, 13 May 2021 15:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 711F5F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 15:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 711F5F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="skf1Txhf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Cc0AHiky"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE8975C01A7;
 Thu, 13 May 2021 09:25:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 May 2021 09:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=c
 JsMHGwueSM+PZt0HtvcauYYCnY7LVtBIZO7XGXxf6c=; b=skf1TxhfTOHZVNJGi
 JDxRn3tiKHX7YeaAYqgeeUNHij7LGF7zdVU+FyFlA1P6OLnviCjS/j4V6zQoMMsc
 7k1csv9GQ66opllbHzskMHmeNvUMWO9fgcetjJtKFqtk+SvVcsRKHnYPcO2gq9ox
 yz6BgLFYTHkjvyX26or4TJyyj6xP6HONGYCDwPUv9TlZQmkhob4XuiEQSIFHNPEc
 cxvv93xamoBE27eY9HChSAu0HSNq5ypCQN5ZQcwGQDXY84ll3fEX2Cfkx2I/L41X
 NAswi3pmRDRgtpnj/5BlJqJ4+B8QvAon5c/qB9ZIG1G3w15NCaEpM7KtvDVi9+3I
 fbVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=cJsMHGwueSM+PZt0HtvcauYYCnY7LVtBIZO7XGXxf
 6c=; b=Cc0AHiky1glS/dwbLCoCJL+zMs5jPt/vu801wPGO7/ZMmSDuTvqFxz6S2
 tNXchgpmbnl/3gAPYrPdMKJjMUxpHycVfJYi7Ie7A7TNBlVxQ3QBbUWVszSn6rgA
 ccuBJ+Dh5Hs/A2LWmKfbpQ0OvwCfkbqYDiLN4MZLH5qgq6c171nSwg2zK63AxCML
 /swl558VHkLCKes8nmAdh4grQNj3P/wJ4v9B5f9Ghdb30TxlsogikPf9la/SOlcE
 iIYmh/NoQtqzD5mCmC2A5pvDxpCgAuOsvXM/mhhUveigN81G25o8g1Ej2DP5S16p
 JBR4fFFsMeEQFeQwHVmdOgEbzsOhw==
X-ME-Sender: <xms:wyidYFAM7WkwdTE28aJH8XSEW8hMV-sp3S1lZVIeFBXplgkE6gTqpA>
 <xme:wyidYDg6tBT-R9WPJm_68uIGoqybTf5leYpqZ8I-hHLeuMMMHZSMNCWzjKwQo25Bu
 7O6F-cffVagkUCjvwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheptdehieejudelleegtdfhgeevtefhudeuvdekvdet
 gefgtdehteeiheejteevffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
 hhuhgsrdgtohhmnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjph
X-ME-Proxy: <xmx:wyidYAlyC_B82Yw9dzZzu77mQUVECKJaAFQmoVxIL9IQu16l6tPtlQ>
 <xmx:wyidYPwPg7ADTEwlNXqJTDeiICPt1mPem-lNlcXB09gJK3zl8tNScw>
 <xmx:wyidYKT6vWgrJq9g_NDxhcJr3cbs6vx07lJcjN1Lye-4T1OzkFoX8g>
 <xmx:xCidYFc4qFHa7tnLLHiVcxAIrAyCkRj8ndfk9pT6dlV4-zdEsxmbaQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 13 May 2021 09:25:22 -0400 (EDT)
Date: Thu, 13 May 2021 22:25:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: no_period_wakeup, axfer and --sched-model=timer
Message-ID: <20210513132520.GA109626@workstation>
Mail-Followup-To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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

Hi,

On Thu, May 13, 2021 at 01:34:25PM +0200, Amadeusz Sławiński wrote:
> I was checking some stuff relater to NO_PERIOD_WAKEUP and noticed that axfer
> has support for using either --sched-model=irq or --sched-model=timer.
> However from few quick tests it seems like it doesn't work?
> 
> $ aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: PCH [HDA Intel PCH], device 0: ALC283 Analog [ALC283 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> 
> When using  --sched-model=irq  it transfers data until I press Ctrl+C
> 
> $ axfer transfer playback --sched-model=irq -D hw:0,0 -r 48000 -c2 -f S16_LE
> /dev/urandom
> PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
> 'Stereo'
> ^CPLAYBACK: Expected 4611686018427387903frames, Actual 163960frames
> Aborted by signal: Interrupt
> 
> 
> However with  --sched-model=timer  it time outs by itself:
> 
> $ axfer transfer playback --sched-model=timer -D hw:0,0 -r 48000 -c2 -f
> S16_LE /dev/urandom
> PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
> 'Stereo'
> Fail to process frames: Connection timed out
> PLAYBACK: Expected 4611686018427387903frames, Actual 16304frames
> 
> 
> How well is NO_PERIOD_WAKEUP tested/supported? Is it a bug in axfer or
> perhaps some issue in kernel code?
> 
> From some debugging I did, I have my suspicions that it gets stuck on poll
> in:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/pcm_native.c?id=c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1#n3489
> waiting for runtime->sleep to wake it, but seems like it never happens.
> 
> What do you think?

It's a regression added by a commit e5e6a7838b06 ("axfer: return ETIMEDOUT
when no event occurs after waiter expiration"), and the -ETIMEDOUT come
neither from ALSA PCM core nor alsa-lib. Thanks for your reporting!

 * https://github.com/alsa-project/alsa-utils/commit/e5e6a7838b06

As a quick fix, please revert the commit. I'll post better fixes later.

After the revert, it looks work well under my hardware:

```
$ ./axfer list playback device
**** List of PLAYBACK Hardware Devices ****
card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Generic_1 [HD-Audio Generic], device 0: ALC1220 Analog [ALC1220 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Generic_1 [HD-Audio Generic], device 1: ALC1220 Digital [ALC1220 Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Generic_1 [HD-Audio Generic], device 4: ALC1220 Analog [ALC1220 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: FCA610 [FCA610], device 0: BeBoB [FCA610 PCM]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

$ ./axfer transfer playback -vv --sched-model=timer -D hw:1,0 -r 48000 -c2 -f S16_LE /dev/urandom  -d1
Container: parser
  format: raw
  sample format: S16_LE
  bytes/sample: 2
  samples/frame: 2
  frames/second: 48000
  frames: 4611686018427387903
attributes for mapped page frame:
  sample number: 0
    address: 0x7f92086f7000
    bits for offset: 0
    bits/frame: 32
  sample number: 1
    address: 0x7f92086f7000
    bits for offset: 16
    bits/frame: 32
Hardware PCM card 1 'HD-Audio Generic' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 24064
  period_size  : 6016
  period_time  : 125333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 6016
  period_event : 1
  start_threshold  : 1
  stop_threshold   : 24064
  silence_threshold: 0
  silence_size : 0
  boundary     : 6773413839565225984
  appl_ptr     : 0
  hw_ptr       : 0
Scheduling model:
  timer
Waiter type:
  default
Transfer: libasound
  access: MMAP_INTERLEAVED
  sample format: S16_LE
  bytes/sample: 2
  samples/frame: 2
  frames/second: 48000
  frames/buffer: 24064
Mapper: muxer
  target: single
  access: MMAP_INTERLEAVED
  bytes/sample: 2
  samples/frame: 2
  frames/buffer: 24064
PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels 'Stereo'
  handled: 0
  rewound: 24032/24064
  handled: 20218
  handled: 3814
  handled: 18844
  handled: 5124
PLAYBACK: Expected 48000frames, Actual 48000frames
  Handled bytes: 192000
```


Thanks

Takashi Sakamoto
