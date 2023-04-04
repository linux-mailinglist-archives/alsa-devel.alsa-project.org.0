Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9EA6D7551
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A625E8B;
	Wed,  5 Apr 2023 09:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A625E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679681;
	bh=KJ0m7KhNk3ZqSikj1NqJB8enXIM/KPxluwVcT/ZqeYM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zt/+A0osFxmHunkTb8/j+M8OnnCd7FMcG1xben9D1GS3k6Cvkjax0D0S6zc/modYv
	 HgveN1ycRUFS9qcezSG0lLiD6EtfBivY02vgbrTY41Tpn0Moamrhfdv/3RutRMhjnp
	 dTwuy+/7D6SiLhxt9U5Gwt1o1/OPFLs6Z/sAcwTs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 212A9F805F3;
	Wed,  5 Apr 2023 09:20:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1313F8026D; Tue,  4 Apr 2023 15:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B53FAF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53FAF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=rzKgnZxn;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GWmTcQ+W
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id E6ABC581F8B;
	Tue,  4 Apr 2023 09:32:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680615169; x=1680622369; bh=sPTwdBQk8uUKcSRaRMSmThBHaieWdvgI+8I
	8CW4DhTw=; b=rzKgnZxnlBaCOTBFoaOfQUHUmeyr2iV3dkntLiuqyPgwW3TE1h8
	jBJrn/Xw0RqwTMZUyRpMA+lGsjQxt46AHzKGix0wsWg77uS27iSjVL1MJzlBqVtO
	jUI6Z4QlANgYVfAuFS/YqnrShCikG/RtxoTo+Pdg/vQK0ixuwBgPv68Ir0zbod+l
	MdUXF9Te/woTMXMmXuiEwyfn7AlIJEiZfbPO2sAdSS977zk6pqXeyxnB3vsv5i7X
	ljuDQomV+eosJeFR1j1JV5h33W8aXJSEUA5lz6PxUkIZ3EHB/HTPR4uIamQFlv0m
	4I85eGSd1xzSkzSZ/MRtSowOKDwHxBYFkLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680615169; x=1680622369; bh=sPTwdBQk8uUKcSRaRMSmThBHaieWdvgI+8I
	8CW4DhTw=; b=GWmTcQ+W1+0x7cDNrAYaDAWy7IhYmIA3AeYEqEQPdjAT8Nlt+Jg
	/1dM+oG1QRGLQ4AkyPM8RSKg4qeBAJWUJ3lyUkwnxKqM0TytNlxcEOe3wuog2AB0
	nd5LeZDxaL3Mk9gBhNMHcG/GDBdeQOm0PjGAsqmZoj2iCd+JFmUniVHVt3rQz7ui
	4cznQ+mEWqMJqf0rtRCM/uYpk+6gOQpIQ3DTB3ijrrWP9brXgw2EuvbJF/nqGzS+
	jSYKHnV/rzkSJdhVzDFkXOlWL5Q5zV78wEQRmZIeeakbvs0frB4FEHJz/kcp2fbV
	53EqHtr5jiPnYe0w1Ar8/zpqAXmYIwmhcfQ==
X-ME-Sender: <xms:AScsZKpUqFkRlsijk5A_P0ZMFFYNPflGdlRbj9dzjv6O-mfNPhF-tg>
    <xme:AScsZIrkainRhD0UZ9HHXSgnyIMC_xlst58a_CFX2eZQy4lK9812Xk_t9G5ReIfHp
    fOsj_hAOhFZmGOA87U>
X-ME-Received: 
 <xmr:AScsZPOib_5NmgsPGmUCPVsDkZuSNWFkfomGQ1bpqm_mQmJ2_eeentybx4EwviqOW7o5vQSbDu-uQI5AsIKmdH1arVF85X0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AScsZJ4f1tiD-P4P9wRmGokCAIP9BQuYKHKPGRw0UtDZj2zrQiiKxg>
    <xmx:AScsZJ4ufxn1Fz1tRSzQkQ4gZdCuNbWeJxgrO_TOulCThfcOmbI7Rw>
    <xmx:AScsZJhpl525DMGv9o4cmUJXIcCTdDtHXbg-oSM6pJd1P3jmi1QHnw>
    <xmx:AScsZPH1WzsxCvYsfovqjnPQtQn3p8buNCQnrTTZLNF_5rkryYgX0w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:32:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:31 +0200
Subject: [PATCH v3 41/65] phy: ti: j721e-wiz: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-41-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KJ0m7KhNk3ZqSikj1NqJB8enXIM/KPxluwVcT/ZqeYM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ddK/yy4Pm27Ns7fjYLhlyZx5ix8vsNBX6eiTt6Z7dF
 XHkq0lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJODgxMhzqv3Xxa94pZZWyVq7rIr
 POWKzqUGd8kyYYWdb1YuNNl30M/yzVLi6z+fFSI/OqxrfZe/+9eftmSWKD/dnPZ6snxN6T7uABAA==
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
Message-ID-Hash: 6EEAFYMGTW7KLHXBKJXYJSJMI5P3QMHS
X-Message-ID-Hash: 6EEAFYMGTW7KLHXBKJXYJSJMI5P3QMHS
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:33 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6EEAFYMGTW7KLHXBKJXYJSJMI5P3QMHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TI J721e Wiz clock implements a mux with a set_parent
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
 drivers/phy/ti/phy-j721e-wiz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index d2fd2143450a..d97f161dfe0c 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -802,6 +802,7 @@ static int wiz_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops wiz_clk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = wiz_clk_mux_set_parent,
 	.get_parent = wiz_clk_mux_get_parent,
 };

-- 
2.39.2

