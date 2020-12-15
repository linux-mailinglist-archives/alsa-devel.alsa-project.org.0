Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8C2DB263
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:20:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E951810;
	Tue, 15 Dec 2020 18:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E951810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608052825;
	bh=qujf+7+eLVTh+QG+wzng72nj+OxSThjMKK4iTlNW1vg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fT5bP8qSnARFPu1h71jWz47gLYJn0CpyqPUjqYsY0iX0KN9trbomkiETh7wb9BmS2
	 ud3mLoBz5pqYsT1Tv4DleA9tcNDE8um3xXilsk7fHh9jiEx4k5WFQwrvboEhIgrnsz
	 AvWqfpW4qepl7h/VSFyuCrXj/b5YD8XrNofTazYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB758F804B0;
	Tue, 15 Dec 2020 18:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94FFBF80278; Tue, 15 Dec 2020 10:45:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238A0F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 10:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238A0F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vTEMOMc9"
Received: by mail-pl1-x644.google.com with SMTP id q4so5014454plr.7
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 01:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=JuotR0bsnwSo30/6mXPr21S9Zouq2xQsPdi52PTwkCM=;
 b=vTEMOMc9bF4CBkDNy4uF20rx8kQ8hpC8JmnKXMYKeLl5GbLnblhKV9I6HwB8GKEAMa
 MY8ftdtL/VdxxjhTXAZWV5PeGQ9AgEZwKfXZP6lejGjTJp7aBRb+pYsVscDbk5Z2eDAQ
 ABq+6t6drEIFF/UxRC2/2LtQmi0i0KL8J0RyX7FDRIkymAUKItlnemNuaSZF82FT8oy8
 29o4YM7mihQrnS1GRbGz5wFdqXvgzwLZA5S2EA4eBRRim9LIWK/aUk21v22ZeWMCjsik
 6KGDqIhFWyXx3PGKgVMtUsfcxQJylrvKMSMOicJkQOgsRJkFdAxyY8/OQxp1uhXlopJN
 +BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=JuotR0bsnwSo30/6mXPr21S9Zouq2xQsPdi52PTwkCM=;
 b=BGAwIHyWGyZ8a8i1u1c7c/tKjBxaZm2vwjAvdga3Gi7gPbGUeBLQWt+FZ1vJNvOJbQ
 GTIb7v5ZSy3bzyZyuPmkpDo3vPNsDnAiE/ZEJ1hXZ2IASvzceZsZBiaxc4zxdTytnwI7
 apQqURnz/IZHn2kCJsg9SwPIScIfyGBi44c/g7fc6MqiRt62PmKnzmF0T4iaMRv7uHQU
 NjobHjHl/BexQHp85BaGIt2sW6jbnR+DM/4+wpbzn/uGsza5IBgOKKuum4MqK2pcZMkF
 vp2XcPneCuBmjtsw6xy5zrcslPZnMXX2x/bfjVv2NqQfIV2PxQEqnjMyrGoGtJJIE1ib
 wxOQ==
X-Gm-Message-State: AOAM532wNzhy+gryPvbXOgq3sh6uvapndC0/+3jH8zPZ+gJh6vebxGOr
 KiuQYJKfCr0tCm5OQeGYSVV0HG0JhvDWhmwOlnnAHLQx4kKT1w==
X-Google-Smtp-Source: ABdhPJxWSg1AXJv4qi0lu5KaTYb4UCA26DY+D3KnWwE43LNekYsSzezWX08VuvIAR9Wx+4oh5oD63/AtrgMB2le0500=
X-Received: by 2002:a17:90b:107:: with SMTP id
 p7mr18462741pjz.216.1608025496069; 
 Tue, 15 Dec 2020 01:44:56 -0800 (PST)
MIME-Version: 1.0
From: Marco Giunta <giun7a@gmail.com>
Date: Tue, 15 Dec 2020 10:44:45 +0100
Message-ID: <CAE5BBpTEw2pTzDhLxaQiGwAvnH_q6aChLkuDXxEQrZFvS6wVyQ@mail.gmail.com>
Subject: [PATCH] Fix mic sound on Jieli webcam
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 15 Dec 2020 18:18:40 +0100
Cc: tiwai@suse.com
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
recently I've bought a usb webcam with integrated mic:

  Jieli Technology USB PHY 2.0 (1224:2a25)

The video part works well, but the mic sound is speedups, "like
minions" (cit.). When I connect the camera, these are the dmesg
messages:

kernel: usb 1-8: current rate 0 is different from the runtime rate 8000
kernel: usb 1-8: current rate 0 is different from the runtime rate 16000
kernel: usb 1-8: current rate 0 is different from the runtime rate 44100
kernel: usb 1-8: current rate 0 is different from the runtime rate 48000
kernel: usb 1-8: Warning! Unlikely big volume range (=4096), cval->res
is probably wrong.
kernel: usb 1-8: [3] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
kernel: usbcore: registered new interface driver snd-usb-audio

and after a while, dmesg log is filled, every 5 seconds, with:

kernel: retire_capture_urb: 84 callbacks suppressed
kernel: retire_capture_urb: 1714 callbacks suppressed

A guy reports on ArchLinux bug website the same problem
(https://bugs.archlinux.org/task/68141?opened=12995&status%5B0%5D=)
and provides a patch to fix the sound issue. I've applied the patch on
kernel 5.9.13 (Fedora 33 x86_64) and now the mic works, no more
minions voice effect. Now dmesg messages are only:

kernel: usb 1-8: Warning! Unlikely big volume range (=4096), cval->res
is probably wrong.
kernel: usb 1-8: [3] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
kernel: usbcore: registered new interface driver snd-usb-audio

the retire_capture_urb messages are gone.

All credits for the patch go to him but I don't know how to contact
that guy nor I don't know if he has already contacted you, so my
question is if you could review his patch and finally apply upstream.

If you need other information or you need a tester, I'm here.

Thanks,
  Marco

--- a/sound/usb/format.c    2020-10-01 18:36:35.000000000 +0300
+++ b/sound/usb/format.c    2020-10-04 02:10:21.678685952 +0300
@@ -217,6 +217,21 @@
                 (chip->usb_id == USB_ID(0x041e, 0x4064) ||
                  chip->usb_id == USB_ID(0x041e, 0x4068)))
                 rate = 8000;
+
+            // hack for "Jieli Technology USB PHY 2.0" webcam
+            if (chip->usb_id == USB_ID(0x1224, 0x2a25)) {
+                switch (rate) {
+                case 8000:
+                    fp->datainterval += 4;
+                    break;
+                case 16000:
+                    fp->datainterval += 3;
+                    break;
+                default:
+                    fp->datainterval += 1;
+                    break;
+                }
+            }

             fp->rate_table[fp->nr_rates] = rate;
             if (!fp->rate_min || rate < fp->rate_min)
--- a/sound/usb/endpoint.c    2020-10-01 18:36:35.000000000 +0300
+++ b/sound/usb/endpoint.c    2020-10-04 02:09:09.471978982 +0300
@@ -882,6 +882,8 @@
     if (snd_usb_get_speed(ep->chip->dev) != USB_SPEED_FULL) {
         packs_per_ms = 8 >> ep->datainterval;
         max_packs_per_urb = MAX_PACKS_HS;
+        if (!packs_per_ms)
+            packs_per_ms = 1;
     } else {
         packs_per_ms = 1;
         max_packs_per_urb = MAX_PACKS;
--- a/sound/usb/quirks.c    2020-10-01 18:36:35.000000000 +0300
+++ b/sound/usb/quirks.c    2020-10-04 02:14:04.532196519 +0300
@@ -1516,6 +1516,7 @@
     case USB_ID(0x1901, 0x0191): /* GE B850V3 CP2114 audio interface */
     case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
     case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
+    case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
         return true;
     }
