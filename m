Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F277D4850
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 09:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A2B8850;
	Tue, 24 Oct 2023 09:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A2B8850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698131989;
	bh=IQsmccv3E5ik2v3vIqQ3eHf0yLvpXzYj0d36D4i6FVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e9sPlRJDVTMTuqyv5tfy3Na2yxIsyMk4isXwbrrKF/JZX2VKuk045cGdVrtQiJvu8
	 h/9jJU1tiUdfmGQS+sd/jEDW9Dt9e5+akAYvaMiF6A5TLu5gWFv5j0CceUmScBU5ML
	 H7d7LG+2Usww16kE8gLvZZcOXBj6RvXfHizQqqh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B818F80587; Tue, 24 Oct 2023 09:17:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 682D3F80571;
	Tue, 24 Oct 2023 09:17:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71A6DF8012B; Tue, 24 Oct 2023 09:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-100.mail.aliyun.com (out28-100.mail.aliyun.com
 [115.124.28.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 583D7F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 09:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583D7F8012B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.08838684|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00825157-0.000204018-0.991544;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V6azqD8_1698131689;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V6azqD8_1698131689)
          by smtp.aliyun-inc.com;
          Tue, 24 Oct 2023 15:14:57 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: [PATCH V2 3/4] ASoC: codecs: Add code for bin parsing compatible with
 aw88399
Date: Tue, 24 Oct 2023 15:14:18 +0800
Message-ID: <20231024071419.85647-4-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024071419.85647-1-wangweidong.a@awinic.com>
References: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
 <20231024071419.85647-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MECVQ6GUC743JUINHPE7XY3WENIKSZF6
X-Message-ID-Hash: MECVQ6GUC743JUINHPE7XY3WENIKSZF6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MECVQ6GUC743JUINHPE7XY3WENIKSZF6/>
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

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 3 +++
 sound/soc/codecs/aw88395/aw88395_reg.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 87dd0ccade4c..bc72a7487048 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -703,6 +703,7 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
 		if (ret < 0)
 			goto exit;
@@ -791,6 +792,7 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
 			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
@@ -832,6 +834,7 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
 
 	switch (aw_dev->chip_id) {
 	case AW88395_CHIP_ID:
+	case AW88399_CHIP_ID:
 		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
 			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
 			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
diff --git a/sound/soc/codecs/aw88395/aw88395_reg.h b/sound/soc/codecs/aw88395/aw88395_reg.h
index e7a7c02efaf3..63d2bac85715 100644
--- a/sound/soc/codecs/aw88395/aw88395_reg.h
+++ b/sound/soc/codecs/aw88395/aw88395_reg.h
@@ -95,6 +95,7 @@
 #define AW88395_TM_REG			(0x7C)
 
 enum aw88395_id {
+	AW88399_CHIP_ID = 0x2183,
 	AW88395_CHIP_ID = 0x2049,
 	AW88261_CHIP_ID = 0x2113,
 };
-- 
2.41.0

