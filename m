Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2E2321E1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A3D1704;
	Wed, 29 Jul 2020 17:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A3D1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037711;
	bh=j75Ufk8Egi1Vpzv0vDbXVsIi/Xcb7y+I3/5IPo9BDQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOJbgVAp91AE00/aOab1bHGHNKVcZKL/cPkD/imFwQMG0vpV8MVzppok/ZAsywgXD
	 YFNMGVbIVte5eNanNA0AmZZYZcQZC5hftkgw+0M44N01YuTzP5Vp3lFhSolSV/FHQ5
	 XsnexKlgb8l1FaiIUmyjdEaQoqs8335cyzmKj0A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55970F8012F;
	Wed, 29 Jul 2020 17:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27038F8029B; Wed, 29 Jul 2020 17:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F9DF801EB
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F9DF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="R6e6hElL"
Received: by mail-wm1-x341.google.com with SMTP id k8so3451002wma.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWqyEKTC/HJjMKifmyPTB4RZCmPL+DNrii7Si5MfMvM=;
 b=R6e6hElLlc+cKRmwfD9negfPjHCnH1BoA3KEGyKUVu+4cXtnt3BZD57hM2PlEEHmI/
 sqd2gXZg6qgdERDcATkW1xvA2BW9ApWfymSmV2YB6nEbHiIMBJJDmrsI+BaHWWeG/Us5
 U5Sm96lEvo7l/QRv4D6UEIgelIEez1Ks7QNRWZ1C/D8Cu5whCC7FoPyMb2z3BhRG2qgy
 FnBLSmNJOF1c50vViNF9o6VQ7a4k8Cx1fyQCIiNcYpM1c9YgLxXz7T+LYBgIxVV/A6Rw
 KkgIGG2I94TbAxr15mGQj9KGOCXZ8j9Xy0OLXIE2Z7A/ceEyEaCYB0q9i2y1J9ZGF17h
 1iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWqyEKTC/HJjMKifmyPTB4RZCmPL+DNrii7Si5MfMvM=;
 b=KEpkySg1WK1zO1tvdDUHe7cCEBAsVKKCedbs1azJ4S976oolV3nE1YbydTneuOiiFk
 foMsrzMxoZEWf6cVWCNXcSCsVpc/tAYwyt8Q3R7/ASUFhNo1sDy9jhPyWsKLmkDKr55Q
 HcaVv87kQvCiV4Olc//M784FPB1LTgw4PIizS71hyhIRrF4soaE6VKsICQXMrD2v+0Vh
 1QpHfAHOQU0+dBQqrKyfuUGfnwB7UeC2uJxuoBAUqcrbkri3pPrDutP9Sv3WiW6cvqq7
 hti1GuZvPn2GCBZd2wrUlrsP3uQkvkYbWz3OAMiUmdZiymQFITIixM9es4FtL5cRJ1L1
 /dXw==
X-Gm-Message-State: AOAM530+wAMGHbPnUXkTT9E7COW23jA6P6jzEgEqkjDtZoFY52p1EulL
 aNKTAeGkThnTSHmuMh4MycitNQ==
X-Google-Smtp-Source: ABdhPJxgGC9nboToZyRcUcXbiOSxER7K3hBnDiXzlzkgzlpkoRrJEvHRzVMhiuKp6ZHByGydbFxnFg==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr9082184wmh.174.1596037517108; 
 Wed, 29 Jul 2020 08:45:17 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: meson: cards: remove DT_PREFIX for standard daifmt
 properties
Date: Wed, 29 Jul 2020 17:44:56 +0200
Message-Id: <20200729154456.1983396-5-jbrunet@baylibre.com>
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

Standard dai format property don't need the "amlogic," prefix.
There nothing amlogic specific about them. Just remove it.

Fixes: 435857e015dc ("ASoC: meson: align axg card driver with DT bindings documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 29b601a0e274..f9ce03f3921f 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -119,7 +119,7 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
 	struct device_node *framemaster = NULL;
 	unsigned int daifmt;
 
-	daifmt = snd_soc_of_parse_daifmt(node, DT_PREFIX,
+	daifmt = snd_soc_of_parse_daifmt(node, "",
 					 &bitclkmaster, &framemaster);
 	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
 
-- 
2.25.4

