Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E4ABB05A
	for <lists+alsa-devel@lfdr.de>; Sun, 18 May 2025 15:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE086017D;
	Sun, 18 May 2025 15:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE086017D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747574752;
	bh=mDiR2wGr+kK/dBw37H1jiMAdKRjY1GO4vm79SjU8TUI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bb9SK5pfuBf3zaiVgjt7bKazitiP6N5lXB6Ug+lNlIdIijgkIKcdnyhE7j6+tRfiY
	 u6liiPGDwj5yE2qtKVc+kKCmG9EjkW6Hr/uZoF6bcssnUoXO6eRKY7DAv5a+QWVR8w
	 8b+Mw33YqLli4dnxDQ9GWr/VGbHoLfi0AEb5NaQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D9DEF80549; Sun, 18 May 2025 15:25:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08492F804CC;
	Sun, 18 May 2025 15:25:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EC7F804B0; Sun, 18 May 2025 15:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16681F80272
	for <alsa-devel@alsa-project.org>; Sun, 18 May 2025 15:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16681F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=u2W3ATrh
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54IDP16p667143;
	Sun, 18 May 2025 08:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747574701;
	bh=qIBCy9PE1rZgJsoBBqhk3/F/jNRmBBcgPumEaKrHWy8=;
	h=From:To:CC:Subject:Date;
	b=u2W3ATrhiEXwgX4pucIXQn8d8Vw9hPrSJ28vC2kcYs0Tu033RRyBRp2xlRyyg5zMp
	 mKkM3j+rYWNHKm7X1PxYwjpHcz5HUNE+bJcMrj0U6OYxvjh3WSZ1bzed7m6y+Ds08v
	 O99dWFX5wetiqIVW9UALrCP5B5ZfhM1Wvvw2ieZM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54IDP1Lg3208724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 18 May 2025 08:25:01 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 18
 May 2025 08:25:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 18 May 2025 08:25:00 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54IDOvk3113452;
	Sun, 18 May 2025 08:24:57 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Header file cleanup and Move the macro
 definitions to fwlib
Date: Sun, 18 May 2025 21:24:51 +0800
Message-ID: <20250518132451.707-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: FMVWUWIR4MLGY6BJHXZAT7MPZLTBNOYE
X-Message-ID-Hash: FMVWUWIR4MLGY6BJHXZAT7MPZLTBNOYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMVWUWIR4MLGY6BJHXZAT7MPZLTBNOYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the I2C in one comment, for these registers are also used in SPI
driver; Move the macro definition of TASDEVICE_CMD_XXX from tas2781.h to
tas2781_fmwlib.c, because the macros are only referenced in only fwlib.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Correct the comment in tas2781.h.
 - Move the definition of TASDEVICE_CMD_XXX from tas2781.h to
   tas2781_fmwlib.c
---
 include/sound/tas2781.h           | 7 +------
 sound/soc/codecs/tas2781-fmwlib.c | 5 +++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 442126aa124a..9dc178a7486a 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -49,7 +49,7 @@
 #define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
 #define TASDEVICE_REG_SWRESET_RESET	BIT(0)
 
-/* I2C Checksum */
+/* Checksum */
 #define TASDEVICE_CHECKSUM_REG		TASDEVICE_REG(0x0, 0x0, 0x7e)
 
 /* XM_340 */
@@ -105,11 +105,6 @@
 #define TAS2781_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x62, 0x48)
 #define TAS2781_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x63, 0x44)
 
-#define TASDEVICE_CMD_SING_W		0x1
-#define TASDEVICE_CMD_BURST		0x2
-#define TASDEVICE_CMD_DELAY		0x3
-#define TASDEVICE_CMD_FIELD_W		0x4
-
 enum audio_device {
 	TAS2563,
 	TAS2781,
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 28adfc5526bd..c9c1e608ddb7 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -50,6 +50,11 @@
 #define TAS2781_YRAM5_START_REG			TAS2781_YRAM3_START_REG
 #define TAS2781_YRAM5_END_REG			TAS2781_YRAM3_END_REG
 
+#define TASDEVICE_CMD_SING_W		0x1
+#define TASDEVICE_CMD_BURST		0x2
+#define TASDEVICE_CMD_DELAY		0x3
+#define TASDEVICE_CMD_FIELD_W		0x4
+
 #define TASDEVICE_MAXPROGRAM_NUM_KERNEL			5
 #define TASDEVICE_MAXCONFIG_NUM_KERNEL_MULTIPLE_AMPS	64
 #define TASDEVICE_MAXCONFIG_NUM_KERNEL			10
-- 
2.43.0

