Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61523A83733
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 05:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8730699B2;
	Thu, 10 Apr 2025 05:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8730699B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744255462;
	bh=4gLD2iSfTNiIrGQ1C0EITHBwoEyxmBlxJRt1Xgh8Du0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pq8hqaNbmZFNEcypOpPDkQsOgcKflCZuCCypgIsm2G4DJIByboKwbTmtfTYlY7zF3
	 nbN+zoaGRuxjxMMauU+7LTIU+oO+IlsZswNxMVDTddDWFSgh7iZkJTHrzO+ZY6Fnk0
	 w2+8qELfsd8AOIsWgabL+Nlgt7m0MvxpRmp9i5z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2255FF80093; Thu, 10 Apr 2025 05:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DC0F805B5;
	Thu, 10 Apr 2025 05:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DFE7F8014C; Thu, 10 Apr 2025 05:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C67BF80093
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 05:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C67BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=mBHWduw4
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53A3NbOG1154658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 22:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744255417;
	bh=pxMt1M41FUy9blO34h2KKUXfMYsagOUCTDq2/DW2oAo=;
	h=From:To:CC:Subject:Date;
	b=mBHWduw4djUAwhiRzyzGUcFptdE9Ybevtl3e/bXQZMiMq/Yen2xGxIrf5dc/GWP2U
	 MTDlEgzMS7pMygL9aa0rr13ut3ZwOmnKLh7bSX8N9du6i0EGx9FYPL3e0rw3l6REd6
	 E2+//Yl7vLlLQNDXsN/qj5jzaMJzxRoMqEV3lBBs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53A3NbAO127993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 22:23:37 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 22:23:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 22:23:37 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.204])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53A3NWG7022629;
	Wed, 9 Apr 2025 22:23:33 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Create a common header for both spi and
 i2c tas2781 hda driver
Date: Thu, 10 Apr 2025 11:23:28 +0800
Message-ID: <20250410032328.1361-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: BQODN3DUSFECLZCLKJXXNBDPRBQGCUD3
X-Message-ID-Hash: BQODN3DUSFECLZCLKJXXNBDPRBQGCUD3
X-MailFrom: shenghao-ding@ti.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQODN3DUSFECLZCLKJXXNBDPRBQGCUD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the common macro definition of kcontrols into a common header.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Follow IWYU principle, add sound/asound.h into the header file.
v1:
 - Revise the year of spi and i2c tas2781 hda drivers.
 - Create a common header for both spi and i2c tas2781 hda driver to define
   the common macros and declare the common functions.
---
 sound/pci/hda/tas2781_hda.h     | 44 +++++++++++++++++++++++++++++++++
 sound/pci/hda/tas2781_hda_i2c.c | 29 ++--------------------
 sound/pci/hda/tas2781_hda_spi.c | 35 ++------------------------
 3 files changed, 48 insertions(+), 60 deletions(-)
 create mode 100644 sound/pci/hda/tas2781_hda.h

diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
new file mode 100644
index 000000000000..fc741fac419a
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * HDA audio driver for Texas Instruments TAS2781 smart amp
+ *
+ * Copyright (C) 2025 Texas Instruments, Inc.
+ */
+#ifndef __TAS2781_HDA_H__
+#define __TAS2781_HDA_H__
+
+#include <sound/asound.h>
+
+/*
+ * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
+ * Define two controls, one is Volume control callbacks, the other is
+ * flag setting control callbacks.
+ */
+
+/* Volume control callbacks for tas2781 */
+#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
+	xhandler_get, xhandler_put, tlv_array) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = xreg, .rreg = xreg, \
+		.shift = xshift, .rshift = xshift,\
+		.min = xmin, .max = xmax, .invert = xinvert, \
+	} \
+}
+
+/* Flag control callbacks for tas2781 */
+#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
+	.name = xname, \
+	.info = snd_ctl_boolean_mono_info, \
+	.get = xhandler_get, \
+	.put = xhandler_put, \
+	.private_value = xdata, \
+}
+
+#endif
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 29dc4f500580..9d94ae5fcfe0 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -2,7 +2,7 @@
 //
 // TAS2781 HDA I2C driver
 //
-// Copyright 2023 - 2024 Texas Instruments, Inc.
+// Copyright 2023 - 2025 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 // Current maintainer: Baojun Xu <baojun.xu@ti.com>
@@ -30,35 +30,10 @@
 #include "hda_component.h"
 #include "hda_jack.h"
 #include "hda_generic.h"
+#include "tas2781_hda.h"
 
 #define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
 
-/* No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
- * Define two controls, one is Volume control callbacks, the other is
- * flag setting control callbacks.
- */
-
-/* Volume control callbacks for tas2781 */
-#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
-	xhandler_get, xhandler_put, tlv_array) \
-{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname),\
-	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
-		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
-	.tlv.p = (tlv_array), \
-	.info = snd_soc_info_volsw, \
-	.get = xhandler_get, .put = xhandler_put, \
-	.private_value = (unsigned long)&(struct soc_mixer_control) \
-		{.reg = xreg, .rreg = xreg, .shift = xshift, \
-		 .rshift = xshift, .min = xmin, .max = xmax, \
-		 .invert = xinvert} }
-
-/* Flag control callbacks for tas2781 */
-#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
-{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = xname, \
-	.info = snd_ctl_boolean_mono_info, \
-	.get = xhandler_get, .put = xhandler_put, \
-	.private_value = xdata }
-
 enum calib_data {
 	R0_VAL = 0,
 	INV_R0,
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 399f2e4c3b62..c6be2be1b53e 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -2,7 +2,7 @@
 //
 // TAS2781 HDA SPI driver
 //
-// Copyright 2024 Texas Instruments, Inc.
+// Copyright 2024 - 2025 Texas Instruments, Inc.
 //
 // Author: Baojun Xu <baojun.xu@ti.com>
 
@@ -38,38 +38,7 @@
 #include "hda_component.h"
 #include "hda_jack.h"
 #include "hda_generic.h"
-
-/*
- * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
- * Define two controls, one is Volume control callbacks, the other is
- * flag setting control callbacks.
- */
-
-/* Volume control callbacks for tas2781 */
-#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
-	xhandler_get, xhandler_put, tlv_array) { \
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
-	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
-		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
-	.tlv.p = (tlv_array), \
-	.info = snd_soc_info_volsw, \
-	.get = xhandler_get, .put = xhandler_put, \
-	.private_value = (unsigned long)&(struct soc_mixer_control) { \
-		.reg = xreg, .rreg = xreg, \
-		.shift = xshift, .rshift = xshift,\
-		.min = xmin, .max = xmax, .invert = xinvert, \
-	} \
-}
-
-/* Flag control callbacks for tas2781 */
-#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
-	.name = xname, \
-	.info = snd_ctl_boolean_mono_info, \
-	.get = xhandler_get, \
-	.put = xhandler_put, \
-	.private_value = xdata, \
-}
+#include "tas2781_hda.h"
 
 struct tas2781_hda {
 	struct tasdevice_priv *priv;
-- 
2.34.1

