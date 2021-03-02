Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D297A32A5F9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5A41769;
	Tue,  2 Mar 2021 17:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5A41769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614702434;
	bh=lSPuG5IdbYI253u94SEnxqf+gxetRSPtVyodlwX+ciM=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s5K8LvtFsLSGbKUWEA/PThYBQrCFbVJKNjsoyDSMo1wVXoAMUPfs4u/z8ssm9lVoV
	 BavYLimqZk37R242j+QGil2WUZkxrJrRaqdTnwceUc22i1S1ZeLuvrXhEJmlNIQTQh
	 GJ3U4pTeCDsEmjmScXvvIn/0JEzR+m5dz9ieFqCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9C8F80271;
	Tue,  2 Mar 2021 17:25:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D20F80269; Tue,  2 Mar 2021 17:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6CCCF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6CCCF80227
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 46C1CC800AC;
 Tue,  2 Mar 2021 17:25:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id S5QVdRIUw3Fx; Tue,  2 Mar 2021 17:25:28 +0100 (CET)
Received: from [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8]
 (p200300e37f234700cc4188a7f2f8D6B8.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id F00A6C800AB;
 Tue,  2 Mar 2021 17:25:27 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NH55RZQ
To: wse@tuxedocomputers.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Autocrypt: addr=wse@tuxedocomputers.com; keydata=
 mDMEX6ALvhYJKwYBBAHaRw8BAQdAG/kE3mlbV1YLpCU8iA7Pyq2eDq9LxzGQxcOZODh2Vnq0
 KFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbT6IlgQTFggAPhYhBNzq
 jJqAsvWKK1h7bi7eQpXUvijKBQJfoAu+AhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4B
 AheAAAoJEC7eQpXUvijKzkEA/jblmQRWU/e18oo8J9GPHWOCRUA1WJLUt9lSye5cgl2vAP0Y
 q+EpkDRS+QqtIcIr3fVELwA4b/V1lVE2LW+plcmdCbg4BF+gC74SCisGAQQBl1UBBQEBB0Bc
 k3J9DVAB4ysrdDcKE7L9iAUjlWD+rsLh/5soPORqFQMBCAeIfgQYFggAJhYhBNzqjJqAsvWK
 K1h7bi7eQpXUvijKBQJfoAu+AhsMBQkJZgGAAAoJEC7eQpXUvijKBBYA/2DT2g26dpTU2Rbc
 lqviltu+woGZCd0GBfRgXuzUK0OfAQCwr8qPCl8uIsBgOsDmWIJYByG2ddwmXiAgBS1985bM Ag==
Message-ID: <0eee6545-5169-ef08-6cfa-5def8cd48c86@tuxedocomputers.com>
Date: Tue, 2 Mar 2021 17:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
---
This is a resend of the patch because I missed that the editor I used to write the commit message replaced tabs with spaces.

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

