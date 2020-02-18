Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB451626DF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 14:12:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003611699;
	Tue, 18 Feb 2020 14:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003611699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582031524;
	bh=75r2b8Aijups/8BZOaaVlwsdAWKDA7cpFpwl6CnhnPk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qA+jwpJmJd5lcplbjBytV27H5NcdgkoU9ntT3rI2/WJBv1VWw3XHEhGisl51eCrHi
	 +1NhigA4IaabzEz9S3gkr2RreEOwRlAKUzESyi4N5quNLufqqKS7R86npq5mBo4o1Y
	 hOwXnQzTpCZN8JyCzgYNlotTQ5nFTdy/NYaMxQRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16518F8014C;
	Tue, 18 Feb 2020 14:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A1EDF800C4; Tue, 18 Feb 2020 14:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFAADF80145
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 14:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFAADF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PhGUrndR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BvKpit3n"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3095B21E6A;
 Tue, 18 Feb 2020 08:10:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Feb 2020 08:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=qqjDGqrFWqZOsfZxodsvpvSCXav
 apeSPzmK41PxiqQ8=; b=PhGUrndRQPlhIvtOdY7FW2rnBuBi3DWCY4xsWA+E9sW
 vGukJJdRmSoEjoY8lNDZ0T/ZcANEvJ4XQOQYw1yAKXArNyF6K7AEH2ins1WqxqQx
 UuQtgF8nZzB+2xTeb50U4o2+bjQ93W+ZALrh3TTJ7jzv2yLhftf3zK1HW4Y1yIcu
 kWNGSv/0ls+Wa2U6FlyLPzNO76y6Y9LMc74eEgEvA5mk1YjcOv1e5bQCMjkmLF78
 UCRAxSiO41G9DxIUSBMjUN9o8FH2BvQJQdWPI6OgpJLvtVYLICUkc8m/Yk+1Us6o
 RKoj6hI96lJh1Ru9ebPlPdtcFBdQ6Us4bSN2ZSWxmQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qqjDGq
 rFWqZOsfZxodsvpvSCXavapeSPzmK41PxiqQ8=; b=BvKpit3nuo6DvN75KXNFQm
 CezIqNn41MVpwsWeXIGbppUs5338tk+fiGL7SdoWSrX/n3ebbcvt0b29N+C50hCF
 uX9681+dgzS/1nL4Oj0GJpXGSZ5xqMvPsASwNAkniPBxgp0e3Ir2Jf9Jh1pJ4W4u
 Fzauz9oNbe9ljfiyLwcEShnB0eZ9UkopyykKIvx9sy9pFvMzGokqJeABjJAmlWhf
 /EDJ4UbQSg0slFzHR7Srs1jGpR6OSf5nCQ0S3M3ill0NAvF3igIyRp3Bs7mODLc8
 AE/xET8p4PGq02Zyn/qSeJwW/1JI1E96XRciWbKvZYpgEl5J/2sufSopRN6Ucakw
 ==
X-ME-Sender: <xms:QuJLXqyi1wekb9MxjleWex_tgCgiTlAFFxKtK2E-XG-_wJ-6Aj-OXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdr
 tghomhenucfkphepudegrdefrdejgedrudeikeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhp
X-ME-Proxy: <xmx:QuJLXhLngqcv3XKfEi1LcxkW4k391AL_p1CjASDgGWuNDsZCOxnCOQ>
 <xmx:QuJLXmjaVGDLBku2rDvZpDXGhvJqowayuNMXdbQkO7airkTpOdN-8Q>
 <xmx:QuJLXiOsOZjnIjL1wCRZXYddT7KX-czg-dUD2SY4e1bR2dmPJSQaLA>
 <xmx:Q-JLXmvvc_FTKAG7Ds_Ny4R4rKxwzZgMF182zuXuTjxx9Wu2i1eb7Q>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23B9330606E9;
 Tue, 18 Feb 2020 08:10:25 -0500 (EST)
Date: Tue, 18 Feb 2020 22:10:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Questions about event implementation in ALSA Sequencer
Message-ID: <20200218131023.GA15442@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200218031101.GA12168@workstation> <s5hy2t09wxn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hy2t09wxn.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Thanks for your reply ;)

On Tue, Feb 18, 2020 at 08:28:04AM +0100, Takashi Iwai wrote:
> On Tue, 18 Feb 2020 04:11:02 +0100,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > I'm working for alsa-gobject[1] so that it supports API for ALSA Sequencer.
> > At present I've mostly done it just with direct dispatch support[2] (thus
> > transmission via queue is for my later work). Then I have some questions
> > about the design of event in ALSA Sequencer. I'd like to ask for some advices
> > (mainly Iwai-san, perhaps).
> > 
> > 1. use case of SNDRV_SEQ_EVENT_LENGTH_VARUSR in 'struct snd_seq_event'
> > 
> > In my understanding, the flag is used for a case that sender transmits the
> > value of pointer itself and its length to the receiver in the shape of
> > 'struct snd_seq_ev_ext'. I assume that two use cases. If the sender and
> > receiver are in the same process, the event is a request for the receiver to
> > operate data in the same VMA. If the sender and receiver are in different
> > processes, the event is a request for pointer-based calculation between the
> > peer.
> > 
> > If the above understanding is correct, it's hard to represent this type of
> > event for g-i interface because g-i is the object-based framework. Any raw
> > pointer without explicit type is hard to be exposed to g-i applications as
> > long as I know, and it's going to be unsupported, perhaps.
> 
> To be more exact, the usage isn't restricted whether belonging to the
> same process or not.  The event with VARUSR is processed only for the
> direct transfer, not for the scheduled transfer.  That is, the written
> packet is immediately processed and the user-space data is copied to
> the destinations at this point.  In this sense, it's no zero-copy but
> rather just for saving the space in the input pool.

Yes. VARUSR is available with direct transfer only.

In alsa-lib documentation, I can see 'only for a special purpose like a bulk
data transfer':
https://www.alsa-project.org/alsa-doc/alsa-lib/seq.html#seq_ev_data

I guess in this case page frame sharing is used between the peers, like
POSIX shared memory or System V shared memory. Then VARUSR is used to
point on the memory insted of copying the buld data.

> > 2. event data type corresponding to event type
> > 
> > Some event types are expected to specific data type; e.g. SNDRV_SEQ_EVENT_NOTE
> > is for 'struct snd_seq_ev_note' and SNDRV_SEQ_EVENT_CONTROLLER is for
> > 'struct snd_seq_ev_ctrl'. However there're some types for any data type; e.g.
> > SNDRV_SEQ_EVENT_ECHO or SNDRV_SEQ_EVENT_USR0. For the kind of types, the
> > event structure has no information about which data type should be used and
> > user applications voluntarily decide the data type. Therefore the sender
> > and receiver should share a kind of protocol in advance.
> > 
> > This means that userspace applications require API to select data type
> > independent of event type itself.
> 
> Right, those 'any-type' events have no specification of the event
> data, hence both sender and receiver need to agree with the handling.
> IOW, if not known, the receiver should discard the event.
>
>
> > 3. quote event and specific event types.
> > 
> > Two event types are reserved for 'struct snd_seq_ev_quote'; i.e.
> > SNDRV_SEQ_EVENT_KERNEL_ERROR and SNDRV_SEQ_EVENT_KERNEL_QUOTE(obsoleted?).
> > However, the quote structure is exposed to userspace itself. Furthermore,
> > as of v5.5 kernel, there's no in-kernel code to check the quote data
> > from/to user client.
> > 
> > Is it better to produce API so that userspace application can transfer
> > the quote event?
> 
> You can, but it makes little sense other than as a fuzzer.
> The quote events are only for the error bounce that is used
> internally.
 
In the view of generic IPC mechanism (in my understanding ALSA Sequencer is
a sort of IPC mechanism), error bounce is not only required for kernel
stuffs, but also for userspace applications. However it seems to be a bit hard
to express the nested event structure as GObject class, I leave it as
unsupported in this time.
 

Thanks

Takashi Sakamoto

> thanks,
> 
> Takashi
> 
> > 
> > [1] https://github.com/alsa-project/alsa-gobject
> > [2] https://github.com/takaswie/alsa-gobject/tree/topic/seq
> > 
> > Regards
> > 
> > 
> > Takashi Sakamoto
