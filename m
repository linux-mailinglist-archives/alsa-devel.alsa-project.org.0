Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFB8787F7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:46:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABFCA1948;
	Mon, 11 Mar 2024 19:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABFCA1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182787;
	bh=lqUQWIx+8Xr3kNZFo3F/Pk5FsJwY8BoGx7jkaoPKYX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H81O8jDOUuJ1QN4bim/F8sGm2r0NAAuJenmPzDbRwuXuZ5vqRqyC16WhwZV7zBJ/I
	 0DQ5+wwgjRjuiKnDtion/Tz1lsEOWVWqQB1aJiLxvTFx81MxqcBSoCOQa9lmjVXFQk
	 FMZr/kHrQfUp0N9FuvvMCixXo7W3kYg2bmDzgQTA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83087F89706; Mon, 11 Mar 2024 19:41:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D837CF89702;
	Mon, 11 Mar 2024 19:41:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03508F8070D; Mon, 11 Mar 2024 19:41:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3DDDF806DD
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DDDF806DD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aMDKUnXQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B90BE60F10;
	Mon, 11 Mar 2024 18:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB5DC433C7;
	Mon, 11 Mar 2024 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182430;
	bh=lqUQWIx+8Xr3kNZFo3F/Pk5FsJwY8BoGx7jkaoPKYX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMDKUnXQzA1fQzeq8T6NG0aWAIoioNXxKjXg9a8Z4QFmoxmA+zRJ0EWmeeukV0RB6
	 DFP4vB91nckbcrFgnYJ6j3CAPMl1p4DD0f8z8kdqQMnH/yZ6U5EgEt4D8tUqtretuL
	 J313Qz0djX9xLN6qgpgoIM71hiXQVle+c2FNH5vlpW68GCYHae8pVcXcSNZPtq9jX2
	 bKz96zJEvVTyjOapTLh7c0XaX74vD65Sng6ElCQwUHdmKwKtOPnmIJ2bjyuJJ3kvXX
	 MdTedDOhNUwtrYiOw5atvGeiA/IFUcGNrATn8du/46uUwMMXlG5V6ldXml79OQzVzn
	 wUMLV5P/Dzecw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 3/5] ASoC: wm8962: Enable oscillator if selecting
 WM8962_FLL_OSC
Date: Mon, 11 Mar 2024 14:40:09 -0400
Message-ID: <20240311184011.329314-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311184011.329314-1-sashal@kernel.org>
References: <20240311184011.329314-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.309
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 46LIELDCUHCBGTT7QZYOTXJBQ6NMFNML
X-Message-ID-Hash: 46LIELDCUHCBGTT7QZYOTXJBQ6NMFNML
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46LIELDCUHCBGTT7QZYOTXJBQ6NMFNML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stuart Henderson <stuarth@opensource.cirrus.com>

[ Upstream commit 03c7874106ca5032a312626b927b1c35f07b1f35 ]

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
Link: https://msgid.link/r/20240306161439.1385643-1-stuarth@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8962.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 3f75cb3209ffa..674bc6f65ed0e 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2848,8 +2848,12 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 	switch (fll_id) {
 	case WM8962_FLL_MCLK:
 	case WM8962_FLL_BCLK:
+		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		break;
 	case WM8962_FLL_OSC:
 		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		snd_soc_component_update_bits(component, WM8962_PLL2,
+					      WM8962_OSC_ENA, WM8962_OSC_ENA);
 		break;
 	case WM8962_FLL_INT:
 		snd_soc_component_update_bits(component, WM8962_FLL_CONTROL_1,
-- 
2.43.0

