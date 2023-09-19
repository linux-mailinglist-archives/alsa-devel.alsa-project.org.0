Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A807A6071
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 067F3E80;
	Tue, 19 Sep 2023 12:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 067F3E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695121183;
	bh=KvpPvUl4BQO3gQO3dbzR3gSk5exX4xlVzbxZBgAZwLk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iKndqX92Jj0lqMi8dlkfGNbg8XLA+ibGKCnNNrHB4RU+5jwTZGrYlvFvHwT5aTi34
	 hNv+zQUAwSXmLJaVf1IGLNrbMcVFo2coDkxnoCrvn56fvU7tsz6TbdT951ctCISen6
	 ozdzlbYAPTQJuVHc8Ze+jFmdvjrjNA6JI7665YbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949B4F805AC; Tue, 19 Sep 2023 12:58:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 423F8F8058C;
	Tue, 19 Sep 2023 12:58:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D7AAF805A0; Tue, 19 Sep 2023 12:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com
 [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67154F80589
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67154F80589
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06712914|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0110995-0.00248983-0.986411;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Uj4ES2K_1695121070;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Uj4ES2K_1695121070)
          by smtp.aliyun-inc.com;
          Tue, 19 Sep 2023 18:57:57 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	rf@opensource.cirrus.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	ryans.lee@analog.com,
	13916275206@139.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	povik+lin@cutebit.org,
	harshit.m.mogalapalli@oracle.com,
	arnd@arndb.de,
	yijiangtao@awinic.com,
	yang.lee@linux.alibaba.com,
	liweilei@awinic.com,
	u.kleine-koenig@pengutronix.de,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/7] ASoC: codecs: Modify the transmission method of
 parameters and property node
Date: Tue, 19 Sep 2023 18:57:20 +0800
Message-ID: <20230919105724.105624-4-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919105724.105624-1-wangweidong.a@awinic.com>
References: <20230919105724.105624-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VMO7CUCQA2UCYJTG3O4RAOINYQKR4JIW
X-Message-ID-Hash: VMO7CUCQA2UCYJTG3O4RAOINYQKR4JIW
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMO7CUCQA2UCYJTG3O4RAOINYQKR4JIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Remove the fade-enable property because other properties
already implement this functionality.
Modify the transmission method of parameters.
Rename "sound-channel" to "awinic,audio-channel"

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395_device.c | 47 ++++++-----------------
 sound/soc/codecs/aw88395/aw88395_device.h |  6 +--
 2 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 33eda3741464..fd1f67d5f22f 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -297,9 +297,6 @@ static void aw_dev_fade_in(struct aw_device *aw_dev)
 	int fade_step = aw_dev->fade_step;
 	int i;
 
-	if (!aw_dev->fade_en)
-		return;
-
 	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
 		aw_dev_set_volume(aw_dev, fade_in_vol);
 		return;
@@ -320,9 +317,6 @@ static void aw_dev_fade_out(struct aw_device *aw_dev)
 	int fade_step = aw_dev->fade_step;
 	int i;
 
-	if (!aw_dev->fade_en)
-		return;
-
 	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
 		aw_dev_set_volume(aw_dev, AW88395_MUTE_VOL);
 		return;
@@ -1062,10 +1056,6 @@ static int aw_dev_update_reg_container(struct aw_device *aw_dev,
 		aw_dev_set_volume(aw_dev, vol_desc->ctl_volume);
 	}
 
-	/* keep min volume */
-	if (aw_dev->fade_en)
-		aw_dev_set_volume(aw_dev, AW88395_MUTE_VOL);
-
 	aw_dev_get_dsp_config(aw_dev, &aw_dev->dsp_cfg);
 
 	return ret;
@@ -1306,7 +1296,9 @@ int aw88395_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool forc
 		return -EPERM;
 	}
 
-	prof_name = aw88395_dev_get_prof_name(aw_dev, aw_dev->prof_index);
+	ret = aw88395_dev_get_prof_name(aw_dev, aw_dev->prof_index, &prof_name);
+	if (ret)
+		return ret;
 
 	dev_dbg(aw_dev->dev, "start update %s", prof_name);
 
@@ -1594,37 +1586,19 @@ static void aw88395_parse_channel_dt(struct aw_device *aw_dev)
 	u32 channel_value;
 	int ret;
 
-	ret = of_property_read_u32(np, "sound-channel", &channel_value);
+	ret = of_property_read_u32(np, "awinic,audio-channel", &channel_value);
 	if (ret) {
 		dev_dbg(aw_dev->dev,
-			"read sound-channel failed,use default 0");
+			"read audio-channel failed,use default 0");
 		aw_dev->channel = AW88395_DEV_DEFAULT_CH;
 		return;
 	}
 
-	dev_dbg(aw_dev->dev, "read sound-channel value is: %d",
+	dev_dbg(aw_dev->dev, "read audio-channel value is: %d",
 			channel_value);
 	aw_dev->channel = channel_value;
 }
 
-static void aw88395_parse_fade_enable_dt(struct aw_device *aw_dev)
-{
-	struct device_node *np = aw_dev->dev->of_node;
-	u32 fade_en;
-	int ret;
-
-	ret = of_property_read_u32(np, "fade-enable", &fade_en);
-	if (ret) {
-		dev_dbg(aw_dev->dev,
-			"read fade-enable failed, close fade_in_out");
-		fade_en = AW88395_FADE_IN_OUT_DEFAULT;
-	}
-
-	dev_dbg(aw_dev->dev, "read fade-enable value is: %d", fade_en);
-
-	aw_dev->fade_en = fade_en;
-}
-
 static int aw_dev_init(struct aw_device *aw_dev)
 {
 	aw_dev->chip_id = AW88395_CHIP_ID;
@@ -1639,7 +1613,6 @@ static int aw_dev_init(struct aw_device *aw_dev)
 	aw_dev->fade_step = AW88395_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88395_VOL_DEFAULT_VALUE;
 	aw88395_parse_channel_dt(aw_dev);
-	aw88395_parse_fade_enable_dt(aw_dev);
 
 	return 0;
 }
@@ -1673,7 +1646,7 @@ int aw88395_dev_set_profile_index(struct aw_device *aw_dev, int index)
 }
 EXPORT_SYMBOL_GPL(aw88395_dev_set_profile_index);
 
-char *aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index)
+int aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_name)
 {
 	struct aw_prof_info *prof_info = &aw_dev->prof_info;
 	struct aw_prof_desc *prof_desc;
@@ -1681,12 +1654,14 @@ char *aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index)
 	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
 		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
 			index, aw_dev->prof_info.count);
-		return NULL;
+		return -EINVAL;
 	}
 
 	prof_desc = &aw_dev->prof_info.prof_desc[index];
 
-	return prof_info->prof_name_list[prof_desc->id];
+	*prof_name = prof_info->prof_name_list[prof_desc->id];
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(aw88395_dev_get_prof_name);
 
diff --git a/sound/soc/codecs/aw88395/aw88395_device.h b/sound/soc/codecs/aw88395/aw88395_device.h
index caf730753167..791c8c106557 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.h
+++ b/sound/soc/codecs/aw88395/aw88395_device.h
@@ -141,6 +141,7 @@ struct aw_device {
 	unsigned char prof_cur;
 	unsigned char prof_index;
 	unsigned char dsp_crc_st;
+	unsigned char dsp_cfg;
 	u16 chip_id;
 
 	unsigned int channel;
@@ -151,9 +152,6 @@ struct aw_device {
 	struct regmap *regmap;
 	char *acf;
 
-	u32 fade_en;
-	unsigned char dsp_cfg;
-
 	u32 dsp_fw_len;
 	u32 dsp_cfg_len;
 	u8 platform;
@@ -183,7 +181,7 @@ int aw88395_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool forc
 void aw88395_dev_set_volume(struct aw_device *aw_dev, unsigned short set_vol);
 int aw88395_dev_get_prof_data(struct aw_device *aw_dev, int index,
 			struct aw_prof_desc **prof_desc);
-char *aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index);
+int aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_name);
 int aw88395_dev_set_profile_index(struct aw_device *aw_dev, int index);
 int aw88395_dev_get_profile_index(struct aw_device *aw_dev);
 int aw88395_dev_get_profile_count(struct aw_device *aw_dev);
-- 
2.41.0

