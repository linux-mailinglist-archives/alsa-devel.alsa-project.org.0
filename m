Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF035ED97
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 08:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D28A16CD;
	Wed, 14 Apr 2021 08:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D28A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618383022;
	bh=4tD8Z2C1vXCo+vLuwlPOMdGDepRcu9Ittwjb2Vo1iZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPlVFgyr/QJSU179YmZk9e/LQRWYC6gUwwDnXORgL26ffLmHHLwbHG9px5QucB5Au
	 YBr8fpNNPBw2rVjvW2DuSOTR55OgR146AvdE4Osbv0w1U/nAyQYWWVUvB5MsSQRlt+
	 lyX0i87BPUOWSG5ZjOcVz/4oHYmA0pSSjJbZ4dmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C55AAF80271;
	Wed, 14 Apr 2021 08:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8335F80271; Wed, 14 Apr 2021 08:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B3EAF8025B
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3EAF8025B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E9FB2028ED;
 Wed, 14 Apr 2021 08:48:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5751E2028EF;
 Wed, 14 Apr 2021 08:48:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AE7D5402F0;
 Wed, 14 Apr 2021 08:48:33 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 -next 2/2] ASoC: ak5558: change function name to
 ak5558_reset
Date: Wed, 14 Apr 2021 14:33:44 +0800
Message-Id: <1618382024-31725-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618382024-31725-1-git-send-email-shengjiu.wang@nxp.com>
References: <1618382024-31725-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Change function name to ak5558_reset to match devicetree property
"reset-gpios".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- split patches to two patches

 sound/soc/codecs/ak5558.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index f24d91b728dd..34aed80db0eb 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -318,21 +318,12 @@ static struct snd_soc_dai_driver ak5552_dai = {
 	.ops = &ak5558_dai_ops,
 };
 
-static void ak5558_power_off(struct ak5558_priv *ak5558)
+static void ak5558_reset(struct ak5558_priv *ak5558, bool active)
 {
 	if (!ak5558->reset_gpiod)
 		return;
 
-	gpiod_set_value_cansleep(ak5558->reset_gpiod, 1);
-	usleep_range(1000, 2000);
-}
-
-static void ak5558_power_on(struct ak5558_priv *ak5558)
-{
-	if (!ak5558->reset_gpiod)
-		return;
-
-	gpiod_set_value_cansleep(ak5558->reset_gpiod, 0);
+	gpiod_set_value_cansleep(ak5558->reset_gpiod, active);
 	usleep_range(1000, 2000);
 }
 
@@ -340,7 +331,7 @@ static int ak5558_probe(struct snd_soc_component *component)
 {
 	struct ak5558_priv *ak5558 = snd_soc_component_get_drvdata(component);
 
-	ak5558_power_on(ak5558);
+	ak5558_reset(ak5558, false);
 	return ak5558_set_mcki(component);
 }
 
@@ -348,7 +339,7 @@ static void ak5558_remove(struct snd_soc_component *component)
 {
 	struct ak5558_priv *ak5558 = snd_soc_component_get_drvdata(component);
 
-	ak5558_power_off(ak5558);
+	ak5558_reset(ak5558, true);
 }
 
 static int __maybe_unused ak5558_runtime_suspend(struct device *dev)
@@ -356,7 +347,7 @@ static int __maybe_unused ak5558_runtime_suspend(struct device *dev)
 	struct ak5558_priv *ak5558 = dev_get_drvdata(dev);
 
 	regcache_cache_only(ak5558->regmap, true);
-	ak5558_power_off(ak5558);
+	ak5558_reset(ak5558, true);
 
 	regulator_bulk_disable(ARRAY_SIZE(ak5558->supplies),
 			       ak5558->supplies);
@@ -375,8 +366,8 @@ static int __maybe_unused ak5558_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	ak5558_power_off(ak5558);
-	ak5558_power_on(ak5558);
+	ak5558_reset(ak5558, true);
+	ak5558_reset(ak5558, false);
 
 	regcache_cache_only(ak5558->regmap, false);
 	regcache_mark_dirty(ak5558->regmap);
-- 
2.27.0

