Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF06461D83C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:15:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A69616F3;
	Sat,  5 Nov 2022 08:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A69616F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632528;
	bh=PtNDgy5KlIotUjfA8c+WS3NHqugiidPN0vYRGszjepI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jf4MwrYMNd7A8UhFX/U/MWY7Kh8Q1cD2yOypFnBRa0rvzaLHPyceNdkg2y4NSK4Qt
	 YBG7vmKjcg9+nO/gokSuyo4CFHM/oM9t5vEGA9RNI0OWYawRTnX2qapqjcPzi6ZInR
	 tUNsYq0G7ckFWWni7hmbDTMYXpgA2VyEcSIOsxzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD66F80683;
	Sat,  5 Nov 2022 08:04:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D05AEF8047D; Fri,  4 Nov 2022 14:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9A1AF80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A1AF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="E/8S7N+P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ANPf8pC1"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2959C580271;
 Fri,  4 Nov 2022 09:33:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568784; x=
 1667575984; bh=fpvChMV7gduAS/j/O9KuAGwGonXURVFj8t9hZ+51w88=; b=E
 /8S7N+PBkpOwH7yDGV/cFLKmPQgWXSkHka1GgnMe2kAzfb/3csu8WkTR7jVsGsft
 TWD1DkOX4/doZ3S/8CTBJZjq4JVtE9fDOOFCfPLa1NEL2+d01VsyTRA1ogRbVnpJ
 60woen3gbxz9iYrSrlFHYAf8R2hirO+Ji/MeJcvexEH61PfKaglvPR1uqOUXrC0Q
 d0ZpkrtXSdBhicsdu5EsPaa7dgQO77EEBXznUVbhq5ZtezN1O+q6B0NuPq1a+UPn
 rO2w+mKVBS/kcJcjJ3bUb6yIjunFIdwmwWXQAi6/U/yTKggAwbQVUZHDsx/0zX6S
 huM9mEzXZTuw7vsq4/4Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568784; x=
 1667575984; bh=fpvChMV7gduAS/j/O9KuAGwGonXURVFj8t9hZ+51w88=; b=A
 NPf8pC1rTQsNkkgFwsJ/dexEtm8HSyMo8dXM+5f1p77+ZVScZrpf3wFg4Vsdskpb
 fd7DOGo2LEOi6geKHHk98SgfCCPSgHCBDrI2tuZhpcrit8QmO11EEDAk7uWKLyf7
 KdAf82YsBJ72Kfe06MRjG1Rcr4e3OarPCVn2rPM9d8u/KNvywhhVXtgJjVyo8AQN
 3I/w1QtN78+zpT4E0tOtpp8HYINoya/gA2dDpnV2o59G1BEOomj8GIwVwcrIbmoQ
 WIuVfEB3o+2RfBQb10RLgc+9WpyzFgj1RWwTjqTfkJco3XZ1QTS597eD7+oSqMFH
 VJErVDXT0e2Jf4eayxIRg==
X-ME-Sender: <xms:jhRlY_HBM4kpo02NWqMVRaNMnNdRIF3E8D9TEHq19bYd2c1O689DSQ>
 <xme:jhRlY8U1avuZTp9X5rxLgbZhCcrQMJLuwCRNCn52umqYXfIPaefWW-2c3bQH34Y1A
 SjyoWrg3Rsm27PZ-yI>
X-ME-Received: <xmr:jhRlYxI7hNfkA30KQ1Umisut2PAcFqwEnaEIVq6GDhB0dwSzPwonEJUNY7woL-kd8NFiDDm3OG9Plhml5bXbhvR6S80xepadridkAPEoSUTVZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jxRlY9G-2uXVHSvN7MmwpHREb_MT4qAetW0zCjJukRN3PkkatWOLgw>
 <xmx:jxRlY1XJgsheGDXpGPDpy83csumBSs4R7chjjLsDI-sWAZL-Ja0tCQ>
 <xmx:jxRlY4Oz1LEgRzLgmBM9WRJlxoBy8aGbfgrl3f-r1UG6zN4JZ07ivA>
 <xmx:kBRlY2VD8mObEYMh6A2KyHRqX3cVACJWlkXgO4tCG4PPv4HErz47tg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:54 +0100
Subject: [PATCH v2 37/65] drm/tegra: sor: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-37-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PtNDgy5KlIotUjfA8c+WS3NHqugiidPN0vYRGszjepI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl9OSjKLX8/iiZHYVn5Wr9JOSPd0rpOajW3SCxaRs/uC
 TKw7SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMJFEH0aGGTvLG1vj2Yyv8rSxb1A8uk
 1j5WsH7XqbtcE9W7zuz2OyB6oo2SO1c0uvzEqlVWWiuy/5PTzwXftN8wPWoyExlr0cdUwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:31 +0100
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

The Tegra sor pad clock implements a mux with a set_parent hook, but
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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/sor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..92084a9a67c5 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -586,6 +586,7 @@ static u8 tegra_clk_sor_pad_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_sor_pad_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = tegra_clk_sor_pad_set_parent,
 	.get_parent = tegra_clk_sor_pad_get_parent,
 };
@@ -604,7 +605,7 @@ static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 	pad->sor = sor;
 
 	init.name = name;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = tegra_clk_sor_pad_parents[sor->index];
 	init.num_parents = ARRAY_SIZE(tegra_clk_sor_pad_parents[sor->index]);
 	init.ops = &tegra_clk_sor_pad_ops;

-- 
b4 0.11.0-dev-99e3a
