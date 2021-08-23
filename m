Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 688993F490F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 12:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18911612;
	Mon, 23 Aug 2021 12:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18911612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629716085;
	bh=dJDLORAYlSbLl65uw3NSpmdV2TE5AX00LZK9tRf547U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCkuzvIEkBJCDODuYDM/0C1V9r2lBxS2h8BSM5wna0CBz/6oBiCteZXDWKwHuDAxd
	 GFnTMwSf39hQgSlWbCuo9NkOWd7hA2/Pr9HC92QXgUcBH1R/Kq2lTUC4w9+xc/wLRJ
	 DgBdqQE+fOEOUqXdgMo0/HMFsBtknER2XAzsFfUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 542CEF8016E;
	Mon, 23 Aug 2021 12:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AFC1F80424; Mon, 23 Aug 2021 12:53:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB4BF8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB4BF8016E
Received: from localhost (unknown [192.168.167.224])
 by lucky1.263xmail.com (Postfix) with ESMTP id 24369FB68B;
 Mon, 23 Aug 2021 18:53:14 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22031T140205908551424S1629715992162978_; 
 Mon, 23 Aug 2021 18:53:13 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f762fd583e140c8cf6a14b2a2835c3f6>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH 06/15] ASoC: rockchip: i2s: Reset the controller if soft reset
 failed
Date: Mon, 23 Aug 2021 18:53:01 +0800
Message-Id: <1629715990-21372-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

This patch brings i2s back to normal by resetting i2s m/h
when the soft reset failed.

Change-Id: I2fd47039b522ac89499b4a2912d5ffb7a469e75e
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index b8e35a9..a91f874d 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
@@ -40,6 +41,8 @@ struct rk_i2s_dev {
 
 	struct regmap *regmap;
 	struct regmap *grf;
+	struct reset_control *reset_m;
+	struct reset_control *reset_h;
 
 /*
  * Used to indicate the tx/rx status.
@@ -92,6 +95,20 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
 	return snd_soc_dai_get_drvdata(dai);
 }
 
+static void rockchip_i2s_reset(struct rk_i2s_dev *i2s)
+{
+	dev_warn(i2s->dev, "Reset controller.\n");
+
+	reset_control_assert(i2s->reset_m);
+	reset_control_assert(i2s->reset_h);
+	udelay(1);
+	reset_control_deassert(i2s->reset_m);
+	reset_control_deassert(i2s->reset_h);
+
+	regcache_mark_dirty(i2s->regmap);
+	regcache_sync(i2s->regmap);
+}
+
 static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
@@ -132,7 +149,7 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 				regmap_read(i2s->regmap, I2S_CLR, &val);
 				retry--;
 				if (!retry) {
-					dev_warn(i2s->dev, "fail to clear\n");
+					rockchip_i2s_reset(i2s);
 					break;
 				}
 			}
@@ -181,7 +198,7 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 				regmap_read(i2s->regmap, I2S_CLR, &val);
 				retry--;
 				if (!retry) {
-					dev_warn(i2s->dev, "fail to clear\n");
+					rockchip_i2s_reset(i2s);
 					break;
 				}
 			}
@@ -629,6 +646,14 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 		i2s->pins = of_id->data;
 	}
 
+	i2s->reset_m = devm_reset_control_get_optional(&pdev->dev, "reset-m");
+	if (IS_ERR(i2s->reset_m))
+		return PTR_ERR(i2s->reset_m);
+
+	i2s->reset_h = devm_reset_control_get_optional(&pdev->dev, "reset-h");
+	if (IS_ERR(i2s->reset_h))
+		return PTR_ERR(i2s->reset_h);
+
 	/* try to prepare related clocks */
 	i2s->hclk = devm_clk_get(&pdev->dev, "i2s_hclk");
 	if (IS_ERR(i2s->hclk)) {
-- 
2.7.4



