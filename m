Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCF61D812
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED8871678;
	Sat,  5 Nov 2022 08:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED8871678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667632162;
	bh=lgJkEvSNRDAnm37cdjNLF/t0qBUSxsL3dduicg+ovzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIC9Ic+JkQ4B/ZolzzTYG9hByEL5zyGn5BPz+QBO6K1/6FEZSOLqungJU4T5vVPPM
	 lHN2bZ04mA+cLeItnJ2IGBM4F2doHH6qc07O5wDR5j2BJi0F1h4trIsj2RzlSgFoSp
	 Km9M8sf3HcYuXjAV7JU81F/mjnjY2vtMU+qjwJ64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4CDF805D6;
	Sat,  5 Nov 2022 08:03:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ACA3F80448; Fri,  4 Nov 2022 14:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82969F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82969F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="jkjCQWX9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L1cZChDs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B73D85804C5;
 Fri,  4 Nov 2022 09:18:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567904; x=
 1667575104; bh=ZQiHGlhcCi/k+//rpfo4vhoISVvHuB3yO5HEIA4xQ/A=; b=j
 kjCQWX9xab52+XF4Z4xv6+Hy6ru0SOALA2TqaDZBZa8itukdy/3e0tVRuE7Xr9fN
 7xnWTNcH2DCFNFhQFQP1mhnyN2KQFj9ug8I5/KOxEByRCFSvvqYjKAMESSVcRGnF
 oodTz3OeKFV0GrKO3zu9TxAcgRyBEiZ9gFZIXK/ztiUNRLZBlPw0p0eP97ZMK0DT
 iPaJr0iURFasa4CVqgLmCkHRGMiBXPlKQE3NhOWGLd391l82tjtn4wpi+MJ50FAT
 +a2VJqaI3s/VpMSOoEJtbbyQkToEnZL97jKftlsYqqvs9wGOCBIM4nwZEyBnrkWe
 eoRuceLKDWPI2+4rPt2Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567904; x=
 1667575104; bh=ZQiHGlhcCi/k+//rpfo4vhoISVvHuB3yO5HEIA4xQ/A=; b=L
 1cZChDsIlqnNhfr4CVP5rKXrSD5DW1LijYfMxZ9VXawJ8ziZx/4xFfU41e+31wuE
 hIgLPBjO57MfuIn/XSAiPfIbYZZTDTCRRk5pFiXP3PlNZkTQM58vjnbrE3J4sD1C
 OaJ3lsejqzHPNLP6dGcjefRUBNEfe1SflT7Z1zyVYXT+ENhedOINZQNFhwH6gMxM
 2rub/yqEri8Tf298kiQPgIkHF/P9idZS3I2NajfOZQEFaDpYki8jvDQtWoOND+Fi
 pvhlzxI451q5XDFVj+TfhNfflSelKvSwJ85d3NPdJd/UHjP7o1NXE3QiyduHDdKb
 W8IO+r3QniIB6rgPrFOZA==
X-ME-Sender: <xms:IBFlYwkvQgUez2_sICw6AwCW4Ms3RVd__Jox1ahZsPnXjikRgay7oQ>
 <xme:IBFlY_04siW77CaVG-d3clI-SOK9CneQrLDJGS85-fSTggus9ABORF7JOI6nsPgcs
 kCSJro3X2TJ7ia0b98>
X-ME-Received: <xmr:IBFlY-rpsRJPOCC0_SLaidzGLBrUxQTvASuVKbJwjxxjRVgOUvZ3X_OaSkyqK-T9Q4G6e3qZQIBjLNFWbG_fWt6yg84PpZa33p76wBnOhBOwZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IBFlY8lAhKIINJYzyl0MH2h2j-DqRrRfaLB3LsOwt3k3VLsQN2jfBQ>
 <xmx:IBFlY-3vE0hIJ3RhpUrEFoSiagXAxvQAiWkR9LNlPaoEnpwb7NPGyA>
 <xmx:IBFlYzuybs8oiDvmPTi_hPl0SuxOtyjjVMWDPX-9vJR71BtvxKmPAQ>
 <xmx:IBFlY90koTs-0bHZXZeXJk5lrMl3gY95OFXdjQq1mGfgVzdIENlJ8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:34 +0100
Subject: [PATCH v2 17/65] clk: stm32f4: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-17-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lgJkEvSNRDAnm37cdjNLF/t0qBUSxsL3dduicg+ovzY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8ZevqTgufkWbXs+uPr9ttBxXD6Dcv/D/okDKbUJR2b
 kZ7aUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQ3h4hSAicxlZGR4MU3xztwAM43PwhkiArm7tH
 wuLVK90l0tk97ttnlfiPJxRoaGo2EJBt+W3pjD8ONq/yv+k7bF+gF5XCWNLK/zd4rNXcYCAA==
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

The STM32F4 mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-stm32f4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 473dfe632cc5..01046437a48c 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1045,6 +1045,7 @@ static int cclk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cclk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = cclk_mux_get_parent,
 	.set_parent = cclk_mux_set_parent,
 };
@@ -1085,7 +1086,7 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
 			&mux->hw, &cclk_mux_ops,
 			NULL, NULL,
 			&gate->hw, &cclk_gate_ops,
-			flags);
+			flags | CLK_SET_RATE_NO_REPARENT);
 
 	if (IS_ERR(hw)) {
 		kfree(gate);

-- 
b4 0.11.0-dev-99e3a
