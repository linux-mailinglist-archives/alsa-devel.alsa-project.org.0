Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B42943A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9290716C4;
	Fri, 24 May 2019 11:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9290716C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688943;
	bh=zS9zOGqd7FGqUaqe1SV5u6Qioh62Y8yWaQQieZhD//k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZImSiobCUfI5Kl6VmvGCUr9bK7NE0negYSbG/sBi5cmy7QJaAVcEVcrZK9hv5NrJ4
	 Pa3jahZFUw8rqxJiFPA1Gw6eEYHRDQSGQHLYWM7Va/cBbWVKRfnARvR/3F9aK736dE
	 PyhfGqt9R5C3vEWgghkbf9j84be3TpzWKD6kL4hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77594F89630;
	Fri, 24 May 2019 11:07:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515E5F89630; Fri, 24 May 2019 11:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9291F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9291F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sbkOZuAH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="6l4fbC61"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 14E18200E3;
 Fri, 24 May 2019 05:07:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=D+JKRMie/Uo0BtD3NxZ5Txl8K/6
 vLeY2piy+nrYczmc=; b=sbkOZuAHEsCQRI/++snlHZwvtzfv/NLBQvAOWjIOi7j
 /+7Odl/Yk1ZkJdphsJKd3rbxDloKigW/Xr4U84ABCSw91PowtQ2Jyn257fj84UF1
 yJOfXsivlO5AyPyLV1iqV+k3auwHOaEnKYMll5jS/DFPdyLhrL/GkrE4yq23GjDB
 d4WsclwDlWvwRyv8oNw3ms8UuKYkZO2S+d5IOxK0q+czOHTWH77cmGvlCQ82lzsA
 JExR5t13ft2Vgyplka9Vkqb6RQvLQwRnkUMZziq7X+e1ooyg7vz4cMOJfEstK8C5
 8EjWhAZbcFzR7Bae/XmFCwHSMarFWbQoO6AN2n6v8sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=D+JKRM
 ie/Uo0BtD3NxZ5Txl8K/6vLeY2piy+nrYczmc=; b=6l4fbC61+KPkdzTINUQItL
 FuYVbkgcblclfJCdspXttDA6ZmyG4/B8EyflE0mfKOKEjrl5v4cW7ucwri55onNY
 Qly1rAD7Ioiz6y+oFuyrK20gAqkDlcGQfiTiontqKMc6Sus+XIojwTEqaSEvEE0N
 2pWymqVCU1E4Vf/UKVOnczz3pf6KLPUHhIRtTCqJ1KeK7iJhqqh9Lhpw+47u91ze
 igeHl4/Z8L7Iy4JUcgBlv4h6e/YH56qUC8icimXOJgj1VAZ99wdfF8fvReR5GyTo
 ON7SdBeaGNyW4O3gmuXeHwXfKz+HAZQKKTQrGvBCxxBtGPfdT885OblIyqm4z/gw
 ==
X-ME-Sender: <xms:XrTnXAeL7bQBdbmT60JivzLcGQhaDInLhEc_kDIxmsS6r6VOjqb61w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghlshgrqdhprhhojhgvtght
 rdhorhhgnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:XrTnXDf9WUw5lY5q74RFPzfyfqEKRyU-N3rUqN5n9l412cHoqpZ4kw>
 <xmx:XrTnXG31I8qwlxujN95CAmiGrPOEJNqsDtSs9Ps1AhksUeBhfBa4zw>
 <xmx:XrTnXD7_g_WnNXT8fQ9maLqRyM0yKurJnuHSRC7gEs3zCQDF4NF86w>
 <xmx:X7TnXC4gm55q2Pfrwjqo-0hVTnKaH7duiRy41OHo5ntCQxdWjWdhuQ>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF69C380087;
 Fri, 24 May 2019 05:07:40 -0400 (EDT)
Date: Fri, 24 May 2019 18:07:38 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190524090737.GA15675@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
 <20190524064805.GB25133@workstation> <s5hr28oe3g0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hr28oe3g0.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH 0/4] ALSA: firewire-lib: unify handlers for
 outgoing packet
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, May 24, 2019 at 09:06:55AM +0200, Takashi Iwai wrote:
> On Fri, 24 May 2019 08:48:06 +0200,
> Takashi Sakamoto wrote:
> > 
> > Iwai-san,
> > 
> > I cannot regenerate the conflict you mentioned[1] in my local:
> > 
> > On Fri, May 24, 2019 at 12:14:36AM +0900, Takashi Sakamoto wrote:
> > > Takashi Sakamoto (4):
> > >   ALSA: firewire-lib: split helper function to generate CIP header
> > >   ALSA: firewire-lib: unify packet handler for IT context
> > >   ALSA: firewire-lib: code refactoring to queueing packets
> > >   ALSA: firewire-lib: use 8 byte packet header for IT context to
> > >     separate CIP header from CIP payload
> > > 
> > >  sound/firewire/amdtp-stream.c | 150 ++++++++++++++++------------------
> > >  sound/firewire/amdtp-stream.h |   3 -
> > >  2 files changed, 69 insertions(+), 84 deletions(-)
> > 
> > I can successfully applied these patches onto either e4e07c6cdca8 ('ALSA:
> > hdspm: Fix single speed ADAT capture and playback with RME HDSPe AIO')[2] or
> > 947b437e1263 ('ALSA: firewire-lib: unify packet handler for IR context')[3]
> > in fetched your tree.
> > 
> > Would I request you to try again?
> > 
> > [1][alsa-devel] [PATCH 0/6] ALSA: firewire-lib: unify handlers for incoming packet
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/149742.html
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=e4e07c6cdca8a837ab40363fc8002cf62965a628
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=947b437e1263c81bb5d30a84f1a4a35dbb9f6b78
> 
> OK, the patches seem applicable cleanly.
> I must have applied the wrong thread by some reason (maybe the
> subject lines are too confusing ;)
> 
> Sorry for the noise.

No worries, but I should have avoided confusing patch title...

Just now I posted the last part of my refactoring for this packet
streaming engine. I'm happy if you apply them as well.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
