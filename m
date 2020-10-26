Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F172298764
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 08:28:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DFE216BA;
	Mon, 26 Oct 2020 08:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DFE216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603697322;
	bh=zMRD3F6a6ziBeZgKBuTon0yC0euL1qfv5Yp2GfnzPDM=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NZNDRgUjh6WbvBfKkohbTXzsv+0kmGXVOXzGdaHc6Ybk4zaQoXAqPshOAA9g4eCTT
	 AwNqdHtfjghcHG0jRyT2lgTleZtVt0kt1sBWrWGHnnsjdUTXxHnEpE4HUNpPxFx1Zq
	 7VEM2gFopgaIl/XAjYtGZUuvk3lQFM6hPwFNOnZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4E6F80249;
	Mon, 26 Oct 2020 08:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E50F80212; Mon, 26 Oct 2020 08:27:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp3.cs.Stanford.EDU (smtp3.cs.stanford.edu [171.64.64.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C322F80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 08:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C322F80086
Received: from mail-yb1-f171.google.com ([209.85.219.171]:40462)
 by smtp3.cs.Stanford.EDU with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 (envelope-from <keithw@cs.stanford.edu>) id 1kWwu7-0004db-Vm
 for alsa-devel@alsa-project.org; Mon, 26 Oct 2020 00:26:56 -0700
Received: by mail-yb1-f171.google.com with SMTP id n142so6837279ybf.7
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 00:26:55 -0700 (PDT)
X-Gm-Message-State: AOAM530My2AaordZ563fY4NMxnq8bJ7hndUN99RUtB5G93Nh8wbnxZpM
 CFRETBr4XHdTKOR8aFKPBLyRLEem9eGLYzAWqw==
X-Google-Smtp-Source: ABdhPJxSlxFvOLUKzslhzM08pVveNzlFzeERbJX8fyAlh3dq7FTHKJC1mUIwzUbbrd6MsOyCjcZMZUTBegLZqvFz/VA=
X-Received: by 2002:a25:df45:: with SMTP id w66mr21009552ybg.302.1603697215229; 
 Mon, 26 Oct 2020 00:26:55 -0700 (PDT)
MIME-Version: 1.0
From: Keith Winstein <keithw@cs.stanford.edu>
Date: Mon, 26 Oct 2020 00:26:19 -0700
X-Gmail-Original-Message-ID: <CAMzhQmP+Y_=XpCueCxPdjG6rtYn+YhtRSeRkXkv5mJ3NWtxA9Q@mail.gmail.com>
Message-ID: <CAMzhQmP+Y_=XpCueCxPdjG6rtYn+YhtRSeRkXkv5mJ3NWtxA9Q@mail.gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom UAC-2
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Scan-Signature: 6890477ab20817755420d5b1edd0addc
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

Hi folks,

We're using a Zoom UAC-2 USB audio interface, which provides an async
playback endpoint ("1 OUT (ASYNC)") and an async capture endpoint ("2
IN (ASYNC)"), both with 2-channel S32_LE in 44100, 48000, 88200,
96000, 176400, or 192000 samples per second. For whatever reason, the
explicit feedback on the playback endpoint seems a bit unstable and
also biased a little high. alsaloop -t 1000 gets repeated playback
underruns and starts trying to resample the audio to adjust the rate
(even though it's just looping from capture back to playback on the
same device!).

I've found that using implicit feedback produces much more stable
results and doesn't seem to hurt anything else (patch below). I wasn't
sure if the other "implicit feedback quirk" devices in sound/usb/pcm.c
are also ASYNC devices that happen to perform better using implicit
feedback instead (in which case adding the Zoom UAC-2 to the list
seems pretty routine), or if the others are SYNC devices that only
need help identifying the right endpoint and ifnum -- i.e., how
unorthodox is it to use implicit feedback on an ASYNC device?
Hopefully not very.

Please let me know if you'd like any additional information or testing.

Best regards,
Keith

From 2c8d691d39ab2824c344ac2562a1e8605b3384ba Mon Sep 17 00:00:00 2001
From: Keith Winstein <keithw@cs.stanford.edu>
Date: Sun, 25 Oct 2020 22:05:47 -0700
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Zoom UAC-2

Signed-off-by: Keith Winstein <keithw@cs.stanford.edu>
Tested-by: Keith Winstein <keithw@cs.stanford.edu>
---
 sound/usb/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b401ee894e1b..5723e8e69cf1 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -352,6 +352,10 @@ static int set_sync_ep_implicit_fb_quirk(struct
snd_usb_substream *subs,
         ep = 0x81;
         ifnum = 2;
         goto add_sync_ep_from_ifnum;
+    case USB_ID(0x1686, 0xf029): /* ZOOM UAC-2 */
+        ep = 0x82;
+        ifnum = 2;
+        goto add_sync_ep_from_ifnum;
     case USB_ID(0x1397, 0x0001): /* Behringer UFX1604 */
     case USB_ID(0x1397, 0x0002): /* Behringer UFX1204 */
         ep = 0x81;
-- 
2.25.1
