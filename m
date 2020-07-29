Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7A2321DB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6EE81716;
	Wed, 29 Jul 2020 17:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6EE81716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037668;
	bh=nTpC6NRHJb8qA3qhuNR8lXG/+yx4OSZqYCLqfunAQH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhO4HInKslFcEAg9faQ9/aCYEypjWJlguM/v/PMQNrX3qOrum8SKj8ncBUqw9tT3M
	 r9cQKnRDKkUAX8Hf/lV566UlBOJ2mBH5FpFczjArFUbLjI9EbxkEttOmitfh06ZkYs
	 hhikE5dWB7+GeEAQgzKnRgYUyhRfoAThmlowEduA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60184F8028D;
	Wed, 29 Jul 2020 17:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 119A8F8028D; Wed, 29 Jul 2020 17:45:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8D4F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8D4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="zLTcc+Hf"
Received: by mail-wm1-x341.google.com with SMTP id x5so3147569wmi.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFwWixal6bg6/yGBUeckQ8zNlylY1ZjbXYs/S0fdtuA=;
 b=zLTcc+HfVBRchrfIBW1jERIX0biVz9CZS/q5ReBKow+W3caoKQqKObHjtFUrUxj8c2
 xwYDvY0erPB/k5HObfYjFrjWXFf3xIgp4skpvwEhKdnWD4pvRG7mDcnMK7xXY/RLg0Q5
 K3K/UK7XjR0RwzpWZzGemhvur36OTxJZSTaGEacmgrpybzO0SQ/H6ly4coZCWfDqL1sZ
 iHGvPEtY37h0owml1JyQD2FxV5jkGh0MmFPmTNXfE4WbzYS1dLMIXDwJKQCTg/f+TeuA
 y4Za0NejtucqFd8pW6sexE2gwHte8Ksk4JOt6dmVBKrfIrlntfUV9npxZnOlQHsExRRY
 xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFwWixal6bg6/yGBUeckQ8zNlylY1ZjbXYs/S0fdtuA=;
 b=JrdU4s5Y3VZS/5lDOlE1InuJvLyQFdYhV4GaMCcPYZJsHTszcKKpEFGe2c7SKmAP2q
 2eXxooNHAdMYRUzhU/l4jmRrrHYm/AhLsiHXwEZRBKjsImKqBM2ll3VlfKxPF0T41QLk
 OxdwNN+02lREK7N6CbtLEb2TgYExoNH2Bj3w0VgEM3Xc9RYXKODi3w2K2HCzcYj9g86f
 YwSLfty3zk410T/cMnZ1P09+N3z9BqZQmwpfV2p0IMMI3A790KAIov9O8nbL+BKNdX32
 ZUKP1729c6iZCZ8xn7WSGY7FuiyW1X3tbDr9TUTx4xBtTRlNFyfRcFzqyuMw7jPTybWI
 37vg==
X-Gm-Message-State: AOAM531PjcFZC6JWnQAl4zWReLIIgREhZXX/OtRRKPgObJLFb3Hx2JrW
 n3THOltJj+C3NMCQg19L6qS5yA==
X-Google-Smtp-Source: ABdhPJy0qqcwBITavP16MW6ffF+xI8XGXN/tI7XsE9Z0703/iHSoM2qsfi/fgn4gRUXAFwua0XmGDg==
X-Received: by 2002:a1c:9914:: with SMTP id b20mr9098844wme.15.1596037514079; 
 Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/4] ASoC: meson: axg-tdm-interface: fix link fmt setup
Date: Wed, 29 Jul 2020 17:44:53 +0200
Message-Id: <20200729154456.1983396-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
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

The .set_fmt() callback of the axg tdm interface incorrectly
test the content of SND_SOC_DAIFMT_MASTER_MASK as if it was a
bitfield, which it is not.

Implement the test correctly.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 6de27238e9df..36df30915378 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -119,18 +119,25 @@ static int axg_tdm_iface_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
 
-	/* These modes are not supported */
-	if (fmt & (SND_SOC_DAIFMT_CBS_CFM | SND_SOC_DAIFMT_CBM_CFS)) {
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		if (!iface->mclk) {
+			dev_err(dai->dev, "cpu clock master: mclk missing\n");
+			return -ENODEV;
+		}
+		break;
+
+	case SND_SOC_DAIFMT_CBM_CFM:
+		break;
+
+	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBM_CFS:
 		dev_err(dai->dev, "only CBS_CFS and CBM_CFM are supported\n");
+		/* Fall-through */
+	default:
 		return -EINVAL;
 	}
 
-	/* If the TDM interface is the clock master, it requires mclk */
-	if (!iface->mclk && (fmt & SND_SOC_DAIFMT_CBS_CFS)) {
-		dev_err(dai->dev, "cpu clock master: mclk missing\n");
-		return -ENODEV;
-	}
-
 	iface->fmt = fmt;
 	return 0;
 }
@@ -319,7 +326,8 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	if (iface->fmt & SND_SOC_DAIFMT_CBS_CFS) {
+	if ((iface->fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
+	    SND_SOC_DAIFMT_CBS_CFS) {
 		ret = axg_tdm_iface_set_sclk(dai, params);
 		if (ret)
 			return ret;
-- 
2.25.4

