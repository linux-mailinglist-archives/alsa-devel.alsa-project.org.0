Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76867182AE
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 15:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BA682B;
	Wed, 31 May 2023 15:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BA682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685540706;
	bh=3oHX6kZ+MMX2KYiMsfklMP9Awa185FLNHSRbAuPbN4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l6wB//89rAXPizPvjnPB0Wi/Lk0o49/i1vB+Qhsi8RGz5K7yoypexEV8S0hKA+HBp
	 utCWDoUcQUmK4K8i1ThgBAkPtTnEoWLk75OAju0tqA0DKQLYvffASxJRNxk2gCtU3c
	 8kmbVwrRN7Pv/qnSMXWlgk59o4qcL1Gozh2jDwtw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A65FBF805A1; Wed, 31 May 2023 15:43:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B638F8057D;
	Wed, 31 May 2023 15:43:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DA3BF80580; Wed, 31 May 2023 15:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EC3EF80563
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 15:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC3EF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LgTInfvm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 403C763B00;
	Wed, 31 May 2023 13:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCADC433A1;
	Wed, 31 May 2023 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540581;
	bh=3oHX6kZ+MMX2KYiMsfklMP9Awa185FLNHSRbAuPbN4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgTInfvmTgzgDvuCv0IAuH4Z4MxfcR7T7aNxVqr1y9owaQlY/42D+qtwgSABV/slX
	 ozz9CrTDU3mDo3ZE73/CCUK3aQZbIPWg8AvwftKZqUtR8nzHOaHmKzElAA+CKXcP2m
	 9IyFOrTfGwt8lmUIQPp7f0tdzlkq8qIvb20PAAX8165aoFxumDjVxpfwBWlMffkU+s
	 fxEKlB3pxXzmFpHkN8oARknvo/B/wESJO0QrNR653xect3nErKR2ssfpSi1p7pZQtn
	 GMFIfXaTEUknp7+P0rHX8+NUC/mIAdg5VDHDNYFjwhX5ag2behNBoQczBHjkkKdQ9L
	 gcwU3voMRoV8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: [PATCH AUTOSEL 6.1 28/33] ASoC: cs35l41: Fix default regmap values
 for some registers
Date: Wed, 31 May 2023 09:41:54 -0400
Message-Id: <20230531134159.3383703-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134159.3383703-1-sashal@kernel.org>
References: <20230531134159.3383703-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQYZ3MUMTWV2U6L463BEY4WCH6BEBL6J
X-Message-ID-Hash: MQYZ3MUMTWV2U6L463BEY4WCH6BEBL6J
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQYZ3MUMTWV2U6L463BEY4WCH6BEBL6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit e2d035f5a7d597bbabc268e236ec6c0408c4af0e ]

Several values do not match the defaults of CS35L41, fix them.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20230414152552.574502-4-sbinding@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l41-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 04be71435491e..c2c56e5608094 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -46,7 +46,7 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_DSP1_RX5_SRC,			0x00000020 },
 	{ CS35L41_DSP1_RX6_SRC,			0x00000021 },
 	{ CS35L41_DSP1_RX7_SRC,			0x0000003A },
-	{ CS35L41_DSP1_RX8_SRC,			0x00000001 },
+	{ CS35L41_DSP1_RX8_SRC,			0x0000003B },
 	{ CS35L41_NGATE1_SRC,			0x00000008 },
 	{ CS35L41_NGATE2_SRC,			0x00000009 },
 	{ CS35L41_AMP_DIG_VOL_CTRL,		0x00008000 },
@@ -58,8 +58,8 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_IRQ1_MASK2,			0xFFFFFFFF },
 	{ CS35L41_IRQ1_MASK3,			0xFFFF87FF },
 	{ CS35L41_IRQ1_MASK4,			0xFEFFFFFF },
-	{ CS35L41_GPIO1_CTRL1,			0xE1000001 },
-	{ CS35L41_GPIO2_CTRL1,			0xE1000001 },
+	{ CS35L41_GPIO1_CTRL1,			0x81000001 },
+	{ CS35L41_GPIO2_CTRL1,			0x81000001 },
 	{ CS35L41_MIXER_NGATE_CFG,		0x00000000 },
 	{ CS35L41_MIXER_NGATE_CH1_CFG,		0x00000303 },
 	{ CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303 },
-- 
2.39.2

