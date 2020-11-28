Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D52C6F63
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Nov 2020 10:37:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5EC188E;
	Sat, 28 Nov 2020 10:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5EC188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606556268;
	bh=tH9oT5GFm+Zb3ApfrJpzLMt1XxD8LQs7fU4v/O72d3w=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLcMN4jYpgbLG5qlmRNcvs+5n5GXw6zz7p7CktpyfQitQOutmGjQ2WZxKu8/dbGtc
	 7JL6GkSBq6JgpxK9VVy5YlOkhrYjoxvkECx5y1GOGt0cJcbjyKFyJHRtGcU+4KxEKb
	 JuGB98Vi9NPRtvggv+Xft8e82Fo8qwBSK2N7JJs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98125F80167;
	Sat, 28 Nov 2020 10:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C0CF80166; Sat, 28 Nov 2020 10:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=MISSING_MID,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from roobarb.jellybean.co.uk (roobarb.crazydogs.org [46.235.224.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D203DF800D0
 for <alsa-devel@alsa-project.org>; Sat, 28 Nov 2020 10:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D203DF800D0
Received: from localhost ([127.0.0.1])
 by roobarb.jellybean.co.uk with esmtp (Exim 4.92)
 (envelope-from <bjb-alsa-devel@deus.net>)
 id 1kiwe8-0001HY-GQ; Sat, 28 Nov 2020 09:36:00 +0000
Date: Sat, 28 Nov 2020 09:36:00 +0000
From: Ben Bell <bjb-alsa-devel@deus.net>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: Behringer WING usb audio - cyclic xruns dependent on
 periods/buffers
References: <20201126180612.E3E0CF80166@alsa1.perex.cz>
 <s5hblfjjguc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hblfjjguc.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: bjb-alsa-devel@deus.net
X-SA-Exim-Scanned: No (on roobarb.jellybean.co.uk);
 SAEximRunCond expanded to false
Message-Id: <20201128093612.48C0CF80166@alsa1.perex.cz>
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

On Fri, Nov 27, 2020 at 10:20:59AM +0100, Takashi Iwai wrote:
> On Thu, 26 Nov 2020 19:06:04 +0100, Ben Bell wrote:
> > I've got a Behringer WING digital mixer which is equipped with a USB
> > interface supporting 48 in, 48 out at 44.1 or 48kHz. It's plugged into a
> > USB3 interface and for the most part it seems to work well as a class-compliant
> > audio interface, but I'm struggling to eliminate xruns and it's starting to
> > feel either driver or hardware quirk related issue.
...

> In general you should avoid 44.1kHz if you want a small period size
> for a realtime process on USB-audio.  With 44.1kHz, the packet size
> can't be fixed in integer, and the ISO transfer requires variable
> packet sizes.  OTOH, ALSA API requires the fixed period size, hence
> it'll lead to inconsistencies occasionally.

Thanks Takashi, that's useful to know. Most of my historical projects are
at 44.1kHz which is why I'm using that here, but I'll try to switch to 48kHz
in future work to avoid this. That said, I've tested a little with 48kHz and
had similar problems. I'm currently encountering a period of relative
stability (an xrun every 20 minutes or so) so I don't want to touch anything
until I've got some recording out of the way, but I'll switch to 48kHz for
future testing too.

I've read people saying there are problems with USB3 and audio which go
away when they switch to USB 2, so I've got a card in the post so we'll see
whether that helps.

In the meantime, I've enabled xhci_hcd dynamic debugging and the xruns
all coincide with events like this. I'm wondering whether this is actually
more of a USB host issue rather than an ALSA one?

      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000d9d39c02, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: // Ding dong!
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 000000001152b022, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000aad0b004, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000014bb8b3, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 0000000058d3a525, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000095e4d66, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000c5233f07, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 0000000058cfb2b9, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000ecf776e8, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 0000000090c79b8f, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 00000000ad358790, dev 4, ep 0x81, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 000000008f26c7ed, dev 4, ep 0x1, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: // Ding dong!
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cancel URB 0000000020b0a760, dev 4, ep 0x1, starting at offset 0xcfbNNNNN
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Stopped on Transfer TRB for slot 1 ep 2
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Removing canceled TD starting at 0xcfbNNNNN (dma).
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Finding endpoint context
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cycle state = 0x1
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: New dequeue segment = 000000009fc8e305 (virtual)
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: New dequeue pointer = 0xcfbNNNNN (DMA)
     84 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Removing canceled TD starting at 0xcfbNNNNN (dma).
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Set TR Deq Ptr cmd, new deq seg = 000000009fc8e305 (0xcfbNNNNN dma), new deq ptr = 00000000cfc75f63 (0xcfb42440 dma), new cycle = 1
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: // Ding dong!
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Stopped on Transfer TRB for slot 1 ep 1
     38 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Removing canceled TD starting at 0xcfbNNNNN (dma).
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Finding endpoint context
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Cycle state = 0x0
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: New dequeue segment = 0000000070effd6e (virtual)
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: New dequeue pointer = 0xcfbNNNNN (DMA)
     29 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Removing canceled TD starting at 0xcfbNNNNN (dma).
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Set TR Deq Ptr cmd, new deq seg = 0000000070effd6e (0xcfbNNNNN dma), new deq ptr = 0000000034521cdf (0xcfb77180 dma), new cycle = 0
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: // Ding dong!
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Successful Set TR Deq Ptr cmd, deq = @cfb42440
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Successful Set TR Deq Ptr cmd, deq = @cfb77180
     32 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Miss service interval error for slot 1 ep 2, set skip flag
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Found td. Clear skip flag for slot 1 ep 2.
      1 Nov 28 09:12:32 rowlf kernel: [nnn] retire_capture_urb: frames 0 - 7 of [138046467] still active: -18
      1 Nov 28 09:12:32 rowlf kernel: [nnn] retire_capture_urb: ...a total of 4 bad urbs; between [138046467] and [138046470]; kxrun = 238; 1120718 since last
     41 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Miss service interval error for slot 1 ep 1, set skip flag
      1 Nov 28 09:12:32 rowlf kernel: [nnn] xhci_hcd 0000:29:00.3: Found td. Clear skip flag for slot 1 ep 1.

(First column is a dedup count, and the retire_capture_urb messages are my
own debug patch)

bjb


