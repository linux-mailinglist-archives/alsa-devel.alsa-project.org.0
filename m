Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA16D7535
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65640844;
	Wed,  5 Apr 2023 09:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65640844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679343;
	bh=5lyHHQpQWAiRxeRx338/dvOcr5jka0snE7w9nKtfF/s=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=er4y92/g/Ht26G0H8EA7WN4GEEqlFJlBwxtiRvfQukG6MDET5bQVK3RWKL+lPuIth
	 0f2/2YWRtSdGhm9yXIaL0lfAfPMnwrMW9XjobHfaVymbykKXiHqGaS2W6bkQiv8yHE
	 FdKJYEkHpGxmQ27QWrcTDCVd550wgF225zQJjLuk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0324BF8024C;
	Wed,  5 Apr 2023 09:17:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5AAF80482; Tue,  4 Apr 2023 14:34:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 50C06F8028B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C06F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=s31JpOYw;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=McnDD3pD
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 547075821A5;
	Tue,  4 Apr 2023 08:34:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611673; x=1680618873; bh=vktqaF0FgAymg4NNxU36k4MdhmcX/jyIc5r
	ZP0GxZpg=; b=s31JpOYw0Is5/H0qPRNsBySPDf1dQBp9BiLEi1UH63Z8qrcRm43
	3DMo29YnPJ4snvAS11TquNBAL2ntJsozPZVDmeUu8Nge5mXlX67OlvzaMyiRJO65
	eiLI7YLqbzqrMePEjKi2vhn3+chumIlPmc+gEyzBwPqLAKZlgVG2U/FWQ712kGYN
	SBqX0yHX2UISw+HaGQu3+5yEpJCBy8Gg3SEopFayC7trIBwXQar8a04ifJVCzlcx
	7m9X7rRE/WsOBD8Bi/oXu5ybrxRagavE/CV3cxrlG3I56LAW8FOBrI4tbnR4DsE0
	dUpn63oR1Yf4+vo+AWVW7NVueXk6KK/hZRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611673; x=1680618873; bh=vktqaF0FgAymg4NNxU36k4MdhmcX/jyIc5r
	ZP0GxZpg=; b=McnDD3pDNWe5jFSRLdTPcaF+hy3ZRwuouf/pwuemAuy6aNDVToF
	UXsRkckGcQVvL4wIBsh59dlJWquRuvoCcBiFQAWuFNtAEaoqD3MRgH4eP2XjvZPU
	9kyplbzY4f/4p9Nt+JWsukMTCp2nsbr+jHK1DEDYcsh/BmbqvnPhsbWo4U9ODM1p
	YCdKc6RIZruxVs8fhSLu669rpCe6njyOv4i8Ffd+xsQ43ojTMnveMZ4d9JjNVd90
	MRpduVH5UZ7BuSaofUdXWhSpnpNx9WqWeOzgmgUbgniXsnEz1v3bvbrlbkevdXB9
	WwuJZOUMHI20X//ctpUYDIeu+2oaINML34A==
X-ME-Sender: <xms:WRksZACUBfAWM5klj9XPNywolUaeHHCeH5uFkpAOTo-3JmW_UwNDTw>
    <xme:WRksZCggTu3Fp6C8xde_mqYkHFRO5iaVptnPuIMexWzeV92MyK2uf1HEuZwEheO9B
    AHd8Rxu3kxhgkjzlSQ>
X-ME-Received: 
 <xmr:WRksZDn5Z4cCrBunAg3qIR5gvMPnCshtJ7_8RCrDH6EJOn7IFnc8Uvpsd7PBMycfiwDJD5mc4dj4XN7Ewwpp_NK-WFEc5os>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WRksZGy_nYRYIbe1PfGaSegLPd3fi5Z2hS1b4f7mSoD2nE4JR2LO4Q>
    <xmx:WRksZFRN-YyEjVmRYsTLbuXfX_hx7aEdUzsZLocAYHn0RDcz75rg7w>
    <xmx:WRksZBYB9qMwfVhPalpcm1gt8x7um1Tn8YMPZIlSQJ4MJtRLb8xbQQ>
    <xmx:WRksZJfWg7zPHQmUnpXQfKa6BuHflZ3rEQkM8vBHHIWUXHiIT-wFEQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:11 +0200
Subject: [PATCH v3 21/65] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-21-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5lyHHQpQWAiRxeRx338/dvOcr5jka0snE7w9nKtfF/s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cejXnpcyT/Z7qC/p1vZn+6HgbunqjVUO07ae/8mx4L
 pCdv6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEjvAz/I/bNkn4yrcZjFuscw8LTH
 /y5JGdp4f0at9LXz1FtJas33iJkeHxorQr7axm37f8jCibcFgra7tbA1vRspOb2Y5yid7QL2EHAA==
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
Message-ID-Hash: OZXJRVRXHDVXEEGW4SU7NCUSXJSXP5FQ
X-Message-ID-Hash: OZXJRVRXHDVXEEGW4SU7NCUSXJSXP5FQ
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:17:56 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZXJRVRXHDVXEEGW4SU7NCUSXJSXP5FQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
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

Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4103d605e804..c04276bc4051 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -229,6 +229,7 @@ static u8 da8xx_cfgchip_mux_clk_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_cfgchip_mux_clk_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= da8xx_cfgchip_mux_clk_set_parent,
 	.get_parent	= da8xx_cfgchip_mux_clk_get_parent,
 };
@@ -251,7 +252,7 @@ da8xx_cfgchip_mux_clk_register(struct device *dev,
 	init.ops = &da8xx_cfgchip_mux_clk_ops;
 	init.parent_names = parent_names;
 	init.num_parents = 2;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	mux->hw.init = &init;
 	mux->regmap = regmap;

-- 
2.39.2

