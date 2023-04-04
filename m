Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFEB6D753B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F887A4E;
	Wed,  5 Apr 2023 09:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F887A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679402;
	bh=H3PCq1eBrNOwrobbuGN0PUHLpDCW7DFu6kFofHWGr2o=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MG6RIrLEu8AKE+sJF8MvlQnvQ3065UTRbNUytSv0vBORsxeXbqcTPsamOiNdBtIvL
	 R7CaRxYYYVzVVPPX40ugFXCpJgBjY2gHggZV7+x0j2Sfx1cAOTLXNb3L6lW++ehDYA
	 9CzEsh0GHWFr/iDdQNwVLfDbcZYWAnBhZo1YhUCI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5D2F805D6;
	Wed,  5 Apr 2023 09:18:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C87BF80529; Tue,  4 Apr 2023 14:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E8DFF8026D
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E8DFF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=bdM1cC4J;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FHkPcVlm
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 46E115821B1;
	Tue,  4 Apr 2023 08:34:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611679; x=1680618879; bh=ir/FV/1ZkTRK55Jm6cGfBcATymDOq77ovfa
	aQCnn6j0=; b=bdM1cC4JJKNoe87wvBFb+Rqxfd3vgjafL3yArotGzUqRDq4QClW
	8NiLr0xwmTEPseBqQQSeYLMYu9UB9fLsTodDVCMvKB41pxW5Ykuhv+KurK9Fj0bQ
	Elrv9tnrXnRgfXZQc6kYTwhMAyFGdXFQHYLbl7oeYXaUogP0NHHMQyeWk8/aEsDx
	Tfn/6wf+JOgNLtGHZZst5IBKb1zftfn9hBGy5KB/XTD6djWkx0VxEuAIGHrV7qMH
	6Ajix4Kv1TJB1IQaUymd5fljQ81Zd39rnXbdE+3fMc2cwgKKsSRzDwXqO3dJz7cg
	tBTrblkwjfoQgb4Uury2r1pJULwHNztVuAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611679; x=1680618879; bh=ir/FV/1ZkTRK55Jm6cGfBcATymDOq77ovfa
	aQCnn6j0=; b=FHkPcVlm9ays0tUxthNFdn01turq7EuNqAeBhfv0Nh5phLHmLVG
	Bnm6VUNb5kT14D16YfuzXoaNDbn/4EQGcRcQdi2meruOi7n0aNwndU2Ac2jt/35S
	WqGvUZ1RPZnLGyV9qYHqEGcdbJt4RscaPCi+Euj/i07BPLpRbILGZWwtAmkGvl99
	1NlR2jm72i0fB0G2qKXj5vL7MGWKJ/F4M/e+/HoT7uHB4oeN7uMJxs5610DrHt1e
	EFGoAQ+qD2J/soQVpSlOhzcqPwNsUApXX6M3Hrzr3ajJDVFwz1b5RmfVr+rPe6ld
	AvTpX7mLbA4Qw/Eh9Wyc3oSQFjhufJdniiQ==
X-ME-Sender: <xms:XxksZLO0FNzI48oZ4yL2VCUqCySLFsMalfWe8xLjH8KxUhYBCYBX8Q>
    <xme:XxksZF_eI2YCvyFgrkBpy6TRJ8_jOcvtsOX8nftiSqto2yx35xPZqm5asBdJ2vSYH
    o93FcSuQeMWWGqzOyM>
X-ME-Received: 
 <xmr:XxksZKRgAxDobLeBMJMz5jlfPbF2B_N002gUfMvVAxL_BS2aDkmnUMazdfRtGi-7Ca8dPsmqo2q23ce-pZbLd8-pZYedYsI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XxksZPvpVm7akByvab23JHwtioAjDgkUfRyYEaesraUPTRzK-KGzKg>
    <xmx:XxksZDfm4KqHX5Nd5W5s4xb1KMZ-kfojv2YtcX19gCAJLh0K4IC8xA>
    <xmx:XxksZL0LMj5TtVV-rwJM3s772oJXKXw7mSE7jq6UlF9Zn-ofP6l8kQ>
    <xmx:XxksZLKPpdpvb-VRVJyk4uwSKP7isoMxyCjgqCyfRo4iHMJF8O8Jyw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:13 +0200
Subject: [PATCH v3 23/65] clk: imx: busy: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-23-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,
  =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@microchip.com>,
  Max Filippov <jcmvbkbc@gmail.com>,
  Charles Keepax <ckeepax@opensource.cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,
  David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
  Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,
  Dinh Nguyen <dinguyen@kernel.org>,
  Peter De Schrijver <pdeschrijver@nvidia.com>,
  Prashant Gaikwad <pgaikwad@nvidia.com>,
  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,
  Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
  Kishon Vijay Abraham I <kishon@kernel.org>,
  Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=H3PCq1eBrNOwrobbuGN0PUHLpDCW7DFu6kFofHWGr2o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37caf3tsM+NA3pGbd+arRBvVf1e5YMbFK6Dk2qz7VCRJ
 b49QRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZS9Zbhn7JL9as5/56EP33jJssxr+
 zv9uYKTb+ZOn85zv6aPXdxxVVGhlXZlafq0yJqu9RCw4SEMz7assebta7YFdYaw/7p+qd/LAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-MailFrom: maxime@cerno.tech
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: EUEM3VNSF67HGGVOSTC2ZSY42Y5KTCZ6
X-Message-ID-Hash: EUEM3VNSF67HGGVOSTC2ZSY42Y5KTCZ6
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:17:57 +0000
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUEM3VNSF67HGGVOSTC2ZSY42Y5KTCZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The iMX busy clock implements a mux with a set_parent hook, but
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
 drivers/clk/imx/clk-busy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index 6f17311647f3..2df81862782a 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -148,6 +148,7 @@ static int clk_busy_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_busy_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_busy_mux_get_parent,
 	.set_parent = clk_busy_mux_set_parent,
 };
@@ -176,7 +177,7 @@ struct clk_hw *imx_clk_hw_busy_mux(const char *name, void __iomem *reg, u8 shift
 
 	init.name = name;
 	init.ops = &clk_busy_mux_ops;
-	init.flags = CLK_IS_CRITICAL;
+	init.flags = CLK_IS_CRITICAL | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 

-- 
2.39.2

