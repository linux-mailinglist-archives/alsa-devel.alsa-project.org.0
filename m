Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02877EBC0D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 04:36:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561F2820;
	Wed, 15 Nov 2023 04:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561F2820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700019359;
	bh=Aid9O+Bkm+8g5JHHpfOl4STD3ksch9koNvRL1NPegw0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WRJomjS/Kif7PyQ91GHC9Wk5gfclfljVOCO31WY1KCzopZAAoWv7Y5ADKKUbgrt+f
	 nT4goNbm9NbWjvwrR8R1u6m/GlK0AJpeFtnqIJJckXeOZX/EBLmXxRo89jcMXoqCKC
	 eocRD41KJv4u5oWyQDjM7KnU8ke5E4VAvOLvBvV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF4BBF80558; Wed, 15 Nov 2023 04:35:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B6BF8016E;
	Wed, 15 Nov 2023 04:35:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58700F801D5; Wed, 15 Nov 2023 04:34:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EC30F80166
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 04:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC30F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LORo8Fz7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B81061222;
	Wed, 15 Nov 2023 03:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA41AC433C7;
	Wed, 15 Nov 2023 03:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700019257;
	bh=Aid9O+Bkm+8g5JHHpfOl4STD3ksch9koNvRL1NPegw0=;
	h=From:To:Cc:Subject:Date:From;
	b=LORo8Fz70Op9wkllJfW9BDGR5Vy24R8HRLdfULZas/7vqQMEX/wxCw5FMfA/kbuqf
	 jwvYrV37xx5kb6oS31KJxdtLTIE9p24OF4nvEf+wE2E3ovI+qx5LXrevV4/1q0FaUw
	 ej0XI259j7anp8BCpX6m9ZxH2aodr5oynUdcaPv0Mr0ZVvQ7izxynv22aiOaagrCrg
	 hDeQVPxO4fzcASg+8qUUJgsR4BITMrjUWoHRg1dSDcrKXpznGD4YMo+XV9K0KyvfR0
	 UJCZSUcAd11y3WE0Bl4PjkqptLK8ClAOZU6kGJ6ilcEporAItSbOSPtD8WLGKmFLOf
	 MPuyGAF4jjakQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	peter.ujfalusi@gmail.com,
	jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 1/6] ASoC: ti: omap-mcbsp: Fix runtime PM
 underflow warnings
Date: Tue, 14 Nov 2023 22:33:35 -0500
Message-ID: <20231115033350.1228588-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7HDZNVRCKRBJSF6ZKAPIS5C2AFJHWDZ
X-Message-ID-Hash: F7HDZNVRCKRBJSF6ZKAPIS5C2AFJHWDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7HDZNVRCKRBJSF6ZKAPIS5C2AFJHWDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit fbb74e56378d8306f214658e3d525a8b3f000c5a ]

We need to check for an active device as otherwise we get warnings
for some mcbsp instances for "Runtime PM usage count underflow!".

Reported-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Link: https://lore.kernel.org/r/20231030052340.13415-1-tony@atomide.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/omap-mcbsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index fdabed5133e83..b399d86f22777 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -74,14 +74,16 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 		return 0;
 	}
 
-	pm_runtime_put_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_put_sync(mcbsp->dev);
 
 	r = clk_set_parent(mcbsp->fclk, fck_src);
 	if (r)
 		dev_err(mcbsp->dev, "CLKS: could not clk_set_parent() to %s\n",
 			src);
 
-	pm_runtime_get_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_get_sync(mcbsp->dev);
 
 	clk_put(fck_src);
 
-- 
2.42.0

