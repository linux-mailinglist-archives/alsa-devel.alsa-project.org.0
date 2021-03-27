Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FADF34B3F9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 04:12:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71941685;
	Sat, 27 Mar 2021 04:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71941685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616814767;
	bh=HsqFWommCIGT1+Cmeutk7zGgeTgXU2BHoQ2WxlC823A=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZcL/2EYWpowaSNriKsSCedUBXhArL7qWBBxuEArI8CTsXRkl3fqtAp3EdbwOjucRr
	 DI2DcCitIBrpTYPvYQAeLxRc5qhbsLjp/AOvNAmy3ONehOk7Skwy9o8rbH7kVVZnVg
	 LhSns4J0W9dG/lNsJbF+CnU06dj599W7AsvwwwO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57961F80279;
	Sat, 27 Mar 2021 04:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90556F8026D; Sat, 27 Mar 2021 04:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF2EF80268
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 04:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF2EF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xpkojtom"
Received: by mail-ej1-x632.google.com with SMTP id kt15so11218056ejb.12
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RjTLRrwwVun6or6Z15RjQ9P86p9kU5W43++6I31kaGo=;
 b=XpkojtomymHLlBQ22u4p3VhVvdGhjzsHtk/A0XVv+6SNpLaShUuSN2ZAmTGf0r0cWS
 sC0AWTXdJ3wyxU6yH1C9F3no+HI7VwZh84Dl9PATYc6Cx5TdPPrpvWc5qc5tibwPY0Rm
 zR/DlWliKWvqfOT/0mlfKc23EEPVCUppSIS+1Aqu83PrhZuSfRvLvnlaS9qNYJAFCGLN
 UNiUCw5phm61cH/5KBI0t1vaz54ep1HmxilpV4umU8YdZAh/DQJUEtA6/bIWjF0QG65g
 gSySxuJ65Fs/9CL7q7kzTuUr4kNo8jm0CLQbBm7bRIn2Y3pXccj1zbj9BZEVblWYwnzI
 sxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RjTLRrwwVun6or6Z15RjQ9P86p9kU5W43++6I31kaGo=;
 b=c6Qu075VDVd2ofLhO2nQYHJ7tGr0VgTc5bPMRyeTF7u00CZ5SQdZkLprLInUmkh5qD
 AAchuenczhpokL6XnTzvYDLb3viQpnVm0/4Z40ez52IlACRPV/jQk6BTQUzABqPbCK3P
 nI2FaieKvtqKrXWId732MPeYghFSC3DWVC3COZmiHn8l9eMFJwML3OskTNPpjcATWgTC
 pdaN61nHVPP103NpFOFJkRPPuI09gda238x7lrrJ4MXQFVE2gdtfzNrqrRNAYbst521i
 lFR+diNWjbCjUXDgW5dRYijryD9JFq3opfme0cBLAVHDE+PwDo5oDl4oXN/pIrr0qnuJ
 1IyQ==
X-Gm-Message-State: AOAM53211R/DQJf8QHouF4crYVdM11IW/NcUZ1elekcnIijmypiOfqkI
 i1jN5I5AD7aWEOOhSAB4aBBrb109lhZpJCvI2veWNUik9w4=
X-Google-Smtp-Source: ABdhPJz4d30N76G7QtZEWoQ0F+bW8Z+NgqwpvZQDX0gKmk2gxHdTFzPIFzq4sAo8g2fUknktd75tRF9E9803tvRL4Jc=
X-Received: by 2002:a17:906:4f10:: with SMTP id
 t16mr18267876eju.531.1616814698383; 
 Fri, 26 Mar 2021 20:11:38 -0700 (PDT)
MIME-Version: 1.0
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 26 Mar 2021 22:11:27 -0500
Message-ID: <CAOsVg8oYg_3A70UMudHuysi3b9WYcZF++DK3uAruJSjygvgcUg@mail.gmail.com>
Subject: [PATCH 1/1] Adding some Roland devices' USB digital audio
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

A few days ago, I found this excellent informational post, and that Mike
Oliphant's patch is in mainline now:
http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html

Since I was fairly certain it applies to the Roland devices I own, I added
my USB IDs.  Wonderfully, now USB audio capture seems to be working
perfectly from the three devices I can test: the INTEGRA-7, Boutique D-05,
& VG-99!

I've also tested all three for playback capability, since that's implied
when a device is using implicit feedback, which I hadn't realized the first
time around.  Anyway, they all seem to be working as expected for playback
too.  There are two caveats for playback, though:

1. The INTEGRA-7 won't output playback in any mode other than its "96[kHz]"
setting, though capture works with all of its Sample Rate choices.

2. The D-05's analog outputs aren't as clean as the other two devices, with
little quiet occasional clicks sounding something like dust on an LP
record's play.  Possibly that can be chalked up to it having only 1/8"
minijack connections, but I suspect something more driver-related as I've
not noticed it during use as a synthesizer.  Its firmware version is
"1.02(1033)," so not up-to-date which may mean it's just the hardware
itself, but I've decided not to risk any changes with it yet.  If I knew I
could revert it, that would be another story.  Also USB captures from it,
play perfectly cleanly on my usual sound device, the Edirol UA-4FX.

You probably already know this, as someone coded them, but here are the
commands I've had to use for format compatibility with these devices:

D-05:
    arecord -D hw:Boutique -f S32_LE -c 2 -r 96000 ./file.wav
    aplay -D hw:Boutique -f S32_LE -c 2 -r 96000 ./file.wav
INTEGRA-7:
    arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 96000 ./file.wav
        (then change MENU->SYSTEM->SOUND->Sampling Rate to 44.1 [kHz]
(otherwise its 96[kHz])
         and  change MENU->SYSTEM->SOUND->Ext Part Source Select to USB
AUDIO)
    arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
    aplay -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
VG-99:
    arecord -D hw:VG99 -f S24_3LE -c 2 -r 44100 ./file.wav
    aplay -D hw:VG99 -f S24_3LE -c 2 -r 44100 ./file.wav

I searched a bit for other Roland devices people have had USB digital audio
issues with over the years, and took the liberty of adding them to the
patch too.  Likely there are still many more, especially in the Boutique
line, but I couldn't find their USB IDs.

I have another of the devices I added, with the patch, arriving soon (the
R-26) so I'll have to get back to you with how that works too.

I hope this can be added to the mainline kernel too, as this support should
help many that have struggled.  I, certainly, have been hoping somebody
would figure this out for quite a while, and even bought a USB
through/monitoring device to try to develop it myself (sadly, the software
supporting that has its own bugs, so I probably should've just used
wireshark).  Suffice it to say, I'm quite happy to have this figured out,
and to not have to delve into stuff I know nothing about! :)

Thanks to anyone looking into adding this,

  Lucas

The patch follows:
diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
linux-5.11.9.roland/sound/usb/implicit.c
--- linux-5.11.9.orig/sound/usb/implicit.c 2021-03-24 05:54:19.000000000
-0500
+++ linux-5.11.9.roland/sound/usb/implicit.c 2021-03-26 21:43:10.177824402
-0500
@@ -71,27 +71,55 @@ static const struct snd_usb_implicit_fb_
   .ep_num = 0x84, .iface = 0 }, /* MOTU MicroBook II */

  /* No quirk for playback but with capture quirk (see below) */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b2), /* Roland VG-99 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c7), /* Roland V-Synth GT */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0111), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0120), /* Roland OCTA-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012b), /* Roland DUO-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012f), /* Roland QUAD-CAPTURE */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0138), /* BOSS RC-300 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x013e), /* Roland R-26 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171), /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x017c), /* Roland TR-8 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01b5), /* Roland JP-08 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01ff), /* Roland D-05 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203), /* BOSS AD-10 */

  {} /* terminator */
 };

 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[]
= {
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE
*/
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland JP-08 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland D-05 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */

  {} /* terminator */
