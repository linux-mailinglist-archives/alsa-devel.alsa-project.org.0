Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5E349B7E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 22:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF30B1663;
	Thu, 25 Mar 2021 22:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF30B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616707196;
	bh=MgwTaJQ/Ae1Q2qJEiK9USPCXK2MjvICfwAo3wYph+Xo=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cr4DYZBYdAF9rmCmlmFGEFD+i57mEjRKnXxNqFfUbEY/V/6hU6pCG5EcFJQCm+fbi
	 Hxe2Yd92OLIUptvcTQgdsp8AOmnG1kUHBSCnxwf+F/oT/MQeuL6NlK2TWPxiPD0kk8
	 jWg59SJeJ663/jBBk+wmg9GqD3/PzZhdjCUG8eew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACEEF800FF;
	Thu, 25 Mar 2021 22:18:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F127F8025F; Thu, 25 Mar 2021 22:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E9ECF80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 22:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E9ECF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ut98W81+"
Received: by mail-ej1-x62a.google.com with SMTP id l4so5225430ejc.10
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 14:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CrKd6TOtt6buHU6ITw+buJRhjTWlCAO62NKAG+10WtI=;
 b=Ut98W81+IiJkqg+W/zbXJpGTzGP8LrpSyaoU6JKqqIGQJ0DfYcul0bnOHEY+dSrON2
 5MVGUafKNeX7XR7FDKbJYaeCOYok2XnGTO+okOriAr/CKIvy006fQB7HM+N/IKUlfLaJ
 awr6Su2e38em8peBOE2T+dvLfbI0uCP+EwF9rp+W5pa/tyOFcZE/UZlBpJQjtSRItapK
 nV8x8k4bUQ6LL0kyLYOdTjp0UiNx6BqGlAxfn1Y/SRj21EAiqTnV7AjDwA2GHUdScn+F
 v5zMH69ZOWLKhWgvITRvnZwFjnjhuSahe2D7GEoqPTLDqJv9wYbgSZIkAMntJan3LW34
 6wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CrKd6TOtt6buHU6ITw+buJRhjTWlCAO62NKAG+10WtI=;
 b=Jh4ntyNghUcOUaIlIm8ub+ovrTy3/wJCuLNnMk8FG9musCO2FixFt/Rldv6aqJ8JvX
 xn03Qovu4LqeVgOVdYek/iQGRxZgtLlXwMujBj2oBD69COZNgtKpijzy0/JV+y2dXaoU
 m5aFrWqq9bBA8jSMGs4zQzhDeB0Rf4qKQF5ZrD1mwWItaelGWxq4rod0XtWTG25vsw6c
 rF4QQwQlvYtAnQEx0th2GrPIGc62EZHGjvjJZxfJEtnyWf7ZLzvt+zXYPw2wl8vRjmbV
 UYBy/VE+zB0DtC8njRTCjF9kCI2ETXkfXQdX1o9WIa27l94NCdR5WNVOpTmsC7BUhHFe
 VMWA==
X-Gm-Message-State: AOAM532q9pLHP2mjc4LWW3fWt5g5UTCtmS7j9YhR2i9+NgWvM1gazeWK
 9rStj0wJqHaf+nWFMM9mrbmcqH9PxNKEfRoeP9xFZoDN3Zc=
X-Google-Smtp-Source: ABdhPJwYFRsqWWqZg5NZbrQhSP0D9qnRszKLtrCAu2PnIrMDBBt+n/Hmbt9pK9cIPXMzphgLPd4pc/Ljomde1stcAFY=
X-Received: by 2002:a17:906:4146:: with SMTP id
 l6mr12034960ejk.295.1616707095165; 
 Thu, 25 Mar 2021 14:18:15 -0700 (PDT)
MIME-Version: 1.0
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 25 Mar 2021 16:18:03 -0500
Message-ID: <CAOsVg8r+7utMRpxkwpsRoPCqFX3Q9GfRsSskKwuAZ1tLiCSLTQ@mail.gmail.com>
Subject: RE: Patch for some Roland devices' USB digital audio
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

Sorry, I should've realized that embedded plaintext patches are preferred,
as I've been on the linux-media list since forever.  This should improve
the ability to find the pertinent devices too, so here it is again:

A couple days ago, I found this excellent informational post, and that Mike
Oliphant's patch is in mainline now:
http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html

Since I was fairly certain it applies to the Roland devices I own, I added
my USB IDs.  Wonderfully, now USB audio capture seems to be working
perfectly from the three devices I can test: the INTEGRA-7, Boutique D-05,
& VG-99!

I don't know if the D-05 and VG-99 have digital audio playback/output, as I
only tried it with the INTEGRA-7.  It does work, but only when the
INTEGRA-7's "Sampling Rate" is set to "44.1 kHz" and "Ext Part Source
Select" is set to "USB AUDIO".

I searched a bit for other Roland devices people have had USB digital audio
issues with over the years, and took the liberty of adding them to the
patch too.  Likely there are still many more, especially in the Boutique
line, but I couldn't find their USB IDs.

I hope this can be added to the mainline kernel too, as this support should
help many that have struggled.  I, certainly, have been hoping somebody
would figure this out for quite a while, and even bought a USB
through/monitoring device to try to develop it myself (sadly, the software
supporting that has its own bugs, so I probably should've just used
wireshark).  Suffice it to say, I'm quite happy to have this figured out,
and to not have to delve into stuff I know nothing about! :)

Thanks,

  Lucas

The patch follows:
diff -Nur ./linux-5.11.9.orig/sound/usb/implicit.c
./linux-5.11.9.roland/sound/usb/implicit.c
--- ./linux-5.11.9.orig/sound/usb/implicit.c 2021-03-24 05:54:19.000000000
-0500
+++ ./linux-5.11.9.roland/sound/usb/implicit.c 2021-03-25
03:05:33.414870404 -0500
@@ -71,13 +71,27 @@
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
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x0138), /* BOSS RC-300 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x013e), /* Roland R-26 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x017c),   /* Roland TR-8 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01b5), /* Roland JP-08 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
+ IMPLICIT_FB_SKIP_DEV(0x0582, 0x01ff), /* Roland D-05 */
  IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */

  {} /* terminator */
@@ -85,13 +99,27 @@

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
