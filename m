Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565FC6D7523
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E18200;
	Wed,  5 Apr 2023 09:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E18200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679145;
	bh=Lg/brXNdE1g9siAzXUI7jZQhQ+BR+hmAKU9lQUCbDLU=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ks8sN2OSd1jRETyh8aDWUtFa/BE9r4s1ytU6T2osz1vqL7aorjy2/uY/vUrpMi6eY
	 PVDZLiVuNOSQxK7g115sehxFpx1hFOKrnFRJpgvHK7hg7SIPVqDLtoM8KQjRY1TKK9
	 D3FxX0mggAhzwFIINKJ44UtSeAp7o4Q4oCmKh/kc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22352F8055B;
	Wed,  5 Apr 2023 09:16:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01DA0F80423; Tue,  4 Apr 2023 12:22:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 79021F80534
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79021F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=BLFyrB97;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XhEHYYk1
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5621F58214A;
	Tue,  4 Apr 2023 06:22:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 04 Apr 2023 06:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680603740; x=1680610940; bh=7i/Ab+kXgxVSz3G6M0zpfnoNQPldDWBWa8x
	D+C440h4=; b=BLFyrB97Jv1YShK1/5/T70wP48oMhwtjL6xAMeqnDAaQSiteUv9
	qWO0++teV+/3FWUx3+KiGDy6yZnzYtHTZwvFmlZeI1FWUvTMZTJMJ1VBEzMXipl8
	3bVeemB6fNrhZEpfPmRkwr00PnPMNpcPM0upEcl5kbW/F44lUZQpcswsAZS4d0rl
	3SXb6EZ6+qM2zqNWboYmeovIpwdGjVtGVR0mSc8ns/o8WydSJcDvWGD0rVjMMWbm
	hmbJr5FADyoBs/ec3WZoQ7Hegf5oCMGLwFSI8zqZF0xJNQIFOj7N3vK9MoOHF06K
	Nuar0hUiDU0I38WlUFhPFCFCLBiB/UliZJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680603740; x=1680610940; bh=7i/Ab+kXgxVSz3G6M0zpfnoNQPldDWBWa8x
	D+C440h4=; b=XhEHYYk1BAJaNN/M/XsU9toylC7HwzJdVG37H+mkuuX7Ol//y/C
	O8LjHdEtyNVFVfOvVzlrdVgNGQge2wD8G2PGYC9MQy/AQw3GL682+KHb5TPvJWmo
	4EjDk2q7EngUSw2xh6Kkh0YxMoKHtxOjsbhi5CPLtlhYJQP6TOT6+9sX/DwBvZ2g
	duY1aF4bHby9O7X0KnA8Kkeh1/7EZ8Hj5Iyy4wR/+nNenoVmVB4IH17eKV2qRDuP
	ErGBU3Myn78+I9c0OUD0e1GgjWnx4q6rB6mBznJm9uSA2ukOyvD37Mry5iyir4xb
	J80IMMgmJa9wqbBnXlqj27wN40KX97x0Nrw==
X-ME-Sender: <xms:XPorZKJ9u2Ksy9rRZnE8a3JPnbQd98mT_JmtmzogHSlqv7hu2tR20g>
    <xme:XPorZCImAhKx9oOR9fEdNbZs97k5GCwHlEvdS5aQvSBDT8s7nshJx0rG6X6i82tC-
    2-V03o40UNhTjgwfC8>
X-ME-Received: 
 <xmr:XPorZKsg5TOEtI7QCD8__GeVOUACWPgRPZMeAS3MhlPCXFXKcn1qX1dQ8q1diBI1e4tQGCHzuoNXLJvbhwIvrsAxWkEMT-4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XPorZPb2b6AodSj6NC8ZrCY_3xuHhm_wBGT2EpedWt3mOTfLB3HwwA>
    <xmx:XPorZBbvmCJouG-ABpB0vGhIXNA6g1PFiJ7TRW0AcD9BkJKrt7nw2g>
    <xmx:XPorZLAsGh9Zwe3W2fG6yMTf2RtrR2NCqL78BZUTcUOwQT3ncWcQNQ>
    <xmx:XPorZCmHiKHJrh-bM6VJf3vlChJzF648YBGa0MBU6pqwUyzm-LrENQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:57 +0200
Subject: [PATCH v3 07/65] clk: at91: sckc: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Lg/brXNdE1g9siAzXUI7jZQhQ+BR+hmAKU9lQUCbDLU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37csuiyvqSFuzlpet8JtVtfVhVxPzhxOk7zqMqHkHqNi
 +oXWjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkYRMjw55fIddF3mx5YN1fNH3tlY
 SwSCMPpcXFEvY71YsuXvu04RIjQ+fMOdlzPomLZlaeTw7YvvLC9gXfFooXvfxQvfSd4kqFREYA
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
Message-ID-Hash: TAJE7BNR5YQD6A4S7BKHERV4MTX7GE5M
X-Message-ID-Hash: TAJE7BNR5YQD6A4S7BKHERV4MTX7GE5M
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:13:27 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAJE7BNR5YQD6A4S7BKHERV4MTX7GE5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SAM9x5 slow clock implements a mux with a set_parent hook, but
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
 drivers/clk/at91/sckc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index fdc9b669f8a7..9c42961a8a2f 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -310,6 +310,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops sam9x5_slow_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_sam9x5_slow_set_parent,
 	.get_parent = clk_sam9x5_slow_get_parent,
 };
@@ -337,7 +338,7 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 	init.ops = &sam9x5_slow_ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 
 	slowck->hw.init = &init;
 	slowck->sckcr = sckcr;

-- 
2.39.2

