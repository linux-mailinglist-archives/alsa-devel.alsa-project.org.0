Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308679C77A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 09:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F584A4D;
	Tue, 12 Sep 2023 09:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F584A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694502127;
	bh=OD78VUBKgWSquaferxuqFXBwZZeNqZV4E42g3kQjcyk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U++MpONmPR7JQF47t9RMh3KxCrGu9oVLg7QcrrFX5wqwAdTaxWolP0dD1dCHCEYEo
	 0lmfGq3sKDBo0QOHlvPUbgXEVRtMNtFKGvAFmx9V0CB6lwNPbwCxetFdnc+K6ATKnQ
	 ClsB1H4+KNBcPW9RascCk8C696tXzLlng1lVOv/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A660F805A8; Tue, 12 Sep 2023 08:59:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A86F8059F;
	Tue, 12 Sep 2023 08:59:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 675DFF80587; Tue, 12 Sep 2023 08:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com
 [115.124.28.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1C8CF8057E
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 08:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C8CF8057E
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06719171|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00178282-0.000151054-0.998066;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Ud9dp3R_1694501971;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ud9dp3R_1694501971)
          by smtp.aliyun-inc.com;
          Tue, 12 Sep 2023 14:59:38 +0800
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
Subject: [PATCH V2 4/5] ASoC: codecs: Change the aw88261 variable name and i2c
 driver name
Date: Tue, 12 Sep 2023 14:58:51 +0800
Message-ID: <20230912065852.347000-5-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912065852.347000-1-wangweidong.a@awinic.com>
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BU43JOOLPTR4ZZFZKYUUPIROFMYA56JB
X-Message-ID-Hash: BU43JOOLPTR4ZZFZKYUUPIROFMYA56JB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU43JOOLPTR4ZZFZKYUUPIROFMYA56JB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Change "sound-channel" to "awinic,audio-channel"
Change "aw88261_smartpa" to "aw88261"

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88261.c | 23 ++++++++++++-----------
 sound/soc/codecs/aw88261.h |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a697b5006b45..d01c3ea1bb7d 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -477,7 +477,7 @@ static int aw88261_dev_reg_update(struct aw88261 *aw88261,
 	return ret;
 }
 
-static char *aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index)
+static int aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_name)
 {
 	struct aw_prof_info *prof_info = &aw_dev->prof_info;
 	struct aw_prof_desc *prof_desc;
@@ -485,12 +485,14 @@ static char *aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index)
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
 
 static int aw88261_dev_get_prof_data(struct aw_device *aw_dev, int index,
@@ -515,8 +517,8 @@ static int aw88261_dev_fw_update(struct aw88261 *aw88261)
 	char *prof_name;
 	int ret;
 
-	prof_name = aw88261_dev_get_prof_name(aw_dev, aw_dev->prof_index);
-	if (!prof_name) {
+	ret = aw88261_dev_get_prof_name(aw_dev, aw_dev->prof_index, &prof_name);
+	if (ret) {
 		dev_err(aw_dev->dev, "get prof name failed");
 		return -EINVAL;
 	}
@@ -818,9 +820,8 @@ static int aw88261_profile_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
-	const char *prof_name;
-	char *name;
-	int count;
+	char *prof_name, *name;
+	int count, ret;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
 	uinfo->count = 1;
@@ -839,8 +840,8 @@ static int aw88261_profile_info(struct snd_kcontrol *kcontrol,
 	name = uinfo->value.enumerated.name;
 	count = uinfo->value.enumerated.item;
 
-	prof_name = aw88261_dev_get_prof_name(aw88261->aw_pa, count);
-	if (!prof_name) {
+	ret = aw88261_dev_get_prof_name(aw88261->aw_pa, count, &prof_name);
+	if (ret) {
 		strscpy(uinfo->value.enumerated.name, "null",
 						strlen("null") + 1);
 		return 0;
@@ -1189,7 +1190,7 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	u32 channel_value = AW88261_DEV_DEFAULT_CH;
 	u32 sync_enable = false;
 
-	of_property_read_u32(np, "sound-channel", &channel_value);
+	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
 	of_property_read_u32(np, "sync-flag", &sync_enable);
 
 	aw_dev->channel = channel_value;
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 4f3dbf438510..bd0841fa9b77 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -370,7 +370,7 @@
 #define AW88261_START_RETRIES		(5)
 #define AW88261_START_WORK_DELAY_MS	(0)
 
-#define AW88261_I2C_NAME		"aw88261_smartpa"
+#define AW88261_I2C_NAME		"aw88261"
 
 #define AW88261_RATES (SNDRV_PCM_RATE_8000_48000 | \
 			SNDRV_PCM_RATE_96000)
-- 
2.41.0

