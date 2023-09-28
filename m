Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C17B18D3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 13:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B727E7C;
	Thu, 28 Sep 2023 13:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B727E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695898861;
	bh=+xxdEsnO8YKMyHd4qDl+J9UQ+EvZ62dZq8oOdlRc7jY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rdeNXTo9uUVXbFpAqfbL7R8zH1yA68Hufzse1C9w6aa/QQUNN99Z4qwNlzyj7xPlq
	 58jliu3xa1tdzdomDBk8kYScZ5YJyEP16HrefzwaofEiO8xlJEFgHzFwmMRX1y0fOT
	 pqgiQ8RFFWjgLilMyKs5yBph6WscO6WBN/ii06CE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B32FF805CA; Thu, 28 Sep 2023 12:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A1B6F8047D;
	Thu, 28 Sep 2023 12:58:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001DEF805D2; Thu, 28 Sep 2023 12:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com
 [115.124.28.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 817D7F805C7
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 12:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817D7F805C7
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06715943|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0068788-0.000217375-0.992904;FP=9863284613152526578|1|1|20|0|-1|-1|-1;HT=ay29a033018047203;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.UqYH948_1695898710;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UqYH948_1695898710)
          by smtp.aliyun-inc.com;
          Thu, 28 Sep 2023 18:58:38 +0800
From: wangweidong.a@awinic.com
To: girdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	rdunlap@infradead.org,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	doug@schmorgal.com,
	ajye_huang@compal.corp-partner.google.com,
	harshit.m.mogalapalli@oracle.com,
	arnd@arndb.de,
	yang.lee@linux.alibaba.com,
	u.kleine-koenig@pengutronix.de,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	dan.carpenter@linaro.org,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 07/10] ASoC: codecs: Add code for bin parsing compatible
 with aw87390
Date: Thu, 28 Sep 2023 18:57:24 +0800
Message-ID: <20230928105727.47273-8-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928105727.47273-1-wangweidong.a@awinic.com>
References: <20230928105727.47273-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DDR3WT7RHU7PXH2E2JBY46UYXTVY37DI
X-Message-ID-Hash: DDR3WT7RHU7PXH2E2JBY46UYXTVY37DI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDR3WT7RHU7PXH2E2JBY46UYXTVY37DI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add aw87390 compatible code to the aw88395_lib.c file
so that it can parse aw87390's bin file

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 25 +++++++++++++++----------
 sound/soc/codecs/aw88395/aw88395_reg.h |  1 +
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 87dd0ccade4c..a0a429ca9768 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -456,10 +456,12 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 		goto parse_bin_failed;
 	}
 
-	if (aw_bin->header_info[0].valid_data_len % 4) {
-		dev_err(aw_dev->dev, "bin data len get error!");
-		ret = -EINVAL;
-		goto parse_bin_failed;
+	if (aw_dev->chip_id == AW88261_CHIP_ID) {
+		if (aw_bin->header_info[0].valid_data_len % 4) {
+			dev_err(aw_dev->dev, "bin data len get error!");
+			ret = -EINVAL;
+			goto parse_bin_failed;
+		}
 	}
 
 	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].data =
@@ -581,9 +583,9 @@ static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,
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
@@ -623,9 +625,9 @@ static int aw88261_dev_cfg_get_valid_prof(struct aw_device *aw_dev,
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
@@ -703,12 +705,13 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 
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
@@ -801,6 +804,7 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
 		ret = 0;
 		break;
 	case AW88261_CHIP_ID:
+	case AW87390_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if (((cfg_dde[i].data_type == ACF_SEC_TYPE_REG) ||
 			     (cfg_dde[i].data_type == ACF_SEC_TYPE_HDR_REG)) &&
@@ -841,6 +845,7 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
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

