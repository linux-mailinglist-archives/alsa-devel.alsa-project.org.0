Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FF85F33D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 09:42:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97D0F844;
	Thu, 22 Feb 2024 09:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97D0F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708591366;
	bh=lYyjLUUJ2Z1AXSA/0KpxiJQgBWFsftySzdQFFlcRDxc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IKof9+jxO4ua8si5cCsWgMlnDMuFwSTdzeshBXLXb8R9RAEIF3l6eH610qk9fitIa
	 NQt3g7Nam9SJpcbV2id8cnKQ3i8chPTPOqRbXdfFWKqacuxgp7YEY6eL6UwYHvrc6M
	 LKh5B0+XsAZk7+HO8fdT+lllhEvKAtGJ1eC+Eekk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0656FF805CA; Thu, 22 Feb 2024 09:41:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC8A9F805CA;
	Thu, 22 Feb 2024 09:41:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909B4F80568; Thu, 22 Feb 2024 09:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B44FF8047D
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 09:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B44FF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=FqVREOVy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bi/iEdDuj1yI9f2r8Iq+UxmvAlAVnVfsbPcVzI+OFrTok0LHDHmyWM/HDntd6KDDxDQslpEH3wTmUaCJttFv8Hsm0XRFYWYyrQ0QsGDEi9H2ByhKAH9OUfkRmBUhILJHzkP68XPtyptzGVvDD5C9dbW0qPAiNRrSkok/aqrKKP/qG6DafACipNk598INadhJvW28iQ0t/tym7EZ08/5wm6P7DZhRI8H6gYcBB24cDvZbJu4kgqXCVLakZPvaCwIWHOpVBl1vPQ4Im7ZNQpNHt6DTkgGcVwe3d3LAL5Dr0w4KgrP6deEB1g83hGUsu5HUd2VjZlgPEPZcWOBLnn2U/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/pDt/kFVBPLvJFrH5r3ibF6avzv8uSqxyQXJlWomB0=;
 b=Jud6EhBujbtoLqjHGiGP4So04YCu8sQfAYh4cY5PKkU1s6jelIvjHZ3QmgQUbE1FX0I5KqYJ8UdHHTP9nwZFpICxuNZlqFgG8ocotfY6eyXN+WCyjjDVVDwcecwnhod1ZPg3RBNY6DDggTGeiIOmiPRd0FniYo5V2z4Ojd+FElPpDW/0vPNXlX1UGRPcj45jbEPkS4Tb6+eVKxnrXaX3Dj1owaNGTQuqKZTvrDnzv7nMxn8byxHVUNowwmtVgvHJHwYuHxuFBIXbZUWzq6fvnSH9Z7f4lqElW9PtsnLjpDnW0qV0JFbBph5CEeyr2geXRkpUR8bRlGXxqjLrORHFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/pDt/kFVBPLvJFrH5r3ibF6avzv8uSqxyQXJlWomB0=;
 b=FqVREOVyovGHgFMTJJI5/BjkV9SP6oeh9WVFDp8R9F9OeRWjVxbHUcrl8kyzhssqTCiDL4QnmzH0Ekjm9TpuT01BkFgBPNO/NxufZ3rbWGgD5SUzWwKyTbJmDD8qweeTdEUgc0AIXBOgS9a/nf1s4u3HpS8HkFDesmneJF+gQKg=
Received: from PSBPR02CA0018.apcprd02.prod.outlook.com (2603:1096:301::28) by
 PUZPR03MB7233.apcprd03.prod.outlook.com (2603:1096:301:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 08:38:48 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::3f) by PSBPR02CA0018.outlook.office365.com
 (2603:1096:301::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 08:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 08:38:47 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Feb
 2024 16:38:45 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Thu, 22 Feb
 2024 16:38:44 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 22 Feb 2024 16:38:44 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 2/2] ASoC: nau8325: new driver
Date: Thu, 22 Feb 2024 16:38:25 +0800
Message-ID: <20240222083825.190854-3-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222083825.190854-1-wtli@nuvoton.com>
References: <20240222083825.190854-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|PUZPR03MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb79df3-fc61-4d9a-dbd6-08dc3381b035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y4AjAt+O9dwC5Qyp+0pmGI9texr/R+3Owpc5D+/bBe2zDyH+tC7nENsWRUQnA8OXYzH67uNEoMB0hdeOkJfg7vgh1iyUhwfBhDK7zFJWbXvWE064O18DqRhzljo7a0HX6rJBdHEVGIrHIXvYYXY2yJ/3EYlSrIo4JPVxIt1rn9BR09KvthK36fmQpREhGd+r2InAaM5XBiMYeZLCeKYLPAIwRzUhiux89gZEFwE8maJCLnrugr8c6TjQfIDmE0//kgmYC7f2UpjZN1aAj1WN/VJ1dvkAo+YGP06FLZVQD2Ez8OcGhmJAEo+2CAZKGxsMZrKZzB19MPxoSuFdmATu6ybHv9VYn+CN+GGOUKOJNojfeN1DuUzFsrvS8ZUgEMRwfgXkWz2dY8AaR7IMTr64rGcAfGbHrr3XJZpZFhpe/DeKgKqlNOZEqjcHyQmrIv05pwKu2Or+pz8dPIacyHj1f9i1epHgw7n35TMKGcKI15KY2aayXYTJ7gNis6wyDZxCrVu6Ib6QyaoWrB18oXrjZpKuqHWQjRjqQ3YjhTqVpM/groqAU9X2Yiyp27dH1dTM3a8LXaj7NfJ3XPFRgTVrFtiGfEUHt3tFt5SabjRyxnY20wKOr+4a6olzlhlyFgYa/D9DrZO1+dV7eI6glJ7EMtywV9Y4nkEQyOK8O1/UhF4=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 08:38:47.8010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfb79df3-fc61-4d9a-dbd6-08dc3381b035
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7233
Message-ID-Hash: IPHQBY43MUCY7SQHJO3X5JPZENE7RWVF
X-Message-ID-Hash: IPHQBY43MUCY7SQHJO3X5JPZENE7RWVF
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is for amplifiers NAU8325 of Nuvoton Technology Corporation.
The NAU8325 is a stereo high efficiency filter-free Class-D audio
amplifier, which is capable of driving a 4ohm load with up to 3W output
power.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8325.c | 856 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8325.h | 391 +++++++++++++++++
 2 files changed, 1247 insertions(+)
 create mode 100755 sound/soc/codecs/nau8325.c
 create mode 100644 sound/soc/codecs/nau8325.h

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
new file mode 100755
index 000000000000..15d6fe7b731c
--- /dev/null
+++ b/sound/soc/codecs/nau8325.c
@@ -0,0 +1,856 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// nau8325.c -- Nuvoton NAU8325 audio codec driver
+//
+// Copyright 2023 Nuvoton Technology Crop.
+// Author: Seven Lee <WTLI@nuvoton.com>
+//	   David Lin <CTLIN0@nuvoton.com>
+//
+
+#include <linux/clk.h>
+#include <sound/core.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <sound/initval.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include "nau8325.h"
+
+/* Range of Master Clock MCLK (Hz) */
+#define MASTER_CLK_MAX 49152000
+#define MASTER_CLK_MIN 2048000
+
+/* scaling for MCLK source */
+#define CLK_PROC_BYPASS (-1)
+
+/* the maximum CLK_DAC */
+#define CLK_DA_AD_MAX 6144000
+
+/* from MCLK input */
+#define MCLK_SRC 4
+
+static const struct nau8325_src_attr mclk_n1_div[] = {
+	{ 1, 0x0 },
+	{ 2, 0x1 },
+	{ 3, 0x2 },
+};
+
+/* over sampling rate */
+static const struct nau8325_osr_attr osr_dac_sel[] = {
+	{ 64, 2 },	/* OSR 64, SRC 1/4 */
+	{ 256, 0 },	/* OSR 256, SRC 1 */
+	{ 128, 1 },	/* OSR 128, SRC 1/2 */
+	{ 0, 0 },
+	{ 32, 3 },	/* OSR 32, SRC 1/8 */
+};
+
+static const struct nau8325_src_attr mclk_n2_div[] = {
+	{ 0, 0x0 },
+	{ 1, 0x1 },
+	{ 2, 0x2 },
+	{ 3, 0x3 },
+	{ 4, 0x4 },
+};
+
+static const struct nau8325_src_attr mclk_n3_mult[] = {
+	{ 0, 0x1 },
+	{ 1, 0x2 },
+	{ 2, 0x3 },
+	{ 3, 0x4 },
+};
+
+/* Sample Rate and MCLK_SRC selections */
+static const struct nau8325_srate_attr target_srate_table[] = {
+	/* { FS, range, max, { MCLK source }} */
+	{ 48000, 2, true, { 12288000, 19200000, 24000000 } },
+	{ 16000, 1, false, { 4096000, 6400000, 8000000 } },
+	{ 8000, 0, false, { 2048000, 3200000, 4000000 }},
+	{ 44100, 2, true, { 11289600, 17640000, 22050000 }},
+	{ 64000, 3, false, { 16384000, 25600000, 32000000 } },
+	{ 96000, 3, true, { 24576000, 38400000, 48000000 } },
+	{ 12000, 0, true, { 3072000, 4800000, 6000000 } },
+	{ 24000, 1, true, { 6144000, 9600000, 12000000 } },
+	{ 32000, 2, false, { 8192000, 12800000, 16000000 } },
+};
+
+static const struct reg_default nau8325_reg_defaults[] = {
+	{ NAU8325_R00_HARDWARE_RST, 0x0000 },
+	{ NAU8325_R01_SOFTWARE_RST, 0x0000 },
+	{ NAU8325_R03_CLK_CTRL, 0x0000 },
+	{ NAU8325_R04_ENA_CTRL, 0x0000 },
+	{ NAU8325_R05_INTERRUPT_CTRL, 0x007f },
+	{ NAU8325_R09_IRQOUT, 0x0000 },
+	{ NAU8325_R0A_IO_CTRL, 0x0000 },
+	{ NAU8325_R0B_PDM_CTRL, 0x0000 },
+	{ NAU8325_R0C_TDM_CTRL, 0x0000 },
+	{ NAU8325_R0D_I2S_PCM_CTRL1, 0x000a },
+	{ NAU8325_R0E_I2S_PCM_CTRL2, 0x0000 },
+	{ NAU8325_R0F_L_TIME_SLOT, 0x0000 },
+	{ NAU8325_R10_R_TIME_SLOT, 0x0000 },
+	{ NAU8325_R11_HPF_CTRL, 0x0000 },
+	{ NAU8325_R12_MUTE_CTRL, 0x0000 },
+	{ NAU8325_R13_DAC_VOLUME, 0xf3f3 },
+	{ NAU8325_R29_DAC_CTRL1, 0x0081 },
+	{ NAU8325_R2A_DAC_CTRL2, 0x0000 },
+	{ NAU8325_R2C_ALC_CTRL1, 0x000e },
+	{ NAU8325_R2D_ALC_CTRL2, 0x8400 },
+	{ NAU8325_R2E_ALC_CTRL3, 0x0000 },
+	{ NAU8325_R2F_ALC_CTRL4, 0x003f },
+	{ NAU8325_R40_CLK_DET_CTRL, 0xa801 },
+	{ NAU8325_R50_MIXER_CTRL, 0x0000 },
+	{ NAU8325_R55_MISC_CTRL, 0x0000 },
+	{ NAU8325_R60_BIAS_ADJ, 0x0000 },
+	{ NAU8325_R61_ANALOG_CONTROL_1, 0x0000 },
+	{ NAU8325_R62_ANALOG_CONTROL_2, 0x0000 },
+	{ NAU8325_R63_ANALOG_CONTROL_3, 0x0000 },
+	{ NAU8325_R64_ANALOG_CONTROL_4, 0x0000 },
+	{ NAU8325_R65_ANALOG_CONTROL_5, 0x0000 },
+	{ NAU8325_R66_ANALOG_CONTROL_6, 0x0000 },
+	{ NAU8325_R69_CLIP_CTRL, 0x0000 },
+	{ NAU8325_R73_RDAC, 0x0008 },
+};
+
+static bool nau8325_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8325_R02_DEVICE_ID ... NAU8325_R06_INT_CLR_STATUS:
+	case NAU8325_R09_IRQOUT ... NAU8325_R13_DAC_VOLUME:
+	case NAU8325_R1D_DEBUG_READ1:
+	case NAU8325_R1F_DEBUG_READ2:
+	case NAU8325_R22_DEBUG_READ3:
+	case NAU8325_R29_DAC_CTRL1 ... NAU8325_R2A_DAC_CTRL2:
+	case NAU8325_R2C_ALC_CTRL1 ... NAU8325_R2F_ALC_CTRL4:
+	case NAU8325_R40_CLK_DET_CTRL:
+	case NAU8325_R49_TEST_STATUS ... NAU8325_R4A_ANALOG_READ:
+	case NAU8325_R50_MIXER_CTRL:
+	case NAU8325_R55_MISC_CTRL:
+	case NAU8325_R60_BIAS_ADJ ... NAU8325_R66_ANALOG_CONTROL_6:
+	case NAU8325_R69_CLIP_CTRL:
+	case NAU8325_R73_RDAC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool nau8325_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8325_R00_HARDWARE_RST:
+	case NAU8325_R03_CLK_CTRL ... NAU8325_R06_INT_CLR_STATUS:
+	case NAU8325_R09_IRQOUT ... NAU8325_R13_DAC_VOLUME:
+	case NAU8325_R29_DAC_CTRL1 ... NAU8325_R2A_DAC_CTRL2:
+	case NAU8325_R2C_ALC_CTRL1 ... NAU8325_R2F_ALC_CTRL4:
+	case NAU8325_R40_CLK_DET_CTRL:
+	case NAU8325_R50_MIXER_CTRL:
+	case NAU8325_R55_MISC_CTRL:
+	case NAU8325_R60_BIAS_ADJ ... NAU8325_R66_ANALOG_CONTROL_6:
+	case NAU8325_R69_CLIP_CTRL:
+	case NAU8325_R73_RDAC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool nau8325_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8325_R00_HARDWARE_RST ... NAU8325_R02_DEVICE_ID:
+	case NAU8325_R06_INT_CLR_STATUS:
+	case NAU8325_R1D_DEBUG_READ1:
+	case NAU8325_R1F_DEBUG_READ2:
+	case NAU8325_R22_DEBUG_READ3:
+	case NAU8325_R4A_ANALOG_READ:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const char * const nau8325_dac_oversampl[] = {
+	"64", "256", "128", "", "32" };
+
+static const struct soc_enum nau8325_dac_oversampl_enum =
+	SOC_ENUM_SINGLE(NAU8325_R29_DAC_CTRL1, NAU8325_DAC_OVERSAMPLE_SFT,
+			ARRAY_SIZE(nau8325_dac_oversampl),
+			nau8325_dac_oversampl);
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(dac_vol_tlv, -8000, 600);
+
+static const struct snd_kcontrol_new nau8325_snd_controls[] = {
+	SOC_ENUM("DAC Oversampling Rate", nau8325_dac_oversampl_enum),
+	SOC_DOUBLE_TLV("Speaker Volume", NAU8325_R13_DAC_VOLUME,
+		       NAU8325_DAC_VOLUME_L_SFT, NAU8325_DAC_VOLUME_R_SFT,
+		       NAU8325_DAC_VOLUME_R_EN, 0, dac_vol_tlv),
+	SOC_SINGLE("ALC Max Gain", NAU8325_R2C_ALC_CTRL1,
+		   NAU8325_ALC_MAXGAIN_SFT, NAU8325_ALC_MAXGAIN_MAX, 0),
+	SOC_SINGLE("ALC Min Gain", NAU8325_R2C_ALC_CTRL1,
+		   NAU8325_ALC_MINGAIN_SFT, NAU8325_ALC_MINGAIN_MAX, 0),
+	SOC_SINGLE("ALC Decay Timer", NAU8325_R2D_ALC_CTRL2,
+		   NAU8325_ALC_DCY_SFT, NAU8325_ALC_DCY_MAX, 0),
+	SOC_SINGLE("ALC Attack Timer", NAU8325_R2D_ALC_CTRL2,
+		   NAU8325_ALC_ATK_SFT, NAU8325_ALC_ATK_MAX, 0),
+	SOC_SINGLE("ALC Hold Time", NAU8325_R2D_ALC_CTRL2,
+		   NAU8325_ALC_HLD_SFT, NAU8325_ALC_HLD_MAX, 0),
+	SOC_SINGLE("ALC Target Level", NAU8325_R2D_ALC_CTRL2,
+		   NAU8325_ALC_LVL_SFT, NAU8325_ALC_LVL_MAX, 0),
+	SOC_SINGLE("ALC Enable Switch", NAU8325_R2E_ALC_CTRL3,
+		   NAU8325_ALC_EN_SFT, 1, 0),
+};
+
+static int nau8325_dac_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(nau8325->regmap, NAU8325_R12_MUTE_CTRL,
+				   NAU8325_SOFT_MUTE, 0);
+		msleep(30);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Soft mute the output to prevent the pop noise. */
+		regmap_update_bits(nau8325->regmap, NAU8325_R12_MUTE_CTRL,
+				   NAU8325_SOFT_MUTE, NAU8325_SOFT_MUTE);
+		msleep(30);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nau8325_powerup_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+
+	if (nau8325->clock_detection)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(nau8325->regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_PWRUP_DFT, NAU8325_PWRUP_DFT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_update_bits(nau8325->regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_PWRUP_DFT, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget nau8325_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("Power Up", SND_SOC_NOPM, 0, 0,
+			    nau8325_powerup_event, SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("DACL", NULL, NAU8325_R04_ENA_CTRL,
+			   NAU8325_DAC_LEFT_CH_EN_SFT, 0, nau8325_dac_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC_E("DACR", NULL, NAU8325_R04_ENA_CTRL,
+			   NAU8325_DAC_RIGHT_CH_EN_SFT, 0, nau8325_dac_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_AIF_IN("AIFRX", "Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_OUTPUT("SPKL"),
+	SND_SOC_DAPM_OUTPUT("SPKR"),
+};
+
+static const struct snd_soc_dapm_route nau8325_dapm_routes[] = {
+	{ "DACL", NULL, "Power Up" },
+	{ "DACR", NULL, "Power Up" },
+
+	{ "DACL", NULL, "AIFRX" },
+	{ "DACR", NULL, "AIFRX" },
+	{ "SPKL", NULL, "DACL" },
+	{ "SPKR", NULL, "DACR" },
+};
+
+static int nau8325_srate_clk_apply(struct nau8325 *nau8325,
+				   const struct nau8325_srate_attr *srate_table,
+				   int n1_sel, int mclk_mult_sel, int n2_sel)
+{
+	if (!srate_table || n2_sel < 0 || n2_sel >= ARRAY_SIZE(mclk_n2_div) ||
+	    n1_sel < 0 || n1_sel >= ARRAY_SIZE(mclk_n1_div)) {
+		dev_err(nau8325->dev, "The CLK isn't supported.");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(nau8325->regmap, NAU8325_R40_CLK_DET_CTRL,
+			   NAU8325_REG_SRATE_MASK | NAU8325_REG_DIV_MAX,
+			   (srate_table->range << NAU8325_REG_SRATE_SFT) |
+			   (srate_table->max ? NAU8325_REG_DIV_MAX : 0));
+	regmap_update_bits(nau8325->regmap, NAU8325_R03_CLK_CTRL,
+			   NAU8325_MCLK_SRC_MASK, mclk_n2_div[n2_sel].val);
+	regmap_update_bits(nau8325->regmap, NAU8325_R03_CLK_CTRL,
+			   NAU8325_CLK_MUL_SRC_MASK,
+			   mclk_n1_div[n1_sel].val << NAU8325_CLK_MUL_SRC_SFT);
+
+	if (mclk_mult_sel != CLK_PROC_BYPASS) {
+		regmap_update_bits(nau8325->regmap, NAU8325_R03_CLK_CTRL,
+				   NAU8325_MCLK_SEL_MASK,
+				   mclk_n3_mult[mclk_mult_sel].val <<
+				   NAU8325_MCLK_SEL_SFT);
+	} else {
+		regmap_update_bits(nau8325->regmap, NAU8325_R03_CLK_CTRL,
+				   NAU8325_MCLK_SEL_MASK, 0);
+	}
+
+	switch (mclk_mult_sel) {
+	case 2:
+		regmap_update_bits(nau8325->regmap, NAU8325_R65_ANALOG_CONTROL_5,
+				   NAU8325_MCLK4XEN_EN, NAU8325_MCLK4XEN_EN);
+		break;
+	case 3:
+		regmap_update_bits(nau8325->regmap, NAU8325_R65_ANALOG_CONTROL_5,
+				   NAU8325_MCLK4XEN_EN | NAU8325_MCLK8XEN_EN,
+				   NAU8325_MCLK4XEN_EN | NAU8325_MCLK8XEN_EN);
+		break;
+	default:
+		regmap_update_bits(nau8325->regmap, NAU8325_R65_ANALOG_CONTROL_5,
+				   NAU8325_MCLK4XEN_EN | NAU8325_MCLK8XEN_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int nau8325_clksrc_n2(struct nau8325 *nau8325,
+			     const struct nau8325_srate_attr *srate_table,
+			     int mclk, int *n2_sel)
+{
+	int i, mclk_src, ratio;
+
+	ratio = NAU8325_MCLK_FS_RATIO_NUM;
+	for (i = 0; i < ARRAY_SIZE(mclk_n2_div); i++) {
+		mclk_src = mclk >> mclk_n2_div[i].param;
+		if (srate_table->mclk_src[NAU8325_MCLK_FS_RATIO_256] == mclk_src) {
+			ratio = NAU8325_MCLK_FS_RATIO_256;
+			break;
+		} else if (srate_table->mclk_src[NAU8325_MCLK_FS_RATIO_400] == mclk_src) {
+			ratio = NAU8325_MCLK_FS_RATIO_400;
+			break;
+		} else if (srate_table->mclk_src[NAU8325_MCLK_FS_RATIO_500] == mclk_src) {
+			ratio = NAU8325_MCLK_FS_RATIO_500;
+			break;
+		}
+	}
+	if (ratio != NAU8325_MCLK_FS_RATIO_NUM)
+		*n2_sel = i;
+
+	return ratio;
+}
+
+static const struct nau8325_srate_attr *target_srate_attribute(int srate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(target_srate_table); i++)
+		if (target_srate_table[i].fs == srate)
+			break;
+
+	if (i == ARRAY_SIZE(target_srate_table))
+		goto proc_err;
+
+	return &target_srate_table[i];
+
+proc_err:
+	return NULL;
+}
+
+static int nau8325_clksrc_choose(struct nau8325 *nau8325,
+				 const struct nau8325_srate_attr **srate_table,
+				 int *n1_sel, int *mult_sel, int *n2_sel)
+{
+	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
+
+	if (!nau8325->mclk || !nau8325->fs)
+		goto proc_err;
+
+	/* select sampling rate and MCLK_SRC */
+	*srate_table = target_srate_attribute(nau8325->fs);
+	if (!*srate_table)
+		goto proc_err;
+
+	/* First check clock from MCLK directly, decide N2 for MCLK_SRC.
+	 * If not good, consider 1/N1 and Multiplier.
+	 */
+	ratio = nau8325_clksrc_n2(nau8325, *srate_table, nau8325->mclk, n2_sel);
+	if (ratio != NAU8325_MCLK_FS_RATIO_NUM) {
+		*n1_sel = 0;
+		*mult_sel = CLK_PROC_BYPASS;
+		*n2_sel = MCLK_SRC;
+		goto proc_done;
+	}
+
+	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
+	mclk_max = 0;
+	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
+		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
+			mclk = nau8325->mclk << mclk_n3_mult[j].param;
+			mclk = mclk / mclk_n1_div[i].param;
+			ratio = nau8325_clksrc_n2(nau8325,
+						  *srate_table, mclk, n2_sel);
+			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
+			    (mclk_max < mclk || i > *n1_sel)) {
+				mclk_max = mclk;
+				n2_max = *n2_sel;
+				*n1_sel = i;
+				*mult_sel = j;
+				ratio_sel = ratio;
+					goto proc_done;
+			}
+		}
+	}
+	if (mclk_max) {
+		*n2_sel = n2_max;
+		ratio = ratio_sel;
+		goto proc_done;
+	}
+
+proc_err:
+	dev_err(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",
+		nau8325->mclk, nau8325->fs);
+	return -EINVAL;
+proc_done:
+	dev_err(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
+		nau8325->fs, (*srate_table)->range,
+		(*srate_table)->max ? "MAX" : "MIN",
+		*n1_sel == CLK_PROC_BYPASS ?
+		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
+		*mult_sel == CLK_PROC_BYPASS ?
+		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
+		1 << mclk_n2_div[*n2_sel].param,
+		(*srate_table)->mclk_src[ratio],
+		(*srate_table)->mclk_src[ratio] / nau8325->fs);
+
+	return 0;
+}
+
+static int nau8325_clock_config(struct nau8325 *nau8325)
+{
+	const struct nau8325_srate_attr *srate_table;
+	int ret, n1_sel, mult_sel, n2_sel;
+
+	ret = nau8325_clksrc_choose(nau8325, &srate_table,
+				    &n1_sel, &mult_sel, &n2_sel);
+	if (ret)
+		goto err;
+
+	ret = nau8325_srate_clk_apply(nau8325, srate_table,
+				      n1_sel, mult_sel, n2_sel);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	return ret;
+}
+
+static const struct nau8325_osr_attr *nau8325_get_osr(struct nau8325 *nau8325)
+{
+	unsigned int osr;
+
+	regmap_read(nau8325->regmap, NAU8325_R29_DAC_CTRL1, &osr);
+	osr &= NAU8325_DAC_OVERSAMPLE_MASK;
+	if (osr >= ARRAY_SIZE(osr_dac_sel))
+		return NULL;
+
+	return &osr_dac_sel[osr];
+}
+
+static int nau8325_dai_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+	const struct nau8325_osr_attr *osr;
+
+	osr = nau8325_get_osr(nau8325);
+	if (!osr || !osr->osr)
+		return -EINVAL;
+
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    0, CLK_DA_AD_MAX / osr->osr);
+}
+
+static int nau8325_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+	unsigned int val_len = 0;
+	const struct nau8325_osr_attr *osr;
+	int ret;
+
+	nau8325->fs = params_rate(params);
+	osr = nau8325_get_osr(nau8325);
+	if (!osr || !osr->osr || nau8325->fs * osr->osr > CLK_DA_AD_MAX) {
+		ret = -EINVAL;
+		goto err;
+	}
+	regmap_update_bits(nau8325->regmap, NAU8325_R03_CLK_CTRL,
+			   NAU8325_CLK_DAC_SRC_MASK,
+			   osr->clk_src << NAU8325_CLK_DAC_SRC_SFT);
+
+	ret = nau8325_clock_config(nau8325);
+	if (ret)
+		goto err;
+
+	switch (params_width(params)) {
+	case 16:
+		val_len |= NAU8325_I2S_DL_16;
+		break;
+	case 20:
+		val_len |= NAU8325_I2S_DL_20;
+		break;
+	case 24:
+		val_len |= NAU8325_I2S_DL_24;
+		break;
+	case 32:
+		val_len |= NAU8325_I2S_DL_32;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	regmap_update_bits(nau8325->regmap, NAU8325_R0D_I2S_PCM_CTRL1,
+			   NAU8325_I2S_DL_MASK, val_len);
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static int nau8325_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+	unsigned int ctrl1_val = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		ctrl1_val |= NAU8325_I2S_BP_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		ctrl1_val |= NAU8325_I2S_DF_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		ctrl1_val |= NAU8325_I2S_DF_LEFT;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		ctrl1_val |= NAU8325_I2S_DF_RIGTH;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		ctrl1_val |= NAU8325_I2S_DF_PCM_AB;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		ctrl1_val |= NAU8325_I2S_DF_PCM_AB;
+		ctrl1_val |= NAU8325_I2S_PCMB_EN;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(nau8325->regmap, NAU8325_R0D_I2S_PCM_CTRL1,
+			   NAU8325_I2S_DF_MASK | NAU8325_I2S_BP_MASK |
+			   NAU8325_I2S_PCMB_EN, ctrl1_val);
+
+	return 0;
+}
+
+static int nau8325_set_sysclk(struct snd_soc_component *component, int clk_id,
+			      int source, unsigned int freq, int dir)
+{
+	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
+
+	if (freq < MASTER_CLK_MIN || freq > MASTER_CLK_MAX) {
+		dev_err(nau8325->dev, "MCLK exceeds the range, MCLK:%d", freq);
+		return -EINVAL;
+	}
+
+	nau8325->mclk = freq;
+	dev_dbg(nau8325->dev, "MCLK %dHz", nau8325->mclk);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver nau8325_component_driver = {
+	.set_sysclk = nau8325_set_sysclk,
+	.suspend_bias_off = true,
+	.controls = nau8325_snd_controls,
+	.num_controls = ARRAY_SIZE(nau8325_snd_controls),
+	.dapm_widgets = nau8325_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(nau8325_dapm_widgets),
+	.dapm_routes = nau8325_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(nau8325_dapm_routes),
+};
+
+static const struct snd_soc_dai_ops nau8325_dai_ops = {
+	.startup = nau8325_dai_startup,
+	.hw_params = nau8325_hw_params,
+	.set_fmt = nau8325_set_fmt,
+};
+
+#define NAU8325_RATES SNDRV_PCM_RATE_8000_96000
+#define NAU8325_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE \
+	 | SNDRV_PCM_FMTBIT_S24_3LE)
+
+static struct snd_soc_dai_driver nau8325_dai = {
+	.name = NAU8325_CODEC_DAI,
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = NAU8325_RATES,
+		.formats = NAU8325_FORMATS,
+	},
+	.ops = &nau8325_dai_ops,
+};
+
+static const struct regmap_config nau8325_regmap_config = {
+	.reg_bits = NAU8325_REG_ADDR_LEN,
+	.val_bits = NAU8325_REG_DATA_LEN,
+
+	.max_register = NAU8325_REG_MAX,
+	.readable_reg = nau8325_readable_reg,
+	.writeable_reg = nau8325_writeable_reg,
+	.volatile_reg = nau8325_volatile_reg,
+
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = nau8325_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(nau8325_reg_defaults),
+};
+
+static void nau8325_reset_chip(struct regmap *regmap)
+{
+	regmap_write(regmap, NAU8325_R00_HARDWARE_RST, 0x0001);
+	regmap_write(regmap, NAU8325_R00_HARDWARE_RST, 0x0000);
+}
+
+static void nau8325_init_regs(struct nau8325 *nau8325)
+{
+	struct regmap *regmap = nau8325->regmap;
+
+	/* set ALC parameters */
+	regmap_update_bits(regmap, NAU8325_R2C_ALC_CTRL1,
+			   NAU8325_ALC_MAXGAIN_MASK,
+			   0x7 << NAU8325_ALC_MAXGAIN_SFT);
+	regmap_update_bits(regmap, NAU8325_R2D_ALC_CTRL2,
+			   NAU8325_ALC_DCY_MASK | NAU8325_ALC_ATK_MASK |
+			   NAU8325_ALC_HLD_MASK, (0x5 << NAU8325_ALC_DCY_SFT) |
+			   (0x3 << NAU8325_ALC_ATK_SFT) |
+			   (0x5 << NAU8325_ALC_HLD_SFT));
+	/* Enable ALC to avoid signal distortion when battery low. */
+	if (nau8325->alc_enable)
+		regmap_update_bits(regmap, NAU8325_R2E_ALC_CTRL3,
+				   NAU8325_ALC_EN, NAU8325_ALC_EN);
+	if (nau8325->clock_detection)
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_CLKPWRUP_DIS |
+				   NAU8325_PWRUP_DFT, 0);
+	else
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_CLKPWRUP_DIS | NAU8325_PWRUP_DFT,
+				   NAU8325_CLKPWRUP_DIS);
+	if (nau8325->clock_det_data)
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_APWRUP_EN, NAU8325_APWRUP_EN);
+	else
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_APWRUP_EN, 0);
+
+	/* DAC Reference Voltage Setting */
+	regmap_update_bits(regmap, NAU8325_R73_RDAC,
+			   NAU8325_DACVREFSEL_MASK,
+			   nau8325->dac_vref << NAU8325_DACVREFSEL_SFT);
+	/* DAC Reference Voltage Decoupling Capacitors. */
+	regmap_update_bits(regmap, NAU8325_R63_ANALOG_CONTROL_3,
+			   NAU8325_CLASSD_COARSE_GAIN_MASK, 0x4);
+	/* Auto-Att Min Gain 0dB, Class-D N Driver Slew Rate -25%. */
+	regmap_update_bits(regmap, NAU8325_R64_ANALOG_CONTROL_4,
+			   NAU8325_CLASSD_SLEWN_MASK, 0x7);
+
+	/* VMID Tieoff (VMID Resistor Selection) */
+	regmap_update_bits(regmap, NAU8325_R60_BIAS_ADJ,
+			   NAU8325_BIAS_VMID_SEL_MASK,
+			   nau8325->vref_impedance <<
+			   NAU8325_BIAS_VMID_SEL_SFT);
+
+	/* enable VMID, BIAS, DAC, DCA CLOCK, Voltage/Current Amps
+	 */
+	regmap_update_bits(regmap, NAU8325_R61_ANALOG_CONTROL_1,
+			   NAU8325_DACEN_MASK | NAU8325_DACCLKEN_MASK |
+			   NAU8325_DACEN_R_MASK | NAU8325_DACCLKEN_R_MASK |
+			   NAU8325_CLASSDEN_MASK | NAU8325_VMDFSTENB_MASK |
+			   NAU8325_BIASEN_MASK | NAU8325_VMIDEN_MASK,
+			   (0x1 << NAU8325_DACEN_SFT) |
+			   (0x1 << NAU8325_DACCLKEN_SFT) |
+			   (0x1 << NAU8325_DACEN_R_SFT) |
+			   (0x1 << NAU8325_DACCLKEN_R_SFT) |
+			   (0x1 << NAU8325_CLASSDEN_SFT) |
+			   (0x1 << NAU8325_VMDFSTENB_SFT) |
+			   (0x1 << NAU8325_BIASEN_SFT) | 0x3);
+
+	/* Enable ALC to avoid signal distortion when battery low. */
+	if (nau8325->alc_enable)
+		regmap_update_bits(regmap, NAU8325_R2E_ALC_CTRL3,
+				   NAU8325_ALC_EN, NAU8325_ALC_EN);
+	if (nau8325->clock_det_data)
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_APWRUP_EN, NAU8325_APWRUP_EN);
+	else
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_APWRUP_EN, 0);
+	if (nau8325->clock_detection)
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_CLKPWRUP_DIS |
+				   NAU8325_PWRUP_DFT, 0);
+	else
+		regmap_update_bits(regmap, NAU8325_R40_CLK_DET_CTRL,
+				   NAU8325_CLKPWRUP_DIS | NAU8325_PWRUP_DFT,
+				   NAU8325_CLKPWRUP_DIS);
+	regmap_update_bits(regmap, NAU8325_R29_DAC_CTRL1,
+			   NAU8325_DAC_OVERSAMPLE_MASK,
+			   NAU8325_DAC_OVERSAMPLE_128);
+}
+
+static void nau8325_print_device_properties(struct nau8325 *nau8325)
+{
+	struct device *dev = nau8325->dev;
+
+	dev_dbg(dev, "vref-impedance:          %d", nau8325->vref_impedance);
+	dev_dbg(dev, "dac-vref:                %d", nau8325->dac_vref);
+	dev_dbg(dev, "alc-enable:              %d", nau8325->alc_enable);
+	dev_dbg(dev, "clock-det-data:          %d", nau8325->clock_det_data);
+	dev_dbg(dev, "clock-detection-disable: %d", nau8325->clock_detection);
+}
+
+static int nau8325_read_device_properties(struct device *dev,
+					  struct nau8325 *nau8325)
+{
+	int ret;
+
+	nau8325->alc_enable =
+		device_property_read_bool(dev, "nuvoton,alc-enable");
+	nau8325->clock_det_data =
+		device_property_read_bool(dev, "nuvoton,clock-det-dataEnable VMID, BIAS");
+	nau8325->clock_detection =
+		!device_property_read_bool(dev,	"nuvoton,clock-detection-disable");
+
+	ret = device_property_read_u32(dev, "nuvoton,vref-impedance",
+				       &nau8325->vref_impedance);
+	if (ret)
+		nau8325->vref_impedance = 2;
+	ret = device_property_read_u32(dev, "nuvoton,dac-vref",
+				       &nau8325->dac_vref);
+	if (ret)
+		nau8325->dac_vref = 2;
+
+	return 0;
+}
+
+static int nau8325_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct device *dev = &i2c->dev;
+	struct nau8325 *nau8325 = dev_get_platdata(dev);
+	int ret, value;
+
+	if (!nau8325) {
+		nau8325 = devm_kzalloc(dev, sizeof(*nau8325), GFP_KERNEL);
+		if (!nau8325) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		ret = nau8325_read_device_properties(dev, nau8325);
+		if (ret)
+			goto err;
+	}
+	i2c_set_clientdata(i2c, nau8325);
+
+	nau8325->regmap = devm_regmap_init_i2c(i2c, &nau8325_regmap_config);
+	if (IS_ERR(nau8325->regmap)) {
+		ret = PTR_ERR(nau8325->regmap);
+		goto err;
+	}
+	nau8325->dev = dev;
+	nau8325_print_device_properties(nau8325);
+
+	nau8325_reset_chip(nau8325->regmap);
+	ret = regmap_read(nau8325->regmap, NAU8325_R02_DEVICE_ID, &value);
+	if (ret) {
+		dev_err(dev, "Failed to read device id (%d)", ret);
+		goto err;
+	}
+	nau8325_init_regs(nau8325);
+
+	ret = devm_snd_soc_register_component(dev, &nau8325_component_driver,
+					      &nau8325_dai, 1);
+err:
+	return ret;
+}
+
+static const struct i2c_device_id nau8325_i2c_ids[] = {
+	{ "nau8325", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nau8325_i2c_ids);
+
+#ifdef CONFIG_OF
+static const struct of_device_id nau8325_of_ids[] = {
+	{ .compatible = "nuvoton,nau8325", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nau8325_of_ids);
+#endif
+
+static struct i2c_driver nau8325_i2c_driver = {
+	.driver = {
+		.name = "nau8325",
+		.of_match_table = of_match_ptr(nau8325_of_ids),
+	},
+	.probe = nau8325_i2c_probe,
+	.id_table = nau8325_i2c_ids,
+};
+module_i2c_driver(nau8325_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC NAU8325 driver");
+MODULE_AUTHOR("Seven Lee <WTLI@nuvoton.com>");
+MODULE_AUTHOR("David Lin <CTLIN0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/nau8325.h b/sound/soc/codecs/nau8325.h
new file mode 100644
index 000000000000..30b637fa7b3a
--- /dev/null
+++ b/sound/soc/codecs/nau8325.h
@@ -0,0 +1,391 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * nau8325.h -- Nuvoton NAU8325 audio codec driver
+ *
+ * Copyright 2023 Nuvoton Technology Crop.
+ * Author: Seven Lee <WTLI@nuvoton.com>
+ *	   David Lin <CTLIN0@nuvoton.com>
+ */
+
+#ifndef __NAU8325_H__
+#define __NAU8325_H__
+
+#define NAU8325_R00_HARDWARE_RST		0x00
+#define NAU8325_R01_SOFTWARE_RST		0x01
+#define NAU8325_R02_DEVICE_ID			0x02
+#define NAU8325_R03_CLK_CTRL			0x03
+#define NAU8325_R04_ENA_CTRL			0x04
+#define NAU8325_R05_INTERRUPT_CTRL		0x05
+#define NAU8325_R06_INT_CLR_STATUS		0x06
+#define NAU8325_R09_IRQOUT			0x09
+#define NAU8325_R0A_IO_CTRL			0x0a
+#define NAU8325_R0B_PDM_CTRL			0x0b
+#define NAU8325_R0C_TDM_CTRL			0x0c
+#define NAU8325_R0D_I2S_PCM_CTRL1		0x0d
+#define NAU8325_R0E_I2S_PCM_CTRL2		0x0e
+#define NAU8325_R0F_L_TIME_SLOT			0x0f
+#define NAU8325_R10_R_TIME_SLOT			0x10
+#define NAU8325_R11_HPF_CTRL			0x11
+#define NAU8325_R12_MUTE_CTRL			0x12
+#define NAU8325_R13_DAC_VOLUME			0x13
+#define NAU8325_R1D_DEBUG_READ1			0x1d
+#define NAU8325_R1F_DEBUG_READ2			0x1f
+#define NAU8325_R22_DEBUG_READ3			0x22
+#define NAU8325_R29_DAC_CTRL1			0x29
+#define NAU8325_R2A_DAC_CTRL2			0x2a
+#define NAU8325_R2C_ALC_CTRL1			0x2c
+#define NAU8325_R2D_ALC_CTRL2			0x2d
+#define NAU8325_R2E_ALC_CTRL3			0x2e
+#define NAU8325_R2F_ALC_CTRL4			0x2f
+#define NAU8325_R40_CLK_DET_CTRL		0x40
+#define NAU8325_R49_TEST_STATUS			0x49
+#define NAU8325_R4A_ANALOG_READ			0x4a
+#define NAU8325_R50_MIXER_CTRL			0x50
+#define NAU8325_R55_MISC_CTRL			0x55
+#define NAU8325_R60_BIAS_ADJ			0x60
+#define NAU8325_R61_ANALOG_CONTROL_1		0x61
+#define NAU8325_R62_ANALOG_CONTROL_2		0x62
+#define NAU8325_R63_ANALOG_CONTROL_3		0x63
+#define NAU8325_R64_ANALOG_CONTROL_4		0x64
+#define NAU8325_R65_ANALOG_CONTROL_5		0x65
+#define NAU8325_R66_ANALOG_CONTROL_6		0x66
+#define NAU8325_R69_CLIP_CTRL			0x69
+#define NAU8325_R73_RDAC			0x73
+#define NAU8325_REG_MAX				NAU8325_R73_RDAC
+
+/* 16-bit control register address, and 16-bits control register data */
+#define NAU8325_REG_ADDR_LEN		16
+#define NAU8325_REG_DATA_LEN		16
+
+/* CLK_CTRL (0x03) */
+#define NAU8325_CLK_DAC_SRC_SFT		12
+#define NAU8325_CLK_DAC_SRC_MASK	(0x3 << NAU8325_CLK_DAC_SRC_SFT)
+#define NAU8325_CLK_MUL_SRC_SFT		6
+#define NAU8325_CLK_MUL_SRC_MASK	(0x3 << NAU8325_CLK_MUL_SRC_SFT)
+#define NAU8325_MCLK_SEL_SFT		3
+#define NAU8325_MCLK_SEL_MASK		(0x7 << NAU8325_MCLK_SEL_SFT)
+#define NAU8325_MCLK_SRC_MASK		0x7
+
+/* ENA_CTRL (0x04) */
+#define NAU8325_DAC_LEFT_CH_EN_SFT	3
+#define NAU8325_DAC_LEFT_CH_EN		(0x1 << NAU8325_DAC_LEFT_CH_EN_SFT)
+#define NAU8325_DAC_RIGHT_CH_EN_SFT	2
+#define NAU8325_DAC_RIGHT_CH_EN		(0x1 << NAU8325_DAC_RIGHT_CH_EN_SFT)
+
+/* INTERRUPT_CTRL (0x05) */
+#define NAU8325_ARP_DWN_INT_SFT		12
+#define NAU8325_ARP_DWN_INT_MASK	(0x1 << NAU8325_ARP_DWN_INT_SFT)
+#define NAU8325_CLIP_INT_SFT		11
+#define NAU8325_CLIP_INT_MASK		(0x1 << NAU8325_CLIP_INT_SFT)
+#define NAU8325_LVD_INT_SFT		10
+#define NAU8325_LVD_INT_MASK		(0x1 << NAU8325_LVD_INT_SFT)
+#define NAU8325_PWR_INT_DIS_SFT		8
+#define NAU8325_PWR_INT_DIS		(0x1 << NAU8325_PWR_INT_DIS_SFT)
+#define NAU8325_OCP_OTP_SHTDWN_INT_SFT	4
+#define NAU8325_OCP_OTP_SHTDWN_INT_MASK (0x1 << NAU8325_OCP_OTP_SHTDWN_INT_SFT)
+#define NAU8325_CLIP_INT_DIS_SFT	3
+#define NAU8325_CLIP_INT_DIS		(0x1 << NAU8325_CLIP_INT_DIS_SFT)
+#define NAU8325_LVD_INT_DIS_SFT		2
+#define NAU8325_LVD_INT_DIS		(0x1 << NAU8325_LVD_INT_DIS_SFT)
+#define NAU8325_PWR_INT_MASK		0x1
+
+/* INT_CLR_STATUS (0x06) */
+#define NAU8325_INT_STATUS_MASK		0x7f
+
+/* IRQOUT (0x9) */
+#define NAU8325_IRQOUT_SEL_SEF		12
+#define NAU8325_IRQOUT_SEL_MASK		(0xf << NAU8325_IRQOUT_SEL_SEF)
+#define NAU8325_DEM_DITH_SFT		7
+#define NAU8325_DEM_DITH_EN		(0x1 << NAU8325_DEM_DITH_SFT)
+#define NAU8325_GAINZI3_SFT		5
+#define NAU8325_GAINZI3_MASK		(0x1 << NAU8325_GAINZI3_SFT)
+#define NAU8325_GAINZI2_MASK		0x1f
+
+/* IO_CTRL (0x0a) */
+#define NAU8325_IRQ_PL_SFT		15
+#define NAU8325_IRQ_PL_ACT_HIGH		(0x1 << NAU8325_IRQ_PL_SFT)
+#define NAU8325_IRQ_PS_SFT		14
+#define NAU8325_IRQ_PS_UP		(0x1 << NAU8325_IRQ_PS_SFT)
+#define NAU8325_IRQ_PE_SFT		13
+#define NAU8325_IRQ_PE_EN		(0x1 << NAU8325_IRQ_PE_SFT)
+#define NAU8325_IRQ_DS_SFT		12
+#define NAU8325_IRQ_DS_HIGH		(0x1 << NAU8325_IRQ_DS_SFT)
+#define NAU8325_IRQ_OUTPUT_SFT		11
+#define NAU8325_IRQ_OUTPUT_EN		(0x1 << NAU8325_IRQ_OUTPUT_SFT)
+#define NAU8325_IRQ_PIN_DEBUG_SFT	10
+#define NAU8325_IRQ_PIN_DEBUG_EN	(0x1 << NAU8325_IRQ_PIN_DEBUG_SFT)
+
+/* PDM_CTRL (0x0b) */
+#define NAU8325_PDM_LCH_EDGE_SFT	1
+#define NAU8325_PDM_LCH_EDGE__MASK	(0x1 << NAU8325_PDM_LCH_EDGE_SFT)
+#define NAU8325_PDM_MODE_EN		0x1
+
+/* TDM_CTRL (0x0c) */
+#define NAU8325_TDM_SFT			15
+#define NAU8325_TDM_EN			(0x1 << NAU8325_TDM_SFT)
+#define NAU8325_PCM_OFFSET_CTRL_SFT	14
+#define NAU8325_PCM_OFFSET_CTRL_EN	(0x1 << NAU8325_PCM_OFFSET_CTRL_SFT)
+#define NAU8325_DAC_LEFT_SFT		6
+#define NAU8325_NAU8325_DAC_LEFT_MASK	(0x7 << NAU8325_DAC_LEFT_SFT)
+#define NAU8325_DAC_RIGHT_SFT		3
+#define NAU8325_DAC_RIGHT_MASK		(0x7 << NAU8325_DAC_RIGHT_SFT)
+
+/* I2S_PCM_CTRL1 (0x0d) */
+#define NAU8325_DACCM_CTL_SFT		14
+#define NAU8325_DACCM_CTL_MASK		(0x3 << NAU8325_DACCM_CTL_SFT)
+#define NAU8325_CMB8_0_SFT		10
+#define NAU8325_CMB8_0_MASK		(0x1 << NAU8325_CMB8_0_SFT)
+#define NAU8325_UA_OFFSET_SFT		9
+#define NAU8325_UA_OFFSET_MASK		(0x1 << NAU8325_UA_OFFSET_SFT)
+#define NAU8325_I2S_BP_SFT		7
+#define NAU8325_I2S_BP_MASK		(0x1 << NAU8325_I2S_BP_SFT)
+#define NAU8325_I2S_BP_INV		(0x1 << NAU8325_I2S_BP_SFT)
+#define NAU8325_I2S_PCMB_SFT		6
+#define NAU8325_I2S_PCMB_EN		(0x1 << NAU8325_I2S_PCMB_SFT)
+#define NAU8325_I2S_DACPSHS0_SFT	5
+#define NAU8325_I2S_DACPSHS0_MASK	(0x1 << NAU8325_I2S_DACPSHS0_SFT)
+#define NAU8325_I2S_DL_SFT		2
+#define NAU8325_I2S_DL_MASK		(0x3 << NAU8325_I2S_DL_SFT)
+#define NAU8325_I2S_DL_32		(0x3 << NAU8325_I2S_DL_SFT)
+#define NAU8325_I2S_DL_24		(0x2 << NAU8325_I2S_DL_SFT)
+#define NAU8325_I2S_DL_20		(0x1 << NAU8325_I2S_DL_SFT)
+#define NAU8325_I2S_DL_16		(0x0 << NAU8325_I2S_DL_SFT)
+#define NAU8325_I2S_DF_MASK		0x3
+#define NAU8325_I2S_DF_RIGTH		0x0
+#define NAU8325_I2S_DF_LEFT		0x1
+#define NAU8325_I2S_DF_I2S		0x2
+#define NAU8325_I2S_DF_PCM_AB		0x3
+
+/* I2S_PCM_CTRL2 (0x0e) */
+#define NAU8325_PCM_TS_SFT		10
+#define NAU8325_PCM_TS_EN		(0x1 << NAU8325_PCM_TS_SFT)
+#define NAU8325_PCM8BIT0_SFT		8
+#define NAU8325_PCM8BIT0_MASK		(0x1 << NAU8325_PCM8BIT0_SFT)
+
+/* L_TIME_SLOT (0x0f)*/
+#define NAU8325_SHORT_FS_DET_SFT	13
+#define NAU8325_SHORT_FS_DET_DIS	(0x1 << NAU8325_SHORT_FS_DET_SFT)
+#define NAU8325_TSLOT_L0_MASK		0x3ff
+
+/* R_TIME_SLOT (0x10)*/
+#define NAU8325_TSLOT_R0_MASK		0x3ff
+
+/* HPF_CTRL (0x11)*/
+#define NAU8325_DAC_HPF_SFT		15
+#define NAU8325_DAC_HPF_EN		(0x1 << NAU8325_DAC_HPF_SFT)
+#define NAU8325_DAC_HPF_APP_SFT		14
+#define NAU8325_DAC_HPF_APP_MASK	(0x1 << NAU8325_DAC_HPF_APP_SFT)
+#define NAU8325_DAC_HPF_FCUT_SFT	11
+#define NAU8325_DAC_HPF_FCUT_MASK	(0x7 << NAU8325_DAC_HPF_FCUT_SFT)
+
+/* MUTE_CTRL (0x12)*/
+#define NAU8325_SOFT_MUTE_SFT		15
+#define NAU8325_SOFT_MUTE		(0x1 << NAU8325_SOFT_MUTE_SFT)
+#define NAU8325_DAC_ZC_SFT		8
+#define NAU8325_DAC_ZC_EN		(0x1 << NAU8325_DAC_ZC_SFT)
+#define NAU8325_UNMUTE_CTL_SFT		6
+#define NAU8325_UNMUTE_CTL_MASK		(0x3 << NAU8325_UNMUTE_CTL_SFT)
+#define NAU8325_ANA_MUTE_SFT		4
+#define NAU8325_ANA_MUTE_MASK		(0x3 << NAU8325_ANA_MUTE_SFT)
+#define NAU8325_AUTO_MUTE_SFT		3
+#define NAU8325_AUTO_MUTE_DIS		(0x1 << NAU8325_AUTO_MUTE_SFT)
+
+/* DAC_VOLUME (0x13) */
+#define NAU8325_DAC_VOLUME_L_SFT	8
+#define NAU8325_DAC_VOLUME_L_EN		(0xff << NAU8325_DAC_VOLUME_L_SFT)
+#define NAU8325_DAC_VOLUME_R_SFT	0
+#define NAU8325_DAC_VOLUME_R_EN		(0xff << NAU8325_DAC_VOLUME_R_SFT)
+#define NAU8325_DAC_VOL_MAX		0xff
+
+/* DEBUG_READ1 (0x1d)*/
+#define NAU8325_OSR100_MASK		(0x1 << 6)
+#define NAU8325_MIPS500_MASK		(0x1 << 5)
+#define NAU8325_SHUTDWNDRVR_R_MASK	(0x1 << 4)
+#define NAU8325_SHUTDWNDRVR_L_MASK	(0x1 << 3)
+#define NAU8325_MUTEB_MASK		(0x1 << 2)
+#define NAU8325_PDOSCB_MASK		(0x1 << 1)
+#define NAU8325_POWERDOWN1B_D_MASK	0x1
+
+/* DEBUG_READ2 (0x1f)*/
+#define NAU8325_R_CHANNEL_Vol_SFT	8
+#define NAU8325_R_CHANNEL_Vol_MASK	(0xff << NAU8325_R_CHANNEL_Vol_SFT)
+#define NAU8325_L_CHANNEL_Vol_MASK	0xff
+
+/* DEBUG_READ3(0x22)*/
+#define NAU8325_PGAL_GAIN_MASK		(0x3f << 7)
+#define NAU8325_CLIP_MASK		(0x1 << 6)
+#define NAU8325_SCAN_MODE_MASK		(0x1 << 5)
+#define NAU8325_SDB_MASK		(0x1 << 4)
+#define NAU8325_TALARM_MASK		(0x1 << 3)
+#define NAU8325_SHORTR_MASK		(0x1 << 2)
+#define NAU8325_SHORTL_MASK		(0x1 << 1)
+#define NAU8325_TMDET_MASK		0x1
+
+/* DAC_CTRL1 (0x29) */
+#define NAU8325_DAC_OVERSAMPLE_SFT	0
+#define NAU8325_DAC_OVERSAMPLE_MASK	0x7
+#define NAU8325_DAC_OVERSAMPLE_256	1
+#define NAU8325_DAC_OVERSAMPLE_128	2
+#define NAU8325_DAC_OVERSAMPLE_64	0
+#define NAU8325_DAC_OVERSAMPLE_32	4
+
+/* ALC_CTRL1 (0x2c) */
+#define NAU8325_ALC_MAXGAIN_SFT		5
+#define NAU8325_ALC_MAXGAIN_MAX		0x7
+#define NAU8325_ALC_MAXGAIN_MASK	(0x7 << NAU8325_ALC_MAXGAIN_SFT)
+#define NAU8325_ALC_MINGAIN_MAX		4
+#define NAU8325_ALC_MINGAIN_SFT		1
+#define NAU8325_ALC_MINGAIN_MASK	(0x7 << NAU8325_ALC_MINGAIN_SFT)
+
+/* ALC_CTRL2 (0x2d) */
+#define NAU8325_ALC_DCY_SFT		12
+#define NAU8325_ALC_DCY_MAX		0xb
+#define NAU8325_ALC_DCY_MASK		(0xf << NAU8325_ALC_DCY_SFT)
+#define NAU8325_ALC_ATK_SFT		8
+#define NAU8325_ALC_ATK_MAX		0xb
+#define NAU8325_ALC_ATK_MASK		(0xf << NAU8325_ALC_ATK_SFT)
+#define NAU8325_ALC_HLD_SFT		4
+#define NAU8325_ALC_HLD_MAX		0xa
+#define NAU8325_ALC_HLD_MASK		(0xf << NAU8325_ALC_HLD_SFT)
+#define NAU8325_ALC_LVL_SFT		0
+#define NAU8325_ALC_LVL_MAX		0xf
+#define NAU8325_ALC_LVL_MASK		0xf
+
+/* ALC_CTRL3 (0x2e) */
+#define NAU8325_ALC_EN_SFT		15
+#define NAU8325_ALC_EN			(0x1 << NAU8325_ALC_EN_SFT)
+
+/* TEMP_COMP_CTRL (0x30) */
+#define NAU8325_TEMP_COMP_ACT2_MASK	0xff
+
+/* LPF_CTRL (0x33) */
+#define NAU8325_LPF_IN1_EN_SFT		15
+#define NAU8325_LPF_IN1_EN		(0x1 << NAU8325_LPF_IN1_EN_SFT)
+#define NAU8325_LPF_IN1_TC_SFT		11
+#define NAU8325_LPF_IN1_TC_MASK		(0xf << NAU8325_LPF_IN1_TC_SFT)
+#define NAU8325_LPF_IN2_EN_SFT		10
+#define NAU8325_LPF_IN2_EN		(0x1 << NAU8325_LPF_IN2_EN_SFT)
+#define NAU8325_LPF_IN2_TC_SFT		6
+#define NAU8325_LPF_IN2_TC_MASK		(0xf << NAU8325_LPF_IN2_TC_SFT)
+
+/* CLK_DET_CTRL (0x40) */
+#define NAU8325_APWRUP_SFT		15
+#define NAU8325_APWRUP_EN		(0x1 << NAU8325_APWRUP_SFT)
+#define NAU8325_CLKPWRUP_SFT		14
+#define NAU8325_CLKPWRUP_DIS		(0x1 << NAU8325_CLKPWRUP_SFT)
+#define NAU8325_PWRUP_DFT_SFT		13
+#define NAU8325_PWRUP_DFT		(0x1 << NAU8325_PWRUP_DFT_SFT)
+#define NAU8325_REG_SRATE_SFT		10
+#define NAU8325_REG_SRATE_MASK		(0x7 << NAU8325_REG_SRATE_SFT)
+#define NAU8325_REG_ALT_SRATE_SFT	9
+#define NAU8325_REG_ALT_SRATE_EN	(0x1 << NAU8325_REG_ALT_SRATE_SFT)
+#define NAU8325_REG_DIV_MAX		0x1
+
+/* BIAS_ADJ (0x60) */
+#define NAU8325_BIAS_VMID_SEL_SFT	4
+#define NAU8325_BIAS_VMID_SEL_MASK	(0x3 << NAU8325_BIAS_VMID_SEL_SFT)
+
+/* ANALOG_CONTROL_1 (0x61) */
+#define NAU8325_VMDFSTENB_SFT		14
+#define NAU8325_VMDFSTENB_MASK		(0x3 << NAU8325_VMDFSTENB_SFT)
+#define NAU8325_CLASSDEN_SFT		12
+#define NAU8325_CLASSDEN_MASK		(0x3 << NAU8325_CLASSDEN_SFT)
+#define NAU8325_DACCLKEN_R_SFT		10
+#define NAU8325_DACCLKEN_R_MASK		(0x3 << NAU8325_DACCLKEN_R_SFT)
+#define NAU8325_DACEN_R_SFT		8
+#define NAU8325_DACEN_R_MASK		(0x3 << NAU8325_DACEN_R_SFT)
+#define NAU8325_DACCLKEN_SFT		6
+#define NAU8325_DACCLKEN_MASK		(0x3 << NAU8325_DACCLKEN_SFT)
+#define NAU8325_DACEN_SFT		4
+#define NAU8325_DACEN_MASK		(0x3 << NAU8325_DACEN_SFT)
+#define NAU8325_BIASEN_SFT		2
+#define NAU8325_BIASEN_MASK		(0x3 << NAU8325_BIASEN_SFT)
+#define NAU8325_VMIDEN_MASK		0x3
+
+/* ANALOG_CONTROL_2 (0x62) */
+#define NAU8325_PWMMOD_SFT		14
+#define NAU8325_PWMMOD_MASK		(0x1 << NAU8325_PWMMOD_SFT)
+#define NAU8325_DACTEST_SFT		6
+#define NAU8325_DACTEST_MASK		(0x3 << NAU8325_DACTEST_SFT)
+#define NAU8325_DACREFCAP_SFT		4
+#define NAU8325_DACREFCAP_MASK		(0x3 << NAU8325_DACREFCAP_SFT)
+
+/* ANALOG_CONTROL_3 (0x63) */
+#define NAU8325_POWER_DOWN_L_SFT	12
+#define NAU8325_POWER_DOWN_L_MASK	(0x3 << NAU8325_POWER_DOWN_L_SFT)
+#define NAU8325_POWER_DOWN_R_SFT	11
+#define NAU8325_POWER_DOWN_R_MASK	(0x3 << NAU8325_DACREFCAP_SFT)
+#define NAU8325_CLASSD_FINE_SFT		5
+#define NAU8325_CLASSD_FINE_MASK	(0x3 << NAU8325_CLASSD_FINE_SFT)
+#define NAU8325_CLASSD_COARSE_GAIN_MASK	0xf
+
+/* ANALOG_CONTROL_4 (0x64) */
+#define NAU8325_CLASSD_OCPN_SFT		12
+#define NAU8325_CLASSD_OCPN_MASK	(0xf << NAU8325_CLASSD_OCPN_SFT)
+#define NAU8325_CLASSD_OCPP_SFT		8
+#define NAU8325_CLASSD_OCPP_MASK	(0xf << NAU8325_CLASSD_OCPP_SFT)
+#define NAU8325_CLASSD_SLEWN_MASK	0xff
+
+/* ANALOG_CONTROL_5 (0x65) */
+#define NAU8325_MCLK_RANGE_SFT		2
+#define NAU8325_MCLK_RANGE_EN		(0x1 << NAU8325_MCLK_RANGE_SFT)
+#define NAU8325_MCLK8XEN_SFT		1
+#define NAU8325_MCLK8XEN_EN		(0x1 << NAU8325_MCLK8XEN_SFT)
+#define NAU8325_MCLK4XEN_EN		0x1
+
+/* ANALOG_CONTROL_6 (0x66) */
+#define NAU8325_VBATLOW_SFT		4
+#define NAU8325_VBATLOW_MASK		(0x1 << NAU8325_VBATLOW_SFT)
+#define NAU8325_VDDSPK_LIM_SFT		3
+#define NAU8325_VDDSPK_LIM_EN		(0x1 << NAU8325_VDDSPK_LIM_SFT)
+#define NAU8325_VDDSPK_LIM_MASK		0x7
+
+/* CLIP_CTRL (0x69)*/
+#define NAU8325_ANTI_CLIP_SFT		4
+#define NAU8325_ANTI_CLIP_EN		(0x1 << NAU8325_ANTI_CLIP_SFT)
+
+/* RDAC (0x73) */
+#define NAU8325_CLK_DAC_DELAY_SFT	4
+#define NAU8325_CLK_DAC_DELAY_EN	(0x7 << NAU8325_CLK_DAC_DELAY_SFT)
+#define NAU8325_DACVREFSEL_SFT		2
+#define NAU8325_DACVREFSEL_MASK		(0x3 << NAU8325_DACVREFSEL_SFT)
+
+#define NAU8325_CODEC_DAI "nau8325-hifi"
+
+struct nau8325 {
+	struct device *dev;
+	struct regmap *regmap;
+	int mclk;
+	int fs;
+	int vref_impedance;
+	int dac_vref;
+	int clock_detection;
+	int clock_det_data;
+	int alc_enable;
+};
+
+struct nau8325_src_attr {
+	int param;
+	unsigned int val;
+};
+
+enum {
+	NAU8325_MCLK_FS_RATIO_256,
+	NAU8325_MCLK_FS_RATIO_400,
+	NAU8325_MCLK_FS_RATIO_500,
+	NAU8325_MCLK_FS_RATIO_NUM,
+};
+
+struct nau8325_srate_attr {
+	int fs;
+	int range;
+	bool max;
+	unsigned int mclk_src[NAU8325_MCLK_FS_RATIO_NUM];
+};
+
+struct nau8325_osr_attr {
+	unsigned int osr;
+	unsigned int clk_src;
+};
+
+#endif /* __NAU8325_H__ */
-- 
2.25.1

