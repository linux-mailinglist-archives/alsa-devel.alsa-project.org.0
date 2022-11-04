Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83F61D811
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:09:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75AB1697;
	Sat,  5 Nov 2022 08:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75AB1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632146;
	bh=8SGQf3kkT7UEwm20SsvxRlrkz2by+8b35E6hVUuixM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isxwUGpEPSKLSn3/4FB9HAm4cQXLJP3c5F+MVDpx2HgvdCD7YGVKdtF/O0VNzqpmY
	 Zm2/cvxkGLrMOQGAwesbQPFo4/DK1MJ+2zJGfF4kfEJyXypyDfuQT3GL2Vyubtoz52
	 3K5Zj4iYEYSFTnT1ztj+x8/pgHvUuv7dqnUt6OkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30646F805C9;
	Sat,  5 Nov 2022 08:03:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A3A7F8049E; Fri,  4 Nov 2022 14:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A14CCF8047D
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A14CCF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="FRCpPtO0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kh6GSq1I"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9337C5804C4;
 Fri,  4 Nov 2022 09:18:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567902; x=
 1667575102; bh=AiZw4g5HOn4xy/Rxk0RktvHjkdLEPlfvrWYEfqyclqU=; b=F
 RCpPtO0Z+oJjRMEMPtc3UUoQLtiu+IOQf2+QP2jstGTxC498emPhjWTBn4B+Ssr2
 iaNhYgUYqJ5UWQ6EytcbC+mC8M7K4W1bsSqWJclY/T37yJbj5v5kM3wHPNGvEHha
 Dgx88U6pfG0fBsUebGShI3nB8b7o+X0YBaI+BGIQWLuK9lCUHVMqx8ZIHXUEo6Cb
 ZXnRDP06x2bGlyQ6Kxjxn/f8WyRERTt1XIy8CNy5hwUE0tq20JqBAwzcHS/bxas9
 fkN0jGYRxT4ZQnXuGAfSK398yB4rVORbEW3LmzlbSe89/sKfx2HAQydh3PvF099s
 Q2Y8XxdummTB7aZJcL1Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567902; x=
 1667575102; bh=AiZw4g5HOn4xy/Rxk0RktvHjkdLEPlfvrWYEfqyclqU=; b=k
 h6GSq1IWf33v2fE78JAHvMeI/9Pr+h63pPDiUUc8//2Cg7ZFGOj9vnzp5k9FAQ/s
 7EV1hTql9ooJ0GMlONsk8IkK/M4qFtZE37S1L5BaFO9cWsNC/Z85YzHzB/kb4le5
 AsAtQqScCVse57/SYSRid/QwIlRgZgW8R3bmVw8LkM36hU0eXwOUVHbHcz8fZ3IB
 5P2UOkx/w4ANXCAfFKf1uv7Mln+kXm9VMQrWlnHd7ScLcapohBC9G+Vc+44yU1Hc
 tf9wejuWuW+iJjzBQzWOsUe/Zp1sEMXxW/cwsFeAxUsM0AdTXvc1QjDBnG0ZM/9k
 3Mv0/6R7hL2q+9xQdZo1g==
X-ME-Sender: <xms:HhFlY5ueAcclMW7F7YScqq5uciI4CICavZaUyYZC0FDu8b6hTPKlIw>
 <xme:HhFlYyfmCRmYt1hh_12d_wWU5z9KTtpFTmugCzz0zlwGVQooEglL-HSFRJK1KWMym
 trI4NY3ce1X5RU4Qso>
X-ME-Received: <xmr:HhFlY8xgUoM1RsqnBXClzu6HmUCt7OaZk20xIKBk90uBg_GZgVAbWmO_GGn1zJWC1Q9rZC1eAPC8ROB0vKvgBx3pyMuTdIxux1cNfZQ4PsM8Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HhFlYwPr_VXG4dYVpwhTClBPq3AkhjNe2q-1VTzxP5RKdem_pcgp9g>
 <xmx:HhFlY5-GSTvVvY0X7YHfK1MJGN5efdJd0k1h5SlrQax5hS4f0oR-Rg>
 <xmx:HhFlYwXIu8oO5qGgIKRhP6sp5Ko5OvuNpHA6Yg3OJzCBo9JNZWXfug>
 <xmx:HhFlY7diCei0pfT4425AAG4a7LX_cOxshIlpjOcvKaUOgp18M9lN_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:33 +0100
Subject: [PATCH v2 16/65] clk: si5341: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-16-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2382; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8SGQf3kkT7UEwm20SsvxRlrkz2by+8b35E6hVUuixM4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8N5/l16Ki33Ag99eGbJRfrehb2cJ/Fc2YaGfyREu6+
 4NjQUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkUH2JkWKt1Z8re8GWPzjclzTs8TT
 J5lvTM9k/zz5v8YGaamHyD9zfD//w0v/SC7FS5r1Mm/m85IPjjmswuqVlt2hOYpsi/tnrLzwkA
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

The SI5341 clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 0e528d7ba656..259861aa2e2f 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -551,6 +551,7 @@ static int si5341_clk_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops si5341_clk_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = si5341_clk_set_parent,
 	.get_parent = si5341_clk_get_parent,
 	.recalc_rate = si5341_clk_recalc_rate,
@@ -1682,7 +1683,7 @@ static int si5341_probe(struct i2c_client *client)
 	init.parent_names = data->input_clk_name;
 	init.num_parents = SI5341_NUM_INPUTS;
 	init.ops = &si5341_clk_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	data->hw.init = &init;
 
 	err = devm_clk_hw_register(&client->dev, &data->hw);

-- 
b4 0.11.0-dev-99e3a
