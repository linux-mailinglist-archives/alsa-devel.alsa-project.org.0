Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9123169068F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:18:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09003DF8;
	Thu,  9 Feb 2023 12:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09003DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941499;
	bh=sPsvOSqlhoWC/q+W+LIn1MJRKhl1TyhFwQxIEx9ez4I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s+JamFXDYz4iAzXiQt1w8w3Tr2HiAE/SziMWueQI5zQF/fih7e0Jins8RQDC1Gk2Y
	 3do3Id5X+tEvm53dWXw4JWpgEbHX7RD8p2jKIAktSCKG/eQlWrF9bHGwzq0r67Iexp
	 zUx9q8bftN/Y7Luus76/gZiXqcfuDZTeVJgf+Y2A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BABFF80563;
	Thu,  9 Feb 2023 12:16:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE8CF8055C; Thu,  9 Feb 2023 12:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A36A3F80534
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36A3F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MKmWVEah
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68D2861A21;
	Thu,  9 Feb 2023 11:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC072C433EF;
	Thu,  9 Feb 2023 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941339;
	bh=sPsvOSqlhoWC/q+W+LIn1MJRKhl1TyhFwQxIEx9ez4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKmWVEah1UvMQ+KbxBAiB2IygwbRBSduInza0zQsQhwnFEfF2FQqBsl0KHiYzaRUC
	 PwyPd8QmARRK9FGCF6SWcN20I7K1oy2hVNyVe99qvt5o7WpeESKkFLsCNwGZ6QqjAO
	 sUspNGi0T4VazQ4msekFusVuRqOc0UgWvOHu0kZocMZUlxE4hUNVuwqDCIHohuFGFV
	 izGH1+/4yZK8Ly6j59Zt+Cq90wDZ9xJNHL0OVo+1+Q1ZCdCtzncS6WaCD9HIXd2Avj
	 UmpQ4nAlSf2WdVGnutwSFtFHiTZup5Fp9m3zHTvPPzAO9AA+59AF1yC9BCNxviKWNb
	 b6wKGTbeiBMtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/38] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 15
 2022 into DMI table
Date: Thu,  9 Feb 2023 06:14:29 -0500
Message-Id: <20230209111459.1891941-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X45BKEZL4ZSJQPYWZLFEL7YXLIKQFPRA
X-Message-ID-Hash: X45BKEZL4ZSJQPYWZLFEL7YXLIKQFPRA
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: fengwk <fengwk94@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, mendiebm@gmail.com,
 xazrael@hotmail.com, dukzcry@ya.ru, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X45BKEZL4ZSJQPYWZLFEL7YXLIKQFPRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: fengwk <fengwk94@gmail.com>

[ Upstream commit dcff8b7ca92d724bdaf474a3fa37a7748377813a ]

This model requires an additional detection quirk to enable the
internal microphone - BIOS doesn't seem to support AcpDmicConnected
(nothing in acpidump output).

Signed-off-by: fengwk <fengwk94@gmail.com>
Link: https://lore.kernel.org/r/Y8wmCutc74j/tyHP@arch
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 00fb976e0b81e..36314753923b8 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -227,6 +227,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 15 2022"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.0

