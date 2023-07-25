Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029EE7617D0
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E897C152F;
	Tue, 25 Jul 2023 13:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E897C152F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286289;
	bh=4ZQbJzQiHw3swaJv62mgX6+sbQC5kyQjFYt1f9oGosQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmiu0CRzVn24JD0nVBuoFHATNwsf6L+4xTpWwK2zhB92TuNugMs8MqRgvi7Sbkkqx
	 6me1Qu4wWvCwQSHFjVehBXkYm8BwlYyet6ZNsGFRmIJmQ4f+AoHeE7AflGVURD9Ayw
	 PPSfpSiroy1tTQdhWgGvXhYqu12im2jBfpVtwxm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E58F80558; Tue, 25 Jul 2023 13:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BEEF80549;
	Tue, 25 Jul 2023 13:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2962F80544; Tue, 25 Jul 2023 13:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com
 [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BBDDF801F5
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 13:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BBDDF801F5
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06712908|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00156162-6.8496e-05-0.99837;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.U.y2whU_1690286215;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U.y2whU_1690286215)
          by smtp.aliyun-inc.com;
          Tue, 25 Jul 2023 19:56:58 +0800
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
	wangweidong.a@awinic.com,
	povik+lin@cutebit.org,
	13916275206@139.com,
	herve.codina@bootlin.com,
	ryans.lee@analog.com,
	ckeepax@opensource.cirrus.com,
	ajye_huang@compal.corp-partner.google.com,
	sebastian.reichel@collabora.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
Subject: [PATCH V2 1/4] ASoC: codecs: Add code for bin parsing compatible with
 aw88261
Date: Tue, 25 Jul 2023 19:56:46 +0800
Message-ID: <20230725115649.67560-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725115649.67560-1-wangweidong.a@awinic.com>
References: <20230725115649.67560-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MGGZACF5WEAAIRN3TPZ46K5UGI4CCQLH
X-Message-ID-Hash: MGGZACF5WEAAIRN3TPZ46K5UGI4CCQLH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGGZACF5WEAAIRN3TPZ46K5UGI4CCQLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88261 property to the awinic,aw88395.yaml file
Add aw88395_lib.c file compatible with aw88261 bin file parsing code

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../bindings/sound/awinic,aw88395.yaml        |   4 +-
 sound/soc/codecs/aw88395/aw88395_lib.c        | 194 ++++++++++++++++--
 sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
 3 files changed, 181 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 35eef7d818a2..4051c2538caf 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: awinic,aw88395
+    enum:
+      - awinic,aw88395
+      - awinic,aw88261
 
   reg:
     maxItems: 1
diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 05bcf49da857..45a3b21cae70 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include "aw88395_lib.h"
 #include "aw88395_device.h"
+#include "aw88395_reg.h"
 
 #define AW88395_CRC8_POLYNOMIAL 0x8C
 DECLARE_CRC8_TABLE(aw_crc8_table);
@@ -429,6 +430,53 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 	return ret;
 }
 
+static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
+{
+	struct aw_bin *aw_bin;
+	int ret;
+
+	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(struct aw_bin), GFP_KERNEL);
+	if (!aw_bin)
+		return -ENOMEM;
+
+	aw_bin->info.len = data_len;
+	memcpy(aw_bin->info.data, data, data_len);
+
+	ret = aw_parsing_bin_file(aw_dev, aw_bin);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "parse bin failed");
+		goto parse_bin_failed;
+	}
+
+	if ((aw_bin->all_bin_parse_num != 1) ||
+		(aw_bin->header_info[0].bin_data_type != DATA_TYPE_REGISTER)) {
+		dev_err(aw_dev->dev, "bin num or type error");
+		goto parse_bin_failed;
+	}
+
+	if (aw_bin->header_info[0].valid_data_len % 4) {
+		dev_err(aw_dev->dev, "bin data len get error!");
+		goto parse_bin_failed;
+	}
+
+	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].data =
+				data + aw_bin->header_info[0].valid_data_addr;
+	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].len =
+				aw_bin->header_info[0].valid_data_len;
+	prof_desc->prof_st = AW88395_PROFILE_OK;
+
+	devm_kfree(aw_dev->dev, aw_bin);
+	aw_bin = NULL;
+
+	return 0;
+
+parse_bin_failed:
+	devm_kfree(aw_dev->dev, aw_bin);
+	aw_bin = NULL;
+	return ret;
+}
+
 static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg_hdr *cfg_hdr,
 			struct aw_cfg_dde *cfg_dde, struct aw_prof_desc *scene_prof_desc)
 {
@@ -447,6 +495,9 @@ static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg
 		return aw_dev_prof_parse_multi_bin(
 				aw_dev, (u8 *)cfg_hdr + cfg_dde->data_offset,
 				cfg_dde->data_size, scene_prof_desc);
+	case ACF_SEC_TYPE_HDR_REG:
+		return aw_dev_parse_reg_bin_with_hdr(aw_dev, (u8 *)cfg_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, scene_prof_desc);
 	default:
 		dev_err(aw_dev->dev, "%s cfg_dde->data_type = %d\n", __func__, cfg_dde->data_type);
 		break;
@@ -527,7 +578,50 @@ static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,
 	return 0;
 }
 
-static int aw_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
+static int aw88261_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
+				struct aw_all_prof_info all_prof_info)
+{
+	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+	int num = 0;
+	int i;
+
+	for (i = 0; i < AW88395_PROFILE_MAX; i++) {
+		if (prof_desc[i].prof_st == AW88395_PROFILE_OK)
+			prof_info->count++;
+	}
+
+	dev_dbg(aw_dev->dev, "get valid profile:%d", aw_dev->prof_info.count);
+
+	if (!prof_info->count) {
+		dev_err(aw_dev->dev, "no profile data");
+		return -EPERM;
+	}
+
+	prof_info->prof_desc = devm_kcalloc(aw_dev->dev,
+					prof_info->count, sizeof(struct aw_prof_desc),
+					GFP_KERNEL);
+	if (!prof_info->prof_desc)
+		return -ENOMEM;
+
+	for (i = 0; i < AW88395_PROFILE_MAX; i++) {
+		if (prof_desc[i].prof_st == AW88395_PROFILE_OK) {
+			if (num >= prof_info->count) {
+				dev_err(aw_dev->dev, "overflow count[%d]",
+						prof_info->count);
+				return -EINVAL;
+			}
+			prof_info->prof_desc[num] = prof_desc[i];
+			prof_info->prof_desc[num].id = i;
+			num++;
+		}
+	}
+
+	return 0;
+}
+
+static int aw88395_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
 				struct aw_all_prof_info all_prof_info)
 {
 	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
@@ -606,9 +700,22 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 			goto exit;
 	}
 
-	ret = aw_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
-	if (ret < 0)
-		goto exit;
+	switch (aw_dev->chip_id) {
+	case AW88395_CHIP_ID:
+		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
+		if (ret < 0)
+			goto exit;
+		break;
+	case AW88261_CHIP_ID:
+		ret = aw88261_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
+		if (ret < 0)
+			goto exit;
+		break;
+	default:
+		dev_err(aw_dev->dev, "valid prof unsupported");
+		ret = -EINVAL;
+		break;
+	}
 
 	aw_dev->prof_info.prof_name_list = profile_name;
 
@@ -679,16 +786,37 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
 	struct aw_cfg_dde_v1 *cfg_dde =
 		(struct aw_cfg_dde_v1 *)(aw_cfg->data + cfg_hdr->hdr_offset);
 	unsigned int i;
+	int ret;
 
-	for (i = 0; i < cfg_hdr->ddt_num; ++i) {
-		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
-		    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
-		    (aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
-		    (aw_dev->i2c->addr == cfg_dde[i].dev_addr))
-			(*scene_num)++;
+	switch (aw_dev->chip_id) {
+	case AW88395_CHIP_ID:
+		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
+			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
+			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			    (aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
+			    (aw_dev->i2c->addr == cfg_dde[i].dev_addr))
+				(*scene_num)++;
+		}
+		ret = 0;
+		break;
+	case AW88261_CHIP_ID:
+		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
+			if (((cfg_dde[i].data_type == ACF_SEC_TYPE_REG) ||
+			     (cfg_dde[i].data_type == ACF_SEC_TYPE_HDR_REG)) &&
+			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			    (aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
+			    (aw_dev->i2c->addr == cfg_dde[i].dev_addr))
+				(*scene_num)++;
+		}
+		ret = 0;
+		break;
+	default:
+		dev_err(aw_dev->dev, "unsupported device");
+		ret = -EINVAL;
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
@@ -699,15 +827,35 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
 	struct aw_cfg_dde_v1 *cfg_dde =
 		(struct aw_cfg_dde_v1 *)(aw_cfg->data + cfg_hdr->hdr_offset);
 	unsigned int i;
+	int ret;
 
-	for (i = 0; i < cfg_hdr->ddt_num; ++i) {
-		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
-		    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
-		    (aw_dev->channel == cfg_dde[i].dev_index))
-			(*scene_num)++;
+	switch (aw_dev->chip_id) {
+	case AW88395_CHIP_ID:
+		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
+			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
+			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			    (aw_dev->channel == cfg_dde[i].dev_index))
+				(*scene_num)++;
+		}
+		ret = 0;
+		break;
+	case AW88261_CHIP_ID:
+		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
+			if (((cfg_dde[i].data_type == ACF_SEC_TYPE_REG) ||
+			     (cfg_dde[i].data_type == ACF_SEC_TYPE_HDR_REG)) &&
+			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
+			    (aw_dev->channel == cfg_dde[i].dev_index))
+				(*scene_num)++;
+		}
+		ret = 0;
+		break;
+	default:
+		dev_err(aw_dev->dev, "unsupported device");
+		ret = -EINVAL;
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int aw_dev_parse_scene_count_v1(struct aw_device *aw_dev,
@@ -756,6 +904,18 @@ static int aw_dev_parse_data_by_sec_type_v1(struct aw_device *aw_dev,
 		prof_info->prof_desc[*cur_scene_id].id = cfg_dde->dev_profile;
 		(*cur_scene_id)++;
 		break;
+	case ACF_SEC_TYPE_HDR_REG:
+		ret =  aw_dev_parse_reg_bin_with_hdr(aw_dev,
+				(uint8_t *)prof_hdr + cfg_dde->data_offset,
+				cfg_dde->data_size, &prof_info->prof_desc[*cur_scene_id]);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "parse reg bin with hdr failed");
+			return ret;
+		}
+		prof_info->prof_desc[*cur_scene_id].prf_str = cfg_dde->dev_profile_str;
+		prof_info->prof_desc[*cur_scene_id].id = cfg_dde->dev_profile;
+		(*cur_scene_id)++;
+		break;
 	default:
 		dev_err(aw_dev->dev, "unsupported SEC_TYPE [%d]", cfg_dde->data_type);
 		return -EINVAL;
diff --git a/sound/soc/codecs/aw88395/aw88395_reg.h b/sound/soc/codecs/aw88395/aw88395_reg.h
index e64f24e97150..e7a7c02efaf3 100644
--- a/sound/soc/codecs/aw88395/aw88395_reg.h
+++ b/sound/soc/codecs/aw88395/aw88395_reg.h
@@ -96,6 +96,7 @@
 
 enum aw88395_id {
 	AW88395_CHIP_ID = 0x2049,
+	AW88261_CHIP_ID = 0x2113,
 };
 
 #define AW88395_REG_MAX		(0x7D)
-- 
2.41.0

