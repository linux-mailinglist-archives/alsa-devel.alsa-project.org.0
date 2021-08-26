Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963673F8173
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31919166B;
	Thu, 26 Aug 2021 06:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31919166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950683;
	bh=0sLueFxwn8iTHbh99ZkL1pTKQXw/acYMC7FLjsVRamA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzRk+zhAlTqOcdy730sCOyp44OVAO5dHz3mHJLLiIACEotocryaDSHgpeBrrnr8mU
	 +2QdQ86iydjRzHpgjVw8HxZ/bXd7sDS+VguEg+7jG2P1XuQ/OVBqFhZoAYeQEBneR7
	 IVfznPZeMkHFXVR6LGi9OvZeoaV643FM22djlzO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35525F804FA;
	Thu, 26 Aug 2021 06:02:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C73B7F804F2; Thu, 26 Aug 2021 06:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F20F804F1
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F20F804F1
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id 53793D7683;
 Thu, 26 Aug 2021 12:02:46 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22778T140142501164800S1629950564011175_; 
 Thu, 26 Aug 2021 12:02:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a0275dc094a7f746c3e4306b44681975>
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
Subject: [PATCH v3 06/14] ASoC: rockchip: i2s: Reset the controller if soft
 reset failed
Date: Thu, 26 Aug 2021 12:02:34 +0800
Message-Id: <1629950562-14281-1-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
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

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0ba728f..78321ee 100644
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



