Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E262267F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:14:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E82D85D;
	Wed,  9 Nov 2022 10:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E82D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667985251;
	bh=Y1j99zd8ztMDG6slTqdgIEpwotq1ESK6+fYgT6hPCkQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dnl79ZYhMqNWt+yd9sCUUOnb/y0ZOJ63n380svBiLIkhpBWbom512R+wYNvatjRFv
	 k/cL5QncACXNtRGBk0iEWbKCmFLFAcXw3NowbBgeTdvm26OwO7FKLIch+iO331FRKs
	 1V1/yAYMPEkjpEuvLPSyectcQi/C75FfEDyuG/4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39DDDF8050F;
	Wed,  9 Nov 2022 10:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D964F80217; Wed,  9 Nov 2022 10:12:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 10067F800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10067F800EC
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A99C0ZX0021966,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A99C0ZX0021966
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 9 Nov 2022 17:12:00 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 9 Nov 2022 17:12:39 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 9 Nov 2022 17:12:38 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/4] ASoC: rt1308-sdw: get BQ params property and apply them
Date: Wed, 9 Nov 2022 17:12:34 +0800
Message-ID: <20221109091234.17180-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt1308-sdw.c | 39 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt1308-sdw.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index f99aed353f10..7f4248284f35 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -197,6 +197,17 @@ static void rt1308_apply_calib_params(struct rt1308_sdw_priv *rt1308)
 		efuse_c_btl_l, efuse_c_btl_r);
 }
 
+static void rt1308_apply_bq_params(struct rt1308_sdw_priv *rt1308)
+{
+	unsigned int i, reg, data;
+
+	for (i = 0; i < rt1308->bq_params_cnt; i += 3) {
+		reg = rt1308->bq_params[i] | (rt1308->bq_params[i + 1] << 8);
+		data = rt1308->bq_params[i + 2];
+		regmap_write(rt1308->regmap, reg, data);
+	}
+}
+
 static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
@@ -619,14 +630,42 @@ static const struct sdw_slave_ops rt1308_slave_ops = {
 	.bus_config = rt1308_bus_config,
 };
 
+static int rt1308_sdw_parse_dt(struct rt1308_sdw_priv *rt1308, struct device *dev)
+{
+	int ret = 0;
+
+	device_property_read_u32(dev, "realtek,bq-params-cnt", &rt1308->bq_params_cnt);
+	if (rt1308->bq_params_cnt) {
+		rt1308->bq_params = devm_kzalloc(dev, rt1308->bq_params_cnt, GFP_KERNEL);
+		if (!rt1308->bq_params) {
+			dev_err(dev, "Could not allocate bq_params memory\n");
+			ret = -ENOMEM;
+		} else {
+			ret = device_property_read_u8_array(dev, "realtek,bq-params", rt1308->bq_params, rt1308->bq_params_cnt);
+			if (ret < 0)
+				dev_err(dev, "Could not read list of realtek,bq-params\n");
+		}
+	}
+
+	dev_dbg(dev, "bq_params_cnt=%d\n", rt1308->bq_params_cnt);
+	return ret;
+}
+
 static int rt1308_sdw_component_probe(struct snd_soc_component *component)
 {
+	struct rt1308_sdw_priv *rt1308 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+	rt1308->component = component;
+	rt1308_sdw_parse_dt(rt1308, &rt1308->sdw_slave->dev);
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
+	/* apply BQ params */
+	rt1308_apply_bq_params(rt1308);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
index 62ce27799307..1eaaef9f351b 100644
--- a/sound/soc/codecs/rt1308-sdw.h
+++ b/sound/soc/codecs/rt1308-sdw.h
@@ -166,6 +166,8 @@ struct rt1308_sdw_priv {
 	int rx_mask;
 	int slots;
 	int hw_ver;
+	unsigned char *bq_params;
+	unsigned int bq_params_cnt;
 };
 
 struct sdw_stream_data {
-- 
2.38.1

