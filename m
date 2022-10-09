Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B975F9400
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4BC16CB;
	Mon, 10 Oct 2022 01:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4BC16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359531;
	bh=FoAKBoM3BVE06nEwOQj9AKyKByzBVLYrsUm0mfXl8EQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSDp59e/B9yaeQeai/cSeeWVknEdMBdkrB42h7rqxyoV6BsMQjZYTKS/oBOrKhzQQ
	 ri+xYiN4iFzn3kACWZ0SqnW+awogeIFQG8SDvxTa6QANq2pHc1OLStXMeSjED6ID6A
	 o8fF3rQjAM2hPD7RApUZ8klayjWG6DywlZtSh0RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DDE9F80549;
	Mon, 10 Oct 2022 01:51:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76982F80551; Mon, 10 Oct 2022 01:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D087F8053D
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D087F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t2tw1qWk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90E8160C9B;
 Sun,  9 Oct 2022 23:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F2C433D7;
 Sun,  9 Oct 2022 23:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359460;
 bh=FoAKBoM3BVE06nEwOQj9AKyKByzBVLYrsUm0mfXl8EQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t2tw1qWkdMgLMIkEKAuaDwOvFv8/p8RNHCTnJaqkpdXrYPPc3OkEG+flJkl2IsDMw
 Y6QZnsqV9m+s2+3WXCw/QYBlJ9k52LlcXEmC8jkej1Wl+JuJA7b3H0psclMMzgwoTd
 b2bLt9cR+5C+fuqvQyKPkwXnAu2F93rv/LeTd9P5dj5XdZA9WObZxDplCEJE11LZMX
 3/gH56wD8g1o5xNBEuG7EAuW/lAG50MiTQBWY7TJMeG+UsE4F0mSkGETcJqoQNwfhK
 hC9auInErdNk7s6d3N8t3Fg63B6v/79s3dChKF058CuLt9xQeA34cv1W0/4Q0PH44s
 QWmzJ4muq93Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 27/44] ASoC: sunxi: sun4i-codec: set
 debugfs_prefix for CPU DAI component
Date: Sun,  9 Oct 2022 19:49:15 -0400
Message-Id: <20221009234932.1230196-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, samuel@sholland.org, tiwai@suse.com,
 jernej.skrabec@gmail.com, wens@csie.org, Mark Brown <broonie@kernel.org>,
 lchen@ambarella.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Mikhail Rudenko <mike.rudenko@gmail.com>
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

From: Mikhail Rudenko <mike.rudenko@gmail.com>

[ Upstream commit 717a8ff20f32792d6a94f2883e771482c37d844b ]

At present, succesfull probing of H3 Codec results in an error

    debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already present!

This is caused by a directory name conflict between codec
components. Fix it by setting debugfs_prefix for the CPU DAI
component.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
Link: https://lore.kernel.org/r/20220913212256.151799-2-mike.rudenko@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 830beb38bf15..fdf3165acd70 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1232,6 +1232,9 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 static const struct snd_soc_component_driver sun4i_codec_component = {
 	.name			= "sun4i-codec",
 	.legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "cpu",
+#endif
 };
 
 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
-- 
2.35.1

