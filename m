Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2099B01EAD
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jul 2025 16:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E23D6022F;
	Fri, 11 Jul 2025 16:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E23D6022F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752242840;
	bh=qk6AFaouc956CSAvxZJyCinyntTHr5dXIoYc9dCfJrg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iVLPJbDfBigeUqGfqGBJpSY71UBoIAlVvy1TTkbUYsXDWptIqqJHyllXnojgEz78y
	 c8mPkXDFWFelXlER1YrP8K5n91p1e8Lap4Tbtaa2ybMrDlKVz0RN16+awPY3zOn4kZ
	 SP6/tx7rnLtVB0mhHelxtHu36Nxa8mBAxEt20yqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4532F80611; Fri, 11 Jul 2025 16:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E16F8060D;
	Fri, 11 Jul 2025 16:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A0EDF80217; Mon,  7 Jul 2025 11:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45F7CF80073
	for <alsa-devel@alsa-project.org>; Mon,  7 Jul 2025 11:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F7CF80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=NPrJRWXz
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56795iag817152;
	Mon, 7 Jul 2025 04:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751879144;
	bh=w8PTfQBhZTHmoOcNsBY2FL7mzH3JijfsAWMnMuG1KUI=;
	h=From:To:CC:Subject:Date;
	b=NPrJRWXzA70HtT7+HHDJEncLjdLonQdHBcZAfChT5exFzl4ilXyxW3kVDQAdAUwha
	 EITz68DGd1tMEMK3x1nv69OclAyqN1cbRSfrZa2v4eBtn9gRhyEbtaP/Xck6nUR1px
	 ZH65Rx3FLOvvNvq4PLka27njEIoAfO3O6+LANImQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56795ioX282160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 04:05:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 04:05:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 04:05:43 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56795c8o3787182;
	Mon, 7 Jul 2025 04:05:38 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
 <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Fix calibration data parser issue
Date: Mon, 7 Jul 2025 17:05:13 +0800
Message-ID: <20250707090513.1462-1-baojun.xu@ti.com>
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
Message-ID-Hash: 2GX3JQYZGGJW2W2V6KFGOICXJXQIBW5I
X-Message-ID-Hash: 2GX3JQYZGGJW2W2V6KFGOICXJXQIBW5I
X-Mailman-Approved-At: Fri, 11 Jul 2025 14:06:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GX3JQYZGGJW2W2V6KFGOICXJXQIBW5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We will copy calibration data from position behind to front.
We has created a variable (tmp_val) point on top of calibration data
buffer, and tmp_val[1] is max of node number in original calibration
data structure, it will be overwritten after first data copy,
so can't be used as max node number check in for loop.
So we create a new variable to save max of node number (tmp_val[1]),
used to check if max node number was reached in for loop.
And a point need to be increased to point at calibration data in node.
Data saved position also need to be increased one byte.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
Change in v2:
 - Add more description about this fix.
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

