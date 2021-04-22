Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D123D36800B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 14:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABA4168A;
	Thu, 22 Apr 2021 14:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABA4168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619093179;
	bh=gruiC3GHPUgr0BejPQifZe+shDiPxnEQidZEpmnb5ks=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F35KBgn/yetnOHRIG9B1v9iHozFTxQqfVm712DJ/B82lVVZ42ugmSPK2MdrCCTTMo
	 Hmjvk6cOwbfjG7XX2pN4d3JTy/2GdoTodqguTATEteNytQUnhcPXjeOfLihYI2GySl
	 EUdlbzaeHsEmn0l3R+b5YvohLdgMYu0TpN5k2F+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A97F802C9;
	Thu, 22 Apr 2021 14:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA046F80134; Thu, 22 Apr 2021 14:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F09D2F80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 14:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09D2F80134
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B145BAECB;
 Thu, 22 Apr 2021 12:04:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] Revert "ALSA: usb-audio: Add support for many Roland
 devices..."
Date: Thu, 22 Apr 2021 14:04:12 +0200
Message-Id: <20210422120413.457-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lucas Endres <jaffa225man@gmail.com>,
 "Keith A . Milner" <maillist@superlative.org>,
 Mike Oliphant <oliphant@nostatic.org>
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

This reverts commit d86f43b17ed4 ("ALSA: usb-audio: Add support for
many Roland devices' feedback quirks").

It turned out that many quirk entries there don't contain the proper
EP values and/or the quirk types, which lead to the broken
operations.

As we're going to cover all Roland/BOSS devices in a more generic way
rather the explicit lists, let's revert the previous additions at
first.

Fixes: d86f43b17ed4 ("ALSA: usb-audio: Add support for many Roland devices' implicit feedback quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 59 --------------------------------------------
 1 file changed, 59 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 77ffcea294dd..94acfaa7f2ef 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -79,72 +79,13 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 
 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland MC-808 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c5, 0x0d, 0x01), /* Roland SP-555 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00d1, 0x0d, 0x01), /* Roland Music Atelier */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar Effects Processor */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00eb, 0x0d, 0x01), /* Roland VS-100 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Series */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fc, 0x0d, 0x01), /* Roland VS-700C */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fd, 0x0d, 0x01), /* Roland VS-700 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fe, 0x0d, 0x01), /* Roland VS-700 M1 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ff, 0x0d, 0x01), /* Roland VS-700 M2 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0100, 0x0d, 0x01), /* Roland VS-700 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0101, 0x0d, 0x01), /* Roland VS-700 M2 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0102, 0x0d, 0x01), /* Roland VB-99 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0113, 0x0d, 0x01), /* BOSS ME-25 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x0d, 0x01), /* Roland SD-50 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0117, 0x0d, 0x01), /* Roland VS-20 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0119, 0x0d, 0x01), /* Roland OCTAPAD SPD-30 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x011c, 0x0d, 0x01), /* Roland Lucina AX-09 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x011e, 0x0d, 0x01), /* BOSS BR-800 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland OCTA-CAPTURE */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland OCTA-CAPTURE */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0124, 0x0d, 0x01), /* Roland M-300 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0137, 0x0d, 0x01), /* Roland DUO-CAPTURE Advanced Mode */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE EX */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
-	IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique JP-08 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique SH-01A */
-	IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique D-05 */
 	IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
 
 	{} /* terminator */
-- 
2.26.2

