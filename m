Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE837F949
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 16:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A43417D1;
	Thu, 13 May 2021 16:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A43417D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620914504;
	bh=9PGU9697PIQF4/Sn+xRLt1s0OvXTH4i24eGDT7fTlD4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6Y05PiKGHtRLt15fikmed3c8hzqAQ9zZqQ4efPj8dJnMWbyJ/0mur7ftNHPWyNJX
	 DtZgr7Sp7Jes31bdJdzOycESg3AGz7Dy1Aec9YN3JhNR5epvzp5S4gRpPi8ajWY03R
	 LeoJ6Mwya3bfoJzlpiKuFfQ0U+p0N5HYW2rA1b4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AD94F8013A;
	Thu, 13 May 2021 16:00:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9920EF80163; Thu, 13 May 2021 16:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C901F800E3
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 16:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C901F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FpnRX9qT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bTz+p1FD"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C80B5C018F;
 Thu, 13 May 2021 09:59:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 May 2021 09:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=2
 hG+Wof2GNNX7cIWj2mkAiQsL7sX9yVVC/56OdylHvE=; b=FpnRX9qT+/zlJrsyi
 Kef+DjYMQGz73cNuqNDF5EkKwfQO5vqVN7Xs9+TUZ4Tqv8mHcWPTgR8w7vWChhpM
 dti3HtznK3uVoarG5mL9oKMzczednNzAkNX7QUNKxZy3PoVSlqBplDLG9HKX4X+C
 5+b+5Rpe2zl9shxv9dr+VirLGTnkuR3L3xV9mrIFnXfebzh5dqrhQe1U2cS8cu+S
 Aa5TrD12Le8Mg90bXOZBk2Eby5Q2/PWM6A5d4fjfUKs42kXqyvLXIzALfnPAeno9
 XYbNTlEOyLcj2+TPubCpiWLlkPix++bcfEucnVQRaSpneYMo7N6A3OFLcmyhLO5/
 kXP/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=2hG+Wof2GNNX7cIWj2mkAiQsL7sX9yVVC/56OdylH
 vE=; b=bTz+p1FDv2Ae4WGCAJU8ckCcQydrYIIFIyFSnwToTXDujqQEBIHpwwwM1
 CIzHJZNrG/0SXwn+31szNN/OKTUY68apEAwWJbL+It3vOIA2kon3gjhoTvjpADYT
 tbAc6IYDxFm9ppchZhOlqN8RmSRtIuOlj0lTxe454X/jh9aCzIaaFLafVgQWDZnG
 dfyoyJUpiqklXJr3PYHlUWzCje7EWk3Y2sh0RstBp0rmEFEyUaQLfGM2BqCYFzOb
 eemZuYDDnvwjNLZEVwUvwGBPTwfq+9VerLLJF9064/XuOzMQDIszN4ihwkUQNRMc
 mpfuaMMsfdU4wFhJm5Iz4wHO+F48Q==
X-ME-Sender: <xms:3jCdYMlfd-MyUSMCFurHNy4qqgGwrdPl0ANulCPL2GTx1itk7sCm9Q>
 <xme:3jCdYL16JP1pRfYn7w_3Z2T_fQXSLT0IvVnFofH5KFBXHcA2smB44yvug9RreCh7i
 aGrEmsJEb_PLNmqDBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheptdehieejudelleegtdfhgeevtefhudeuvdekvdet
 gefgtdehteeiheejteevffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
 hhuhgsrdgtohhmnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjph
X-ME-Proxy: <xmx:3jCdYKpoapLnIFRS687fwIaj34vBAaLVUpJnn5nWyVO9_K_3-wsWuw>
 <xmx:3jCdYIm48h7cpHj8Bn8bAUD8VOZVYUy2xrhwoevt-U0N2Qrz04AR7w>
 <xmx:3jCdYK1ss2dJJ3ys7yaybOnN_30-7zZkHvFPG9Lii241Cltf-Sdwbg>
 <xmx:3zCdYICCbLNvrUDOZ5gnI7gMqWj4FLRAHOG657dC-eNYwb-mc_cWuQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 13 May 2021 09:59:57 -0400 (EDT)
Date: Thu, 13 May 2021 22:59:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: no_period_wakeup, axfer and --sched-model=timer
Message-ID: <20210513135955.GA124922@workstation>
Mail-Followup-To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
 <20210513132520.GA109626@workstation>
 <954a2bc9-f6aa-6c5f-c3f1-62400f22cb3f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <954a2bc9-f6aa-6c5f-c3f1-62400f22cb3f@linux.intel.com>
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

On Thu, May 13, 2021 at 03:37:02PM +0200, Amadeusz Sławiński wrote:
> On 5/13/2021 3:25 PM, Takashi Sakamoto wrote:
> > Hi,
> > 
> > On Thu, May 13, 2021 at 01:34:25PM +0200, Amadeusz Sławiński wrote:
> > > I was checking some stuff relater to NO_PERIOD_WAKEUP and noticed that axfer
> > > has support for using either --sched-model=irq or --sched-model=timer.
> > > However from few quick tests it seems like it doesn't work?
> > > 
> > > $ aplay -l
> > > **** List of PLAYBACK Hardware Devices ****
> > > card 0: PCH [HDA Intel PCH], device 0: ALC283 Analog [ALC283 Analog]
> > >    Subdevices: 1/1
> > >    Subdevice #0: subdevice #0
> > > 
> > > 
> > > When using  --sched-model=irq  it transfers data until I press Ctrl+C
> > > 
> > > $ axfer transfer playback --sched-model=irq -D hw:0,0 -r 48000 -c2 -f S16_LE
> > > /dev/urandom
> > > PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
> > > 'Stereo'
> > > ^CPLAYBACK: Expected 4611686018427387903frames, Actual 163960frames
> > > Aborted by signal: Interrupt
> > > 
> > > 
> > > However with  --sched-model=timer  it time outs by itself:
> > > 
> > > $ axfer transfer playback --sched-model=timer -D hw:0,0 -r 48000 -c2 -f
> > > S16_LE /dev/urandom
> > > PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
> > > 'Stereo'
> > > Fail to process frames: Connection timed out
> > > PLAYBACK: Expected 4611686018427387903frames, Actual 16304frames
> > > 
> > > 
> > > How well is NO_PERIOD_WAKEUP tested/supported? Is it a bug in axfer or
> > > perhaps some issue in kernel code?
> > > 
> > >  From some debugging I did, I have my suspicions that it gets stuck on poll
> > > in:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/pcm_native.c?id=c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1#n3489
> > > waiting for runtime->sleep to wake it, but seems like it never happens.
> > > 
> > > What do you think?
> > 
> > It's a regression added by a commit e5e6a7838b06 ("axfer: return ETIMEDOUT
> > when no event occurs after waiter expiration"), and the -ETIMEDOUT come
> > neither from ALSA PCM core nor alsa-lib. Thanks for your reporting!
> > 
> >   * https://github.com/alsa-project/alsa-utils/commit/e5e6a7838b06
> > 
> > As a quick fix, please revert the commit. I'll post better fixes later.
> > 
> > After the revert, it looks work well under my hardware:
> > 
> 
> Yes, I can confirm, that it fixes the problem. Thanks for quick workaround!

That's good. I just filed the better fix. Please apply it with your local
repository instead of the revert patch.

 * alsa-utils: axfer: fix regression of timeout in timer-based scheduling model #88 
  * https://github.com/alsa-project/alsa-utils/pull/88

Anyway, thank you for reporting the bug. In recent years I've been
working for devices in which no-period-wakeup is unavailable, so I
overlooked the bug so long...


Thanks

Takashi Sakamoto
