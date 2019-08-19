Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B595852
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:28:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290FE1666;
	Tue, 20 Aug 2019 09:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290FE1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566286126;
	bh=3rLz1PqZFp27CCIuB4ipL+ECAKBdp9jtHMD40q4+3ck=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJcS5CaHiKuxQzscbeJkAbxMV+6St3laF7/jq74DsLwt+eYV5JTxYFAX9+BKz+e6N
	 xptUj2/QtFF2YcBwVhjkdqPEtcPFBtotE7z0prjlHSnZJMf26kOHo90Pp/UTKKXfyu
	 pzFofUs5XkpTQKWhEITzB7xPWmTX5dVwEZerBgYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1BBF806E9;
	Tue, 20 Aug 2019 09:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695C8F80307; Mon, 19 Aug 2019 21:45:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99BA4F805F5
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99BA4F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HXlVqazD"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 666FE206C1;
 Mon, 19 Aug 2019 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242754;
 bh=r26mVi/Xdz/Vu/rKWGSR3w39MsxTxz5AOjIuGgJ5SLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HXlVqazDIZhHBBlltb4Jwzhz6SGlPlP/HEN4yzDx9tKCrabyvbpl0jOYfffarJXwl
 jki4+zExNPQv0mEVS9u4h9FWhAfRbkvRxU4MwLKa1o2PJm4R20vp3XkP6pRe/Syd0d
 oX9NxON9J+EnGOJXga/AHQiTFJH8VIxEogrCoJrk=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:14 +0200
Message-Id: <c3595e3a9788c2ef2dcc30aa3c8c4953bb5cc249.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:28 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 07/21] ASoC: sun4i-i2s: Don't use the
	oversample to calculate BCLK
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

The BCLK divider should be calculated using the parameters that actually
make the BCLK rate: the number of channels, the sampling rate and the
sample width.

We've been using the oversample_rate previously because in the former SoCs,
the BCLK's parent is MCLK, which in turn is being used to generate the
oversample rate, so we end up with something like this:

oversample = mclk_rate / sampling_rate
bclk_div = oversample / word_size / channels

So, bclk_div = mclk_rate / sampling_rate / word_size / channels.

And this is actually better, since the oversampling ratio only plays a role
because the MCLK is its parent, not because of what BCLK is supposed to be.

Furthermore, that assumption of MCLK being the parent has been broken on
newer SoCs, so let's use the proper formula, and have the parent rate as an
argument.

Fixes: 7d2993811a1e ("ASoC: sun4i-i2s: Add support for H3")
Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Fixes: 66ecce332538 ("ASoC: sun4i-i2s: Add compatibility with A64 codec I2S")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c |  9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3d7f4a97e0ba..ee8ee3eb2087 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -208,10 +208,11 @@ static const struct sun4i_i2s_clk_div sun4i_i2s_mclk_div[] = {
 };
 
 static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
-				  unsigned int oversample_rate,
+				  unsigned long parent_rate,
+				  unsigned int sampling_rate,
 				  unsigned int word_size)
 {
-	int div = oversample_rate / word_size / 2;
+	int div = parent_rate / sampling_rate / word_size / 2;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun4i_i2s_bclk_div); i++) {
@@ -300,8 +301,8 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	bclk_div = sun4i_i2s_get_bclk_div(i2s, oversample_rate,
-					  word_size);
+	bclk_div = sun4i_i2s_get_bclk_div(i2s, i2s->mclk_freq,
+					  rate, word_size);
 	if (bclk_div < 0) {
 		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
 		return -EINVAL;
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
