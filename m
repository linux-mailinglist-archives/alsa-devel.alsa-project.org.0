Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7ED6D7522
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E6682E;
	Wed,  5 Apr 2023 09:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E6682E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679131;
	bh=Xh8bEjy8TDiL4VFAVsU/ZEQPgP24I3rJw/jGgVS+vnY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k400+nb0Ot9LwBPvGiVzI5ReJm4icQ9puN5TCwjXCm1auBpKcIZfL73c4uyRV7UxW
	 gyqmNsfIXHbUBnRzVyXU3K0r6rWZDU3N7FT6TOnTTxzbw4bDOHxrTC8P19cFAuQecZ
	 UZB23qqFbxJFIZ5dB4iuRBSrk/2uAtNgOHKvgZyE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 788B1F80553;
	Wed,  5 Apr 2023 09:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C417DF80529; Tue,  4 Apr 2023 12:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08A8DF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A8DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=JkGpuXf5;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=L5zzTAdn
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 26F6C58214E;
	Tue,  4 Apr 2023 06:22:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 06:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680603737; x=1680610937; bh=j/4Jzg911PH5jjxhbLAbKUQE+Sv3FHKLbVL
	okffvEoA=; b=JkGpuXf5kOkD5AZj3GN9zcq9qsUW/llAg/PnM7dHH3l5pfUg1PV
	6xQZ0B0vMIaC6oegv+70SZQ8GCCI5s9dzX1cPV9r111C/p0WmO57qXgDtO1Z9Jew
	oFjh2aju3fphjyBUAbAs52RzGD+eq6OuuuZpDVsfq2h5QNaG9BJP5VpVh+ZMhVWG
	fvw+5G2H8QCE0ZibuFRAEUAFlIV1vw99DKYxBU0/A453CrxpN8cMCqeHYepU08Vc
	PrpPwd9Bp79xtfFI69WWwkuVzSpgaDbe588oRNPewdNIkBGJDzqKXO4EM6i+GGvA
	fCMsfpNwVAqBWmxM8XLbXODtWO4QM5Mo8KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680603737; x=1680610937; bh=j/4Jzg911PH5jjxhbLAbKUQE+Sv3FHKLbVL
	okffvEoA=; b=L5zzTAdnvcc7gnqyFiT3Ud/dmeVcukmC9ToDqgj48qoFTyPyKGJ
	gQWdsRZ6i54p9N1Ug1j9LZELUe+WveA+qe8omV01XOGRj93g8s5kS7MEZ+S8/IQi
	OQE9m/zttQyD+wtYj75SVdS+R+Dd3hT/2LpgsBCU0u1fWfj7Fj2xphBZ8Ifd/x7+
	RwgvAOUeMVPb6ktI6cnecle5RJygSFn8SBkrlh56j+KfKhpKYTnHioXKlzfppUuR
	CiYz9kLnn/tJn1+EgzDPDzBteg2nVvMJELXTzGOCd6vJL6DwSGO3/DgKd6WoERUV
	w00mYL0delGhwlv7LIlsFmk7atzI9S2xFrg==
X-ME-Sender: <xms:WPorZENifR29kIrwam2-OJ39f-Rjav8E3oDCtN8GapAwFkXoEoN23w>
    <xme:WPorZK8kZSzF5ktcahGlgM5KDqlI_OETVWLU268j_muPgNGsxWvt44Fd3xa4bQ-eo
    1k4aFxmCpiT_OgzuGo>
X-ME-Received: 
 <xmr:WPorZLQwulBuad8b-5iM2WJI8L6HmW5HTCEHCK8plrrRP_otDi5UvV08LcG2L02Jko8Toi-Gu6z4bjPERsexopALFiaycak>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WforZMvg2-m2sYIDoqZeXSEgVPvlcl-dL9xy5GqN34pTra00GRsQbg>
    <xmx:WforZMfc_J_wLcxuXq848Pa1P4cmAqGCOa8bczf9JAKSQpK1-GQXhg>
    <xmx:WforZA1nX-cW_hc0jE62v66L_kYYgO2ahk6tgucQg7JM9AVvUaPD0w>
    <xmx:WforZMJw7h4P0FAk6lLAhAONeE_b1omQa_Ci3yvtT8XDJSAYB3SaKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:56 +0200
Subject: [PATCH v3 06/65] clk: at91: main: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-6-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Xh8bEjy8TDiL4VFAVsU/ZEQPgP24I3rJw/jGgVS+vnY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ccSOrqmRR2/YP9jbxwtrj6tUvioqtXTXG8buIjNfWF
 n/CejlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkqZHhn/qdxIy2n/f/N1kVLg3ax3
 qy+9f9ky7TvitvmtsubB7SIcTIcE722J5XShPLr/HoeFiHfGy/F6Rju1woqu34+dcVJ7908QEA
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
Message-ID-Hash: UAP2HBLFBRUTISPJWWZGAWYL3WK2ZAWK
X-Message-ID-Hash: UAP2HBLFBRUTISPJWWZGAWYL3WK2ZAWK
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:13:26 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAP2HBLFBRUTISPJWWZGAWYL3WK2ZAWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SAM9x5 main clock implements a mux with a set_parent hook, but
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
 drivers/clk/at91/clk-main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 8601b27c1ae0..e04e72394632 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -533,6 +533,7 @@ static const struct clk_ops sam9x5_main_ops = {
 	.prepare = clk_sam9x5_main_prepare,
 	.is_prepared = clk_sam9x5_main_is_prepared,
 	.recalc_rate = clk_sam9x5_main_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sam9x5_main_set_parent,
 	.get_parent = clk_sam9x5_main_get_parent,
 	.save_context = clk_sam9x5_main_save_context,
@@ -565,7 +566,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 	init.ops = &sam9x5_main_ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = CLK_SET_PARENT_GATE;
+	init.flags = CLK_SET_PARENT_GATE | CLK_SET_RATE_NO_REPARENT;
 
 	clkmain->hw.init = &init;
 	clkmain->regmap = regmap;

-- 
2.39.2

