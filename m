Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9997A60
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 15:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00EF61654;
	Wed, 21 Aug 2019 15:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00EF61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566392981;
	bh=HKDqRM2nMnovFczuIlGROWo6Uz1ySXNN4G+cp95VB90=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXXS029p/8Ss0Cf3WYWyuDC3azqUqy9DbskrVUW7J21MpJtb+nrbuWh/lTS6brulb
	 2gCXVZYgIB8DZJOXqZrZptFhFiL/CE7KxBIi8l/VaNvkyQt1iuIfvAdhC6A/pHXEMH
	 e3FZcF4NV9ntbwE3fP7OMokNEHjfgSn7Yr0bLQcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90DF9F8045E;
	Wed, 21 Aug 2019 15:07:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE2EBF80308; Wed, 21 Aug 2019 15:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A0ABF80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A0ABF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GGA0PFtg"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71B30233A1;
 Wed, 21 Aug 2019 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566392821;
 bh=BBzaWBopHO0dXbT/Y5GDnPjB6CfdvBFxbOeeyx6S4ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GGA0PFtgjnfGGkKB0QnGIWKutIGHg+UW6n7Vpy7rybyGge9TyUJLVB1C5MJtMvxNc
 1qx/u+NBFt6FzGOLWRVYI5CMxt0kXOlmc0Uf0iEeI7dhY08FJu82fEekiiwoJ8hhWV
 B+Nlxkgtsz4JHwE4tdXDl3Reob+rWtS/l3ibNxzw=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Wed, 21 Aug 2019 15:06:53 +0200
Message-Id: <41a359d9885f397e066816961e5e3236afcbe0a1.1566392800.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.6022d5fe61fb8a11565a71bee24d5280b0259c63.1566392800.git-series.maxime.ripard@bootlin.com>
References: <cover.6022d5fe61fb8a11565a71bee24d5280b0259c63.1566392800.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 1/4] ASoC: sun4i-i2s: Use the physical /
	slot width for the clocks
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

The clock dividers function has been using the word size to compute the
clock rate at which it's supposed to be running, but the proper formula
would be to use the physical width and / or slot width in TDM.

It doesn't make any difference at the moment since all the formats
supported have the same sample width and physical width, but it's not going
to last forever.

Fixes: 7d2993811a1e ("ASoC: sun4i-i2s: Add support for H3")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 8326b8cfa569..cdc3fa60ff33 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -290,7 +290,7 @@ static bool sun4i_i2s_oversample_is_valid(unsigned int oversample)
 static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 				  unsigned int rate,
 				  unsigned int slots,
-				  unsigned int word_size)
+				  unsigned int slot_width)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int oversample_rate, clk_rate, bclk_parent_rate;
@@ -337,7 +337,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 
 	bclk_parent_rate = i2s->variant->get_bclk_parent_rate(i2s);
 	bclk_div = sun4i_i2s_get_bclk_div(i2s, bclk_parent_rate,
-					  rate, slots, word_size);
+					  rate, slots, slot_width);
 	if (bclk_div < 0) {
 		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
 		return -EINVAL;
@@ -458,6 +458,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int word_size = params_width(params);
+	unsigned int slot_width = params_physical_width(params);
 	unsigned int channels = params_channels(params);
 	unsigned int slots = channels;
 	int ret, sr, wss;
@@ -467,7 +468,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		slots = i2s->slots;
 
 	if (i2s->slot_width)
-		word_size = i2s->slot_width;
+		slot_width = i2s->slot_width;
 
 	ret = i2s->variant->set_chan_cfg(i2s, params);
 	if (ret < 0) {
@@ -490,14 +491,15 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (sr < 0)
 		return -EINVAL;
 
-	wss = i2s->variant->get_wss(i2s, word_size);
+	wss = i2s->variant->get_wss(i2s, slot_width);
 	if (wss < 0)
 		return -EINVAL;
 
 	regmap_field_write(i2s->field_fmt_wss, wss);
 	regmap_field_write(i2s->field_fmt_sr, sr);
 
-	return sun4i_i2s_set_clk_rate(dai, params_rate(params), slots, word_size);
+	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
+				      slots, slot_width);
 }
 
 static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
