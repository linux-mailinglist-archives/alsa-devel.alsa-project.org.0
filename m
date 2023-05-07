Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DE6F955B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CDFF1856;
	Sun,  7 May 2023 02:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CDFF1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419592;
	bh=GDJqL3ApqS/ZnDifmDg2sYO6N0TYZCUCDJ0ATatYnFg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YW4sjrW8qsvcXS1mWuwhUTt3SMzYwViKnPjoLU5AOpbtgvBhsrsLxAduX3nOR1M6F
	 FoDFN+buCNshpyZC7N+kHMCgPdX2CzEjO7+HkuRhalPFgXds0gxjA/iRSSji44L+Re
	 xD5BFbLuXGILHdD2Py00eodGNx4XmSkwsQu5gZZ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25723F8055B;
	Sun,  7 May 2023 02:31:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 450DBF8055B; Sun,  7 May 2023 02:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D8C5F80551
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D8C5F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EF0nA26M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CA47609AD;
	Sun,  7 May 2023 00:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA87C433D2;
	Sun,  7 May 2023 00:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419474;
	bh=GDJqL3ApqS/ZnDifmDg2sYO6N0TYZCUCDJ0ATatYnFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EF0nA26MVVqWeW6tzMIDBbeT4X5u81Nh1GA1knPS1eoEW8Iu4WsNDSc9g36XtDQYV
	 T1e1IqelzT7ccVs+vn+OGv5P6V97kLHV0ol47OFbDblUlslUVgxryHoYGwfapyp3b+
	 Ye1eYFLL7y1aGDf4dURfX2IQY9gKhQbnidgsrQTbxllV/a6O1cGKtejgyn9w0W5fsR
	 85jFO2f/1y9WGOgi+7IIKtVBvZDjvY0n+ctTL6ofUHP/Bb0ibKCo5HTRL099zP8soG
	 kA2IZnVLPus28nPU1lH+psGp6t/IHhBxYgU9lN9CwF+HgkCPNV1715YKGIXWi2wRG5
	 D9qHTUdnyLOdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 16/24] ASoC: amd: Add Dell G15 5525 to quirks list
Date: Sat,  6 May 2023 20:30:12 -0400
Message-Id: <20230507003022.4070535-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003022.4070535-1-sashal@kernel.org>
References: <20230507003022.4070535-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HUB3PITUHXITGKHEIWUOJMIWIERZIDYI
X-Message-ID-Hash: HUB3PITUHXITGKHEIWUOJMIWIERZIDYI
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cem Kaya <cemkaya.boun@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, gbrohammer@outlook.com,
 wimvanboven@gmail.com, aniol@aniolmarti.cat, xazrael@hotmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUB3PITUHXITGKHEIWUOJMIWIERZIDYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cem Kaya <cemkaya.boun@gmail.com>

[ Upstream commit faf15233e59052f4d61cad2da6e56daf33124d96 ]

Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so that
internal mic works.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217155
Signed-off-by: Cem Kaya <cemkaya.boun@gmail.com>
Link: https://lore.kernel.org/r/20230410183814.260518-1-cemkaya.boun@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a428e17f03259..1d59163a882ca 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5525"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

