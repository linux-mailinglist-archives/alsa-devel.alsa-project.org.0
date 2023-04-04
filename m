Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4B6D7539
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11092852;
	Wed,  5 Apr 2023 09:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11092852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679373;
	bh=utithzISL6/XPhGmUQu4qYiVhTK9xJ+xmbkbSMagrCk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiOOUBlojHTQiR57VOeozcteIcgAJVfIjxvNBOjNAkDLDx9iJ9UpQV7wL4oIo8eNM
	 ppwc7szt0eLkX4dlbtdMnl4FOa1GWM/UnwioVkV0v4IMGskU3tCksyh95mMrYo/uBj
	 uCwiUr+uusepdI2In7+5f5cSrFGrFv76lMvSjo5M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24094F80542;
	Wed,  5 Apr 2023 09:18:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2C18F80423; Tue,  4 Apr 2023 14:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D2AFF8024C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D2AFF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=Vv5mOQOK;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jvwNaRMY
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id C199A582093;
	Tue,  4 Apr 2023 08:34:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 08:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611640; x=1680618840; bh=o+OQnLpJCCiwmnk+lu4hNKvy3ldBNEpHSiF
	2EVuNWrw=; b=Vv5mOQOK6GqYKsXZhaDRRGnogUYmOWzpL0+oPX228bsNMy0GT5y
	IDv4+zGaRyNZMISm4ZkDjDqN64KDKK9ue0dvTG0tA/STDGjJAHNwj2AT7kbp3zL+
	3TK+XjC3kTZ39yfL42vn9pDhzjSb9sdpCEjQ0s6UsbXSN1j0JrfulscAV+iK5+H/
	qI4X31sljo0ipj9VbVNH6TJzf4PdXIQ2RwNHOY9nvqpsFn1iw4zQ7AsRhv3sWIH0
	RTwcc2EkG9wtlaiMXKHeAB32cBi0knHP4jnZihtRN6FqAqi57kgd8lY8EOIJVZQy
	ISOiRkmkJNQ8HCOZ7If1C90P5EX0I0jDuxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611640; x=1680618840; bh=o+OQnLpJCCiwmnk+lu4hNKvy3ldBNEpHSiF
	2EVuNWrw=; b=jvwNaRMYpiKcIImHYx3fUYeRkvnBREkVTZiMIcM3vpHLnA5MQAw
	dHInOGAzviFHCBRdelYoI32OC0V4Wu92y6lrBQzSRpwRxByaY1wa6qQUrMMFqEct
	irY0SeiiTASzR+UhXX7wBiBt5o+Etf1WRxR1zDeRBc9Db486qDFioanzBqBzdVzm
	QdrOcxJxhDV1ue1nnTk/sNwA+AQ4As9Uh+JhGBxItGzrU730KOKAQyEDr6v2aZSU
	N6uWf7xSc0RZ0nZR4iGZwH/PL0PeMY+G74d0itft2P/176H8u9xfqeTTS5h/cqfi
	jAu14plMUQgUxigzFFTK8u27AxcsMuraAhA==
X-ME-Sender: <xms:NhksZCkh63te2D71qbUIrEn6R5uvFX2wZniVfu1SizGfejFdNK8-zA>
    <xme:NhksZJ0QqmrCRDIxxwoiVIVDPHitgiRsO0Q61sHGjbqPgKzDifY3GJqNaRI361ex9
    gy7ZMfAbtcYVY1Kydo>
X-ME-Received: 
 <xmr:NhksZAp5cqPR1eU1KSJNSj2jQalF9lpYaygmE5Rgu8T1vrgQKhIjtJNTHcSTTEGKgWpKp8grENFK1XEwnYMWLiu63_wfC40>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NhksZGnxl_bVVCnVGNyL6aFKGbWm3tVo8tNFh7aKX47KU8zPbCYv5w>
    <xmx:NhksZA3kpVg8p2YtOu4UqxGHJQzhhcni8fDyXpRWCuAyEOrTug5pGg>
    <xmx:NhksZNtjaMzBDhkaJ5pst-Tvc63Rtn6WlYW1UwUJUOFcpQoT9LqC3A>
    <xmx:OBksZHh0vIuFIZMpbt-UsjwvGeyE7PdPqIb3MKqM2buJqWP25WqfDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:33:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:01 +0200
Subject: [PATCH v3 11/65] clk: k210: aclk: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-11-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=utithzISL6/XPhGmUQu4qYiVhTK9xJ+xmbkbSMagrCk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eey66s69xk4OgiNH0bz7VYH9eVbEyzT+a6nV0wZ8P5
 r4YMHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjI4leMDA83z/XqdGq66b1crFDYPX
 nTDp/kj1JhG01OGKwJ3MK1PpCR4cPuc38L62b6Cs4VeODYW7txwrWICSERpcVGK5lbuju6uQE=
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
Message-ID-Hash: ITNKR36WX25YBHNCH6NT3AOPQLLKV3FY
X-Message-ID-Hash: ITNKR36WX25YBHNCH6NT3AOPQLLKV3FY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITNKR36WX25YBHNCH6NT3AOPQLLKV3FY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The K210 ACLK clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-k210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index a96ab8611e1f..4cd6544ab102 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -639,6 +639,7 @@ static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops k210_aclk_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_aclk_set_parent,
 	.get_parent	= k210_aclk_get_parent,
 	.recalc_rate	= k210_aclk_get_rate,
@@ -661,6 +662,7 @@ static int __init k210_register_aclk(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = 2;
 	init.ops = &k210_aclk_ops;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	ksc->aclk.init = &init;
 
 	ret = of_clk_hw_register(np, &ksc->aclk);

-- 
2.39.2

