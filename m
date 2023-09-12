Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0A79C775
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 09:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E4EDEE;
	Tue, 12 Sep 2023 09:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E4EDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694502097;
	bh=VL7Kfl23iPqIAXO0XpWZjlF0wiI8Ua9trfWGrOOWW/8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iVvQTKskhaleJa+Z+8aGXrLx2PTKouMK62xcK5iAz7GPMQm60ZRju7zSaiMmJO2W/
	 +x2kEOL9ZQVzlC0w7q7bszT5P517s5XLwDgrAE4kvI9ZVlkd6YEQsaedUxGQFXsq8R
	 gW1H7oA7ROqL0bXPRh4w7G1c4OxJvrn3ICrt202Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA1CF805A9; Tue, 12 Sep 2023 08:59:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD21F80580;
	Tue, 12 Sep 2023 08:59:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E938FF80588; Tue, 12 Sep 2023 08:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com
 [115.124.28.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE211F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 08:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE211F8007C
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06712908|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00695684-0.000218789-0.992824;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Ud9dowa_1694501963;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ud9dowa_1694501963)
          by smtp.aliyun-inc.com;
          Tue, 12 Sep 2023 14:59:30 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	ckeepax@opensource.cirrus.com,
	herve.codina@bootlin.com,
	wangweidong.a@awinic.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	sebastian.reichel@collabora.com,
	fido_max@inbox.ru,
	povik+lin@cutebit.org,
	arnd@arndb.de,
	harshit.m.mogalapalli@oracle.com,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/5] ASoC: codecs: Add code for bin parsing compatible with
 aw87390
Date: Tue, 12 Sep 2023 14:58:50 +0800
Message-ID: <20230912065852.347000-4-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912065852.347000-1-wangweidong.a@awinic.com>
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D2NSAYNTHPEUUDV5GE7B6DFBW3HPZATW
X-Message-ID-Hash: D2NSAYNTHPEUUDV5GE7B6DFBW3HPZATW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2NSAYNTHPEUUDV5GE7B6DFBW3HPZATW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add aw87390 compatible code to the aw88395_lib.c file
so that it can parse aw87390's bin file and function
return method

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395.c        |  9 ++---
 sound/soc/codecs/aw88395/aw88395.h        |  2 +-
 sound/soc/codecs/aw88395/aw88395_device.c | 47 ++++++-----------------
 sound/soc/codecs/aw88395/aw88395_device.h |  6 +--
 sound/soc/codecs/aw88395/aw88395_lib.c    | 23 ++++++-----
 sound/soc/codecs/aw88395/aw88395_reg.h    |  1 +
 6 files changed, 33 insertions(+), 55 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 9dcd75dd799a..77227c8f01f6 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -175,9 +175,8 @@ static int aw88395_profile_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
-	const char *prof_name;
-	char *name;
-	int count;
+	char *prof_name, *name;
+	int count, ret;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
 	uinfo->count = 1;
@@ -196,8 +195,8 @@ static int aw88395_profile_info(struct snd_kcontrol *kcontrol,
 	name = uinfo->value.enumerated.name;
 	count = uinfo->value.enumerated.item;
 
-	prof_name = aw88395_dev_get_prof_name(aw88395->aw_pa, count);
-	if (!prof_name) {
+	ret = aw88395_dev_get_prof_name(aw88395->aw_pa, count, &prof_name);
+	if (ret) {
 		strscpy(uinfo->value.enumerated.name, "null",
 						strlen("null") + 1);
 		return 0;
diff --git a/sound/soc/codecs/aw88395/aw88395.h b/sound/soc/codecs/aw88395/aw88395.h
index 8036ba27f68d..c2a4f0cb8cd5 100644
--- a/sound/soc/codecs/aw88395/aw88395.h
+++ b/sound/soc/codecs/aw88395/aw88395.h
@@ -16,7 +16,7 @@
 
 #define AW88395_DSP_16_DATA_MASK		(0x0000ffff)
 
-#define AW88395_I2C_NAME			"aw88395_smartpa"
+#define AW88395_I2C_NAME			"aw88395"
 
 #define AW88395_RATES (SNDRV_PCM_RATE_8000_48000 | \
 			SNDRV_PCM_RATE_96000)
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
diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 8ee1baa03269..9d561ae27feb 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -455,9 +455,11 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 		goto parse_bin_failed;
 	}
 
-	if (aw_bin->header_info[0].valid_data_len % 4) {
-		dev_err(aw_dev->dev, "bin data len get error!");
-		goto parse_bin_failed;
+	if (aw_dev->chip_id == AW88261_CHIP_ID) {
+		if (aw_bin->header_info[0].valid_data_len % 4) {
+			dev_err(aw_dev->dev, "bin data len get error!");
+			goto parse_bin_failed;
+		}
 	}
 
 	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].data =
@@ -579,9 +581,9 @@ static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,
 }
 
 static int aw88261_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
-				struct aw_all_prof_info all_prof_info)
+				struct aw_all_prof_info *all_prof_info)
 {
-	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
+	struct aw_prof_desc *prof_desc = all_prof_info->prof_desc;
 	struct aw_prof_info *prof_info = &aw_dev->prof_info;
 	int num = 0;
 	int i;
@@ -621,9 +623,9 @@ static int aw88261_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
 }
 
 static int aw88395_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
-				struct aw_all_prof_info all_prof_info)
+				struct aw_all_prof_info *all_prof_info)
 {
-	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
+	struct aw_prof_desc *prof_desc = all_prof_info->prof_desc;
 	struct aw_prof_info *prof_info = &aw_dev->prof_info;
 	struct aw_sec_data_desc *sec_desc;
 	int num = 0;
@@ -701,12 +703,13 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
-		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
+		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, all_prof_info);
 		if (ret < 0)
 			goto exit;
 		break;
 	case AW88261_CHIP_ID:
-		ret = aw88261_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
+	case AW87390_CHIP_ID:
+		ret = aw88261_dev_cfg_get_valid_prof(aw_dev, all_prof_info);
 		if (ret < 0)
 			goto exit;
 		break;
@@ -799,6 +802,7 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
 		ret = 0;
 		break;
 	case AW88261_CHIP_ID:
+	case AW87390_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if (((cfg_dde[i].data_type == ACF_SEC_TYPE_REG) ||
 			     (cfg_dde[i].data_type == ACF_SEC_TYPE_HDR_REG)) &&
@@ -839,6 +843,7 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
 		ret = 0;
 		break;
 	case AW88261_CHIP_ID:
+	case AW87390_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if (((cfg_dde[i].data_type == ACF_SEC_TYPE_REG) ||
 			     (cfg_dde[i].data_type == ACF_SEC_TYPE_HDR_REG)) &&
diff --git a/sound/soc/codecs/aw88395/aw88395_reg.h b/sound/soc/codecs/aw88395/aw88395_reg.h
index e7a7c02efaf3..d0a273387313 100644
--- a/sound/soc/codecs/aw88395/aw88395_reg.h
+++ b/sound/soc/codecs/aw88395/aw88395_reg.h
@@ -97,6 +97,7 @@
 enum aw88395_id {
 	AW88395_CHIP_ID = 0x2049,
 	AW88261_CHIP_ID = 0x2113,
+	AW87390_CHIP_ID = 0x76,
 };
 
 #define AW88395_REG_MAX		(0x7D)
-- 
2.41.0

