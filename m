Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485524C0764
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 02:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BA61915;
	Wed, 23 Feb 2022 02:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BA61915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645581037;
	bh=y6+rH8hnFNVXdFmnZeLqwUTYKfP8z+x+kSI0RdsyXbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbzRuUONnUuBvI7sSbb8x2wT0+PKMEyBK54LEoAfbcOiI22gbiv2h7vi32xaadu1m
	 9fnyw3wWVyU9SznG4awUQg306mVC+D11A3gf2zd8g3tbXAsfaF8OuxXScztnL1GhEo
	 TdC2A0r6EysmDq251L86/5sjNjvV/oCxm3CR/zpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E38B5F80224;
	Wed, 23 Feb 2022 02:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDAADF80311; Wed, 23 Feb 2022 02:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 676A7F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 02:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 676A7F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bz8aoQCR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E93A3B81E01;
 Wed, 23 Feb 2022 01:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77676C340F1;
 Wed, 23 Feb 2022 01:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645580933;
 bh=y6+rH8hnFNVXdFmnZeLqwUTYKfP8z+x+kSI0RdsyXbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bz8aoQCRGGPch2ifjTVj8AHjjym/+zGRFaRGIZlLS5HD8c4IPQCGb9jSaubQvwOMw
 M+khyIWtQOFVSafE+KUa10lIPIPbDsJUFZF5yCbuWGZ0NUp6phUIoDpiAamQ7ixvxf
 NxBfixgRaiFrMNcHDU7gNQ72S0+dSGYu+RhAheHzVwM1ZlFHL+v6NKKYNfSsif16fT
 bbJrXQpCHTlD0ggcqYm0w4q4bnd+gb9vFbuphdFc/l76ikd5RNSzO69IYoV3g6cuzQ
 nfNomF3Bf9+OqQE0fLWzGvGUoWlmLGMiEcIfnoDoX2zL+QeMs+DVmdHemALhAdQRgO
 KVDTZwR7uCqgg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: pcm186x: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 01:48:44 +0000
Message-Id: <20220223014846.2765382-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223014846.2765382-1-broonie@kernel.org>
References: <20220223014846.2765382-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; h=from:subject;
 bh=y6+rH8hnFNVXdFmnZeLqwUTYKfP8z+x+kSI0RdsyXbQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFZJnXYdGbHNjNJDQdYb9Y61BS0qHh6lZWaX5Yiry
 t92kcxGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWSZwAKCRAk1otyXVSH0PjXB/
 9zLH+58ST6vtK9d6oY1qwE8u41zpL6Lfzk5m89GQ43kOBnAGUPbuYL0HUKRTurd2LuaKGvpwJdElga
 tW/RBupkHDzlvc88cqhonkzPnCDEc4TqMA1SOHxPmUa7i2dhgAlTjerKsCXUQTni8kn7yDbN9WNC0d
 KsQKSOEAM1R3ivirCdLXBaWQLPbe2DuJIB1kYx5OKJ1TiN+quCa2G6fOLL1XCPpdCt5Ah8VzX4FcJq
 +zmNE2D+cK/22NVrquLRRDD+Z1wKT3qhXiDSY4EZIIszsQDacNjsEoP4G2w+4jLaT5kVBKTgM1fWz2
 /+29xo7KVAAsLULv566uBsKmrS2IF+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the pcm186x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm186x.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index b8845f45549e..2c78dccb3f62 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -39,7 +39,7 @@ struct pcm186x_priv {
 	unsigned int sysclk;
 	unsigned int tdm_offset;
 	bool is_tdm_mode;
-	bool is_master_mode;
+	bool is_provider_mode;
 };
 
 static const DECLARE_TLV_DB_SCALE(pcm186x_pga_tlv, -1200, 50, 0);
@@ -340,8 +340,8 @@ static int pcm186x_hw_params(struct snd_pcm_substream *substream,
 				    PCM186X_PCM_CFG_TDM_LRCK_MODE);
 	}
 
-	/* Only configure clock dividers in master mode. */
-	if (priv->is_master_mode) {
+	/* Only configure clock dividers in provider mode. */
+	if (priv->is_provider_mode) {
 		div_bck = priv->sysclk / (div_lrck * rate);
 
 		dev_dbg(component->dev,
@@ -364,18 +364,17 @@ static int pcm186x_set_fmt(struct snd_soc_dai *dai, unsigned int format)
 
 	dev_dbg(component->dev, "%s() format=0x%x\n", __func__, format);
 
-	/* set master/slave audio interface */
-	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		if (!priv->sysclk) {
-			dev_err(component->dev, "operating in master mode requires sysclock to be configured\n");
+			dev_err(component->dev, "operating in provider mode requires sysclock to be configured\n");
 			return -EINVAL;
 		}
 		clk_ctrl |= PCM186X_CLK_CTRL_MST_MODE;
-		priv->is_master_mode = true;
+		priv->is_provider_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		priv->is_master_mode = false;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		priv->is_provider_mode = false;
 		break;
 	default:
 		dev_err(component->dev, "Invalid DAI master/slave interface\n");
-- 
2.30.2

