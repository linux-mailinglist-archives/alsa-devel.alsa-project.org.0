Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16CB1AF3E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Aug 2025 09:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63AD660256;
	Tue,  5 Aug 2025 09:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63AD660256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754377915;
	bh=h6XKzAtYh3pNODiQdcehSo4PcWdoXjQ+mRPWT/wKqgo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ea61zoV6GhLv6tNgUuC399EdCllFBWflHn2b9ce/HwOZNW4tDC41xRL4LyoftHX97
	 qkRU0jRAOX0hUau5RT9aPhBoaDd62PW07Z91NtfCtPMRicyhqSWrwgzDflUj2ww0mc
	 wE/M8JrkcE+Df7D1/eI5CzQheSrBVlgsL5YEr5vk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C269F805C2; Tue,  5 Aug 2025 09:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 023DBF805BA;
	Tue,  5 Aug 2025 09:11:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0359DF804B3; Tue,  5 Aug 2025 09:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22DDFF800DF
	for <alsa-devel@alsa-project.org>; Tue,  5 Aug 2025 09:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22DDFF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=njLdUjM3
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57579sFS4024169;
	Tue, 5 Aug 2025 02:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754377794;
	bh=gOnpZ3mFkm1p13Cn9nA/r3PqcAqgnCGYOFVTNL6XO1c=;
	h=From:To:CC:Subject:Date;
	b=njLdUjM3UE0Q2C14j/Xe58uoziXOr3DPNapRSKMPoitcaLMRXlzXP4gZAFLIog4aG
	 iwiWy42zBvyJFIfHzHyCwFTSkawzlivS1iL75CwO9z8FGQm6A/gYJiMr6rVvByley5
	 F9oJTr7JvYLpNgle1RYJX/rV02/5YWwh7nYUpu3Q=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57579s0A3268052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 02:09:54 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 02:09:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 02:09:53 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57579npT1730586;
	Tue, 5 Aug 2025 02:09:50 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Support L"SmartAmpCalibrationData" to
 save calibrated data
Date: Tue, 5 Aug 2025 15:09:45 +0800
Message-ID: <20250805070945.524-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: LNELOMI7ZBKDIKE4WBPBJNMD7XMQQ7U4
X-Message-ID-Hash: LNELOMI7ZBKDIKE4WBPBJNMD7XMQQ7U4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNELOMI7ZBKDIKE4WBPBJNMD7XMQQ7U4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices save the calibrated data into L"CALI_DATA", and others into
L"SmartAmpCalibrationData". Driver code will support both.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 47 +++++++++++++++-------
 sound/hda/codecs/side-codecs/tas2781_hda.h |  2 +-
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index 34217ce9f28e..f46d2e06c64f 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -18,6 +18,8 @@
 
 #include "tas2781_hda.h"
 
+#define CALIBRATION_DATA_AREA_NUM 2
+
 const efi_guid_t tasdev_fct_efi_guid[] = {
 	/* DELL */
 	EFI_GUID(0xcc92382d, 0x6337, 0x41cb, 0xa8, 0x8b, 0x8e, 0xce, 0x74,
@@ -160,36 +162,51 @@ int tas2781_save_calibration(struct tas2781_hda *hda)
 	 * manufactory.
 	 */
 	efi_guid_t efi_guid = tasdev_fct_efi_guid[LENOVO];
-	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
+	/*
+	 * Some devices save the calibrated data into L"CALI_DATA",
+	 * and others into L"SmartAmpCalibrationData".
+	 */
+	static efi_char16_t *efi_name[CALIBRATION_DATA_AREA_NUM] = {
+		L"CALI_DATA",
+		L"SmartAmpCalibrationData",
+	};
 	struct tasdevice_priv *p = hda->priv;
 	struct calidata *cali_data = &p->cali_data;
 	unsigned long total_sz = 0;
 	unsigned int attr, size;
 	unsigned char *data;
 	efi_status_t status;
+	int i;
 
 	if (hda->catlog_id < LENOVO)
 		efi_guid = tasdev_fct_efi_guid[hda->catlog_id];
 
 	cali_data->cali_dat_sz_per_dev = 20;
 	size = p->ndev * (cali_data->cali_dat_sz_per_dev + 1);
-	/* Get real size of UEFI variable */
-	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz, NULL);
-	cali_data->total_sz = total_sz > size ? total_sz : size;
-	if (status == EFI_BUFFER_TOO_SMALL) {
-		/* Allocate data buffer of data_size bytes */
-		data = p->cali_data.data = devm_kzalloc(p->dev,
-			p->cali_data.total_sz, GFP_KERNEL);
-		if (!data) {
-			p->cali_data.total_sz = 0;
-			return -ENOMEM;
+	for (i = 0; i < CALIBRATION_DATA_AREA_NUM; i++) {
+		/* Get real size of UEFI variable */
+		status = efi.get_variable(efi_name[i], &efi_guid, &attr,
+			&total_sz, NULL);
+		cali_data->total_sz = total_sz > size ? total_sz : size;
+		if (status == EFI_BUFFER_TOO_SMALL) {
+			/* Allocate data buffer of data_size bytes */
+			data = cali_data->data = devm_kzalloc(p->dev,
+				cali_data->total_sz, GFP_KERNEL);
+			if (!data) {
+				status = -ENOMEM;
+				continue;
+			}
+			/* Get variable contents into buffer */
+			status = efi.get_variable(efi_name[i], &efi_guid,
+				&attr, &cali_data->total_sz, data);
 		}
-		/* Get variable contents into buffer */
-		status = efi.get_variable(efi_name, &efi_guid, &attr,
-			&p->cali_data.total_sz, data);
+		/* Check whether get the calibrated data */
+		if (status == EFI_SUCCESS)
+			break;
 	}
+
 	if (status != EFI_SUCCESS) {
-		p->cali_data.total_sz = 0;
+		cali_data->total_sz = 0;
 		return status;
 	}
 
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.h b/sound/hda/codecs/side-codecs/tas2781_hda.h
index 575a701c8dfb..66188909a0bb 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.h
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.h
@@ -11,7 +11,7 @@
 
 /* Flag of calibration registers address. */
 #define TASDEV_UEFI_CALI_REG_ADDR_FLG	BIT(7)
-#define TASDEVICE_CALIBRATION_DATA_NAME	L"CALI_DATA"
+
 #define TASDEV_CALIB_N			5
 
 /*
-- 
2.43.0

