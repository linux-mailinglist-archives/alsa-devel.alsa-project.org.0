Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C432CFB92
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 15:45:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD7318FE;
	Sat,  5 Dec 2020 15:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD7318FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607179547;
	bh=+XR6X9EpAp1xTNTC3PEgqVTnF+EJgom1bcVw9KabJAo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrtIB/FVDNXTDOAW4Y9zowxnvyW0jNUVXUEQr8eTBJYfpNIEMdIKiKuQhvfIPK1H5
	 87vgDsw0VH3xNaUM3gW+FVeTXMwB6eel1IgmjDaN6AnsRfDv2o+w6r87z4de9jPs1p
	 Oyo4P/bO8p9nlhATh/0HxR8Ghp7vdTRhOFV3tqIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E50F800E2;
	Sat,  5 Dec 2020 15:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BC9EF8016D; Sat,  5 Dec 2020 15:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, MISSING_MID, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from roobarb.jellybean.co.uk (roobarb.crazydogs.org [46.235.224.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C971F800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 15:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C971F800E2
Received: from localhost ([127.0.0.1])
 by roobarb.jellybean.co.uk with esmtp (Exim 4.92)
 (envelope-from <bjb-alsa-devel@deus.net>)
 id 1klYmz-0007h4-9K; Sat, 05 Dec 2020 14:43:57 +0000
Date: Sat, 5 Dec 2020 14:43:56 +0000
From: Ben Bell <bjb-alsa-devel@deus.net>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: Behringer WING usb audio - cyclic xruns dependent on
 periods/buffers
References: <20201126180612.E3E0CF80166@alsa1.perex.cz>
 <s5hblfjjguc.wl-tiwai@suse.de>
 <20201128093612.48C0CF80166@alsa1.perex.cz>
 <20201203200633.CC66A2C16F@relay2.suse.de>
 <s5hblfa575t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hblfa575t.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: bjb-alsa-devel@deus.net
X-SA-Exim-Scanned: No (on roobarb.jellybean.co.uk);
 SAEximRunCond expanded to false
Message-Id: <20201205144410.4BC9EF8016D@alsa1.perex.cz>
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

> > Like I said in the initial email, it feels like some sort of clock drift
> > problem, where we're managing very slowly to collect more samples than
> > we're reading -- to the tune of about 1 extra every few cycles -- and
> > nothing on the consumer side is ever managing to compensate for that.
> > I'm not even sure how that sort of drift would be possible though. Seems
> > surprising.
[...]

> At least you can try the latest patch set destined for 5.11, which
> should improve the cases for the implicit feedback.

Aha! This actually was the key piece of information I needed. I haven't
tried 5.11 or the latest patch set yet, but googling "implicit feedback"
and learning abobut it led me to conclude that the Wing needs an entry in
the quirks list in set_sync_ep_implicit_fb_quirk to properly enable it:

--- sound/usb/pcm.c.orig        2020-11-22 23:36:08.000000000 +0000
+++ sound/usb/pcm.c     2020-12-05 08:40:21.639600074 +0000
@@ -340,6 +345,7 @@
                ep = 0x81;
                ifnum = 3;
                goto add_sync_ep_from_ifnum;
+       case USB_ID(0x1397, 0x050b): /* Behringer Wing */
        case USB_ID(0x0763, 0x2080): /* M-Audio FastTrack Ultra */
        case USB_ID(0x0763, 0x2081):


A week's worth of debugging and learning yielded a one line patch ;)

Since adding that I've been running at p=128 n=2 for much of the day with
no tweaking of interrupts, and no xruns at all (and at 44.1kHz, because that's
what this project was originally recorded at). With further tuning that might
come down further because I was able to run in Capture Only at p=8(!) n=2, so
it feels like there's still scope for more tweaking.

Thanks for the help,
bjb


