Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3155037E
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 10:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336EF1B51;
	Sat, 18 Jun 2022 10:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336EF1B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655540688;
	bh=/8S35HrsA5+h9P248wHJm0UL1Tzq4NIM8Dy6BvjqoZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEWWj7+CxFpOXUEMP//nuA3+TxfY7iOi9d/fWUY/BgWMK/2RsvhMPwUYPAuUMP8qZ
	 VOHPpv01zyavH1KcxuOojR4tJFQs7qmshL4rFugvgcrvv0KgKEKgosoPcScn74D9OS
	 q2Jbg0ris6YQMFdHyoCvKlbYfnC/ahogBCqTRXUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1C6F804A9;
	Sat, 18 Jun 2022 10:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A969F8026D; Sat, 18 Jun 2022 10:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 253E1F80245
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 10:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253E1F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LNiNXnpZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="I4+BPi1Q"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 75AA33200915;
 Sat, 18 Jun 2022 04:23:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 18 Jun 2022 04:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655540610; x=1655627010; bh=14
 1TdbAabqPwL3bZ336wGq19dOeaGkMhE9zp2YpCsmo=; b=LNiNXnpZ7CC6u67ip0
 /w3amC6Z+mcjkl7uyt4hJszYfwtVwrcKhJGym/aoN8myfrnehP+VfHIye2UnhzFM
 7lJX3W++1fLoF4CKn7pzANZZLT5cXr/k+3N1boXZAXRUJBZ+KRauxE+AQAZ9e8Kt
 J/M8cLXyJ8vHrx6HzR4RYgybs0Ak+Fhlq9pvbV4j97zJ4CVTrqnxyRCitFacCKSP
 tdX7T+fNqzUiUCx6vdftDcCyM8C2Pl1gvs7Z912qGgOWZd2y5LRuR1z3PKee0OAZ
 R2+wCVf8rUkDG/DDy/RMWdbKAOABp8pilOiWXJ3JcL/sy2BOv+MCVoAYnvcAcS32
 RFZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655540610; x=1655627010; bh=141TdbAabqPwL3bZ336wGq19dOea
 GkMhE9zp2YpCsmo=; b=I4+BPi1QMxfELx2ArLca0tUnkr6k8f1zWCry2SaOnLEF
 XuibLU+C2mUigHVjsS8UHs8ZpSB7mgvy5cyrqYLP8amCeM8fwKe5rFVfJBV9inm/
 0pZVZNScud2YSG4l8DcViYcFmNU7mkxExzez53t3b76r0vJOiwZvR0A7XWOAi4xZ
 bOQCdGd7n925uTXwsnjGJEoNAVuWQjAvlEWK6msIk4KhJuDJo+Dn1d5yn5DdRytO
 udj3BLLYucdIle+SPMJxzYH4zBEFcoIaHB589bZ/8P0Cn+oOQFtBZ4TMV30+ldel
 FfnOwKpGmA9SH5JqMpncFZGOplgpPPBDUu2j6crSuw==
X-ME-Sender: <xms:goutYtHDoRVi-djfvSujq-x61jLWFZi1jqL4BCQt-YI591_18cEDkw>
 <xme:goutYiVCcJbpnwswpJghEt2xjtc4Zw_zQ965VW6eUdxUOvon7p-w9HY0CH4gkPMy6
 rK9CxqSrlocq4MeN8c>
X-ME-Received: <xmr:goutYvK_tfCOTjwtDv2Wwogu1oyJPuoVPrbhl8PbfN5IA5JKwnYCjQ9ZmJhoWGSsKXCb7patAhnVJRrFyf6ePnEFSFutW38Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvjedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepuefgffekfeffffekheevudfgtdetveejleeiledt
 vdefffeiteejkeejveekhfeunecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeho
 qdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:goutYjGS0dtURx3vwLxzUUzqYLeHOlCODyXCdyKgN63TugfPkdkXZQ>
 <xmx:goutYjUJA2HDIHKUM6oF4BbN28BKNBLtw3mtMDX-vuLgmHGAx_e8OQ>
 <xmx:goutYuMlU_zmy5591sFU-bU4ArOQxM4q_WW8rjm8U1_ek5ZqMLA4ng>
 <xmx:goutYkcp7B0Zj4b_11FIrJK8fQk--_Wj06J01ckWvYNXOhXWiHtWsw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jun 2022 04:23:29 -0400 (EDT)
Date: Sat, 18 Jun 2022 17:23:26 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH] aplay: Support setting timestamp
Message-ID: <Yq2Lfn+RJx96Qqvh@workstation>
Mail-Followup-To: Pavel Hofman <pavel.hofman@ivitera.com>,
 alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
 <YqrmNfnn2qCZV9Kf@workstation>
 <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
Cc: alsa-devel@alsa-project.org
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

On Thu, Jun 16, 2022 at 12:00:22PM +0200, Pavel Hofman wrote:
> Dne 16. 06. 22 v 10:13 Takashi Sakamoto napsal(a):
> > 
> > On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
> > > To allow enabling timestamp and specify its type, a new option
> > > --tstamp-type=TYPE is added. Recognized values are none (default),
> > > gettimeofday, monotonic, monotonic-raw.
> > > 
> > > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > > ---
> > >   aplay/aplay.1 |  4 ++++
> > >   aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
> > >   2 files changed, 36 insertions(+)
> > I prefer the idea to work for timestamp feature defined in ALSA PCM
> > interface, while I have a mixed feeling to integrate `aplay` tool, since
> > I have an intension to obsolete the tool with `axfer` tool with more
> > robust design with command argument compatibility (as much as possible).
> > 
> > This is not so strong request but would I ask you to work for `axfer` tool
> > instead of `aplay`? Then, it's preferable that the name of command
> > argument is decided with enough care of all of timestamp feature in ALSA
> > PCM interface, since we have two categories of timestamps at least; e.g.
> > system timestamp and audio timestamp. As long as I know, they possibly use
> > different clock sources, thus these two timestamps have different levels
> > of clock id, I think.
> > 
> > Of course, it's a loose accord in the community to obsolete `aplay`, and
> > it's easy to decide to continue aplay integration. (I'm not in leading
> > place of the project.) I'll be a bit happy if people take care of axfer
> > tool as well.
> 
> Thanks for your input. I use aplay in my project and needed to have tstamps
> enabled in proc status files for my simple code which calculates relative
> samplerate between capture and playback soundcards (one of them having rate
> adjustable - audio gadget, snd-aloop)
> https://mailman.alsa-project.org/pipermail/alsa-devel/2022-June/201647.html

I had read your message, then replied to the patch.

I'm not at so strong objection to your patch, however if I'm allowed to
note my opinion honestly, it surely brings an issue in a point of
application design. In short, the purpose of the patch is just for the
case to retrieve the history of PCM buffer pointer position and system
time stamp via procfs node for PCM substream of aplay for analysis,
therefore it's not for aplay itself.

As you know, aplay program has no code to process time stamp except for
the case of XRUN detection. I can easily imagine the future that the new
command line option is rarely used, except at your laboratory or office.


In my opinion, the better practice for your case is to add the way to
configure parameters of PCM substream for time stamp operation; e.g. add
kobject parameter to ALSA PCM device for PCM substream (please avoid to
hack procfs node since it's ancient way in unregulated world).

Although it's probably and technically possible, it has side effect to
user processes of existent ALSA PCM applications such as PipeWire plugins
and PulseAudio modules when the applications voluntarily process time
stamp for any purpose.

> . The existing aplay did not have this feature, so I added it and submitted
> the patch. I did not know aplay was planned to be obsoleted, it seems to
> receive a healthy stream of patches.
 
> As of the tstamp terminology - what command option would be more appropriate
> instead? Thanks a lot,

It's a kind of sophisticated work, I think.

For your information, the design of several kinds of time stamp in ALSA
PCM interface (from my memo written 2020) is below:

 - system time stamp
    - Available for several purposes
        - trigger (struct snd_pcm_status.trigger_tstamp)
           - the record of time stamp at start/stop/suspend/resume/pause
             of PCM substream.
        - current (struct snd_pcm_status.tstamp)
           - the record of the latest time stamp at updating hwptr, at
             xrun and reset of PCM substream.
        - driver (struct snd_pcm_status.driver_tstamp)
           - the record of the latest time stamp when the driver operates
             PCM substream at both hardIRQ/softIRQ and process contexts
    - Multiple levels of clock_id
       - monotinic time
       - monotonic raw time
       - real time (default, gettimeofday)
    - The sampling timing at hardIRQ context is invocation of hardIRQ
      handler instead of the time of actual interrupt request, thus
      includes time jitter due to CPU-level IRQ-mask.

 - audio time stamp (struct snd_pcm_status.audio_tstamp,
                     struct snd_pcm_mmap_status.audio_tstamp)
    - timespec compensated for audio frame granularity
    - Available when audio-related hardware supports specific function
      to record time of DMA transmission or audio link.
    - Currently, implemented for Intel HDA driver in Intel CPU (Skylate
      generation or later) with Global Time Stamp (GTS) register.
    - Multiple levels
       - default
           - computed just from hwptr
       - link audio time
       - link absolute audio time
       - link estimated audio time
       - link synchronized autio time
    - For detail, please refer to
      `Documentation/sound/designs/timestamping.rst`.


Cheers

Takashi Sakamoto
