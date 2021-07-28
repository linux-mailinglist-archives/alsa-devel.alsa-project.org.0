Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E23D8F98
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CBDD1EED;
	Wed, 28 Jul 2021 15:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CBDD1EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480311;
	bh=036X0gZ+QFJgkfac3ZDux1yKVHPtuc6riCWgOXg0xOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCsvydXpuIsgu+UEaiJSw6jLxqUk2aWkP7PsPtr257QttA8qrQVogBtuBV/g0ScjH
	 zTAs6tM67eYJRcJRwBxwEA0yQIlu1QBmCPfzGCLQROFEHqjD/zHsYwpRygblv7W9DZ
	 49zREp+hH6rjXGTP7BiQ1YfhPHZEwrpgRRfvoxag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7B1F80212;
	Wed, 28 Jul 2021 15:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5B6F80553; Wed, 28 Jul 2021 15:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9BC6F804E2
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9BC6F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KP98WmRq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUqh014335; 
 Wed, 28 Jul 2021 08:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Zia0kjdORR/kh1suTZbOoDQmikI0+TDOu1rJDVLknQc=;
 b=KP98WmRqiLhdw+bHOMmC+xePVhFehdCG2iKEQ5PVPMJuWiQ8pl8ITbDoyQ4XMiFfcJuu
 wXEo/dfAu5AUsUc1n+g3tlSGLQl2BC5zfuc3pUtN68VgXL6QDcr82IxHJpk1kFQXiTPG
 sJOL3Liv8XCt6bZJt4USYR0G94w8VimRmmRLpU4L9nXGbJFPcBUTPskRBWJgrypjdDJH
 5kx3Z8xwgn0G+o0N2MQ8T/HI0/Iqko4/tZPgPHopZGmtfbEBGVyoXeNJ0AgaagnIo3Z8
 hlsx2JY5d7Pm14A/msgmHKBXlm/gQ7rsWff5eQuPNAXiEtTfBRD/anV/hz9D+652Ieek 1w== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:30 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 16B132BA;
 Wed, 28 Jul 2021 13:44:30 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 02/27] ALSA: hda/cs8409: Move arrays of configuration to a
 new file
Date: Wed, 28 Jul 2021 14:43:43 +0100
Message-ID: <20210728134408.369396-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TM_Ehtm2KBO1D0pmV4RAmbYLcD2aB_M0
X-Proofpoint-GUID: TM_Ehtm2KBO1D0pmV4RAmbYLcD2aB_M0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280077
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v2:
- No changes

---
 sound/pci/hda/Makefile              |   2 +-
 sound/pci/hda/patch_cs8409-tables.c | 220 ++++++++++++++++++++++++++++
 sound/pci/hda/patch_cs8409.c        | 218 +--------------------------
 sound/pci/hda/patch_cs8409.h        |  19 +++
 4 files changed, 241 insertions(+), 218 deletions(-)
 create mode 100644 sound/pci/hda/patch_cs8409-tables.c

diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 1b73e08dc563..b8fa682ce66a 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -20,7 +20,7 @@ snd-hda-codec-analog-objs :=	patch_analog.o
 snd-hda-codec-idt-objs :=	patch_sigmatel.o
 snd-hda-codec-si3054-objs :=	patch_si3054.o
 snd-hda-codec-cirrus-objs :=	patch_cirrus.o
-snd-hda-codec-cs8409-objs :=	patch_cs8409.o
+snd-hda-codec-cs8409-objs :=	patch_cs8409.o patch_cs8409-tables.o
 snd-hda-codec-ca0110-objs :=	patch_ca0110.o
 snd-hda-codec-ca0132-objs :=	patch_ca0132.o
 snd-hda-codec-conexant-objs :=	patch_conexant.o
diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
new file mode 100644
index 000000000000..4adc7a4c4a25
--- /dev/null
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * patch_cs8409-tables.c  --  HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
+ *
+ * Copyright (C) 2021 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Lucas Tanure <tanureal@opensource.cirrus.com>
+ */
+
+#include "patch_cs8409.h"
+
+/* Dell Inspiron platforms
+ * with cs8409 bridge and cs42l42 codec
+ */
+const struct snd_pci_quirk cs8409_fixup_tbl[] = {
+	SND_PCI_QUIRK(0x1028, 0x0A11, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A12, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A23, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A24, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A25, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A29, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A2A, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A2B, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0AB0, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB2, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB1, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB3, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB4, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB5, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AD9, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADA, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADB, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADC, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AF4, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AF5, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0A77, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A78, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A79, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7A, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7D, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7E, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7F, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A80, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0ADF, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE0, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE1, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE2, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE9, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEA, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEB, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEC, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AED, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEE, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEF, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AF0, "Cyborg", CS8409_CYBORG),
+	{} /* terminator */
+};
+
+/* Dell Inspiron models with cs8409/cs42l42 */
+const struct hda_model_fixup cs8409_models[] = {
+	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
+	{ .id = CS8409_WARLOCK, .name = "warlock" },
+	{ .id = CS8409_CYBORG, .name = "cyborg" },
+	{}
+};
+
+const struct hda_fixup cs8409_fixups[] = {
+	[CS8409_BULLSEYE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_FIXUPS,
+	},
+	[CS8409_WARLOCK] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_FIXUPS,
+	},
+	[CS8409_CYBORG] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_FIXUPS,
+	},
+	[CS8409_FIXUPS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs8409_cs42l42_fixups,
+	},
+};
+
+const struct hda_verb cs8409_cs42l42_init_verbs[] = {
+	{ 0x01, AC_VERB_SET_GPIO_WAKE_MASK, 0x0018 }, /* WAKE from GPIO 3,4 */
+	{ 0x47, AC_VERB_SET_PROC_STATE, 0x0001 },     /* Enable VPW processing  */
+	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x0002 },     /* Configure GPIO 6,7 */
+	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0080 },     /* I2C mode */
+	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x005b },     /* Set I2C bus speed */
+	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0200 },     /* 100kHz I2C_STO = 2 */
+	{} /* terminator */
+};
+
+const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
+	{ 0x24, 0x042120f0 }, /* ASP-1-TX */
+	{ 0x34, 0x04a12050 }, /* ASP-1-RX */
+	{ 0x2c, 0x901000f0 }, /* ASP-2-TX */
+	{ 0x44, 0x90a00090 }, /* DMIC-1 */
+	{} /* terminator */
+};
+
+/* Vendor specific HW configuration for CS42L42 */
+const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
+	{ 0x1010, 0xB0 },
+	{ 0x1D01, 0x00 },
+	{ 0x1D02, 0x06 },
+	{ 0x1D03, 0x00 },
+	{ 0x1107, 0x01 },
+	{ 0x1009, 0x02 },
+	{ 0x1007, 0x03 },
+	{ 0x1201, 0x00 },
+	{ 0x1208, 0x13 },
+	{ 0x1205, 0xFF },
+	{ 0x1206, 0x00 },
+	{ 0x1207, 0x20 },
+	{ 0x1202, 0x0D },
+	{ 0x2A02, 0x02 },
+	{ 0x2A03, 0x00 },
+	{ 0x2A04, 0x00 },
+	{ 0x2A05, 0x02 },
+	{ 0x2A06, 0x00 },
+	{ 0x2A07, 0x20 },
+	{ 0x2A08, 0x02 },
+	{ 0x2A09, 0x00 },
+	{ 0x2A0A, 0x80 },
+	{ 0x2A0B, 0x02 },
+	{ 0x2A0C, 0x00 },
+	{ 0x2A0D, 0xA0 },
+	{ 0x2A01, 0x0C },
+	{ 0x2902, 0x01 },
+	{ 0x2903, 0x02 },
+	{ 0x2904, 0x00 },
+	{ 0x2905, 0x00 },
+	{ 0x2901, 0x01 },
+	{ 0x1101, 0x0A },
+	{ 0x1102, 0x84 },
+	{ 0x2301, 0x00 },
+	{ 0x2303, 0x00 },
+	{ 0x2302, 0x3f },
+	{ 0x2001, 0x03 },
+	{ 0x1B75, 0xB6 },
+	{ 0x1B73, 0xC2 },
+	{ 0x1129, 0x01 },
+	{ 0x1121, 0xF3 },
+	{ 0x1103, 0x20 },
+	{ 0x1105, 0x00 },
+	{ 0x1112, 0xC0 },
+	{ 0x1113, 0x80 },
+	{ 0x1C03, 0xC0 },
+	{ 0x1105, 0x00 },
+	{ 0x1112, 0xC0 },
+	{ 0x1101, 0x02 },
+	{} /* Terminator */
+};
+
+/* Vendor specific hw configuration for CS8409 */
+const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
+	{ 0x47, 0x00, 0xb008 }, /* +PLL1/2_EN, +I2C_EN */
+	{ 0x47, 0x01, 0x0002 }, /* ASP1/2_EN=0, ASP1_STP=1 */
+	{ 0x47, 0x02, 0x0a80 }, /* ASP1/2_BUS_IDLE=10, +GPIO_I2C */
+	{ 0x47, 0x19, 0x0800 }, /* ASP1.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ 0x47, 0x1a, 0x0820 }, /* ASP1.A: TX.RAP=0, TX.RSZ=24 bits, TX.RCS=32 */
+	{ 0x47, 0x29, 0x0800 }, /* ASP2.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ 0x47, 0x2a, 0x2800 }, /* ASP2.A: TX.RAP=1, TX.RSZ=24 bits, TX.RCS=0 */
+	{ 0x47, 0x39, 0x0800 }, /* ASP1.A: RX.LAP=0, RX.LSZ=24 bits, RX.LCS=0 */
+	{ 0x47, 0x3a, 0x0800 }, /* ASP1.A: RX.RAP=0, RX.RSZ=24 bits, RX.RCS=0 */
+	{ 0x47, 0x03, 0x8000 }, /* ASP1: LCHI = 00h */
+	{ 0x47, 0x04, 0x28ff }, /* ASP1: MC/SC_SRCSEL=PLL1, LCPR=FFh */
+	{ 0x47, 0x05, 0x0062 }, /* ASP1: MCEN=0, FSD=011, SCPOL_IN/OUT=0, SCDIV=1:4 */
+	{ 0x47, 0x06, 0x801f }, /* ASP2: LCHI=1Fh */
+	{ 0x47, 0x07, 0x283f }, /* ASP2: MC/SC_SRCSEL=PLL1, LCPR=3Fh */
+	{ 0x47, 0x08, 0x805c }, /* ASP2: 5050=1, MCEN=0, FSD=010, SCPOL_IN/OUT=1, SCDIV=1:16 */
+	{ 0x47, 0x09, 0x0023 }, /* DMIC1_MO=10b, DMIC1/2_SR=1 */
+	{ 0x47, 0x0a, 0x0000 }, /* ASP1/2_BEEP=0 */
+	{ 0x47, 0x01, 0x0062 }, /* ASP1/2_EN=1, ASP1_STP=1 */
+	{ 0x47, 0x00, 0x9008 }, /* -PLL2_EN */
+	{ 0x47, 0x68, 0x0000 }, /* TX2.A: pre-scale att.=0 dB */
+	{ 0x47, 0x82, 0xfc03 }, /* ASP1/2_xxx_EN=1, ASP1/2_MCLK_EN=0, DMIC1_SCL_EN=1 */
+	{ 0x47, 0xc0, 0x9999 }, /* test mode on */
+	{ 0x47, 0xc5, 0x0000 }, /* GPIO hysteresis = 30 us */
+	{ 0x47, 0xc0, 0x0000 }, /* test mode off */
+	{} /* Terminator */
+};
+
+const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[] = {
+	{ 0x47, 0x65, 0x4000 }, /* EQ_SEL=1, EQ1/2_EN=0 */
+	{ 0x47, 0x64, 0x4000 }, /* +EQ_ACC */
+	{ 0x47, 0x65, 0x4010 }, /* +EQ2_EN */
+	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
+	{ 0x47, 0x64, 0xc0c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=0, EQ_DATA_LO=0x67 */
+	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
+	{ 0x47, 0x64, 0xc1c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=1, EQ_DATA_LO=0x67 */
+	{ 0x47, 0x63, 0xf370 }, /* EQ_DATA_HI=0xf370 */
+	{ 0x47, 0x64, 0xc271 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=2, EQ_DATA_LO=0x71 */
+	{ 0x47, 0x63, 0x1ef8 }, /* EQ_DATA_HI=0x1ef8 */
+	{ 0x47, 0x64, 0xc348 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=3, EQ_DATA_LO=0x48 */
+	{ 0x47, 0x63, 0xc110 }, /* EQ_DATA_HI=0xc110 */
+	{ 0x47, 0x64, 0xc45a }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=4, EQ_DATA_LO=0x5a */
+	{ 0x47, 0x63, 0x1f29 }, /* EQ_DATA_HI=0x1f29 */
+	{ 0x47, 0x64, 0xc574 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=5, EQ_DATA_LO=0x74 */
+	{ 0x47, 0x63, 0x1d7a }, /* EQ_DATA_HI=0x1d7a */
+	{ 0x47, 0x64, 0xc653 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=6, EQ_DATA_LO=0x53 */
+	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
+	{ 0x47, 0x64, 0xc714 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=7, EQ_DATA_LO=0x14 */
+	{ 0x47, 0x63, 0x1ca3 }, /* EQ_DATA_HI=0x1ca3 */
+	{ 0x47, 0x64, 0xc8c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=8, EQ_DATA_LO=0xc7 */
+	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
+	{ 0x47, 0x64, 0xc914 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=9, EQ_DATA_LO=0x14 */
+	{ 0x47, 0x64, 0x0000 }, /* -EQ_ACC, -EQ_WRT */
+	{} /* Terminator */
+};
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 9b16f1b5b828..b56fc89ad2cd 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -11,13 +11,6 @@
 #include <linux/module.h>
 #include <sound/core.h>
 #include <linux/mutex.h>
-#include <linux/pci.h>
-#include <sound/tlv.h>
-#include <sound/hda_codec.h>
-#include "hda_local.h"
-#include "hda_auto_parser.h"
-#include "hda_jack.h"
-#include "hda_generic.h"
 
 #include "patch_cs8409.h"
 
@@ -52,79 +45,6 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 	return 0;
 }
 
-/* Dell Inspiron models with cs8409/cs42l42 */
-static const struct hda_model_fixup cs8409_models[] = {
-	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
-	{ .id = CS8409_WARLOCK, .name = "warlock" },
-	{ .id = CS8409_CYBORG, .name = "cyborg" },
-	{}
-};
-
-/* Dell Inspiron platforms
- * with cs8409 bridge and cs42l42 codec
- */
-static const struct snd_pci_quirk cs8409_fixup_tbl[] = {
-	SND_PCI_QUIRK(0x1028, 0x0A11, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A12, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A23, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A24, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A25, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A29, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A2A, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0A2B, "Bullseye", CS8409_BULLSEYE),
-	SND_PCI_QUIRK(0x1028, 0x0AB0, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AB2, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AB1, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AB3, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AB4, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AB5, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AD9, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0ADA, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0ADB, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0ADC, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AF4, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0AF5, "Warlock", CS8409_WARLOCK),
-	SND_PCI_QUIRK(0x1028, 0x0A77, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A78, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A79, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A7A, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A7D, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A7E, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A7F, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0A80, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0ADF, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AE0, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AE1, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AE2, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AE9, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AEA, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AEB, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AEC, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AED, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AEE, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AEF, "Cyborg", CS8409_CYBORG),
-	SND_PCI_QUIRK(0x1028, 0x0AF0, "Cyborg", CS8409_CYBORG),
-	{} /* terminator */
-};
-
-static const struct hda_verb cs8409_cs42l42_init_verbs[] = {
-	{ 0x01, AC_VERB_SET_GPIO_WAKE_MASK, 0x0018 }, /* WAKE from GPIO 3,4 */
-	{ 0x47, AC_VERB_SET_PROC_STATE, 0x0001 },     /* Enable VPW processing  */
-	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x0002 },     /* Configure GPIO 6,7 */
-	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0080 },     /* I2C mode */
-	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x005b },     /* Set I2C bus speed */
-	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0200 },     /* 100kHz I2C_STO = 2 */
-	{} /* terminator */
-};
-
-static const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
-	{ 0x24, 0x042120f0 }, /* ASP-1-TX */
-	{ 0x34, 0x04a12050 }, /* ASP-1-RX */
-	{ 0x2c, 0x901000f0 }, /* ASP-2-TX */
-	{ 0x44, 0x90a00090 }, /* DMIC-1 */
-	{} /* terminator */
-};
-
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec;
@@ -139,117 +59,6 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	return spec;
 }
 
-/* Vendor specific HW configuration for CS42L42 */
-static const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
-	{ 0x1010, 0xB0 },
-	{ 0x1D01, 0x00 },
-	{ 0x1D02, 0x06 },
-	{ 0x1D03, 0x00 },
-	{ 0x1107, 0x01 },
-	{ 0x1009, 0x02 },
-	{ 0x1007, 0x03 },
-	{ 0x1201, 0x00 },
-	{ 0x1208, 0x13 },
-	{ 0x1205, 0xFF },
-	{ 0x1206, 0x00 },
-	{ 0x1207, 0x20 },
-	{ 0x1202, 0x0D },
-	{ 0x2A02, 0x02 },
-	{ 0x2A03, 0x00 },
-	{ 0x2A04, 0x00 },
-	{ 0x2A05, 0x02 },
-	{ 0x2A06, 0x00 },
-	{ 0x2A07, 0x20 },
-	{ 0x2A08, 0x02 },
-	{ 0x2A09, 0x00 },
-	{ 0x2A0A, 0x80 },
-	{ 0x2A0B, 0x02 },
-	{ 0x2A0C, 0x00 },
-	{ 0x2A0D, 0xA0 },
-	{ 0x2A01, 0x0C },
-	{ 0x2902, 0x01 },
-	{ 0x2903, 0x02 },
-	{ 0x2904, 0x00 },
-	{ 0x2905, 0x00 },
-	{ 0x2901, 0x01 },
-	{ 0x1101, 0x0A },
-	{ 0x1102, 0x84 },
-	{ 0x2301, 0x00 },
-	{ 0x2303, 0x00 },
-	{ 0x2302, 0x3f },
-	{ 0x2001, 0x03 },
-	{ 0x1B75, 0xB6 },
-	{ 0x1B73, 0xC2 },
-	{ 0x1129, 0x01 },
-	{ 0x1121, 0xF3 },
-	{ 0x1103, 0x20 },
-	{ 0x1105, 0x00 },
-	{ 0x1112, 0xC0 },
-	{ 0x1113, 0x80 },
-	{ 0x1C03, 0xC0 },
-	{ 0x1105, 0x00 },
-	{ 0x1112, 0xC0 },
-	{ 0x1101, 0x02 },
-	{} /* Terminator */
-};
-
-/* Vendor specific hw configuration for CS8409 */
-static const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
-	{ 0x47, 0x00, 0xb008 }, /* +PLL1/2_EN, +I2C_EN */
-	{ 0x47, 0x01, 0x0002 }, /* ASP1/2_EN=0, ASP1_STP=1 */
-	{ 0x47, 0x02, 0x0a80 }, /* ASP1/2_BUS_IDLE=10, +GPIO_I2C */
-	{ 0x47, 0x19, 0x0800 }, /* ASP1.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
-	{ 0x47, 0x1a, 0x0820 }, /* ASP1.A: TX.RAP=0, TX.RSZ=24 bits, TX.RCS=32 */
-	{ 0x47, 0x29, 0x0800 }, /* ASP2.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
-	{ 0x47, 0x2a, 0x2800 }, /* ASP2.A: TX.RAP=1, TX.RSZ=24 bits, TX.RCS=0 */
-	{ 0x47, 0x39, 0x0800 }, /* ASP1.A: RX.LAP=0, RX.LSZ=24 bits, RX.LCS=0 */
-	{ 0x47, 0x3a, 0x0800 }, /* ASP1.A: RX.RAP=0, RX.RSZ=24 bits, RX.RCS=0 */
-	{ 0x47, 0x03, 0x8000 }, /* ASP1: LCHI = 00h */
-	{ 0x47, 0x04, 0x28ff }, /* ASP1: MC/SC_SRCSEL=PLL1, LCPR=FFh */
-	{ 0x47, 0x05, 0x0062 }, /* ASP1: MCEN=0, FSD=011, SCPOL_IN/OUT=0, SCDIV=1:4 */
-	{ 0x47, 0x06, 0x801f }, /* ASP2: LCHI=1Fh */
-	{ 0x47, 0x07, 0x283f }, /* ASP2: MC/SC_SRCSEL=PLL1, LCPR=3Fh */
-	{ 0x47, 0x08, 0x805c }, /* ASP2: 5050=1, MCEN=0, FSD=010, SCPOL_IN/OUT=1, SCDIV=1:16 */
-	{ 0x47, 0x09, 0x0023 }, /* DMIC1_MO=10b, DMIC1/2_SR=1 */
-	{ 0x47, 0x0a, 0x0000 }, /* ASP1/2_BEEP=0 */
-	{ 0x47, 0x01, 0x0062 }, /* ASP1/2_EN=1, ASP1_STP=1 */
-	{ 0x47, 0x00, 0x9008 }, /* -PLL2_EN */
-	{ 0x47, 0x68, 0x0000 }, /* TX2.A: pre-scale att.=0 dB */
-	{ 0x47, 0x82, 0xfc03 }, /* ASP1/2_xxx_EN=1, ASP1/2_MCLK_EN=0, DMIC1_SCL_EN=1 */
-	{ 0x47, 0xc0, 0x9999 }, /* test mode on */
-	{ 0x47, 0xc5, 0x0000 }, /* GPIO hysteresis = 30 us */
-	{ 0x47, 0xc0, 0x0000 }, /* test mode off */
-	{} /* Terminator */
-};
-
-static const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[] = {
-	{ 0x47, 0x65, 0x4000 }, /* EQ_SEL=1, EQ1/2_EN=0 */
-	{ 0x47, 0x64, 0x4000 }, /* +EQ_ACC */
-	{ 0x47, 0x65, 0x4010 }, /* +EQ2_EN */
-	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
-	{ 0x47, 0x64, 0xc0c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=0, EQ_DATA_LO=0x67 */
-	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
-	{ 0x47, 0x64, 0xc1c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=1, EQ_DATA_LO=0x67 */
-	{ 0x47, 0x63, 0xf370 }, /* EQ_DATA_HI=0xf370 */
-	{ 0x47, 0x64, 0xc271 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=2, EQ_DATA_LO=0x71 */
-	{ 0x47, 0x63, 0x1ef8 }, /* EQ_DATA_HI=0x1ef8 */
-	{ 0x47, 0x64, 0xc348 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=3, EQ_DATA_LO=0x48 */
-	{ 0x47, 0x63, 0xc110 }, /* EQ_DATA_HI=0xc110 */
-	{ 0x47, 0x64, 0xc45a }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=4, EQ_DATA_LO=0x5a */
-	{ 0x47, 0x63, 0x1f29 }, /* EQ_DATA_HI=0x1f29 */
-	{ 0x47, 0x64, 0xc574 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=5, EQ_DATA_LO=0x74 */
-	{ 0x47, 0x63, 0x1d7a }, /* EQ_DATA_HI=0x1d7a */
-	{ 0x47, 0x64, 0xc653 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=6, EQ_DATA_LO=0x53 */
-	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
-	{ 0x47, 0x64, 0xc714 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=7, EQ_DATA_LO=0x14 */
-	{ 0x47, 0x63, 0x1ca3 }, /* EQ_DATA_HI=0x1ca3 */
-	{ 0x47, 0x64, 0xc8c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=8, EQ_DATA_LO=0xc7 */
-	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
-	{ 0x47, 0x64, 0xc914 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=9, EQ_DATA_LO=0x14 */
-	{ 0x47, 0x64, 0x0000 }, /* -EQ_ACC, -EQ_WRT */
-	{} /* Terminator */
-};
-
 static inline int cs8409_vendor_coef_get(struct hda_codec *codec, unsigned int idx)
 {
 	snd_hda_codec_write(codec, CS8409_VENDOR_NID, 0, AC_VERB_SET_COEF_INDEX, idx);
@@ -908,7 +717,7 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
 	return spec->exec_verb(dev, cmd, flags, res);
 }
 
-static void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
 	struct cs8409_spec *spec = codec->spec;
 	int caps;
@@ -995,31 +804,6 @@ static void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixu
 	}
 }
 
-static const struct hda_fixup cs8409_fixups[] = {
-	[CS8409_BULLSEYE] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = cs8409_cs42l42_pincfgs,
-		.chained = true,
-		.chain_id = CS8409_FIXUPS,
-	},
-	[CS8409_WARLOCK] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = cs8409_cs42l42_pincfgs,
-		.chained = true,
-		.chain_id = CS8409_FIXUPS,
-	},
-	[CS8409_CYBORG] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = cs8409_cs42l42_pincfgs,
-		.chained = true,
-		.chain_id = CS8409_FIXUPS,
-	},
-	[CS8409_FIXUPS] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cs8409_cs42l42_fixups,
-	},
-};
-
 static int patch_cs8409(struct hda_codec *codec)
 {
 	int err;
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 2ab02a520f5a..516123a411db 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -9,6 +9,14 @@
 #ifndef __CS8409_PATCH_H
 #define __CS8409_PATCH_H
 
+#include <linux/pci.h>
+#include <sound/tlv.h>
+#include <sound/hda_codec.h>
+#include "hda_local.h"
+#include "hda_auto_parser.h"
+#include "hda_jack.h"
+#include "hda_generic.h"
+
 /* Cirrus Logic CS8409 HDA bridge with
  * companion codec CS42L42
  */
@@ -88,4 +96,15 @@ struct cs8409_spec {
 			 unsigned int *res);
 };
 
+extern const struct snd_pci_quirk cs8409_fixup_tbl[];
+extern const struct hda_model_fixup cs8409_models[];
+extern const struct hda_fixup cs8409_fixups[];
+extern const struct hda_verb cs8409_cs42l42_init_verbs[];
+extern const struct hda_pintbl cs8409_cs42l42_pincfgs[];
+extern const struct cs8409_i2c_param cs42l42_init_reg_seq[];
+extern const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[];
+extern const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[];
+
+void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
+
 #endif
-- 
2.25.1

