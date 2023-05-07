Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F606F95B6
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB8B1920;
	Sun,  7 May 2023 02:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB8B1920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419805;
	bh=Ms5pa3eIzxgugg6+4zemhi4nvEfjq4kpbHN/gX9gGNY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhJKPRPmU/ocxxx4poPbz/74w4UcHDONyv+4QltzZtQl6lbqWs11QM97iLYUXC2nj
	 O797/EroBnvxmTwbITiJFKuA3pv0B4HfnAKi9dIKqdL2lKPv2UvnkzkLb3RUsKuGjI
	 Fspy9Slgzy6Ycgr6aMRa++7cj6Tc55rrGK54OHiM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B07F80564;
	Sun,  7 May 2023 02:35:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 610DDF8056F; Sun,  7 May 2023 02:35:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4872F80563
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4872F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=soqmXmfQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A661A61500;
	Sun,  7 May 2023 00:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DDCC433D2;
	Sun,  7 May 2023 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419703;
	bh=Ms5pa3eIzxgugg6+4zemhi4nvEfjq4kpbHN/gX9gGNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=soqmXmfQbcaXfj39WPUVxQUQf6WuI7bBbb1sltxzHun4nEMqElFM4eov1CFpS0ng+
	 8KMGoX63gC9DXw+s/t0Qjnqw6J/UfFVUYh/2/BEZgo9EPFOMHY8uczjcS3e9xV2l4J
	 +LNhrl3URRFYpEzdy/zqcAQVsAxt431FOUw4d3CkxTyDeH3/HThcusNU2q5H33R57K
	 Xlrn9PLeOeJRZddzty1zY/drygc0fVmFmSHWi0aYUMK7gOlir7LIJxWvfZ95ZUvtTm
	 Js7Lvjog1TNxXb4ZoIXdy5NI7QCQBnOH1sQQyzVgjU0N5QSqlUSyd87FfL+0IQ66ZG
	 qwduWYV1cV4pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 13/19] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to
 quirks list for acp6x
Date: Sat,  6 May 2023 20:34:11 -0400
Message-Id: <20230507003417.4077259-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003417.4077259-1-sashal@kernel.org>
References: <20230507003417.4077259-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7MF3IWMLVXTSQURJMCZIV5TXEPTUDKP
X-Message-ID-Hash: O7MF3IWMLVXTSQURJMCZIV5TXEPTUDKP
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Baishan Jiang <bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, mendiebm@gmail.com,
 lub.the.studio@gmail.com, wimvanboven@gmail.com, fengwk94@gmail.com,
 jhunkeler@gmail.com, xazrael@hotmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7MF3IWMLVXTSQURJMCZIV5TXEPTUDKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baishan Jiang <bjiang400@outlook.com>

[ Upstream commit a8f5da0bf4d85a6ad03810d902aba61c572102a6 ]

ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
microphone problem as ThinkBook 14 G4+ ARA.

Adding 21HY to acp6x quirks table enables microphone for ThinkBook
14 G5+ ARP.

Signed-off-by: Baishan Jiang <bjiang400@outlook.com>
Link: https://lore.kernel.org/r/OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 9e0c936ebd688..b9d9b385f9b98 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -185,6 +185,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

