Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7C34B367
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 01:47:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0381679;
	Sat, 27 Mar 2021 01:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0381679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616806042;
	bh=Fly18xX7OYkzvUIkL5fI92hL+8YwinIdLl6kfSsSo/g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBXXgGWk4znRoTKsEuT+h2OqKNNimlIu8iunA2ALeER4aIgR5CZQZcgZMP4CUBEjh
	 rEg9OLdCBKK/gpchTztYbmt/rM8cwd1TNgHY4OLca0x6gSPoEl4wcQ5H2phuKGzOqk
	 xcFOj94I6WV0YTMnLHmtvRRTG6lFk4Stgt4NnQQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D04AF80104;
	Sat, 27 Mar 2021 01:45:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 277E0F8016B; Sat, 27 Mar 2021 01:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67CA1F80104
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 01:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CA1F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TcW1eMHo"
Received: by mail-qv1-xf2b.google.com with SMTP id t16so3839912qvr.12
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=XVVaaxFV+yoVeHRfg0Q0Krf6kvFnB9ffr4xFLM+ihXw=;
 b=TcW1eMHo8hJgDj0711eTpM9eGHz7uY/p+KxgOC7NbShs0gL4+d38LgFs3MEy6aljoQ
 vt5RGSXeZfgA9X6owxYpT9FgitujQap/qs+tQLHmnatwd9fQTmAhDOPKagCQqM7NI23W
 CJ1dFRjJYuVnq4HKEyqYp8za6Gk1VYTmhiynuHZZfKcwaLRLH21zXoPFVGCcWuq0XDfI
 Q1tnx3ZTR3yRNTZKOCafMl2pmd61mcGPQBtQcaQfGMNvhB3NoZprLpghqLGdPHqc95Oa
 n/Wn6ILfZUObbV0tP89cMsG8XXeoQe/E8gownZkK/GsIiO6Dve2E/5CTQaG1JeIicIos
 JqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=XVVaaxFV+yoVeHRfg0Q0Krf6kvFnB9ffr4xFLM+ihXw=;
 b=tqAFrEZ3Mq4s8dNwR4az5Hrg0JkDjuUwKqdaUiPn3vFiaapZlggzZbD39hu9VmRKiD
 1cRDA3045liIo65DmJdpPIFBDHn3rOvxy2gf2Szcf3fBex8pG2tGNruHN3m7Qu6XjnOQ
 9dXQ94C5p2ctQ7xjDFdxT0vi1FFbLUDyd1JtJU2x2PChTXgZ4BAGWFmiHoa//Vc3FrT2
 o3YBxwH72mmxYFkgpNBapY+1r8g4+G3w3gOzTi+vvcPJxdmcHpQqUXjwxfzFxssW1Ywj
 RbilQW4ogGHWeC+3zfJCutMGntEISrsws4LG7t6Of3uIVqHg3ooBuyOaD953wQCwW2lx
 yXDQ==
X-Gm-Message-State: AOAM5311Oj7d6QqvQ+Mhl0muU29A5/feGeAp/+Ttkv9QmVBM8+ujd2q5
 qfNqQfYTUFBpleMSIwKA0YkwJBLk61n6IVL/UUng5YLB82w=
X-Google-Smtp-Source: ABdhPJzj6rrtLmoR/H0BisH14jGTpjmnHBLyej5vPaYkmPy8oMVq9CH08mAkzhJyckBd1Fbo3GRze1UXAyAwBNwr7KE=
X-Received: by 2002:a0c:bdaf:: with SMTP id n47mr15696059qvg.48.1616805945590; 
 Fri, 26 Mar 2021 17:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcva7yYk149Xe0twd0ydYTEBxX0duekemiK_NySNRQ0xaA@mail.gmail.com>
In-Reply-To: <CAEsQvcva7yYk149Xe0twd0ydYTEBxX0duekemiK_NySNRQ0xaA@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Fri, 26 Mar 2021 21:42:04 -0300
Message-ID: <CAEsQvctng2uPiS-sHn7suQBVBTr1f+k3HuAim31dQTzhdxBPtQ@mail.gmail.com>
Subject: Re: [PATCH] Pioneer devices: engage implicit feedback sync for
 playback
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

Sorry, I'm reposting because apparently I didn't get diff -up right...
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
@@ -50,7 +50,7 @@ static const struct snd_usb_implicit_fb_

        /* Fixed EP */
        /* FIXME: check the availability of generic matching */
-       IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer
UFX1604 */
+       //IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer
UFX1604 */
        IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer
UFX1204 */
        IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio
Axe-Fx III */
        IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State
Logic SSL2 */
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

On Mon, Mar 22, 2021 at 1:16 AM Geraldo <geraldogabriel@gmail.com> wrote:

> Hello everybody,
>
> This is a highly experimental patch on top of 5.12-rc4 that's supposed to
> engage implicit feedback sync on the playback for Pioneer devices. Without
> implicit feedback sync the inputs started glitching due to clock drift in
> about an hour in my Pioneer DJ DDJ-SR2.
>
> If you own a Pioneer device please test this patch and verify in the
> dyndbg logs if your capture(input) EP is being opened twice and if
> implicit_fb = 1 for the playback EP. I can't ask of you all to test this
> for hours and hours but if you wanted to have an excuse to digitize vinyl
> or spin up DVS this is your perfect one. Help open source!
>
> I'd like to thank Takashi Iwai for his tireless support in the Pioneer
> regression and beyond. Hopefully this highly experimental feature's code
> can be polished and mainlined eventually.
>
> --- implicit.c.git      2021-03-21 22:40:48.363417245 -0300
> +++ implicit.c  2021-03-22 01:03:05.726729481 -0300
> @@ -177,30 +177,31 @@
>                                        ifnum, alts);
>  }
>
> -/* Playback and capture EPs on Pioneer devices share the same
> iface/altset,
> - * but they don't seem working with the implicit fb mode well, hence we
> - * just return as if the sync were already set up.
> +/* Pioneer devices: playback and capture streams sharing the same
> iface/altset
>   */
> -static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
> -                               struct audioformat *fmt,
> -                               struct usb_host_interface *alts)
> -{
> -       struct usb_endpoint_descriptor *epd;
> -
> -       if (alts->desc.bNumEndpoints != 2)
> -               return 0;
> -
> -       epd = get_endpoint(alts, 1);
> -       if (!usb_endpoint_is_isoc_in(epd) ||
> -           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC ||
> -           ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> -            USB_ENDPOINT_USAGE_DATA &&
> -            (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> -            USB_ENDPOINT_USAGE_IMPLICIT_FB))
> -               return 0;
> -       return 1; /* don't handle with the implicit fb, just skip sync EP
> */
> +static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
> +                                  struct audioformat *fmt,
> +                                  struct usb_host_interface *alts)
> +{
> +       struct usb_endpoint_descriptor *epd;
> +
> +       if (alts->desc.bNumEndpoints != 2)
> +               return 0;
> +
> +       epd = get_endpoint(alts, 1);
> +
> +       if (!usb_endpoint_is_isoc_in(epd) ||
> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC ||
> +           ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> +            USB_ENDPOINT_USAGE_DATA &&
> +            (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> +            USB_ENDPOINT_USAGE_IMPLICIT_FB))
> +               return 0;
> +       return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 1,
> +                                      alts->desc.bInterfaceNumber, alts);
>  }
>
> +
>  static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
>                                      struct audioformat *fmt,
>                                      int iface, int altset)
> @@ -306,7 +307,7 @@
>             alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
>             (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
>              USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */)) {
> -               if (skip_pioneer_sync_ep(chip, fmt, alts))
> +               if (add_pioneer_implicit_fb(chip, fmt, alts))
>                         return 1;
>         }
>
> @@ -339,8 +340,20 @@
>                                     struct audioformat *fmt,
>                                     struct usb_host_interface *alts)
>  {
> -       if (fmt->endpoint & USB_DIR_IN)
> -               return audioformat_capture_quirk(chip, fmt, alts);
> +        bool isPioneer;
> +
> +        if (alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
> +            (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
> +             USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */))
> +            isPioneer = true;
> +
> +       if (fmt->endpoint & USB_DIR_IN) {
> +                if (isPioneer == true)
> +                    return 1;
> +                else
> +                   return audioformat_capture_quirk(chip, fmt, alts);
> +        }
> +
>         else
>                 return audioformat_implicit_fb_quirk(chip, fmt, alts);
>  }
>
>
> --- endpoint.c.git      2021-03-21 22:40:54.800084101 -0300
> +++ endpoint.c  2021-03-21 22:45:41.543425855 -0300
> @@ -688,7 +688,7 @@
>                 goto unlock;
>         }
>
> -       if (!ep->opened) {
> +       if (ep->opened < 2) {
>                 if (is_sync_ep) {
>                         ep->iface = fp->sync_iface;
>                         ep->altsetting = fp->sync_altsetting;
>
