Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D86D7538
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2836823;
	Wed,  5 Apr 2023 09:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2836823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679357;
	bh=zqg97H0Ji53100uwLykPTJ08YBbIyy0+pb37UlAbn8M=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TJBbuTS/fqO2fd7CCxrO1LbvzKBfIkG8qJPnPnRMm2tV27Qx0BArZ/c7i0GHEuLfn
	 H2H/ivnDnQydar8/rQBnrElMiLPHkE9V8V64o3pw5ujJwdTLrQnB9XzMDM819FDdj7
	 VA9zede6mi9hPLVqWJlZ4OPzWbPmEhjHQfGFdchg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A51A5F80423;
	Wed,  5 Apr 2023 09:18:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE5FF80529; Tue,  4 Apr 2023 14:34:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8811EF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 14:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8811EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=mcEwSJoC;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GLH7g2xS
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 560E75821A9;
	Tue,  4 Apr 2023 08:34:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611676; x=1680618876; bh=xnvYmnPey5i3ywxRPKhBs4vnyecoxNr52oM
	JsnNmWlY=; b=mcEwSJoCiUrmTnO4nuPEWww//PGWjeD66ZciIHSzyw8KODLRWTL
	Zef6s8oCxToytqGox2cb3/1qyrbOuqpAf31gp2NNug95uHr5vt5tNabjpRa+Ujal
	iWVLu8ykd3KUOg3Hghy7MZv8QmrLW10cBxKu5jhPVTQJGrZuViWGi1vH0PwosVnQ
	BKhN1lEdrxKx6PnsqCGnF4tuQQ/bSDsabE4XSKxf4oFlU+H5GEva05ULoViktvcb
	bSVPyNHAVmsQwXRLMIrRoY2wLrjsuhEmV2D8Z65IAoUVayehzGd4hGC9AfRTwoSx
	uvhXFOxdWcwkuBq0L6zpPUpgb73HJXkskQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611676; x=1680618876; bh=xnvYmnPey5i3ywxRPKhBs4vnyecoxNr52oM
	JsnNmWlY=; b=GLH7g2xSOzIARV524/JRymqL3yeigufHjs2p6v5c2g/jRMN6NKl
	9YddMsbb9bEYHZXw9jI1Du6E8uNAxCz4knddK6uFjjqPE4ijthmwYlqF+e1Bg9Et
	RZHDfrLHfArAKp3OlYIy0LEx49ee64rUmNsYWgsRMPRxbFmc2IsTsJJuxvYrMKUZ
	8NosmZRqNdtMfHOer1dogmnpf8SYwFKA9+WCKQnmWFPKhFbG2Bp2/eI1aRPD0cvf
	Pz7BPhJuhfhuje9ouu52wH37WvaVGA9VLBWkqMv+ls7YfI9XZ51eqeGCceMijy6F
	GV/ZD9Hrvn70JcxZJwQYVpr2Ls64k0ZBnNA==
X-ME-Sender: <xms:XBksZHohibHkC9DaiPpXsDmI1FJknFH7ZX9tZOKSv9JS3FoY9MowkQ>
    <xme:XBksZBr55Lt3-lWHAHbV13HjTO7SGZoXmuP8UK6tjiQykn_cvOqIZZbg8usXwtFRB
    9AqZmSPLl9bEuVqiik>
X-ME-Received: 
 <xmr:XBksZEPEo9-AYyCfZbhCmLNHehFMYiYpNMfM8D1xYRJbbx2aqesfE1hxD10BIaCoLNSURDRjE8049AoktLbi-MqQOMT2Sos>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XBksZK4utqdOhhgbEtTUebOlTLHvsIYczCxa_vf49Fjd85W69c3cFg>
    <xmx:XBksZG74LT9_GnAwW8-hiJisFv1hdwOOECN37oDnDvIkcVHIjKQVxQ>
    <xmx:XBksZCg3FB7h5sIp711p-pxUm0RlL4tv22RwXPS7XVTra-5ZOjSQHg>
    <xmx:XBksZEF87KTvcQ0o6wH_Ti_p7cXZqOjhbkx_enyhthiTUMUmw4XcHA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:12 +0200
Subject: [PATCH v3 22/65] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-22-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=zqg97H0Ji53100uwLykPTJ08YBbIyy0+pb37UlAbn8M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cWP+yQC33iKhi06/IHYxM2J5PtL0qLA2Z5KWyMqP0h
 eOVYRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCocbwV36lc0jt4+41fckhNxV2W8
 /hvp1hU3bF7Kxbsv2z/MXqjxkZ1nz/cMvxTnPstf0nhW8n6CTqRNl+nyN/rO1eaUKD9ZJ+VgA=
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
Message-ID-Hash: NKGEAUDF4RHNW7Z5K7CYSZDP46JMBOGN
X-Message-ID-Hash: NKGEAUDF4RHNW7Z5K7CYSZDP46JMBOGN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKGEAUDF4RHNW7Z5K7CYSZDP46JMBOGN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Davinci DA8xxx cfgchip "clk48" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/davinci/da8xx-cfgchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index c04276bc4051..4c1cc59bba53 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -565,6 +565,7 @@ static u8 da8xx_usb1_clk48_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_usb1_clk48_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= da8xx_usb1_clk48_set_parent,
 	.get_parent	= da8xx_usb1_clk48_get_parent,
 };
@@ -589,6 +590,7 @@ da8xx_cfgchip_register_usb1_clk48(struct device *dev,
 
 	init.name = "usb1_clk48";
 	init.ops = &da8xx_usb1_clk48_ops;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	init.num_parents = 2;
 

-- 
2.39.2

