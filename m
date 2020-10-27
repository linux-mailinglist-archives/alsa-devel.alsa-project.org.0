Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD529A565
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 08:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2480E16A5;
	Tue, 27 Oct 2020 08:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2480E16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603783235;
	bh=yVKW7r44e5sKI+GehIl3BVeq/g8qCL8oa9PmphR1bT8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSTYCkLRbt3N/dMk/YILwd34bMZqO/SKCL7FIfSnKnwTuy5RTVl+rDPrLx+DNe725
	 2K9dNHU0JQ3y5+I3UFopRRUYtH+fNLQdQ7PSN8uenoTFEfQKLNjDmx9o7ln2HxYFnc
	 vMYHCYeQdJ0hpYujDkAlhiiA6fRyMgHeDl4JeEf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A3FF800FF;
	Tue, 27 Oct 2020 08:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C60AF801D8; Tue, 27 Oct 2020 08:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp3.cs.Stanford.EDU (smtp3.cs.stanford.edu [171.64.64.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB45F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 08:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB45F800FF
Received: from dn200on4g.stanford.edu ([128.12.92.144]:37614
 helo=trolley.csail.mit.edu) by smtp3.cs.Stanford.EDU with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <keithw@cs.stanford.edu>)
 id 1kXJFq-0005lS-Cw; Tue, 27 Oct 2020 00:18:50 -0700
Date: Tue, 27 Oct 2020 00:18:41 -0700
From: Keith Winstein <keithw@cs.stanford.edu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom
 UAC-2
Message-ID: <20201027071841.GA164525@trolley.csail.mit.edu>
References: <CAMzhQmP+Y_=XpCueCxPdjG6rtYn+YhtRSeRkXkv5mJ3NWtxA9Q@mail.gmail.com>
 <20201026080143.GA145492@trolley.csail.mit.edu>
 <s5h36215c2r.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h36215c2r.wl-tiwai@suse.de>
X-Scan-Signature: 127ff6e1eac6b45a32dc112250ed777d
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

On Mon, Oct 26, 2020 at 02:52:28PM +0100, Takashi Iwai wrote:
> On Mon, 26 Oct 2020 09:01:43 +0100,
> Keith Winstein wrote:
> > 
> > Here is the patch again without line-wrapping.
> 
> Could you put the patch description in the patch itself?
> Basically I'm fine to merge this as is, just missing information for
> git.

Sure, here you go:

From 51fac91fa3a5da656ca6a49ca6cc98be7664efd7 Mon Sep 17 00:00:00 2001
From: Keith Winstein <keithw@cs.stanford.edu>
Date: Sun, 25 Oct 2020 22:05:47 -0700
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom UAC-2

The Zoom UAC-2 USB audio interface provides an async playback endpoint ("1 OUT (ASYNC)") and
capture endpoint ("2 IN (ASYNC)"), both with 2-channel S32_LE in 44.1, 48, 88.2, 96, 176.4,
or 192 kilosamples/s. The device provides explicit feedback to adjust the host's playback
rate, but the feedback appears unstable and biased relative to the device's capture rate.
"alsaloop -t 1000" experiences playback underruns and tries to resample the captured audio
to match the varying playback rate. Forcing the kernel to use implicit feedback appears to
produce more stable results. This causes the host to transmit one playback sample for each
capture sample received. (Zoom North America has been notified of this change.)

Signed-off-by: Keith Winstein <keithw@cs.stanford.edu>
Tested-by: Keith Winstein <keithw@cs.stanford.edu>
---
 sound/usb/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b401ee894e1b..31b1edf53c41 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -352,6 +352,10 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ep = 0x81;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
+	case USB_ID(0x1686, 0xf029): /* Zoom UAC-2 */
+		ep = 0x82;
+		ifnum = 2;
+		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x1397, 0x0001): /* Behringer UFX1604 */
 	case USB_ID(0x1397, 0x0002): /* Behringer UFX1204 */
 		ep = 0x81;
-- 
2.25.1

