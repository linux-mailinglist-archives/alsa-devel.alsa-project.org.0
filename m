Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6AB4D488
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3227360212;
	Tue,  9 Sep 2025 14:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3227360212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419733;
	bh=0pvUU9Yvfg3/RHf9GsdFhIQJVQPgEBVljD9FFGnn+do=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fml3lHBgJah5Z4WHSZTyG8TduN4I1uQGrlMIGPqx4Tt92rsLAwb1r/lMjgwxRjLBr
	 XwjGcAqr8GesilpdtVwEKwJsqwyCwLqhVPSamZuW9dnmvKu+xwdHuAd4D5kLmbaA2T
	 TuFxz4qEc+gBAG2OYM7wkA5hUDae4UC8H+1k1MHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB7FF80622; Tue,  9 Sep 2025 14:07:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70BECF80621;
	Tue,  9 Sep 2025 14:07:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3A0CF804FF; Fri, 22 Aug 2025 07:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35701F80093
	for <alsa-devel@alsa-project.org>; Fri, 22 Aug 2025 07:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35701F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=S6NvlNeN
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57M5EjeU646684;
	Fri, 22 Aug 2025 00:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755839685;
	bh=Z2kx8DHf/pqF9Z4rbVHwp0HK8G2tJ+slaRSlSoy5ezA=;
	h=From:To:CC:Subject:Date;
	b=S6NvlNeNNPe8rYO8HGjt1unjiGHTnAQYus1Hv0QVNAbg5RRJixfRft9OUXR1frGLC
	 9os8zrObjhDwk6F1Q0/nqZkLn8TVgOXmpk+AXzRbBFZvg8elVb8cQI40/Na2yoyel/
	 W8EtWarCOLvholA6Q8Zg+xnm1aeU7FgGqzaLlsFA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57M5EjQR3356126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 00:14:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 00:14:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 00:14:44 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57M5EYpr3296152;
	Fri, 22 Aug 2025 00:14:35 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <shenghao-ding@ti.com>, <baojun.xu@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <k-yi@ti.com>,
        <henry.lo@ti.com>, <robinchen@ti.com>, <jesse-ji@ti.com>,
        <will-wang@ti.com>
Subject: [PATCH v2 1/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825 support
Date: Fri, 22 Aug 2025 13:14:08 +0800
Message-ID: <20250822051410.1732-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2IWA7DWWRL76JTDOPEBKJKR4JGTBOGAX
X-Message-ID-Hash: 2IWA7DWWRL76JTDOPEBKJKR4JGTBOGAX
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:07:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IWA7DWWRL76JTDOPEBKJKR4JGTBOGAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add tas2020, tas2118, tas2120, tas2320, tas5825 support in tas2781 driver.
Tas2118, tas2x20 have no on-chip DSP, tas5825 have on-chip DSP but
have no calibration required stereo smart amplifier.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v2:
 - Update the mail list for maintainers of yaml file
---
 include/sound/tas2781.h               |  11 +-
 include/sound/tas2x20-tlv.h           | 259 ++++++++++++++++++++++++++
 sound/soc/codecs/tas2781-comlib-i2c.c |   2 +
 sound/soc/codecs/tas2781-i2c.c        | 156 +++++++++++-----
 4 files changed, 381 insertions(+), 47 deletions(-)
 create mode 100644 include/sound/tas2x20-tlv.h

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index f0aefc04a957..73ac447b9327 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -51,7 +51,9 @@
 
 /* Software Reset, compatble with new device (TAS5825). */
 #define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
-#define TASDEVICE_REG_SWRESET_RESET	(BIT(0) | BIT(4))
+#define TASDEVICE_REG_SWRESET_RESET	BIT(0)
+
+#define TAS5825_REG_SWRESET_RESET	(BIT(0) | BIT(4))
 
 /* Checksum */
 #define TASDEVICE_CHECKSUM_REG		TASDEVICE_REG(0x0, 0x0, 0x7e)
@@ -110,8 +112,14 @@
 #define TAS2781_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x63, 0x44)
 
 enum audio_device {
+	TAS2020,
+	TAS2118,
+	TAS2120,
+	TAS2320,
 	TAS2563,
 	TAS2781,
+	TAS5825,
+	TAS_OTHERS,
 };
 
 enum dspbin_type {
@@ -194,6 +202,7 @@ struct tasdevice_priv {
 	unsigned char coef_binaryname[64];
 	unsigned char rca_binaryname[64];
 	unsigned char dev_name[32];
+	const unsigned char (*dvc_tlv_table)[4];
 	const char *name_prefix;
 	unsigned char ndev;
 	unsigned int dspbin_typ;
diff --git a/include/sound/tas2x20-tlv.h b/include/sound/tas2x20-tlv.h
new file mode 100644
index 000000000000..6e6bcec4a0a1
--- /dev/null
+++ b/include/sound/tas2x20-tlv.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS2x20/TAS2118 Audio Smart Amplifier
+//
+// Copyright (C) 2025 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS2x20/TAS2118 hda driver implements for one, two, or even multiple
+// TAS2x20/TAS2118 chips.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+//
+
+#ifndef __TAS2X20_TLV_H__
+#define __TAS2X20_TLV_H__
+
+#define TAS2X20_DVC_LEVEL		TASDEVICE_REG(0x0, 0x2, 0x0c)
+#define TAS2X20_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x07)
+
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2x20_dvc_tlv, 1650, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2x20_amp_tlv, 2100, 50, 0);
+
+/* pow(10, db/20) * pow(2,22) */
+static const __maybe_unused unsigned char tas2x20_dvc_table[][4] = {
+	{ 0X00, 0X00, 0X0D, 0X00 }, /* -110.0db */
+	{ 0X00, 0X00, 0X0E, 0X00 }, /* -109.5db */
+	{ 0X00, 0X00, 0X0E, 0X00 }, /* -109.0db */
+	{ 0X00, 0X00, 0X0F, 0X00 }, /* -108.5db */
+	{ 0X00, 0X00, 0X10, 0X00 }, /* -108.0db */
+	{ 0X00, 0X00, 0X11, 0X00 }, /* -107.5db */
+	{ 0X00, 0X00, 0X12, 0X00 }, /* -107.0db */
+	{ 0X00, 0X00, 0X13, 0X00 }, /* -106.5db */
+	{ 0X00, 0X00, 0X15, 0X00 }, /* -106.0db */
+	{ 0X00, 0X00, 0X16, 0X00 }, /* -105.5db */
+	{ 0X00, 0X00, 0X17, 0X00 }, /* -105.0db */
+	{ 0X00, 0X00, 0X18, 0X00 }, /* -104.5db */
+	{ 0X00, 0X00, 0X1A, 0X00 }, /* -104.0db */
+	{ 0X00, 0X00, 0X1C, 0X00 }, /* -103.5db */
+	{ 0X00, 0X00, 0X1D, 0X00 }, /* -103.0db */
+	{ 0X00, 0X00, 0X1F, 0X00 }, /* -102.5db */
+	{ 0X00, 0X00, 0X21, 0X00 }, /* -102.0db */
+	{ 0X00, 0X00, 0X23, 0X00 }, /* -101.5db */
+	{ 0X00, 0X00, 0X25, 0X00 }, /* -101.0db */
+	{ 0X00, 0X00, 0X27, 0X00 }, /* -100.5db */
+	{ 0X00, 0X00, 0X29, 0X00 }, /* -100.0db */
+	{ 0X00, 0X00, 0X2C, 0X00 }, /* -99.5db */
+	{ 0X00, 0X00, 0X2F, 0X00 }, /* -99.0db */
+	{ 0X00, 0X00, 0X31, 0X00 }, /* -98.5db */
+	{ 0X00, 0X00, 0X34, 0X00 }, /* -98.0db */
+	{ 0X00, 0X00, 0X37, 0X00 }, /* -97.5db */
+	{ 0X00, 0X00, 0X3B, 0X00 }, /* -97.0db */
+	{ 0X00, 0X00, 0X3E, 0X00 }, /* -96.5db */
+	{ 0X00, 0X00, 0X42, 0X00 }, /* -96.0db */
+	{ 0X00, 0X00, 0X46, 0X00 }, /* -95.5db */
+	{ 0X00, 0X00, 0X4A, 0X00 }, /* -95.0db */
+	{ 0X00, 0X00, 0X4F, 0X00 }, /* -94.5db */
+	{ 0X00, 0X00, 0X53, 0X00 }, /* -94.0db */
+	{ 0X00, 0X00, 0X58, 0X00 }, /* -93.5db */
+	{ 0X00, 0X00, 0X5D, 0X00 }, /* -93.0db */
+	{ 0X00, 0X00, 0X63, 0X00 }, /* -92.5db */
+	{ 0X00, 0X00, 0X69, 0X00 }, /* -92.0db */
+	{ 0X00, 0X00, 0X6F, 0X00 }, /* -91.5db */
+	{ 0X00, 0X00, 0X76, 0X00 }, /* -91.0db */
+	{ 0X00, 0X00, 0X7D, 0X00 }, /* -90.5db */
+	{ 0X00, 0X00, 0X84, 0X00 }, /* -90.0db */
+	{ 0X00, 0X00, 0X8C, 0X00 }, /* -89.5db */
+	{ 0X00, 0X00, 0X94, 0X00 }, /* -89.0db */
+	{ 0X00, 0X00, 0X9D, 0X00 }, /* -88.5db */
+	{ 0X00, 0X00, 0XA6, 0X00 }, /* -88.0db */
+	{ 0X00, 0X00, 0XB0, 0X00 }, /* -87.5db */
+	{ 0X00, 0X00, 0XBB, 0X00 }, /* -87.0db */
+	{ 0X00, 0X00, 0XC6, 0X00 }, /* -86.5db */
+	{ 0X00, 0X00, 0XD2, 0X00 }, /* -86.0db */
+	{ 0X00, 0X00, 0XDE, 0X00 }, /* -85.5db */
+	{ 0X00, 0X00, 0XEB, 0X00 }, /* -85.0db */
+	{ 0X00, 0X00, 0XF9, 0X00 }, /* -84.5db */
+	{ 0X00, 0X01, 0X08, 0X00 }, /* -84.0db */
+	{ 0X00, 0X01, 0X18, 0X00 }, /* -83.5db */
+	{ 0X00, 0X01, 0X28, 0X00 }, /* -83.0db */
+	{ 0X00, 0X01, 0X3A, 0X00 }, /* -82.5db */
+	{ 0X00, 0X01, 0X4D, 0X00 }, /* -82.0db */
+	{ 0X00, 0X01, 0X60, 0X00 }, /* -81.5db */
+	{ 0X00, 0X01, 0X75, 0X00 }, /* -81.0db */
+	{ 0X00, 0X01, 0X8B, 0X00 }, /* -80.5db */
+	{ 0X00, 0X01, 0XA3, 0X00 }, /* -80.0db */
+	{ 0X00, 0X01, 0XBC, 0X00 }, /* -79.5db */
+	{ 0X00, 0X01, 0XD6, 0X00 }, /* -79.0db */
+	{ 0X00, 0X01, 0XF2, 0X00 }, /* -78.5db */
+	{ 0X00, 0X02, 0X10, 0X00 }, /* -78.0db */
+	{ 0X00, 0X02, 0X2F, 0X00 }, /* -77.5db */
+	{ 0X00, 0X02, 0X50, 0X00 }, /* -77.0db */
+	{ 0X00, 0X02, 0X73, 0X00 }, /* -76.5db */
+	{ 0X00, 0X02, 0X98, 0X00 }, /* -76.0db */
+	{ 0X00, 0X02, 0XC0, 0X00 }, /* -75.5db */
+	{ 0X00, 0X02, 0XE9, 0X00 }, /* -75.0db */
+	{ 0X00, 0X03, 0X16, 0X00 }, /* -74.5db */
+	{ 0X00, 0X03, 0X44, 0X00 }, /* -74.0db */
+	{ 0X00, 0X03, 0X76, 0X00 }, /* -73.5db */
+	{ 0X00, 0X03, 0XAA, 0X00 }, /* -73.0db */
+	{ 0X00, 0X03, 0XE2, 0X00 }, /* -72.5db */
+	{ 0X00, 0X04, 0X1D, 0X00 }, /* -72.0db */
+	{ 0X00, 0X04, 0X5B, 0X00 }, /* -71.5db */
+	{ 0X00, 0X04, 0X9E, 0X00 }, /* -71.0db */
+	{ 0X00, 0X04, 0XE4, 0X00 }, /* -70.5db */
+	{ 0X00, 0X05, 0X2E, 0X00 }, /* -70.0db */
+	{ 0X00, 0X05, 0X7C, 0X00 }, /* -69.5db */
+	{ 0X00, 0X05, 0XD0, 0X00 }, /* -69.0db */
+	{ 0X00, 0X06, 0X28, 0X00 }, /* -68.5db */
+	{ 0X00, 0X06, 0X85, 0X00 }, /* -68.0db */
+	{ 0X00, 0X06, 0XE8, 0X00 }, /* -67.5db */
+	{ 0X00, 0X07, 0X51, 0X00 }, /* -67.0db */
+	{ 0X00, 0X07, 0XC0, 0X00 }, /* -66.5db */
+	{ 0X00, 0X08, 0X36, 0X00 }, /* -66.0db */
+	{ 0X00, 0X08, 0XB2, 0X00 }, /* -65.5db */
+	{ 0X00, 0X09, 0X36, 0X00 }, /* -65.0db */
+	{ 0X00, 0X09, 0XC2, 0X00 }, /* -64.5db */
+	{ 0X00, 0X0A, 0X56, 0X00 }, /* -64.0db */
+	{ 0X00, 0X0A, 0XF3, 0X00 }, /* -63.5db */
+	{ 0X00, 0X0B, 0X99, 0X00 }, /* -63.0db */
+	{ 0X00, 0X0C, 0X49, 0X00 }, /* -62.5db */
+	{ 0X00, 0X0D, 0X03, 0X00 }, /* -62.0db */
+	{ 0X00, 0X0D, 0XC9, 0X00 }, /* -61.5db */
+	{ 0X00, 0X0E, 0X9A, 0X00 }, /* -61.0db */
+	{ 0X00, 0X0F, 0X77, 0X00 }, /* -60.5db */
+	{ 0X00, 0X10, 0X62, 0X00 }, /* -60.0db */
+	{ 0X00, 0X11, 0X5A, 0X00 }, /* -59.5db */
+	{ 0X00, 0X12, 0X62, 0X00 }, /* -59.0db */
+	{ 0X00, 0X13, 0X78, 0X00 }, /* -58.5db */
+	{ 0X00, 0X14, 0XA0, 0X00 }, /* -58.0db */
+	{ 0X00, 0X15, 0XD9, 0X00 }, /* -57.5db */
+	{ 0X00, 0X17, 0X24, 0X00 }, /* -57.0db */
+	{ 0X00, 0X18, 0X83, 0X00 }, /* -56.5db */
+	{ 0X00, 0X19, 0XF7, 0X00 }, /* -56.0db */
+	{ 0X00, 0X1B, 0X81, 0X00 }, /* -55.5db */
+	{ 0X00, 0X1D, 0X22, 0X00 }, /* -55.0db */
+	{ 0X00, 0X1E, 0XDC, 0X00 }, /* -54.5db */
+	{ 0X00, 0X20, 0XB0, 0X00 }, /* -54.0db */
+	{ 0X00, 0X22, 0XA0, 0X00 }, /* -53.5db */
+	{ 0X00, 0X24, 0XAD, 0X00 }, /* -53.0db */
+	{ 0X00, 0X26, 0XDA, 0X00 }, /* -52.5db */
+	{ 0X00, 0X29, 0X27, 0X00 }, /* -52.0db */
+	{ 0X00, 0X2B, 0X97, 0X00 }, /* -51.5db */
+	{ 0X00, 0X2E, 0X2D, 0X00 }, /* -51.0db */
+	{ 0X00, 0X30, 0XE9, 0X00 }, /* -50.5db */
+	{ 0X00, 0X33, 0XCF, 0X00 }, /* -50.0db */
+	{ 0X00, 0X36, 0XE1, 0X00 }, /* -49.5db */
+	{ 0X00, 0X3A, 0X21, 0X00 }, /* -49.0db */
+	{ 0X00, 0X3D, 0X93, 0X00 }, /* -48.5db */
+	{ 0X00, 0X41, 0X39, 0X00 }, /* -48.0db */
+	{ 0X00, 0X45, 0X17, 0X00 }, /* -47.5db */
+	{ 0X00, 0X49, 0X2F, 0X00 }, /* -47.0db */
+	{ 0X00, 0X4D, 0X85, 0X00 }, /* -46.5db */
+	{ 0X00, 0X52, 0X1D, 0X00 }, /* -46.0db */
+	{ 0X00, 0X56, 0XFA, 0X00 }, /* -45.5db */
+	{ 0X00, 0X5C, 0X22, 0X00 }, /* -45.0db */
+	{ 0X00, 0X61, 0X97, 0X00 }, /* -44.5db */
+	{ 0X00, 0X67, 0X60, 0X00 }, /* -44.0db */
+	{ 0X00, 0X6D, 0X80, 0X00 }, /* -43.5db */
+	{ 0X00, 0X73, 0XFD, 0X00 }, /* -43.0db */
+	{ 0X00, 0X7A, 0XDC, 0X00 }, /* -42.5db */
+	{ 0X00, 0X82, 0X24, 0X00 }, /* -42.0db */
+	{ 0X00, 0X89, 0XDA, 0X00 }, /* -41.5db */
+	{ 0X00, 0X92, 0X05, 0X00 }, /* -41.0db */
+	{ 0X00, 0X9A, 0XAC, 0X00 }, /* -40.5db */
+	{ 0X00, 0XA3, 0XD7, 0X00 }, /* -40.0db */
+	{ 0X00, 0XAD, 0X8C, 0X00 }, /* -39.5db */
+	{ 0X00, 0XB7, 0XD4, 0X00 }, /* -39.0db */
+	{ 0X00, 0XC2, 0XB9, 0X00 }, /* -38.5db */
+	{ 0X00, 0XCE, 0X43, 0X00 }, /* -38.0db */
+	{ 0X00, 0XDA, 0X7B, 0X00 }, /* -37.5db */
+	{ 0X00, 0XE7, 0X6E, 0X00 }, /* -37.0db */
+	{ 0X00, 0XF5, 0X24, 0X00 }, /* -36.5db */
+	{ 0X01, 0X03, 0XAB, 0X00 }, /* -36.0db */
+	{ 0X01, 0X13, 0X0E, 0X00 }, /* -35.5db */
+	{ 0X01, 0X23, 0X5A, 0X00 }, /* -35.0db */
+	{ 0X01, 0X34, 0X9D, 0X00 }, /* -34.5db */
+	{ 0X01, 0X46, 0XE7, 0X00 }, /* -34.0db */
+	{ 0X01, 0X5A, 0X46, 0X00 }, /* -33.5db */
+	{ 0X01, 0X6E, 0XCA, 0X00 }, /* -33.0db */
+	{ 0X01, 0X84, 0X86, 0X00 }, /* -32.5db */
+	{ 0X01, 0X9B, 0X8C, 0X00 }, /* -32.0db */
+	{ 0X01, 0XB3, 0XEE, 0X00 }, /* -31.5db */
+	{ 0X01, 0XCD, 0XC3, 0X00 }, /* -31.0db */
+	{ 0X01, 0XE9, 0X20, 0X00 }, /* -30.5db */
+	{ 0X02, 0X06, 0X1B, 0X00 }, /* -30.0db */
+	{ 0X02, 0X24, 0XCE, 0X00 }, /* -29.5db */
+	{ 0X02, 0X45, 0X53, 0X00 }, /* -29.0db */
+	{ 0X02, 0X67, 0XC5, 0X00 }, /* -28.5db */
+	{ 0X02, 0X8C, 0X42, 0X00 }, /* -28.0db */
+	{ 0X02, 0XB2, 0XE8, 0X00 }, /* -27.5db */
+	{ 0X02, 0XDB, 0XD8, 0X00 }, /* -27.0db */
+	{ 0X03, 0X07, 0X36, 0X00 }, /* -26.5db */
+	{ 0X03, 0X35, 0X25, 0X00 }, /* -26.0db */
+	{ 0X03, 0X65, 0XCD, 0X00 }, /* -25.5db */
+	{ 0X03, 0X99, 0X57, 0X00 }, /* -25.0db */
+	{ 0X03, 0XCF, 0XEE, 0X00 }, /* -24.5db */
+	{ 0X04, 0X09, 0XC2, 0X00 }, /* -24.0db */
+	{ 0X04, 0X47, 0X03, 0X00 }, /* -23.5db */
+	{ 0X04, 0X87, 0XE5, 0X00 }, /* -23.0db */
+	{ 0X04, 0XCC, 0XA0, 0X00 }, /* -22.5db */
+	{ 0X05, 0X15, 0X6D, 0X00 }, /* -22.0db */
+	{ 0X05, 0X62, 0X8A, 0X00 }, /* -21.5db */
+	{ 0X05, 0XB4, 0X39, 0X00 }, /* -21.0db */
+	{ 0X06, 0X0A, 0XBF, 0X00 }, /* -20.5db */
+	{ 0X06, 0X66, 0X66, 0X00 }, /* -20.0db */
+	{ 0X06, 0XC7, 0X7B, 0X00 }, /* -19.5db */
+	{ 0X07, 0X2E, 0X50, 0X00 }, /* -19.0db */
+	{ 0X07, 0X9B, 0X3D, 0X00 }, /* -18.5db */
+	{ 0X08, 0X0E, 0X9F, 0X00 }, /* -18.0db */
+	{ 0X08, 0X88, 0XD7, 0X00 }, /* -17.5db */
+	{ 0X09, 0X0A, 0X4D, 0X00 }, /* -17.0db */
+	{ 0X09, 0X93, 0X6E, 0X00 }, /* -16.5db */
+	{ 0X0A, 0X24, 0XB0, 0X00 }, /* -16.0db */
+	{ 0X0A, 0XBE, 0X8D, 0X00 }, /* -15.5db */
+	{ 0X0B, 0X61, 0X88, 0X00 }, /* -15.0db */
+	{ 0X0C, 0X0E, 0X2B, 0X00 }, /* -14.5db */
+	{ 0X0C, 0XC5, 0X09, 0X00 }, /* -14.0db */
+	{ 0X0D, 0X86, 0XBD, 0X00 }, /* -13.5db */
+	{ 0X0E, 0X53, 0XEB, 0X00 }, /* -13.0db */
+	{ 0X0F, 0X2D, 0X42, 0X00 }, /* -12.5db */
+	{ 0X10, 0X13, 0X79, 0X00 }, /* -12.0db */
+	{ 0X11, 0X07, 0X54, 0X00 }, /* -11.5db */
+	{ 0X12, 0X09, 0XA3, 0X00 }, /* -11.0db */
+	{ 0X13, 0X1B, 0X40, 0X00 }, /* -10.5db */
+	{ 0X14, 0X3D, 0X13, 0X00 }, /* -10.0db */
+	{ 0X15, 0X70, 0X12, 0X00 }, /* -9.5db */
+	{ 0X16, 0XB5, 0X43, 0X00 }, /* -9.0db */
+	{ 0X18, 0X0D, 0XB8, 0X00 }, /* -8.5db */
+	{ 0X19, 0X7A, 0X96, 0X00 }, /* -8.0db */
+	{ 0X1A, 0XFD, 0X13, 0X00 }, /* -7.5db */
+	{ 0X1C, 0X96, 0X76, 0X00 }, /* -7.0db */
+	{ 0X1E, 0X48, 0X1C, 0X00 }, /* -6.5db */
+	{ 0X20, 0X13, 0X73, 0X00 }, /* -6.0db */
+	{ 0X21, 0XFA, 0X02, 0X00 }, /* -5.5db */
+	{ 0X23, 0XFD, 0X66, 0X00 }, /* -5.0db */
+	{ 0X26, 0X1F, 0X54, 0X00 }, /* -4.5db */
+	{ 0X28, 0X61, 0X9A, 0X00 }, /* -4.0db */
+	{ 0X2A, 0XC6, 0X25, 0X00 }, /* -3.5db */
+	{ 0X2D, 0X4E, 0XFB, 0X00 }, /* -3.0db */
+	{ 0X2F, 0XFE, 0X44, 0X00 }, /* -2.5db */
+	{ 0X32, 0XD6, 0X46, 0X00 }, /* -2.0db */
+	{ 0X35, 0XD9, 0X6B, 0X00 }, /* -1.5db */
+	{ 0X39, 0X0A, 0X41, 0X00 }, /* -1.0db */
+	{ 0X3C, 0X6B, 0X7E, 0X00 }, /* -0.5db */
+	{ 0X40, 0X00, 0X00, 0X00 }, /* 0.0db */
+	{ 0X43, 0XCA, 0XD0, 0X00 }, /* 0.5db */
+	{ 0X47, 0XCF, 0X26, 0X00 }, /* 1.0db */
+	{ 0X4C, 0X10, 0X6B, 0X00 }, /* 1.5db */
+	{ 0X50, 0X92, 0X3B, 0X00 }, /* 2.0db */
+	{ 0X55, 0X58, 0X6A, 0X00 }, /* 2.5db */
+	{ 0X5A, 0X67, 0X03, 0X00 }, /* 3.0db */
+	{ 0X5F, 0XC2, 0X53, 0X00 }, /* 3.5db */
+	{ 0X65, 0X6E, 0XE3, 0X00 }, /* 4.0db */
+	{ 0X6B, 0X71, 0X86, 0X00 }, /* 4.5db */
+	{ 0X71, 0XCF, 0X54, 0X00 }, /* 5.0db */
+	{ 0X78, 0X8D, 0XB4, 0X00 }, /* 5.5db */
+	{ 0X7F, 0XB2, 0X61, 0X00 }, /* 6.0db */
+};
+#endif
diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index c078bb0a8437..764304604e2c 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -320,6 +320,8 @@ void tasdevice_reset(struct tasdevice_priv *tas_dev)
 		for (i = 0; i < tas_dev->ndev; i++) {
 			ret = tasdevice_dev_write(tas_dev, i,
 				TASDEVICE_REG_SWRESET,
+				tas_dev->chip_id == TAS5825 ?
+				TAS5825_REG_SWRESET_RESET :
 				TASDEVICE_REG_SWRESET_RESET);
 			if (ret < 0)
 				dev_err(tas_dev->dev,
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index ea3cdb8553de..cf6bd4d63f31 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -30,8 +30,10 @@
 #include <sound/tas2781.h>
 #include <sound/tas2781-comlib-i2c.h>
 #include <sound/tlv.h>
+#include <sound/tas2x20-tlv.h>
 #include <sound/tas2563-tlv.h>
 #include <sound/tas2781-tlv.h>
+#include <sound/tas5825-tlv.h>
 #include <linux/unaligned.h>
 
 #define X2563_CL_STT_VAL(xreg, xval) \
@@ -98,16 +100,26 @@ static const struct bulk_reg_val tas2781_cali_start_reg[] = {
 };
 
 static const struct i2c_device_id tasdevice_id[] = {
+	{ "tas2020", TAS2020 },
+	{ "tas2118", TAS2118 },
+	{ "tas2120", TAS2120 },
+	{ "tas2320", TAS2320 },
 	{ "tas2563", TAS2563 },
 	{ "tas2781", TAS2781 },
+	{ "tas5825", TAS5825 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tasdevice_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id tasdevice_of_match[] = {
+	{ .compatible = "ti,tas2020" },
+	{ .compatible = "ti,tas2118" },
+	{ .compatible = "ti,tas2120" },
+	{ .compatible = "ti,tas2320" },
 	{ .compatible = "ti,tas2563" },
 	{ .compatible = "ti,tas2781" },
+	{ .compatible = "ti,tas5825" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -797,7 +809,7 @@ static int tasdev_nop_get(
 	return 0;
 }
 
-static int tas2563_digital_gain_get(
+static int tasdevice_digital_gain_get(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -823,15 +835,15 @@ static int tas2563_digital_gain_get(
 
 	while (r > 1 + l) {
 		mid = (l + r) / 2;
-		ar_mid = get_unaligned_be32(tas2563_dvc_table[mid]);
+		ar_mid = get_unaligned_be32(tas_dev->dvc_tlv_table[mid]);
 		if (target < ar_mid)
 			r = mid;
 		else
 			l = mid;
 	}
 
-	ar_l = get_unaligned_be32(tas2563_dvc_table[l]);
-	ar_r = get_unaligned_be32(tas2563_dvc_table[r]);
+	ar_l = get_unaligned_be32(tas_dev->dvc_tlv_table[l]);
+	ar_r = get_unaligned_be32(tas_dev->dvc_tlv_table[r]);
 
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
@@ -841,7 +853,7 @@ static int tas2563_digital_gain_get(
 	return 0;
 }
 
-static int tas2563_digital_gain_put(
+static int tasdevice_digital_gain_put(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -867,7 +879,7 @@ static int tas2563_digital_gain_put(
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
-	volwr = get_unaligned_be32(tas2563_dvc_table[vol]);
+	volwr = get_unaligned_be32(tas_dev->dvc_tlv_table[vol]);
 
 	if (volrd == volwr) {
 		rc = 0;
@@ -876,7 +888,7 @@ static int tas2563_digital_gain_put(
 
 	for (i = 0; i < tas_dev->ndev; i++) {
 		ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
-			(unsigned char *)tas2563_dvc_table[vol], 4);
+			(unsigned char *)tas_dev->dvc_tlv_table[vol], 4);
 		if (ret) {
 			dev_err(tas_dev->dev,
 				"%s, set digital vol error in dev %d\n",
@@ -892,11 +904,6 @@ static int tas2563_digital_gain_put(
 	return rc;
 }
 
-static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
-	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
-		tasdev_force_fwload_get, tasdev_force_fwload_put),
-};
-
 static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
 	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
 		tasdev_nop_get, tasdev_calib_stop_put),
@@ -907,6 +914,16 @@ static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
 	SND_SOC_BYTES_EXT("Amp XMA2 Data", 6, tasdev_XMA2_data_get, NULL),
 };
 
+static const struct snd_kcontrol_new tas2x20_snd_controls[] = {
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2X20_AMP_LEVEL,
+		0, 0, 42, 1, tas2781_amp_getvol,
+		tas2781_amp_putvol, tas2x20_amp_tlv),
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2X20_DVC_LEVEL,
+		0, 0, ARRAY_SIZE(tas2x20_dvc_table) - 1, 0,
+		tasdevice_digital_gain_get, tasdevice_digital_gain_put,
+		tas2x20_dvc_tlv),
+};
+
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
@@ -916,6 +933,15 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 		tas2781_digital_putvol, tas2781_dvc_tlv),
 };
 
+static const struct snd_kcontrol_new tas5825_snd_controls[] = {
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS5825_AMP_LEVEL,
+		0, 0, 31, 1, tas2781_amp_getvol,
+		tas2781_amp_putvol, tas5825_amp_tlv),
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS5825_DVC_LEVEL,
+		0, 0, 254, 1, tas2781_amp_getvol,
+		tas2781_amp_putvol, tas5825_dvc_tlv),
+};
+
 static const struct snd_kcontrol_new tas2781_cali_controls[] = {
 	SND_SOC_BYTES_EXT("Amp Latch Data", 3, tas2781_latch_reg_get, NULL),
 };
@@ -923,7 +949,7 @@ static const struct snd_kcontrol_new tas2781_cali_controls[] = {
 static const struct snd_kcontrol_new tas2563_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2563_DVC_LVL, 0,
 		0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
-		tas2563_digital_gain_get, tas2563_digital_gain_put,
+		tasdevice_digital_gain_get, tasdevice_digital_gain_put,
 		tas2563_dvc_tlv),
 };
 
@@ -968,7 +994,7 @@ static int tasdevice_info_chip_id(struct snd_kcontrol *kcontrol,
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
-	uinfo->value.integer.min = TAS2563;
+	uinfo->value.integer.min = TAS2020;
 	uinfo->value.integer.max = TAS2781;
 
 	return 0;
@@ -1168,9 +1194,9 @@ static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
 static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *dsp_ctrls;
-	char *active_dev_num, *chip_id;
+	char *active_dev_num, *chip_id, *fw_load;
 	char *conf_name, *prog_name;
-	int nr_controls = 4;
+	int nr_controls = 5;
 	int mix_index = 0;
 
 	/* Alloc kcontrol via devm_kzalloc, which don't manually
@@ -1228,6 +1254,19 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	dsp_ctrls[mix_index].get = tasdevice_get_chip_id;
 	mix_index++;
 
+	fw_load = devm_kstrdup(tas_priv->dev, "Speaker Force Firmware Load",
+		GFP_KERNEL);
+	if (!fw_load)
+		return -ENOMEM;
+
+	dsp_ctrls[mix_index].name = fw_load;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = snd_soc_info_bool_ext;
+	dsp_ctrls[mix_index].put = tasdev_force_fwload_put;
+	dsp_ctrls[mix_index].get = tasdev_force_fwload_get;
+	dsp_ctrls[mix_index].private_value = 0UL;
+	mix_index++;
+
 	return snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
 		nr_controls < mix_index ? nr_controls : mix_index);
 }
@@ -1587,6 +1626,9 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	 * failing to load DSP firmware is NOT an error.
 	 */
 	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
+	/* There is no DSP firmware required for TAS2118/2X20. */
+	if (tas_priv->chip_id < TAS2563)
+		goto out;
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->coef_binaryname, 64, "%s-%s_coef.bin",
 			tas_priv->name_prefix, tas_priv->dev_name);
@@ -1608,34 +1650,37 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		dev_err(tas_priv->dev, "dsp controls error\n");
 		goto out;
 	}
-
-	ret = tasdevice_create_cali_ctrls(tas_priv);
-	if (ret) {
-		dev_err(tas_priv->dev, "cali controls error\n");
-		goto out;
-	}
-
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
-	/* If calibrated data occurs error, dsp will still works with default
-	 * calibrated data inside algo.
-	 */
-	for (i = 0; i < tas_priv->ndev; i++) {
-		if (tas_priv->name_prefix)
-			scnprintf(tas_priv->cal_binaryname[i], 64,
-				"%s-%s_cal_0x%02x.bin", tas_priv->name_prefix,
-				tas_priv->dev_name,
-				tas_priv->tasdevice[i].dev_addr);
-		else
-			scnprintf(tas_priv->cal_binaryname[i], 64,
-				"%s_cal_0x%02x.bin", tas_priv->dev_name,
-				tas_priv->tasdevice[i].dev_addr);
-		ret = tas2781_load_calibration(tas_priv,
-			tas_priv->cal_binaryname[i], i);
-		if (ret != 0)
-			dev_err(tas_priv->dev,
-				"%s: load %s error, default will effect\n",
-				__func__, tas_priv->cal_binaryname[i]);
+	/* There is no calibration required for TAS5825. */
+	if (tas_priv->chip_id < TAS5825) {
+		ret = tasdevice_create_cali_ctrls(tas_priv);
+		if (ret) {
+			dev_err(tas_priv->dev, "cali controls error\n");
+			goto out;
+		}
+		/* If calibrated data occurs error, dsp will still works
+		 * with default calibrated data inside algo.
+		 */
+		for (i = 0; i < tas_priv->ndev; i++) {
+			if (tas_priv->name_prefix)
+				scnprintf(tas_priv->cal_binaryname[i], 64,
+					  "%s-%s_cal_0x%02x.bin",
+					  tas_priv->name_prefix,
+					  tas_priv->dev_name,
+					  tas_priv->tasdevice[i].dev_addr);
+			else
+				scnprintf(tas_priv->cal_binaryname[i], 64,
+					  "%s_cal_0x%02x.bin",
+					  tas_priv->dev_name,
+					  tas_priv->tasdevice[i].dev_addr);
+			ret = tas2781_load_calibration(tas_priv,
+				tas_priv->cal_binaryname[i], i);
+			if (ret != 0)
+				dev_err(tas_priv->dev,
+					"%s: load %s error, keep default.\n",
+					__func__, tas_priv->cal_binaryname[i]);
+		}
 	}
 
 	tasdevice_prmg_load(tas_priv, 0);
@@ -1658,7 +1703,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		comp, &acoustic_ctl_fops);
 #endif
 out:
-	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
+	if ((tas_priv->fw_state == TASDEVICE_RCA_FW_OK) &&
+	    (tas_priv->chip_id >= TAS2563)) {
 		/* If DSP FW fail, DSP kcontrol won't be created. */
 		tasdevice_dsp_remove(tas_priv);
 	}
@@ -1804,13 +1850,27 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	int rc;
 
 	switch (tas_priv->chip_id) {
+	case TAS2020:
+	case TAS2118:
+	case TAS2120:
+	case TAS2320:
+		p = (struct snd_kcontrol_new *)tas2x20_snd_controls;
+		size = ARRAY_SIZE(tas2x20_snd_controls);
+		tas_priv->dvc_tlv_table = tas2x20_dvc_table;
+		break;
 	case TAS2781:
 		p = (struct snd_kcontrol_new *)tas2781_snd_controls;
 		size = ARRAY_SIZE(tas2781_snd_controls);
 		break;
+	case TAS5825:
+		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
+		size = ARRAY_SIZE(tas5825_snd_controls);
+		break;
 	default:
 		p = (struct snd_kcontrol_new *)tas2563_snd_controls;
 		size = ARRAY_SIZE(tas2563_snd_controls);
+		tas_priv->dvc_tlv_table = tas2563_dvc_table;
+		break;
 	}
 
 	rc = snd_soc_add_component_controls(codec, p, size);
@@ -1850,8 +1910,6 @@ static const struct snd_soc_component_driver
 	soc_codec_driver_tasdevice = {
 	.probe			= tasdevice_codec_probe,
 	.remove			= tasdevice_codec_remove,
-	.controls		= tasdevice_snd_controls,
-	.num_controls		= ARRAY_SIZE(tasdevice_snd_controls),
 	.dapm_widgets		= tasdevice_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tasdevice_dapm_widgets),
 	.dapm_routes		= tasdevice_audio_map,
@@ -1967,7 +2025,13 @@ static void tasdevice_i2c_remove(struct i2c_client *client)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id tasdevice_acpi_match[] = {
-	{ "TAS2781", TAS2781 },
+	{ "TXNW2020", TAS2020 },
+	{ "TXNW2118", TAS2118 },
+	{ "TXNW2120", TAS2120 },
+	{ "TXNW2320", TAS2320 },
+	{ "TXNW2563", TAS2563 },
+	{ "TXNW2781", TAS2781 },
+	{ "TXNW5825", TAS5825 },
 	{},
 };
 
-- 
2.43.0

