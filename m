Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995BF8A9F4C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A4723E0;
	Thu, 18 Apr 2024 17:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A4723E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455871;
	bh=Nll4vTiMI4tTo6HYM/ly+++mgvTgfUNPjO2wawAdCNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=saMWWzKWMXFx1YzrBQX2qX18QbB9os7Khc++5RVbVAV1xvJcRDH5p+irB1Hvg3GK6
	 oWx4hrPmY6FTS9C5Wr4gHxaT0w9e6v6aAev2h3CRRZy84Wnf4qCnN0I04TAVYLHIZ7
	 chKFSGeBazX5V8dJqaDBehrxS5yeDlJg6QKRLQME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C97F80718; Thu, 18 Apr 2024 17:52:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39CEDF806D1;
	Thu, 18 Apr 2024 17:52:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADB7F80236; Wed, 17 Apr 2024 10:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61106F80423
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 10:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61106F80423
Received: by air.basealt.ru (Postfix, from userid 490)
	id 66F162F20244; Wed, 17 Apr 2024 08:31:31 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 619E32F20246;
	Wed, 17 Apr 2024 08:31:18 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	zhuning0077@gmail.com,
	u.kleine-koenig@pengutronix.de,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 6.1.y 3/6] ASoC: codecs: ES8326: Change Volatile Reg function
Date: Wed, 17 Apr 2024 11:31:13 +0300
Message-Id: <20240417083116.608610-4-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20240417083116.608610-1-kovalev@altlinux.org>
References: <20240417083116.608610-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FWVHKS2MGRUS7SZJCB3NE6BSFCM5E2ZM
X-Message-ID-Hash: FWVHKS2MGRUS7SZJCB3NE6BSFCM5E2ZM
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWVHKS2MGRUS7SZJCB3NE6BSFCM5E2ZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Zhu Ning <zhuning0077@gmail.com>

Commit f1230a27c14b4d05e1d6af02be55c617b53728a4 upstream.

The new calibration and headphone detection function
require reading new volatile registers. Add them in
the volatile register function.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
Link: https://lore.kernel.org/r/20230717033223.42506-2-zhuning0077@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 sound/soc/codecs/es8326.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c60cb081b5a26f..04d7403bfe9064 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -158,20 +158,25 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"HPOR", NULL, "RHPMIX"},
 };
 
-static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HPDET_STA, ES8326_HPDET_STA),
-};
-
-static const struct regmap_access_table es8326_volatile_table = {
-	.yes_ranges = es8326_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(es8326_volatile_ranges),
-};
+static bool es8326_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES8326_HPL_OFFSET_INI:
+	case ES8326_HPR_OFFSET_INI:
+	case ES8326_HPDET_STA:
+	case ES8326_CTIA_OMTP_STA:
+	case ES8326_CSM_MUTE_STA:
+		return true;
+	default:
+		return false;
+	}
+}
 
 static const struct regmap_config es8326_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
-	.volatile_table = &es8326_volatile_table,
+	.volatile_reg = es8326_volatile_register,
 	.cache_type = REGCACHE_RBTREE,
 };
 
-- 
2.33.8

