Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429745E7071
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 02:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A36D852;
	Fri, 23 Sep 2022 02:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A36D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663891306;
	bh=XLMVjc9kycY7cqA20QU1lEWGA1kBnlKNHm6oii/5Ggw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iz7G58MQDi94lGb/3xwgH18RNfbif55v9AqP1IOwz+lwJDMU4BXaNew+Gt9zICedR
	 WwPAx0V3Bx7o2VmqB/uWR8Sf6pNywb8RIkDKn/hpWUB204ByQ8rsQzOr3sWteW/5Dw
	 Rvt9AiwEqPxGpYpb0XKN1t+F9tEka5qrRK1cDndA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC4EF8053B;
	Fri, 23 Sep 2022 02:00:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D4DEF804FE; Fri, 23 Sep 2022 02:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB079F8012A
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 02:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB079F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Q1O6wlvk"
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 46FD46602234;
 Fri, 23 Sep 2022 01:00:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663891201;
 bh=XLMVjc9kycY7cqA20QU1lEWGA1kBnlKNHm6oii/5Ggw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q1O6wlvkTvjYSTOhOZ6sXzT27+FaY8dolxZ3Zo1LrAkHwjsbluUsR59dmCwxoRfJv
 dwcE/5BOq1WYgsRLV9MlutZ9fdbZ2BCKpS2z9VEw2n8Nly1UiPL+sateKf5zLWWy5O
 nyVFbNQ7P4w7AW0cwjk8wQat1eDEF1n2QNV1AeEk2EMYbD47G+rnFN3RQ1utRm3H7D
 voF9OnAC60YCu/1+dNca5MqTRoZEKpeY+V71SbR9TXYKwjc5Ykjqdzpvwtg4Qrjtxx
 d+F9OduTd3hdNEaRJKwE1GupsqqeXw6EbA8vtdx1V4DYomEjW9X5/gr6swkpciMAVe
 Gwnh/H2WyioNA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: mediatek: mt8195: Expose individual headset jack
 pins
Date: Thu, 22 Sep 2022 19:59:47 -0400
Message-Id: <20220922235951.252532-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The rt5682 codec is able to distinguish between two event types:
headphone insertion/removal and headset microphone insertion/removal.
However, currently, the mt8195 ASoC driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 961e769602d6..17d4c4108a9d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -63,6 +63,18 @@ struct mt8195_mt6359_priv {
 	struct clk *i2so1_mclk;
 };
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin mt8195_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -563,11 +575,12 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 
 	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
 
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 				    SND_JACK_BTN_3,
-				    jack);
+				    jack, mt8195_jack_pins,
+				    ARRAY_SIZE(mt8195_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.37.3

