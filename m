Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AE34BBD7
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Mar 2021 11:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EACB165D;
	Sun, 28 Mar 2021 11:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EACB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616925449;
	bh=xvBjJIYV2GGx8RYXaRiCeDEZ5OhFMmA08k4pgmojd10=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcApFGU9ZwyvL7B+f/9NDq1dv5yH/mbEYFe6Fy+JfgkVliXqxkfDxX9OarZFPrEo4
	 3J4RM1BCveggwLq4oX5iEwwW6oT3WkySKOFn4ljqJj5AtGrMz89fuWF3NjUC5AiueQ
	 hS+qIQxuE6G8LXxXqfjv1Pq1AiRSMRxGhQCAEgjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E10F8026B;
	Sun, 28 Mar 2021 11:56:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E514F80240; Sun, 28 Mar 2021 11:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D11F800B9
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 11:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D11F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LDYl8ghd"
Received: by mail-ej1-x631.google.com with SMTP id u21so14860895ejo.13
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=A7Fgg5Ps2FPit4NtVe331ezAn+yo9zyLQrvXQNCFwx4=;
 b=LDYl8ghd8IR6gHITnCLDF+qqzVquIENljCTgV43y48OEPkyRVdD/mawz3RHLk2aU/A
 hYkHd5b9NrqmLiMQyxseRpbOmIsy8dvTVm+kA3tpF1nlS5F+r3XqUcFX/zItwqcyKAWt
 +LXucMek8KYg/LnwoDItBzIy6wdJxT6U/zwfqto72SQFSFVuTI7V0NpEk5b3M3oKTwfR
 1GJsoxD0OxIYGglKNREk87h0T7L+0/3TCvzKtc49lfQ6cCn0h6DRX8IHGlgzUCxBp0xM
 oSQTIVHkohQ/dtseOTve7WWmVFD4d5p2PifrKgJrQyGW43AiuYL6fPnDdLjYHOuk0MbA
 eoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=A7Fgg5Ps2FPit4NtVe331ezAn+yo9zyLQrvXQNCFwx4=;
 b=SyU9O46Y0dBvJm3WX6DFHk50meJMxOLtAcvRzgyTLv9zLBT5Ii9igJk6zYV7x/lNY8
 DJCLM763k//YqffbXDLvV8R3y/TDotvAdgyVmjQEFpfukxaNcw1wbKsM52TooDEYVNI0
 1i4gmljAE5pRSYfZKCLFaZjb9DAkhVOffU71/BE7/nGm9CyoG8TY/AFgr0/p7gX9ML9x
 EV5AIOz12Jr6dYm53BlkVwlAt44jDbb/zS2g5/uDFn5/hs6mJnkQb8ekrI7f+KXHDpIo
 fs/XF92+4crcYnXo6Qe2W8m3XycclUZlOobSriFbNqUy59GFpjmVdLkaNKWblral26w2
 230g==
X-Gm-Message-State: AOAM531NuqdWkSbH/O+hkcQDaO3db+sguMTCw8CSiWslU+cQEALECv9W
 vEvbC5nPtSPmKJ8owrRNHbpgzao8Ghtf735YpISliyGqnvQ=
X-Google-Smtp-Source: ABdhPJx/LnwlMs9CK+QIJQWGk0qmcHnjSBlvoCJt/uNckJjj9TqtokPQMA2SzWE1MaIwFpUcFpKO6bBrxZSmBANLCV8=
X-Received: by 2002:a17:907:2093:: with SMTP id
 pv19mr23992334ejb.134.1616925355819; 
 Sun, 28 Mar 2021 02:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oYg_3A70UMudHuysi3b9WYcZF++DK3uAruJSjygvgcUg@mail.gmail.com>
 <CAOsVg8pjPuLzdKUTVn7-33FSGPueTY7FKHpHqW7Of8m60PGQnA@mail.gmail.com>
 <CAOsVg8oAz1Pn2sEAOgv=VO+CjvQtMEWQDAGFDBRjjLDe47MyYg@mail.gmail.com>
In-Reply-To: <CAOsVg8oAz1Pn2sEAOgv=VO+CjvQtMEWQDAGFDBRjjLDe47MyYg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Sun, 28 Mar 2021 04:55:44 -0500
Message-ID: <CAOsVg8oWaerB+RJ2v5tMm5_d0OiKUMqsxixmR6C0j7Tg+vR15Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] Adding some Roland devices' USB digital audio
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

Here it is, so late into the night it's the next morning.

Happy Hacking!,

  Lucas

The finalized patch (as far as I can tell) follows:
diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
linux-5.11.9.roland/sound/usb/implicit.c
--- linux-5.11.9.orig/sound/usb/implicit.c 2021-03-24 05:54:19.000000000
-0500
+++ linux-5.11.9.roland/sound/usb/implicit.c 2021-03-28 04:44:59.861970330
-0500
@@ -71,27 +71,91 @@ static const struct snd_usb_implicit_fb_
   .ep_num = 0x84, .iface = 0 }, /* MOTU MicroBook II */

  /* No quirk for playback but with capture quirk (see below) */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b2), /* Roland VG-99 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b3), /* Roland VG-99 */
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
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
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
