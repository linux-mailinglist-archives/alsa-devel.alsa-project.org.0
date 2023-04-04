Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A46D754E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC9EE7D;
	Wed,  5 Apr 2023 09:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC9EE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679647;
	bh=emCWDi8Q7v/nBEvpOPyhOffdcXDoO1tJu6NLHT7Pw0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uDLMQAsbyiHP2t5/02NP9e3lb2S3rLlzv7q4PfRXyYboE8N+6EGqDtwSaYGDHzRno
	 PvW5lyGiVrR/4jL4mR9ACK/pwAccUZZoFmpmUoieJ9BngmZsvyoWyo1k99kakH7exi
	 WzfFTO5M7//wzOFZft96HSfA3VfTqxLCY8In9qsM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F43AF805A8;
	Wed,  5 Apr 2023 09:20:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB511F8024C; Tue,  4 Apr 2023 14:54:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F74FF80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F74FF80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=Ye1oyDOV;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rNT1Hqod
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id D9E26582090;
	Tue,  4 Apr 2023 08:54:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612841; x=1680620041; bh=4NvJp7jYUED4O4aUShshRJGoUDX/FaepDgp
	PhaXdD/I=; b=Ye1oyDOVVUhC6pcS2ENQfOcf8EhgUU4DIPZkeGsgHcxDEcyiq1n
	fPv2C5s7zuBfpqoHqcGmF6OlEUpTCXO2PfYaMQOBLBLJ37sL0tiFwpxCxS33xats
	NkwMEiRyCsfMozpo/6jgxpoBP7SUbh++uzofP+yckN0B+kQcjRpH3lRpUmyGnNxd
	tB3DH2vJ5GtpXaIA6c095pG8uRMJCQF0av5yALbzIqW2CLrDTS543hEE0ShKrTUW
	oyuvTB4F5CMBmfKPlujr4RBGLos8S9W7fgyufPn29FeosXThUw5rsM4VuLmEyCI0
	pVnOLsSZ6T0PAxor9g1rXA6dX04bWiigl/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612841; x=1680620041; bh=4NvJp7jYUED4O4aUShshRJGoUDX/FaepDgp
	PhaXdD/I=; b=rNT1HqodPYK+/LS60v3Nt/wCfyi5JlbD4datIbSUiuZ/grTBSnU
	a8xfU4DBb0FQ3pmkXnDujMDuiCJZbG1BBiA7DKU7lU1kxjuRQey5GmUJ0Dz2Lgt/
	BM4ZXGMjGBXUO+40xYtt1cfT6B++tyo3xWz0jYZjBbjwCR69+pS1mKs+Pwssc5Xh
	PD+5R0vPZ3BIqQiz8DnDfHGN2jDCjD+NBiY1dixxJ5LxwXheXzWqqUH2nYWlnbOa
	TJJV7EfqyrpH6EpIv4XGE5J4a0qC9x+fEpGyYUvNZw6WOwECtLV5+CnFUxAyKzb4
	3uB+ICPt3gee+xM/epabHz+B5hqvoTxV3KA==
X-ME-Sender: <xms:5x0sZNcdVuUlLla0JA2KutcTkw8q0gSGSlBlfvUgObT5MIuduvmlUg>
    <xme:5x0sZLP6o0DQ-qG1VK_POKJUyWJaCgXgCEDaWI8o7HRpOAjgJ__u-dO1Nz8_igQwK
    BLfZGt0BFNsNRufdY0>
X-ME-Received: 
 <xmr:5x0sZGjocidVDNEGOa92b4XeXLrqyqybVMpRXAcTQziwTH70bax0LzWyqqZyYKhU2mzffOecGGKplXWMeur6H_jpv_kcYkY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5x0sZG_Qfb3zdZRiVuBaXPgVWFjtoYYJ793KmmICs2oqUquy0HcuwA>
    <xmx:5x0sZJs9bVyDWcirwlmqThhbh2l-1exQL1qyey_hlzjHv_y0oh8c-g>
    <xmx:5x0sZFEZpzV5ZUTvyLYGhIuBOUhtaG498impCO_NeNOhJUE5WOdw8A>
    <xmx:6R0sZLaX1l1EE8i8lmKEHLxInwetLLNkFpgU1V44xJoUwbYnRE7j-g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:53:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:28 +0200
Subject: [PATCH v3 38/65] phy: cadence: sierra: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-38-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=emCWDi8Q7v/nBEvpOPyhOffdcXDoO1tJu6NLHT7Pw0Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e9Mq+YuERpz7kyfgHzS492PO3q//LuRQkjG/tEp7Zv
 P/YwdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiG+IY/qmuP9x1pfrK3oD/0xnDxb
 Rnbsuv1d5+WGGPRVVlTK3UzrWMDO/F/jEkLhWKV4tRNJJf5Cu8fqqQqPfpejXrLZnWaV8UeQA=
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
Message-ID-Hash: 6S53VPTI6FCE242ORAAZX4P3ZWW6GW3E
X-Message-ID-Hash: 6S53VPTI6FCE242ORAAZX4P3ZWW6GW3E
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:23 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6S53VPTI6FCE242ORAAZX4P3ZWW6GW3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cadence Sierra PLL clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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
 drivers/phy/cadence/phy-cadence-sierra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index ab0a37618ef3..19a50247e305 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -716,6 +716,7 @@ static int cdns_sierra_pll_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cdns_sierra_pll_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdns_sierra_pll_mux_set_parent,
 	.get_parent = cdns_sierra_pll_mux_get_parent,
 };

-- 
2.39.2

