Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FDA8AFA4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Apr 2025 07:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35FAE6BB05;
	Wed, 16 Apr 2025 07:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35FAE6BB05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744781025;
	bh=voLwMlG2CHMzwgcA2ppkhIz0XAmf9oe0ROwISvWdzJQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ggG2mRnUJvMxHaAVLS3cPIFaXDRice6Ylqo4MjdRP9Hm6JsaBnFKUpsdDbamKpRe/
	 FuiVN68WjQNMoKWcyvQx1nxH1R0YSzZyAgQe0qEa/EHRSH2LEBbWdBSqi0BxqhvXrt
	 BQVJYxVuMYMjH6m6u2AgFQ1z782K3QMAEQH+MUXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4331F805D8; Wed, 16 Apr 2025 07:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9311EF805CA;
	Wed, 16 Apr 2025 07:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7440CF80224; Wed, 16 Apr 2025 07:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 297F7F80027
	for <alsa-devel@alsa-project.org>; Wed, 16 Apr 2025 07:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 297F7F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rMo4o2fq
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G5IlWV2564926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 00:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744780727;
	bh=B9SELt7RxbB4eGa/NKNkpRq4PgXGEXrvy95SM69nqtk=;
	h=From:To:CC:Subject:Date;
	b=rMo4o2fqJqynuxiJb2q7w+sJS4dFdu000XJC4epibmQfiGplZVc7Aw6AhmZ04LmXw
	 fauGGX71K/wyPZ10I4yno3jsW+x6tubRDhiwyTx2MuLC+4vn6K/mVY65YrG0baJnPq
	 n7D7EFAHwucKLsoknx8nsxbjBALL+EiZHL6jp4DU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G5Ilv1050306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 00:18:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 00:18:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 00:18:46 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.84])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G5Igig016006;
	Wed, 16 Apr 2025 00:18:43 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: Create a common header for both spi and
 i2c tas2781 hda driver
Date: Wed, 16 Apr 2025 13:18:38 +0800
Message-ID: <20250416051838.2001-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: NRDQ76SOCWM6MWF35XUHSKUKLF57D7WM
X-Message-ID-Hash: NRDQ76SOCWM6MWF35XUHSKUKLF57D7WM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRDQ76SOCWM6MWF35XUHSKUKLF57D7WM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the common macro definition of kcontrols into a common header for code
cleanup, and create a common header to store the common declaration for
both spi and i2c hda driver.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Add the purpose of this patch.
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

