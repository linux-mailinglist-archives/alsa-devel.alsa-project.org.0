Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C95AF187
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F75163F;
	Tue,  6 Sep 2022 19:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F75163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483917;
	bh=ozbNZbM9qXt7n/ALzyLwweBPL4qPvJLBS6nX9Sbh2ms=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGY3Kny+C1JxJk5RcrHmjKhE4rGXKs1PbyqoUqlOMZDg5fCtepjWmg46w34prhY47
	 q0cwKsRVIeYhXBMUaaHsLW05mlnG0AD3Ja0kNUKVhDlQzEDRl7xJ/SVblBpxSmV7DX
	 pnJUB5f5rkOPTydXOcCzXlPJ2t5r0NxRwjUA296Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28ED6F80564;
	Tue,  6 Sep 2022 19:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16EEDF80548; Tue,  6 Sep 2022 19:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA40F80527
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA40F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zVy9F2Np"
Received: by mail-wr1-x42b.google.com with SMTP id bj14so3138527wrb.12
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ywio/Hr5dHYfS39R3NapOq15++OC8y1mKEHZXcc063Q=;
 b=zVy9F2Np28xf/J5QZDy4W/5g1BMmP6sLdT8DeFZDLhrJWyGDZ+xPbUbuutGAQj6evg
 IVR+1tZSgfOX/bRiIqCo09o/z7Kv4/ChKRpEDDbzbTEj4eI/XgEjfs+yic0tKWHvnu+z
 JZOilqz88tNo5KfyWr4PKOCIh8de5IXrhVVm7HaJ7nPk+AuUllM6HXr2NtVfUE7iptfT
 hJUImFK4CZtpoaf1EajvydcK94fWjTWaB+s1WrYnq/FQZQ7th8evqolOrJVcIbDLcrSk
 stJ2sKdoAe1Hlt8XG0Q4jF2+WvB52Btrdoa14wk3DEIpA8Uy0IvCmdqxm5JSOTs7xE7U
 bGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ywio/Hr5dHYfS39R3NapOq15++OC8y1mKEHZXcc063Q=;
 b=n/DwC2wghk6c0MAUsKcPJ0ZO4AnoZt6R4mkqQYVORhlGePvBm9ohcHQaEE7jmMrP/M
 Nht3mJRHQpVi9ZJn3zCJ6VP/KCbUnprfUuVydwUV86VNQtSBi3sjGKktpAJFWA/MVA17
 xljhWHsZGKLQMWHqwqYcxrhIWXQQo5Czyw1Fvis54HfylEA9CupgiGtWMW7GnDZy5eG9
 tzDAL9yKD0V3SUPrA0zeuJ94DH/dspQZc9qtI6wZ4pTGbdYfD1k6kPZnBF+leo8w+lSj
 lNgIxnn66CUOpBGgV5pmOApOV6GIrb/7JHGNCnvA65Gls39JrZi7zxtHShJee+6/uukv
 lXXg==
X-Gm-Message-State: ACgBeo0pD7QaqlASccUu7MJCCeE/NpE2+c5BVaB+YZ28A9tppiDAnEMY
 ge2M7fTJ0ghVA1sOnUMt/0s5Qw==
X-Google-Smtp-Source: AA6agR4VhkzVAAHCVE5Bvqj4gmZmkmcK/9Im8zQLrjWbbD7qyRvYQ3lDqquMJFvysynL4HFltgDKHg==
X-Received: by 2002:a5d:5a9a:0:b0:226:e840:c551 with SMTP id
 bp26-20020a5d5a9a000000b00226e840c551mr18650248wrb.679.1662483733326; 
 Tue, 06 Sep 2022 10:02:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 06/12] ASoC: codecs: wsa883x: add clock stop support
Date: Tue,  6 Sep 2022 18:01:06 +0100
Message-Id: <20220906170112.1984-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

WSA883x does support clock stop, so remove code that reset
the Codec during runtime pm suspend and add flag to mark
clock stop support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 63e1d7aa6137..c7b10bbfba7e 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -415,7 +415,6 @@
 
 #define WSA883X_NUM_REGISTERS           (WSA883X_EMEM_63 + 1)
 #define WSA883X_MAX_REGISTER            (WSA883X_NUM_REGISTERS - 1)
-#define WSA883X_PROBE_TIMEOUT 1000
 
 #define WSA883X_VERSION_1_0 0
 #define WSA883X_VERSION_1_1 1
@@ -1409,6 +1408,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
 
 	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
+	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	gpiod_direction_output(wsa883x->sd_n, 1);
@@ -1440,43 +1440,17 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 static int __maybe_unused wsa883x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
-	struct wsa883x_priv *wsa883x = dev_get_drvdata(dev);
-
-	gpiod_direction_output(wsa883x->sd_n, 0);
 
 	regcache_cache_only(regmap, true);
 	regcache_mark_dirty(regmap);
 
-	regulator_disable(wsa883x->vdd);
 	return 0;
 }
 
 static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
-	struct wsa883x_priv *wsa883x = dev_get_drvdata(dev);
-	unsigned long time;
-	int ret;
-
-	ret = regulator_enable(wsa883x->vdd);
-	if (ret) {
-		dev_err(dev, "Failed to enable vdd regulator (%d)\n", ret);
-		return ret;
-	}
-
-	gpiod_direction_output(wsa883x->sd_n, 1);
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(WSA883X_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		gpiod_direction_output(wsa883x->sd_n, 0);
-		regulator_disable(wsa883x->vdd);
-		return -ETIMEDOUT;
-	}
 
-	usleep_range(20000, 20010);
 	regcache_cache_only(regmap, false);
 	regcache_sync(regmap);
 
-- 
2.21.0

