Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E16D753D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E570A82A;
	Wed,  5 Apr 2023 09:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E570A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679433;
	bh=nHFT8J72AoGj4V6+skDplqn3EtB7EQSXpeMgfWeo/bo=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KN3T3JM0fiomn2BGTkrdzF0VVpwS3UWcWs/VxhiPvmV5dpDrAhHp1OzYl9akGOt57
	 AVgqeKtcMFZNwt3R4uQJeDcUAsXQ/DWVoDLscnVDIoy5iRXa1g9lHjUigYVwiStMRA
	 ksjUnKKrEHUM3nLm1JIDWDti4Q9awBMAn6Pmp7j8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE618F805D9;
	Wed,  5 Apr 2023 09:18:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94FC0F8024C; Tue,  4 Apr 2023 14:44:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CB421F8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB421F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=ANkOfMW5;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=X2tVHlRp
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2FD84582143;
	Tue,  4 Apr 2023 08:44:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612283; x=1680619483; bh=ApJxLezZer7ASz5GXHma22BHXZ2riie998B
	Coi0Kk/U=; b=ANkOfMW5ONwzujh688xWk81+kYre9p0ejW9X0e8FMbUVANwq7Jd
	45nBsWLOTVAFNqrYvCnyYNLqQmDYNna9L2jtj/GJS7BtWmGwr97ghfiFLdvtMLTQ
	MridNKhSUjgV+nnIYzU/GHV0CMKd7v0Yy9IuV8dPnE6x8GRhJe/pc9hDrbXFc3Qt
	T/W6J/z3n8ny/yTqhxopBbeSPYR2f082oJ2kWuLar3MW6UTLr5eFsNNgIxKbxOoG
	vWmCeBnv42PAPSiqurq+wPbE+S7iCYpWBKbWrTJLnfEWqd/jmKQM/Qq1xmd1R7jb
	a/0tMEqIUuvt+gvpAYZNB8O2XowDgzLsD2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612283; x=1680619483; bh=ApJxLezZer7ASz5GXHma22BHXZ2riie998B
	Coi0Kk/U=; b=X2tVHlRpwC4KpLgV59YL3AcNf2vy9SCwO+jQ4BUDzlTrSo4cxfG
	WtDYPXzosgWZINcpRbbwFDmCqbGHbiXrs3DFj37fS9revj3LKYpyfk2MSg7Yq2SF
	dfwPYNW/VzO30VGd3mRHpY1pJHXUDgKDeXcXSdt6mJfANYiDI4blLnzDsTp/WzEN
	h3xB/oM8n5OEybVeFtTBV7rtJX3xTYNkYQGA32xmQmmlPmcJwVtAOHXtGM/UCbd4
	FzCbvX6MBm3KhlbI5ZP6B88XWoY8dO/rfxeDRnXqAqXFYANjjGYkX9A4JKADc7d/
	TVMrjhOq14mh67qhxXYgskoz1yG3frd+WKw==
X-ME-Sender: <xms:uhssZB9ZEBRDwaT3Uutwr4rZe5-wiW8oOqVEFhXH2Vv6mFedxVwQpg>
    <xme:uhssZFvokY2JKNC6ziu4buHe50olxGYex_DfUYrmncBqAvu26-f_m8Tu4M3SQYK89
    uzU9BH8FPNF-p23yU0>
X-ME-Received: 
 <xmr:uhssZPAIJnNdSD0Ncfitd6nO8X1-CKeuolp0wAbn6CwHaMUXh2x6RD7A0weOdZu_f6NMHtAc6EYQNvUZxvmX6O3DV8YG5BQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uhssZFfaXNVCr7AMfCo5W5B8FJirrU3SbJmLoGydmvqt85gnGmRU6w>
    <xmx:uhssZGPlKjsloz7V8iy-qfuiCu95NgwR7cyXGj9uk8JU-L97npRU0w>
    <xmx:uhssZHk5hY3-PVaVwhdmTG80wcxiFaZUdqG9zG56e2opg86ZT01O-A>
    <xmx:uxssZL7IrrxI3R2uMpl5_nSdJ5eqlaULWa_yc1aYBhnWPSgeZwpwSw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:44:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:14 +0200
Subject: [PATCH v3 24/65] clk: imx: fixup-mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-24-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=nHFT8J72AoGj4V6+skDplqn3EtB7EQSXpeMgfWeo/bo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cqT5643XLpvwXnew8c5FQ54DWhinOvVHGycfyLZWbl
 qXyPO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR5RmMDNc1BVfZphf+eCQWGzyf08
 BnRt3Mh8+bSpyKfyjf0tjl18zIMHnluQJu4QDNeSdyvVOZQg8dEwrfLHK31syP0zmk3b2aHwA=
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
Message-ID-Hash: L6IUNA7D4PHZFUD5WYQOOYWHNJXDAEES
X-Message-ID-Hash: L6IUNA7D4PHZFUD5WYQOOYWHNJXDAEES
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:11 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6IUNA7D4PHZFUD5WYQOOYWHNJXDAEES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
2.39.2

