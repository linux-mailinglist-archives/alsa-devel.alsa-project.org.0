Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9384B1C7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0511C825;
	Tue,  6 Feb 2024 11:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0511C825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213632;
	bh=vklX8QdJvVdaDTo9uEek4zgLDUE4n5/BjuBqUcTksoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q2bTn8zaCl0SFmtzukdkwnH46wUYpuY+zOXz3XeeoYxX4DMThHITvaWLezbysS9Qi
	 l+H/ZrZIYpt6Jw6/3HyAxvCE7nT/3QzDy6WTjwD0kRRWs2iPglJFQIpZgL0VqJcQUb
	 28zdrN6+Z9htSUcaWaE/BugCzFJGRpaCD4cIg+OU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43760F80675; Tue,  6 Feb 2024 10:58:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A51BFF80659;
	Tue,  6 Feb 2024 10:58:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD88F80548; Tue, 30 Jan 2024 10:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BF47F80563
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF47F80563
Received: by air.basealt.ru (Postfix, from userid 490)
	id C2EA52F2023D; Tue, 30 Jan 2024 09:47:22 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 158A22F20248;
	Tue, 30 Jan 2024 09:47:15 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com,
	sashal@kernel.org,
	zhuning0077@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	kovalev@altlinux.org
Subject: [PATCH 6.1.y 4/7] ASoC: codecs: ES8326: Change Volatile Reg function
Date: Tue, 30 Jan 2024 12:47:05 +0300
Message-Id: <20240130094708.290485-5-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20240130094708.290485-1-kovalev@altlinux.org>
References: <20240130094708.290485-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RYHGGF47AQTV2SLVJATUBLTLWTAMZV3Y
X-Message-ID-Hash: RYHGGF47AQTV2SLVJATUBLTLWTAMZV3Y
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:58:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYHGGF47AQTV2SLVJATUBLTLWTAMZV3Y/>
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
index e953c0157ba03f..7cfe535e0b6da4 100644
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

