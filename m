Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C066356F83
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 16:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9617829;
	Wed,  7 Apr 2021 16:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9617829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617807555;
	bh=h2DvRotBCyZRSch6+vxYSclBTjusTA7NHv1kbW+Vek8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MahdzpRHRd6iArjbQVrxLOH4YakDcw4phoJb9r6LtOtNYa9AQ8Z8PrzpSeg9rL65Z
	 IASELP5fCN6ZKbSvULp6LO6PnOXohNxVT2uO2EnKNwBbWm9NgJvrK4l3WquopBcx3S
	 eFIdHFFBPADbCywpIxs2L7OpWCGXluL9tqQtht10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 086EFF80168;
	Wed,  7 Apr 2021 16:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABA77F8016A; Wed,  7 Apr 2021 16:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54207F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 16:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54207F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="JAQF9H0g"
Received: by mail-ed1-x529.google.com with SMTP id x4so245390edd.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA9e9N4IOvSwJUEhUzTdNXyCf8iiGr98JuVf3SJbSws=;
 b=JAQF9H0gQEXFL9/pYT2lgmKwCmo/8UEfkLEab3w+3B+f/2dTBlLibW3g3Eepx+nKfg
 jhiSXd2zDe6fNoMhr8cXIQAJWBt056NgQLQ5WfHIL+BDAV10JNXkybazYAdZfM2hASV0
 Qltio+F9iYnQLNESFD5gMQ8WXpGpaGPNnkgf942WWDLAriwHIpFzo2p+j4WGWj2NHGk1
 8ta/ACdwML+eDZa1w6uvpqIT+EaL/F+xWZSGBYygd+j+kJzycS6hX6EaZVpdavH8dnO4
 r17E9jKOpOvZidos86qEA38r/Sijo0poC0OyUBLHBnG0Im/CmuZyvtmQLzBMPPB++k0O
 PsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA9e9N4IOvSwJUEhUzTdNXyCf8iiGr98JuVf3SJbSws=;
 b=X9zxA41o7kcCb3hk9Go1XzAc0JDSEUExYAcb0Q+WWnX5C+aeh9zwlV97kCwZWgNKcT
 dw4adhQ/+dSmFaqiQlExoSZmHRkFA8TvlPeOmY8PfWf/oObJ5t2wp5MG5mxrTuro5ayY
 AIRmPCfDOpyW6daYXn46wTxzYCt8P+ATNmJujsPuawzI1N36TplpZ6I8XOGFEZ1E2v8k
 7VvORWpX9ToJiBQLMGnnzrHb6OatIgt2B3kzfHLkCGt01rUHctV04KVcLZ9mgI7YhlKs
 G1O+W8LXScrZ2XSoGJjAvZIK48x6Qr9tJyx5JKM4v1AaixNzuL17/byCsPOVW2r9OeWu
 qeqw==
X-Gm-Message-State: AOAM531CyFLd0S+HHulWq2IEX8c74y5Xk9wpimSWEdd51jg+z5uqk1+x
 sJ3fXv+1S3k4Or8zrrwSZ+ZnwQ==
X-Google-Smtp-Source: ABdhPJxrD/E7UI8yZ+sfbW3oM0l+FNRA5WDYTfCEADpbzEgpOMkZgtqqaQVPNqZsN4PMZL+SMysa6Q==
X-Received: by 2002:aa7:d88b:: with SMTP id u11mr4983769edq.254.1617807460510; 
 Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id yh6sm3732875ejb.37.2021.04.07.07.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-frddr: set fifo depth according to the period
Date: Wed,  7 Apr 2021 16:57:14 +0200
Message-Id: <20210407145714.311138-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

When the period is small, using all the FRDDR fifo depth increases the
latency of the playback because the following device won't start pulling
data until the fifo reaches the depth set. We can adjust this depth so trim
it down for small periods.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index c3ae8ac30745..8ed114de0bdf 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -46,11 +47,28 @@ static int g12a_frddr_dai_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int axg_frddr_dai_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+	unsigned int period, depth, val;
+
+	period = params_period_bytes(params);
+
+	/* Trim the FIFO depth if the period is small to improve latency */
+	depth = min(period, fifo->depth);
+	val = (depth / AXG_FIFO_BURST) - 1;
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
+			   CTRL1_FRDDR_DEPTH(val));
+
+	return 0;
+}
+
 static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int val;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -61,11 +79,6 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_FRDDR_PP_MODE, 0);
 
-	/* Use all fifo depth */
-	val = (fifo->depth / AXG_FIFO_BURST) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(val));
-
 	return 0;
 }
 
@@ -84,6 +97,7 @@ static int axg_frddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
 }
 
 static const struct snd_soc_dai_ops axg_frddr_ops = {
+	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
 };
-- 
2.30.2

