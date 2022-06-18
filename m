Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB55506BA
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 22:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099621B11;
	Sat, 18 Jun 2022 22:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099621B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655585649;
	bh=Yt/+2WsBD8owcBQ+inQPiaJTwulB/8PMyjJyU35KNg0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1zLJDPVfc9QP67uFmNBiDe25bxrU0oYMKI1ekvvAq+jQEoKK5Vo1WG/+JB9YUclN
	 XJmeQzmUQB+5QKBAVMiWqLpSxcSvpFfY1atDKxZhC4kdsj4+OGsXsrbxHMYL+C9Ogz
	 okTKct8YutIjAukm9J9gpIMS6XUDfDAaZFJqUqmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73603F804A9;
	Sat, 18 Jun 2022 22:53:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE15EF8026D; Sat, 18 Jun 2022 22:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,PRX_BODY_14,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E72C4F800C7
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 22:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E72C4F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="W4m1mRb2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pNIxrXqb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 909E532003F4;
 Sat, 18 Jun 2022 16:52:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 18 Jun 2022 16:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655585573; x=1655671973; bh=26
 MBBl+MbRPe5ki+PCtejs+nuklAog4t8a9uLD/YCMo=; b=W4m1mRb2tE5yt7+gnF
 +w2Ydcd4xcBF6F6fdohDAHud1tb+SAliHYiexDw5UxBxsYReRtszaj0pnhtAD8GA
 aH+8NMGENJRW7rS7IFZWB2XrMFxb7K+GImze3LH+5Q68aB7jSnad156qpRJWxfrA
 Wq7sL0xhud/srCPFLFcmiSyqLx0bKpPC4TRxWuqjdMnPGkMB2SXmZBqECGaT3GKM
 OYN4rA5X0kg2aG5mJA46IcmfAUBNAA/v1VDZ/bRYN3sADoBRPEMX0PUpm5PMvy0/
 QO6g3zrWUpPl6Buzdp8eEkoGQWRdAhkllT3T3+fTgzwlvtUSHMexyGDGEnKud5LI
 ArkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655585573; x=1655671973; bh=26MBBl+MbRPe5ki+PCtejs+nuklA
 og4t8a9uLD/YCMo=; b=pNIxrXqbJ5VFhGFGgA4ZH6rMjgKbXxKrsZUrP6fIo76k
 QBCNNJa2Wh/fExJcyPFYyyLam6NyiLCBbgo0cXdY7q7w8ZZE5NLsH1QWBIQR1eTW
 H7IDAt04Wd9CXUtoxjXTrnoz6fBnKWd6rnV7VZJ4I9SDoCWiIxN2eWv5RKvcegds
 LV/zGf310X+THgorGdokzg4QxESOyutlJhbJRHGAkt4M/He7351O+IwfnL3Nswk4
 e0/jahGhw/iowYWlLfTbvI26yEz8/xtWyS/M0Q8LPjkKPn5JCYmuSqM5IsqXT3gr
 Yh9Qj6SPUz04V18eh/c5igh2qKK3wfThM6egcGsPVw==
X-ME-Sender: <xms:JDuuYlce22TVGB1cQSF1OA2ngOH1Oy7XwMyHv1zZS22bqaJ1yoP10g>
 <xme:JDuuYjMxuIBxsz4oO27zPUbCnntc04_OEijq7KJ3waSxlQZV8Emvmf6cLUeprh6-E
 Y2q6KVAirGm5sOpMPM>
X-ME-Received: <xmr:JDuuYugcBdeXa_j0UjxAkSlScc3_3JZyn9i9e-6UoK6Z9yBKUFsf-Y_O2doids1Tr3a_fd_xTSdOKmWGB3CBv48EoiaaZIgS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvjedgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleef
 geeileejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:JDuuYu8q6T9x8nHuoa5CcEQhmefHWRmT0p3LH9D_wOkyDo0RPHFylg>
 <xmx:JDuuYhvGccXI0h3xlnD2jqztxBCpiTKH76uo_OQhi1UyhUTdRSFWbQ>
 <xmx:JDuuYtE3ONVujC4ATIuRP3eiDExseEtZ8PpQwNiq-exeI1MjJEqE8Q>
 <xmx:JTuuYv3ucVLkluuHO8Ny6C8oE_5AIZHoyDJJK9Vjo5tBiCtZqe9L6Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jun 2022 16:52:51 -0400 (EDT)
Date: Sun, 19 Jun 2022 05:52:49 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: Enabling tstamp in proc status file externally
Message-ID: <Yq47ISgw2fWTELwi@workstation>
Mail-Followup-To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <9892a324-a549-c411-9d2c-0a10c580422d@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9892a324-a549-c411-9d2c-0a10c580422d@ivitera.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi Pavel,

On Thu, Jun 09, 2022 at 02:38:58PM +0200, Pavel Hofman wrote:
> Hi,
> 
> Please is there any way to enable the tstamp in stream status without
> modifying the client calling the alsa-lib API? I wanted to measure
> samplerate ratio between soundcards using data in their status proc files
> (comparing advancement of tstamp vs. hw_ptr). The method seems to work quite
> good, but some clients enable the stream status tstamp (e.g. pulseaudio) and
> some don't (e.g. sox, aplay), resulting in zeros in the status proc file.
> 
> Thanks a lot for any help or hint.

One night sleep after posting my comment to your patch for aplay[1] brings
me an idea to use tracepoints events for your purpose (it's 5:00 am at
UTC+07:00).

ALSA PCM core supports some kinds of tracepoints events[2]. They are
categorized to two parts; the history of hwptr/applptr and hardware
parameters of PCM substream. I think the former category of tracepoints
events are available for your work to invent diagnostics tools since all
of tracepoints events can be retrieved by user space application with
system time stamp. I think the type of time stamp is selectable by
options when retrieving records of tracepoints events. Furthermore the
time stamp is essentially the same as the ones of trigger/current/driver
time stamps in ALSA PCM interface.

I did not add enough description about the category of tracepoints when
committed to document [2], but roughly describe here:

- hwptr
 - the position for audio frame transmission (e.g. DMA).
- applptr
 - the position for user space application to read/write audio frame
   except for operations over mmapped buffer (but depending on audio
   hardware)

This is call graph when operating the procfs node:

(sound/core/pcm.c)
->snd_pcm_substream_proc_status_read()
  (sound/core/pcm_native.c)
  ->snd_pcm_status64()
    (sound/core/pcm_lib.c)
    ->snd_pcm_update_hw_ptr()
      (sound/core/pcm_trace.h)
      ->trace_hwptr()

You can see hwptr event is triggered as well. Actually, trace_hwptr() is
called more frequently by usual ALSA PCM applications; e.g. ioctl(2)
with PCM hwptr request.

We have some ways to retrieve the tracepoints events in user space:
 - tracefs
 - perf system call
 - bpf

You can easily find many good documentations about them; e.g.
  - BPF Performance Tools (Brendan Gregg 2020, Addison Wesley,
    ISBN-13 78-0136554820 )


I prefer your intention diagnose the runtime of PCM substream. I think
every one almost certainly love the work. So it's nice to go forward
without discouraged.


[1] Re: [PATCH] aplay: Support setting timestamp
https://lore.kernel.org/alsa-devel/Yq2Lfn+RJx96Qqvh@workstation/
[2] Documentation/sound/designs/tracepoints.rst in source of Linux kernel
https://www.kernel.org/doc/html/latest/sound/designs/tracepoints.html


Cheerss

Takashi Sakamoto
