Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A23437DE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 05:21:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C9510E;
	Mon, 22 Mar 2021 05:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C9510E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616386918;
	bh=s50/uiXdmZ8C/7dUBh5xi2jgudk8tFTvoqTMXwLU0jc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d3TdpF+LkNbRkYkw5YL+hmJdoRRA6/JXOP8lrzelju1EZskUn5rZwGI1zzDH6vzOw
	 wxrdse0f8abA+Cxks5/vxz7z4MM8BGi60HASjpKX6aHMoEDp8CUDefraO53Eg/or/i
	 g/3ddX0aPhE3QmsW7taX/vAoKXfLnd/lXGagfK6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 830D3F801D5;
	Mon, 22 Mar 2021 05:20:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3BAEF8016B; Mon, 22 Mar 2021 05:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D19B3F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D19B3F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fJb/ri5L"
Received: by mail-qk1-x729.google.com with SMTP id q26so4082100qkm.6
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 21:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QXakK3vPiVljZyIQg/tvIGzUvK0UnxvteYwf83K6FLI=;
 b=fJb/ri5LLLX62zRVyaiDEzC9SXPXwa7FG/X0lVB852RYNReI1up8dLdpyByX0pGKwr
 /pvt7dPiQqKDImnw1ZerE9FecEovv52rW9hoaDGS1vafqIAgMQ1qISvcHVdWZEDhd/Hy
 96Ehhzo4IzY9bjml+h8ZjwVlzwi58q97Oz3GvxcgUWGbdadqkXdmVdW/hbxwgnZDjwVf
 O8VNmdk9EIEXQsNSkO8bOyzk/QOp5tAazd2DzjiHDNv+kZN7wAGpSulaUJkYqO/sBRzF
 G6fXZ5IIytYwvQMhKtgF9unh+MoYe4YRURZQ8AV4dfawxgIr65BoeTu386ChovgyKeWd
 5ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QXakK3vPiVljZyIQg/tvIGzUvK0UnxvteYwf83K6FLI=;
 b=uVR6F+LNcSXw61KZlPEHXrjPFc2Gtb+nC1bJC/MMazEldcFxrjTJRa1/TmNB2sKvQg
 13ioJWtPVHDm2KCbI1LMDM+RxtwQbas/Mh1q2tGpymVaNUGbtLoY2Onq9+RLEqyEmzFg
 ZotBGgYsRQHYg49oWtRsdKVnavhjCJvdc/CceExiWdFzv3uk4lUXt1o8bprOcjQN8H4S
 miUdoqFBIoth4XJvvuUEZ+qLwwUeEX23VAASG+BoliMTr2Rzic3Cit/R/LLnMwDKcdaE
 KyK0TUWisfG7RAUqkvPCIheInrKvi4718Svr84dXrvLTN1iPONy0u+aPLKzo5jPTxxmh
 Qd/Q==
X-Gm-Message-State: AOAM53274LwO2WaeQc2vhqbbOn5u7ycnVQplgSQk3TapF9tFO6DKugmt
 nDTWm34+aG/3NkceGl9n3acIbPwm7KWK9WA9dKLtMv6iV+w=
X-Google-Smtp-Source: ABdhPJzXZ6dJK/LzGjLnkSICWqRN1q1WVTMb3NpPsCRZLDXYeO1Mmo0I7Jwjuk9ptLteWpeNMk5Sg2v31lZaCdOdqsM=
X-Received: by 2002:a37:a38e:: with SMTP id m136mr9079952qke.250.1616386816286; 
 Sun, 21 Mar 2021 21:20:16 -0700 (PDT)
MIME-Version: 1.0
From: Geraldo <geraldogabriel@gmail.com>
Date: Mon, 22 Mar 2021 01:16:50 -0300
Message-ID: <CAEsQvcva7yYk149Xe0twd0ydYTEBxX0duekemiK_NySNRQ0xaA@mail.gmail.com>
Subject: [PATCH] Pioneer devices: engage implicit feedback sync for playback
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello everybody,

This is a highly experimental patch on top of 5.12-rc4 that's supposed to
engage implicit feedback sync on the playback for Pioneer devices. Without
implicit feedback sync the inputs started glitching due to clock drift in
about an hour in my Pioneer DJ DDJ-SR2.

If you own a Pioneer device please test this patch and verify in the dyndbg
logs if your capture(input) EP is being opened twice and if implicit_fb = 1
for the playback EP. I can't ask of you all to test this for hours and
hours but if you wanted to have an excuse to digitize vinyl or spin up DVS
this is your perfect one. Help open source!

I'd like to thank Takashi Iwai for his tireless support in the Pioneer
regression and beyond. Hopefully this highly experimental feature's code
can be polished and mainlined eventually.

--- implicit.c.git      2021-03-21 22:40:48.363417245 -0300
+++ implicit.c  2021-03-22 01:03:05.726729481 -0300
@@ -177,30 +177,31 @@
                                       ifnum, alts);
 }

-/* Playback and capture EPs on Pioneer devices share the same iface/altset,
- * but they don't seem working with the implicit fb mode well, hence we
- * just return as if the sync were already set up.
+/* Pioneer devices: playback and capture streams sharing the same
iface/altset
  */
-static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
-                               struct audioformat *fmt,
-                               struct usb_host_interface *alts)
-{
-       struct usb_endpoint_descriptor *epd;
-
-       if (alts->desc.bNumEndpoints != 2)
-               return 0;
-
-       epd = get_endpoint(alts, 1);
-       if (!usb_endpoint_is_isoc_in(epd) ||
-           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
USB_ENDPOINT_SYNC_ASYNC ||
-           ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
-            USB_ENDPOINT_USAGE_DATA &&
-            (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
-            USB_ENDPOINT_USAGE_IMPLICIT_FB))
-               return 0;
-       return 1; /* don't handle with the implicit fb, just skip sync EP */
+static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
+                                  struct audioformat *fmt,
+                                  struct usb_host_interface *alts)
+{
+       struct usb_endpoint_descriptor *epd;
+
+       if (alts->desc.bNumEndpoints != 2)
+               return 0;
+
+       epd = get_endpoint(alts, 1);
+
+       if (!usb_endpoint_is_isoc_in(epd) ||
+           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
USB_ENDPOINT_SYNC_ASYNC ||
+           ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+            USB_ENDPOINT_USAGE_DATA &&
+            (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+            USB_ENDPOINT_USAGE_IMPLICIT_FB))
+               return 0;
+       return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 1,
+                                      alts->desc.bInterfaceNumber, alts);
 }

+
 static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
                                     struct audioformat *fmt,
                                     int iface, int altset)
@@ -306,7 +307,7 @@
            alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
            (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
             USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */)) {
-               if (skip_pioneer_sync_ep(chip, fmt, alts))
+               if (add_pioneer_implicit_fb(chip, fmt, alts))
                        return 1;
        }

@@ -339,8 +340,20 @@
                                    struct audioformat *fmt,
                                    struct usb_host_interface *alts)
 {
-       if (fmt->endpoint & USB_DIR_IN)
-               return audioformat_capture_quirk(chip, fmt, alts);
+        bool isPioneer;
+
+        if (alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+            (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
+             USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */))
+            isPioneer = true;
+
+       if (fmt->endpoint & USB_DIR_IN) {
+                if (isPioneer == true)
+                    return 1;
+                else
+                   return audioformat_capture_quirk(chip, fmt, alts);
+        }
+
        else
                return audioformat_implicit_fb_quirk(chip, fmt, alts);
 }


--- endpoint.c.git      2021-03-21 22:40:54.800084101 -0300
+++ endpoint.c  2021-03-21 22:45:41.543425855 -0300
@@ -688,7 +688,7 @@
                goto unlock;
        }

-       if (!ep->opened) {
+       if (ep->opened < 2) {
                if (is_sync_ep) {
                        ep->iface = fp->sync_iface;
                        ep->altsetting = fp->sync_altsetting;
