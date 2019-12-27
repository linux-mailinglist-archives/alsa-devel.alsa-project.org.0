Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE612BBAB
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:45:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964E01762;
	Fri, 27 Dec 2019 23:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964E01762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486724;
	bh=ZThVCuxCNGBEhllnhkRDR+iAxFjIGBHpn0O9lpUZlgU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gr2Yo7r4YxuO7D80VyuRAQ+DyhSlZGdRnPcqLB+BpU/IzVhzGl23hDKU2fuHnUs/y
	 HKoWhJWnOOJ4McuCpc0GE9GvQenuQ0f/nu0xKJ+7DcMwFkA4wLXmLJH95Dk9leaJsb
	 OZURjQxm+6gkmfPe6nJxjN+ouoDMKn4xRur6hbVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E59ADF80271;
	Fri, 27 Dec 2019 23:42:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCEAF80132; Fri, 27 Dec 2019 11:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31EADF800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 11:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EADF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="yU3sjTZ3"
Received: by mail-pl1-x641.google.com with SMTP id g6so11561143plt.2
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 02:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSXwFBLAEFX5vgAYLDnvOhz1WELYWMvrd2rMYXD92go=;
 b=yU3sjTZ3UM5MPM6+hSjKb7aFvzWuMSFQHmB3i/PqwSdPIEExVYaGx4sXWtIAI0bSy0
 5phFZbMFG4siPfj8FJUkI4j7skD+pVsNblli9W/ka72nnbukEBT5qNARXG2m63AhOjn7
 lJp3r5pCuhzpiWrpWdiSbOzOa1Cj4vepEZ1FfqY7bKEh0jrdvCrHTn2ukmTsy3YBvF4k
 AUC/NIDVQPOmXTGUDqp+EjiNNV/xII6H88nxGUnlv4A2coEjoZWQBHbTX3PyoBuVfwwG
 MCur0h4t7aa4KYbUNPRDoM3LzX77BiyngergyM/KG3LeFgbnt41wwY/qBOT0FoQFzkae
 xmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSXwFBLAEFX5vgAYLDnvOhz1WELYWMvrd2rMYXD92go=;
 b=rgaf8E02l2cXXCCcOz4N+5/70Uvgg5gSWLVQg2naTZ3Zrns8yHdHYcTPLV1p0c+hGk
 QA92oWpDjleWgIGjg1EBYNbZB8S97HImvDnoJpiwktappKV2vOM7DXtOEExjh6UAZABH
 JhRPsRfe+j8x+bEumGPwexJzx7BdZV9H3TfMw5lPhQeM0KolXM+T1vAk70rl0wwtIOoH
 os6nLxY3cVcZibCl199KOwhIOpr68YTvMM+WGmqioY5zyBUc3Id2RWUaW8w9Iwk6oAjC
 4OmUTC3D0aGLlJDjSyR1Cpw+uVAkxarHkQCveCPlqqABtrxaAfqMwJcp5YVFo8/Lx+G/
 MgjA==
X-Gm-Message-State: APjAAAVqRbQA6mbQj59gh5YayxgT7dl+A3S/wxzWZtohrCcROfVOXDYl
 zdvAO8qpRL9uZOPqv+/85AaTRA==
X-Google-Smtp-Source: APXvYqxF0l9MAPbmvnAGtE3gYkb2wmPuO8TCsM6g4jddDynbiNMOtfe8BnU4yFoEdek7szDaXVFaYQ==
X-Received: by 2002:a17:902:b487:: with SMTP id
 y7mr27228535plr.29.1577441202862; 
 Fri, 27 Dec 2019 02:06:42 -0800 (PST)
Received: from localhost.localdomain (59-127-47-126.HINET-IP.hinet.net.
 [59.127.47.126])
 by smtp.gmail.com with ESMTPSA id g24sm39236522pfk.92.2019.12.27.02.06.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Dec 2019 02:06:42 -0800 (PST)
From: Chris Chiu <chiu@endlessm.com>
To: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
 hui.wang@canonical.com, tomas.espeleta@gmail.com
Date: Fri, 27 Dec 2019 18:08:25 +0800
Message-Id: <20191227100825.75790-1-chiu@endlessm.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 23:42:48 +0100
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ALSA: hda/realtek - Enable the bass speaker
	of ASUS UX431FLC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ASUS reported that there's an bass speaker in addition to internal
speaker and it uses DAC 0x02. It was not enabled in the commit
436e25505f34 ("ALSA: hda/realtek - Enable internal speaker of ASUS
UX431FLC") which only enables the amplifier for the front speaker.
This commit enables the bass speaker on top of the aforementioned
work to improve the acoustic experience.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---

Notes:
  v2: 
   - Use existing alc285_fixup_speaker2_to_dac1 instead of new fixup function
   - Correct the commit hash number in the commit message 
   - Remove the redundant fixup ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC

 sound/pci/hda/patch_realtek.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5bc1a6d24333..9c5c65396b3c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5905,9 +5905,9 @@ enum {
 	ALC256_FIXUP_ASUS_HEADSET_MIC,
 	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC299_FIXUP_PREDATOR_SPK,
-	ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
-	ALC294_FIXUP_ASUS_INTSPK_GPIO,
+	ALC294_FIXUP_ASUS_DUAL_SPEAKERS,
+	ALC294_FIXUP_SPEAKER2_TO_DAC1,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -6982,16 +6982,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x14, 0x411111f0 }, /* disable confusing internal speaker */
-			{ 0x19, 0x04a11150 }, /* use as headset mic, without its own jack detect */
-			{ }
-		},
-		.chained = true,
-		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
-	},
 	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7002,12 +6992,18 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
+	[ALC294_FIXUP_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
+	[ALC294_FIXUP_ASUS_DUAL_SPEAKERS] = {
 		.type = HDA_FIXUP_FUNC,
 		/* The GPIO must be pulled to initialize the AMP */
 		.v.func = alc_fixup_gpio4,
 		.chained = true,
-		.chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
+		.chain_id = ALC294_FIXUP_SPEAKER2_TO_DAC1
 	},
 };
 
@@ -7168,7 +7164,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_GPIO),
+	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
