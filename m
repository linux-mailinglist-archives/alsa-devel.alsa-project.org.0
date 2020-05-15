Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B11D5B56
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 23:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7890B1663;
	Fri, 15 May 2020 23:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7890B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589577516;
	bh=DreZqBTEViSEdER9IscJk/Pb0KT2Oei5+8Oyr1cT8d4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wato3xp74Iq1wTDeSmunscyWQHd7eRfAODjoXNyr9nlVb9qHA5+lI0VejkiumJzFt
	 7nSx+/buRFlPAFXxkclE5M+fwAF3/2zO115d7aDDQwvSMixkWdm4yQDQOAa5593z17
	 Fdh8T+AZ8bKO2uzBsEqpkCfFIjDAKSGWiJTn4MCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5BD9F8028E;
	Fri, 15 May 2020 23:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 283D6F80274; Fri, 15 May 2020 23:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E1A8F80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 23:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1A8F80101
IronPort-SDR: wZJZLfCOU4Bq6I8FW3k+VsgAx7ExKluzGt+m8w2vbz/zk4b+Wsc+1zIK4dcwWrlZuI9xlUXTUt
 UTls3V3ELKPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 14:15:47 -0700
IronPort-SDR: uaOHMjoyHnF3VaKM6oo4RH/4hYqq6jJSz7BpSVZMLWIajak11RIjlFsahhuDk4umvgHYlxcSzb
 wom0B/bATHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="438454478"
Received: from btchambe-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.66.225])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2020 14:15:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: codecs: rt*-sdw: don't assign slave_ops
Date: Fri, 15 May 2020 16:15:29 -0500
Message-Id: <20200515211531.11416-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
References: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>
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

The SoundWire bus core already assigns the slave ops, no need to set
them a second time manually in each driver.

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Shuming Fan <shumingf@realtek.com>
Cc: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 3 ---
 sound/soc/codecs/rt5682-sdw.c | 3 ---
 sound/soc/codecs/rt700-sdw.c  | 3 ---
 sound/soc/codecs/rt711-sdw.c  | 3 ---
 sound/soc/codecs/rt715-sdw.c  | 3 ---
 5 files changed, 15 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1502a22b0d4a..4b88fa8efb27 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -684,9 +684,6 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 {
 	struct regmap *regmap;
 
-	/* Assign ops */
-	slave->ops = &rt1308_slave_ops;
-
 	/* Regmap Initialization */
 	regmap = devm_regmap_init_sdw(slave, &rt1308_sdw_regmap);
 	if (!regmap)
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index a2d1d3ae1e31..99dd48d2a1d6 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -241,9 +241,6 @@ static int rt5682_sdw_probe(struct sdw_slave *slave,
 {
 	struct regmap *regmap;
 
-	/* Assign ops */
-	slave->ops = &rt5682_slave_ops;
-
 	/* Regmap Initialization */
 	regmap = devm_regmap_init_sdw(slave, &rt5682_sdw_regmap);
 	if (IS_ERR(regmap))
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index d4e0f953bcce..4d14048d1197 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -450,9 +450,6 @@ static int rt700_sdw_probe(struct sdw_slave *slave,
 {
 	struct regmap *sdw_regmap, *regmap;
 
-	/* Assign ops */
-	slave->ops = &rt700_slave_ops;
-
 	/* Regmap Initialization */
 	sdw_regmap = devm_regmap_init_sdw(slave, &rt700_sdw_regmap);
 	if (!sdw_regmap)
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index fc3a3fa3d51b..45b928954b58 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -450,9 +450,6 @@ static int rt711_sdw_probe(struct sdw_slave *slave,
 {
 	struct regmap *sdw_regmap, *regmap;
 
-	/* Assign ops */
-	slave->ops = &rt711_slave_ops;
-
 	/* Regmap Initialization */
 	sdw_regmap = devm_regmap_init_sdw(slave, &rt711_sdw_regmap);
 	if (!sdw_regmap)
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 64ef56ef0318..d11b23d6b240 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -525,9 +525,6 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 {
 	struct regmap *sdw_regmap, *regmap;
 
-	/* Assign ops */
-	slave->ops = &rt715_slave_ops;
-
 	/* Regmap Initialization */
 	sdw_regmap = devm_regmap_init_sdw(slave, &rt715_sdw_regmap);
 	if (!sdw_regmap)
-- 
2.20.1

