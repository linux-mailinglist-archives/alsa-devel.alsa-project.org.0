Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56829622684
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA8CC950;
	Wed,  9 Nov 2022 10:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA8CC950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667985272;
	bh=YBG7h3dKjLlIljfXSrdwWLhi+dwOjs07uz+J4J19ljk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IwJQAB6pyxxizNOBvBHKB3TAyp6DQc4KZS/4Osj4D83w/PVKXTjdH4zDxsTW1osPU
	 IYeJFmcGQ7aj04pJKmRisAtLQ4OhBo9WNh1Ix4TatbTLs/MobpG7jLUzdi8ei3pirt
	 eJZy1bClI9LC7nBagi6FeFeRzt28sYpNbZc22qcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA83EF80114;
	Wed,  9 Nov 2022 10:13:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CD6F804FE; Wed,  9 Nov 2022 10:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id A07F9F804FE
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A07F9F804FE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A99CA3r8021996,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A99CA3r8021996
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 9 Nov 2022 17:12:10 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 9 Nov 2022 17:12:48 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 9 Nov 2022 17:12:48 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: rt1316-sdw: get BQ params property and apply them
Date: Wed, 9 Nov 2022 17:12:44 +0800
Message-ID: <20221109091244.17198-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2022 08:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzExLzkgpFekyCAwNzoxNTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, jfmiranda@gmail.com, flove@realtek.com,
 pierre-louis.bossart@intel.com
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

If the machine driver level sets the BQ params into the device property,
the codec driver will get the BQ params and apply them.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Pierre-Louis Bossart pierre-louis.bossart@linux.intel.com
---
 sound/soc/codecs/rt1316-sdw.c | 39 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt1316-sdw.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index ed0a11436362..2db7ee6c6d33 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -254,6 +254,17 @@ static int rt1316_read_prop(struct sdw_slave *slave)
 	return 0;
 }
 
+static void rt1316_apply_bq_params(struct rt1316_sdw_priv *rt1316)
+{
+	unsigned int i, reg, data;
+
+	for (i = 0; i < rt1316->bq_params_cnt; i += 3) {
+		reg = rt1316->bq_params[i] | (rt1316->bq_params[i + 1] << 8);
+		data = rt1316->bq_params[i + 2];
+		regmap_write(rt1316->regmap, reg, data);
+	}
+}
+
 static int rt1316_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
@@ -590,14 +601,42 @@ static struct sdw_slave_ops rt1316_slave_ops = {
 	.update_status = rt1316_update_status,
 };
 
+static int rt1316_sdw_parse_dt(struct rt1316_sdw_priv *rt1316, struct device *dev)
+{
+	int ret = 0;
+
+	device_property_read_u32(dev, "realtek,bq-params-cnt", &rt1316->bq_params_cnt);
+	if (rt1316->bq_params_cnt) {
+		rt1316->bq_params = devm_kzalloc(dev, rt1316->bq_params_cnt, GFP_KERNEL);
+		if (!rt1316->bq_params) {
+			dev_err(dev, "Could not allocate bq_params memory\n");
+			ret = -ENOMEM;
+		} else {
+			ret = device_property_read_u8_array(dev, "realtek,bq-params", rt1316->bq_params, rt1316->bq_params_cnt);
+			if (ret < 0)
+				dev_err(dev, "Could not read list of realtek,bq-params\n");
+		}
+	}
+
+	dev_dbg(dev, "bq_params_cnt=%d\n", rt1316->bq_params_cnt);
+	return ret;
+}
+
 static int rt1316_sdw_component_probe(struct snd_soc_component *component)
 {
+	struct rt1316_sdw_priv *rt1316 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+	rt1316->component = component;
+	rt1316_sdw_parse_dt(rt1316, &rt1316->sdw_slave->dev);
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
+	/* apply BQ params */
+	rt1316_apply_bq_params(rt1316);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt1316-sdw.h b/sound/soc/codecs/rt1316-sdw.h
index cbcdaa8f8cfa..57dbd49993b0 100644
--- a/sound/soc/codecs/rt1316-sdw.h
+++ b/sound/soc/codecs/rt1316-sdw.h
@@ -46,6 +46,8 @@ struct rt1316_sdw_priv {
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
+	unsigned char *bq_params;
+	unsigned int bq_params_cnt;
 };
 
 struct sdw_stream_data {
-- 
2.38.1

