Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71F7C837B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 12:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC582AEA;
	Fri, 13 Oct 2023 12:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC582AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697193880;
	bh=AadVbdgEqetirnkAQdZPjGEfviv/sdjsC8sy3yHnPt8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M1BXobJgHrywbl1Nma+oVErJYYnN8LiMYpQ/bbBpGWJxQZuoS++irs9fV+yc53p0j
	 b0VgIdOv0OznTLsIyUjjf3KV/+b3wXRzTf72k4haPXW8G7bYRIOo3EX1+2RthhbnVc
	 S5eNGEhgr5LqPkZAAqKozp+jExtEEoyTMXjaVv+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1EDDF80578; Fri, 13 Oct 2023 12:42:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69411F80578;
	Fri, 13 Oct 2023 12:42:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F383F80578; Fri, 13 Oct 2023 12:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com
 [115.124.28.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DED0F80557
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 12:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DED0F80557
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.08533934|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00817213-0.000206141-0.991622;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.V-L31GU_1697193757;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V-L31GU_1697193757)
          by smtp.aliyun-inc.com;
          Fri, 13 Oct 2023 18:42:44 +0800
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
	fido_max@inbox.ru,
	sebastian.reichel@collabora.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	trix@redhat.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1 2/3] ASoC: codecs: Add code for bin parsing compatible with
 aw88399
Date: Fri, 13 Oct 2023 18:42:19 +0800
Message-ID: <20231013104220.279953-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013104220.279953-1-wangweidong.a@awinic.com>
References: <20231013104220.279953-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GXGAAZ44XM4PRREO2AETYZAMWRLSSXZF
X-Message-ID-Hash: GXGAAZ44XM4PRREO2AETYZAMWRLSSXZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXGAAZ44XM4PRREO2AETYZAMWRLSSXZF/>
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
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 3 +++
 sound/soc/codecs/aw88395/aw88395_reg.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 87dd0ccade4c..692ad9fa65a6 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -702,6 +702,7 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 	}
 
 	switch (aw_dev->chip_id) {
+	case AW88399_CHIP_ID:
 	case AW88395_CHIP_ID:
 		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
 		if (ret < 0)
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

