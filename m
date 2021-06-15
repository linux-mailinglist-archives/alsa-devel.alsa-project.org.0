Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BC3A855F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3831E16A2;
	Tue, 15 Jun 2021 17:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3831E16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772395;
	bh=n9ujRrlXTEJmKUiB68Qx+sN8uLbTXd97Ex+SkB4rPfc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VzyCgwir0XE9QV4WcD6ftWDKUfgNxSNhELUFhlpsWgSSSMeQObHAz0usajeQCMhFy
	 64Ys83jiHKmi7omNXa7pojYikX+fHCGY3LJHrybGQbl+pKR2avQf+UiKcfhmF8Hk1F
	 LkYMnqrqEceD+uQK8GKUuTXqsGvHRsD/ZusIFxP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F865F80519;
	Tue, 15 Jun 2021 17:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7937AF80510; Tue, 15 Jun 2021 17:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF00F8050F
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF00F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FfkoZ5Qw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAE1F61606;
 Tue, 15 Jun 2021 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772164;
 bh=n9ujRrlXTEJmKUiB68Qx+sN8uLbTXd97Ex+SkB4rPfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FfkoZ5QwBGl2bpNR+gJtup0G2JEU+MNNfiupQRIKYRKFnoD2sQY4xYcY/Z7h9Dwj6
 ngss78YDsJ/Ch5ss2ZLvrOI9tEQslX7VtP3j9KWbeleBdgOIGQMVQcLkUb2/31Tz9I
 JAv6md3GD44/R9Yy6QPt5OSSrjWcaWrBlNktPalm9RFs4CQ+hpkiXMQ5il+qzIE4C2
 l7eZRwAzCSXtvYvozlPfi6p9blQrSI452pckE8mZmbP776+0Phi5LKAiw1NaP/ROVz
 FKtc5qgHGm5hkiDuR4B8s94z7qH9psksmTsyf3f9OCS9L2Z1WX4gt1dPR6or9db7f0
 rMVTm/55mHuxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/30] ASoC: AMD Renoir: Remove fix for DMI entry
 on Lenovo 2020 platforms
Date: Tue, 15 Jun 2021 11:48:50 -0400
Message-Id: <20210615154908.62388-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154908.62388-1-sashal@kernel.org>
References: <20210615154908.62388-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Mark Pearson <markpearson@lenovo.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Gabriel Craciunescu <unix.or.die@gmail.com>
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

From: Mark Pearson <markpearson@lenovo.com>

[ Upstream commit 320232caf1d8febea17312dab4b2dfe02e033520 ]

Unfortunately the previous patch to fix issues using the AMD ACP bridge
has the side effect of breaking the dmic in other cases and needs to be
reverted.

Removing the changes while we revisit the fix and find something better.
Apologies for the churn.

Suggested-by: Gabriel Craciunescu <unix.or.die@gmail.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Link: https://lore.kernel.org/r/20210602171251.3243-1-markpearson@lenovo.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 6de536b02b57..917536def5f2 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -192,41 +192,6 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
 		}
 	},
-	{
-		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 Campus */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad X13 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
-		}
-	},
 	{}
 };
 
-- 
2.30.2

