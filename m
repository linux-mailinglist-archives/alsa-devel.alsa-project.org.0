Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DED61D862
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E651170A;
	Sat,  5 Nov 2022 08:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E651170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632917;
	bh=wrb/gLlXObBQQfdHTgDTlHkPVh4Y+mxa5fDcw3PaFNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5Ga+jGl1vn6FaZVzuOGA6wDXkKa2oqjYTucQ6l8sNZKTTAc3/pqUVs4w/GMNJCr/
	 DDyU5x6V/qwZj8cBrJjN+C0kK2CPH1C9ZR/PGKzmHuvkuPj5rFyZNN29g0FSvnzILN
	 nsd92ffzZHPxHqPJvTp7fstU8s+hsLcZZ8ztCk6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15816F807A2;
	Sat,  5 Nov 2022 08:04:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87039F8049E; Fri,  4 Nov 2022 15:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAC6BF80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 15:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAC6BF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Ee0t0U2p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BB8f1ogJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 44FA258050C;
 Fri,  4 Nov 2022 10:22:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 10:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667571763; x=
 1667578963; bh=w3HVpr38dw1g+Gys8Rw5Ia6clclGhJnxPc1fiBkUAa8=; b=E
 e0t0U2puMyuy99W7bGnkNAmukTQvIXb2NXm5SkQCB0J/bxJ1WsUknJ/Wb/jvlf0/
 O2qO/odDdLRKX3PdBSbuh/7l98td1DL6pEUb4OZJc5tBNGUDFZVvG7LiQqWLrFiX
 KkbRlxx1ocawrWDWTl6G3DR+4QrVzHOgJ4s3dOYJxpHMCWuVSCu5BK2ZromHuHo6
 I6xXOM9FtoakO0RmvKLodXSAgsaqw36uPKpA/YoPpyWQs05xVybUkBoIFiy6r+Ky
 tGOTvTF8q3ni8ev4h+Lddy6mdtgosgR/g63CfukPXay+M3IOEchLWcWteOK8xR3s
 q11nxGDgSdRnDBqKO2yQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667571763; x=
 1667578963; bh=w3HVpr38dw1g+Gys8Rw5Ia6clclGhJnxPc1fiBkUAa8=; b=B
 B8f1ogJnnEu3uJSIlQA2q0BrDkmVY6amkDq6efXNPJdJzR2Ld3KXdMkxF+LEhXFD
 tBy9juFZZcHGTwN4spv2HNfbnIVBVTphicTKYGtmIByag3cQuLD+67g++88WTuCX
 EAQFLqxwqP+UojYKA2YLTfXtbC56/7ALm7VuLpQ7IB66p9XAAtlpSOmppZnKPcoA
 yLpnwRpNsPucYpJXhqdt4pmEovdCRT61dHw0+nEVxbzbRv+WG6JLFg5NGOcyskLQ
 YYqzJQV5Iz+kktF5l3/SGgGpdmSJpTXJVolpK1qzvKywW2GeSRlO6kTDpzgREb0D
 +0eMAAhiN5AlnrNoVZqYg==
X-ME-Sender: <xms:MSBlY1jdXBHFZtaoPpZ-OrHPEzahD3jCRJGN7zvnBwwxJzbhpZpfuQ>
 <xme:MSBlY6BqfXgElKHqgH8HHz1imAJ_TDiu6itXZ6K00q6oeIFrjuyE7K7QrhNqvsuZQ
 ieUoibWNkHzl7VfXOI>
X-ME-Received: <xmr:MSBlY1F-Ev4_E9KY_Iym_Y-BPF969O1fu_XlMgbwroAiP76qzPw62lN2a1Pk2lmfXFFi3WU2qLk2ArVbIJO7HRgrpSmOI4sNpDIvim8RPJ8uYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MSBlY6T668Dzl2PbFxTLdD6_KweDalKrkjSO0xNFUGBNZVrTlJrF0w>
 <xmx:MSBlYyzUHKsV_z1hYIFhIw4vboPuHdZVeDLGZW8SDCPDfFOhSr-teg>
 <xmx:MSBlYw57XAOdSLFC94RDrTn5o8RaawBDJJlI4zSaQHwWpTtoAsmDSg>
 <xmx:MyBlY2jEv-Tc8bDOhGFAV_5iEHu-VTVBYXqANRN9u3_sxx5Iqy6UPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 10:22:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:20 +0100
Subject: [PATCH v2 63/65] ASoC: tlv320aic32x4: pll: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-63-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3073; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wrb/gLlXObBQQfdHTgDTlHkPVh4Y+mxa5fDcw3PaFNc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt8047Pc5aS5L7yeL+cw5aXhlN+LH9+ONM7OZjbkusf7
 +bJoRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCv4SRYfu9z/JZ69c0NLstffKwfu
 r+1T92e0y4GiA5z2/PWp1HTbcZ/ic1fpmYei17msgzKZGEn005Kxet12Rk3bLESN2Y99DzHYwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:32 +0100
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

The tlv320aic32x4 PLL clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 65b72373cb95..d8b8ea3eaa12 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -205,18 +205,23 @@ static unsigned long clk_aic32x4_pll_recalc_rate(struct clk_hw *hw,
 	return clk_aic32x4_pll_calc_rate(&settings, parent_rate);
 }
 
-static long clk_aic32x4_pll_round_rate(struct clk_hw *hw,
-			unsigned long rate,
-			unsigned long *parent_rate)
+static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_aic32x4_pll_muldiv settings;
+	unsigned long rate;
 	int ret;
 
-	ret = clk_aic32x4_pll_calc_muldiv(&settings, rate, *parent_rate);
+	ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
 	if (ret < 0)
-		return 0;
+		return -EINVAL;
 
-	return clk_aic32x4_pll_calc_rate(&settings, *parent_rate);
+	rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
@@ -267,7 +272,7 @@ static const struct clk_ops aic32x4_pll_ops = {
 	.unprepare = clk_aic32x4_pll_unprepare,
 	.is_prepared = clk_aic32x4_pll_is_prepared,
 	.recalc_rate = clk_aic32x4_pll_recalc_rate,
-	.round_rate = clk_aic32x4_pll_round_rate,
+	.determine_rate = clk_aic32x4_pll_determine_rate,
 	.set_rate = clk_aic32x4_pll_set_rate,
 	.set_parent = clk_aic32x4_pll_set_parent,
 	.get_parent = clk_aic32x4_pll_get_parent,

-- 
b4 0.11.0-dev-99e3a
