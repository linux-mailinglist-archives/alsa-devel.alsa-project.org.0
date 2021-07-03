Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D721E3BA790
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Jul 2021 08:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF7216B1;
	Sat,  3 Jul 2021 08:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF7216B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625294439;
	bh=TaDe3yr5VQr0zj3AOXT0zGzkUr5z50LqlzZ0setSE5c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFG7rP4ssH2zoqUGcflJf6Uv9jS0JPH+2AxzfKcKJixFwSEsiw/G+ywsmY65lya5T
	 hLNYDcX3g8kExX7BYySdJ8jpMNz/VX5rtlyX/lY8EK+o9sovxe+YN1cx6zzZ7ctWcV
	 C1B6P73Src+LZ2+xXwKD6pCjL0tCU/Rly6RorbTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F238F804AE;
	Sat,  3 Jul 2021 08:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DA3F802D2; Sat,  3 Jul 2021 08:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFCA7F800BA
 for <alsa-devel@alsa-project.org>; Sat,  3 Jul 2021 08:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCA7F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QcN1SRQR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="U+3NTxvx"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5E95C32003AC;
 Sat,  3 Jul 2021 02:38:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 03 Jul 2021 02:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UOVQzo5peU9hwquiGwR5ViUp2k9
 ewftmmdtIsg9qScw=; b=QcN1SRQRNScvREtQ7Qz078kAsUVQiueobP2eBHB07CJ
 xwvV1WHaxoEY6nzC0YcjuctiR5FEcSsNbD+s32qMrNuPmzxUwVj9ghIfXh4nqaSM
 WC/v+r4rzVw82nBvS/78kp1bVOOJJZ9QQRI/y8TOPB2ydVKrXawz788qNr3H86Bc
 28I6PILaFfC+uVsaCA4td6v8hnFw2IhlTyZ83Qd/m7EuqYlBVasHqevCsQhJ396j
 rEsnUuocF9/epLbF8CwhR6f309HoULJP+pXfHrqh+alJ7042bJOSOJ64VUuety+3
 1zB91WT9C7SzzxorNpkWPxPtEgmeJQLbWmTk1BItT4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UOVQzo
 5peU9hwquiGwR5ViUp2k9ewftmmdtIsg9qScw=; b=U+3NTxvxx71BQXB7CERqUF
 T6gVnr2fbpR29q0jpu0xj2zmNE5zsKKTsAfSQAyvROCwbCwZCwtL89/WUqpqh4fY
 jC9GUCPFQLwTpxmEJ6dmeU6GMLIn6GWsgaCj17gidqXK1JCi4hsO8cjQtHQYk8rn
 QTWB1LqXfz+bSb38pT1Y9FTdRam1xELzPWijhywW0ZYb+56AyrSpjoEzkBdEvk0g
 mXwHaMPjfGzyVyK2wl84D5EcS0CMdT6p5LZfwciTsMT/ncDDvpToXTdzY/4Rdy5p
 /GCbOL4F+W/jjB75e3F3G7LTznJaDSiFA5ot1P66kwyUrYUj0RvIA0raZci1bLRA
 ==
X-ME-Sender: <xms:_QXgYKk14eHpJ7QHNesA_Gkcbq6JmXwHzhnJlCVzzue4VRpgfgwfNw>
 <xme:_QXgYB3L29CQ8IIdZgtfC4RfkXjvHshoLBMcR36Pa76tYVAE9z0-ZqOcAkDpaMRG8
 KkXMhxnc_cyc-0h6Rk>
X-ME-Received: <xmr:_QXgYIrhLcJI70S-O1O_6Ksbgv026jxyJwY1Xg62qi_VHhnwgkqdZJiXxhcc72yu91qAwHGz-pyB79W8g2H5qcv5FQbZ0yAShQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeiledguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:_QXgYOlvRsKxpUN0zc16vImy_ViaFl7CQCcIYR8VoSkU5dowuZAy9w>
 <xmx:_QXgYI3AmHU6sfCx1-4SgSxxbwBeXz8glYiZ7DuEkI-8kLzUV2EcbA>
 <xmx:_QXgYFtG65fELIspQ4ARxoK5eIHXeN3zwNaYwGZJIF0ha-nVbNHOHA>
 <xmx:_gXgYM8s-NbBUiZfKz609JzV59Bi6BrqJnBqV0YuCDRsft4QUkuNgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jul 2021 02:38:51 -0400 (EDT)
Date: Sat, 3 Jul 2021 15:38:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] sound updates for 5.14-rc1
Message-ID: <YOAF+EnvdBvSeZnR@workstation>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marcan@marcan.st
References: <s5hbl7li0fe.wl-tiwai@suse.de>
 <CAHk-=wiTwX5mzzEcw3jk3QdW600Hntt=Ehgoyz8K-VU8zbEmBg@mail.gmail.com>
 <CAHk-=whhDWDsVz12mhKtnS6DG-GzVWxBk2XjoOp=gwNJ7T0bTw@mail.gmail.com>
 <CAHk-=wisOVeVpH42f6i5qW1gxtYxbRJQXvpt=mdVx+8p=w-yMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wisOVeVpH42f6i5qW1gxtYxbRJQXvpt=mdVx+8p=w-yMg@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, marcan@marcan.st,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Fri, Jul 02, 2021 at 10:19:46PM -0700, Linus Torvalds wrote:
> On Fri, Jul 2, 2021 at 9:37 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But I thought I'd report this as a likely candidate.
> 
> Confirmed. The watchdog hang bisects right down to commit 9ce650a75a3b
> ("ALSA: usb-audio: Reduce latency at playback start").
> 
> And reverting it on top of my tree also fixes the hang, so it's not
> some bisection fluke.
> 
> I have no idea what is actually wrong with that commit, but it most
> definitely is the problem, and I have reverted it in my tree so that I
> can continue merging stuff tomorrow.

The cause seems to be the attempt to lock PCM substream recursively
introduced by the issued commit.

Would I ask you to test with below patch? I apologize that the patch is
still untested in my side since at present I have no preparation to debug
USB stuffs instantly (I'm just a maintainer for ALSA firewire stack...),
so I'm glad if getting your cooperation for the issue.

======== 8< --------

From f7ab449f10152635ad7083aa73d80e3fb1adabb4 Mon Sep 17 00:00:00 2001
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Sat, 3 Jul 2021 15:23:25 +0900
Subject: [PATCH] ALSA: usb-audio: fix recursive lock of PCM substream when
 starting playback PCM substream

A commit 9ce650a75a3b ("ALSA: usb-audio: Reduce latency at playback start")
unfortunately introduced the call of snd_pcm_period_elapsed() under acquired
lock of PCM substream. This causes recursive lock and results in dead-lock.

->ioctl(2)
  (sound/core/pcm_native.c)
  ->snd_pcm_stream_lock_irqsave() <-
    ...
    ->struct snd_pcm_ops.trigger()
    (sound/usb/pcm.c)
    = snd_usb_substream_playback_trigger()
      ->start_endpoints()
        (sound/usb/endpoint.c)
        ->snd_usb_endpoint_start()
          ->prepare_outbound_urb()
            ->struct snd_usb_endpoint.prepare_data_urb()
            (sound/usb/pcm.c)
            = prepare_playback_urb()
              (sound/core/pcm_lib.c)
              ->snd_pcm_period_elapsed()
                (sound/core/pcm_native.c)
                ->snd_pcm_stream_lock_irqsave() <-

This commit fixes the issue to use newly added function;
snd_pcm_period_elapsed_under_stream_lock() with condition to check running
context.

Reported-by: Hector Martin <marcan@marcan.st>
Fixes: 9ce650a75a3b ("ALSA: usb-audio: Reduce latency at playback start")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/usb/pcm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index c66831ee15f9..235070f0236a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1395,8 +1395,16 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 
 	spin_unlock_irqrestore(&subs->lock, flags);
 	urb->transfer_buffer_length = bytes;
-	if (period_elapsed)
-		snd_pcm_period_elapsed(subs->pcm_substream);
+	if (period_elapsed) {
+		// The callback of struct snd_pcm_ops.trigger with SNDRV_PCM_TRIGGER_START command
+		// can reach here, under acquired lock of PCM substream. To avoid dead-lock, check
+		// current context and call corresponding function.
+		if (in_softirq()) {
+			snd_pcm_period_elapsed(subs->pcm_substream);
+		} else {
+			snd_pcm_period_elapsed_under_stream_lock(subs->pcm_substream);
+		}
+	}
 }
 
 /*
-- 
2.30.2

======== 8< --------

Thanks

Takashi (not subsystem maintainer) Sakamoto
