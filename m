Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D979F6C0
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 03:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54B9193A;
	Thu, 14 Sep 2023 03:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54B9193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694656578;
	bh=mlGKyzEE2qx03CZ4V/fq80BFyvGbaNnoxihP+Doyi3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n2Pkjb2NmUY2sy4OTqEXZtutw1MaX5qgdwrIPtoOJz0FaQI0HCrdgevS8i4YWSZOL
	 Znv63C/s2JER7lD9NRJBZ44ff6FUHCaZRmD/hByV3aiU70/MqUKQI74j7G1yfJvear
	 M8Nq+Mw9lu1Pkc/FArVbN/TmCl8v+XNDfJDp7uyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98C40F8055C; Thu, 14 Sep 2023 03:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06FAFF80246;
	Thu, 14 Sep 2023 03:55:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2589EF80425; Thu, 14 Sep 2023 03:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68866F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 03:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68866F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IRCdyEER
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0213F61BCB;
	Thu, 14 Sep 2023 01:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10FCC433CA;
	Thu, 14 Sep 2023 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694656512;
	bh=mlGKyzEE2qx03CZ4V/fq80BFyvGbaNnoxihP+Doyi3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IRCdyEERw7xjtmKDS7YYYpJ1tOJb4osTbDQD205vWbq0xMk27UABoOUf/0OlQYjv8
	 m+tc3Q1AVz2y6nb4TL21GFc4KSGbD0LV8I4BFoP5V6xq1SKEYRp3gFBNJpThl5PXfB
	 v7rxsnGbL8HMc7zyvYBetC/UR/cqOkUj2JvAToIDY0FQEZHB6spHYGylU+9fDRwqOv
	 v2ovb4KFdLdJ65de+uyf/4cROiE1O05GK3V3fZ67vqqz4C4HFPsUjABjKzfB/hkhIK
	 pOFnYDRXerZvxZL5YTCGahBsBHirdToJB8ipGFaWh7NvQVP2KeIM7AuNJx5EjmZO/g
	 qbYf+Z7Xahq4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shubh <shubhisroking@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	xazrael@hotmail.com,
	Syed.SabaKareem@amd.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 5/7] ASoC: amd: yc: Add DMI entries to support
 Victus by HP Gaming Laptop 15-fb0xxx (8A3E)
Date: Wed, 13 Sep 2023 21:54:49 -0400
Message-Id: <20230914015459.51740-5-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914015459.51740-1-sashal@kernel.org>
References: <20230914015459.51740-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.3
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HQ2MIEVH5CJI3GZC23H474QXTLNGACI3
X-Message-ID-Hash: HQ2MIEVH5CJI3GZC23H474QXTLNGACI3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQ2MIEVH5CJI3GZC23H474QXTLNGACI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shubh <shubhisroking@gmail.com>

[ Upstream commit d1cf5d30b43f1a331032ebf3e11d9e366ab0f885 ]

This model requires an additional detection quirk to
enable the internal microphone.

Signed-off-by: Shubh <shubhisroking@gmail.com>
Link: https://lore.kernel.org/r/20230902150807.133523-1-shubhisroking@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index b304b3562c82b..f7ee792bd1be9 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -325,6 +325,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.1

