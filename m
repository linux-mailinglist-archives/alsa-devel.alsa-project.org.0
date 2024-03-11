Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF18787A9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C711A4A;
	Mon, 11 Mar 2024 19:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C711A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182435;
	bh=y5PTPZ8gniX4MbpvGANx/OZzRS4utU/V31kCwdYd9ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mJdUdvSZCqLq4tbcKeS7oUm7hy7Au2wGxf8YmPB0KU+xqUYN6yvTf12PXIw07lbx3
	 KydBQ8gIpqbAoBMSHC4YGcdflUkxkT6ftg9ACRgs9HyODDYYmDXovj4jpXNO831mPp
	 in6Q58OSCQcFWXT+egNVRI8VpB8ThS6Bf35oZ4EQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5343AF806E3; Mon, 11 Mar 2024 19:38:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B93F806D2;
	Mon, 11 Mar 2024 19:38:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89DF1F8057B; Mon, 11 Mar 2024 19:38:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BAB95F806D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB95F806D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TRNoJKao
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FCD460F10;
	Mon, 11 Mar 2024 18:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E122CC433B1;
	Mon, 11 Mar 2024 18:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182282;
	bh=y5PTPZ8gniX4MbpvGANx/OZzRS4utU/V31kCwdYd9ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TRNoJKaou9yD8Au+Zd2EcPGlfMcwPy1WFB5iXAYl78lBe/nuRBJQSm0kGTGqQ4tfX
	 tUK/ye7HfUA2Rd1QK6gcXODfvWznqkWu1Y+NZFkRNUr7g9ULNlI8TET4P6lkVtlMqk
	 W8e309ww2dsU1ZaV1y8Vuwvdy4b5CCLMb1MjQg2e9Ec7cIFT8Z4hqVUqGVPJt8EPgm
	 H6kcr7eXWLaGw90nMJzvRfHAghBMUBkl9F49tgDNS9bxWUxS/RK9sLvYEG4KzCpFI/
	 76VJlt+wEqUDfnc4u3/xgL8p9n/3pMFe0aDoVjAeEzWiIB9E7hjXOEUfsXGTXPrS/x
	 14bba18dxG5eg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Al Raj Hassain <alrajhassain@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.6 06/12] ASoC: amd: yc: Add HP Pavilion Aero Laptop
 13-be2xxx(8BD6) into DMI quirk table
Date: Mon, 11 Mar 2024 14:37:20 -0400
Message-ID: <20240311183727.328187-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311183727.328187-1-sashal@kernel.org>
References: <20240311183727.328187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.21
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYFNU6T754G53QO75GR6DKOBB36CB4VL
X-Message-ID-Hash: LYFNU6T754G53QO75GR6DKOBB36CB4VL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYFNU6T754G53QO75GR6DKOBB36CB4VL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Al Raj Hassain <alrajhassain@gmail.com>

[ Upstream commit b3a51137607cee7c814cd3a75d96f78b9ee1dc1f ]

The HP Pavilion Aero Laptop 13-be2xxx(8BD6) requires a quirk entry for its internal microphone to function.

Signed-off-by: Al Raj Hassain <alrajhassain@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://msgid.link/r/20240304103924.13673-1-alrajhassain@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 80ad60d485ea0..ea9512efa6fa5 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -395,6 +395,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8B2F"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

