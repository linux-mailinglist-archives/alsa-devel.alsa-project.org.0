Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EF6D7FAD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 16:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40802741;
	Wed,  5 Apr 2023 16:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40802741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680705475;
	bh=u+laB/ZyqIG2Q9t0bl1LRyl8JfC/hVk4k6X79EShIfo=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbjTqCZ4Cn0EoqNZgEJsISmOexpkUvHfwu5Fve3Zrp91w4/E854yFoSZTQNwFS/qX
	 LsQU19h2sAZT2mS7H+HccBlPrHS5dvM59eKmt0Mw266aFnOCOmcbBiwknDCEvN7AB5
	 ekxeceEeaQWARNeDMIXMnyLE4EitPuL93HYAIOiQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C71D3F8052E;
	Wed,  5 Apr 2023 16:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 120FAF80482; Wed,  5 Apr 2023 14:25:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 179BDF801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 14:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 179BDF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=Dfe0geiu;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RiA4pTPA
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.west.internal (Postfix) with ESMTP id CAB882B06750;
	Wed,  5 Apr 2023 08:25:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 05 Apr 2023 08:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680697525; x=1680704725; bh=1Bu/50duogCJbFzK1iwRvkDHV2M1JFgu5kb
	V2JlVE+8=; b=Dfe0geiulKna3E7hDzNrWtA34MUgRbAjcmhNkUFCu890aghiKPD
	heiUWQbxBY8LJNrIIwX0+P2QtAGRTzjfNhwV3j6KdKI0a1I0DlUq3m/N4iL5S2YS
	uH/yrsRVXQCJ8lCH1LOJkXLlyulyRmsFc4MDe+U1DEjXwo6Q8z6PBLZiIbPCp6yQ
	E8LYVYR2/bA4Xh92t8c7pYNAF6RnjLVAWt4atpkRY3JUTqoCu/Kx5Pwtl7d/6f4Y
	2B18RUFtZDoU5HxvqOXBMi0XE4syJ7//CLFz9IZ3WyMVwEDG/M9TFt2/M8onOLpr
	kw6kOdtWQMxoBUrO76U3uHX+lqJaJp+8wbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680697525; x=1680704725; bh=1Bu/50duogCJbFzK1iwRvkDHV2M1JFgu5kb
	V2JlVE+8=; b=RiA4pTPA14rJ/TrHa/0rKz5MO7lLKjIP9+aDzVM3+JgRM008Yuh
	1TK/jckzHR+akml/zHtccjlQ6teT7L1P3RUSDUg9Mdy1BWF/LxyHyXOsKJDoeGPm
	EKWdMkytqPwve07uA3Brb5/IQj7OW2CQoMhifqn35VT+oGaGlKlKrG25uMn0Fq3P
	0zBhFSct8k/d9PAHAoUjOwyOsKAsL2eUF1+fP8cwK0Ex6QTeTo0JIqVlTr/iAPEg
	0EWBCzJQBFnYjeOsHs83oDlL2yWF8SNBWLL/tkML/V9eCWeZLw2XEpbkBu+OJoIV
	mi0XTl1HGbRWOHj+ioMlcp0xiHDOBXas8nw==
X-ME-Sender: <xms:tGgtZGHtkCbnbHVESMUA-mohqav3DLOXNtQa09RPMoL9mICBTsUADQ>
    <xme:tGgtZHVUXNyvBYRNIH-R3-JfMSbYSv_8urITREfeBfqYaT3mfriXEY2sgdB474pbf
    dBhn39noT8dR4Bv3-c>
X-ME-Received: 
 <xmr:tGgtZAJsbRAtSRAlHHTKA7Z9aLfJX7gLl8uplKNQOodlj7rEmYwk2k1IB8dS_ijqsOXnLdNfX5kHAC_ZSuhTwH04x62VrCs>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tGgtZAE1XOABTxfMLHZikHS3qFf_9MrV5xuG2uTkcF3J2FEKtVd4rw>
    <xmx:tGgtZMU7EVblflNt1rblFK9i1MBcjhpe6qR3-SdinQEEedJjwtYsBQ>
    <xmx:tGgtZDMNjJEMDpgPLFoQMrNA5kBALZJbZOOBi5qWmC9JvT2A0tVh0A>
    <xmx:tWgtZPAOH2Z8q5S9ElaM6_dlb0Krk7wnHbbMuYD63MNdUOxAFwUI9IfPK1s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 08:25:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:54 +0200
Subject: [PATCH v3 64/65] ASoC: tlv320aic32x4: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-64-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=u+laB/ZyqIG2Q9t0bl1LRyl8JfC/hVk4k6X79EShIfo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f7VDMJ1/zq+H9YZOaDPb8uX7xlnZ3244rZ4U+ftVhN
 Tyw62VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJKNozMvQnqvMuEpJyusvU3xvjkz
 R50wTex4VRV3Z+Vo7+Menh5N+MDNPPFBpsvskt+eIo92PeOgWtzV+Fl8/lKtSNj75ygfOjLQcA
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
Message-ID-Hash: UWT62JIRCBX2AF7VFTMOFNHXX4HYXBYP
X-Message-ID-Hash: UWT62JIRCBX2AF7VFTMOFNHXX4HYXBYP
X-Mailman-Approved-At: Wed, 05 Apr 2023 14:36:08 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWT62JIRCBX2AF7VFTMOFNHXX4HYXBYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tlv320aic32x4 divider clocks implements a mux with a set_parent
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index d8b8ea3eaa12..707c9951fac0 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -333,16 +333,17 @@ static int clk_aic32x4_div_set_rate(struct clk_hw *hw, unsigned long rate,
 				AIC32X4_DIV_MASK, divisor);
 }
 
-static long clk_aic32x4_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_aic32x4_div_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	unsigned long divisor;
 
-	divisor = DIV_ROUND_UP(*parent_rate, rate);
+	divisor = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	if (divisor > 128)
 		return -EINVAL;
 
-	return DIV_ROUND_UP(*parent_rate, divisor);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, divisor);
+	return 0;
 }
 
 static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,
@@ -361,7 +362,7 @@ static const struct clk_ops aic32x4_div_ops = {
 	.prepare = clk_aic32x4_div_prepare,
 	.unprepare = clk_aic32x4_div_unprepare,
 	.set_rate = clk_aic32x4_div_set_rate,
-	.round_rate = clk_aic32x4_div_round_rate,
+	.determine_rate = clk_aic32x4_div_determine_rate,
 	.recalc_rate = clk_aic32x4_div_recalc_rate,
 };
 
@@ -389,7 +390,7 @@ static const struct clk_ops aic32x4_bdiv_ops = {
 	.set_parent = clk_aic32x4_bdiv_set_parent,
 	.get_parent = clk_aic32x4_bdiv_get_parent,
 	.set_rate = clk_aic32x4_div_set_rate,
-	.round_rate = clk_aic32x4_div_round_rate,
+	.determine_rate = clk_aic32x4_div_determine_rate,
 	.recalc_rate = clk_aic32x4_div_recalc_rate,
 };
 

-- 
2.39.2

