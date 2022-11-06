Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF661E437
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:08:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87561FA;
	Sun,  6 Nov 2022 18:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87561FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754527;
	bh=kAigqeMZPJBt2ntHZIObOuDoIoBub1ivzXrK8HvDdIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/7dMjtbJdqL2DazCCBjBncOaZSUoga4OsnkA78foj38WLx3YGd9sqqcCyvlZ7K17
	 naaBqp9+qjSo4vldSDOP6MQRgMEdpcmiUXw/fUydZR66kLNDkckQplmp7z3Wj4I586
	 uKwEqVB1/WZx21mRW4pS1tev4XaiPZNfRS3Q+B64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C20EF805C3;
	Sun,  6 Nov 2022 18:04:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E0FDF805C0; Sun,  6 Nov 2022 18:04:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE11CF805C0
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:04:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE11CF805C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EXOtAbqw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D002B80BED;
 Sun,  6 Nov 2022 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901A6C433C1;
 Sun,  6 Nov 2022 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754279;
 bh=kAigqeMZPJBt2ntHZIObOuDoIoBub1ivzXrK8HvDdIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EXOtAbqw/Bc6B1xGtslwXa9sSmrmSJF2mO3aSo9oLeLGr9UNH/Wf9Y8xvQx2sP30m
 lG89sFmC5fKhlhNM4Be31R710nvTq+hMDKF5c2zGSvO4MkITcg73lPgjdwJzdOoSuj
 YPy9UTIczexSf7aifPqNbtppMZvTn1VSB3yrGgYE8VjhV3Cxbk7uDzpkOqiOpfuCh7
 fKifNUEOhrZpigBxQ9hDazVHF18Y8L1HYadTHZJvws5wVelvaFsepVY4Ii+K2tgVof
 9Jdmlrlwtpx5O6pZLHvDQkTPweh7IXQgq5M4R49Go7kXj3H4WG7BOtULsjcpwVlYP4
 kKZ9CMKydhnjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 23/30] ASoC: amd: yc: Add Lenovo Thinkbook 14+
 2022 21D0 to quirks table
Date: Sun,  6 Nov 2022 12:03:35 -0500
Message-Id: <20221106170345.1579893-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 mario.limonciello@amd.com, Leohearts <leohearts@leohearts.com>,
 Syed.SabaKareem@amd.com
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

From: Leohearts <leohearts@leohearts.com>

[ Upstream commit a75481fa00cc06a8763e1795b93140407948c03a ]

Lenovo Thinkbook 14+ 2022 (ThinkBook 14 G4+ ARA) uses Ryzen
6000 processor, and has the same microphone problem as other
ThinkPads with AMD Ryzen 6000 series CPUs, which has been
listed in https://bugzilla.kernel.org/show_bug.cgi?id=216267.

Adding 21D0 to quirks table solves this microphone problem
for ThinkBook 14 G4+ ARA.

Signed-off-by: Taroe Leohearts <leohearts@leohearts.com>
Link: https://lore.kernel.org/r/26B141B486BEF706+313d1732-e00c-ea41-3123-0d048d40ebb6@leohearts.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 09a8aceff22f..6c0f1de10429 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -52,6 +52,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.35.1

