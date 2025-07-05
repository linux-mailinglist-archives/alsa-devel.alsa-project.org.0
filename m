Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DBB01EA9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jul 2025 16:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6F760205;
	Fri, 11 Jul 2025 16:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6F760205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752242823;
	bh=UIXup+LNXzlJkMEvN+DweufuUSjQf331SNhY6u+dwkE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XMdkE+IsEfwaCLoPNgFQFyz5ClQrgwrdThRgByZWgUFFCckpKQ3/y2k8AyhTRxLGx
	 xC+K3B7bxkBp8olU9p9y5wyOV9+k14lUlVVsv16t2AHHVsAFT2eitoADZEaB3Q+PAq
	 W+sOXjK0E8odRkEm8zn/Rl2rxiX4ZtWCc8q0womA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5E90F805D4; Fri, 11 Jul 2025 16:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75425F805EC;
	Fri, 11 Jul 2025 16:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44688F804CF; Sat,  5 Jul 2025 15:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2872DF80087
	for <alsa-devel@alsa-project.org>; Sat,  5 Jul 2025 15:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2872DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=daS93Z0z
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 565D9ovt462902;
	Sat, 5 Jul 2025 08:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751720990;
	bh=ttqjqkTwAbS4h3qGA1nHlnNHYoKbG6HRZs4IHbCT+c8=;
	h=From:To:CC:Subject:Date;
	b=daS93Z0znHcxGrRqwRwVnJNdcXTSEnN/3haIvwCNKSfAcZd42Y7uc1qtZxzQmcoAa
	 IxrCCY+kZGsB3EmMK5q3NY3k8VlE2TTNNX6fwLUIfJhhrxv6ekANCQi1e5kutc+f5I
	 oBjqu3Vn1LtDua5dP/Qe/BsLvqnkF2vBFW5T993I=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 565D9n5i2728577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 5 Jul 2025 08:09:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 5
 Jul 2025 08:09:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 5 Jul 2025 08:09:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 565D9hrL707887;
	Sat, 5 Jul 2025 08:09:44 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
 <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix calibration data parser issue
Date: Sat, 5 Jul 2025 21:09:08 +0800
Message-ID: <20250705130908.26248-1-baojun.xu@ti.com>
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
Message-ID-Hash: XC6AESXXGA7FSX3WCUYQIQUAYASHBTBU
X-Message-ID-Hash: XC6AESXXGA7FSX3WCUYQIQUAYASHBTBU
X-Mailman-Approved-At: Fri, 11 Jul 2025 14:06:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XC6AESXXGA7FSX3WCUYQIQUAYASHBTBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calibration data was overwritten during parser, it cause issue.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
index 5f1d4b3e9688..34217ce9f28e 100644
--- a/sound/pci/hda/tas2781_hda.c
+++ b/sound/pci/hda/tas2781_hda.c
@@ -44,7 +44,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x13, 0x70),
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
-	unsigned int crc, oft;
+	unsigned int crc, oft, node_num;
 	unsigned char *buf;
 	int i, j, k, l;
 
@@ -80,8 +80,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 			dev_err(p->dev, "%s: CRC error\n", __func__);
 			return;
 		}
+		node_num = tmp_val[1];
 
-		for (j = 0, k = 0; j < tmp_val[1]; j++) {
+		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
@@ -99,8 +100,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 				}
 
 				data[l] = k;
+				oft++;
 				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i] = data[4 * oft + i];
+					data[l + i + 1] = data[4 * oft + i];
 				k++;
 			}
 		}
-- 
2.43.0

