Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6229584A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2334F82B;
	Tue, 20 Aug 2019 09:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2334F82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566286045;
	bh=lzdN3lfWsI2Gl/rvTyDYagSR0IWTOZi9tRIrdpiHb+A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jp6jECqK9yeWvXa0ilbwFxfidSFCiDIW8pVU2xOraItEfJ/Wy1AQJYzd4nAl+RPTH
	 d3PljnYNQP7wsKOAzlzS6VVD2NWRClaxAqyRKXn+4luAu65p7y1p7fjlZ9cyVwx4Kq
	 GfzO2z6WXg7T/NrpkNyokG2r5Ent4+bh/zze+2XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD13F80677;
	Tue, 20 Aug 2019 09:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B668F80308; Mon, 19 Aug 2019 21:45:39 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D3CCF805E1
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3CCF805E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1LbNMr5x"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BD6522CEC;
 Mon, 19 Aug 2019 19:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242750;
 bh=/JNyZbS922uUvEBM9yhHQYNhX5F4WMOEyf2ebWw0n0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1LbNMr5xpgWNAtAk+jIYVhSn/QVEWR04aE/ujIe61LZ48mKXoZnt3f2z8QpLC0guh
 n2GO1CN9eLbNbixs6pf+GJaG2N2y2dz41Gy3cti79uvzlRnpVr30wwyLpOiw/7JPBm
 M7SJABxkzlp5G9azY1JgppTsQ7Z7Ohk+y1yLXHkc=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:13 +0200
Message-Id: <dcc5deb2eb650758d268bddd20f60ba58856d024.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:28 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 06/21] ASoC: sun4i-i2s: Rework MCLK divider
	calculation
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

The MCLK divider calculation is currently computing the ideal divider using
the oversample rate, the sample rate and the parent rate.

However, since we have access to the frequency is supposed to be running at
already, and as it turns out we're using it to compute the oversample rate,
we can just use the ratio between the parent rate and the MCLK rate to
simplify a bit the formula.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index fbbedb660cc6..3d7f4a97e0ba 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -225,11 +225,10 @@ static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
 }
 
 static int sun4i_i2s_get_mclk_div(struct sun4i_i2s *i2s,
-				  unsigned int oversample_rate,
-				  unsigned int module_rate,
-				  unsigned int sampling_rate)
+				  unsigned long parent_rate,
+				  unsigned long mclk_rate)
 {
-	int div = module_rate / sampling_rate / oversample_rate;
+	int div = parent_rate / mclk_rate;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun4i_i2s_mclk_div); i++) {
@@ -308,8 +307,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	mclk_div = sun4i_i2s_get_mclk_div(i2s, oversample_rate,
-					  clk_rate, rate);
+	mclk_div = sun4i_i2s_get_mclk_div(i2s, clk_rate, i2s->mclk_freq);
 	if (mclk_div < 0) {
 		dev_err(dai->dev, "Unsupported MCLK divider: %d\n", mclk_div);
 		return -EINVAL;
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
