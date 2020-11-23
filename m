Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC52C0211
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9535A16B8;
	Mon, 23 Nov 2020 10:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9535A16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122675;
	bh=b+M1+mpnYUdn4TzcRPK6iwU9rtb8Dp/Z08q046TBAT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRwYEg8m7RU128iST8cLhXonNgYuoVwiDZFhiXGr9vdInibT9SnZ770ak+TR55ysS
	 32uD900+NMJIQkg5sNBCaTvVOmP+U6auj5C1t7C6JbrfxLnynwyGaDeqXjoGhSsaEv
	 lt//DfhGy+Xvs4QEUVSsNYlSjT2gf+3NdNrYD+dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59954F80624;
	Mon, 23 Nov 2020 09:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A7AFF80571; Mon, 23 Nov 2020 09:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E07D1F804FD
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E07D1F804FD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18BC7AE2E;
 Mon, 23 Nov 2020 08:53:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 41/41] ALSA: usb-audio: Fix MOTU M-Series quirks
Date: Mon, 23 Nov 2020 09:53:47 +0100
Message-Id: <20201123085347.19667-42-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

From: Dylan Robinson <dylan_robinson@motu.com>

Now that the usb audio driver correctly finds implicit feedback endpoints,
the implicit feedback quirk for the MOTU M-Series is no longer required.

This also removes some unnecessary vendor specific messages from the MOTU
M-Series boot quirk. The removed vendor specific messages turned on vendor
specific interrupts to the host every 32 samples. The only thing the boot
quirk needs to do is wait for 2 seconds.

Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c |  1 -
 sound/usb/quirks.c   | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 1f7fb036c5b6..386198b36b87 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -52,7 +52,6 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer UFX1604 */
 	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer UFX1204 */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio Axe-Fx III */
-	IMPLICIT_FB_FIXED_DEV(0x07fd, 0x0008, 0x81, 2), /* MOTU M Series */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State Logic SSL2 */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State Logic SSL2+ */
 	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2), /* Steinberg UR22C */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 02f3f6ed9390..63cdf3c8c2bc 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1110,24 +1110,8 @@ static int snd_usb_motu_microbookii_boot_quirk(struct usb_device *dev)
 
 static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
 {
-	int ret;
-
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      0x0, 0, NULL, 0, 1000);
-
-	if (ret < 0)
-		return ret;
-
 	msleep(2000);
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      0x20, 0, NULL, 0, 1000);
-
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.16.4

