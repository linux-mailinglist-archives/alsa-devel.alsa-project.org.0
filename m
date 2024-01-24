Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F183AD63
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:32:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF27F83E;
	Wed, 24 Jan 2024 16:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF27F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706110330;
	bh=q1qljiRKaxjntRw5kG7QwnLqBgJ0tPa/yRRn7mQMqbE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vkuduZZgZzGBTnhEgPDrCCXkcWwLWPvq35uaymdRiUmIZqWM4kL5RKPN/9i15dA6l
	 xaDjKQ61c3kNacPjH1TrsaRHaexl+zhz7TAKiMfOkMJ9l/9Pf6FKfulBJxAYpweFB2
	 Gu9mH9JJEj0lUlsFGdGWBfJ0jpR4z+aeGcw8LrSc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F90BF80632; Wed, 24 Jan 2024 16:30:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF3AF80631;
	Wed, 24 Jan 2024 16:30:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95685F805C6; Wed, 24 Jan 2024 16:30:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FB35F8025F
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FB35F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HWPNmwS5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O8MvMp030107;
	Wed, 24 Jan 2024 09:30:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=DjhIKQsx+swONFXaIPFE3+Q7LSkupW8SdUx6aCYcm08=; b=
	HWPNmwS5/OVqhYrm/vEuYjjefPPFMufxudHfOgq0uSm3fRhq2U173znDXxXIHNJR
	PKKF6U4wSV6VNm+5QCS2NpCr6vUbqpRQn7bmsmwcKHNUWSKjXSx6LHVa/ibh2hEb
	P9DPbhVkvyJCHIe6U8viVIkVYMS8nm4FzNnvpNIV7uvcQjUAmsjcemzWwjUB9/Ut
	5P5KWKkuuNLCTHIr6yKRAUtei1ZCvUMqpa3hr9GFA6Gyas850QUkNYPzYQhI0v/K
	2q1mAJV44O6fu85KjVBCCMW1BMg0eyCoRT2P6yr8PVBIlfobJCL8/vWMlgrLP/Th
	mJLCYkc8WATva3vt8N7dig==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryqc-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:30:20 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:30:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BAFC7820249;
	Wed, 24 Jan 2024 15:30:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v2 4/6] mfd: cs42l43: Add time postfixes on defines
Date: Wed, 24 Jan 2024 15:30:14 +0000
Message-ID: <20240124153016.1541616-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _wosBvJXISbzl8day1vReIkCMywQVGoO
X-Proofpoint-ORIG-GUID: _wosBvJXISbzl8day1vReIkCMywQVGoO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MGVPKIMY32BWSRUHE2XFOJKPJ4G3ODWG
X-Message-ID-Hash: MGVPKIMY32BWSRUHE2XFOJKPJ4G3ODWG
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGVPKIMY32BWSRUHE2XFOJKPJ4G3ODWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/mfd/cs42l43.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 65a331481d975..aea0f8f485785 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -27,30 +27,30 @@
 
 #include "cs42l43.h"
 
-#define CS42L43_RESET_DELAY			20
+#define CS42L43_RESET_DELAY_MS			20
 
-#define CS42L43_SDW_ATTACH_TIMEOUT		500
-#define CS42L43_SDW_DETACH_TIMEOUT		100
+#define CS42L43_SDW_ATTACH_TIMEOUT_MS		500
+#define CS42L43_SDW_DETACH_TIMEOUT_MS		100
 
 #define CS42L43_MCU_BOOT_STAGE1			1
 #define CS42L43_MCU_BOOT_STAGE2			2
 #define CS42L43_MCU_BOOT_STAGE3			3
 #define CS42L43_MCU_BOOT_STAGE4			4
-#define CS42L43_MCU_POLL			5000
-#define CS42L43_MCU_CMD_TIMEOUT			20000
+#define CS42L43_MCU_POLL_US			5000
+#define CS42L43_MCU_CMD_TIMEOUT_US		20000
 #define CS42L43_MCU_UPDATE_FORMAT		3
 #define CS42L43_MCU_UPDATE_OFFSET		0x100000
-#define CS42L43_MCU_UPDATE_TIMEOUT		500000
+#define CS42L43_MCU_UPDATE_TIMEOUT_US		500000
 #define CS42L43_MCU_UPDATE_RETRIES		5
 
 #define CS42L43_MCU_SUPPORTED_REV		0x2105
 #define CS42L43_MCU_SHADOW_REGS_REQUIRED_REV	0x2200
 #define CS42L43_MCU_SUPPORTED_BIOS_REV		0x0001
 
-#define CS42L43_VDDP_DELAY			50
-#define CS42L43_VDDD_DELAY			1000
+#define CS42L43_VDDP_DELAY_US			50
+#define CS42L43_VDDD_DELAY_US			1000
 
-#define CS42L43_AUTOSUSPEND_TIME		250
+#define CS42L43_AUTOSUSPEND_TIME_MS		250
 
 struct cs42l43_patch_header {
 	__le16 version;
@@ -538,10 +538,10 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 	regcache_cache_only(cs42l43->regmap, true);
 	regmap_multi_reg_write_bypassed(cs42l43->regmap, reset, ARRAY_SIZE(reset));
 
-	msleep(CS42L43_RESET_DELAY);
+	msleep(CS42L43_RESET_DELAY_MS);
 
 	if (cs42l43->sdw) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT);
+		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT_MS);
 		unsigned long time;
 
 		time = wait_for_completion_timeout(&cs42l43->device_detach, timeout);
@@ -561,7 +561,7 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 {
 	if (!cs42l43->attached) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT);
+		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
 		unsigned long time;
 
 		time = wait_for_completion_timeout(&cs42l43->device_attach, timeout);
@@ -603,7 +603,7 @@ static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 
 	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
-				       CS42L43_MCU_POLL, CS42L43_MCU_CMD_TIMEOUT);
+				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to move to stage 3: %d, 0x%x\n", ret, val);
 		return ret;
@@ -652,7 +652,7 @@ static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 
 	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_SOFT_INT_SHADOW, val,
 				       (val & CS42L43_CONTROL_APPLIED_INT_MASK),
-				       CS42L43_MCU_POLL, CS42L43_MCU_CMD_TIMEOUT);
+				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to disable firmware: %d, 0x%x\n", ret, val);
 		return ret;
@@ -696,7 +696,7 @@ static void cs42l43_mcu_load_firmware(const struct firmware *firmware, void *con
 
 	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_SOFT_INT_SHADOW, val,
 				       (val & CS42L43_PATCH_APPLIED_INT_MASK),
-				       CS42L43_MCU_POLL, CS42L43_MCU_UPDATE_TIMEOUT);
+				       CS42L43_MCU_POLL_US, CS42L43_MCU_UPDATE_TIMEOUT_US);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to update firmware: %d, 0x%x\n", ret, val);
 		cs42l43->firmware_error = ret;
@@ -957,7 +957,7 @@ static int cs42l43_power_up(struct cs42l43 *cs42l43)
 	}
 
 	/* vdd-p must be on for 50uS before any other supply */
-	usleep_range(CS42L43_VDDP_DELAY, 2 * CS42L43_VDDP_DELAY);
+	usleep_range(CS42L43_VDDP_DELAY_US, 2 * CS42L43_VDDP_DELAY_US);
 
 	gpiod_set_value_cansleep(cs42l43->reset, 1);
 
@@ -973,7 +973,7 @@ static int cs42l43_power_up(struct cs42l43 *cs42l43)
 		goto err_core_supplies;
 	}
 
-	usleep_range(CS42L43_VDDD_DELAY, 2 * CS42L43_VDDD_DELAY);
+	usleep_range(CS42L43_VDDD_DELAY_US, 2 * CS42L43_VDDD_DELAY_US);
 
 	return 0;
 
@@ -1057,7 +1057,7 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	if (ret)
 		return ret;
 
-	pm_runtime_set_autosuspend_delay(cs42l43->dev, CS42L43_AUTOSUSPEND_TIME);
+	pm_runtime_set_autosuspend_delay(cs42l43->dev, CS42L43_AUTOSUSPEND_TIME_MS);
 	pm_runtime_use_autosuspend(cs42l43->dev);
 	pm_runtime_set_active(cs42l43->dev);
 	/*
-- 
2.30.2

