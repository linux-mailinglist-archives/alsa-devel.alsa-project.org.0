Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686A9B41375
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 06:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D53B601C7;
	Wed,  3 Sep 2025 06:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D53B601C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756872907;
	bh=EmlFs6BsdS/Ofv8g+89FbMuNtRMWMlsCUiWqRLYEreY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OjaUdHVNN+5HH8SYGFxP4YbgN5Oyjg4/Z95TueI5CvWB0LpGlNa7zYfY2dkr6uwwX
	 qobPCzdFjZnJ3dAesmd7wngrsERSaBmqPP9oVbEkIRrYv1un/s2/t4oP+COXdj0yGx
	 XmNn3EZj23oP2iMmPBtrT24scjFYC5VYMKx+c7ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38504F8016D; Wed,  3 Sep 2025 06:14:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE1AF805BD;
	Wed,  3 Sep 2025 06:14:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0DF8F804D6; Wed,  3 Sep 2025 06:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B67D4F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 06:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B67D4F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=TIPf4c+e
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5834E0Bv2743989;
	Tue, 2 Sep 2025 23:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756872840;
	bh=2QK/mfkR8VFOloSGLotB72GO3D6298doOfhtXEPJEFM=;
	h=From:To:CC:Subject:Date;
	b=TIPf4c+eERqgzTEZ56AbIItM2M1a6GZlRfpTgY8wWIo9MyjiqjQOz6meQK+WzfMbK
	 6i4GEbxLJOy4GXatUgWGCa1BjscNKBlVU7mbbLt6l+FyxKNSvPEFCU7MGXrp11UFq+
	 5BOW8gsVMTsY/mcRU+KmKf/IiSKZuYs0r6DlTEJg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5834E0Fh3322466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 23:14:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 23:13:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 23:14:00 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5834Dtux952713;
	Tue, 2 Sep 2025 23:13:56 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
Date: Wed, 3 Sep 2025 12:13:51 +0800
Message-ID: <20250903041351.143-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 7OSTS3MELYJMG2TID5L6C54KCGE2WX5V
X-Message-ID-Hash: 7OSTS3MELYJMG2TID5L6C54KCGE2WX5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OSTS3MELYJMG2TID5L6C54KCGE2WX5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A bug reported by one of my customers that the order of TAS2781
calibrated-data is incorrect, the correct way is to move R0_Low
and insert it between R0 and InvR0.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Submit to sound branch maintianed by Tiwai instead of linux-next branch
 - drop other fix
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index f46d2e06c64f..cd9990869e18 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -33,6 +33,32 @@ const efi_guid_t tasdev_fct_efi_guid[] = {
 };
 EXPORT_SYMBOL_NS_GPL(tasdev_fct_efi_guid, "SND_HDA_SCODEC_TAS2781");
 
+/*
+ * The order of calibrated-data writing is a bit different from the order
+ * in UEFI. Here is the conversion to match the order of calibrated-data
+ * writing.
+ */
+static void cali_cnv(unsigned char *data, unsigned int base, int offset)
+{
+	__be32 bedata[TASDEV_CALIB_N];
+	int i;
+
+	/* r0_reg */
+	bedata[0] = cpu_to_be32(*(uint32_t *)&data[base]);
+	/* r0_low_reg */
+	bedata[1] = cpu_to_be32(*(uint32_t *)&data[base + 8]);
+	/* invr0_reg */
+	bedata[2] = cpu_to_be32(*(uint32_t *)&data[base + 4]);
+	/* pow_reg */
+	bedata[3] = cpu_to_be32(*(uint32_t *)&data[base + 12]);
+	/* tlimit_reg */
+	bedata[4] = cpu_to_be32(*(uint32_t *)&data[base + 16]);
+
+	for (i = 0; i < TASDEV_CALIB_N; i++)
+		memcpy(&data[offset + i * 4 + 1], &bedata[i],
+			sizeof(bedata[i]));
+}
+
 static void tas2781_apply_calib(struct tasdevice_priv *p)
 {
 	struct calidata *cali_data = &p->cali_data;
@@ -86,6 +112,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
+			/* Calibration registers address */
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
 					buf = &data[(oft + i + 1) * 4];
@@ -93,6 +120,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 						buf[2], buf[3]);
 				}
 			} else {
+				/* Calibrated data */
 				l = j * (cali_data->cali_dat_sz_per_dev + 1);
 				if (k >= p->ndev || l > oft * 4) {
 					dev_err(p->dev, "%s: dev sum error\n",
@@ -103,8 +131,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 				data[l] = k;
 				oft++;
-				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i + 1] = data[4 * oft + i];
+				cali_cnv(data, 4 * oft, l);
 				k++;
 			}
 		}
@@ -127,12 +154,11 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 			dev_err(p->dev, "%s: V1 CRC error\n", __func__);
 			return;
 		}
-
+		/* reverse rearrangement in case of overlap */
 		for (j = p->ndev - 1; j >= 0; j--) {
 			l = j * (cali_data->cali_dat_sz_per_dev + 1);
-			for (i = TASDEV_CALIB_N * 4; i > 0 ; i--)
-				data[l + i] = data[p->index * 5 + i];
-			data[l+i] = j;
+			cali_cnv(data, cali_data->cali_dat_sz_per_dev * j, l);
+			data[l] = j;
 		}
 	}
 
-- 
2.43.0

