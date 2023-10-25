Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8917D6A1C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 13:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1931D7;
	Wed, 25 Oct 2023 13:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1931D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698233323;
	bh=m9Z2VFIfyNtazcuKxQhTa6jvesCOLpR5ryYYglRAduI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oOjeFFdKgiieD3zx4KbHDxU5J527++hktIRYLlEqsy3mvp5AfJ8XlRTZMMvTuETeN
	 FgDDl40ZEU/D7lmQhYwqYWIiKG6O2fhRA2IXnaQjSIBe61Xqt7qjg26BMAzEnfLUal
	 Ry1E5GZdcWQmRvNf+6g2RkdAmVR8sKd+Pd7Pd1fM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111CCF80571; Wed, 25 Oct 2023 13:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6761AF80571;
	Wed, 25 Oct 2023 13:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6FFDF80578; Wed, 25 Oct 2023 13:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-125.mail.aliyun.com (out28-125.mail.aliyun.com
 [115.124.28.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 421E9F80564
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 13:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421E9F80564
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.0798378|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00838696-0.000239165-0.991374;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.V7r.pEQ_1698233203;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V7r.pEQ_1698233203)
          by smtp.aliyun-inc.com;
          Wed, 25 Oct 2023 19:26:50 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	rf@opensource.cirrus.com,
	arnd@arndb.de,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	ajye_huang@compal.corp-partner.google.com,
	fido_max@inbox.ru,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/3] ASoC: codecs: Add code for bin parsing compatible with
 aw88399
Date: Wed, 25 Oct 2023 19:26:24 +0800
Message-ID: <20231025112625.959587-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025112625.959587-1-wangweidong.a@awinic.com>
References: <20231025112625.959587-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQYRW7H7RDLH2EUHWBZHM3U46FQI5AWP
X-Message-ID-Hash: JQYRW7H7RDLH2EUHWBZHM3U46FQI5AWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQYRW7H7RDLH2EUHWBZHM3U46FQI5AWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add aw88399 compatible code to the aw88395_lib.c file
so that it can parse aw88399's bin file.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 3 +++
 sound/soc/codecs/aw88395/aw88395_reg.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index a0a429ca9768..9ebe7c510109 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -705,6 +705,7 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, all_prof_info);
 		if (ret < 0)
 			goto exit;
@@ -794,6 +795,7 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
 			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
@@ -836,6 +838,7 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
 			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
diff --git a/sound/soc/codecs/aw88395/aw88395_reg.h b/sound/soc/codecs/aw88395/aw88395_reg.h
index d0a273387313..ede7deab6a9c 100644
--- a/sound/soc/codecs/aw88395/aw88395_reg.h
+++ b/sound/soc/codecs/aw88395/aw88395_reg.h
@@ -95,6 +95,7 @@
 #define AW88395_TM_REG			(0x7C)
 
 enum aw88395_id {
+	AW88399_CHIP_ID = 0x2183,
 	AW88395_CHIP_ID = 0x2049,
 	AW88261_CHIP_ID = 0x2113,
 	AW87390_CHIP_ID = 0x76,
-- 
2.41.0

