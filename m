Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3AF6FA165
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 575A212CD;
	Mon,  8 May 2023 09:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 575A212CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532099;
	bh=DTutEgCIMF28vydDZ/bIJ7FNCahxgFT27xgwey0IUAI=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q+aXkqSETaP8P3PSrK0zNdTwV+6wKKAd7Zp+ETxuYO4eGPLsXLQoXhixsx/4Ah9qR
	 f0p+IQXQaRsAhZ0Z9Ms3bfZri+9twrA0uPbocQmFjIIf2S9Jx4N+/7X1p7a4DsciF7
	 rEy1D8lC1qj7UOE4t5wQkllOaCYots6DOAMqnt5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB1F9F805B1;
	Mon,  8 May 2023 09:45:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34DE1F8052D; Fri,  5 May 2023 13:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38ABDF804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 13:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38ABDF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm2 header.b=KdaFzuUu;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DaRi2Hpz
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id EFE7D2B06795;
	Fri,  5 May 2023 07:25:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1683285930; x=
	1683293130; bh=l5ioAqLUIgJULjqwKYtOjHFnbY6yI6/LI8d0PR6VtyM=; b=K
	daFzuUu6XO2LaYjDTphcLLz/GlUPhIOw1rRn6yVXs3eyQLNaa181x0dHDbt9UdLo
	zyAvbbqqbqt6xguEWLq+Y7XvKxH8h67iwigmG6lIm0397Bk5HScfh1TsqFN0EDMr
	3LonuK2S0VmFCWYQyaihe+VAnSIiWWLNXU0vMykWBYLbu6ZIqboackHNE0IXfxIR
	as2IC7+5LWKRCXWB34eIBIQ7u+PTN6mMZnFqmo5giXRuFqZO+hVljeKHPIM7iSCJ
	w0/C/PvtZnSL78SBaiAHhHXczCOrVc7JURiYnvm0UtZtyN08Y927yIuZ51nxGJWJ
	3ecp+WM1vrDHFY4zIvbOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1683285930; x=1683293130; bh=l
	5ioAqLUIgJULjqwKYtOjHFnbY6yI6/LI8d0PR6VtyM=; b=DaRi2HpzSjUslNUfV
	+Wxt7duSO5/hYNA2h5A0t8XGQfdp9yTBEQp0yK08w8TSdvKz5sBGFEU2WxcXDYpT
	3cV8qLYkYFXwVAqSQn5mP0rQxnIN5rLXKyv6FoQpSeQftvNw+Pt0H8KyQbRBA+3V
	IQGGPQvZv/4gTkVAs5uVT8xAQFzSd1BxMmvHV0Sr/oJgrN2OTr53ytLWNCaT4ReU
	NGN4AezZPVD8DfXd3DwUFL/96oVoikCr64FddmnTRsceoj0N4vJIAsBSHvFmhCSS
	Bn/XfJIdxzHcBE7TecPZAQ9KKMBG4dR94DVecCEuaTQVrf4Dg/u7t7NWBo5iw5q5
	1FxcQ==
X-ME-Sender: <xms:qOdUZNJT030Zgt0JbyFQ_RKM-cy46jwZsLTVl33BJCq45Pe101WL5g>
    <xme:qOdUZJJ41xlcocWzLm0jnNS7jBIN8KkghbR3IkcuCflIGMbz56nitKYeNXrfi5TeN
    gViNhbdGkbU6GCTVhU>
X-ME-Received: 
 <xmr:qOdUZFvaCVHP_XNid9KfZrJC6EXQ0C-AAcDY8d4bpB7xTzWbi3MxAk88SYyXrBGv0YYlu-vTD2zoc2M2Bibqqrtpo-lEpZk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfeutdejvdeiheffveetieejtdfhleekleffheejtdfhkeehfeekgedvgeei
    tddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qOdUZOYmJ9ZsaodLa9eaX9Q8q4HKIKwuTBwJAtYSDKF8GpNgXk42fg>
    <xmx:qOdUZEb46ec3DVsk5A-VwtFLn5NwE5E1PepLOVibVXBwwU6BkntCMA>
    <xmx:qOdUZCA2HAk2HAzU0PLbBu4ihiyeyzAMLisKixjpCdEI11Zrvkz5Jg>
    <xmx:qudUZOXd4C3fyX9ywwFJ0Y0vPI9HQrT33VOj41wJMoXxHKeJ6EWEk-kmzE8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 00/68] clk: Make determine_rate mandatory for muxes
Date: Fri, 05 May 2023 13:25:02 +0200
Message-Id: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7nVGQC/43NzQ6CMAwH8FchOzuztQymJ9/DeIBRZIFAsuGiI
 by7lZvxIKfm349fFxEpeIrinC0iUPLRTyOH/JAJ11XjnaRvOAtQAFppK93Qy7ANXEeuj7L1T4o
 SFJ5aNICQK8HHdRVJ1rzoOj4fH8PAzc7HeQqv7VnSXK5/3aSlki1Sa5XRVufq4iiM03Emhm9sJ
 tjnwMcpSiwachot/Ti4z0F2TpVGY/MSGgNfzrqubzQ7VSJSAQAA
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8811; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DTutEgCIMF28vydDZ/bIJ7FNCahxgFT27xgwey0IUAI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxe9Xxi/3cvxVqX7ota1NvX8JiY10syKs/hVXlh2s5Wr
 xyh3lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCIG0Qz/3R5ZNfhd/XJhS3zivh2awt
 u3XDHevLprI+OV15f2zRd/0czIcHfvjUN8sh+uf+NwWChWIG+Rz7NssnmgDruxem/tXuG77AA=
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
Message-ID-Hash: PB2AT77XLVYUG4FY34VPGUT2HNCSWYCB
X-Message-ID-Hash: PB2AT77XLVYUG4FY34VPGUT2HNCSWYCB
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:12 +0000
CC: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Abel Vesa <abelvesa@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Lechner <david@lechnology.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Orson Zhai <orsonzhai@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Peng Fan <peng.fan@nxp.com>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-actions@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, patches@opensource.cirrus.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liam Beguin <liambeguin@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pawel Moll <pawel.moll@arm.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PB2AT77XLVYUG4FY34VPGUT2HNCSWYCB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This is a follow-up to a previous series that was printing a warning
when a mux has a set_parent implementation but is missing
determine_rate().

The rationale is that set_parent() is very likely to be useful when
changing the rate, but it's determine_rate() that takes the parenting
decision. If we're missing it, then the current parent is always going
to be used, and thus set_parent() will not be used. The only exception
being a direct call to clk_set_parent(), but those are fairly rare
compared to clk_set_rate().

Stephen then asked to promote the warning to an error, and to fix up all
the muxes that are in that situation first. So here it is :)

It was build-tested on x86, arm and arm64.

Affected drivers have been tracked down by the following coccinelle
script:

virtual report 

@ clk_ops @
identifier ops;
position p;
@@

 struct clk_ops ops@p = {
   ...
 };

@ has_set_parent @
identifier clk_ops.ops;
identifier set_parent_f;
@@

  struct clk_ops ops = {
	.set_parent = set_parent_f,
  };

@ has_determine_rate @
identifier clk_ops.ops;
identifier determine_rate_f;
@@

  struct clk_ops ops = {
	.determine_rate = determine_rate_f,
  };

@ script:python depends on report && has_set_parent && !has_determine_rate @
ops << clk_ops.ops;
set_parent_f << has_set_parent.set_parent_f;
p << clk_ops.p;
@@

coccilib.report.print_report(p[0], "ERROR: %s has set_parent (%s)" % (ops, set_parent_f))

Berlin is the only user still matching after this series has been
applied, but it's because it uses a composite clock which throws the
script off. The driver has been converted and shouldn't be a problem. 

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
Changes in v4:
- Switch from __clk_mux_determine_rate to a new helper
- Introduced unit tests for that new helper
- Fix kunit regression
- Reworded most of the commit logs
- Link to v3: https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech

Changes in v3:
- Rebased on top of next-20230404
- Link to v2: https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech

Changes in v2:
- Drop all the patches already applied
- Promote the clk registration warning to an error
- Make all muxes use determine_rate
- Link to v1: https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v1-0-f3ef80518140@cerno.tech

---
Maxime Ripard (66):
      clk: Export clk_hw_forward_rate_request()
      clk: test: Fix type sign of rounded rate variables
      clk: lan966x: Remove unused round_rate hook
      clk: nodrv: Add a determine_rate hook
      clk: test: Add a determine_rate hook
      clk: actions: composite: Add a determine_rate hook for pass clk
      clk: at91: main: Add a determine_rate hook
      clk: at91: sckc: Add a determine_rate hook
      clk: berlin: div: Add a determine_rate hook
      clk: cdce706: Add a determine_rate hook
      clk: k210: pll: Add a determine_rate hook
      clk: k210: aclk: Add a determine_rate hook
      clk: k210: mux: Add a determine_rate hook
      clk: lmk04832: clkout: Add a determine_rate hook
      clk: lochnagar: Add a determine_rate hook
      clk: qoriq: Add a determine_rate hook
      clk: si5341: Add a determine_rate hook
      clk: stm32f4: mux: Add a determine_rate hook
      clk: vc5: mux: Add a determine_rate hook
      clk: vc5: clkout: Add a determine_rate hook
      clk: wm831x: clkout: Add a determine_rate hook
      clk: davinci: da8xx-cfgchip: Add a determine_rate hook
      clk: davinci: da8xx-cfgchip: Add a determine_rate hook
      clk: imx: busy: Add a determine_rate hook
      clk: imx: fixup-mux: Add a determine_rate hook
      clk: imx: scu: Add a determine_rate hook
      clk: mediatek: cpumux: Add a determine_rate hook
      clk: pxa: Add a determine_rate hook
      clk: renesas: r9a06g032: Add a determine_rate hook
      clk: socfpga: gate: Add a determine_rate hook
      clk: stm32: core: Add a determine_rate hook
      clk: tegra: bpmp: Add a determine_rate hook
      clk: tegra: super: Add a determine_rate hook
      clk: tegra: periph: Add a determine_rate hook
      clk: ux500: prcmu: Add a determine_rate hook
      clk: ux500: sysctrl: Add a determine_rate hook
      clk: versatile: sp810: Add a determine_rate hook
      drm/tegra: sor: Add a determine_rate hook
      phy: cadence: sierra: Add a determine_rate hook
      phy: cadence: torrent: Add a determine_rate hook
      phy: ti: am654-serdes: Add a determine_rate hook
      phy: ti: j721e-wiz: Add a determine_rate hook
      rtc: sun6i: Add a determine_rate hook
      ASoC: tlv320aic32x4: Add a determine_rate hook
      clk: actions: composite: div: Switch to determine_rate
      clk: actions: composite: fact: Switch to determine_rate
      clk: at91: smd: Switch to determine_rate
      clk: axi-clkgen: Switch to determine_rate
      clk: cdce706: divider: Switch to determine_rate
      clk: cdce706: clkout: Switch to determine_rate
      clk: si5341: Switch to determine_rate
      clk: si5351: pll: Switch to determine_rate
      clk: si5351: msynth: Switch to determine_rate
      clk: si5351: clkout: Switch to determine_rate
      clk: da8xx: clk48: Switch to determine_rate
      clk: imx: scu: Switch to determine_rate
      clk: ingenic: cgu: Switch to determine_rate
      clk: ingenic: tcu: Switch to determine_rate
      clk: sprd: composite: Switch to determine_rate
      clk: st: flexgen: Switch to determine_rate
      clk: stm32: composite: Switch to determine_rate
      clk: tegra: periph: Switch to determine_rate
      clk: tegra: super: Switch to determine_rate
      ASoC: tlv320aic32x4: pll: Switch to determine_rate
      ASoC: tlv320aic32x4: div: Switch to determine_rate
      clk: Forbid to register a mux without determine_rate

Stephen Boyd (2):
      clk: Move no reparent case into a separate function
      clk: Introduce clk_hw_determine_rate_no_reparent()

 drivers/clk/actions/owl-composite.c       |  35 ++++--
 drivers/clk/at91/clk-main.c               |   1 +
 drivers/clk/at91/clk-smd.c                |  29 +++--
 drivers/clk/at91/sckc.c                   |   1 +
 drivers/clk/berlin/berlin2-div.c          |   1 +
 drivers/clk/clk-axi-clkgen.c              |  14 ++-
 drivers/clk/clk-cdce706.c                 |  30 ++---
 drivers/clk/clk-k210.c                    |   3 +
 drivers/clk/clk-lan966x.c                 |  17 ---
 drivers/clk/clk-lmk04832.c                |   1 +
 drivers/clk/clk-lochnagar.c               |   1 +
 drivers/clk/clk-qoriq.c                   |   1 +
 drivers/clk/clk-si5341.c                  |  19 ++--
 drivers/clk/clk-si5351.c                  |  67 ++++++-----
 drivers/clk/clk-stm32f4.c                 |   1 +
 drivers/clk/clk-versaclock5.c             |   2 +
 drivers/clk/clk-wm831x.c                  |   1 +
 drivers/clk/clk.c                         | 108 ++++++++++++------
 drivers/clk/clk_test.c                    | 180 +++++++++++++++++++++++++++++-
 drivers/clk/davinci/da8xx-cfgchip.c       |  12 +-
 drivers/clk/imx/clk-busy.c                |   1 +
 drivers/clk/imx/clk-fixup-mux.c           |   1 +
 drivers/clk/imx/clk-scu.c                 |  20 +++-
 drivers/clk/ingenic/cgu.c                 |  15 +--
 drivers/clk/ingenic/tcu.c                 |  19 ++--
 drivers/clk/mediatek/clk-cpumux.c         |   1 +
 drivers/clk/pxa/clk-pxa.c                 |   1 +
 drivers/clk/renesas/r9a06g032-clocks.c    |   1 +
 drivers/clk/socfpga/clk-gate.c            |   1 +
 drivers/clk/sprd/composite.c              |  16 ++-
 drivers/clk/st/clk-flexgen.c              |  15 +--
 drivers/clk/stm32/clk-stm32-core.c        |  33 ++++--
 drivers/clk/tegra/clk-bpmp.c              |   1 +
 drivers/clk/tegra/clk-periph.c            |  17 ++-
 drivers/clk/tegra/clk-super.c             |  16 ++-
 drivers/clk/ux500/clk-prcmu.c             |   1 +
 drivers/clk/ux500/clk-sysctrl.c           |   1 +
 drivers/clk/versatile/clk-sp810.c         |   1 +
 drivers/gpu/drm/tegra/sor.c               |   1 +
 drivers/phy/cadence/phy-cadence-sierra.c  |   1 +
 drivers/phy/cadence/phy-cadence-torrent.c |   1 +
 drivers/phy/ti/phy-am654-serdes.c         |   1 +
 drivers/phy/ti/phy-j721e-wiz.c            |   1 +
 drivers/rtc/rtc-sun6i.c                   |   1 +
 include/linux/clk-provider.h              |   2 +
 sound/soc/codecs/tlv320aic32x4-clk.c      |  33 +++---
 46 files changed, 527 insertions(+), 199 deletions(-)
---
base-commit: 145e5cddfe8b4bf607510b2dcf630d95f4db420f
change-id: 20221018-clk-range-checks-fixes-2039f3523240

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>

