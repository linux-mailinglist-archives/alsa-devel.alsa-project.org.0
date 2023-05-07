Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B956F9581
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E014E17A0;
	Sun,  7 May 2023 02:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E014E17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419668;
	bh=ZhqomB73I32kP61xKVm31O65xmH95OhFb7cvG67S7Q4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQq65JVWBl7PEbvajbvL1UvKEzWMnX7QWw+NKYIFlhXPyu+Ko4Pa0pt4TWThFITZY
	 kEtwWFUQ9FvsGHRHGkiip5BluHJgrIEXahUCyZIUDRIFMvyy9dS50GRoKnl6INJQfo
	 CwIZfxPVWhItRLySLPp6axw1nRsvB0P+zcJXtnlA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA24AF80549;
	Sun,  7 May 2023 02:33:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED598F80544; Sun,  7 May 2023 02:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE764F80310
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE764F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kY1jwuHh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE77B614D2;
	Sun,  7 May 2023 00:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9C6C433D2;
	Sun,  7 May 2023 00:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419588;
	bh=ZhqomB73I32kP61xKVm31O65xmH95OhFb7cvG67S7Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kY1jwuHhnVv3JmHFxOGeHnJbu8p0SMYXHdkiOX/84lK4avRHY4PWwjc6SDJivShkz
	 pdwmi6CATAJKWdkR1Qq39qgqyrB5FtV4lEphjl4xtarpPpACqdK2Byf1Jbc6Xp6fs2
	 /xBeuQ6GJPWFZAUxB/kZbzzrTlqin+0Hd0sX6afGtV9+9uWlkhNYG0Sv4lYHk7Sa4Z
	 HtE34Dq/AzpLWvL22VOMggzcd6nkwCqAg4F+8j+DpaWiBHJBDXynYTd6X1aYRfSCDT
	 OxhaF8XaA+CjD2YviEXxs4tTmpqmvFG51UuRIFtz5qfbosYDZHhHvCuKajx2srxTic
	 laWAGEN8fKWdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 07/20] ASoC: amd: yc: Add DMI entries to support
 HP OMEN 16-n0xxx (8A42)
Date: Sat,  6 May 2023 20:32:22 -0400
Message-Id: <20230507003237.4074305-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003237.4074305-1-sashal@kernel.org>
References: <20230507003237.4074305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VXHC6H5HZK7FEZN2M4KICPVMMOL4C4GG
X-Message-ID-Hash: VXHC6H5HZK7FEZN2M4KICPVMMOL4C4GG
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Prajna Sariputra <putr4.s@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, dukzcry@ya.ru,
 fengwk94@gmail.com, lub.the.studio@gmail.com, xazrael@hotmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXHC6H5HZK7FEZN2M4KICPVMMOL4C4GG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prajna Sariputra <putr4.s@gmail.com>

[ Upstream commit ee4281de4d60288b9c802bb0906061ec355ecef2 ]

This model requires an additional detection quirk to enable the internal microphone.

Signed-off-by: Prajna Sariputra <putr4.s@gmail.com>
Link: https://lore.kernel.org/r/2283110.ElGaqSPkdT@n0067ax-linux62
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702360c..ce6630318858e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -262,6 +262,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A42"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

