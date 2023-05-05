Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100216F820F
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 13:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5C92C8A;
	Fri,  5 May 2023 13:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5C92C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683286214;
	bh=idDdRaIJYYsvF6pT+ZXhI+bO7bJzGY8R6vqfi3bZIRk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDzK2fIuR4MiWBrNHD0hngstkGQ5d8nl8+XXYdeGLpJfD90pJ8RunTgGUMYW8N6mr
	 nOjh2Gx68GpsPsL5C6oyPb/7W9nQXa1Lwurk6JbHzAjZjSraHThmfIefDod+dE7sg5
	 fbklUZi64yHmTyWh+v3PyMa55LX3LA0x/33qabqo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89396F80542;
	Fri,  5 May 2023 13:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C2C2F80542; Fri,  5 May 2023 13:29:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D9B9F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 13:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D9B9F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm2 header.b=unL/Kq71;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZoAlulri
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B163E3200A56;
	Fri,  5 May 2023 07:29:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1683286148; x=1683372548; bh=XwQlvmsCFPf0Gok26wWLLf3yZZfeltGKw3r
	1W9nQFmc=; b=unL/Kq717E2G2B2CGaOkQGhjOMrx/Ok2FbVLtFpDgOFAhaNMEWz
	9hj1V3eQZaU3i9p+TTbUb2XquCWBcZppcnpTbFeyy3yQ8O9Mq2FGBE0dqcpNguxF
	S8z7B4S0UozSSs84SwCTJG5WxNo2EpWuIHNJOWVLYVGVDtlnAmz2Bj273sErAAgr
	R4d5gtC88HzYzDXYyh0wEnluymhAA9oBaZ2d4q1XDKqA2YXCwNmlgBkedbfWt5G0
	igIlWvumARjuhpte8B04SZnVvZh9NJ3OCoKdTdYfFfFMjLPMRk7v1f+k4WKiFMII
	4LdVKCHVldaOE0Pip6oA7GbeUZVDnD7kFfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683286148; x=1683372548; bh=XwQlvmsCFPf0Gok26wWLLf3yZZfeltGKw3r
	1W9nQFmc=; b=ZoAlulrinK8CuWqIeGRBppuzAv+Ae04ug5dZsK+wyzxVl2HmUYt
	MLUVYJ/obomauKgL/Cc9Kux9N1z2ckDvM3EwARG0uy3jG2WjZW05r1s3fEZjDx2r
	/1h8gK8uHMs0IRq+8fRplnXQG47pshhT6mznM+CqfLkvJmiE0mZ3dJ/ucqIzmMqM
	Cm2uxhNNgvhxyWtG4J2xEaGnVR0ChD0svo7LT6WAa9MK6jKognlaKt3EhD6fO/k1
	sEBdYV6dHO9ehHuw8GkC+LHwcZdvORmVtUHuD0B/vGI2Tk1nYtHtc48Bo98DHPps
	McpEMNTXDgSah0g9OTmD7lxTNj7gbCTs5dQ==
X-ME-Sender: <xms:hOhUZP1LJhohlfBUtWuUWnujqouphFdm7blHBCig1feOOI8DmvFoGQ>
    <xme:hOhUZOHExUUxSOeOgGbS595RylOXKSQJaGdEuMfPOjhXV5KpP4vpSmUqlT4pLQKcU
    F3NZ6KAmI1BP4mbj6U>
X-ME-Received: 
 <xmr:hOhUZP5R4_isA7C4iyi4Ay-9NXATMlhooLdcrJePcA_MgbLPz8Qc8ELMGxMmMZM9tazShd4q6-YgX6zn8sg6IUdMqjfocKo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hOhUZE2Jf1NZ0akb52gasCOpz57nM51gLMf8mzTKp9COErJfek5TNQ>
    <xmx:hOhUZCFo6LdAbGPAEzqVcF6Gg4xiZGGz6Q1qwcF0JKOtsnL2csw0UQ>
    <xmx:hOhUZF-Y1DjoFmlVoUdEy_FRUaDL02YFne32MEKba_EOtqSwSXBAGg>
    <xmx:hOhUZF1JHsupy0nZDZ8J5c9Y1kdPpCXL6cf0rnIoYnTLRuoxbh5ZlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:29:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:26:09 +0200
Subject: [PATCH v4 67/68] ASoC: tlv320aic32x4: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-67-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=idDdRaIJYYsvF6pT+ZXhI+bO7bJzGY8R6vqfi3bZIRk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cuucXCss46ZMXaDQrn4q4aHRIwenh4esYnZm2fjK97
 WtabdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAihjcZGT7OOFB378eNVSGaW1p4fj
 veNuzrf+ncvtK5k23nBp6MyzMZ/jsF8enKzPgiYVSZ53y4u82ozEfk3KMyt+yTbNUPeiWaeAE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: ETQW5KKQRZYVEG3OFSJGB7D3DM6VDMM5
X-Message-ID-Hash: ETQW5KKQRZYVEG3OFSJGB7D3DM6VDMM5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETQW5KKQRZYVEG3OFSJGB7D3DM6VDMM5/>
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

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index e2de4617ab09..a7ec501b4c69 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -332,16 +332,17 @@ static int clk_aic32x4_div_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -360,7 +361,7 @@ static const struct clk_ops aic32x4_div_ops = {
 	.prepare = clk_aic32x4_div_prepare,
 	.unprepare = clk_aic32x4_div_unprepare,
 	.set_rate = clk_aic32x4_div_set_rate,
-	.round_rate = clk_aic32x4_div_round_rate,
+	.determine_rate = clk_aic32x4_div_determine_rate,
 	.recalc_rate = clk_aic32x4_div_recalc_rate,
 };
 
@@ -388,7 +389,7 @@ static const struct clk_ops aic32x4_bdiv_ops = {
 	.set_parent = clk_aic32x4_bdiv_set_parent,
 	.get_parent = clk_aic32x4_bdiv_get_parent,
 	.set_rate = clk_aic32x4_div_set_rate,
-	.round_rate = clk_aic32x4_div_round_rate,
+	.determine_rate = clk_aic32x4_div_determine_rate,
 	.recalc_rate = clk_aic32x4_div_recalc_rate,
 };
 

-- 
2.40.0

