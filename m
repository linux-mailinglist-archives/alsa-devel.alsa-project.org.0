Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFF4432A1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 17:20:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192A3169F;
	Tue,  2 Nov 2021 17:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192A3169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635870030;
	bh=0WgCq3bI1ceZjJvt1RWast7PoJyEeSr+v+fOAvt8bbY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cbRx5MTHPohh5jjuK7sGOvCrTOMWocxxzAxiBNzdxlq3C6fjPC42RR8oJAsmdyXrr
	 DRC0+F8mlGBSvy8orRnze7VFU4Er/aw1q9To9X8Vhig7FAGuraflW2CsIO6cCgKXYj
	 j5e2ag5ePOGfva8Pkg1EV3nX9e0KUz6k7QNtWzgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BAEEF8025F;
	Tue,  2 Nov 2021 17:19:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6338FF8025D; Tue,  2 Nov 2021 17:19:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63154F800BF
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 17:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63154F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="06iQqkyC"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="AQagf692"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B68642190C
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635869940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=icR1/laqkkoTf11aa2BK9LIzm6Du2s9N0wsVZ/eMMpQ=;
 b=06iQqkyCBN3h6OTMdarSpAocLtnDZxX1218YnVpJ0LzUqOW9qg3TKVQ1UG5aTSAChQffVu
 WvmezzJZ3Q9nHn9AhDfFJoyksPjPY99A01RHBa9vWOce588Fil8eBOq3kmcVBNmx200QXV
 Iw5MIDmy6ruzcE4BtvCqGV/VtCPWCgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635869940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=icR1/laqkkoTf11aa2BK9LIzm6Du2s9N0wsVZ/eMMpQ=;
 b=AQagf6923AY03kN8Lgnob+GI5EpmHySMajAzaflxdpfGViACDhh/eij8CuBGzHSXlxHwhL
 dsJ7CRYzVSUbloCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A490D2C154;
 Tue,  2 Nov 2021 16:19:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for Audient iD14
Date: Tue,  2 Nov 2021 17:18:59 +0100
Message-Id: <20211102161859.19301-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Audient iD14 (2708:0002) may get a control message error that
interferes the operation e.g. with alsactl.  Add the quirk to ignore
such errors like other devices.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1191247
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1d418c3fc598..64e1c20311ed 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1888,6 +1888,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
-- 
2.31.1

