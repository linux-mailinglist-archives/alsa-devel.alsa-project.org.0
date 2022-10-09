Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F45F9421
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F32682C;
	Mon, 10 Oct 2022 01:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F32682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359587;
	bh=VIlYJ2ErGI6e9UFBzveHWStQsrDkc3EGp6+mnyrVdyw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=biNi7u7W8tqtJ271MPBpAPHbEETxIAT1VVSC0prQ2cBuXf2Tua5O4cy9Q8l6cN3k4
	 xTAX0UN3o6JTRa0ZkTK1arRkHS/Vl/jn8vuUahtW+OSS+50IlzA7tH75u0cysPQD+H
	 htagSukjLwxF3DGMSTZj1NZTYevlYJ3Fz3jtnFUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 664C4F8053B;
	Mon, 10 Oct 2022 01:51:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAB5BF8052D; Mon, 10 Oct 2022 01:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91495F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91495F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZBekQ7XP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39B1F60D2B;
 Sun,  9 Oct 2022 23:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F71C433D6;
 Sun,  9 Oct 2022 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359494;
 bh=VIlYJ2ErGI6e9UFBzveHWStQsrDkc3EGp6+mnyrVdyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZBekQ7XPdgHfM2gFJj1K0RGi02SHa4vpeLz8PVriJSo8v88kKexXjMxU/8o+rbcjd
 mOzutTd6W/+1QW6kBsDMiJBwINJQncDysKVerPrLIL3Bf3rbYhm7uGaf59vpqfFi0f
 i91Wy/LBhEvzSdzpQD+mhrlbAX6FQKW36luVKMSoLPNrc7NwLNM5aQerI02oLNhz7A
 Qqs6IQED4/KJzbtyWI1a/N7w1mbt1lt8EV1/SFd2/D+AoBVZs+APs+7O38bLwfIAlt
 oPaHFiN3PamAkfVwsjWd4EJ4brcoEd9c/hfh0p3dyGRbs27eh3lYoy3y6d67iqYej2
 OytrkJ299Fczw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 33/44] ASoC: amd: yc: Add ASUS UM5302TA into DMI
 table
Date: Sun,  9 Oct 2022 19:49:21 -0400
Message-Id: <20221009234932.1230196-33-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Vijendar.Mukunda@amd.com,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>, Syed.SabaKareem@amd.com
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

From: Xiaoyan Li <lxy.lixiaoyan@gmail.com>

[ Upstream commit 4df5b13dec9e1b5a12db47ee92eb3f7da5c3deb5 ]

ASUS Zenbook S 13 OLED (UM5302TA) needs this quirk to get the built-in
microphone working properly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216270
Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20220920201436.19734-2-mario.limonciello@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e0b24e1daef3..5eab3baf3573 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
+		}
+	},
 	{}
 };
 
-- 
2.35.1

