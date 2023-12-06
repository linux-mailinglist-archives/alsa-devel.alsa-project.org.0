Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C3807CA7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0D8A4C;
	Thu,  7 Dec 2023 01:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0D8A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907270;
	bh=1zCZNDIPEY5ITHgZNBshDJrB115+NHjQt5YxMF/o4S4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IudC0UsNf8pjgimYQdrmdEwN80ab2Ue7litwlm3VPVcv8MjgDCxta4vt35+H3caTX
	 qNqK3aO47ztDhPGbry1vxKXwhXwqTl4y+Hj+s18N0CtzOxyd0c/0F165Pska7C8+C5
	 mPG/QxPEMnuChHCf63pRuP8D/qVNw7r65BagRuYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28674F805C9; Thu,  7 Dec 2023 01:00:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A765F805B4;
	Thu,  7 Dec 2023 01:00:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E03FF8055A; Thu,  7 Dec 2023 01:00:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id BF403F8024E
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF403F8024E
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716E7.0000000065710B03.00119029;
 Thu, 07 Dec 2023 01:00:03 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
Date: Thu,  7 Dec 2023 00:59:44 +0100
Message-ID: 
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: F7AKS2PXJKEKSZU6HLJZ2VHSLIAQVWD7
X-Message-ID-Hash: F7AKS2PXJKEKSZU6HLJZ2VHSLIAQVWD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7AKS2PXJKEKSZU6HLJZ2VHSLIAQVWD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The amp has 3 level addressing (BOOK, PAGE, REG).
The regcache couldn't handle it.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c   | 17 +----------------
 sound/soc/codecs/tas2781-comlib.c |  2 +-
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 077a01521eef..d272d3d08b29 100644
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
-- 
2.43.0

