Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1E6D7547
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD083E79;
	Wed,  5 Apr 2023 09:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD083E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679555;
	bh=7MyP2GPGennrs6JFmJIGpKWEw9VpMS3F/dGkDZ/Ald0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CVJAVfbqpu4gFvHgubqHUgV/UMsVkCYnMao8BAMjtIjn6rOICkC4SS0AsRyEbIphl
	 GX1JNob9YNFmmUdRABMRcCi5O4OiVW4c23Qva/4TVYggIHrBAL0ccw4+rYzV+TGPkf
	 4tVLlxUSgW8xRmVj9nV1tItgEQmL8BhkhBZOnPX0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9BDBF80567;
	Wed,  5 Apr 2023 09:20:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF67BF80423; Tue,  4 Apr 2023 14:45:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2605F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2605F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=B05bIIfW;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=H1c4CoG8
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id CB0BE582194;
	Tue,  4 Apr 2023 08:45:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612307; x=1680619507; bh=OHFDfhQuc95iHkehHAOC6PONM98Zf6ErMh2
	GNLEayNw=; b=B05bIIfWOrfbYemuJ194UOoZDq2FM6kHz3QkeLy3kqGilC5YL1o
	QvGDjWjuDnkdQQYR6egSbFos0uavZjllkqOWMzDwaS2StgGpSJfZAvXf/mAFf6Dy
	Hjw/8CH0Wyks8aD0UyVAwkSNNjWI6ZtlnJ666sNi5x0i9x6aNBwIHp/k8abk+vre
	lcziAsBVaSJhtmLdK+Ok5VHR10FHz/+ZCRKaz2DSP64IihVe5KSAPI69Svjj1H/j
	zvC5YE8LGs5KulaQ1jpaYsKLW4EeIWXJhyTfKBZ67eEsdxtTSbWhSztUUknxiJbk
	KFqxpxHbtT0aQF5wTJ/HRhctQKOvf5yT4Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612307; x=1680619507; bh=OHFDfhQuc95iHkehHAOC6PONM98Zf6ErMh2
	GNLEayNw=; b=H1c4CoG8Vd2Kgslj5qzKuNtEnV/jVFpbBb9rmpTHbvsNR+g7Fvx
	BCJ6UNTzvAMwUdrCHtkfQGsHMd/Dhrafl223K8RqF70AxUcBYwhB6IrfKd6k5rkk
	RJrR+4ho4gqcfuIg+PR+/ZSqvo5zoQqaXOntwL7rHwKHQMCeNZZEl/CC20KAXPl2
	zIy9S9RTEbmeGoRhOSX8ALkwxrBNWAQxdbQmeNc0KZPiPaaxA4oWp7/NyVs109ly
	5CGRTGKn8Qa+yJhHBp6Sn1N1Q89vN1LNDwspFnRMOMFXEj01E42bPyslNgzZxESk
	b0FyXTS6GLw/74wiXZubTkGWfsqn2n3yRBg==
X-ME-Sender: <xms:0xssZACxfG2ri_Aqb5RG91e3jF49aXkXrNnm2z2gTQf7h8nFXTZKgA>
    <xme:0xssZCh5ExkDWfc4ocBop9UWzY_QaIDxrFBVZbAyADYgjJ2KHl2iUzXljey87oA44
    d27LemCkBnY_cGbKV4>
X-ME-Received: 
 <xmr:0xssZDneZIT2xke4U379cz0mYB0Wro5hwtQcYv2887EqJe_ChH5gyAGORj_DBPV5_TKVzDwdo18n582_DSuXmEgMKtk_-Bc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0xssZGxACY6WatEvC0OCzmwHgSSuH1xPlFiJi1CB5mQ1QdgTmbgkew>
    <xmx:0xssZFQ6pREX46j6olSWeKqZyasNQ3hyPeKKVX1UK7Rj14iG9y_0KQ>
    <xmx:0xssZBbqFxR58hij5h23_5JW1sC-sDoDah8dsbi5ykhPX0AaGVsJSA>
    <xmx:0xssZJcLxAZcVycX-T0_EOpjDBJzfMwBnFAEWTDFG95_hVjO-8E9LQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:22 +0200
Subject: [PATCH v3 32/65] clk: tegra: super: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-32-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7MyP2GPGennrs6JFmJIGpKWEw9VpMS3F/dGkDZ/Ald0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ex6W47t13uZ3FPXbzV78Cg6voZB9T1m/mkeXMvTtBc
 vHleRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCfJ3hN6vT4TJ/rqVeUoffHbQ8O2
 Un190jMfMy7qTXSsjM5FAoYWL4K3T/vOcFVYlrTtzZS52lZurvY3q0covYIR6DpomfywXXsAAA
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
Message-ID-Hash: ZUWJOG35RB7UYGTYMODBPQRLNIRTMBTQ
X-Message-ID-Hash: ZUWJOG35RB7UYGTYMODBPQRLNIRTMBTQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUWJOG35RB7UYGTYMODBPQRLNIRTMBTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Tegra super mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index a98a420398fa..8ad62e04fd8b 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -136,6 +136,7 @@ static void clk_super_mux_restore_context(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_super_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.restore_context = clk_super_mux_restore_context,
@@ -212,7 +213,7 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 
 	init.name = name;
 	init.ops = &tegra_clk_super_mux_ops;
-	init.flags = flags;
+	init.flags = flags | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 

-- 
2.39.2

