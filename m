Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B945132A8AF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 19:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42AD118E2;
	Tue,  2 Mar 2021 19:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42AD118E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614708161;
	bh=hDBkDYIVqyWieyoynN/iDwAEuXfllZwCeUE1V9e2hNA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DYMl6xo+8qJDZ3SifyNhY0bjujuLx0qZzKwRZyw1BbbFOa3A/C7mAh51notCUZGKd
	 H6yvtOW6nw/P2DzlAzxQ8SPfBeC6nLOMLH6ac4L+YpvIC9UDuIXE/6fiOToEn67mTI
	 7ApO913p3vocUF/G+NmAuPt/q5Ae0FKISpOYP5Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72167F80271;
	Tue,  2 Mar 2021 19:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3958F80269; Tue,  2 Mar 2021 19:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AC50F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 19:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC50F8012D
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 5CD15C800CF;
 Tue,  2 Mar 2021 19:00:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id m2s5eHXleoix; Tue,  2 Mar 2021 19:00:50 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f234700CC4188A7f2f8d6b8.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 0E306C800CE;
 Tue,  2 Mar 2021 19:00:50 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: wse@tuxedocomputers.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 alsa-devel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NH55RZQ
Date: Tue,  2 Mar 2021 19:00:43 +0100
Message-Id: <20210302180043.23021-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eckhart Mohr <e.mohr@tuxedocomputers.com>, stable@vger.kernel.org
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

From: Eckhart Mohr <e.mohr@tuxedocomputers.com>

ALSA: hda/realtek: Add quirk for Clevo NH55RZQ

This applies a SND_PCI_QUIRK(...) to the Clevo NH55RZQ barebone. This
fixes the issue of the device not recognizing a pluged in microphone.

The device has both, a microphone only jack, and a speaker + microphone
combo jack. The combo jack already works. The microphone-only jack does
not recognize when a device is pluged in without this patch.

Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
Third time's the charm, now using git send-email, I'm really sorry for the spam.

From 2835edd753fd19c72a644dccb7e941cfc0ecdf8e Mon Sep 17 00:00:00 2001
From: Werner Sembach <wse@tuxedocomputers.com>
Date: Fri, 26 Feb 2021 13:50:15 +0100
Subject: [PATCH] Fix device detection on microphone jack of Clevo NH55RZQ

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 290645516313..8014e80d72c3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8089,6 +8089,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x8551, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x8561, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1558, 0x8562, "Clevo NH[5|7][0-9]RZ[Q]", ALC269_FIXUP_DMIC),
 	SND_PCI_QUIRK(0x1558, 0x8668, "Clevo NP50B[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8680, "Clevo NJ50LU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.25.1

