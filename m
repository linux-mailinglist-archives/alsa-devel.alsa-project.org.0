Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EDE362603
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6519016CD;
	Fri, 16 Apr 2021 18:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6519016CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618591928;
	bh=sNMv1sVObxkla8x1yex1cxhqAYnC+D5bvo+4f7aXIj4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K/4x94gEhHtmHW130YyhbM53dR8KXxgJvf0sY8D56uLkaoxOFOVokAE4ynwG/AahW
	 F9ldwEG3SzV2OVADEck3k3vtPoFYkV6xU+pbYBcqnK3oGlUJK2FaVNBdYhkzA/li79
	 Xd00ovSOsycKmHntmCaAS7Qud7miXjRYG5S1fIBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB1B2F80269;
	Fri, 16 Apr 2021 18:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D333DF8025B; Fri, 16 Apr 2021 18:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E81CAF800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E81CAF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pZu5tWo2"
Received: by mail-ed1-x52d.google.com with SMTP id z1so33064357edb.8
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Dvs8BbH/mLn1pfBHjLWOQxy2F00BWzNuS+zix8RzQUo=;
 b=pZu5tWo2SM4s4i26F1YVYG7Ijf2KtSVX44Ku5opW/HA85zuwZhvactEFtgwLGn0L9p
 eqmmBL7YFUf1wBj3oRwKTFYr0vZnj2pA9KQUvI6omvfhVT/3DgI4SesgdQTVo/PG/NDy
 Gdh8DBNReGubv9HlB2fOqAX9Zgn1Q1EdRUyQGeC4sDsWl0PgVocB8M6CBWee6iWRrkaY
 rB9qggf+s1wu2a7gmm9A9wE+nuqguYktMUOyZB8gg9u3k8Xgl1saaX3E1QRYHiQ3Rvo+
 BhLr1RaFN9w28VtF/PwpPoAtHn+afhXhz4aMzhL0zii733sLeheIQ+I/t4nnl6TfhwZo
 kP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Dvs8BbH/mLn1pfBHjLWOQxy2F00BWzNuS+zix8RzQUo=;
 b=laMcJcD44H0HKwuPOKIBD0SeBNnF6PiQT6QifpJRuWdTw+oTtZ3zVyibb5hrOFc7Fq
 +cTaSx44UXNEoRYUdmfiHmLN8p4BYYxtSZY8HFWUBBUc6IhXCh1AFfOXrBNiKO852d9B
 kjLs+TzsXIHgJsW0DWi5u/yMWPJGFgTRpcYxEvC0NIiQ0SzKSfI84dfk0Q9GMfYQYXx6
 ln3v4spvmcwf7THv3BB/J03Xb/z1e3F3LcTp44JzBcY/XXkOpUzpa4Ul3HiRUYezXeGY
 vwpgWc6b2PjWKIWyzXhAGLsJYmO2AgeLzWRHlwVyIrDgHzINV5JJhmBt/1GyBqsiKEGe
 RjAQ==
X-Gm-Message-State: AOAM532Z7eBWSPB9Hiboluv7ZyFw0ENOYfxBsc1jtsYZDkMXW1ZDfXJK
 /+EvT6SVnGSVZuwNqKwUIOfsbb9EyhI4E1CxwDxwPfndMcY=
X-Google-Smtp-Source: ABdhPJw/g/gXNweQCFZ4eOUR80+Ip+YXAK2xkQ5bon4EQA4QQfyY7I+E9k3ZdjHOsKfiDYlQ7boWKZ4fUZn4cQ0ufNg=
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr10928614eds.31.1618591831753; 
 Fri, 16 Apr 2021 09:50:31 -0700 (PDT)
MIME-Version: 1.0
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 16 Apr 2021 11:50:20 -0500
Message-ID: <CAOsVg8rA61B=005_VyUwpw3piVwA7Bo5fs1GYEB054efyzGjLw@mail.gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add support for many Roland devices'
 implicit feedback quirks
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>
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

It makes USB audio capture and playback possible and pristine on my Roland
INTEGRA-7, Boutique D-05, and R-26, along with many more I've encountered
people having had issues with over the last decade or so.

Signed-off-by: Lucas Endres <jaffa225man@gmail.com>

---
diff -Nurp linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c
linux-5.11.9.roland1/sound/usb/implicit.c
--- linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c 2021-04-13
14:23:34.743782890 -0500
+++ linux-5.11.9.roland1/sound/usb/implicit.c 2021-04-15 19:35:20.053444538
-0500
@@ -79,13 +79,72 @@ static const struct snd_usb_implicit_fb_

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
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
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
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
*/
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE
*/
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0137, 0x0d, 0x01), /* Roland DUO-CAPTURE
Advanced Mode*/
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE
EX */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
JP-08 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique
SH-01A */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique D-05
*/
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */

  {} /* terminator */
