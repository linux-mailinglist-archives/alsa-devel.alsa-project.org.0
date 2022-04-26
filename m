Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D951081C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A07917E9;
	Tue, 26 Apr 2022 21:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A07917E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999928;
	bh=McgoWmkYHtizr58/vT6trUUdr52odY6eQseeCgR1VqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOMVe+thzEQW5SgAE8YFUhd+tL3r5MT1d9NxgaV5mVFqdPJUlD0DvQ0DsaB34DeuA
	 ER2s8re0BbKeTWSskxwBUv08jr8QZiiDsseJrrUxoRHGYgB/La+saGgw7jH7d4DGKr
	 Vd4/HC3d6xUhaQRVj0d9TYN2Ks7nsG/0ka280hFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A58F80506;
	Tue, 26 Apr 2022 21:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB0AF804B4; Tue, 26 Apr 2022 21:02:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77139F801D5
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77139F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r3NB0DfZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0506E619A9;
 Tue, 26 Apr 2022 19:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49597C385A4;
 Tue, 26 Apr 2022 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999755;
 bh=McgoWmkYHtizr58/vT6trUUdr52odY6eQseeCgR1VqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r3NB0DfZ2hn72XXEQ0NpmVBa0Vcd+RJxuYIW2RoojeT/w9LS7D5NdpO7jY1HIr1MA
 V6AcWIwkd4C+shbSyWlYg50aJKc6c3e0TEvQ7PTeyxPKU6KnKWGlLD9ljd91m0hp1K
 yv4CvyGU+fxtHZdYPI3+fzE8FD91a/YMCejqCfdgoetN13ES2lCl+A/vhG50i+hZN4
 XS/jovz9OOxCYWCfpczfN3T8mAi4vrZeEbDKmgJOr/JsaV1zoP+rLh+Q+fh0BVnamA
 ATGtc5qlp1HQp3OrgmV/Zu0WsdPZzgPVM4T0xluhJR/hic4mQYnfHXUyob9ODekrUH
 QaZFiuMIJRnow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/9] ASoC: wm8731: Disable the regulator when
 probing fails
Date: Tue, 26 Apr 2022 15:02:23 -0400
Message-Id: <20220426190232.2351606-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190232.2351606-1-sashal@kernel.org>
References: <20220426190232.2351606-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 Zheyu Ma <zheyuma97@gmail.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, u.kleine-koenig@pengutronix.de
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

From: Zheyu Ma <zheyuma97@gmail.com>

[ Upstream commit 92ccbf17eeacf510cf1eed9c252d9332ca24f02d ]

When the driver fails during probing, the driver should disable the
regulator, not just handle it in wm8731_hw_init().

The following log reveals it:

[   17.812483] WARNING: CPU: 1 PID: 364 at drivers/regulator/core.c:2257 _regulator_put+0x3ec/0x4e0
[   17.815958] RIP: 0010:_regulator_put+0x3ec/0x4e0
[   17.824467] Call Trace:
[   17.824774]  <TASK>
[   17.825040]  regulator_bulk_free+0x82/0xe0
[   17.825514]  devres_release_group+0x319/0x3d0
[   17.825882]  i2c_device_probe+0x766/0x940
[   17.829198]  i2c_register_driver+0xb5/0x130

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Link: https://lore.kernel.org/r/20220405121038.4094051-1-zheyuma97@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8731.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 304bf725a613..24a009d73f1e 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -602,7 +602,7 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 	ret = wm8731_reset(wm8731->regmap);
 	if (ret < 0) {
 		dev_err(dev, "Failed to issue reset: %d\n", ret);
-		goto err_regulator_enable;
+		goto err;
 	}
 
 	/* Clear POWEROFF, keep everything else disabled */
@@ -619,10 +619,7 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 
 	regcache_mark_dirty(wm8731->regmap);
 
-err_regulator_enable:
-	/* Regulators will be enabled by bias management */
-	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
-
+err:
 	return ret;
 }
 
@@ -766,21 +763,27 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 		ret = PTR_ERR(wm8731->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		return ret;
+		goto err_regulator_enable;
 	}
 
 	ret = wm8731_hw_init(&i2c->dev, wm8731);
 	if (ret != 0)
-		return ret;
+		goto err_regulator_enable;
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8731, &wm8731_dai, 1);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
-		return ret;
+		goto err_regulator_enable;
 	}
 
 	return 0;
+
+err_regulator_enable:
+	/* Regulators will be enabled by bias management */
+	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
+
+	return ret;
 }
 
 static int wm8731_i2c_remove(struct i2c_client *client)
-- 
2.35.1

