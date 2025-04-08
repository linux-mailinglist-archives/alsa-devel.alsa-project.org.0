Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D126EA7F2CC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Apr 2025 04:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A636301A;
	Tue,  8 Apr 2025 04:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A636301A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744080380;
	bh=dFZgIfW6J9JqAOCGoYJUBEK83CDU6WdFI4FdPcYhdH0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q40q3ta5oQzg9Gll0ojn2h9DSKItUhOqEEgdgR8uw7Q0rcOHCVqJCREgFep6Ba7PZ
	 Q+BOZCqOqpMzWrbS4C/yLmV2I3M+Ufp8uM9IX0pIn34I+rUkMwBB/0aMmz4cOmsv1v
	 8gYytJxcQZ/wtiI16ebG4S2pxOq6y9EDu+AL1pSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E529F805C6; Tue,  8 Apr 2025 04:45:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB013F805BD;
	Tue,  8 Apr 2025 04:45:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AC2BF8055B; Tue,  8 Apr 2025 04:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A24F80212
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 04:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A24F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=NTopvLP9
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5382jVZ01083560
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 21:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744080331;
	bh=2R7m1CEdB8Ku30E3/42aZQinnIPV1Ev6JHqtEK0ueqA=;
	h=From:To:CC:Subject:Date;
	b=NTopvLP9ldIAAZeyqxgQ0t+DP/PHzpsPXIzoO8nZTWxYJ2hv/fwmwfqYMmKkr7ZI+
	 N48Px+s0lnsfbze4so1fTi8sjedm2qIoyT0vZ0f0OtpRO1l3K0fJ9VhuQN8uRP694d
	 eXDLuvDg7igKGTNmgJQQOjJXEyirwhHzmzeTXm+M=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5382jVv8084336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 21:45:31 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 21:45:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 21:45:31 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.204])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5382jQbS079192;
	Mon, 7 Apr 2025 21:45:27 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Create a common header for both spi and
 i2c tas2781 hda driver
Date: Tue, 8 Apr 2025 10:45:22 +0800
Message-ID: <20250408024522.1338-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: H6DV4TSCVG7JBJMFCRFDK5PJ6EDKH2YM
X-Message-ID-Hash: H6DV4TSCVG7JBJMFCRFDK5PJ6EDKH2YM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6DV4TSCVG7JBJMFCRFDK5PJ6EDKH2YM/>
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
v1:
 - revise the year of spi and i2c tas2781 hda drivers.
 - Create a common header for both spi and i2c tas2781 hda driver to define
   the common macros and declare the common functions.
---
 sound/pci/hda/tas2781_hda.h     | 42 +++++++++++++++++++++++++++++++++
 sound/pci/hda/tas2781_hda_i2c.c | 29 ++---------------------
 sound/pci/hda/tas2781_hda_spi.c | 35 ++-------------------------
 3 files changed, 46 insertions(+), 60 deletions(-)
 create mode 100644 sound/pci/hda/tas2781_hda.h

diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
new file mode 100644
index 000000000000..c57909c0ed65
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * HDA audio driver for Texas Instruments TAS2781 smart amp
+ *
+ * Copyright (C) 2025 Texas Instruments, Inc.
+ */
+#ifndef __TAS2781_HDA_H__
+#define __TAS2781_HDA_H__
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

