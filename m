Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCE3F8170
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C9E2167C;
	Thu, 26 Aug 2021 06:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C9E2167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950618;
	bh=RsS4o87XzuqbWgI7Ke9xF4ouXD1GGgPDbs3+8udPoVk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKXgQjLzm1YWZs7QkTuu+HkgETLZnHTqZgyxiju2V9X2k5BsicsD7AAQripJv6sQF
	 kNQdiakCrkSURuYhtJAqsoCkic5AAKx1l32NSLhoX56Fa1jjoQ8KZp3NmjOUrNaFIs
	 CGk1iZkrprjzPtm+b71AWnIKJyKEO5x1uHu+Hbw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EC9F804E1;
	Thu, 26 Aug 2021 06:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EF3F804D0; Thu, 26 Aug 2021 06:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF585F800FD
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF585F800FD
Received: from localhost (unknown [192.168.167.105])
 by lucky1.263xmail.com (Postfix) with ESMTP id 14E3AB2D94;
 Thu, 26 Aug 2021 12:02:19 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P21354T140059187595008S1629950526140784_; 
 Thu, 26 Aug 2021 12:02:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b520854d1be45adb60e349fe211d06bc>
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
Subject: [PATCH v3 05/14] ASoC: rockchip: i2s: Fix concurrency between tx/rx
Date: Thu, 26 Aug 2021 12:01:51 +0800
Message-Id: <1629950520-14190-5-git-send-email-sugar.zhang@rock-chips.com>
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

This patch adds lock to fix comcurrency between tx/rx
to fix 'rockchip-i2s ff070000.i2s; fail to clear'

Considering the situation;

       tx stream              rx stream
           |                      |
           |                   disable
         enable                   |
           |                    reset

After this patch:

         lock
           |
       tx stream
           |
         enable
           |
        unlock
       --------               ---------
                                lock
                                  |
                              rx stream
                                  |
                               disable
                                  |
                                reset
                                  |
                               unlock

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 90877e8..0ba728f 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
 
@@ -52,6 +53,9 @@ struct rk_i2s_dev {
 	unsigned int bclk_ratio;
 };
 
+/* tx/rx ctrl lock */
+static DEFINE_SPINLOCK(lock);
+
 static int i2s_runtime_suspend(struct device *dev)
 {
 	struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
@@ -93,6 +97,7 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int retry = 10;
 
+	spin_lock(&lock);
 	if (on) {
 		regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
@@ -133,6 +138,7 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
+	spin_unlock(&lock);
 }
 
 static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
@@ -140,6 +146,7 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int retry = 10;
 
+	spin_lock(&lock);
 	if (on) {
 		regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
@@ -180,6 +187,7 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
+	spin_unlock(&lock);
 }
 
 static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
-- 
2.7.4



