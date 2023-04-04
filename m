Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F8C6D7543
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71FB0DEE;
	Wed,  5 Apr 2023 09:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71FB0DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679516;
	bh=8Km0CrpWxsFcVAp2kINpJrrlBcw9+tdYcLQIcmEJtqU=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvW4i9VxqfF+A0mp7z9zRh4xQfNPgEu9TWn6f7lZa/OVTD7uE4vKuQhZJ3MP4aau9
	 ILs5YpEKkvqAmtcjd7L5lqLMuCXlqXGMkERol0ud1Bgs5vsgfUz8V3ZEPS3fjW2xFo
	 fFVHBfybiXvQTEgq43RfHLgYWme9Ona7KO62U99A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06338F805EE;
	Wed,  5 Apr 2023 09:18:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38716F8028B; Tue,  4 Apr 2023 14:45:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 04BA9F8026D
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04BA9F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=pn3rLY0V;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EBeBNg8d
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2B25F582182;
	Tue,  4 Apr 2023 08:44:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 08:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612298; x=1680619498; bh=vpuXaK28hbYMZ7uB1gieYBxYHTVqC51X75g
	f751mpyU=; b=pn3rLY0VTuXhheDYVQ2hppMP90DwOlde8tPJCrdJKF0U+nCMR56
	V0slN+PpGTgETEZQ1wE/1AwLVhMv5g+/doTjyVpTHLrL7OGSsApeqkpRf5IcwS7E
	qqiLzMrftESNTmRc5pziTaf8NN6Id6H+VvOsOW+yHC34fG86CGGgqKwYh+Od9zRq
	PJrVuSGNYguq5KSGerHisRJ8P59TWd5L20yDF7nTj5tyknw2tRTUMWjrMSpdfUBw
	vhQSQaKxUi7D77kQ8WsW8zV3cUa5mlok5qlsYi4ijl3T8YIrIv/YmXwlUydA0dyG
	wDZik2tYLytPvJ1+1k0oNItYBbasUvqsgXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612298; x=1680619498; bh=vpuXaK28hbYMZ7uB1gieYBxYHTVqC51X75g
	f751mpyU=; b=EBeBNg8dgzUJEBbSmzMl+0FebttkVgHRinGeFavNoFoRSUbqKZg
	7Vqza7DeP4sxAEu7XdNZuIXOZx0ReT96oD1h2jjzvz2sFv69QTNDS+GODWaWx4rS
	ABTA5qrZqvD93K69XYHvBQ5yNyfY9d+QJE//cyIHjnCw8bokOxg66tSXue6Homu3
	YfayHS/ve6GSoxeaS975znHq4552ha9WRZA3Q6Z0SBBfJ7dqvFromg3MUM5SINAo
	z8YynkMmSTO588dDWtTFjnxiEwl0LiohMIe1sURXdfjTjB8zvVWksD853YqJFPU/
	bOwF440WCncvBEdzDwCgvQ5jj0kP7m6Sjww==
X-ME-Sender: <xms:yRssZB3wHMpOcH5gAPVOT_XzomhafCpz-NXCxMkLt-tMbcSYqkMSoQ>
    <xme:yRssZIFmvtYyk5mkayjcUAvm5kXqC9MSZrVQcjTsXd9Df4vF6mHHRrokY9wDaGKHh
    497tJdNWAVrNtdbZTA>
X-ME-Received: 
 <xmr:yRssZB7jddMPLVCOG9HZncs5FlMDuhGrD9k2GgLu1qes8poZCnVocAkK6x3aaH2ytLVZITMCw1-_sobK4jTX-yV_JHRG198>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yhssZO0TypvE_T75Fx2dr9fd38cVNuy5vpEkuEfyu52bsndhAvVsgQ>
    <xmx:yhssZEEusQNNjAlOHUaxJpdMsbok1cOEIgKu2Hnf0qgrpuNFOdIj_g>
    <xmx:yhssZP-z0UT9FS3YIVwSPLKX4dlhP3NmuZyasgb46eFNJdOXAeUoOg>
    <xmx:yhssZMzT6jaks5ilH-UItHxv7n7oplbcmh46D_i3QrErHrXkp4I2Og>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:44:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:19 +0200
Subject: [PATCH v3 29/65] clk: socfpga: gate: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-29-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8Km0CrpWxsFcVAp2kINpJrrlBcw9+tdYcLQIcmEJtqU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eJvL+l0Gm6//9yU0uB7xbJ85Okm3iuZEz8yFJ0wnbF
 /mufOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR0m6G/6GTozOj7Lb88pN39OrXl7
 /5qfPhLnnL13Zq2ixuKVoX1zIydK2qvL550z7TLbqhdY/TJr/OT48/4NrnvF1Z/fBBMb5cJgA=
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
Message-ID-Hash: ERWVBBEHWEQXI7FXLDR6VYTWZ75QTE33
X-Message-ID-Hash: ERWVBBEHWEQXI7FXLDR6VYTWZ75QTE33
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:12 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERWVBBEHWEQXI7FXLDR6VYTWZ75QTE33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SoCFGPA gate clock implements a mux with a set_parent hook, but
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
 drivers/clk/socfpga/clk-gate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 32ccda960f28..cbba8462a09e 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 
 static struct clk_ops gateclk_ops = {
 	.recalc_rate = socfpga_clk_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = socfpga_clk_get_parent,
 	.set_parent = socfpga_clk_set_parent,
 };
@@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device_node *node)
 
 	init.name = clk_name;
 	init.ops = ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
 	if (init.num_parents < 2) {

-- 
2.39.2

