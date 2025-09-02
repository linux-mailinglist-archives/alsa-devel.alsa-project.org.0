Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F32B3FDD5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Sep 2025 13:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2D9601AE;
	Tue,  2 Sep 2025 13:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2D9601AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756812793;
	bh=B7Q6e1fGUD698B8nanmE3DpXv6VN9uNL/uEtkYnUmAI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AMn8M5ks0a7rCTe2QDKCMbQ+JmGvJ69p3WQn0vW2mf6iG/J1RYqM4pEhj2VT2gmSZ
	 +ieqDKK2YT/C/W6Swt2hV6uPgza7/naDj3SZIRiqEP5JKShZWiDh5rOFDbwa+fj0aF
	 roosUSAZvL0YgWmZTUhh3Oe698hIbWKH8HY69U6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 688ACF801F5; Tue,  2 Sep 2025 13:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C35A9F805CB;
	Tue,  2 Sep 2025 13:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87DC5F80254; Tue,  2 Sep 2025 13:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5926FF8021D
	for <alsa-devel@alsa-project.org>; Tue,  2 Sep 2025 13:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5926FF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=sF13f8AQ
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582BW6RT2517181;
	Tue, 2 Sep 2025 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756812726;
	bh=X8211DHn8F1sx9uoZMlrsZGVUgL8PBpTKRkugMeHX8I=;
	h=From:To:CC:Subject:Date;
	b=sF13f8AQu82RjmoCt3ggHJZvayiNM1S9CDqx319rZSlhEbMGyGgHRZS/VKczIq4BM
	 MvKR0HXKOD66a967ijpp2+K3mXhTbIT3rjHzUNOovl0/bGC4agwGaIueYMHyz1lPtw
	 HM+XLvSkDoRUM0FEeDD1Bto0JumNwyXL+jkWxCXA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582BW5vK2242925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 06:32:05 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 06:32:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 06:32:05 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582BVx1j3715141;
	Tue, 2 Sep 2025 06:32:00 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
Date: Tue, 2 Sep 2025 19:31:55 +0800
Message-ID: <20250902113155.1761-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: EIQENVVVFOMU25NW5G2EGCO4GJY6WM62
X-Message-ID-Hash: EIQENVVVFOMU25NW5G2EGCO4GJY6WM62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIQENVVVFOMU25NW5G2EGCO4GJY6WM62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A bug reported by one of my customers that the order of TAS2781
calibrated-data is incorrect, the correct way is to move R0_Low_%d
and insert it between R0_%d and InvR0_%d.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add varialbe csz to store cali_data->cali_dat_sz_per_dev, which is long
   enough to need two lines.
 - Add more comments on calibrated-data order
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 43 ++++++++++++++++++----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index f46d2e06c64f..d5913a727be4 100644
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
@@ -46,6 +72,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x13, 0x70),
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
+	unsigned int csz = cali_data->cali_dat_sz_per_dev;
 	unsigned int crc, oft, node_num;
 	unsigned char *buf;
 	int i, j, k, l;
@@ -86,6 +113,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
+			/* Calibration registers address */
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
 					buf = &data[(oft + i + 1) * 4];
@@ -93,7 +121,8 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 						buf[2], buf[3]);
 				}
 			} else {
-				l = j * (cali_data->cali_dat_sz_per_dev + 1);
+				/* Calibrated data */
+				l = j * (csz + 1);
 				if (k >= p->ndev || l > oft * 4) {
 					dev_err(p->dev, "%s: dev sum error\n",
 						__func__);
@@ -103,8 +132,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 
 				data[l] = k;
 				oft++;
-				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i + 1] = data[4 * oft + i];
+				cali_cnv(data, 4 * oft, l);
 				k++;
 			}
 		}
@@ -127,12 +155,11 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 			dev_err(p->dev, "%s: V1 CRC error\n", __func__);
 			return;
 		}
-
+		/* reverse rearrangement in case of overlap */
 		for (j = p->ndev - 1; j >= 0; j--) {
-			l = j * (cali_data->cali_dat_sz_per_dev + 1);
-			for (i = TASDEV_CALIB_N * 4; i > 0 ; i--)
-				data[l + i] = data[p->index * 5 + i];
-			data[l+i] = j;
+			l = j * (csz + 1);
+			cali_cnv(data, csz * j, l);
+			data[l] = j;
 		}
 	}
 
-- 
2.43.0

