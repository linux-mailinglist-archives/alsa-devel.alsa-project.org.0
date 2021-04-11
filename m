Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC435B23C
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 09:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF06F1676;
	Sun, 11 Apr 2021 09:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF06F1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618127285;
	bh=iRkf5nWTC9+SP8bGOd8PHfS712PoSG9kgJZsoQbyTGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tpf/dASOjwzupFZu6HE4NCU/71lUelrBpO0rz6ORz11M3KLZpBXZROqh/u4pHEaHc
	 rWsXsamfBNA8l6890rxNDNV0VffvilDfoFjN0hLYoVfsVxskNQVDOWi7t1ccTJ2zr+
	 LnnEnjKcAYwfhzysBmNaymAyalO27Iqk7ByEXI6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36FF3F8013D;
	Sun, 11 Apr 2021 09:46:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D89F8013D; Sun, 11 Apr 2021 09:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE9BF8013D
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 09:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE9BF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eLXjAGMj"
Received: by mail-ed1-x534.google.com with SMTP id ba6so11308819edb.1
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sr9zXODFEw61kzfT4WaWeVdpw8mSBCOLqCFd1xw8XiM=;
 b=eLXjAGMjvGgAar/LwMJA5aAA0VO5i0t4m/6Gu2qxAaCSnSS9eFuQ3aet7dgFWcX8Z3
 bzhIl9KTSIVfQI1GEn29wU4AOa7eGwB9xkzD0dMyQk1CaOWSl6PhlVyIIsdYBilElulZ
 Y62DQkSIppAec5wiEhXtmWHquR1LjOsqscWPvldqt/xfqWl+m0JK9C0HpwPT+H8lTBTR
 b+Ex0ShviirEqUDLfkgRwRbFa7vFIKQrli3cqP5PLWFw1vOJeCLeV3rOZWlI0XvRmMgm
 PJyZZajofyiHBdnf8VvGnr0QH9cHwM+V+nVyb6ARS+mVk3lalVgTg4pUSZLOm/7yEye+
 uu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sr9zXODFEw61kzfT4WaWeVdpw8mSBCOLqCFd1xw8XiM=;
 b=nnizXuxc4dkhNB4QJgxhVLI4PWkUBFRGzrEDVtB4KAxNXBWmJSRoVPji63pmRSw4DR
 LY6LOE16tNnHw6K4uSZmBrEmactAor6N7lLJRXOU1cwKyaligWKDGRE9BmS6zWNK42xG
 WC9jmX0RZcq/MrUvy67nBjdDZwCItjwrsQy23SsxwGmzupr5G8SiTI+sIXdLZqUKNCUD
 S9V70OAixOfD7vTw0NKd3InZFeG3vrsyTs0pe9pmIqkBc+MCrs1gSN9FkAFq8tKNXJRQ
 tfUI+RRCAo/QESM+JU+6xooDqfzT2n72PV9OX61oGPEUnh93hZd0yVcnpX0gVDi8Ade7
 TKcQ==
X-Gm-Message-State: AOAM530q6K983D6A0ClIYKyNdfZuvKJdHj+vAqSgEdVH8lJL/DGnlJaF
 RiuEu7oNm8BgDjalPIR754MNVAhiUEd4joFr7uI=
X-Google-Smtp-Source: ABdhPJzggRIlAc1kC1fzVsewLdJdR7Z0eoGqHaAe9Klu5xpYFNuOysVAAhkyMbivnE2H2UT+BFxGo472KQzoc6qJD5M=
X-Received: by 2002:a50:cd0b:: with SMTP id z11mr17814440edi.209.1618127186053; 
 Sun, 11 Apr 2021 00:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
In-Reply-To: <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Sun, 11 Apr 2021 02:46:14 -0500
Message-ID: <CAOsVg8pCYheiPea2NxowwqY74FWGFVc=tgMPnJXzsUEKHTYVAg@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
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

This is the patch I'm using now, thinking all my devices work best with it,
but changes are inevitable (for other devices anyway).  It's likely the
Roland VB-99 is the same as the VG-99, but as having the VG-99 skipped in
the playback table and fixed in the capture table seems to work for me, I
left the VB-99 as is.  Although, assuming it is either handled by the VG-99
code, or its own very similar code, it may not need to be in these quirk
tables at all:
diff -Nurp linux-5.11.9.orig/sound/usb/endpoint.c
linux-5.11.9.roland-geraldo-nascimento/sound/usb/endpoint.c
--- linux-5.11.9.orig/sound/usb/endpoint.c 2021-03-24 05:54:19.000000000
-0500
+++ linux-5.11.9.roland-geraldo-nascimento/sound/usb/endpoint.c 2021-04-11
02:06:42.487663031 -0500
@@ -1343,6 +1343,7 @@ int snd_usb_endpoint_start(struct snd_us
 {
  int err;
  unsigned int i;
+ bool skip_implicit_fb_urb_hold;

  if (atomic_read(&ep->chip->shutdown))
  return -EBADFD;
@@ -1375,7 +1376,16 @@ int snd_usb_endpoint_start(struct snd_us
  if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
  goto __error;

- if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
+ //if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
+        skip_implicit_fb_urb_hold = false;
+
+        if (USB_ID_VENDOR(ep->chip->usb_id) == 0x0582 &&
+           ((USB_ID_PRODUCT(ep->chip->usb_id) == 0x013e) || /* Roland R-26
*/
+           (USB_ID_PRODUCT(ep->chip->usb_id) == 0x015b) ||  /* Roland
INTEGRA-7 */
+           (USB_ID_PRODUCT(ep->chip->usb_id) == 0x01ff)))   /* Roland
Boutique D-05 */
+               skip_implicit_fb_urb_hold = true;
+
+       if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
!skip_implicit_fb_urb_hold) {
  for (i = 0; i < ep->nurbs; i++) {
  struct snd_urb_ctx *ctx = ep->urb + i;
  list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
linux-5.11.9.roland-geraldo-nascimento/sound/usb/implicit.c
--- linux-5.11.9.orig/sound/usb/implicit.c 2021-04-01 20:55:06.079399075
-0500
+++ linux-5.11.9.roland-geraldo-nascimento/sound/usb/implicit.c 2021-04-11
02:02:09.388996065 -0500
@@ -71,27 +71,145 @@ static const struct snd_usb_implicit_fb_
   .ep_num = 0x84, .iface = 0 }, /* MOTU MicroBook II */

  /* No quirk for playback but with capture quirk (see below) */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a9), /* Roland MC-808 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c2), /* Roland SonicCell */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c4), /* Edirol M-16DX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c5), /* Roland SP-555 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c7), /* Roland V-Synth GT */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00d1), /* Roland Music Atelier */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00da), /* BOSS GT-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00db), /* BOSS GT-10 Guitar Effects
Processor */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00dc), /* BOSS GT-10B */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00de), /* Roland Fantom-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00eb), /* Roland VS-100 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00f8), /* Roland JUNO Series */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fc), /* Roland VS-700C */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fd), /* Roland VS-700 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fe), /* Roland VS-700 M1 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ff), /* Roland VS-700 M2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0100), /* Roland VS-700 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0101), /* Roland VS-700 M2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0102), /* Roland VB-99 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0109), /* BOSS eBand JS-8 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0111), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0113), /* BOSS ME-25 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0114), /* Roland SD-50 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0117), /* Roland VS-20 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0119), /* Roland OCTAPAD SPD-30 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x011c), /* Roland Lucina AX-09 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x011e), /* BOSS BR-800 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0120), /* Roland OCTA-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0121), /* Roland OCTA-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0123), /* Roland JUNO-Gi */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0124), /* Roland M-300 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0127), /* Roland GR-55 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012b), /* Roland DUO-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012f), /* Roland QUAD-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0132), /* Roland TRI-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0134), /* Roland V-Mixer */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0138), /* BOSS RC-300 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x013a), /* Roland JUPITER-80 */
+ IMPLICIT_FB_GENERIC_DEV(0x0582, 0x013e), /* Roland R-26 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0145), /* Roland SPD-SX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x014b), /* BOSS eBand JS-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x014d), /* BOSS GT-100 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0150), /* Roland TD-15 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0151), /* Roland TD-11 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0154), /* Roland JUPITER-50 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0158), /* Roland TD-30 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0159), /* Roland DUO-CAPTURE EX */
+ IMPLICIT_FB_GENERIC_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015d), /* Roland R-88 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171), /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x017a), /* Roland VT-3 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x017c), /* Roland TR-8 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01b5), /* Roland Boutique Series
Synthesizer */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01df), /* Roland Rubix22 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e0), /* Roland Rubix24 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e1), /* Roland Rubix44 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01fd), /* Roland Boutique SH-01A */
+ IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01ff), /* Roland Boutique D-05 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203), /* BOSS AD-10 */

  {} /* terminator */
 };

 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[]
= {
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland MC-808 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c5, 0x0d, 0x01), /* Roland SP-555 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00d1, 0x0d, 0x01), /* Roland Music
Atelier */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar
Effects Processor */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00eb, 0x0d, 0x01), /* Roland VS-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Series
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fc, 0x0d, 0x01), /* Roland VS-700C */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fd, 0x0d, 0x01), /* Roland VS-700 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fe, 0x0d, 0x01), /* Roland VS-700 M1 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ff, 0x0d, 0x01), /* Roland VS-700 M2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0100, 0x0d, 0x01), /* Roland VS-700 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0101, 0x0d, 0x01), /* Roland VS-700 M2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0102, 0x0d, 0x01), /* Roland VB-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0113, 0x0d, 0x01), /* BOSS ME-25 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x0d, 0x01), /* Roland SD-50 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0117, 0x0d, 0x01), /* Roland VS-20 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0119, 0x0d, 0x01), /* Roland OCTAPAD
SPD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x011c, 0x0d, 0x01), /* Roland Lucina AX-09
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x011e, 0x0d, 0x01), /* BOSS BR-800 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0124, 0x0d, 0x01), /* Roland M-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE
*/
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE
EX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
Series Synthesizer */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01df, 0x0d, 0x01), /* Roland Rubix22 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e0, 0x0d, 0x01), /* Roland Rubix24 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e1, 0x0d, 0x01), /* Roland Rubix44 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique
SH-01A */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique
D-05 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */

  {} /* terminator */
@@ -278,6 +396,11 @@ static int audioformat_implicit_fb_quirk
  }
  }

+ ///* Don't apply playback quirks for the devices with capture quirk */
+ //p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
+ //if (p && p->type == IMPLICIT_FB_FIXED)
+ // return 0; /* no quirk */
+
  /* Generic UAC2 implicit feedback */
  if (attr == USB_ENDPOINT_SYNC_ASYNC &&
     alts->desc.bInterfaceClass == USB_CLASS_AUDIO &&
