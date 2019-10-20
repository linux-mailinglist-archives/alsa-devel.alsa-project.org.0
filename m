Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785CFDDD55
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 10:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66FD1666;
	Sun, 20 Oct 2019 10:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66FD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571560759;
	bh=2n56Rt3IIOyals9e5is55C/KpdJ5GjX0nDZYbRD8PA8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLkUK7DGk+CMz0MK5NdYlUXxn6Asm3OVsMx9ARwLw5XGQoYYIE/A2mD5Wvj+3mTpL
	 l+o0O44JTqLB451WK2ocCzAzQGpohpdYDe317cru21bty7Fh5CGvPhZpXkMuZynFTl
	 YWiEXreLBP4oS9mCS1mqTxJ+nSxN1/3K3+Tw0Upc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03855F802DF;
	Sun, 20 Oct 2019 10:37:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7125BF802FB; Sun, 20 Oct 2019 10:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6061F80112
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 10:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6061F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="AmI1lMFG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="P2EQc8eb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 46DD93BA;
 Sun, 20 Oct 2019 04:37:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 20 Oct 2019 04:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GI3fFzK2ji5FM4x6IhhR6wiDIIE
 EiKOgS1zSPaG7Kn0=; b=AmI1lMFGXmcP7RLQTncMAsnkWXz3p6RIgmYpEUhtC9+
 jG2LP/cJ/XKLKzzxRSJ8dPErHkjsfGa8s19ly1bkxUi/AjRxktkx3zlo+nJ5PIgJ
 VHuenWvjONMU34DyZEHPHbY/jGKqjWmwLlXz0xYWzT5jc0/xVGFRugu77DHl0StE
 /gQzEoYNEDGXNW6fYkqNU2H2ikB+Qq9aMrveCNrQKnFghg9VpWJAFBf9N5jlJJ1+
 FTt0cczAsPRGodHovztCFCshoeE3VQWdPQyw27MelmdaqIaDkU3WdWXgPG99OZxu
 9Bo0rPoz/KMho+dTtBmfrzBfD3MEp1kTyLYng8AuoDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GI3fFz
 K2ji5FM4x6IhhR6wiDIIEEiKOgS1zSPaG7Kn0=; b=P2EQc8ebVXYKWvTYzjfM0y
 PDdunGVd69ovJfw6ae/j5NI0cYTJwGgN78K1Q1PbNmDFqXnoBOK8wW3Md0KxjIPx
 wQU+bITgVrAMagsUgi2IJRLn/WikHH127iCzBJ8JEi2r7p4D58oTSK7SKfdV14Dz
 a9x5X1enMlU1E60OdbGK1sDMV0X59JeIgIqnCCBShQoAtyZOL07fNZjlqmiV28zQ
 0uYyke4vfx+UZtjuXV207qCVU+yh8ugylDqM2pjELiKcBrM3xLc3gPyIxhtJN+PT
 oa4wbi5WG5cyAootYunL6/5G4Xsr4ZL1hTx1EHYY0FXaPErARJdF8J48hBl68VzA
 ==
X-ME-Sender: <xms:wxysXZLdOx6_cJOV9XNVraNWkX8B8oi4qJIbrtTjrXWXIHr8rb81yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinheptggrlhhlsggrtghkrdhstgdprghlshgrqdhprhhojhgvtght
 rdhorhhgnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:wxysXSsYrHp3shIVlGSIh-MMzgKmkaOpD8vUL3a5DnVGvjiIj_BZAw>
 <xmx:wxysXavkAjjrpINy2Kl_m5eM37cD9n7PzAlDSDeM5LB_LjcmLoofAw>
 <xmx:wxysXVTbcw5XmAqiI1njn1yJtyDWOI_1GSHRlwhcP2M22gq5PKJpsA>
 <xmx:xBysXVh1kVKIc51q-rqBpQ2wpBFMFWhvfY3n6ms5eAV4cisseVR8EQ>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 707198005C;
 Sun, 20 Oct 2019 04:37:22 -0400 (EDT)
Date: Sun, 20 Oct 2019 17:37:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191020083718.GA23146@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
 <s5hsgnpfbdj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hsgnpfbdj.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH 0/6] ALSA: firewire: handle several IR/IT
 context in callback of the IT context
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

On Sat, Oct 19, 2019 at 09:22:16AM +0200, Takashi Iwai wrote:
> On Fri, 18 Oct 2019 08:19:05 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > This patchset is a part of my continuous work to improve ALSA IEC
> > 61883-1/6 packet streaming engine for clock-recovery, addressed in
> > my previous message:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/153388.html
> > 
> > For the clock-recovery, information in the sequence of tx packet from
> > device should be used to generate the sequence of rx packet to the
> > device. In current implementation of the engine, the packets are
> > processed in different tasklet contexts for each IR/IT context.
> > This is inconvenient to bypass information between these IR/IT contexts.
> > 
> > In this patchset, the engine is improved to process all of IR/IT
> > contexts in the same domain by a tasklet context for one of IT context.
> > For convenience, the IT context is called as 'IRQ target'. As a result,
> > 1394 OHCI controller is managed to generate hardware IRQ just for the
> > IRQ target. All of rx/tx packets are processed in tasklet for the
> > hardware IRQ.
> > 
> > Takashi Sakamoto (6):
> >   ALSA: firewire-lib: add irq_target member into amdtp_domain struct
> >   ALSA: firewire-lib: replace pointer callback to flush isoc contexts in
> >     AMDTP domain
> >   ALSA: firewire-lib: replace ack callback to flush isoc contexts in
> >     AMDTP domain
> >   ALSA: firewire-lib: cancel flushing isoc context in the laste step to
> >     process context callback
> >   ALSA: firewire-lib: handle several AMDTP streams in callback handler
> >     of IRQ target
> >   ALSA: firewire-lib: postpone to start IR context
> 
> Applied all patches now.
> 
> Although the preempt handling in AMDTP looks a bit suspicious, it
> should be OK as long as the code has been tested, so I took as is.

I can understand your concern but it works well as long as I tested.
In this time I use preemption-disable during processing queued packet in
process context but before I had used irq-disable instead.

I depict a call graph to process isoc packet in process context below:

On pcm.ack() or pcm.pointer() callbacks:
fw_iso_context_flush_completions()
->struct fw_card_driver.flush_iso_completions()
= ohci_flush_iso_completions()
  ->tasklet_disable()
  ->context_tasklet()
    (read registers on 1394 OHCI controller to get info for queued packet)
  ->flush_iso_completions()
    ->struct fw_iso_context.callback.sc()
    = amdtp_master_callback()
      ->out_stream_callback() (for irq-target)
      ->fw_iso_context_flush_completions()
        ->...
          ->out_stream_callback() or in_stream_callback() (for non irq-target)
  ->tasklet_enable()

The tasklet of IT context for irq-target AMDTP stream is temporarily
disabled when flushing isoc packets queued for the context. The tasklet
doesn't run even if it's queued in hw IRQ context. In a point to
processing queued packet for several isoc contexts in the same domain,
I have no concern without any irq-flag handling for local cpu.

1394 OHCI controller still continue isoc cycle during the above call
graph (= 125 usec interval according to 24.576 MHz clock). Actually the
number of queued packets for non-irq-target AMDTP stream can be slightly
different from the number for irq-target AMDTP stream by one or two
packets without any interruption. In a case that any interruption occurs
after processing queued packets for the irq-target stream, it's likely to
process largely different number of queued packets for the rest of AMDTP
streams in the same domain after resumed. It's desirable not to make such
count gap between streams in the same domain and I leave it for my future
work.

In this time the count gap is allowed. I use kernel preemption to avoid
the interruption but to catch hw IRQ from 1394 OHCI controller (and the
other hardware).


In another point, there's a race condition against flushing queued packet
in runtime between several PCM substreams for AMDTP streams in the same
domain. ALSA PCM core executes pcm.pointer and pcm.ack callback under spin
lock of runtime of PCM substream, thus the race is controlled for operations
to single PCM substream. However some PCM substreams are associated to the
same domain via AMDTP streams. At present I never add any solution for this
race.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
