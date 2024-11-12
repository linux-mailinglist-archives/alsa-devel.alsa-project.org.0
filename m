Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960E9C5441
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945C222AC;
	Tue, 12 Nov 2024 11:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945C222AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731407971;
	bh=od6gr/PGtSwhl7xGbZ35EBKxaOm7AXdWNVc0c5rm570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YAbeoJ5nDXPA9yEjYH27bzcXmCi/8Nv4waGeYOzwbKWiQKE6U7HT8ikhjFMzmtcto
	 JMdz/ryU96Hq1fAEnX4aZXD2CcmG7TWR3H+eSCrynw5ZOcfPKbxKagsWxnozyGXtZ3
	 CeMuiTcllZtSJodtXYSP2L08UDOUOKFE93pTRaYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C817F80609; Tue, 12 Nov 2024 11:38:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D417F800D2;
	Tue, 12 Nov 2024 11:38:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E874F805F9; Tue, 12 Nov 2024 11:38:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B3F70F805F4
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F70F805F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nbE5ARv8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7670CA4196E;
	Tue, 12 Nov 2024 10:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DB2C4CECD;
	Tue, 12 Nov 2024 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407877;
	bh=od6gr/PGtSwhl7xGbZ35EBKxaOm7AXdWNVc0c5rm570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbE5ARv8VXVGQSnT5oDhTWAJnlxal2UCMV3RoYqOw1LwAAbqn+tMVsiBLIK9uHsW7
	 oQ+hANPjm4kVfF+ye/Vg33Yn1LjryPK4+lCJPiPyW/Jayyw92K+F33OyyW0v6Ga7Hv
	 Tb7WemweoHw1VS0dAipo3IVZMGFvF3IuFVeZtbD/4wlEgGsUijrHDvRHD/Im9IgAsM
	 FTvWCTunzRJmeIWQK3aOoJNHghJxnO/DvkLd8iwh3ZKVxlPuxidkvr8Yq1meIa3SSE
	 LYcOaxk/vrNIUAx7aDvD9P1OlM2cuigWkTL7tulcvvjEiAtt1mVcD5U+aXo6dB5alL
	 e6uWgjmSS4muw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	olivier.moysan@foss.st.com,
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
Subject: [PATCH AUTOSEL 5.15 6/8] ASoC: stm: Prevent potential division by
 zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:37:40 -0500
Message-ID: <20241112103745.1653994-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103745.1653994-1-sashal@kernel.org>
References: <20241112103745.1653994-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.171
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIFBTEWMRNADA6SCWIIAKXAGMLKO6F67
X-Message-ID-Hash: MIFBTEWMRNADA6SCWIIAKXAGMLKO6F67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIFBTEWMRNADA6SCWIIAKXAGMLKO6F67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation (*prate / div) is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 9c3b8e2096565..aa9cdd93b5778 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0

