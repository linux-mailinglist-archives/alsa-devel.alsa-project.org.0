Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0C5742FB
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CE41868;
	Thu, 14 Jul 2022 06:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CE41868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772942;
	bh=pOS5a7puDGZ/iWqaJdM1223AaUj8iUfebzf3eXEB9Z8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDXZyLBrXVXnCazilgQFycMt5PL6R6na5uJcuAX1/p/Fh6UBCqE9VgzQvY6MlcE9U
	 O6vCbLSwXtgB3LyIuXnrAU/+BJS41xtLOfquDhGoHJIGtkpEeefTUCgsFmicPmfPjd
	 JqA2OVugbT6GtKxZGQKE+RsjR+a5sUA5tey3Ujek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB10F805CB;
	Thu, 14 Jul 2022 06:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1403F805F5; Thu, 14 Jul 2022 06:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC7EDF8014E
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC7EDF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SdGYLRwc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6987261E95;
 Thu, 14 Jul 2022 04:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24EC34114;
 Thu, 14 Jul 2022 04:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772598;
 bh=pOS5a7puDGZ/iWqaJdM1223AaUj8iUfebzf3eXEB9Z8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SdGYLRwcAqqMRDoHjVJFYgMXLwDUYH5GCHdg6QWuO+e3q9HoFlU0LKpsTUAxsMyMn
 AcBT5OD0NJlVvWx4SERZCgqDrxAVUTaE3ZcipTR1iCJVWdyG58rFluzrOtnMbNpjEI
 suZw7fcBnNcnPk+LyqJqWGS77Yw/pSlqEq7YRYF7ChvLh78Pbuf2RiyhZPsquLFJK/
 nCoovAihhzPSSO0evWDNoRWE41/CFyGl8WZFSV8mI3wsJsEGrZMWfmoHY53PA/riSJ
 eizqm/TVZDlMNeq1u/FMp8A9tGjVEkAzuOmNBbhCGYaU6ny7hQpZ0f1Ddk6438q/Zc
 HHuS9Gq9cuPcA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 22/41] ASoC: cs35l41: Add ASP TX3/4 source to
 register patch
Date: Thu, 14 Jul 2022 00:22:02 -0400
Message-Id: <20220714042221.281187-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 46b0d050c8c7df6dfb2c376aaa149bf2cfc5ca3e ]

The mixer controls for ASP TX3/4 are set to values that are not included
in their enumeration control. This will cause spurious event
notifications when the controls are first changed, as the register value
changes whilst the actual visible enumeration value does not. Use the
register patch to set them to a known value, zero, which equates to zero
fill, thereby avoiding the spurious notifications.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220623105120.1981154-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l41-lib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 17cf782f39af..538b5c4d3abf 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -36,8 +36,8 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_DAC_PCM1_SRC,			0x00000008 },
 	{ CS35L41_ASP_TX1_SRC,			0x00000018 },
 	{ CS35L41_ASP_TX2_SRC,			0x00000019 },
-	{ CS35L41_ASP_TX3_SRC,			0x00000020 },
-	{ CS35L41_ASP_TX4_SRC,			0x00000021 },
+	{ CS35L41_ASP_TX3_SRC,			0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,			0x00000000 },
 	{ CS35L41_DSP1_RX1_SRC,			0x00000008 },
 	{ CS35L41_DSP1_RX2_SRC,			0x00000009 },
 	{ CS35L41_DSP1_RX3_SRC,			0x00000018 },
@@ -643,6 +643,8 @@ static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
@@ -654,6 +656,8 @@ static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
@@ -665,6 +669,8 @@ static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[] = {
-- 
2.35.1

