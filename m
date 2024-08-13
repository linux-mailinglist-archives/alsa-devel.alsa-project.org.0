Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51094FCE3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 06:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D317219E;
	Tue, 13 Aug 2024 06:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D317219E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723523937;
	bh=gwJc0XVib0+KTUgs1o4JdC5RA69htRjz2E5EOUvji4c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d5r6+5ZYqTEoJBfJHZyFvmmf37EMIZ3E38jAs7VmUsh/bYvI+gvsUM1xrKQzn0rav
	 W240BaZ/vBfueiLWHzXwyJ+Y5OL8McXRhNbP438hG7qTdfl3o/lvbUz1yQmwFKt59D
	 bX9lvHYWk08j6w4YYGkPRwT3qVAKc3u/QlxSmWlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05CF5F805AD; Tue, 13 Aug 2024 06:38:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFD9F80580;
	Tue, 13 Aug 2024 06:38:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 386F2F80423; Tue, 13 Aug 2024 06:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4149EF8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 06:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4149EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=RRyvh5pT
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47D4c0mZ078328;
	Mon, 12 Aug 2024 23:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723523880;
	bh=Xte8G+0VpiYtF8McsRCLaZwIghkZ8dUUM0IzF8hp5JQ=;
	h=From:To:CC:Subject:Date;
	b=RRyvh5pTu1QOYIo/89sszeZXDPRdEcoMN7BVtFDstVulQ+G1DYWymzKCkBq7ESe8y
	 HYMRgJnAP+SYjwqgu4nejd+TcKUvw9qde4vOgh6hQHuGWeJDKscdKcDC8GXO4UrNNY
	 htssQWWCgZsNZoRWSLLkdEnksam18bR+w+JiErWo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47D4c09v083839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Aug 2024 23:38:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Aug 2024 23:37:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Aug 2024 23:37:59 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47D4bsqC107764;
	Mon, 12 Aug 2024 23:37:55 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <cameron.berkenpas@gmail.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>
Subject: [PATCH v2] ALSA: ASoC/tas2781: fix wrong calibrated data order
Date: Tue, 13 Aug 2024 12:37:48 +0800
Message-ID: <20240813043749.108-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: 2WH45OD524DXD7ZXLWKWIG4OSHBIO4ST
X-Message-ID-Hash: 2WH45OD524DXD7ZXLWKWIG4OSHBIO4ST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WH45OD524DXD7ZXLWKWIG4OSHBIO4ST/>
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
v2:
 - Change data type from int to __be32.
v1:
 - Change copyright date, and add new maintainer.
 - Add unaligned.h included for get_unaligned_be32().
 - In tas2781_apply_calib(), change data address transfer directly to
   get data by get_unaligned_be32(), and send address to device.
---
 sound/pci/hda/tas2781_hda_i2c.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 8a7fe48043d2..5a8193285f9f 100644
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
@@ -519,20 +521,22 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 	static const unsigned char rgno_array[CALIB_MAX] = {
 		0x74, 0x0c, 0x14, 0x70, 0x7c,
 	};
-	unsigned char *data;
+	int offset = 0;
 	int i, j, rc;
+	__be32 data;
 
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
2.43.0

