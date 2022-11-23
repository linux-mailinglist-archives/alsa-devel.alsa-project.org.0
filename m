Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB7E635D1B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0110F1654;
	Wed, 23 Nov 2022 13:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0110F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207329;
	bh=epmD0tTAQXiu0uvyCUkg1ZiD6OqaWlhScVGmeJtFJn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xmq/1vYYq4bBZt8tsUjTgnJuM/K1a9GeqlvFrOijmzVazAqsidf9zwRFFM1gV6AfH
	 Z0148jS9rGkqwO2k0RmB2alqesujoNERLgOgyJTu25mdv/sYNj5tNL3hOTSNm6Q632
	 vxXu3RB2qRt8T+KCdRQTvsg9GMLud6/2DbF0XlUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BA4F8025D;
	Wed, 23 Nov 2022 13:41:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F3CF8030F; Wed, 23 Nov 2022 13:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F83F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F83F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YlLnXPQY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D77BB81EA3;
 Wed, 23 Nov 2022 12:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2296FC433D7;
 Wed, 23 Nov 2022 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207265;
 bh=epmD0tTAQXiu0uvyCUkg1ZiD6OqaWlhScVGmeJtFJn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YlLnXPQYIvedyIrZYLqwMQXRjQ1OjqB1f1+eRQZ+4nxd5/UCT6q3HkHVvuO+1iViI
 lzAEGGtjd8uY0q5LlYfgLfu6PxROS2k5PFJLElDQHLa2B7BY4PHyQa25NatMMkZ+hB
 kyfnpF5EKA1/SD1DyoXgx9Zc7r3DLPNf67kSNPbVNzy4GnfpcUP/FkvfB1tlxQWFDA
 ko8/mffR4MUN/4OGbrSPJkCjW0vmHM4d7yWp6L+spK+77m+BxxihWc32lxNww8GmrA
 JfQN61fx8PQAX16c2uzU4ZKg0co4WhG4sNtUv6o5KfbIfWiAVCBCqFvICYpceRW6DO
 OWC6euncxjVGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 03/44] ASoC: amd: yc: Add Alienware m17 R5 AMD
 into DMI table
Date: Wed, 23 Nov 2022 07:40:12 -0500
Message-Id: <20221123124057.264822-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, leohearts@leohearts.com,
 xazrael@hotmail.com, Brent Mendelsohn <mendiebm@gmail.com>,
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

From: Brent Mendelsohn <mendiebm@gmail.com>

[ Upstream commit d40b6529c6269cd5afddb1116a383cab9f126694 ]

This model requires an additional detection quirk to enable the
internal microphone - BIOS doesn't seem to support AcpDmicConnected
(nothing in acpidump output).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216590
Signed-off-by: Brent Mendelsohn <mendiebm@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20221024174227.4160-1-mendiebm@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 2cb50d5cf1a9..a868a890f00c 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -185,6 +185,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		}
+	},
 	{}
 };
 
-- 
2.35.1

