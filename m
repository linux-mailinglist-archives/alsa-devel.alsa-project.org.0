Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 355486F820E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 13:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1DF2C86;
	Fri,  5 May 2023 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1DF2C86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683286205;
	bh=2xHE7OLaLEu5YnIpsbcTiVg8NSm5gHLV/BFpBcqFt24=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rcBNzmJlsLsYyDlDXLDoVulxU1R7rzlBlyZ3S2zBFCAMHLt7O47t5cLngOiRmW2n7
	 IikZHx+6fG/Hz6jaQuLLAU93JO8OE6MvNjd6XTDAFBtxSItKxsN7VwOOTxScVdRFs9
	 waBW3fV8v3+UOTbBDXluUh2Q0SxWWMI0cyQ9C9xM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 154E7F80533;
	Fri,  5 May 2023 13:29:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 018DFF80534; Fri,  5 May 2023 13:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17709F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 13:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17709F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm2 header.b=zKfr+iQ1;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fiZeUara
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9630A3200A52;
	Fri,  5 May 2023 07:29:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1683286145; x=1683372545; bh=RULoxxWB0iLBkk0PFF8yhTtG0svGvyMyJ/v
	lpPgc8zY=; b=zKfr+iQ1KizgRdwiREK1HZwauMUzBEx+Ug9163XZfn62Y2RXRvX
	aJWGJrQlEt48l3cHV4JUVLB95SigfeVaQE0hPVYTM/PuKUSWOEySi3Xt7bkT7HWl
	UlFKLuntiWF7H0kI8TNp0G4wGojyIQwK21itsiZCSISSGHrMiqhIqHWJq6K3tjSF
	oJ4EKaMm2ZqfP31KcA4BU1S1c6kzcTvItm5UBZaaC5SyyOy9VeAwmFkpWMZ8lUSY
	IKSwrGCWF+hGA7Hu5Erh1qjNAM8m93Mf3pz8T+bsgQ1UauCtxLjDOZ0gEd/IvSzb
	DauNSNXvFzAU/RIn+8fDk2AF616YeVoMyAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683286145; x=1683372545; bh=RULoxxWB0iLBkk0PFF8yhTtG0svGvyMyJ/v
	lpPgc8zY=; b=fiZeUaraKBB+J/r/mof1g7Lbp5XM7TQpzWsCqTU+UxKa2EdXTpN
	wzVEw8Eb7ca3Rm84PgOhmHJDPnUqMMYpzwnUZTabaKfNivBEEkClANTzw+XOXz6P
	wfIVLHT06H807ST2uv86CBXMd+68uv2HMoD+PX0tMEBNUBz79slOwbkMeXZikOaL
	KuoIhIeGew6ZQ8aPjDcj4qMyr8SR/sLG9S3gZ64IPxzcFQtrMOSsDh1Yg8vuXD0p
	j/RH6IFiSb6LxUJk9llL/hSmXipwN0drFT9KbccV8phCzkLfw9kOX6T7hkEVG11w
	UvIbiQc+21An2ix9kSuv8X4ug3goqOQc7xA==
X-ME-Sender: <xms:gehUZBXEVzY0aYh5YyDbFJkopFnoSr5SBKdElm68iMxmOUJjh097hQ>
    <xme:gehUZBl32z6jXrWq2BLlt3l7_tphMZzRXkt1C7yxqY79-a_XyyBsDXbTi50bKd6YL
    pskqu-pJWKnYb1xTwA>
X-ME-Received: 
 <xmr:gehUZNaD3mDpurtWAKabqHvJDggZvWAd0EXRAD5Wo3U4Ad07bqZO2Bv9OYEMRFnRSIPvFYVtNTZhnD0le5JFdBlx8KbV_7I>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gehUZEXSW4t-9JRaUuTXQ_kgbCqxMD66D46V12sWB-jOMWAiN7INsQ>
    <xmx:gehUZLlJ4r5eE_rN8o4ToPhm9YEMAHj9iDVB1lZXVe5AcebnmYZKUg>
    <xmx:gehUZBc2CHowkFhgVuoZ4VA0rIqX0Upf7a17YeEQXM-UF59Bmw2YiQ>
    <xmx:gehUZJX5ZPZuXVSJJtFKmCAgQbMMMjpMlCwu2dtRY6n5JBr8AuFJXA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:29:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:26:08 +0200
Subject: [PATCH v4 66/68] ASoC: tlv320aic32x4: pll: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-66-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2xHE7OLaLEu5YnIpsbcTiVg8NSm5gHLV/BFpBcqFt24=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5f+T1glNJ3rWNfa7PKzVr6PXsuX5GuJyS+9I7clyLfQ
 iXViRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZyYCYjQ6/wTo+fOy6kO7vHuU+N85
 f8IsFytHZaRh/fMa6TKrHOXIwMhyW2dVjNs1pTNefeQTOWKRtjjPLTWLjtRfij0+cdSdzKDwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: O5TY36PTDMU3THQ3JERJEUSWFQUAWLE7
X-Message-ID-Hash: O5TY36PTDMU3THQ3JERJEUSWFQUAWLE7
X-MailFrom: maxime@cerno.tech
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5TY36PTDMU3THQ3JERJEUSWFQUAWLE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tlv320aic32x4 PLL clocks implements a mux with a set_parent hook, but
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 80cbc6bc6847..e2de4617ab09 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -204,18 +204,23 @@ static unsigned long clk_aic32x4_pll_recalc_rate(struct clk_hw *hw,
 	return clk_aic32x4_pll_calc_rate(&settings, parent_rate);
 }
 
-static long clk_aic32x4_pll_round_rate(struct clk_hw *hw,
-			unsigned long rate,
-			unsigned long *parent_rate)
+static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_aic32x4_pll_muldiv settings;
+	unsigned long rate;
 	int ret;
 
-	ret = clk_aic32x4_pll_calc_muldiv(&settings, rate, *parent_rate);
+	ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
 	if (ret < 0)
-		return 0;
+		return -EINVAL;
 
-	return clk_aic32x4_pll_calc_rate(&settings, *parent_rate);
+	rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
@@ -266,7 +271,7 @@ static const struct clk_ops aic32x4_pll_ops = {
 	.unprepare = clk_aic32x4_pll_unprepare,
 	.is_prepared = clk_aic32x4_pll_is_prepared,
 	.recalc_rate = clk_aic32x4_pll_recalc_rate,
-	.round_rate = clk_aic32x4_pll_round_rate,
+	.determine_rate = clk_aic32x4_pll_determine_rate,
 	.set_rate = clk_aic32x4_pll_set_rate,
 	.set_parent = clk_aic32x4_pll_set_parent,
 	.get_parent = clk_aic32x4_pll_get_parent,

-- 
2.40.0

