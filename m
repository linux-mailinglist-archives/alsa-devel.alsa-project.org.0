Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068D3E9843
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A2D18C2;
	Wed, 11 Aug 2021 21:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A2D18C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628708658;
	bh=kjYw/49acXCPkwCgvl1TrnDF6p62e2l448QNhRAMUyA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKdZ6Zm11KzHGL558QeOND6mQzHa70towSp7NukR41+TLpCF7pkyAB2s8+wNgdXWt
	 L8EUwJk6dKwsjRghpi4fkvDCc+q5fGwWC2WsAatkIFvfNYha4Ud0tZSpZrTEU/Ob/E
	 JQY6qDuBwXj8S/h/Tgi6YwrRZXyQN+DNgtAiXjd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD252F8055B;
	Wed, 11 Aug 2021 20:58:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22974F80558; Wed, 11 Aug 2021 20:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 279F9F804F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 20:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 279F9F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EqAXHCjR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17BIq9ws001296; 
 Wed, 11 Aug 2021 13:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Au1FadQedSfGMpGnHesKca9V/np6qZBMP0N29bTU8Zo=;
 b=EqAXHCjR6SVmR0Ry8dYCaaafQ1YKsDE4lN0tc0QT2qkl+6oqigzhGNgmjqsEUVXX7zz0
 XStODma4IEi89ruArx3PZmHP67bKrtk2r+DR7DYEmolzD8/MWyO/bFLawSFulfinIDwc
 +lqtLUWDFyoh+OiJYZTw0RUK1/Y1U781yF3JiBoRb/MvjVSErqHVtLRblgPXQ2xg6H6a
 6csbsdlFunU0yCQq5bzy2sfb+i5GXr03F8dyak2u90TDdy1v1MkDbSfw997ulVkQPw/t
 c4I/nmxoMZu7pYAOa0xAK8X+RQsnUSCfvPtlbd5d4g7a3aCQy0CEmBtR1wTV0uDE2PDH 5w== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3acgjkra4r-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 13:57:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:31 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6D62C45D;
 Wed, 11 Aug 2021 18:57:31 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 21/27] ALSA: hda/cs8409: Add support for dolphin
Date: Wed, 11 Aug 2021 19:56:48 +0100
Message-ID: <20210811185654.6837-22-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O3jw7_l7H1wHUyhwHxe9M3e_1G7763XY
X-Proofpoint-ORIG-GUID: O3jw7_l7H1wHUyhwHxe9M3e_1G7763XY
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110130
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

Dolphin devices have CS8409 HDA Bridge connected to two CS42L42 codecs.
Codec 1 supports Headphone and Headset Mic.
Codec 2 supports Line Out.

Features:
 - Front and Read Jacks appear as separate jacks; Removal or connection
   of on jack should not affect the connection of the other.
 - Front Jack only shows up on jack detection.
 - Rear Jack is Phantom Jack.
 - Separate Volume Controls for each Jack

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- Fixed sparse warnings : Reported-by: kernel test robot <lkp@intel.com>
 sound/pci/hda/patch_cs8409.c:1061:59: sparse: sparse: Using plain integer as NULL pointer

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c | 220 ++++++++++++++++++++++++++++
 sound/pci/hda/patch_cs8409.c        | 196 +++++++++++++++++++++++++
 sound/pci/hda/patch_cs8409.h        |  24 +++
 3 files changed, 440 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index be9feb84aaa2..6453a7ec3856 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -249,6 +249,210 @@ struct sub_codec cs8409_cs42l42_codec = {
 	.no_type_dect = 0,
 };
 
+/******************************************************************************
+ *                          Dolphin Specific Arrays
+ *                            CS8409/ 2 X CS42L42
+ ******************************************************************************/
+
+const struct hda_verb dolphin_init_verbs[] = {
+	{ 0x01, AC_VERB_SET_GPIO_WAKE_MASK, DOLPHIN_WAKE }, /* WAKE from GPIO 0,4 */
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_PROC_STATE, 0x0001 }, /* Enable VPW processing  */
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_COEF_INDEX, 0x0002 }, /* Configure GPIO 6,7 */
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_PROC_COEF,  0x0080 }, /* I2C mode */
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_COEF_INDEX, 0x005b }, /* Set I2C bus speed */
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_PROC_COEF,  0x0200 }, /* 100kHz I2C_STO = 2 */
+	{} /* terminator */
+};
+
+const struct hda_pintbl dolphin_pincfgs[] = {
+	{ 0x24, 0x022210f0 }, /* ASP-1-TX-A */
+	{ 0x25, 0x010240f0 }, /* ASP-1-TX-B */
+	{ 0x34, 0x02a21050 }, /* ASP-1-RX */
+	{} /* terminator */
+};
+
+/* Vendor specific HW configuration for CS42L42 */
+static const struct cs8409_i2c_param dolphin_c0_init_reg_seq[] = {
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
+	{ 0x1112, 0x00 },
+	{ 0x1113, 0x80 },
+	{ 0x1C03, 0xC0 },
+	{ 0x1101, 0x02 },
+	{ 0x1316, 0xff },
+	{ 0x1317, 0xff },
+	{ 0x1318, 0xff },
+	{ 0x1319, 0xff },
+	{ 0x131a, 0xff },
+	{ 0x131b, 0xff },
+	{ 0x131c, 0xff },
+	{ 0x131e, 0xff },
+	{ 0x131f, 0xff },
+	{ 0x1320, 0xff },
+	{ 0x1b79, 0xff },
+	{ 0x1b7a, 0xff }
+};
+
+static const struct cs8409_i2c_param dolphin_c1_init_reg_seq[] = {
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
+	{ 0x2A04, 0x80 },
+	{ 0x2A05, 0x02 },
+	{ 0x2A06, 0x00 },
+	{ 0x2A07, 0xA0 },
+	{ 0x2A01, 0x0C },
+	{ 0x2902, 0x00 },
+	{ 0x2903, 0x02 },
+	{ 0x2904, 0x00 },
+	{ 0x2905, 0x00 },
+	{ 0x2901, 0x00 },
+	{ 0x1101, 0x0E },
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
+	{ 0x1112, 0x00 },
+	{ 0x1113, 0x80 },
+	{ 0x1C03, 0xC0 },
+	{ 0x1101, 0x02 },
+	{ 0x1316, 0xff },
+	{ 0x1317, 0xff },
+	{ 0x1318, 0xff },
+	{ 0x1319, 0xff },
+	{ 0x131a, 0xff },
+	{ 0x131b, 0xff },
+	{ 0x131c, 0xff },
+	{ 0x131e, 0xff },
+	{ 0x131f, 0xff },
+	{ 0x1320, 0xff },
+	{ 0x1b79, 0xff },
+	{ 0x1b7a, 0xff }
+};
+
+/* Vendor specific hw configuration for CS8409 */
+const struct cs8409_cir_param dolphin_hw_cfg[] = {
+	/* +PLL1/2_EN, +I2C_EN */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG1, 0xb008 },
+	/* ASP1_EN=0, ASP1_STP=1 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG2, 0x0002 },
+	/* ASP1/2_BUS_IDLE=10, +GPIO_I2C */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG3, 0x0a80 },
+	/* ASP1.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_A_TX_CTRL1, 0x0800 },
+	/* ASP1.A: TX.RAP=0, TX.RSZ=24 bits, TX.RCS=32 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_A_TX_CTRL2, 0x0820 },
+	/* ASP1.B: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=128 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_B_TX_CTRL1, 0x0880 },
+	/* ASP1.B: TX.RAP=0, TX.RSZ=24 bits, TX.RCS=160 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_B_TX_CTRL2, 0x08a0 },
+	/* ASP1.A: RX.LAP=0, RX.LSZ=24 bits, RX.LCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_A_RX_CTRL1, 0x0800 },
+	/* ASP1.A: RX.RAP=0, RX.RSZ=24 bits, RX.RCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP1_A_RX_CTRL2, 0x0800 },
+	/* ASP1: LCHI = 00h */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL1, 0x8000 },
+	/* ASP1: MC/SC_SRCSEL=PLL1, LCPR=FFh */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL2, 0x28ff },
+	/* ASP1: MCEN=0, FSD=011, SCPOL_IN/OUT=0, SCDIV=1:4 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL3, 0x0062 },
+	/* ASP1/2_BEEP=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_BEEP_CFG, 0x0000 },
+	/* ASP1_EN=1, ASP1_STP=1 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG2, 0x0022 },
+	/* -PLL2_EN */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG1, 0x9008 },
+	/* ASP1_xxx_EN=1, ASP1_MCLK_EN=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_PAD_CFG_SLW_RATE_CTRL, 0x5400 },
+	/* test mode on */
+	{ CS8409_PIN_VENDOR_WIDGET, 0xc0, 0x9999 },
+	/* GPIO hysteresis = 30 us */
+	{ CS8409_PIN_VENDOR_WIDGET, 0xc5, 0x0000 },
+	/* test mode off */
+	{ CS8409_PIN_VENDOR_WIDGET, 0xc0, 0x0000 },
+	{} /* Terminator */
+};
+
+struct sub_codec dolphin_cs42l42_0 = {
+	.addr = DOLPHIN_C0_I2C_ADDR,
+	.reset_gpio = DOLPHIN_C0_RESET,
+	.irq_mask = DOLPHIN_C0_INT,
+	.init_seq = dolphin_c0_init_reg_seq,
+	.init_seq_num = ARRAY_SIZE(dolphin_c0_init_reg_seq),
+	.hp_jack_in = 0,
+	.mic_jack_in = 0,
+	.paged = 1,
+	.suspended = 1,
+	.no_type_dect = 0,
+};
+
+struct sub_codec dolphin_cs42l42_1 = {
+	.addr = DOLPHIN_C1_I2C_ADDR,
+	.reset_gpio = DOLPHIN_C1_RESET,
+	.irq_mask = DOLPHIN_C1_INT,
+	.init_seq = dolphin_c1_init_reg_seq,
+	.init_seq_num = ARRAY_SIZE(dolphin_c1_init_reg_seq),
+	.hp_jack_in = 0,
+	.mic_jack_in = 0,
+	.paged = 1,
+	.suspended = 1,
+	.no_type_dect = 1,
+};
+
 /******************************************************************************
  *                         CS8409 Patch Driver Structs
  *                    Arrays Used for all projects using CS8409
@@ -295,6 +499,11 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0AEE, "Cyborg", CS8409_CYBORG),
 	SND_PCI_QUIRK(0x1028, 0x0AEF, "Cyborg", CS8409_CYBORG),
 	SND_PCI_QUIRK(0x1028, 0x0AF0, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AD0, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0AD1, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0AD2, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0AD3, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0ACF, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
@@ -303,6 +512,7 @@ const struct hda_model_fixup cs8409_models[] = {
 	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
 	{ .id = CS8409_WARLOCK, .name = "warlock" },
 	{ .id = CS8409_CYBORG, .name = "cyborg" },
+	{ .id = CS8409_DOLPHIN, .name = "dolphin" },
 	{}
 };
 
@@ -329,4 +539,14 @@ const struct hda_fixup cs8409_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs8409_cs42l42_fixups,
 	},
+	[CS8409_DOLPHIN] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = dolphin_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_DOLPHIN_FIXUPS,
+	},
+	[CS8409_DOLPHIN_FIXUPS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = dolphin_fixups,
+	},
 };
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 7ea46c83ac86..daf9c07d10c4 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -941,6 +941,202 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 	}
 }
 
+/******************************************************************************
+ *                          Dolphin Specific Functions
+ *                               CS8409/ 2 X CS42L42
+ ******************************************************************************/
+
+/*
+ * In the case of CS8409 we do not have unsolicited events when
+ * hs mic and hp are connected. Companion codec CS42L42 will
+ * generate interrupt via irq_mask to notify jack events. We have to overwrite
+ * generic snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers
+ * and then notify status via generic snd_hda_jack_unsol_event() call.
+ */
+static void dolphin_jack_unsol_event(struct hda_codec *codec, unsigned int res)
+{
+	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42;
+	struct hda_jack_tbl *jk;
+
+	cs42l42 = spec->scodecs[CS8409_CODEC0];
+	if (!cs42l42->suspended && (~res & cs42l42->irq_mask) &&
+	    cs42l42_jack_unsol_event(cs42l42)) {
+		jk = snd_hda_jack_tbl_get_mst(codec, DOLPHIN_HP_PIN_NID, 0);
+		if (jk)
+			snd_hda_jack_unsol_event(codec,
+						 (jk->tag << AC_UNSOL_RES_TAG_SHIFT) &
+						  AC_UNSOL_RES_TAG);
+
+		jk = snd_hda_jack_tbl_get_mst(codec, DOLPHIN_AMIC_PIN_NID, 0);
+		if (jk)
+			snd_hda_jack_unsol_event(codec,
+						 (jk->tag << AC_UNSOL_RES_TAG_SHIFT) &
+						  AC_UNSOL_RES_TAG);
+	}
+
+	cs42l42 = spec->scodecs[CS8409_CODEC1];
+	if (!cs42l42->suspended && (~res & cs42l42->irq_mask) &&
+	    cs42l42_jack_unsol_event(cs42l42)) {
+		jk = snd_hda_jack_tbl_get_mst(codec, DOLPHIN_LO_PIN_NID, 0);
+		if (jk)
+			snd_hda_jack_unsol_event(codec,
+						 (jk->tag << AC_UNSOL_RES_TAG_SHIFT) &
+						  AC_UNSOL_RES_TAG);
+	}
+}
+
+/* Vendor specific HW configuration
+ * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
+ */
+static void dolphin_hw_init(struct hda_codec *codec)
+{
+	const struct cs8409_cir_param *seq = dolphin_hw_cfg;
+	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42;
+	int i;
+
+	if (spec->gpio_mask) {
+		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_MASK,
+				    spec->gpio_mask);
+		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DIRECTION,
+				    spec->gpio_dir);
+		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA,
+				    spec->gpio_data);
+	}
+
+	for (; seq->nid; seq++)
+		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
+
+	for (i = 0; i < spec->num_scodecs; i++) {
+		cs42l42 = spec->scodecs[i];
+		cs42l42_resume(cs42l42);
+	}
+
+	/* Enable Unsolicited Response */
+	cs8409_enable_ur(codec, 1);
+}
+
+static const struct hda_codec_ops cs8409_dolphin_patch_ops = {
+	.build_controls = cs8409_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cs8409_init,
+	.free = cs8409_free,
+	.unsol_event = dolphin_jack_unsol_event,
+#ifdef CONFIG_PM
+	.suspend = cs8409_cs42l42_suspend,
+#endif
+};
+
+static int dolphin_exec_verb(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
+			     unsigned int *res)
+{
+	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
+	struct cs8409_spec *spec = codec->spec;
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
+
+	unsigned int nid = ((cmd >> 20) & 0x07f);
+	unsigned int verb = ((cmd >> 8) & 0x0fff);
+
+	/* CS8409 pins have no AC_PINSENSE_PRESENCE
+	 * capabilities. We have to intercept calls for CS42L42 pins
+	 * and return correct pin sense values for read_pin_sense() call from
+	 * hda_jack based on CS42L42 jack detect status.
+	 */
+	switch (nid) {
+	case DOLPHIN_HP_PIN_NID:
+	case DOLPHIN_LO_PIN_NID:
+		if (nid == DOLPHIN_LO_PIN_NID)
+			cs42l42 = spec->scodecs[CS8409_CODEC1];
+		if (verb == AC_VERB_GET_PIN_SENSE) {
+			*res = (cs42l42->hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			return 0;
+		}
+		break;
+	case DOLPHIN_AMIC_PIN_NID:
+		if (verb == AC_VERB_GET_PIN_SENSE) {
+			*res = (cs42l42->mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return spec->exec_verb(dev, cmd, flags, res);
+}
+
+void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	struct cs8409_spec *spec = codec->spec;
+	struct snd_kcontrol_new *kctrl;
+	int i;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_add_verbs(codec, dolphin_init_verbs);
+		/* verb exec op override */
+		spec->exec_verb = codec->core.exec_verb;
+		codec->core.exec_verb = dolphin_exec_verb;
+
+		spec->scodecs[CS8409_CODEC0] = &dolphin_cs42l42_0;
+		spec->scodecs[CS8409_CODEC0]->codec = codec;
+		spec->scodecs[CS8409_CODEC1] = &dolphin_cs42l42_1;
+		spec->scodecs[CS8409_CODEC1]->codec = codec;
+		spec->num_scodecs = 2;
+
+		codec->patch_ops = cs8409_dolphin_patch_ops;
+
+		/* GPIO 1,5 out, 0,4 in */
+		spec->gpio_dir = spec->scodecs[CS8409_CODEC0]->reset_gpio |
+				 spec->scodecs[CS8409_CODEC1]->reset_gpio;
+		spec->gpio_data = 0;
+		spec->gpio_mask = 0x03f;
+
+		/* Basic initial sequence for specific hw configuration */
+		snd_hda_sequence_write(codec, dolphin_init_verbs);
+
+		snd_hda_jack_add_kctl(codec, DOLPHIN_LO_PIN_NID, "Line Out", true,
+				      SND_JACK_HEADPHONE, NULL);
+
+		cs8409_fix_caps(codec, DOLPHIN_HP_PIN_NID);
+		cs8409_fix_caps(codec, DOLPHIN_LO_PIN_NID);
+		cs8409_fix_caps(codec, DOLPHIN_AMIC_PIN_NID);
+
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		snd_hda_gen_add_kctl(&spec->gen, "Headphone Playback Volume",
+				     &cs42l42_dac_volume_mixer);
+		snd_hda_gen_add_kctl(&spec->gen, "Mic Capture Volume", &cs42l42_adc_volume_mixer);
+		kctrl = snd_hda_gen_add_kctl(&spec->gen, "Line Out Playback Volume",
+					     &cs42l42_dac_volume_mixer);
+		/* Update Line Out kcontrol template */
+		kctrl->private_value = HDA_COMPOSE_AMP_VAL_OFS(DOLPHIN_HP_PIN_NID, 3, CS8409_CODEC1,
+				       HDA_OUTPUT, CS42L42_VOL_DAC) | HDA_AMP_VAL_MIN_MUTE;
+		cs8409_enable_ur(codec, 0);
+		dolphin_hw_init(codec);
+		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		dolphin_hw_init(codec);
+		fallthrough;
+	case HDA_FIXUP_ACT_BUILD:
+		/* Run jack auto detect first time on boot
+		 * after controls have been added, to check if jack has
+		 * been already plugged in.
+		 * Run immediately after init.
+		 */
+		for (i = 0; i < spec->num_scodecs; i++) {
+			cs42l42_run_jack_detect(spec->scodecs[i]);
+			usleep_range(100000, 150000);
+		}
+
+		break;
+	default:
+		break;
+	}
+}
+
 static int patch_cs8409(struct hda_codec *codec)
 {
 	int err;
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index a105c3c9023d..1b5a8d04ba0f 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -243,15 +243,32 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
 #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
 
+/* Dolphin */
+
+#define DOLPHIN_C0_I2C_ADDR			(0x48 << 1)
+#define DOLPHIN_C1_I2C_ADDR			(0x49 << 1)
+#define DOLPHIN_HP_PIN_NID			CS8409_PIN_ASP1_TRANSMITTER_A
+#define DOLPHIN_LO_PIN_NID			CS8409_PIN_ASP1_TRANSMITTER_B
+#define DOLPHIN_AMIC_PIN_NID			CS8409_PIN_ASP1_RECEIVER_A
+
+#define DOLPHIN_C0_INT				GENMASK(4, 4)
+#define DOLPHIN_C1_INT				GENMASK(0, 0)
+#define DOLPHIN_C0_RESET			GENMASK(5, 5)
+#define DOLPHIN_C1_RESET			GENMASK(1, 1)
+#define DOLPHIN_WAKE				(DOLPHIN_C0_INT | DOLPHIN_C1_INT)
+
 enum {
 	CS8409_BULLSEYE,
 	CS8409_WARLOCK,
 	CS8409_CYBORG,
 	CS8409_FIXUPS,
+	CS8409_DOLPHIN,
+	CS8409_DOLPHIN_FIXUPS,
 };
 
 enum {
 	CS8409_CODEC0,
+	CS8409_CODEC1
 };
 
 enum {
@@ -327,6 +344,13 @@ extern const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[];
 extern const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[];
 extern struct sub_codec cs8409_cs42l42_codec;
 
+extern const struct hda_verb dolphin_init_verbs[];
+extern const struct hda_pintbl dolphin_pincfgs[];
+extern const struct cs8409_cir_param dolphin_hw_cfg[];
+extern struct sub_codec dolphin_cs42l42_0;
+extern struct sub_codec dolphin_cs42l42_1;
+
 void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
+void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
 
 #endif
-- 
2.25.1

