Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E3353A01
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 23:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B48516DA;
	Sun,  4 Apr 2021 23:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B48516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617571091;
	bh=4CGXTJ8qpADnnr77um8kBN4dA+StgRokADNhJMbmPmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O76yyiddzkWv8lLUyRjiLECDF6420HNZpujwD0QGPr42g+lqk96fUcrMxyjagfsEl
	 SIGCiX3kq886y3uRNS58h8ERnv+N8Q8k3yc5uhCPBvQ9kehaqk7lKz4we4+7fel9m5
	 SyZMLGdkFf/7ZIt1J/ZqhcyuxI/V1tNB0AZ9VKs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CF61F80249;
	Sun,  4 Apr 2021 23:16:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A950F80168; Sun,  4 Apr 2021 23:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E685FF800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 23:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E685FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mCzkugN1"
Received: by mail-qv1-xf35.google.com with SMTP id o11so490303qvh.11
 for <alsa-devel@alsa-project.org>; Sun, 04 Apr 2021 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ULbBUvRNSnCvgIKzB8szbo9gU9/sEG/nDFVlzGhr/jw=;
 b=mCzkugN1wsGaZQJwG3UrlmabM+6RSI6viTOBg78cXK88PYcCU/CHUdZiJ+j7w/LkMV
 stKarMDNeqtfgv7Bgl8WZRbwocoHRA1b0vlO017+I4v7e2RH/MZEEEy1WMIXFi3sIj9C
 9WMSnXqz5hGPhkXE84+uHUlMH1tp6Il2aCpVO+jjTMcVbxgmO+h27xWnc1KL3+Ooxzw5
 MlMdq+u1VPG4TWt8Ao52+mpr1o0q4/kt1vYimnPVAA5DDaoo+9mvujYVnhYCSoPMTEGP
 PVbQcx2XHTTu6biu3F9dNNKcPvXgau4m3BICt56DbE7AwMor+mSQIslxtzs/VIX0A5JF
 7FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ULbBUvRNSnCvgIKzB8szbo9gU9/sEG/nDFVlzGhr/jw=;
 b=lhTfDEZNUHMrxotXDcNf+I7liPdjdfb3BQzPg59ecUUq+UQbb6NfruD6xP4Tr+r6fT
 ujAcQK2NK+oRXaz9201gUlLpwMas1M3Pq8o/uXVMWxtKxJ5bjpUS0xYMwwdHfes1sjwF
 i4MI0UEFQ78xupRsIHX28VZx7in1yfoE+aomtnYHkSn2mYq6PJYaEILmRC+bu80nxYsK
 nRloecxbkAY2EQ9cm5cc+u+VDnfJk/Ll8yUmUmYCdJqOCG/FG1gxPlFFzyUv5GScInwA
 +wFRvZUvb2GtxOY0560hi3zGCSInL7CkjfBXZ4IZzTZRBpemF9AF6Ab0uBgy9EHEbEO7
 qplQ==
X-Gm-Message-State: AOAM533z5EXATWK50bZILa0SEHVOY7UnXww83kpbLMzXW9BDYPfVAZAS
 k/ZcOcMJIuPw55UZfAwCUbb6XkBdIO/9R+m+dk0=
X-Google-Smtp-Source: ABdhPJyAPnUj2RY01cReHVqTTOYpvFSgk/6i1dWaQSmseO4ZeyxAzZ3uVl0XLzlnq7gt4g9K/KNVFB/Qc3zZ+HKQ5AQ=
X-Received: by 2002:a05:6214:18e7:: with SMTP id
 ep7mr200581qvb.14.1617570993652; 
 Sun, 04 Apr 2021 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcva7yYk149Xe0twd0ydYTEBxX0duekemiK_NySNRQ0xaA@mail.gmail.com>
 <CAEsQvctng2uPiS-sHn7suQBVBTr1f+k3HuAim31dQTzhdxBPtQ@mail.gmail.com>
 <CAEsQvcv6Z-KVgos4KGLOrEUM1mtdzskpga16os8pWCcq7t-CQA@mail.gmail.com>
In-Reply-To: <CAEsQvcv6Z-KVgos4KGLOrEUM1mtdzskpga16os8pWCcq7t-CQA@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Sun, 4 Apr 2021 18:12:35 -0300
Message-ID: <CAEsQvcup=fH=xaygbiGRozCt6hyCSfSo6zSBybf2Z4WTR01HGg@mail.gmail.com>
Subject: Fwd: [PATCH] Pioneer devices: engage implicit feedback sync for
 playback
To: fabian@lesniak-it.de, livvy@base.nu, dmanlfc@gmail.com, marcan@marcan.st, 
 dmitry@d-systems.ee, franta-linux@frantovo.cz, ard@kwaak.net
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Hello, Linux users of Pioneer gear!

I was recently able to engage implicit feedback sync on the playback for my
Pioneer DJ DDJ-SR2.

Without this workaround you can all expect the sound quality of your inputs
to degrade in about an hour, give it or take it, due to clock drift.

Please give this patch a good reading and a good test and let us know on
alsa-devel how it performed.

---

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

--- endpoint.c.git      2021-03-21 22:40:54.800084101 -0300
+++ endpoint.c  2021-03-25 21:24:45.253396350 -0300
@@ -688,7 +688,8 @@ snd_usb_endpoint_open(struct snd_usb_aud
                goto unlock;
        }

-       if (!ep->opened) {
+       //if (!ep->opened) {
+       if (ep->opened < 2) {
                if (is_sync_ep) {
                        ep->iface = fp->sync_iface;
                        ep->altsetting = fp->sync_altsetting;

--- implicit.c.git      2021-03-21 22:40:48.363417245 -0300
+++ implicit.c  2021-03-25 20:44:31.826678422 -0300
@@ -177,30 +177,31 @@ static int add_roland_implicit_fb(struct
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
+static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
+                                  struct audioformat *fmt,
+                                  struct usb_host_interface *alts)
 {
-       struct usb_endpoint_descriptor *epd;
+       struct usb_endpoint_descriptor *epd;

-       if (alts->desc.bNumEndpoints != 2)
-               return 0;
+       if (alts->desc.bNumEndpoints != 2)
+               return 0;

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
@@ -306,7 +307,7 @@ static int audioformat_implicit_fb_quirk
            alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
            (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
             USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */)) {
-               if (skip_pioneer_sync_ep(chip, fmt, alts))
+               if (add_pioneer_implicit_fb(chip, fmt, alts))
                        return 1;
        }

@@ -329,6 +330,7 @@ static int audioformat_capture_quirk(str
        if (p && p->type == IMPLICIT_FB_FIXED)
                return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
                                               p->iface, NULL);
+       //return 0;
        return 0;
 }

@@ -339,8 +341,20 @@ int snd_usb_parse_implicit_fb_quirk(stru
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
