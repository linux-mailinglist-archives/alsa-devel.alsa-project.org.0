Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECFB61D826
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:11:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D54A16BD;
	Sat,  5 Nov 2022 08:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D54A16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632298;
	bh=Y1EX8G8pftDxQw1Ys52sH8o9+GAhW5bf3l3YFzowBDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/K7tYGQEeCNKmq+ZA2LaruWNvjOiv3E/k/sqB26YOkxPWX6VpEYTI8Si9uMWgEmP
	 C3CGeLWHDfpQ4SGWf1FI89PUd86ukPlESXNl8ZUCmG8A0DImyRSWJy7ufRa6gfl/md
	 xYisxTJQvITT1EfXZoYdZXZ8NVXLcbzoqBO2kkbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5410BF80619;
	Sat,  5 Nov 2022 08:03:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1946F8049E; Fri,  4 Nov 2022 14:18:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30597F80448
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30597F80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="PtmveYw5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="stB2czEv"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9D1658046C;
 Fri,  4 Nov 2022 09:18:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567919; x=
 1667575119; bh=YPE8ExSs4d4LTvnXSYBVZkXRbapPJ6obpuAeld6klEU=; b=P
 tmveYw5nLXiJ+/zabi31GiaQcHOpM7y1cK7cVDgxmbINAy4odu4apdyVIY0h9QrU
 nHGp5w3KxZGu7BLLECSXCccBwpvZSPCBtCHJe8aKTkRa2/RXxvtTlsuDv/zLWeO2
 bTE9yx8jgoKtSGxqyubIW67sP+raBQg2no0B2nf/ijORhIhwOsNhXKpfJvXb5/rH
 U5HKs966WPLfjH1Fz3M564IMKA4aOHTCia6NSjORQauJ9KIj/cwzhEaUdi6JGx1h
 LWqXk08w39Gn6nkeSdG2DlT8qttZjbHVNEARtBKJjIyp1Iv4OYUJWcCsmPkfzgs0
 bcbsEwjeeDMujPdwjUBpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567919; x=
 1667575119; bh=YPE8ExSs4d4LTvnXSYBVZkXRbapPJ6obpuAeld6klEU=; b=s
 tB2czEvX4BDMfxM9zlNk5k8xasvbCujl9jiJp6K3KnHPNgDJvw7PFnUzfnsPCfMH
 onK11uy4ITiU6uLdq5K0KSC9QzuYLGYxmdEM4RagFMXUv4K0PAipQBIhep8vT4TS
 XdtU+vXo00gVDf+uVGDeqaVLNWEiM56TbShVGNmCSoXj0TQZUd/LOfHGEzKl456G
 ilwNzS+O3NuzGebEBmIXBzPlg9MFPR7X4RzkW31wxpH57FEzvcB36JVEmhk0AcU8
 0nX/RMYyB+7BBYF074CcwJ8KMHwu+vIyphC1kT8cs++MlzvVch5kYpMgD+GYLknp
 VmqyApPJHL9oDGSTQXl5w==
X-ME-Sender: <xms:LxFlY45lH0JOZ6byxFuUNybyFRoSeqJH_B3HWOLcmmR9TP_EuN3kMg>
 <xme:LxFlY57teWcMTwA8Busgyw3vvsut41ipl31vK19ShjjNacNZ4qaF_XY8rFMCh7swh
 fodtn5IZoZIkeAdqqc>
X-ME-Received: <xmr:LxFlY3d4bqOExPWW2zKzX4jsW_a7CfQXL4_v5_pCDrXB_Xvs3LfNS7wnj6j7sWIkSmhzQKns5_7hwjJO3iZWAND8565x4fwsRcjYnDtOFnD2sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LxFlY9Kg21rMeEyGzWLd_kPF9ILJQxqq5497ZWE8ddJaE7pekBy1PA>
 <xmx:LxFlY8Lp25vNE2kFXvACZKTSh_9fn01R7LKTTEOwtRgKZGqxIyR-bA>
 <xmx:LxFlY-xvZSzoQAwDnwdsAPqDPIBYXHEW1o1SBnh5nyY9IsHtOvT3ow>
 <xmx:LxFlY3adOUeGZ3CPUdtW9Uh94ceHH6IGK42C0bAOX0G9GfF3lbT49w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:41 +0100
Subject: [PATCH v2 24/65] clk: imx: fixup-mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-24-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Y1EX8G8pftDxQw1Ys52sH8o9+GAhW5bf3l3YFzowBDA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8Kz2/bolLusfHUS28mXpaWw6ePtX+OPm7LUjL3p6fc
 WZagjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExE7SQjw6R5H7qu8Ka9sXod0MMvcc
 r/7OGs1zknzlTPbKpxkWXx8GX4ZxW4dMKRjSLZsmbFQfzGNfeMlGrvpRx4oHwz+01b28Fl3AA=
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

The iMX fixup mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-fixup-mux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-fixup-mux.c b/drivers/clk/imx/clk-fixup-mux.c
index c82401570c84..e32c3b22ff05 100644
--- a/drivers/clk/imx/clk-fixup-mux.c
+++ b/drivers/clk/imx/clk-fixup-mux.c
@@ -60,6 +60,7 @@ static int clk_fixup_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_fixup_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_fixup_mux_get_parent,
 	.set_parent = clk_fixup_mux_set_parent,
 };
@@ -84,7 +85,7 @@ struct clk_hw *imx_clk_hw_fixup_mux(const char *name, void __iomem *reg,
 	init.ops = &clk_fixup_mux_ops;
 	init.parent_names = parents;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	fixup_mux->mux.reg = reg;
 	fixup_mux->mux.shift = shift;

-- 
b4 0.11.0-dev-99e3a
