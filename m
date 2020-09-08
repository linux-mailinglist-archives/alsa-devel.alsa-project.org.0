Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EAF260DB3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 10:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1D01768;
	Tue,  8 Sep 2020 10:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1D01768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599554250;
	bh=lU1JYhFjtS9w80IITJi3DKI5Ng4lNFjHQndMQlFhDEE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a02ulWtYRcHvloLioOzxRDFmzGD3nUaGkTTG5XkuQBkAkSVqbIKo+PnMtaMzmFOv/
	 FOwniuOQchEJYjJcVSIoGabdJJ1/b5/jzBr4R7v1LmnL2u23bPFNk54WsuKbo0mTkX
	 o8eCMtD6XgmoWZwQ+X64Ftc/g35VylG/KL4gl2Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC2DF800FD;
	Tue,  8 Sep 2020 10:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B71FCF80264; Tue,  8 Sep 2020 10:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 607BFF8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 10:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607BFF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="gtebpoEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1856; q=dns/txt; s=axis-central1;
 t=1599554141; x=1631090141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xp2jtEwWlIVWqx9i65+JtXtOEPvP+lssrgvRxVi0wCI=;
 b=gtebpoEtsfn4axqr8EQRKbAwawjMX3QPVVJpQ+Ub9hU5DVV+k0GuFNGW
 bNQA+Aq5B8X+pQZru82h5a//8XorOxtANDiT90vf1w3H/sCYGO1muEZX5
 EHib6eXp3nFFa0XhamWqCW3YTLei2M0hV5BAdJFbAUiguZLfh7XmOskG1
 aXvj2gMMCSGTVa8eNaU2FdRmvC+4+8/FChhKB77fw6B7w2tTf38HYvglu
 8FfeCwBPuVpnrRTRn7p0rd+ZTwK8y3qEuzsgpirODiemV+fCtctzp8iN7
 vF3A7beM++lbcPSsl2Qu/KivZDlFKVeWtneTjOwR7aH7OZzddec5G315h A==;
IronPort-SDR: SUM5QoENwhtyx2B6qE8P7GTzyoyjJY/j3tg8kW/LjcD9A9JjlDi8579OLER5ex99nYk/jFJQiZ
 71ngP+kiNNrKNgMVcvLmi2Q9teAg86SsJtZk7szJhtFQ6y7GuXbizqNStR5BLurjxR2VZLy1cN
 JOkQZma0/nTQuUC1vdIECEpZNKsXpLViSrZJcQ4XoyvCe6bAyHSvvFKe9Oa8I+DskxYlRFeE3k
 jDm19QdWRfM4un6np6SmHs0zXO7qHJaK/KwtAQzaCbnIH6pv8zotoXnBVsl+F4rgAJ36UMTkHq
 nr4=
X-IronPort-AV: E=Sophos;i="5.76,405,1592863200"; d="scan'208";a="12651992"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH 2/2] ASoC: tlv320adcx140: Wake up codec before accessing
 register
Date: Tue, 8 Sep 2020 10:35:21 +0200
Message-ID: <20200908083521.14105-2-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200908083521.14105-1-camel.guo@axis.com>
References: <20200908083521.14105-1-camel.guo@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

According to its datasheet, after reset this codec goes into sleep
mode. In this mode, any register accessing should be avoided except for
exiting sleep mode. Hence this commit moves SLEEP_CFG access before any
register accessing.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 597dd1062943..6d456aa269ad 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -842,6 +842,18 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		goto out;
 
+	if (adcx140->supply_areg == NULL)
+		sleep_cfg_val |= ADCX140_AREG_INTERNAL;
+
+	ret = regmap_write(adcx140->regmap, ADCX140_SLEEP_CFG, sleep_cfg_val);
+	if (ret) {
+		dev_err(adcx140->dev, "setting sleep config failed %d\n", ret);
+		goto out;
+	}
+
+	/* 8.4.3: Wait >= 1ms after entering active mode. */
+	usleep_range(1000, 100000);
+
 	pdm_count = device_property_count_u32(adcx140->dev,
 					      "ti,pdm-edge-select");
 	if (pdm_count <= ADCX140_NUM_PDM_EDGES && pdm_count > 0) {
@@ -889,18 +901,6 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		goto out;
 
-	if (adcx140->supply_areg == NULL)
-		sleep_cfg_val |= ADCX140_AREG_INTERNAL;
-
-	ret = regmap_write(adcx140->regmap, ADCX140_SLEEP_CFG, sleep_cfg_val);
-	if (ret) {
-		dev_err(adcx140->dev, "setting sleep config failed %d\n", ret);
-		goto out;
-	}
-
-	/* 8.4.3: Wait >= 1ms after entering active mode. */
-	usleep_range(1000, 100000);
-
 	ret = regmap_update_bits(adcx140->regmap, ADCX140_BIAS_CFG,
 				ADCX140_MIC_BIAS_VAL_MSK |
 				ADCX140_MIC_BIAS_VREF_MSK, bias_cfg);
-- 
2.20.1

