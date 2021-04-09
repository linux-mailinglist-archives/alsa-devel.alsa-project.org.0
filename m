Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61425359377
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 05:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D140E1616;
	Fri,  9 Apr 2021 05:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D140E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617940725;
	bh=SjbFWShkx1aGJpO9JgCqevP5ncySIXOgExQSkSNPRbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihW6u8iPBgXMDqFBH4GYbWjlPeAtwBuUWp+L+3u4Uas5oNnPIoUKYgAYaWPMTn6U0
	 jw7CSSEtaecqIy8Qqzc0hIWE1DXJQckgstP4Yy1jAicRlK/F4rtbHLYk6r6gOQjPH3
	 HSzkM9cL4KqzD/XUvVzA6ZS830a/PVw4mw70iOPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29809F800EE;
	Fri,  9 Apr 2021 05:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68DDF8016A; Fri,  9 Apr 2021 05:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A853F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 05:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A853F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LIXCWobp"
Received: by mail-ej1-x635.google.com with SMTP id v6so5192523ejo.6
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 20:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okVNrNKGhdiZgtnngUa4jVfUyxF6B+s2t0+nC4laue4=;
 b=LIXCWobpgLg0qunkF1erIcPbTuCdWHSpKZE42fGAx0eoOipZFi+9gZaP0qNscHIasM
 ugIW72dEc6mPmdNwezbJuKQpMLlcU9j4UNHqVKEa8lDpPiLValvDby8cQdjX+x7oW5bO
 vHd1goPZsRRJ99h3WinHdj3EGDyfDWAuqYV9go3z9S3G62ypkVKgAcLZFuPYn9KO6NxC
 axVpVfbIffIEQ1CctXEKiRYiLvJ04jO14RBgBDZfxqA2pwMlCeiTu/zhL/qxDgQ+HTI5
 A8qf32eHRQW5ow8M74LD4jfAZId/qHJzjxfJkFzgaFUScXFpHCRxrzZea2Gd4OeJD+JN
 IWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okVNrNKGhdiZgtnngUa4jVfUyxF6B+s2t0+nC4laue4=;
 b=XW2Ztz6iBXbrU/0lFjgjJ6V2DoVVr0gXPgJaF1WqMG5eTme8KNCmyEnm0E39qtv3Ir
 J4N2pPqd+UBtCQoMAfhrGfHpcNHJpOBjuVUAu6AovDJIkwS5Bpkqg1UxU0Hnycf2j+aS
 1LPXJ+JkPR5pYv0FEb0MvIN1uFtLNSjHh826L4iUTCFmWhbkHDj3qAZdSwpPSgoIFSaY
 ecqkCnQkBSHzWxqnq5KTP61rl5AP1ssUwUmud7+G1RRUAtraDtof2KSHUhVfavpWlfDL
 3mFESKy5otCMUS6HSJjHn/sZH6IuukahfGgKWdoooxWIt00Yd0ozG5weSi0idymOgRc3
 BcHQ==
X-Gm-Message-State: AOAM53359Zmy8I22WFUMgxgGpas8qvRNP8dx2899hGTILx8LQ9QRiJiS
 BoM8S/o7kqxBQciYjjVxwj/lhtKfQtxwqOVe0nqNTbSkn70xbQ==
X-Google-Smtp-Source: ABdhPJyU/bvBL7dbPGZ7/ICVlO9MmaZV3eY9rCideBPBfhyr/XBVToZzYEb6NLd2QXInOXlDoMoNryrGXc8X8dDfcvk=
X-Received: by 2002:a17:907:20f0:: with SMTP id
 rh16mr2571216ejb.320.1617940629911; 
 Thu, 08 Apr 2021 20:57:09 -0700 (PDT)
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
In-Reply-To: <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 8 Apr 2021 22:56:58 -0500
Message-ID: <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Okay, thanks!  I'll try it next.  For now, I did use the disabled block
"(false)" test, without worry due to you giving me your quite speedy build
method, although I do still reboot.

Anyway, I've proven my assertion that capture fails for the D-05 when I
have its capture_implicit_fb_quirks[] line commented out.  This is a patch
for the current state of what works perfectly for playback and capture on
my D-05.  Sorry it includes some other patches I've applied due to
unrelated UA-101 Takashi suggestions.  Merely removing the suggested
comment from its capture quirk table line (as shown here) gets the Roland
Boutique D-05 working for capture.  I don't understand why, but this works,
& not without it:

diff -Nurp linux-5.11.9.orig/sound/usb/endpoint.c
linux-5.11.9.roland-mike-oliphant/sound/usb/endpoint.c
--- linux-5.11.9.orig/sound/usb/endpoint.c 2021-03-24 05:54:19.000000000
-0500
+++ linux-5.11.9.roland-mike-oliphant/sound/usb/endpoint.c 2021-04-08
21:10:49.388889365 -0500
@@ -1375,7 +1375,7 @@ int snd_usb_endpoint_start(struct snd_us
  if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
  goto __error;

- if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
+ if (false) { //(snd_usb_endpoint_implicit_feedback_sink(ep)) {
  for (i = 0; i < ep->nurbs; i++) {
  struct snd_urb_ctx *ctx = ep->urb + i;
  list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
linux-5.11.9.roland-mike-oliphant/sound/usb/implicit.c
--- linux-5.11.9.orig/sound/usb/implicit.c 2021-04-01 20:55:06.079399075
-0500
+++ linux-5.11.9.roland-mike-oliphant/sound/usb/implicit.c 2021-04-08
22:29:22.139680224 -0500
@@ -71,27 +71,149 @@ static const struct snd_usb_implicit_fb_
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
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b2), /* Roland VG-99 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b3), /* Roland VG-99 */
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
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x013e), /* Roland R-26 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0145), /* Roland SPD-SX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x014b), /* BOSS eBand JS-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x014d), /* BOSS GT-100 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0150), /* Roland TD-15 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0151), /* Roland TD-11 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0154), /* Roland JUPITER-50 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0158), /* Roland TD-30 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0159), /* Roland DUO-CAPTURE EX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
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
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
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
@@ -278,6 +400,11 @@ static int audioformat_implicit_fb_quirk
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
