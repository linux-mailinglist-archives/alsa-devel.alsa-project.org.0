Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 930E2561ADD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 15:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6511695;
	Thu, 30 Jun 2022 15:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6511695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656594096;
	bh=M7FK/98M1MjZHDrciJgIdj/7vtKx2z9WNYWbwzUrqMw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gj6nbUwOWmjeNq/rEQG2dD9/e+5LlM/RgWVIsWXtxP8ByX3ay6E2CjqqKfYK1+YQ8
	 DFSzyxcSdNLgsFKoYYUXRkK6MeMS3tuUOzhKTS8Tly6dhlzqYZmHowsboPrmhK3nTn
	 2W5wcCbXTf2FL07TeC9SokTetVtfOtPEaTUPdxmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B78F804DA;
	Thu, 30 Jun 2022 15:00:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF8B7F804DA; Thu, 30 Jun 2022 15:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB79F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 15:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB79F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="it46n3LR"
Received: by mail-wm1-x32b.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so1674538wmq.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nh7MOeHqpu+KJjz+AQfMOAMAr6taCyP+a8n4nKC3Ilk=;
 b=it46n3LRqtbFUNmtsO5pMTfu8XVzRaw4AkZn64FfFqiNM1TD6/fI7WCexAZ0kter1B
 8V8OaDXmnLHFEVjmxaS1FdoZ/0Pf84G9bzIqI4QqQjedMkhnBmQBdU+PwdgSJrtv6ILa
 YojZAZPCS0q0Vzyef/v9d8v/StEujzRRvmdoxuC2JuWaNkyDRB8bjFaK+5U8690VKtQr
 A+dV+PdyNl/h0Za7ayvfNFEkp5xg/LIVabnTWn9hG40wAoh2NyJdEByXSjWVz2jTA68x
 5s7wTsAYHACQpXHMeszYGlsMUuVIWWWm/MTFVxmXg0L7vTMs+K/LI3Fcoc+RyBlDDobT
 xHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nh7MOeHqpu+KJjz+AQfMOAMAr6taCyP+a8n4nKC3Ilk=;
 b=Hf0l90YX4GHOhukE8wjkXaU4Kyedjs/ien15+TRhDb/kYJ+beNiqftJ5I9wFXG27uh
 YpSKINSFp9z1c+bOqPYP5E5dvov03IatN17NsmPY+x+WivXbLFPqWY7QgJnOLBXRy7WB
 fRBE6kOJiLtojz0LqeZTCqxzRA62+FGAUBSzF3EQ69BfgxCvtfDqmCAYI3lDSpB3v2MC
 dCQzHly3miPfpTy0SAeDFK0gsSuA+2ClJ2xYbLlAPonz2WtLarIalxHPE7q68LR069cl
 SiftdQXGzN5FlIp0z+6DfsMPTpol/2IQAeN52XkSKFH8X2F/3qvuzYOpxGknU47/pKqL
 eEVg==
X-Gm-Message-State: AJIora+u5UL+aI3nxjCMm29Y9FU1WOhSqM3H+hiJSDtQB/asnYfyZ4Ct
 4R1+SIOI94pl9n1t8oIKpTcvHQ==
X-Google-Smtp-Source: AGRyM1vJ3ZxH45D8hUgK2tFT90WipVg22meqPE/QRLhl20LRmrNPtv60AoVVnzHUObi1UxrNlko/Gg==
X-Received: by 2002:a05:600c:27d1:b0:3a1:7e0c:56bf with SMTP id
 l17-20020a05600c27d100b003a17e0c56bfmr3784642wmb.186.1656594026688; 
 Thu, 30 Jun 2022 06:00:26 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b0020d02262664sm19273608wri.25.2022.06.30.06.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 06:00:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: wsa881x: handle timeouts in resume path
Date: Thu, 30 Jun 2022 14:00:22 +0100
Message-Id: <20220630130023.9308-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Currently we do not check if SoundWire slave initialization timeout
expired before continuing to access its registers.

Its possible that the registers are not accessible if timeout is
expired. Handle this by returning timeout in resume path.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Fixes: 8dd552458361 ("ASoC: codecs: wsa881x: add runtime pm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index dc954b85a988..6c8b1db649b8 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1173,11 +1173,17 @@ static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+	unsigned long time;
 
 	gpiod_direction_output(wsa881x->sd_n, 1);
 
-	wait_for_completion_timeout(&slave->initialization_complete,
-				    msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(dev, "Initialization not complete, timed out\n");
+		gpiod_direction_output(wsa881x->sd_n, 0);
+		return -ETIMEDOUT;
+	}
 
 	regcache_cache_only(regmap, false);
 	regcache_sync(regmap);
-- 
2.25.1

