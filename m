Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134AA6EDDC
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Mar 2025 11:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D70E601BB;
	Tue, 25 Mar 2025 11:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D70E601BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742899027;
	bh=U9X3tzPT7BQe+BlJQO2hC0MSCjvawwWLAxcaRfrpyys=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AI/12CwEEED6qELkrrLZmmBWWJmPs1040quPgS63tVMvrhKJhkrIJUlrrxxfwAEUQ
	 swl15EmNYrawblH7pWxT7h4oB8MF85wlrgVzNgWurql+wg7eHwZ1mFXckhASg9pGjt
	 YYtjTLTKot3rRHFDXv0ZcoRA3CLv7tRUJx1+/CvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98EE5F805BF; Tue, 25 Mar 2025 11:36:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C46F805BB;
	Tue, 25 Mar 2025 11:36:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 097EBF80424; Tue, 25 Mar 2025 11:36:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 81108F800B6
	for <alsa-devel@alsa-project.org>; Tue, 25 Mar 2025 11:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81108F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=g7goroyq
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PAaLob1212930
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Mar 2025 05:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742898981;
	bh=QZzVl2bgbkhshmlS+4PPDIcVCBo3+7gB4Z4ciwuH+U0=;
	h=From:To:CC:Subject:Date;
	b=g7goroyq828zgwWjNqWnHDv5XOlqdYxtCTpcgxhIs9pEU41E8xwsgeIdZ41c3U6GG
	 ANvr6Ax+M+YSBBjUedYrNsV77LCSnx90yKJYolVSRe+nA5UIeqOAbn1nXnmlYm4D8U
	 ikvzjvheU0v2cNrStsU834cm7rQG2uepwMVhM1Zs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PAaLY7064974;
	Tue, 25 Mar 2025 05:36:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 05:36:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 05:36:21 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.197])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PAaGDo036326;
	Tue, 25 Mar 2025 05:36:17 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Tue, 25 Mar 2025 18:36:12 +0800
Message-ID: <20250325103612.2021-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: XKFR7ECIQY6A5AD5SMPEW5B7WI7ZBUPR
X-Message-ID-Hash: XKFR7ECIQY6A5AD5SMPEW5B7WI7ZBUPR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKFR7ECIQY6A5AD5SMPEW5B7WI7ZBUPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For calibration data, basic version firmware does not contain any
calibration addresses, it depends on calibration tool to convey the
addresses to the driver. Since Alpha and Beta firmware, all the
calibration addresses are saved into the firmware.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add updating calibration addresses code into tas2781_apply_calib in
   case of Alpha and Beta firmware.
---
 sound/pci/hda/tas2781_hda_i2c.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 50c5e5f26589..cb3d683013d9 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -558,28 +558,38 @@ static int tas2563_save_calibration(struct tasdevice_priv *tas_priv)
 
 static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 {
-	static const unsigned char page_array[CALIB_MAX] = {
-		0x17, 0x18, 0x18, 0x13, 0x18,
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct cali_reg *r = &cali_data->cali_reg_array;
+	unsigned int cali_reg[CALIB_MAX] = {
+		TASDEVICE_REG(0, 0x17, 0x74),
+		TASDEVICE_REG(0, 0x18, 0x0c),
+		TASDEVICE_REG(0, 0x18, 0x14),
+		TASDEVICE_REG(0, 0x13, 0x70),
+		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
-	static const unsigned char rgno_array[CALIB_MAX] = {
-		0x74, 0x0c, 0x14, 0x70, 0x7c,
-	};
-	int offset = 0;
 	int i, j, rc;
+	int oft = 0;
 	__be32 data;
 
+	if (tas_priv->dspbin_typ != TASDEV_BASIC) {
+		cali_reg[0] = r->r0_reg;
+		cali_reg[1] = r->invr0_reg;
+		cali_reg[2] = r->r0_low_reg;
+		cali_reg[3] = r->pow_reg;
+		cali_reg[4] = r->tlimit_reg;
+	}
+
 	for (i = 0; i < tas_priv->ndev; i++) {
 		for (j = 0; j < CALIB_MAX; j++) {
 			data = cpu_to_be32(
-				*(uint32_t *)&tas_priv->cali_data.data[offset]);
+				*(uint32_t *)&tas_priv->cali_data.data[oft]);
 			rc = tasdevice_dev_bulk_write(tas_priv, i,
-				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
-				(unsigned char *)&data, 4);
+				cali_reg[j], (unsigned char *)&data, 4);
 			if (rc < 0)
 				dev_err(tas_priv->dev,
 					"chn %d calib %d bulk_wr err = %d\n",
 					i, j, rc);
-			offset += 4;
+			oft += 4;
 		}
 	}
 }
-- 
2.34.1

