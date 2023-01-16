Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167366C0BE
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF9056DB;
	Mon, 16 Jan 2023 15:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF9056DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877851;
	bh=kiHwUifiCG//om76OU+JIAh3guueRo7nVV+ZCGhevnw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H4ykWaq+Bw6dpqe6I0M3O3YqKF9yaQaS/CtXtnpFEv/mIVXDYwLpaNHdcjdIFGL1Y
	 Es0xgMQDaLSO6EGwOAk9exigYX92y6oKjzAt8oJQzcriz9gGBXLasFB+05kNY8oTrN
	 vhLHayKikpxH0cf3w8E30fNNi2VeY5EFmCE5l7Fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 333C6F8055C;
	Mon, 16 Jan 2023 15:02:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61EC7F8055C; Mon, 16 Jan 2023 15:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 141D6F8024C
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141D6F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gejzWAvw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBB2B60FD0;
 Mon, 16 Jan 2023 14:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DACC433F0;
 Mon, 16 Jan 2023 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877727;
 bh=kiHwUifiCG//om76OU+JIAh3guueRo7nVV+ZCGhevnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gejzWAvwPM5eKc+yZUwsS2KjxcA48UJezyJl6CIFNiZoZXZUceADXZUHwFvv0aFEQ
 lsfDyjCOY1hsDaiy9akkhPjIiSMJtTuBqIJ0wV+zWVfMvghUlBUavh2k0Otz+VO7nU
 f5rNOWGJv8X1ZyUFNqWlYmPtaA3EYg9tJjmcJCnmhbdnCKHQQMInP18jBLnIcQT45f
 caLlFW+r61WWpwh6P1+pmlXXPPzh2Zgl9Aijr3970np27NMRgCu6zTkfRN6qQa1IO8
 A7cAdcAqPThIj3hQ+VSl1C+aEaePXS7VLzZqPqixF8jSzTHyliYEiDxeb1ZVD2D20j
 CeBjro40pgSQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/53] ASoC: amd: yc: Add Razer Blade 14 2022 into
 DMI table
Date: Mon, 16 Jan 2023 09:01:05 -0500
Message-Id: <20230116140154.114951-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 aniol@aniolmarti.cat, tiwai@suse.com, lgirdwood@gmail.com,
 Wim Van Boven <wimvanboven@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, leohearts@leohearts.com,
 xazrael@hotmail.com, mendiebm@gmail.com, lxy.lixiaoyan@gmail.com,
 dukzcry@ya.ru, Syed.SabaKareem@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Wim Van Boven <wimvanboven@gmail.com>

[ Upstream commit 68506a173dd700c2bd794dcc3489edcdb8ee35c6 ]

Razer Blade 14 (2022) - RZ09-0427 needs the quirk to enable the built in microphone

Signed-off-by: Wim Van Boven <wimvanboven@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20221216081828.12382-1-wimvanboven@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1f0b5527c594..469c5e79e0ea 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -220,6 +220,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Razer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Blade 14 (2022) - RZ09-0427"),
+		}
+	},
 	{}
 };
 
-- 
2.35.1

