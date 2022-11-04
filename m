Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B395361D83F
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4941716EF;
	Sat,  5 Nov 2022 08:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4941716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632577;
	bh=Iy1qQJ0znBUKLYMmx1qyBFpOyf2xzBCZjv3Ms6vHOyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqU7nxhm3HBCo5LyranYGAiK7MSYlpSNIkrpm2H0LDb+8GXmlY4IDTUCobu98gFFS
	 xKrOV7N/KJBxxTh2vyPMWfgqAVjUmLVP7x+fG2x9ZAWK6XAa/OvcNRJdNyUlVB7Gn4
	 /1VIZWkQ5CM8IPYQjbFSRSpHkpVVwp0Mn4wShBmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79657F806E7;
	Sat,  5 Nov 2022 08:04:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA2AFF8047D; Fri,  4 Nov 2022 14:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615C2F80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615C2F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="NDUApnRs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RQChmzzA"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B72B580456;
 Fri,  4 Nov 2022 09:33:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568790; x=
 1667575990; bh=n64sOLiagnviVv3HjsxkegJ5AjY5p57YrMPjGj42NiQ=; b=N
 DUApnRs/rAKtCZmBe2Wm6s30ujm0TpOYHX4pXaMBY6oJ9Fb3M4PNfv1EWMi4aEgx
 v1jvaYP8prDSIxQzIkR3b+H+GuKo5hcFx7TyPX/mYkd21gPm2hY5xEal3ao/t+51
 hCstWdcMea+COQCxhXldDKpP76bcUq3zQgLpYpvDGFZhYWCJ59GndmH1X/kU1MRT
 YLiJJzuMq09leXG1USYF6I44I+Si2yhd6KYPLpohQeX1PKFqfX8uehsd7RQJPOkS
 ws/T2vLKKOYxmd0vSmw7ZwaRYh4Xi1X31qCa01FCbgmOQVLXxaBUjx0bsinMFIBu
 3c6d7+hvyKuSbWfOaQzDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568790; x=
 1667575990; bh=n64sOLiagnviVv3HjsxkegJ5AjY5p57YrMPjGj42NiQ=; b=R
 QChmzzAm/9yfSs0GvKAwp/hkTgAo2XndsU9uHr2S32CNmGLfr8Cre3PuxKQMPM2r
 x2igjFHMSbfW/WinY/LFXIAaHMRE8dX+WEv5KUDyb9RnmvMoNQpbggd4Xk78hRg7
 RcH8R1NW00WK5wCnamrztGDax90UWXoz81LmQmDXa11jViIFqeRkRyzf0vrC63Fi
 M/DoQWRBKKUOLs6gggemUcXAKrK5J8NZP+PwAs7yy0iLzzjY5xBqs9HZpYPQ0see
 F42tua2NFt+XyO0HY0tNgVofHinjSjJCHdIq+ZW28cVYMOfwVTramQE8Gmi7Yekl
 /Q93eTbVjnxDgeSipQiqg==
X-ME-Sender: <xms:lhRlY5lmQe6S0N6-D9A1NIKoIfyXgj8w06Qde-aCTfLWje9vHan0rQ>
 <xme:lhRlY01BCL9Svn-tOafh3qY7xEthzPBRi1hv0xrEjEun6GbT9DNn1DdB9DrzyU490
 dOh8BwCHKUXEguFZp8>
X-ME-Received: <xmr:lhRlY_pTi7EQdldnQFOg2EJyi01DPO1RUu7oZZwnN2cNUEpbv6pWjWO1OohoLBluY2EjmHYfM4ZxhWYK-lL6fuPn1rlwg74pAuYPSeQrrbggZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lhRlY5nJIEHnItycc_Efs7qbpkqbwobt8rae8JfIF1MzWghbllsaVg>
 <xmx:lhRlY30QZfOU8caMtejw-odH98PPT23xznqsp5pgRWsoz0YGZhA66A>
 <xmx:lhRlY4vv-ogsd10OQtiKb_c80CVMfLU3w3_lMdRCPez9rIqpT2TiRg>
 <xmx:lhRlY626jUFgqAoZd2zL6EMicjxn8oqIRgJ8QkPaxo7IsgJsJctACg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:57 +0100
Subject: [PATCH v2 40/65] phy: ti: am654-serdes: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-40-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Iy1qQJ0znBUKLYMmx1qyBFpOyf2xzBCZjv3Ms6vHOyQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8bvL0V1bnzAmZ4XbSQXOei+LKj9v2TL6tdfZauPuP5
 iF2so5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABP5x8DwP+OfmohMW56dbvv+FWpmTl
 paQix/H7EFeXRlGHMU6QfdY/in6K/HzcC92EBr6ZG/22O/buxrUOc8skp2D1+8xkT1zazcAA==
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

The TI AM654 SerDes clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/ti/phy-am654-serdes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 0be727bb9f79..f2061ce4e62d 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -634,6 +634,7 @@ static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops serdes_am654_clk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = serdes_am654_clk_mux_set_parent,
 	.get_parent = serdes_am654_clk_mux_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a
