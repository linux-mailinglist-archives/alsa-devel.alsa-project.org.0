Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D23E9875
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5188D1A3C;
	Wed, 11 Aug 2021 21:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5188D1A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709307;
	bh=svuCezJHJ0X2s9hjZ+OKLRkZoelUF72XAULhd7+UItM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mI46yGB0wMTO5es3tbGYy3sxG8wNJJd0yEeBnvWm7WGoynJb9C7h2K7oJ0EJub8W7
	 lbgRsn+V3wxLOAH2x2YaL1H/pCa86fJeEwOJxJnLWMTfydi8DfjUlrd5ZOZ8tlCUJj
	 qcXrZTrvG9SAWqye5sSTZ/hpO5F+Jsw29Xvxo/Z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B940F8016B;
	Wed, 11 Aug 2021 21:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B4EF804F2; Wed, 11 Aug 2021 21:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CADEF8016B
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CADEF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cbO34HW+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hd00013981; 
 Wed, 11 Aug 2021 14:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9NIpsaFVLqUnyEIbwTRnIV9O3bNzu/PlW0b90gJtVGQ=;
 b=cbO34HW+xYZr3aU/rloxUIWvl9o/E/1IyC4zfuMTxpI5tjlfAanPspofUQbai6yRy+xX
 VPiSYIYYyVahm3e06W9+b2z0yr0nmyXN0VmkFQGi1S0pTMpXKtEfLIaMdVaoZLsDMdAO
 5Ccbc6IyekgemeRM78R2jkDpliwKWA+azov/MHUNqXe/+1bOaUKa8Bl/cPFjdwaoxllD
 O4bffu1kO/77hAlCiP82pDrTYDmhOr1guGvdaMreOcXjSdbDCJvh65DjLaHtE/MCWeWN
 dWBcZjTgzGhlagWLk0mqOdhLwotNptPh2hQbe52Tx2XDkMpw3tdcPdQ+kv1YjNSAnZ0W 5A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:30 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8C36C46E;
 Wed, 11 Aug 2021 18:57:30 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 18/27] ALSA: hda/cs8409: Move codec properties to its own
 struct
Date: Wed, 11 Aug 2021 19:56:45 +0100
Message-ID: <20210811185654.6837-19-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZDyt184GC7-RSFbOChmrs1_Uv4xBXcBS
X-Proofpoint-GUID: ZDyt184GC7-RSFbOChmrs1_Uv4xBXcBS
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110132
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

To accommodate move, cs42l42_resume has been added to mirror
the existing function cs42l42_suspend.
Function cs42l42_reset is no longer required, since cs42l42_resume
and cs42l42_suspend perform the same operations.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c | 183 ++++++++--------
 sound/pci/hda/patch_cs8409.c        | 312 ++++++++++++++--------------
 sound/pci/hda/patch_cs8409.h        |  39 +++-
 3 files changed, 284 insertions(+), 250 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 77a7b2f42128..117c70536ff0 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -28,7 +28,7 @@ const struct snd_kcontrol_new cs42l42_dac_volume_mixer = {
 	.get = cs42l42_volume_get,
 	.put = cs42l42_volume_put,
 	.tlv = { .p = cs42l42_dac_db_scale },
-	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_TRANSMITTER_A, 3, 0,
+	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_TRANSMITTER_A, 3, CS8409_CODEC0,
 			 HDA_OUTPUT, CS42L42_VOL_DAC) | HDA_AMP_VAL_MIN_MUTE
 };
 
@@ -41,89 +41,14 @@ const struct snd_kcontrol_new cs42l42_adc_volume_mixer = {
 	.get = cs42l42_volume_get,
 	.put = cs42l42_volume_put,
 	.tlv = { .p = cs42l42_adc_db_scale },
-	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_RECEIVER_A, 1, 0,
+	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_RECEIVER_A, 1, CS8409_CODEC0,
 			 HDA_INPUT, CS42L42_VOL_ADC) | HDA_AMP_VAL_MIN_MUTE
 };
 
-/* Dell Inspiron platforms
- * with cs8409 bridge and cs42l42 codec
- */
-const struct snd_pci_quirk cs8409_fixup_tbl[] = {
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
-/* Dell Inspiron models with cs8409/cs42l42 */
-const struct hda_model_fixup cs8409_models[] = {
-	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
-	{ .id = CS8409_WARLOCK, .name = "warlock" },
-	{ .id = CS8409_CYBORG, .name = "cyborg" },
-	{}
-};
-
-const struct hda_fixup cs8409_fixups[] = {
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
+/******************************************************************************
+ *                   BULLSEYE / WARLOCK / CYBORG Specific Arrays
+ *                               CS8409/CS42L42
+ ******************************************************************************/
 
 const struct hda_verb cs8409_cs42l42_init_verbs[] = {
 	{ CS8409_PIN_AFG, AC_VERB_SET_GPIO_WAKE_MASK, 0x0018 },		/* WAKE from GPIO 3,4 */
@@ -144,7 +69,7 @@ const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
 };
 
 /* Vendor specific HW configuration for CS42L42 */
-const struct cs8409_i2c_param cs42l42_init_reg_seq[CS42L42_INIT_REG_SEQ_SIZE] = {
+static const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
 	{ 0x1010, 0xB0 },
 	{ 0x1D01, 0x00 },
 	{ 0x1D02, 0x06 },
@@ -310,3 +235,97 @@ const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[] = {
 	{ CS8409_PIN_VENDOR_WIDGET, CS8409_PFE_COEF_W2, 0x0000 },
 	{} /* Terminator */
 };
+
+struct sub_codec cs8409_cs42l42_codec = {
+	.addr = CS42L42_I2C_ADDR,
+	.reset_gpio = CS8409_CS42L42_RESET,
+	.irq_mask = CS8409_CS42L42_INT,
+	.init_seq = cs42l42_init_reg_seq,
+	.init_seq_num = ARRAY_SIZE(cs42l42_init_reg_seq),
+	.hp_jack_in = 0,
+	.mic_jack_in = 0,
+	.paged = 1,
+	.suspended = 1,
+};
+
+/******************************************************************************
+ *                         CS8409 Patch Driver Structs
+ *                    Arrays Used for all projects using CS8409
+ ******************************************************************************/
+
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
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 51776f843c7c..9d1a457c2696 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -177,20 +177,20 @@ static void cs8409_set_i2c_dev_addr(struct hda_codec *codec, unsigned int addr)
 
 /**
  * cs8409_i2c_set_page - CS8409 I2C set page register.
- * @codec: the codec instance
+ * @scodec: the codec instance
  * @i2c_reg: Page register
  *
  * Returns negative on error.
  */
-static int cs8409_i2c_set_page(struct hda_codec *codec, unsigned int i2c_reg)
+static int cs8409_i2c_set_page(struct sub_codec *scodec, unsigned int i2c_reg)
 {
-	struct cs8409_spec *spec = codec->spec;
+	struct hda_codec *codec = scodec->codec;
 
-	if (spec->paged && (spec->last_page != (i2c_reg >> 8))) {
+	if (scodec->paged && (scodec->last_page != (i2c_reg >> 8))) {
 		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
 		if (cs8409_i2c_wait_complete(codec) < 0)
 			return -EIO;
-		spec->last_page = i2c_reg >> 8;
+		scodec->last_page = i2c_reg >> 8;
 	}
 
 	return 0;
@@ -198,31 +198,27 @@ static int cs8409_i2c_set_page(struct hda_codec *codec, unsigned int i2c_reg)
 
 /**
  * cs8409_i2c_read - CS8409 I2C Read.
- * @codec: the codec instance
- * @i2c_address: I2C Address
+ * @scodec: the codec instance
  * @addr: Register to read
  *
- * CS8409 I2C Read.
  * Returns negative on error, otherwise returns read value in bits 0-7.
  */
-static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int addr)
+static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr)
 {
+	struct hda_codec *codec = scodec->codec;
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 	unsigned int read_data;
 
-	if (spec->cs42l42_suspended)
+	if (scodec->suspended)
 		return -EPERM;
 
 	mutex_lock(&spec->i2c_mux);
 	cs8409_enable_i2c_clock(codec);
-	cs8409_set_i2c_dev_addr(codec, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
-	if (cs8409_i2c_set_page(codec, addr)) {
-		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-			__func__, i2c_address, addr);
-		return -EIO;
-	}
+	if (cs8409_i2c_set_page(scodec, addr))
+		goto error;
 
 	i2c_reg_data = (addr << 8) & 0x0ffff;
 	cs8409_vendor_coef_set(codec, CS8409_I2C_QREAD, i2c_reg_data);
@@ -237,34 +233,34 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 
 error:
 	mutex_unlock(&spec->i2c_mux);
-	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, i2c_address, addr);
+	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, scodec->addr, addr);
 	return -EIO;
 }
 
 /**
  * cs8409_i2c_bulk_read - CS8409 I2C Read Sequence.
- * @codec: the codec instance
+ * @scodec: the codec instance
  * @seq: Register Sequence to read
  * @count: Number of registeres to read
  *
  * Returns negative on error, values are read into value element of cs8409_i2c_param sequence.
  */
-static int cs8409_i2c_bulk_read(struct hda_codec *codec, unsigned int i2c_address,
-				struct cs8409_i2c_param *seq, int count)
+static int cs8409_i2c_bulk_read(struct sub_codec *scodec, struct cs8409_i2c_param *seq, int count)
 {
+	struct hda_codec *codec = scodec->codec;
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 	int i;
 
-	if (spec->cs42l42_suspended)
+	if (scodec->suspended)
 		return -EPERM;
 
 	mutex_lock(&spec->i2c_mux);
-	cs8409_set_i2c_dev_addr(codec, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
 	for (i = 0; i < count; i++) {
 		cs8409_enable_i2c_clock(codec);
-		if (cs8409_i2c_set_page(codec, seq[i].addr))
+		if (cs8409_i2c_set_page(scodec, seq[i].addr))
 			goto error;
 
 		i2c_reg_data = (seq[i].addr << 8) & 0x0ffff;
@@ -282,39 +278,34 @@ static int cs8409_i2c_bulk_read(struct hda_codec *codec, unsigned int i2c_addres
 
 error:
 	mutex_unlock(&spec->i2c_mux);
-	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", i2c_address);
+	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", scodec->addr);
 	return -EIO;
 }
 
 /**
  * cs8409_i2c_write - CS8409 I2C Write.
- * @codec: the codec instance
- * @i2c_address: I2C Address
+ * @scodec: the codec instance
  * @addr: Register to write to
  * @value: Data to write
  *
- * CS8409 I2C Write.
  * Returns negative on error, otherwise returns 0.
  */
-static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, unsigned int addr,
-			    unsigned int value)
+static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigned int value)
 {
+	struct hda_codec *codec = scodec->codec;
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 
-	if (spec->cs42l42_suspended)
+	if (scodec->suspended)
 		return -EPERM;
 
 	mutex_lock(&spec->i2c_mux);
 
 	cs8409_enable_i2c_clock(codec);
-	cs8409_set_i2c_dev_addr(codec, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
-	if (cs8409_i2c_set_page(codec, addr)) {
-		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-			__func__, i2c_address, addr);
-		return -EIO;
-	}
+	if (cs8409_i2c_set_page(scodec, addr))
+		goto error;
 
 	i2c_reg_data = ((addr << 8) & 0x0ff00) | (value & 0x0ff);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg_data);
@@ -327,34 +318,35 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 
 error:
 	mutex_unlock(&spec->i2c_mux);
-	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, i2c_address, addr);
+	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, scodec->addr, addr);
 	return -EIO;
 }
 
 /**
  * cs8409_i2c_bulk_write - CS8409 I2C Write Sequence.
- * @codec: the codec instance
+ * @scodec: the codec instance
  * @seq: Register Sequence to write
  * @count: Number of registeres to write
  *
  * Returns negative on error.
  */
-static int cs8409_i2c_bulk_write(struct hda_codec *codec, unsigned int i2c_address,
-				 const struct cs8409_i2c_param *seq, int count)
+static int cs8409_i2c_bulk_write(struct sub_codec *scodec, const struct cs8409_i2c_param *seq,
+				 int count)
 {
+	struct hda_codec *codec = scodec->codec;
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 	int i;
 
-	if (spec->cs42l42_suspended)
+	if (scodec->suspended)
 		return -EPERM;
 
 	mutex_lock(&spec->i2c_mux);
-	cs8409_set_i2c_dev_addr(codec, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, scodec->addr);
 
 	for (i = 0; i < count; i++) {
 		cs8409_enable_i2c_clock(codec);
-		if (cs8409_i2c_set_page(codec, seq[i].addr))
+		if (cs8409_i2c_set_page(scodec, seq[i].addr))
 			goto error;
 
 		i2c_reg_data = ((seq[i].addr << 8) & 0x0ff00) | (seq[i].value & 0x0ff);
@@ -370,7 +362,7 @@ static int cs8409_i2c_bulk_write(struct hda_codec *codec, unsigned int i2c_addre
 
 error:
 	mutex_unlock(&spec->i2c_mux);
-	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", i2c_address);
+	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", scodec->addr);
 	return -EIO;
 }
 
@@ -463,6 +455,7 @@ int cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uc
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[get_amp_index(kctrl)];
 	int chs = get_amp_channels(kctrl);
 	unsigned int ofs = get_amp_offset(kctrl);
 	long *valp = uctrl->value.integer.value;
@@ -470,13 +463,13 @@ int cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uc
 	switch (ofs) {
 	case CS42L42_VOL_DAC:
 		if (chs & BIT(0))
-			*valp++ = spec->vol[ofs];
+			*valp++ = cs42l42->vol[ofs];
 		if (chs & BIT(1))
-			*valp = spec->vol[ofs+1];
+			*valp = cs42l42->vol[ofs+1];
 		break;
 	case CS42L42_VOL_ADC:
 		if (chs & BIT(0))
-			*valp = spec->vol[ofs];
+			*valp = cs42l42->vol[ofs];
 		break;
 	default:
 		break;
@@ -489,6 +482,7 @@ int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uc
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[get_amp_index(kctrl)];
 	int chs = get_amp_channels(kctrl);
 	unsigned int ofs = get_amp_offset(kctrl);
 	long *valp = uctrl->value.integer.value;
@@ -496,23 +490,23 @@ int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uc
 	switch (ofs) {
 	case CS42L42_VOL_DAC:
 		if (chs & BIT(0)) {
-			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHA,
-					 -(spec->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
+			cs42l42->vol[ofs] = *valp;
+			cs8409_i2c_write(cs42l42, CS42L42_REG_HS_VOL_CHA,
+					 -(cs42l42->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
 		}
 		if (chs & BIT(1)) {
 			ofs++;
 			valp++;
-			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHB,
-					 -(spec->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
+			cs42l42->vol[ofs] = *valp;
+			cs8409_i2c_write(cs42l42, CS42L42_REG_HS_VOL_CHB,
+					 -(cs42l42->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
 		}
 		break;
 	case CS42L42_VOL_ADC:
 		if (chs & BIT(0)) {
-			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_AMIC_VOL,
-					 spec->vol[ofs] & CS42L42_REG_AMIC_VOL_MASK);
+			cs42l42->vol[ofs] = *valp;
+			cs8409_i2c_write(cs42l42, CS42L42_REG_AMIC_VOL,
+					 cs42l42->vol[ofs] & CS42L42_REG_AMIC_VOL_MASK);
 		}
 		break;
 	default:
@@ -523,54 +517,45 @@ int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uc
 }
 
 /* Configure CS42L42 slave codec for jack autodetect */
-static void cs42l42_enable_jack_detect(struct hda_codec *codec)
+static void cs42l42_enable_jack_detect(struct sub_codec *cs42l42)
 {
-	/* Set TIP_SENSE_EN for analog front-end of tip sense.
-	 * Additionally set HSBIAS_SENSE_EN for some variants.
-	 */
-	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_BULLSEYE)
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x0020);
-	else
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x00a0);
-
+	cs8409_i2c_write(cs42l42, 0x1b70, cs42l42->hsbias_hiz);
 	/* Clear WAKE# */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C1);
+	cs8409_i2c_write(cs42l42, 0x1b71, 0x00C1);
 	/* Wait ~2.5ms */
 	usleep_range(2500, 3000);
 	/* Set mode WAKE# output follows the combination logic directly */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C0);
+	cs8409_i2c_write(cs42l42, 0x1b71, 0x00C0);
 	/* Clear interrupts status */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
+	cs8409_i2c_read(cs42l42, 0x130f);
 	/* Enable interrupt */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
+	cs8409_i2c_write(cs42l42, 0x1320, 0xF3);
 }
 
 /* Enable and run CS42L42 slave codec jack auto detect */
-static void cs42l42_run_jack_detect(struct hda_codec *codec)
+static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 {
 	/* Clear interrupts */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xFF);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
-
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1102, 0x87);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1f06, 0x86);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b74, 0x07);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFD);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0x80);
+	cs8409_i2c_read(cs42l42, 0x1308);
+	cs8409_i2c_read(cs42l42, 0x1b77);
+	cs8409_i2c_write(cs42l42, 0x1320, 0xFF);
+	cs8409_i2c_read(cs42l42, 0x130f);
+
+	cs8409_i2c_write(cs42l42, 0x1102, 0x87);
+	cs8409_i2c_write(cs42l42, 0x1f06, 0x86);
+	cs8409_i2c_write(cs42l42, 0x1b74, 0x07);
+	cs8409_i2c_write(cs42l42, 0x131b, 0xFD);
+	cs8409_i2c_write(cs42l42, 0x1120, 0x80);
 	/* Wait ~110ms*/
 	usleep_range(110000, 200000);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x111f, 0x77);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0xc0);
+	cs8409_i2c_write(cs42l42, 0x111f, 0x77);
+	cs8409_i2c_write(cs42l42, 0x1120, 0xc0);
 	/* Wait ~10ms */
 	usleep_range(10000, 25000);
-
 }
 
-static int cs42l42_jack_unsol_event(struct hda_codec *codec)
+static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 {
-	struct cs8409_spec *spec = codec->spec;
 	int status_changed = 0;
 	int reg_cdc_status;
 	int reg_hs_status;
@@ -578,9 +563,9 @@ static int cs42l42_jack_unsol_event(struct hda_codec *codec)
 	int type;
 
 	/* Read jack detect status registers */
-	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
-	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124);
-	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
+	reg_cdc_status = cs8409_i2c_read(cs42l42, 0x1308);
+	reg_hs_status = cs8409_i2c_read(cs42l42, 0x1124);
+	reg_ts_status = cs8409_i2c_read(cs42l42, 0x130f);
 
 	/* If status values are < 0, read error has occurred. */
 	if (reg_cdc_status < 0 || reg_hs_status < 0 || reg_ts_status < 0)
@@ -590,45 +575,45 @@ static int cs42l42_jack_unsol_event(struct hda_codec *codec)
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
 
 		/* Disable HSDET_AUTO_DONE */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF);
+		cs8409_i2c_write(cs42l42, 0x131b, 0xFF);
 
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
 		/* CS42L42 reports optical jack as type 4
 		 * We don't handle optical jack
 		 */
 		if (type != 4) {
-			if (!spec->cs42l42_hp_jack_in) {
+			if (!cs42l42->hp_jack_in) {
 				status_changed = 1;
-				spec->cs42l42_hp_jack_in = 1;
+				cs42l42->hp_jack_in = 1;
 			}
 			/* type = 3 has no mic */
-			if ((!spec->cs42l42_mic_jack_in) && (type != 3)) {
+			if ((!cs42l42->mic_jack_in) && (type != 3)) {
 				status_changed = 1;
-				spec->cs42l42_mic_jack_in = 1;
+				cs42l42->mic_jack_in = 1;
 			}
 		} else {
-			if (spec->cs42l42_hp_jack_in || spec->cs42l42_mic_jack_in) {
+			if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
 				status_changed = 1;
-				spec->cs42l42_hp_jack_in = 0;
-				spec->cs42l42_mic_jack_in = 0;
+				cs42l42->hp_jack_in = 0;
+				cs42l42->mic_jack_in = 0;
 			}
 		}
 
 		/* Re-Enable Tip Sense Interrupt */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
+		cs8409_i2c_write(cs42l42, 0x1320, 0xF3);
 
 	} else {
 		/* TIP_SENSE INSERT/REMOVE */
 		switch (reg_ts_status) {
 		case CS42L42_JACK_INSERTED:
-			cs42l42_run_jack_detect(codec);
+			cs42l42_run_jack_detect(cs42l42);
 			break;
 
 		case CS42L42_JACK_REMOVED:
-			if (spec->cs42l42_hp_jack_in || spec->cs42l42_mic_jack_in) {
+			if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
 				status_changed = 1;
-				spec->cs42l42_hp_jack_in = 0;
-				spec->cs42l42_mic_jack_in = 0;
+				cs42l42->hp_jack_in = 0;
+				cs42l42->mic_jack_in = 0;
 			}
 			break;
 
@@ -642,10 +627,8 @@ static int cs42l42_jack_unsol_event(struct hda_codec *codec)
 	return status_changed;
 }
 
-/* Assert/release RTS# line to CS42L42 */
-static void cs42l42_reset(struct hda_codec *codec)
+static void cs42l42_resume(struct sub_codec *cs42l42)
 {
-	struct cs8409_spec *spec = codec->spec;
 	struct cs8409_i2c_param irq_regs[] = {
 		{ 0x1308, 0x00 },
 		{ 0x1309, 0x00 },
@@ -653,27 +636,35 @@ static void cs42l42_reset(struct hda_codec *codec)
 		{ 0x130F, 0x00 },
 	};
 
-	/* Assert RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
-	/* wait ~10ms */
-	usleep_range(10000, 15000);
-	/* Release RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, CS8409_CS42L42_RESET);
-	/* wait ~10ms */
-	usleep_range(10000, 15000);
+	cs42l42->suspended = 0;
 
-	spec->cs42l42_suspended = 0;
-	spec->last_page = 0;
+	/* Initialize CS42L42 companion codec */
+	cs8409_i2c_bulk_write(cs42l42, cs42l42->init_seq, cs42l42->init_seq_num);
 
 	/* Clear interrupts, by reading interrupt status registers */
-	cs8409_i2c_bulk_read(codec, CS42L42_I2C_ADDR, irq_regs, ARRAY_SIZE(irq_regs));
+	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
+
+	/* Restore Volumes after Resume */
+	cs8409_i2c_write(cs42l42, CS42L42_REG_HS_VOL_CHA,
+			 -(cs42l42->vol[1]) & CS42L42_REG_HS_VOL_MASK);
+	cs8409_i2c_write(cs42l42, CS42L42_REG_HS_VOL_CHB,
+			 -(cs42l42->vol[2]) & CS42L42_REG_HS_VOL_MASK);
+	cs8409_i2c_write(cs42l42, CS42L42_REG_AMIC_VOL,
+			 cs42l42->vol[0] & CS42L42_REG_AMIC_VOL_MASK);
+
+	if (cs42l42->full_scale_vol)
+		cs8409_i2c_write(cs42l42, 0x2001, 0x01);
+
+	cs42l42_enable_jack_detect(cs42l42);
 }
 
 #ifdef CONFIG_PM
-static void cs42l42_suspend(struct hda_codec *codec)
+static void cs42l42_suspend(struct sub_codec *cs42l42)
 {
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
+	cs8409_i2c_write(cs42l42, 0x1101, 0xfe);
+	cs42l42->suspended = 1;
+	cs42l42->last_page = 0;
 }
 #endif
 
@@ -700,9 +691,10 @@ static void cs8409_free(struct hda_codec *codec)
  * generic snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers
  * and then notify status via generic snd_hda_jack_unsol_event() call.
  */
-static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
+static void cs8409_cs42l42_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 {
 	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
 	struct hda_jack_tbl *jk;
 
 	/* jack_unsol_event() will be called every time gpio line changing state.
@@ -710,12 +702,12 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	 * registers in previous cs8409_jack_unsol_event() call.
 	 * We don't need to handle this event, ignoring...
 	 */
-	if (res & CS8409_CS42L42_INT)
+	if (res & cs42l42->irq_mask)
 		return;
 
-	if (cs42l42_jack_unsol_event(codec)) {
+	if (cs42l42_jack_unsol_event(cs42l42)) {
 		snd_hda_set_pin_ctl(codec, CS8409_CS42L42_SPK_PIN_NID,
-				    spec->cs42l42_hp_jack_in ? 0 : PIN_OUT);
+				    cs42l42->hp_jack_in ? 0 : PIN_OUT);
 		/* Report jack*/
 		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_HP_PIN_NID, 0);
 		if (jk)
@@ -737,9 +729,7 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 
 	cs8409_enable_ur(codec, 0);
 
-	cs42l42_suspend(codec);
-
-	spec->cs42l42_suspended = 1;
+	cs42l42_suspend(spec->scodecs[CS8409_CODEC0]);
 
 	/* Assert CS42L42 RTS# line */
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
@@ -762,6 +752,7 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
 	const struct cs8409_cir_param *seq_bullseye = cs8409_cs42l42_bullseye_atn;
 	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
 
 	if (spec->gpio_mask) {
 		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_MASK,
@@ -775,33 +766,21 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	for (; seq->nid; seq++)
 		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
 
-	if (codec->fixup_id == CS8409_BULLSEYE)
+	if (codec->fixup_id == CS8409_BULLSEYE) {
 		for (; seq_bullseye->nid; seq_bullseye++)
 			cs8409_vendor_coef_set(codec, seq_bullseye->cir, seq_bullseye->coeff);
+	}
 
-	/* Reset CS42L42 */
-	cs42l42_reset(codec);
-
-	/* Initialise CS42L42 companion codec */
-	cs8409_i2c_bulk_write(codec, CS42L42_I2C_ADDR, cs42l42_init_reg_seq,
-			      CS42L42_INIT_REG_SEQ_SIZE);
-
-	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG) {
-		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01);
-		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
+	/* DMIC1_MO=00b, DMIC1/2_SR=1 */
+	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG)
 		cs8409_vendor_coef_set(codec, 0x09, 0x0003);
-	}
 
-	/* Restore Volumes after Resume */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHA,
-			 -(spec->vol[1]) & CS42L42_REG_HS_VOL_MASK);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHB,
-			 -(spec->vol[2]) & CS42L42_REG_HS_VOL_MASK);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_AMIC_VOL,
-			 spec->vol[0] & CS42L42_REG_AMIC_VOL_MASK);
+	/* Release RTS# line */
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, CS8409_CS42L42_RESET);
+	/* wait ~10ms */
+	usleep_range(10000, 15000);
 
-	cs42l42_enable_jack_detect(codec);
+	cs42l42_resume(cs42l42);
 
 	/* Enable Unsolicited Response */
 	cs8409_enable_ur(codec, 1);
@@ -812,7 +791,7 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 	.build_pcms = snd_hda_gen_build_pcms,
 	.init = cs8409_init,
 	.free = cs8409_free,
-	.unsol_event = cs8409_jack_unsol_event,
+	.unsol_event = cs8409_cs42l42_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = cs8409_cs42l42_suspend,
 #endif
@@ -823,6 +802,7 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
 {
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
 	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
 
 	unsigned int nid = ((cmd >> 20) & 0x07f);
 	unsigned int verb = ((cmd >> 8) & 0x0fff);
@@ -835,18 +815,16 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
 	switch (nid) {
 	case CS8409_CS42L42_HP_PIN_NID:
 		if (verb == AC_VERB_GET_PIN_SENSE) {
-			*res = (spec->cs42l42_hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			*res = (cs42l42->hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
 			return 0;
 		}
 		break;
-
 	case CS8409_CS42L42_AMIC_PIN_NID:
 		if (verb == AC_VERB_GET_PIN_SENSE) {
-			*res = (spec->cs42l42_mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			*res = (cs42l42->mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
 			return 0;
 		}
 		break;
-
 	default:
 		break;
 	}
@@ -865,6 +843,9 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->exec_verb = codec->core.exec_verb;
 		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
 
+		spec->scodecs[CS8409_CODEC0] = &cs8409_cs42l42_codec;
+		spec->num_scodecs = 1;
+		spec->scodecs[CS8409_CODEC0]->codec = codec;
 		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
 		spec->gen.suppress_auto_mute = 1;
@@ -872,21 +853,38 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->gen.suppress_vmaster = 1;
 
 		/* GPIO 5 out, 3,4 in */
-		spec->gpio_dir = CS8409_CS42L42_RESET;
+		spec->gpio_dir = spec->scodecs[CS8409_CODEC0]->reset_gpio;
 		spec->gpio_data = 0;
 		spec->gpio_mask = 0x03f;
 
-		spec->cs42l42_hp_jack_in = 0;
-		spec->cs42l42_mic_jack_in = 0;
-		spec->cs42l42_suspended = 1;
-		spec->paged = 1;
-
 		/* Basic initial sequence for specific hw configuration */
 		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
 
 		cs8409_fix_caps(codec, CS8409_CS42L42_HP_PIN_NID);
 		cs8409_fix_caps(codec, CS8409_CS42L42_AMIC_PIN_NID);
 
+		/* Set TIP_SENSE_EN for analog front-end of tip sense.
+		 * Additionally set HSBIAS_SENSE_EN and Full Scale volume for some variants.
+		 */
+		switch (codec->fixup_id) {
+		case CS8409_WARLOCK:
+			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
+			break;
+		case CS8409_BULLSEYE:
+			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 0;
+			break;
+		case CS8409_CYBORG:
+			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x00a0;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
+			break;
+		default:
+			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0003;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
+			break;
+		}
+
 		break;
 	case HDA_FIXUP_ACT_PROBE:
 		/* Set initial DMIC volume to -26 dB */
@@ -910,7 +908,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		cs42l42_run_jack_detect(codec);
+		cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
 		usleep_range(100000, 150000);
 		break;
 	default:
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index ac68cca2bc11..817df295d594 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -216,8 +216,8 @@ enum cs8409_coefficient_index_registers {
 
 /* CS42L42 Specific Definitions */
 
+#define CS8409_MAX_CODECS			8
 #define CS42L42_VOLUMES				(4U)
-
 #define CS42L42_HP_VOL_REAL_MIN			(-63)
 #define CS42L42_HP_VOL_REAL_MAX			(0)
 #define CS42L42_AMIC_VOL_REAL_MIN		(-97)
@@ -243,8 +243,6 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
 #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
 
-#define CS42L42_INIT_REG_SEQ_SIZE		59
-
 enum {
 	CS8409_BULLSEYE,
 	CS8409_WARLOCK,
@@ -252,6 +250,10 @@ enum {
 	CS8409_FIXUPS,
 };
 
+enum {
+	CS8409_CODEC0,
+};
+
 enum {
 	CS42L42_VOL_ADC,
 	CS42L42_VOL_DAC,
@@ -268,25 +270,40 @@ struct cs8409_cir_param {
 	unsigned int coeff;
 };
 
+struct sub_codec {
+	struct hda_codec *codec;
+	unsigned int addr;
+	unsigned int reset_gpio;
+	unsigned int irq_mask;
+	const struct cs8409_i2c_param *init_seq;
+	unsigned int init_seq_num;
+
+	unsigned int hp_jack_in:1;
+	unsigned int mic_jack_in:1;
+	unsigned int suspended:1;
+	unsigned int paged:1;
+	unsigned int last_page;
+	unsigned int hsbias_hiz;
+	unsigned int full_scale_vol:1;
+
+	s8 vol[CS42L42_VOLUMES];
+};
+
 struct cs8409_spec {
 	struct hda_gen_spec gen;
 	struct hda_codec *codec;
 
+	struct sub_codec *scodecs[CS8409_MAX_CODECS];
+	unsigned int num_scodecs;
+
 	unsigned int gpio_mask;
 	unsigned int gpio_dir;
 	unsigned int gpio_data;
 
-	unsigned int cs42l42_hp_jack_in:1;
-	unsigned int cs42l42_mic_jack_in:1;
-	unsigned int cs42l42_suspended:1;
-	s8 vol[CS42L42_VOLUMES];
-
 	struct mutex i2c_mux;
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
-	unsigned int paged;
-	unsigned int last_page;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
@@ -305,9 +322,9 @@ extern const struct hda_model_fixup cs8409_models[];
 extern const struct hda_fixup cs8409_fixups[];
 extern const struct hda_verb cs8409_cs42l42_init_verbs[];
 extern const struct hda_pintbl cs8409_cs42l42_pincfgs[];
-extern const struct cs8409_i2c_param cs42l42_init_reg_seq[CS42L42_INIT_REG_SEQ_SIZE];
 extern const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[];
 extern const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[];
+extern struct sub_codec cs8409_cs42l42_codec;
 
 void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
 
-- 
2.25.1

