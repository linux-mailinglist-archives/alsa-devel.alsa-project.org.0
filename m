Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD410487A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 03:28:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A53A1735;
	Thu, 21 Nov 2019 03:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A53A1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574303321;
	bh=Sion3EoNajj0oSJfLJdvMhGoQXJWAlq0GM6dgQmCr4A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f0QwV+3zYirVE7wKaDTkjwx9c6/xTQwYH2tt+9vXDYcnE3V/6vLVQJeUneVNQWFH5
	 olaMrp7Z3QL256D4x2osatSLFW/p8qhNXsT2T3Dx0CLzvPIrziYCDA4xE1q/1+vrof
	 zHNliU0X4m9XJM8uXRA9mCahufrMT39h1lZQZWRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC88F8014C;
	Thu, 21 Nov 2019 03:26:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A637F800EF; Thu, 21 Nov 2019 03:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1085F800EF
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 03:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1085F800EF
Received: from 61-220-137-34.hinet-ip.hinet.net ([61.220.137.34]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iXcBF-00025C-NB; Thu, 21 Nov 2019 02:26:50 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 21 Nov 2019 10:26:43 +0800
Message-Id: <20191121022644.8078-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda/realtek - Move some alc256
	pintbls to fallback table
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We have a new Dell machine which needs to apply the quirk
ALC255_FIXUP_DELL1_MIC_NO_PRESENCE, try to use the fallback table
to fix it this time. And we could remove all pintbls of alc256
for applying DELL1_MIC_NO_PRESENCE on Dell machines.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 35 +++--------------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80f66ba85f87..4c83ed4b0d5c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7608,38 +7608,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
 		{0x1b, 0x01011020},
 		{0x21, 0x02211010}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60130},
-		{0x14, 0x90170110},
-		{0x1b, 0x01011020},
-		{0x21, 0x0221101f}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60160},
-		{0x14, 0x90170120},
-		{0x21, 0x02211030}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60170},
-		{0x14, 0x90170120},
-		{0x21, 0x02211030}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell Inspiron 5468", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60180},
-		{0x14, 0x90170120},
-		{0x21, 0x02211030}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0xb7a60130},
-		{0x14, 0x90170110},
-		{0x21, 0x02211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60130},
-		{0x14, 0x90170110},
-		{0x14, 0x01011020},
-		{0x21, 0x0221101f}),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		ALC256_STANDARD_PINS),
-	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x14, 0x90170110},
-		{0x1b, 0x01011020},
-		{0x21, 0x0221101f}),
 	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1043, "ASUS", ALC256_FIXUP_ASUS_MIC,
 		{0x14, 0x90170110},
 		{0x1b, 0x90a70130},
@@ -7852,6 +7820,9 @@ static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0289, 0x1028, "Dell", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 		{0x19, 0x40000000},
 		{0x1b, 0x40000000}),
+	SND_HDA_PIN_QUIRK(0x10ec0256, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
+		{0x19, 0x40000000},
+		{0x1a, 0x40000000}),
 	{}
 };
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
