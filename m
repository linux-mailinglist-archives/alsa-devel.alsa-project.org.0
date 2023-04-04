Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A36D7550
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B655FE88;
	Wed,  5 Apr 2023 09:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B655FE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679659;
	bh=JQSTFMJLoT+23FQjGZTzhN+eYIN/szkjs6l6H5EcB7o=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eb6sAOZq5blxiudFqoreg7YoqBfmGi8r7Ifz9SOh5GtVe6XY/zQm7kakowOi9ZmIC
	 URAVGf4/o51Ynv3utG3j9NXc2k0dcMiRwAEeIPKmrKE4HRZ/UFLlPAoJDoShcGWGyK
	 DKRAkxa+2mewkqw+CaNAFX26y5o551PTwaxMZEpE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C81F805AB;
	Wed,  5 Apr 2023 09:20:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A25A8F8028B; Tue,  4 Apr 2023 15:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0C3AF80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C3AF80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=m/DfsQmA;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XI81MScU
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 22F96581F6B;
	Tue,  4 Apr 2023 09:32:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680615162; x=1680622362; bh=vrfzoheDDKqftYvuykRmc8QiWwzudHZE2qX
	zjDQOLxM=; b=m/DfsQmAQRF+rJw0HonZCfszHHerFFcnDOr2l/WnVous8juq0Vz
	Xj/GFFoezm/cVfAzLSONhVny5pszKi/Yl/d6+0riAT0jHaf2A4eIa0LrCDKMCSEk
	vgVeCTDcQFX/bPmy1j2PaxY72prdDJ23WOlqR2wCKICDKQ5JdLyHIyTZFdUDftFk
	SARFMOB383uJcsBsML39zgqHQRfCGUfL1CE28aEqUHYQydj2fTi5Gtk02ZekzluL
	Z9cSojtLX9XtEU6M4z54f9zSJwb9YqbUOyRHtvmk/CSbGtTAiY49TKOtlMPIWllt
	zHQ1wBV7BmEDUMnxwalqwBo9aVrjS47By7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680615162; x=1680622362; bh=vrfzoheDDKqftYvuykRmc8QiWwzudHZE2qX
	zjDQOLxM=; b=XI81MScU/bNDKOoe0KCzFM0XgUJOz2U3n4N3opocW077rGp3Gyi
	Jgamyb0BFj3aT7RhazL/FC078PplH5UVPsQgs06b1jfcRxwtUUfwIukQSU9BfIup
	Lfl1c73o/z77rqt5YzjhBmOUbymF5yoB3FKAh5I2sEqJd7YaAULlDQKBbQmQiYe+
	djkVAOz8mRTVKHvb5pbnJRruI9ATAYw3nP/mu6XR3ZCuJPBM6xvcnEVGp3toS6jB
	nwRa03TgWYxWPn1iqRUSf4t4BQZO4IztbQ9WIJrZ0m8Z3HpnatMA6776Rzp1yMN+
	AFDpEyYuJX9d2lfoX9QDjljIuJsFuZIRhNA==
X-ME-Sender: <xms:-CYsZC08spgEPV9rjBdVKDTCSlwSkn7-iqBVJ7cnxM91WrCRGN_YRg>
    <xme:-CYsZFEpZu13i_yGe5phyly0EsCyU6RR7BCMmiVOL3IzgnyxJZzHKDtH1WdaGL_kL
    vR4THseGf1wBc_LC3Q>
X-ME-Received: 
 <xmr:-CYsZK61qik7F94_LZwDTdqa5cXngqFSsBq4FuJLuJ1tDVAcq2a8rH2pClj9byb3gVx8xaM3dEtssOb0wZYO7pjRwJMe-Vk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-CYsZD0bNcINFGIpKgEaUh2KorcYbpY1yVkJYHLHs7FNTtz_3VVSBg>
    <xmx:-CYsZFErlaVw96orIPLm0LAy-JkcHSD-L_FYj_jnzpNQl-meW1lL5A>
    <xmx:-CYsZM_TADPYKpHUi3ybJx_ZJjtkDtTOtNqDqwilQ7gWXe98aZW-SQ>
    <xmx:-iYsZFxf3FPLsOcicFZiv7bNpji03k3wqxxjOvCGgICu0C0Nag7F6w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:32:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:29 +0200
Subject: [PATCH v3 39/65] phy: cadence: torrent: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-39-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JQSTFMJLoT+23FQjGZTzhN+eYIN/szkjs6l6H5EcB7o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fFijD5XPuXPTMvqrdfZssl9Qs24adeXfvByhgx69GR
 GTejOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRojhGht35XrmzrA+2t7y6Uv11Xs
 D7S+FpcTolt9YF+D47rDx1VjnD/wr28PKXOzs6XiSafXoh0XfjUFTBnTMHWuvdv6ZIrj76gwEA
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
Message-ID-Hash: CYR3MOXP2ZB37J4CDF7UVEI7GE57U3EK
X-Message-ID-Hash: CYR3MOXP2ZB37J4CDF7UVEI7GE57U3EK
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:24 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYR3MOXP2ZB37J4CDF7UVEI7GE57U3EK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cadence Torrent refclk clock implements a mux with a set_parent
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 3831f596d50c..62e59d1bb9c3 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -1861,6 +1861,7 @@ static const struct clk_ops cdns_torrent_refclk_driver_ops = {
 	.enable = cdns_torrent_refclk_driver_enable,
 	.disable = cdns_torrent_refclk_driver_disable,
 	.is_enabled = cdns_torrent_refclk_driver_is_enabled,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdns_torrent_refclk_driver_set_parent,
 	.get_parent = cdns_torrent_refclk_driver_get_parent,
 };

-- 
2.39.2

