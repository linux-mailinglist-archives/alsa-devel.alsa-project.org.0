Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91508257283
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E671850;
	Mon, 31 Aug 2020 05:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E671850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598846150;
	bh=68aBcJzLZHXSjapHiDl/WG0Hzsu+ZBb2L1cypONDhmY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIzCeYumAb0L7RVnwNBzVU0EEUYy+2o8n/ZgFmUjAHgc5s0IG2q5G9Y+DHrL475yG
	 ij4Rh9bxWntqa1ZXd7rDjBh2lurms2fAw2/QQ9xvGb2+6HjBppdavfD1Wm3Iu7S3eL
	 3l//V9WlqMVe9BhdYyZCIOEz5ZMvYtWYrho3YL+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E404F80306;
	Mon, 31 Aug 2020 05:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A740F802C4; Mon, 31 Aug 2020 05:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6883CF802A8
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6883CF802A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ddF81dJr"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Itx7tUfs"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A482B58056A;
 Sun, 30 Aug 2020 23:48:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dwBlvqzAr4fJp
 zhu7kYGlRJpRIVCO5mGrOp/7qx3ab4=; b=ddF81dJrF8TOv8l/zyFmWfzVzUaD9
 IF5Z15ZwAenndei2gsoGsMmPZdTVgXivqTChSwd7jze1T/4+XYJqc52KpbyZrVJK
 DRkGQkuuNZVXzPu/Pv+7C6ixqHXbYTwqwkooJuJc+NA+8Ud0WjBCavmZNj5qtH6q
 WO7EH8e0PN/uGjCjONEnrgjcSwK/7oorg02sUisKUctHeV22fIk3FX39ckr9/cq/
 soQ98HA6ggeuAVEieR1HCerxybGMBPLPM9jjBoavRCYUpqz6FwsWr3Z1NBlTDvv4
 npUELCOUkgGs2BlLzHavpE8/J57Oip7lD6oZm5eDd2Yo9NRp90oDlSB4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dwBlvqzAr4fJpzhu7kYGlRJpRIVCO5mGrOp/7qx3ab4=; b=Itx7tUfs
 T2rdkGE/xhLPm+Zel+FbcD9uPxbSrCNgU0gEp3dX1lEPiCboAWyLZbUPWLGoevNY
 vJc0bxeuIvsaZCDfDnSMGEcmKT6X1xZL4fxQPZWgb+AOtSW2LHZSm5gP/J4xNe7Z
 pt4aLHqDHCMLiQ1uUODG8ssu2VjE+Ya66ZZmIZopAmQzIS7Om1PCdDi6/W9S+QTO
 xGclCvqg5A8erdfMbH2IydUVTJPn9LckKcOoRc6PGTCSawFXXlw2Hi4lSgTXvvFB
 Rt27IQASLUxJXqQI1YIgac1gkVLNrmXYssk4tPtLGBySq53gzJBc1r5XMw/Osri5
 ZkMtt+c6qxPCBg==
X-ME-Sender: <xms:KnNMX_Sk3RQ8vIwI5gbR5hCzpcYcUw7_7lM4rSFwW1mi_S-nKGJhYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:KnNMXwyQePURmhItN8fFuXR1t7b5iTwHiyM335rlO_BXW9_npvTpBg>
 <xmx:KnNMX011MABAWBS72klcQYz2PWFmU26bJwfGgTzXBEtaH-jO9_-Umw>
 <xmx:KnNMX_CL5MsUqBnVrxhGxVRKq0n8hTqnJkdILMr6VxeB6jZtSPvVzQ>
 <xmx:KnNMX0g1lvxumTw-MlZkVjoEpVWyWv6hGRPGkiab7y4R3UDEx723xg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 129A7328005D;
 Sun, 30 Aug 2020 23:48:58 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 9/9] ASoC: sun8i-codec: Manage module clock via DAPM
Date: Sun, 30 Aug 2020 22:48:52 -0500
Message-Id: <20200831034852.18841-10-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831034852.18841-1-samuel@sholland.org>
References: <20200831034852.18841-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

By representing the module clock as a DAPM widget, we ensure that the
clock is only enabled when the module is actually in use, without
additional code in runtime PM hooks.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 8a7f98910347..178f6fb31fd4 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -102,26 +102,15 @@ static int sun8i_codec_runtime_resume(struct device *dev)
 	struct sun8i_codec *scodec = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(scodec->clk_module);
-	if (ret) {
-		dev_err(dev, "Failed to enable the module clock\n");
-		return ret;
-	}
-
 	regcache_cache_only(scodec->regmap, false);
 
 	ret = regcache_sync(scodec->regmap);
 	if (ret) {
 		dev_err(dev, "Failed to sync regmap cache\n");
-		goto err_disable_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_disable_clk:
-	clk_disable_unprepare(scodec->clk_module);
-
-	return ret;
 }
 
 static int sun8i_codec_runtime_suspend(struct device *dev)
@@ -131,8 +120,6 @@ static int sun8i_codec_runtime_suspend(struct device *dev)
 	regcache_cache_only(scodec->regmap, true);
 	regcache_mark_dirty(scodec->regmap);
 
-	clk_disable_unprepare(scodec->clk_module);
-
 	return 0;
 }
 
@@ -379,6 +366,8 @@ static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
 };
 
 static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
+	SND_SOC_DAPM_CLOCK_SUPPLY("mod"),
+
 	/* Digital parts of the DACs and ADC */
 	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
 			    0, NULL, 0),
@@ -448,6 +437,8 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	/* Clock Routes */
+	{ "AIF1", NULL, "mod" },
+
 	{ "AIF1", NULL, "SYSCLK AIF1" },
 	{ "AIF1 PLL", NULL, "AIF1" },
 	{ "SYSCLK", NULL, "AIF1 PLL" },
-- 
2.26.2

