Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58B81C21D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 00:50:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE4ADF1;
	Fri, 22 Dec 2023 00:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE4ADF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703202616;
	bh=Xmhl7fZDAtfZFN9HnlGPEe86WFVurI0OpjLCnSeexuM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hQQondlt2UEd0S4uBCZwTfJ3iZ/zj+gsMccDYieVtQVv8eHr0f9DNGiOECQZX0q6a
	 Wkyj9cqJE62kW01Wk7pEP4iDrhYVy6VAHAaB2FwdDN3QVKeTdPzLHJa9dyna1cNqc5
	 1M2F4BiguX3v2wcwBzNFd+k2ygxQygsvxtFWT+V8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AE5DF8057E; Fri, 22 Dec 2023 00:49:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C03E1F80578;
	Fri, 22 Dec 2023 00:49:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 346E0F8016E; Fri, 22 Dec 2023 00:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 83FEEF800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 00:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FEEF800F5
Received: from fedori.lan (51b681e3.dsl.pool.telekom.hu
 [::ffff:81.182.129.227])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000710DA.000000006584CEFF.0013B0FB;
 Fri, 22 Dec 2023 00:49:19 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: do not use regcache
Date: Fri, 22 Dec 2023 00:48:56 +0100
Message-ID: 
 <491aeed0e2eecc3b704ec856f815db21bad3ba0e.1703202126.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: FEHAJ5RKHVNAIYRSOC2AOH5J6WJOYZE3
X-Message-ID-Hash: FEHAJ5RKHVNAIYRSOC2AOH5J6WJOYZE3
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEHAJ5RKHVNAIYRSOC2AOH5J6WJOYZE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two problems with using regcache in this module.

The amplifier has 3 addressing levels (BOOK, PAGE, REG). The firmware
contains blocks that must be written to BOOK 0x8C. The regcache doesn't
know anything about BOOK, so regcache_sync writes invalid values to the
actual BOOK.

The module handles 2 or more separate amplifiers. The amplifiers have
different register values, and the module uses only one regmap/regcache
for all the amplifiers. The regcache_sync only writes the last amplifier
used.

The module successfully restores all the written register values (RC
profile, program, configuration, calibration) without regcache.

Remove regcache functions and set regmap cache_type to REGCACHE_NONE.

Link: https://lore.kernel.org/r/21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu/

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c   | 17 +----------------
 sound/soc/codecs/tas2781-comlib.c |  2 +-
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 2fb1a7037c82..e4c54b2a012c 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -717,8 +717,6 @@ static int tas2781_runtime_suspend(struct device *dev)
 		tas_priv->tasdevice[i].cur_conf = -1;
 	}
 
-	regcache_cache_only(tas_priv->regmap, true);
-	regcache_mark_dirty(tas_priv->regmap);
 
 	mutex_unlock(&tas_priv->codec_lock);
 
@@ -730,20 +728,11 @@ static int tas2781_runtime_resume(struct device *dev)
 	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
 	unsigned long calib_data_sz =
 		tas_priv->ndev * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
-	int ret;
 
 	dev_dbg(tas_priv->dev, "Runtime Resume\n");
 
 	mutex_lock(&tas_priv->codec_lock);
 
-	regcache_cache_only(tas_priv->regmap, false);
-	ret = regcache_sync(tas_priv->regmap);
-	if (ret) {
-		dev_err(tas_priv->dev,
-			"Failed to restore register cache: %d\n", ret);
-		goto out;
-	}
-
 	tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
 
 	/* If calibrated data occurs error, dsp will still works with default
@@ -752,10 +741,9 @@ static int tas2781_runtime_resume(struct device *dev)
 	if (tas_priv->cali_data.total_sz > calib_data_sz)
 		tas2781_apply_calib(tas_priv);
 
-out:
 	mutex_unlock(&tas_priv->codec_lock);
 
-	return ret;
+	return 0;
 }
 
 static int tas2781_system_suspend(struct device *dev)
@@ -770,10 +758,7 @@ static int tas2781_system_suspend(struct device *dev)
 		return ret;
 
 	/* Shutdown chip before system suspend */
-	regcache_cache_only(tas_priv->regmap, false);
 	tasdevice_tuning_switch(tas_priv, 1);
-	regcache_cache_only(tas_priv->regmap, true);
-	regcache_mark_dirty(tas_priv->regmap);
 
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index ffb26e4a7e2f..933cd008e9f5 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -39,7 +39,7 @@ static const struct regmap_range_cfg tasdevice_ranges[] = {
 static const struct regmap_config tasdevice_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_NONE,
 	.ranges = tasdevice_ranges,
 	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
 	.max_register = 256 * 128,

base-commit: 916d051730ae48aef8b588fd096fefca4bc0590a
-- 
2.43.0

