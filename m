Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F96124F47
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3654A1676;
	Wed, 18 Dec 2019 18:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3654A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576690131;
	bh=3MM46Fe+KkwkLEhGuBc+CrE6JrBOTf/cHQKnEutB61c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TaERRqDOQPlVwpTIXdL8mof5/Ted56PsxOa39LBbyGbHvy/hGgoVZeiJsXx5eqg+H
	 zBMLLocTiGQcQL4bFHMsu27vtsnCC/LzfE9FP/T9vfVxGF2Cy3SEM80KfwvlSiwUNe
	 RfBqhp7IaZuRwcD6RUT3gP8y//WOOY/XTLz2z5DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0633DF8028F;
	Wed, 18 Dec 2019 18:24:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756D7F8026F; Wed, 18 Dec 2019 18:24:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0079F8015A
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0079F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="KiZx8uNr"
Received: by mail-wm1-x341.google.com with SMTP id p17so2825386wma.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
 b=KiZx8uNrDxyr1CKrK3b3Awr2DIit9WJR7AcPGhvWh+Ke9RMBBmd6WxOoHo+tvd/q/U
 Vd88yOfuR+PmI8SIyl1Rq1yi0jopIL3Co9YOI4tOZ1xevV68SYk/Hv+F+zMeal3Dud7u
 FQE7uWelTZ2p/qj9Egevpr/DMohozAfSke97hCvCLczo8NzvXK0u2EilAijqxpLG5xOx
 yrKwR331SHgQhKO8GJEXHNt0szTAsSQKs3f+xhkQkJ9vEbdSfnFhF0E2u5uiUq4HXoHj
 a/5wUgK4r4F+MYvViijY3zW4dVF3vo75atXvOjboq7yx41hWoqaC4peqLJC5a41rRCb/
 5XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
 b=Mi0NZIqMbI+VosWHT8MKVaIFz4+O7HImYB0WAQjaOHYECoi5UjSfUnffW6wGlmmYhI
 US/4+Flj00Z1ZIWWujG1Yqx6twfqp6jVBXHflAz5LT5SpcWENZw03qgOnbu27wSwuHZ/
 AepeG0jPdOP5iv70kwK2t+6wLVofbMLZD5YIaCu+Wf8QI0IBh/UwyquKy/Oh0JnBlAE7
 EGOyoEnETqX89l6kwYTZYT/Z7wPlnClPslcuxsEsAkSkEpZp45FqaUuRxlRRNsQp0GVg
 s/cO3ePOpTy41RTXEKDPBnhhtJKqtaZk9eQP4vjWwoDVfbj4Mhycje5Ze2jHQt/1COHX
 gPpA==
X-Gm-Message-State: APjAAAV0DT2u98LR2BIDcIjHLJ2RsOSq9UnCYxX71o5ax8nUOHMRv9oI
 w02mpzjA1KVHAPEJD9PkY6/Uyg==
X-Google-Smtp-Source: APXvYqz1xXfHwFgFh5QLFX88XE5XgeTWKeWYDflM/DWqS6617x+CfPOPUBBnnPnD6LnKcIJMUh8fWA==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr4437299wme.94.1576689872845; 
 Wed, 18 Dec 2019 09:24:32 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 18 Dec 2019 18:24:20 +0100
Message-Id: <20191218172420.1199117-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: meson: axg-fifo: relax period size
	constraints
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now that the fifo depths and thresholds are properly in the axg-fifo
driver, we can relax the constraints on period. As long as the period is a
multiple of the fifo burst size (8 bytes) things should be OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 8 ++++----
 sound/soc/meson/axg-fifo.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c2742a02d866..c12b0d5e8ebf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -34,7 +34,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 	.rate_max = 192000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
-	.period_bytes_min = AXG_FIFO_MIN_DEPTH,
+	.period_bytes_min = AXG_FIFO_BURST,
 	.period_bytes_max = UINT_MAX,
 	.periods_min = 2,
 	.periods_max = UINT_MAX,
@@ -227,17 +227,17 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/*
 	 * Make sure the buffer and period size are multiple of the FIFO
-	 * minimum depth size
+	 * burst
 	 */
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 521b54e98fd3..b63acd723c87 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -31,8 +31,6 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
-#define AXG_FIFO_MIN_CNT		64
-#define AXG_FIFO_MIN_DEPTH		(AXG_FIFO_BURST * AXG_FIFO_MIN_CNT)
 
 #define FIFO_INT_ADDR_FINISH		BIT(0)
 #define FIFO_INT_ADDR_INT		BIT(1)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
