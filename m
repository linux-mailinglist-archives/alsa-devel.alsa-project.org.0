Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2604D97D7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 10:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99E0174F;
	Tue, 15 Mar 2022 10:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99E0174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647337169;
	bh=NGbYRG3kz6uImel0s4CnS8H8wk3B2zu3cBgXMUadgs4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vym5sq2gXJX6zEq7fNIOdBa3YkQmWZ4FLqu5SkI8e2S+L5qyWapkYbTypyap3DvoL
	 iryIWYX/zyw/vDFnVRCvv51JvfeJZo8M+7dVD9tEHvXsV6sdfDxhrqvNtvBPjXu+CO
	 N4JsjrS11bNQR9/XQbFF4BSMql//ZE3IVLvVqSlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E3FEF800FF;
	Tue, 15 Mar 2022 10:38:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CADE0F80162; Tue, 15 Mar 2022 10:38:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F8D8F800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 10:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F8D8F800FF
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 22F9c3AJ1013767,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 22F9c3AJ1013767
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Mar 2022 17:38:03 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 15 Mar 2022 17:38:03 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 15 Mar 2022 17:38:02 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1308-sdw: get calibration params after power on
Date: Tue, 15 Mar 2022 17:37:40 +0800
Message-ID: <20220315093740.12008-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/15/2022 08:57:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzMvMTUgpFekyCAwNzozNjowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 jfmiranda@gmail.com, flove@realtek.com, pierre-louis.bossart@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

It will be safe when getting the calibration params after power-on.
All powers are ready to read the calibration params from EFUSE.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308-sdw.c | 73 +++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 149a76075c76..1ef836a68a56 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -50,6 +50,8 @@ static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
 	case 0x3008:
 	case 0x300a:
 	case 0xc000:
+	case 0xc860 ... 0xc863:
+	case 0xc870 ... 0xc873:
 		return true;
 	default:
 		return false;
@@ -159,12 +161,45 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 	return 0;
 }
 
+static void rt1308_apply_calib_params(struct rt1308_sdw_priv *rt1308)
+{
+	unsigned int efuse_m_btl_l, efuse_m_btl_r, tmp;
+	unsigned int efuse_c_btl_l, efuse_c_btl_r;
+
+	/* read efuse to apply calibration parameters */
+	regmap_write(rt1308->regmap, 0xc7f0, 0x04);
+	regmap_write(rt1308->regmap, 0xc7f1, 0xfe);
+	msleep(100);
+	regmap_write(rt1308->regmap, 0xc7f0, 0x44);
+	msleep(20);
+	regmap_write(rt1308->regmap, 0xc240, 0x10);
+
+	regmap_read(rt1308->regmap, 0xc861, &tmp);
+	efuse_m_btl_l = tmp;
+	regmap_read(rt1308->regmap, 0xc860, &tmp);
+	efuse_m_btl_l = efuse_m_btl_l | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc863, &tmp);
+	efuse_c_btl_l = tmp;
+	regmap_read(rt1308->regmap, 0xc862, &tmp);
+	efuse_c_btl_l = efuse_c_btl_l | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc871, &tmp);
+	efuse_m_btl_r = tmp;
+	regmap_read(rt1308->regmap, 0xc870, &tmp);
+	efuse_m_btl_r = efuse_m_btl_r | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc873, &tmp);
+	efuse_c_btl_r = tmp;
+	regmap_read(rt1308->regmap, 0xc872, &tmp);
+	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
+	dev_dbg(&rt1308->sdw_slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
+		efuse_m_btl_l, efuse_m_btl_r);
+	dev_dbg(&rt1308->sdw_slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
+		efuse_c_btl_l, efuse_c_btl_r);
+}
+
 static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
 	int ret = 0;
-	unsigned int efuse_m_btl_l, efuse_m_btl_r, tmp;
-	unsigned int efuse_c_btl_l, efuse_c_btl_r;
 
 	if (rt1308->hw_init)
 		return 0;
@@ -196,37 +231,6 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	/* sw reset */
 	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
 
-	/* read efuse */
-	regmap_write(rt1308->regmap, 0xc360, 0x01);
-	regmap_write(rt1308->regmap, 0xc361, 0x80);
-	regmap_write(rt1308->regmap, 0xc7f0, 0x04);
-	regmap_write(rt1308->regmap, 0xc7f1, 0xfe);
-	msleep(100);
-	regmap_write(rt1308->regmap, 0xc7f0, 0x44);
-	msleep(20);
-	regmap_write(rt1308->regmap, 0xc240, 0x10);
-
-	regmap_read(rt1308->regmap, 0xc861, &tmp);
-	efuse_m_btl_l = tmp;
-	regmap_read(rt1308->regmap, 0xc860, &tmp);
-	efuse_m_btl_l = efuse_m_btl_l | (tmp << 8);
-	regmap_read(rt1308->regmap, 0xc863, &tmp);
-	efuse_c_btl_l = tmp;
-	regmap_read(rt1308->regmap, 0xc862, &tmp);
-	efuse_c_btl_l = efuse_c_btl_l | (tmp << 8);
-	regmap_read(rt1308->regmap, 0xc871, &tmp);
-	efuse_m_btl_r = tmp;
-	regmap_read(rt1308->regmap, 0xc870, &tmp);
-	efuse_m_btl_r = efuse_m_btl_r | (tmp << 8);
-	regmap_read(rt1308->regmap, 0xc873, &tmp);
-	efuse_c_btl_r = tmp;
-	regmap_read(rt1308->regmap, 0xc872, &tmp);
-	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
-	dev_dbg(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
-		efuse_m_btl_l, efuse_m_btl_r);
-	dev_dbg(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
-		efuse_c_btl_l, efuse_c_btl_r);
-
 	/* initial settings */
 	regmap_write(rt1308->regmap, 0xc103, 0xc0);
 	regmap_write(rt1308->regmap, 0xc030, 0x17);
@@ -323,6 +327,8 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
+	struct rt1308_sdw_priv *rt1308 =
+		snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -331,6 +337,7 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
 			RT1308_SDW_OFFSET | (RT1308_POWER_STATUS << 4),
 			0x3,	0x3);
 		msleep(40);
+		rt1308_apply_calib_params(rt1308);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		snd_soc_component_update_bits(component,
-- 
2.35.1

