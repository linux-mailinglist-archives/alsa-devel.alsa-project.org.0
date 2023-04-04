Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F66D7548
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72171E7B;
	Wed,  5 Apr 2023 09:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72171E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679572;
	bh=CVkVploTBmGsGDh1pgQkRdhTnIRCmgkdPTUL6cHj8pk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6ukgh1XeY5FQyh8AhZV/Ai5H5DIHH6d8305d0Su4EunGHC+0CX2OSwLF5A2zKCEu
	 cW2aqc+i2o1f4VyckchJYB3B38XCDUQ5KjJnFssHMsO71ulreeRhHLzD7XInAQjL3o
	 btNGGUKWzQax71r+0SzHvHfH8Eq6y3d3qebwO684=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08648F80571;
	Wed,  5 Apr 2023 09:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 197E4F8024C; Tue,  4 Apr 2023 14:45:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D0260F8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0260F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=T33QA58T;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FYf+6Kwt
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id F35B7582196;
	Tue,  4 Apr 2023 08:45:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612310; x=1680619510; bh=V8F7vdZqNHhl5nv8/Rp3qNs+CuQC/1S5n3N
	A9KKJTlA=; b=T33QA58TsY7L/qwKXqHoJY3rCCwL7EP6KK6tkE9cdvlHnPABYSe
	pXpRMRtjRPUv8t7IXqaHdyujZQGXfuY4pOB9WxT8my7eIABkZ6mg9uy8XEkmZxJO
	wv1mZAs+N8BKgoStAbRxhkRbXmKquQFq06QOel3Ch3+ftzwDyo8D5UjIU4CMcl9d
	J85KHRZUEB1y4OrVaocXDBFJAw3Ay5ijMEkxn8baUADKTXx/SX99hDGNKvh5hpM/
	iQWcXh3u2VlvRx0XuHoz9x2IyOrPhpadmlk3PAvPpOjakZ39kW1zcYgksOx1Z57s
	s/BixV2wnyyYmuI6vuuOn69U52unvOOeIzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612310; x=1680619510; bh=V8F7vdZqNHhl5nv8/Rp3qNs+CuQC/1S5n3N
	A9KKJTlA=; b=FYf+6KwtjH9qVK5Z73qwmZAH4ypY7EuXWjPIo1pCVCY1KSx3QW6
	pxU++QozVrpFTDipdFOHXyyQnq0xuLQ2CG5jyu8NQu74e8We7PCzccdqxiuYWPOF
	fs8/b70817p2eDek5EsSh6PQTQ0JIkfIIzg36hScwK4TrPiXgiQq31V3rIvHuxbg
	9o0CiJuPHs/mcZcb1LDVw8y33LpjQFuB1aJ4rHWLMR5iuasI7KjzXKAQCU7VJ0dy
	aTkSx4EqyP8KfJtszgOUj0msGKw7Qt+hX1mV7TnA9AMwvYLJdN/2az24Hpl/lnXy
	BiszlfmGgwk2ZhNM77GZEBjS2/GYkobfCBg==
X-ME-Sender: <xms:1hssZD6lSkl7dmRGL3660ig5YHUeKgIB5QxiL-TpExNmGcTw7vpgAA>
    <xme:1hssZI4rXKYpw-r82_vBXeltdrqdXz41gQsGnzJdAGPyVZurpbq8dzZYxZb2D46ie
    HRcsfr30KW5gyciXF0>
X-ME-Received: 
 <xmr:1hssZKd3qOatgI2rXxenQwFUBKoH4G8t3jJybGZ1z-UAtBToTf87fZKnWKnBWOc4b-bt1_aLRVXtPd_zu-_lAAQrGV8NYs0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1hssZEJoEvYYybTNKsFzNTOAi0zRmU3V-teS7to-4ZMApYYY8_DugA>
    <xmx:1hssZHJ0neRbEay3gNCXL7FItwFApLfPxxDQ4sGG7sQoqkroLpOZ8Q>
    <xmx:1hssZNycp4PSc3YTmgpSNTvEa8xZNuHAxBpcKWJVBnunSb3DtJPARw>
    <xmx:1hssZOUJ870oxzEkQQLJJphcGfEIY95fq8iNpWwFWcD3ui5F7vvkng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:23 +0200
Subject: [PATCH v3 33/65] clk: tegra: periph: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-33-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=CVkVploTBmGsGDh1pgQkRdhTnIRCmgkdPTUL6cHj8pk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e9izlhYt3DnT9rm3BnR1Xgnvq3K3/OOOCo88M9ZOHO
 6cJsHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIJxsjw8+dV8/9SFrb+OHbE+Wa2l
 evFv3XC3k/N3bRJLV/vc1eRqIM/+tqpl/U3NSULVmx9/if9efKDrzzZdBm89t9XvnEW1OdJF4A
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
Message-ID-Hash: CVM4UKVQDWZSBBHNIGNQDGPZAF6PLW2N
X-Message-ID-Hash: CVM4UKVQDWZSBBHNIGNQDGPZAF6PLW2N
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:22 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVM4UKVQDWZSBBHNIGNQDGPZAF6PLW2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Tegra periph nodiv clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 79ca3aa072b7..367396c62259 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -140,6 +140,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 };
 
 static const struct clk_ops tegra_clk_periph_nodiv_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.is_enabled = clk_periph_is_enabled,
@@ -170,7 +171,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
 
 	if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
-		flags |= CLK_SET_RATE_PARENT;
+		flags |= CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 		init.ops = &tegra_clk_periph_nodiv_ops;
 	} else if (periph->gate.flags & TEGRA_PERIPH_NO_GATE)
 		init.ops = &tegra_clk_periph_no_gate_ops;

-- 
2.39.2

