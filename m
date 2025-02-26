Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2BA4FA44
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:37:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CEC60335;
	Wed,  5 Mar 2025 10:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CEC60335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167423;
	bh=AIa07tIosd2Q/2NEoeR7hFtxOIpGbJrJEPR0A/jih34=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GHaa2uLEnB4hgXx82hjZIhbIovCJjVU8Zitjy5cwmmXLCcP18OyoAKpkKtSTrH0rT
	 t4pT8zzWxKcnHbeWOdPSifFhJEM2VI7yaWkv8RDv6R/KBvfYfHa7lyO1Iteqlp0Wwx
	 MFf3bSd1oRvGjyRkkZ5jXlbUEz7mkD3f6fRTAsD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C3A6F8061F; Wed,  5 Mar 2025 10:35:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C22F8061B;
	Wed,  5 Mar 2025 10:35:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5576DF8016E; Wed, 26 Feb 2025 15:44:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A611BF8016D
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 15:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A611BF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=tx9qgFTf
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QEhvEr2100790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 08:43:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740581037;
	bh=/wxTwVL29KQhkgsTJJ0gr+cFwivRLGhTw6aMtsW1W0M=;
	h=From:To:CC:Subject:Date;
	b=tx9qgFTfAYPyyzBRUiUVoPKFb2ARIkEtiNw9Z3jtv/wG/il5lXKvruQE1/phkiFyq
	 VBRzYCMJcIvxFZ9oCcyp+ll0zFAMnUxf+mCSDcxtJ9C9T7yx61PfclBTSr07PJuv5q
	 fjpxE0dE+xLjHwFG6K1RPnuWmuWDJ9dmWnEq3rOg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QEhvCR092538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 08:43:57 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 08:43:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 08:43:57 -0600
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QEhrsp103598;
	Wed, 26 Feb 2025 08:43:54 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Clean up for some define
Date: Wed, 26 Feb 2025 22:43:28 +0800
Message-ID: <20250226144328.11645-1-baojun.xu@ti.com>
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
Message-ID-Hash: CX6OPD7BWTXKVAMUTGS7UWZH5J2PHQWA
X-Message-ID-Hash: CX6OPD7BWTXKVAMUTGS7UWZH5J2PHQWA
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:35:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CX6OPD7BWTXKVAMUTGS7UWZH5J2PHQWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do some clean up for some define in header file.
Like change lower case in value, up case in define,
space add in recommends, change date of files and add author.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781.h           | 21 +++++++++++----------
 sound/soc/codecs/tas2781-fmwlib.c |  7 ++++---
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 72d2060904f6..a2c8eb111e5f 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -11,6 +11,7 @@
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
+// Author: Baojun Xu <baojun.xu@ti.com>
 //
 
 #ifndef __TAS2781_H__
@@ -31,7 +32,7 @@
 	SNDRV_PCM_FMTBIT_S24_LE | \
 	SNDRV_PCM_FMTBIT_S32_LE)
 
-/*PAGE Control Register (available in page0 of each book) */
+/* PAGE Control Register (available in page0 of each book) */
 #define TASDEVICE_PAGE_SELECT		0x00
 #define TASDEVICE_BOOKCTL_PAGE		0x00
 #define TASDEVICE_BOOKCTL_REG		127
@@ -42,12 +43,12 @@
 #define TASDEVICE_REG(book, page, reg)	(((book * 256 * 128) + \
 					(page * 128)) + reg)
 
-/*Software Reset */
-#define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0X0, 0x01)
+/* Software Reset */
+#define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
 #define TASDEVICE_REG_SWRESET_RESET	BIT(0)
 
-/*I2C Checksum */
-#define TASDEVICE_I2CChecksum		TASDEVICE_REG(0x0, 0x0, 0x7E)
+/* I2C Checksum */
+#define TASDEVICE_CHECKSUM_REG		TASDEVICE_REG(0x0, 0x0, 0x7e)
 
 /* XM_340 */
 #define	TASDEVICE_XM_A1_REG	TASDEVICE_REG(0x64, 0x63, 0x3c)
@@ -55,8 +56,8 @@
 #define	TASDEVICE_XM_A2_REG	TASDEVICE_REG(0x64, 0x63, 0x38)
 
 /* Volume control */
-#define TAS2563_DVC_LVL			TASDEVICE_REG(0x00, 0x02, 0x0C)
-#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1A)
+#define TAS2563_DVC_LVL			TASDEVICE_REG(0x00, 0x02, 0x0c)
+#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1a)
 #define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
 #define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
 
@@ -95,8 +96,8 @@
 #define TAS2781_PRM_SINEGAIN_REG	TASDEVICE_REG(0x00, 0x14, 0x40)
 #define TAS2781_PRM_SINEGAIN2_REG	TASDEVICE_REG(0x00, 0x14, 0x44)
 
-#define TAS2781_TEST_UNLOCK_REG		TASDEVICE_REG(0x00, 0xFD, 0x0D)
-#define TAS2781_TEST_PAGE_UNLOCK	0x0D
+#define TAS2781_TEST_UNLOCK_REG		TASDEVICE_REG(0x00, 0xfd, 0x0d)
+#define TAS2781_TEST_PAGE_UNLOCK	0x0d
 
 #define TAS2781_RUNTIME_LATCH_RE_REG	TASDEVICE_REG(0x00, 0x00, 0x49)
 #define TAS2781_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x62, 0x48)
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 61d9c220b6a4..bc2f68bd9846 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2,9 +2,10 @@
 //
 // tas2781-fmwlib.c -- TASDEVICE firmware support
 //
-// Copyright 2023 - 2024 Texas Instruments, Inc.
+// Copyright 2023 - 2025 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
+// Author: Baojun Xu <baojun.xu@ti.com>
 
 #include <linux/crc8.h>
 #include <linux/firmware.h>
@@ -1496,7 +1497,7 @@ static int tasdev_block_chksum(struct tasdevice_priv *tas_priv,
 	unsigned int nr_value;
 	int ret;
 
-	ret = tasdevice_dev_read(tas_priv, chn, TASDEVICE_I2CChecksum,
+	ret = tasdevice_dev_read(tas_priv, chn, TASDEVICE_CHECKSUM_REG,
 		&nr_value);
 	if (ret < 0) {
 		dev_err(tas_priv->dev, "%s: Chn %d\n", __func__, chn);
@@ -1540,7 +1541,7 @@ static int tasdev_load_blk(struct tasdevice_priv *tas_priv,
 	while (block->nr_retry > 0) {
 		if (block->is_pchksum_present) {
 			ret = tasdevice_dev_write(tas_priv, chn,
-				TASDEVICE_I2CChecksum, 0);
+				TASDEVICE_CHECKSUM_REG, 0);
 			if (ret < 0)
 				break;
 		}
-- 
2.34.1

