Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C513E5C3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE3417E0;
	Thu, 16 Jan 2020 18:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE3417E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579195020;
	bh=1W1pt/y/ZO55sZ0Htd2OVsNG33oTO9kH2ycOeqTxHWg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvW+Yhv7ohC2wfw/b3vJgMI/ITI8IPaF2rNyewgsNulG50sMBO7SciKUGWL0Ke27i
	 76g8ChQZNWAstRQDm8YBGQ4/li4t8gVuPQO/CqlvIfhtqg/AkflXoXWIfm7Z7nmhXT
	 v7hX3adnsP/0dczoC4IgyLuKpLhpiERBJzX0VsqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B59E1F802E3;
	Thu, 16 Jan 2020 18:10:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F4FF802E1; Thu, 16 Jan 2020 18:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87D17F802DC
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D17F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BPuhKN9A"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 218F020684;
 Thu, 16 Jan 2020 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194643;
 bh=qqkdZRDf7pL7NtpFXCo/nXi2C6V+PmmiKiloW5jVw7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BPuhKN9AyK+wNrmmlkgDWd6TDqFWcDRky5ruCSy8cN8SkgvpRugXnRYYG4Jo0+O+H
 G1iliwxI+vhcj+oHekuK9LyOeUyrzL0DIEJfgqCKcRmpll+C59k6d2tLX9G22piBC6
 Z8tLZl4/ARWJ9gQ21N8prd1K6N5Tjf5SvkPpWuxo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:02:18 -0500
Message-Id: <20200116170509.12787-237-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 500/671] ASoC: sun4i-i2s: RX and
	TX counter registers are swapped
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Maxime Ripard <maxime.ripard@bootlin.com>

[ Upstream commit cf2c0e1ce9544df42170fb921f12da82dc0cc8d6 ]

The RX and TX counters registers offset have been swapped, fix that.

Fixes: fa7c0d13cb26 ("ASoC: sunxi: Add Allwinner A10 Digital Audio driver")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/8b26477560ad5fd8f69e037b167c5e61de5c26a3.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 18cf8404d27c..f248e563986c 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -80,8 +80,8 @@
 #define SUN4I_I2S_CLK_DIV_MCLK_MASK		GENMASK(3, 0)
 #define SUN4I_I2S_CLK_DIV_MCLK(mclk)			((mclk) << 0)
 
-#define SUN4I_I2S_RX_CNT_REG		0x28
-#define SUN4I_I2S_TX_CNT_REG		0x2c
+#define SUN4I_I2S_TX_CNT_REG		0x28
+#define SUN4I_I2S_RX_CNT_REG		0x2c
 
 #define SUN4I_I2S_TX_CHAN_SEL_REG	0x30
 #define SUN4I_I2S_CHAN_SEL(num_chan)		(((num_chan) - 1) << 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
