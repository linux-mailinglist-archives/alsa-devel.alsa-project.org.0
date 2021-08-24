Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4483F5ADF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66E51654;
	Tue, 24 Aug 2021 11:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66E51654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629796761;
	bh=/P3xkuDqpq6+YrZCd3pMu9bKqZyb3321D6pdS7jRaiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmeuNc+GVM8oFmoRQr+XNzWlVlMft5osHw+TnHQ4IntWo9/JmEogcx2RNUZV6w9R/
	 KSPI0AZzJV5XgCktbq+gWLzMshHKZHzK9DE5QailcWvkAZRrsFiCF6HeuiErzRDs28
	 FwBkocNy1qf0J5IjP9g32PrO+JiADw0RPCqt3MI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2FECF804E2;
	Tue, 24 Aug 2021 11:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC22F801D8; Tue, 24 Aug 2021 11:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E89E9F80424
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E89E9F80424
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id B1519C2ABC;
 Tue, 24 Aug 2021 17:17:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P704T139881235867392S1629796642328500_; 
 Tue, 24 Aug 2021 17:17:23 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7eee9aeb88fc2b07eca648b85e70ae4d>
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
Subject: [PATCH v2 01/15] ASoC: rockchip: i2s: Add support for set bclk ratio
Date: Tue, 24 Aug 2021 17:17:00 +0800
Message-Id: <1629796634-4095-1-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
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

This patch adds support for set bclk ratio from machine driver.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index c7dc350..c9d5c52 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -49,6 +49,7 @@ struct rk_i2s_dev {
 	bool rx_start;
 	bool is_master_mode;
 	const struct rk_i2s_pins *pins;
+	unsigned int bclk_ratio;
 };
 
 static int i2s_runtime_suspend(struct device *dev)
@@ -278,7 +279,7 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (i2s->is_master_mode) {
 		mclk_rate = clk_get_rate(i2s->mclk);
-		bclk_rate = 2 * 32 * params_rate(params);
+		bclk_rate = i2s->bclk_ratio * params_rate(params);
 		if (bclk_rate == 0 || mclk_rate % bclk_rate)
 			return -EINVAL;
 
@@ -413,6 +414,16 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int rockchip_i2s_set_bclk_ratio(struct snd_soc_dai *dai,
+				       unsigned int ratio)
+{
+	struct rk_i2s_dev *i2s = to_info(dai);
+
+	i2s->bclk_ratio = ratio;
+
+	return 0;
+}
+
 static int rockchip_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 				   unsigned int freq, int dir)
 {
@@ -441,6 +452,7 @@ static int rockchip_i2s_dai_probe(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 	.hw_params = rockchip_i2s_hw_params,
+	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_set_sysclk,
 	.set_fmt = rockchip_i2s_set_fmt,
 	.trigger = rockchip_i2s_trigger,
@@ -638,6 +650,8 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	i2s->capture_dma_data.maxburst = 4;
 
+	i2s->bclk_ratio = 64;
+
 	dev_set_drvdata(&pdev->dev, i2s);
 
 	pm_runtime_enable(&pdev->dev);
-- 
2.7.4



