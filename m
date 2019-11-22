Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCF2106126
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 06:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5B01805;
	Fri, 22 Nov 2019 06:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5B01805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574402080;
	bh=xsDmCs40gpUn1X6yA/UZjjXH0DMmpT4mfWzx1GeZj1Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHHp/T6mXNqpYTRLzNvwbspIGHq57jDL0FN8b4ljoxEUA0PDWeBj4ZO6ahIrNl0H8
	 Ib/q+QPt5Zm8ZzHsA27K1JvJDyM20zpbxnUCdf5RCaKpsCJOOg5U3WTuDYao5/gkYr
	 dmVa3apxAdNLtnCYKnV2X1+sUwUBzp4VIO4OdYRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C26B8F8013F;
	Fri, 22 Nov 2019 06:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ABE3F80140; Fri, 22 Nov 2019 06:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE7AF800EE
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 06:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE7AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PQKXNHRM"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CE472071F;
 Fri, 22 Nov 2019 05:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401967;
 bh=geeeVQ63UDrNG1JfFxbc//qDRyzxsQyqhEbu7hEACLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQKXNHRMhIHkF1a9Ioi7N1d1dFy1wHjAJUCvUFKj3HYCsUJgqJWOe+jSRGPZ7X6HT
 AsLUAmRy0GRzEQokhnN9klEkxAHfedpbMV5BrEHTFjZ39BKUgQS3hMjcwYoUP1mTAA
 wL1oY8qH/p/ZcQz4gPNKhkFngZs1ZxrJYqLWWzKw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:48:40 -0500
Message-Id: <20191122054911.1750-181-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 188/219] ASoC: samsung: i2s: Fix
	prescaler setting for the secondary DAI
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

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

[ Upstream commit 323fb7b947b265753de34703dbbf8acc8ea3a4de ]

Make sure i2s->rclk_srcrate is properly initialized also during
playback through the secondary DAI.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/samsung/i2s.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ce00fe2f6aae3..d4bde4834ce5f 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -604,6 +604,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 	unsigned int fmt)
 {
 	struct i2s_dai *i2s = to_info(dai);
+	struct i2s_dai *other = get_other_dai(i2s);
 	int lrp_shift, sdf_shift, sdf_mask, lrp_rlow, mod_slave;
 	u32 mod, tmp = 0;
 	unsigned long flags;
@@ -661,7 +662,8 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
 		 * clock configuration assigned in DT is not overwritten.
 		 */
-		if (i2s->rclk_srcrate == 0 && i2s->clk_data.clks == NULL)
+		if (i2s->rclk_srcrate == 0 && i2s->clk_data.clks == NULL &&
+		    other->clk_data.clks == NULL)
 			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0,
 							0, SND_SOC_CLOCK_IN);
 		break;
@@ -699,6 +701,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct i2s_dai *i2s = to_info(dai);
+	struct i2s_dai *other = get_other_dai(i2s);
 	u32 mod, mask = 0, val = 0;
 	struct clk *rclksrc;
 	unsigned long flags;
@@ -784,6 +787,9 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	i2s->frmclk = params_rate(params);
 
 	rclksrc = i2s->clk_table[CLK_I2S_RCLK_SRC];
+	if (!rclksrc || IS_ERR(rclksrc))
+		rclksrc = other->clk_table[CLK_I2S_RCLK_SRC];
+
 	if (rclksrc && !IS_ERR(rclksrc))
 		i2s->rclk_srcrate = clk_get_rate(rclksrc);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
