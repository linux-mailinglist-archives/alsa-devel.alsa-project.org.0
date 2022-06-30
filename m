Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185E561ADF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 15:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AD116C1;
	Thu, 30 Jun 2022 15:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AD116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656594127;
	bh=ZG1ZNk494R1CUFcBKFQPHfnynDjXT13GbebSbFdb2WE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FK28rJ79mgvSA2Gl5SFAOPDZQW/6m5r+bg47+20aInULT0NsDVfhj3d82yELdQJOO
	 JRS68iPzQi/GXI++dUw85Gm1vhBIg+Ehai8XtoogqrMKftCL5N5tTAzErXCxQanqSB
	 YrefeF3mi0x8neueo1Qst4FIedRZgJvdbZe1WOdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58265F8052D;
	Thu, 30 Jun 2022 15:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2453FF804D8; Thu, 30 Jun 2022 15:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D52F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 15:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D52F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pd5SdccG"
Received: by mail-wr1-x430.google.com with SMTP id cl1so3474864wrb.4
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzABi/fIb1/5+rkmhKsgJLpztE30/Fc5MNL46LXzMCc=;
 b=pd5SdccGVl8fDIHgsEq50W5KKB+B/zDoKkQ2eQ3o7PderfSIAUhs85dKlWE6ZnFsQq
 brEjiFes/oABy40kFwb6MHkYsUEtZnadZKYDg/XBOKOLgrDyERsV0YKD9yHJ+9DHj0D9
 azzEfOiXYljcqCLAv9Pux2dt+9T9aVvPUff4z4WxNmy4nWFORochi7eWOZAn5fY1Yl9H
 XyPaP1hOK++tUU5RvL7zxlUeyzglAihehbJvmjku2RQIT/rEE3ZNzQVCogABOoQFsJt2
 BGMbMwdDfGB3D4GLT8OMhr1zrKVp9cHVsn1qMV7SINf0uRZFfd1HVFEsm3H3GOUqiZVW
 mlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzABi/fIb1/5+rkmhKsgJLpztE30/Fc5MNL46LXzMCc=;
 b=jzivNSvXfkBguGvd7mq4IWEGCVDREEZCpPZt3CFu6tHsqHWocBkiAntOgFapGOFRDm
 h7bnB0O1j/D9Suz3Eenw/h8rFWoLcMm1u8q6G7agC3cic87KiLcmnduO2vMBQlNrqH80
 sNMd+Vwp1zvS3N6wSYKA8T5AlHu6lvV0dzivz5DfHwh3vRQur6F1rTYJDNInOrUy953E
 XJ5q3Mn+1zAOh17j5bnUnd1hxq4sxZCgCGF30qyqy3R+fdbzqL9TXFK/n5BLxlRivFbg
 IlelO6jGsEBEGh9duMLXGazXgvjC1+YYBaE4PQLPsRnFP9+cBJ6KnOxF8ITeRGKb4oAO
 G8qg==
X-Gm-Message-State: AJIora8tvRqb0cPYj14x0hCfOt5gna4ABReh1eBLXeJKn1IQL3RmPqbM
 AqkLo8+EzSjs1InwXrjqyv0Z/aO30D5mca4y
X-Google-Smtp-Source: AGRyM1vENCHbsQi0PnAYac3E99zxWkQjJFZN5frPbYEF/+WF6yo+5/ej3mMLC1VDx4o9B+4Wt+NCuw==
X-Received: by 2002:a5d:5967:0:b0:21b:903f:e095 with SMTP id
 e39-20020a5d5967000000b0021b903fe095mr8133140wri.162.1656594028050; 
 Thu, 30 Jun 2022 06:00:28 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b0020d02262664sm19273608wri.25.2022.06.30.06.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 06:00:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: codecs: wsa883x: handle timeouts in resume path
Date: Thu, 30 Jun 2022 14:00:23 +0100
Message-Id: <20220630130023.9308-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630130023.9308-1-srinivas.kandagatla@linaro.org>
References: <20220630130023.9308-1-srinivas.kandagatla@linaro.org>
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
Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index e8f519e89213..40c7d64a9c41 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1455,6 +1455,7 @@ static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(dev);
+	unsigned long time;
 	int ret;
 
 	ret = regulator_enable(wsa883x->vdd);
@@ -1465,8 +1466,14 @@ static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
 
 	gpiod_direction_output(wsa883x->sd_n, 1);
 
-	wait_for_completion_timeout(&slave->initialization_complete,
-				    msecs_to_jiffies(WSA883X_PROBE_TIMEOUT));
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(WSA883X_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(dev, "Initialization not complete, timed out\n");
+		gpiod_direction_output(wsa883x->sd_n, 0);
+		regulator_disable(wsa883x->vdd);
+		return -ETIMEDOUT;
+	}
 
 	usleep_range(20000, 20010);
 	regcache_cache_only(regmap, false);
-- 
2.25.1

