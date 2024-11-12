Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90E9C544F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6355322CD;
	Tue, 12 Nov 2024 11:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6355322CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731408029;
	bh=gQlW2cwXESWjdYBxHe3WgqAb0ars9D3QYrkWX2iMrJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=momRuUNZrQE9nWx+Cw3Kx/DEyTgSIqxankmXV75zK1Iy83FGSFUIYL4sW0QoeNDEo
	 TGuYYrxS6btVVix3n92AbKGrG2vEy/yZOYPVPeyQyfjPecoLtnTJyeXIS5an/8Ux2l
	 45yqdIu5jDJ61Ra7/2hTXPX9DwKzkvbcVebPa9bk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7747DF805A8; Tue, 12 Nov 2024 11:38:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCBBF805A8;
	Tue, 12 Nov 2024 11:38:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35F73F805B1; Tue, 12 Nov 2024 11:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF062F805A9
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF062F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dFKvp9cE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75F8DA41970;
	Tue, 12 Nov 2024 10:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C85C4CECD;
	Tue, 12 Nov 2024 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407893;
	bh=gQlW2cwXESWjdYBxHe3WgqAb0ars9D3QYrkWX2iMrJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFKvp9cEMeavg+1yXZ6Yx4xRdS48tciq7FIX1ikoTWlNkwf1h5WoLNDxko2RFzWle
	 ULFfnyQVpmO7wz1qsUjZF2cWbOH9z5Q6RE5yugwRqe4Ba7gqgXMOhIxmQq9XinPj/N
	 YQ6NK94bsG3gGTX9BEnMbGbYQ8nyD3M3zPbg/XEVrHnaMZ+MUajbnBx6iuiQo7VLd7
	 a9H7zBPDjnKchDCevm6dex1uA9vJTrXaVjebXxswE4unjxwwickU3e7ClF5NbJcKtg
	 5OIpWhfnl1s8km5Lvgi3kRs2B4D9AHUN36qXSSZdbkd8F7dVkNfHqcaJE0AwFUSMlC
	 fimODpkiics4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 5/6] ASoC: stm: Prevent potential division by
 zero in stm32_sai_get_clk_div()
Date: Tue, 12 Nov 2024 05:38:00 -0500
Message-ID: <20241112103803.1654174-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103803.1654174-1-sashal@kernel.org>
References: <20241112103803.1654174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.229
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K3BUK6GYY3SHRSIZTHO2WOX5POVI4FE3
X-Message-ID-Hash: K3BUK6GYY3SHRSIZTHO2WOX5POVI4FE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3BUK6GYY3SHRSIZTHO2WOX5POVI4FE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 23569c8b314925bdb70dd1a7b63cfe6100868315 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://patch.msgid.link/20241107015936.211902-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3a7f0102b4c5c..90e4757f76b0f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -319,7 +319,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 	int div;
 
 	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
-	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
+	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
 		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
 		return -EINVAL;
 	}
-- 
2.43.0

