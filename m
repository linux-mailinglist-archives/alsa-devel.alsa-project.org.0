Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E726733A5CD
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E7E17D2;
	Sun, 14 Mar 2021 16:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E7E17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737165;
	bh=jD02L9qM2MLfjWUSakVEKqKuEtClODg2jSNGJnSyVg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tui7McKCgHand79W0/l73xi7KtK3jPo8PU14kxz5+zcCjSZINvHKV119cD5KFQuir
	 N+DK9B+bHKAmpjfaw9mRdG2k5yBG8c+oLane0YkEuniNHue0nMFJzf6Lt5QZeWxl3q
	 KAVoyPAa8HBb/BM1T8DZkKI7AEXiLwcmUdO9dqQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A59B2F80526;
	Sun, 14 Mar 2021 16:46:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9706DF80431; Sun, 14 Mar 2021 16:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3B8CF80431
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B8CF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ba1bpP0/"
Received: by mail-wm1-x330.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso18033334wmi.0
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FTy4HdwvhgNdRGZDpAPkP98g1TyRqgQ5LxuFhEMa4g=;
 b=ba1bpP0/mAHlNBan9GD+3oyEXBKINOceI57ZBmCCbORaKjcnzyOQrEEQYf09dwxyzk
 Z7o0qSPM12D3byFzGUElOlWVwv0ovqXSwVn8ShHn40XSRNTgx5L+ms2u0KEKqKHCg8pL
 A/qjIXti11h5hz8OU+raTh2TH+B7365cSHImfqY499XFzc777CpX2P4fmXFRlkrZGu0z
 73PkLAOGpsR79OSK4com04hcorMPJ8x8uB3qZ2GE8LWlzLQ3m96lhgWZrfUw5z6E75Mw
 +VydNetkcUqBLQblOZEaxKQ+xoOhhUdLTeSQ7q9lVA2/UG7eVaqZ6XjNQZdgzvJUUFJw
 zD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FTy4HdwvhgNdRGZDpAPkP98g1TyRqgQ5LxuFhEMa4g=;
 b=pgJ49//xugHr3M6FwLtW8gBVm0brs6vmIa+lh2HgvUu4JfUUsz53CNKeWMf8rwBiKN
 My8QrQaG8W5SApi0mI1nv1qEeHdpeL95Ro7iLnS2D1GeGJ50CXyb4CZY9wRxwqFNe0Q9
 O6AGdZzT4SwbVr6l8z+4DQRtAJYwXKE7tSPPnJgEfdlIESH3CwzkUqY8bqb9q4/eRIo8
 ae1O3M4OoF6VSqk/BUykX5ZTf42799agw92PnmPBB4UUSUd4d8VSfi5ECBAFEmN8lXD6
 vb9mj9OCEMUESbFkIrQxtNRazsC49Icl7JzgmZyhD18j6iXwxLbN3bx18PgPsDM2yYG4
 l0cw==
X-Gm-Message-State: AOAM533xAhbh/G9ZW3cCqROS2a1daI76UUztIDpyWBxF+obCGvHLWo/s
 ABQVdiHb33hrXA83XGixC5w=
X-Google-Smtp-Source: ABdhPJzzZuvVT0073VQRrIVTiyLp5MTznkF2J2J6+GE3zGtOggeuoza+1fh4MaDq2voQWzJdMaAazw==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr21518896wmf.6.1615736734166; 
 Sun, 14 Mar 2021 08:45:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 13/17] ASoC: tegra30: i2s: Use devm_clk_get()
Date: Sun, 14 Mar 2021 18:44:55 +0300
Message-Id: <20210314154459.15375-14-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Use resource-managed variant of clk_get() to simplify code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 31e08c5c1405..0ed982548ce4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -438,7 +438,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	i2s->playback_i2s_cif = cif_ids[0];
 	i2s->capture_i2s_cif = cif_ids[1];
 
-	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
+	i2s->clk_i2s = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
 		ret = PTR_ERR(i2s->clk_i2s);
@@ -448,7 +448,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -456,7 +456,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(i2s->regmap);
-		goto err_clk_put;
+		goto err;
 	}
 	regcache_cache_only(i2s->regmap, true);
 
@@ -534,8 +534,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 		tegra30_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put:
-	clk_put(i2s->clk_i2s);
 err:
 	return ret;
 }
@@ -557,8 +555,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra30_i2s_runtime_suspend(&pdev->dev);
 
-	clk_put(i2s->clk_i2s);
-
 	return 0;
 }
 
-- 
2.30.2

