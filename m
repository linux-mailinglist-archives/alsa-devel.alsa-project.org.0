Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19B2E6EF5
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 09:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F205F16F2;
	Tue, 29 Dec 2020 09:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F205F16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609230974;
	bh=XsumYRjLvaLO0ZjGWZXUe60T4gZvPCDUNBSQ0nboZ48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c0YqIrND4ehdiPK4urNxUIBf8NqP2NMah+/f7QKa/fHohigmlZoICXc+a/zcVqmFr
	 9PYaXadkdM/9CW/joLsqfJQ3PLheN1DEDb6D1XsRT24h/GmboTJ/Ou9/1e4Cg+1qBB
	 MQ8DnaYcAtTP6blOKTlPTcBERd84brYmL5BWRFy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0A5F8022D;
	Tue, 29 Dec 2020 09:34:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66424F8022B; Tue, 29 Dec 2020 09:34:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62C3AF80141
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 09:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C3AF80141
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF2CAF7E;
 Tue, 29 Dec 2020 08:34:29 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for BOSS AD-10
Date: Tue, 29 Dec 2020 09:34:28 +0100
Message-Id: <20201229083428.20467-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Passing <martin@passing.name>
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

BOSS AD-10 requires the very same quirk like other BOSS devices to
enable the special implicit feedback mode.

Reported-and-tested-by: Martin Passing <martin@passing.name>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index eb3a4c433c3e..70b9777b2e63 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -78,6 +78,7 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6),	/* BOSS GT-1 */
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),	/* BOSS Katana */
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),	/* BOSS GT-001 */
+	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
 
 	{} /* terminator */
 };
@@ -89,6 +90,7 @@ static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
 
 	{} /* terminator */
 };
-- 
2.26.2

