Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C394A25A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 10:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83C0C1903;
	Wed,  7 Aug 2024 10:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83C0C1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723017970;
	bh=mpkpkfRcqC7mmKa6jwUnulhzEDpq/knJSbY79MsWcxk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i5E84zOJMumg+4jqsMHAcbCZWey62KbM7Swt/fMGbJS1/h3/8eWKQPruvoZXlSdMR
	 lCVLu3HCyB3zvn4V3geMpByUgdCDC3KDudtLMqB4VQkDIGUUEkQGEj/Doiy0NwojKR
	 T3pwo/RNYz9M6X53DRgCqQ+222kfG0Qy27jhAvEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E80FCF805AB; Wed,  7 Aug 2024 10:05:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA41F80579;
	Wed,  7 Aug 2024 10:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADBD1F8047C; Wed,  7 Aug 2024 10:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D017AF800B0
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 09:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D017AF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=t8hdWdSb
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4777tqXX035878;
	Wed, 7 Aug 2024 02:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723017352;
	bh=s7LjaoEs4ssoZQMsj5bA7tff9F0fFtc8MKm7Pi+4uh8=;
	h=From:To:CC:Subject:Date;
	b=t8hdWdSb8a55HmJqaTvck9TExurc1CJyS10XBmClue1NwvLx7XCVmL3xuQKqpu8kd
	 pgYC/5RJ3Ije11gaz+gxz7tyUvII8+Fy8GHQi+LEjM8pd10tt7c8n0x7KPIIeGC2ZL
	 DDtt8mvBdQhhg4qPaMwvj7ZDyjZMMjWd47oNfIWw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4777tqik074757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 02:55:52 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 02:55:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 02:55:52 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4777tkLw123095;
	Wed, 7 Aug 2024 02:55:47 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <cameron.berkenpas@gmail.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>
Subject: [PATCH v1] ALSA: ASoC/tas2781: fix wrong calibrated data order
Date: Wed, 7 Aug 2024 15:55:40 +0800
Message-ID: <20240807075541.1458-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: YW6CTIFTJNY66GXXMJJDT4KCWITUIMYP
X-Message-ID-Hash: YW6CTIFTJNY66GXXMJJDT4KCWITUIMYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW6CTIFTJNY66GXXMJJDT4KCWITUIMYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baojun Xu <baojun.xu@ti.com>

Wrong calibration data order cause sound too low in some device.
Fix wrong calibrated data order, add calibration data converssion
by get_unaligned_be32() after reading from UEFI.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v1:
 - Change copyright date, and add new maintainer.
 - Add unaligned.h included for get_unaligned_be32().
 - In tas2781_apply_calib(), change data address transfer directly to
   get data by get_unaligned_be32(), and send address to device.
---
 sound/pci/hda/tas2781_hda_i2c.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 49bd7097d..4dc3350d5 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -2,10 +2,12 @@
 //
 // TAS2781 HDA I2C driver
 //
-// Copyright 2023 Texas Instruments, Inc.
+// Copyright 2023 - 2024 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
+// Current maintainer: Baojun Xu <baojun.xu@ti.com>
 
+#include <asm/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/crc8.h>
 #include <linux/crc32.h>
@@ -519,20 +521,21 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 	static const unsigned char rgno_array[CALIB_MAX] = {
 		0x74, 0x0c, 0x14, 0x70, 0x7c,
 	};
-	unsigned char *data;
-	int i, j, rc;
+	int i, j, rc, data;
+	int offset = 0;
 
 	for (i = 0; i < tas_priv->ndev; i++) {
-		data = tas_priv->cali_data.data +
-			i * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
 		for (j = 0; j < CALIB_MAX; j++) {
+			data = get_unaligned_be32(
+				&tas_priv->cali_data.data[offset]);
 			rc = tasdevice_dev_bulk_write(tas_priv, i,
 				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
-				&(data[4 * j]), 4);
+				(unsigned char *)&data, 4);
 			if (rc < 0)
 				dev_err(tas_priv->dev,
 					"chn %d calib %d bulk_wr err = %d\n",
 					i, j, rc);
+			offset += 4;
 		}
 	}
 }
-- 
2.40.1

