Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8B34F68F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 04:21:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FD384A;
	Wed, 31 Mar 2021 04:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FD384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617157319;
	bh=SN5KBIAcNWRqHZP0cRprXb5ftsIeQT0vobhXsHr9Lg0=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZTkUEKhAA1ZNfhZqsZQffZoGIKB1/Ytaza4w0PrT/rhh/j18nCy/e9HnsrYd6vOpw
	 dad5nVlR7Y8va4oJHorkJAfxt20TTqSSTzWIY60TQXyvPv2sX0Jjdnk+8EI5cPCbKb
	 GGyi9uYlFP8safKnssde+I4OIf69l1mGMEbh872U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92492F8015A;
	Wed, 31 Mar 2021 04:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A0A9F80166; Wed, 31 Mar 2021 04:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 814B0F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 04:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 814B0F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MFTkT/ZT"
Received: by mail-ed1-x531.google.com with SMTP id bx7so20410390edb.12
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JCNmUbZ3GtsybHc2Q/lCTxzxAsImVkoJla1T4uSiQhI=;
 b=MFTkT/ZTgD80Qs6ivfDdaWN3aD1nbJgFGCEBggOVJq5d0H1XnsDJD2495Hm04RnDzG
 WxJcJWZogaMzGXczIIuGgT89B1vT3VVLCYDfBJq+SBwUvj4ShlOWMm9+S80GrpVOz4Zt
 SipqGfqEosQ1mx5FAFvkAGgBfmXA7BRuyIBQL6/gtqF1IxW9UsQM0Q45bKFiqLChDQh4
 f89YxYHl5Jc8GcIvc7avuHu6CzB8jpYLzvKmcvXzv1r3x6i663Z4A1UuiBDHCviFrZ4D
 qN/IP4cpfNoza/JCLrzv6ZOgPR2JtE0fWxjH3QsujVxZ28NYKPiN+i5sy40oyHc9SRsl
 giOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JCNmUbZ3GtsybHc2Q/lCTxzxAsImVkoJla1T4uSiQhI=;
 b=dch7qQ/sQTk3YFSjjZkT4rXQ+IQopvAM5WffYWy/v1bt0+mYxmMEQ3zQEWR2oK57Tq
 N/v0IaeRycAxMSZWIyczlu1iXN2mlHhyJFROexi13VqPZBrznIgNuq17l2irb+RUYDED
 xaVzSf+9azL8TcUDKrpjJdkIkwB1A9EE/p+us38kV/bikLmzrsfjJemmI3H5CcIz0Wjx
 xOEg8hPGD+QAPsJ3LCjtphYqAeaX+CXodv9STFZZ0FTjOrC1PNdvN0jSwzKauWF1lURG
 t+h8T3/0JYMRUTHmUumJdzHa4vAlu4+thuoT6Q28q8w0hWpT+vOuD6nEP3b6dWKBcqkt
 ufKQ==
X-Gm-Message-State: AOAM533/lDHSHI7/FKDAJRxI9EL9sIrAQtmu6u/ePaKeSjGS0BSDz7kE
 DpKeMHOpjG2Hj3YRfk2agd4xh10AOM4ApYZBJrqyzkZ1m6g=
X-Google-Smtp-Source: ABdhPJxeJVBKWBGvlAPmKhRbfyJ8T2nJOBysXlpPE4PMFDau18E/1Tm47YEDsPoo7LIv+8/T72ZzYbOGUZ8/4s+N/MY=
X-Received: by 2002:a05:6402:17d5:: with SMTP id
 s21mr891730edy.65.1617157220439; 
 Tue, 30 Mar 2021 19:20:20 -0700 (PDT)
MIME-Version: 1.0
From: Lucas <jaffa225man@gmail.com>
Date: Tue, 30 Mar 2021 21:20:08 -0500
Message-ID: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
Subject: [PATCH] Fixing most Roland-related devices' USB audio
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

At the risk of being redundant, I'm resending this with a simpler "[PATCH]"
subject to reach a broader audience, since no comment has been made yet:

TLDR?  Please just glance at the patch at the end and include it in the
kernel. :)

Some days ago, I found this excellent informational post, and that Mike
Oliphant's patch is in mainline now:
http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html

Since I was fairly certain it applies to the Roland devices I own, I added
my USB IDs.  Wonderfully, now USB audio capture seems to be working
perfectly from the three devices I can test: the Boutique D-05, INTEGRA-7,
& R-26! (The previously asserted VG-99 didn't need to be included in the
patch for it to work.)

I've also tested all three for playback capability, since that's implied
when a device is using implicit feedback, which I hadn't realized the first
time around.  Anyway, they all seem to be working as expected for playback
too.  There are two caveats for playback, though:

1. The INTEGRA-7 won't output playback in any mode other than its "44.1
[kHz]" setting, though capture works with all of its Sample Rate
possibilities.  I think this is imposed by the hardware itself, and hence
isn't a glitch.

2. The D-05's analog outputs aren't as clean as the other two devices, with
little quiet occasional clicks sounding something like dust on an LP
record's play.  Possibly that can be due to it having only 1/8" mini-jack
connections, but I suspect something more driver-related as It's not
noticed during use as a synthesizer.  Its firmware version is "1.02(1033),"
so not up-to-date which may mean it's just the hardware itself, but I've
decided not to risk any changes with it yet.  If I knew I could revert it,
that would be another story.  Also its USB captures, play perfectly &
cleanly on my usual sound device, the Edirol UA-4FX.

You may know this, as the detection of these devices shows partial
compatibility with the existing kernel, but here are the commands I've had
to use for their sample formats:

Boutique D-05:
    arecord -D hw:Boutique -f S32_LE -c 2 -r 96000 ./file.wav
    aplay -D hw:Boutique -f S32_LE -c 2 -r 96000 ./file.wav
INTEGRA-7:
    arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 96000 ./file.wav
        (Then change MENU->SYSTEM->SOUND->Sampling Rate to 44.1 [kHz],
otherwise its 96[kHz],
         and  change MENU->SYSTEM->SOUND->Ext Part Source Select to USB
AUDIO)
    arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
    aplay -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
R-26:
        (Through its built-in controls, first configure the MENU->AUDIO I/F
SETUP->SAMPLE RATE to "96.0 kHz.")
    arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
    aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
        (Then via use of similar commands, & the "AUDIO I/F" tab on its
main screen having both "LOOP BACK" & "DIRECT MONITOR" enabled, I was able
to begin a new composite recording, voicing-over what I'd recorded earlier,
by playing it back while interjecting - very fun!)



The behavior on the vanilla kernel (whether or not "pasuspender -- cat" is
running concurrently) follows.
For each of these commands, dmesg is bombarded with lines like "[
4681.162863] usb 2-1.2: Unable to change format on ep #8e: already in use"

Boutique D-05:
    arecord -D hw:Boutique -f S32_LE -r 96000 -c 2 ./file.wav
    Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo
        (After a brief timeout, it says this & ends:)
    arecord: pcm_read:2153: read error: Input/output error

    aplay -D hw:Boutique -f S32_LE -r 96000 -c 2 ./valid-file.wav
    Playing WAVE './valid-file.wav' : Signed 32 bit Little Endian, Rate
96000 Hz, Stereo
        (After a brief timeout, it says this & ends:)
    aplay: pcm_write:2061: write error: Input/output error

INTEGRA-7:
    arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
    Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo
        (After a brief timeout, it says this & ends:)
    arecord: pcm_read:2153: read error: Input/output error
        (Then change MENU->SYSTEM->SOUND->Sampling Rate to 44.1 [kHz],
otherwise its 96[kHz],
         and  change MENU->SYSTEM->SOUND->Ext Part Source Select to USB
AUDIO)
    arecord -D hw:INTEGRA7 -f S32_LE -r 44100 -c 2 ./file.wav
    Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 44100
Hz, Stereo
        (After a brief timeout, it says this & ends:)
    arecord: pcm_read:2153: read error: Input/output error

    aplay -D hw:INTEGRA7 -f S32_LE -r 44100 -c 2 ./valid-file.wav
    Playing WAVE './valid-file.wav' : Signed 32 bit Little Endian, Rate
44100 Hz, Stereo
        (After a brief timeout, it says this & ends:)
    aplay: pcm_write:2061: write error: Input/output error

R-26:
    arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
    Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo
        (After a brief timeout, it says this & ends:)
    arecord: pcm_read:2153: read error: Input/output error

    aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./valid-file.wav
    Playing WAVE './valid-file.wav' : Signed 32 bit Little Endian, Rate
96000 Hz, Stereo
        (After a brief timeout, it says this & ends:)
    aplay: pcm_write:2061: write error: Input/output error



I searched a bit for other Roland-related devices people have had USB
digital audio issues with over the years, and took the liberty of adding
them to the patch too.  Likely there are still more that people haven't
tried or, at least, queried about issues.

I hope this can be added to the mainline kernel, as this support should
help many that have struggled.  I, certainly, have been hoping somebody
would figure this out for quite a while, and even bought a USB
through/monitoring device to try to develop it myself (sadly, the software
supporting that has its own bugs, so I probably should've just used
wireshark).  Suffice it to say, I'm quite happy to have this figured out
without having had to delve into USB debugging stuff I lack experience
with! :)

Thanks for any comments or looking into adding this,

  Lucas Endres



The patch follows (I removed my previous VG-99 additions since it already
works):
diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
linux-5.11.9.roland/sound/usb/implicit.c
--- linux-5.11.9.orig/sound/usb/implicit.c 2021-03-24 05:54:19.000000000
-0500
+++ linux-5.11.9.roland/sound/usb/implicit.c 2021-03-30 17:49:08.143196280
-0500
@@ -71,27 +71,87 @@ static const struct snd_usb_implicit_fb_
   .ep_num = 0x84, .iface = 0 }, /* MOTU MicroBook II */

  /* No quirk for playback but with capture quirk (see below) */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c2), /* Roland SonicCell */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c4), /* Edirol M-16DX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c7), /* Roland V-Synth GT */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00da), /* BOSS GT-10 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00db), /* BOSS GT-10 Guitar Effects
Processor */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00dc), /* BOSS GT-10B */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00de), /* Roland Fantom-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00f8), /* Roland JUNO Series */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0111), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0120), /* Roland OCTA-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0121), /* Roland OCTA-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0123), /* Roland JUNO-Gi */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0127), /* Roland GR-55 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012b), /* Roland DUO-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x012f), /* Roland QUAD-CAPTURE */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
- IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0132), /* Roland TRI-CAPTURE */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0138), /* BOSS RC-300 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x013e), /* Roland R-26 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x014d), /* BOSS GT-100 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0150), /* Roland TD-15 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0151), /* Roland TD-11 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0158), /* Roland TD-30 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0159), /* Roland DUO-CAPTURE EX */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015d), /* Roland R-88 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171), /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x017c), /* Roland TR-8 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01b5), /* Roland Boutique Series
Synthesizer */
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
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar
Effects Processor */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Series
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE
*/
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE
EX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
Series Synthesizer */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland D-05 */
  IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */

  {} /* terminator */
