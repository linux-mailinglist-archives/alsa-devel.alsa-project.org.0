Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423D350545
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 19:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4821687;
	Wed, 31 Mar 2021 19:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4821687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617210873;
	bh=QwCnMw8Iw3TyT4DZggePjELx/xJZCwR6egPZtUIA8xQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJVQhb8TgiiYHyE2QTox79UcNkkeWO7XkEbYvlQBD5HUjmh9UDFYaLfLOnbBwCaj5
	 0OgsCM/WFCV/9qmbpms6E8++OOZwGZIENFz0gELdtsHpzBhIcDJ416uHojglXDCRI7
	 2zVLOEHVgKpO8azY2ApKUE9WI+ye8m+Sx/Lw3WVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2AAAF8016E;
	Wed, 31 Mar 2021 19:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B966F80229; Wed, 31 Mar 2021 19:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EDCFF8015A
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 19:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDCFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yB7vEk14"
Received: by mail-ed1-x529.google.com with SMTP id z1so23199721edb.8
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZeTraQg96mWBG55tgm5XLzk3EVPKVrM7pzYHtn9HsI=;
 b=yB7vEk14tJJavgjrhDI+c+nWWE/oiegDH6ngg99vcKoJg6Z6lClBU5r+jAxenMxH1N
 3gkvVNk2DeIw+kc/kjXtkgVxF3Sm+nD7O5+7isCNwatg3Mj++3Je/R2cDYZ2DgEKv2l/
 PGWs5ef//ypjodYS7crvhqh3SE3btVymrLXAVRootEzc2uRhmbTsym/XQVwJickubO+8
 CNiDw+0SZmx+LE8X5I5DbRWSl10l+yHUFDUuzBDB/r+LXH7EKRH8DRnOE1IjfZnfPNw5
 Idpa4wFu/fb+LeYx9NnKo11KzXaJrBtUaUHb1iStwARAXbtsHfqbu4VGjuC5B+QIDzTn
 jDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZeTraQg96mWBG55tgm5XLzk3EVPKVrM7pzYHtn9HsI=;
 b=pAT2z2Y53MJ35epaj3aGVkMfindfIlJulvjUdnxMkkzyB0kOecU6keLKsSv88UaEgS
 xRAGrxtZGGCPjTqsGcVr6nW7A+LGal3gA/bqSqd180a4kozBSHLkAiUjnZnjohmRiFRM
 2xBBrCv9i3YIcBsf79NSyGZbg/qOMajc8iq/LCa55CHOnrTeA8uURbPFZYU7Oin7fKHZ
 5l37RrbIFTyM1vOK0ybqRW6pvmSLQZ89BbN+eA1YjFApv4otk+/2zev8MI6XG/JF2Xv9
 oh/MvLu2KzCR2d0Ny51PwGYJuMXV1z7bYiEOzUdhbhme31Qa1UAEvKMP3njpmvLCeEmv
 JEmQ==
X-Gm-Message-State: AOAM532JM8vtNUzHRXXSsLqhObPM4yjYlWKlNDuc8YNTeG9Ivg4Adzt0
 mycS37OSc5pGsGoD1M000r/nhg==
X-Google-Smtp-Source: ABdhPJzRgKF/hq6jj3rkvC0PDwvrgKrsNHIkdzpQol74pXIUWyZrpq2OIt1phYc6qdLYf3kxknYzXw==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr4883683edt.251.1617210761692; 
 Wed, 31 Mar 2021 10:12:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h24sm1554131ejl.9.2021.03.31.10.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 10:12:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: codecs: lpass-rx-macro: set npl clock rate correctly
Date: Wed, 31 Mar 2021 18:12:35 +0100
Message-Id: <20210331171235.24824-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210331171235.24824-1-srinivas.kandagatla@linaro.org>
References: <20210331171235.24824-1-srinivas.kandagatla@linaro.org>
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

Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 8c04b3b2c907..7878da89d8e0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3551,7 +3551,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(rx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(rx->clks[3].clk, MCLK_FREQ);
+	clk_set_rate(rx->clks[3].clk, 2 * MCLK_FREQ);
 
 	ret = clk_bulk_prepare_enable(RX_NUM_CLKS_MAX, rx->clks);
 	if (ret)
-- 
2.21.0

