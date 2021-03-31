Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07832350544
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 19:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9968D1675;
	Wed, 31 Mar 2021 19:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9968D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617210855;
	bh=3aIyX4V80Z+7ecSTJJqKvBGSzIDiDVQ5hcBHxMmEU5M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zska2uvhEX3QZ2bfi8tJRBwRnwDT07w4CaV9+hgZ16OE31H451+blNqgLenHpKsD7
	 k4GhN9OP0/QFJ7bncV8so5iHZFkAkeF9c1Xie9FbRX+W7w9hrWMHxQRdDR8z8sEJ4a
	 QPXaNQQ+MasHlY6KmjQEL2Di+MTwGmX34AReLmz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 109D4F801DB;
	Wed, 31 Mar 2021 19:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9945F8016E; Wed, 31 Mar 2021 19:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EED0F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 19:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EED0F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R5iOnGAF"
Received: by mail-ej1-x62b.google.com with SMTP id r12so31179872ejr.5
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgKO/uJM9usGKkAZQ7112LlmNK3ckgd64ltcjRPeQnY=;
 b=R5iOnGAF3Hhu7q7PWajbjt6p2aPktRJxfzeZR8mN8sUN3IX+i4ISSH83wUhxOgWItT
 tRSW6IaY9BkXqKzS1d9zNgKhBfeP/U2GCAPdvCVy0fSyfZIhTuIEoDzhyvYzSyEu4UyA
 RJzjRPwfS2sX2PDEbqRdPxPGVgzV/5teKBHPquv+xXSjgAOGNAyVUOcYmMWWAbeS8S+r
 p7tdVmjRS8StMfJ5+bsMHAUXTRGt731TkhfnyqCDnwYxH5na7V94tvbNb2A0hS3/eyqT
 z7GhCK+LfuZA/zwkcNyt6RBivMQgdyqYinsOnPi/Nm0kWDhrCV2nSWvEvRU4NrrLuZ0W
 OIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgKO/uJM9usGKkAZQ7112LlmNK3ckgd64ltcjRPeQnY=;
 b=MIjvpYvLf/nLOMx7Hk5p7XEQHnYC2MtrtuDSWNhBTVCQnotpNNiaRX4cSHAzDMHCpd
 6gJVXvtLyMme90KH7Gv14pcTCaDaBOLJN3mRul9nGLHucKDw0GsE+N3na0kpdA71bNnY
 yVpbuXlY0JWjUFVI9K3/1dhNPaRU5iih9mbz/DkGKbt9QDCBl6b9D+GPNTWYgYj6Ffmn
 kKUby8LXwMvrJOqlzHHwE2bYB9p+CiAcaCDPQxLusnX0OF53ZrGraPbQX2saq/DjiJ4A
 Hcdl+qc7WP4+0ChIUOq32iAXYkC6ILlSJeH54DFc/aBTouhaLna5A1KWsEuoRClw1P25
 6gSw==
X-Gm-Message-State: AOAM533RWE5juBzdrF2fsokGhJH/vRWzgqJLWwXxyEgDjEavbpeKkwHA
 wY5DxC6hKk/IvvC7FTWytbJuVQ==
X-Google-Smtp-Source: ABdhPJx56htzifkuQ1Xzf58GGKV86MVxp0YeQrwdPt9wgfAwheAnRrJGJPLp4C2XW1y6mrtBpV2aXA==
X-Received: by 2002:a17:906:6d8e:: with SMTP id
 h14mr4666240ejt.410.1617210760507; 
 Wed, 31 Mar 2021 10:12:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h24sm1554131ejl.9.2021.03.31.10.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 10:12:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: set npl clock rate correctly
Date: Wed, 31 Mar 2021 18:12:34 +0100
Message-Id: <20210331171235.24824-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
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

NPL clock rate is twice the MCLK rate, so set this correctly to
avoid soundwire timeouts.

Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 36d7a6442cdb..e8c6c738bbaa 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1811,7 +1811,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(tx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(tx->clks[3].clk, MCLK_FREQ);
+	clk_set_rate(tx->clks[3].clk, 2 * MCLK_FREQ);
 
 	ret = clk_bulk_prepare_enable(TX_NUM_CLKS_MAX, tx->clks);
 	if (ret)
-- 
2.21.0

