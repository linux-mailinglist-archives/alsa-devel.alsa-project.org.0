Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B733B5F942C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F6316B4;
	Mon, 10 Oct 2022 01:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F6316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359604;
	bh=92eQYMkXiqh2tRjqU7wqolS9xclS+SWR5TXgeWI09vw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lq2a9hxWVM6QSOimV7u3DgR4e1iR/fJ12bcF39wvBtuq6hHlsQnmCk9iOkcJXH6kU
	 GovECvFxKFpec+3JVSVl2liLKU1SjQEe5vmCVOU5HVUddxpvPGSldihpg54MrMKpjU
	 UroRdxwdrG9+a+XvgaduuQvXSPwpRTl0jov2tVZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA5B9F8054A;
	Mon, 10 Oct 2022 01:51:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BFD5F800B8; Mon, 10 Oct 2022 01:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D54F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D54F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qJ1AMXF/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35DF3B80DE4;
 Sun,  9 Oct 2022 23:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDB6C433D7;
 Sun,  9 Oct 2022 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359500;
 bh=92eQYMkXiqh2tRjqU7wqolS9xclS+SWR5TXgeWI09vw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qJ1AMXF/y0JWoaYoP9Hdeg3d55EY4WusQ8HqxrjOJ35Xp5K1NtR5vChwGUO5Adje3
 tQ+7Dgtx/CgR6u0deenFPSr1StpWObu0y2A5Hlh8AAeT/Dsl4K7kSvAfeXno5vjtn2
 PfDk3WQCHDzKDruokur0HIYBKgj5ZL2WVltBFwbqfa9SAbWJqWcAmZgXs1CcHUC2ez
 qpAEF1YJ1ccy/2SX+IVfLxwrRhBzt07r368EuEf64zqzh2PnscMt+2a/GfHGWqv8WX
 LzYQwpv9xlFGRYSX+Aog3kJc8dOqjsFGwoEGLxkiksIGYOfZJN/NgYcu4OLlNFts3j
 PtNVR4XCm07Qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 34/44] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X
 to quirks table
Date: Sun,  9 Oct 2022 19:49:22 -0400
Message-Id: <20221009234932.1230196-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Sebastian S <iam@decentr.al>, lxy.lixiaoyan@gmail.com, Syed.SabaKareem@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 2232b2dd8cd4f1e6d554b2c3f6899ce36f791b67 ]

Lenovo Yoga Slim 7 Pro X has an ACP DMIC that isn't specified in the
ASL or existing quirk list.  Add it to the quirk table to let DMIC
work on these systems.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216299
Tested-by: Sebastian S <iam@decentr.al>
Reported-and-tested-by: Travis Glenn Hansen <travisghansen@yahoo.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20220920201436.19734-3-mario.limonciello@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 5eab3baf3573..2cb50d5cf1a9 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.35.1

