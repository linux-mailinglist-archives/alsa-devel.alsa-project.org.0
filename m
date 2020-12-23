Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECA2E11DF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:18:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CB016E6;
	Wed, 23 Dec 2020 03:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CB016E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608689911;
	bh=6m4j7PoAUO6tgvACC/ztjfDAnaIcgyfLORwev4jkTp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qmw2xcbfpUFmfsNlwt88FqR9fDbNQOkLyHRQDbMrCxaFNUAGRJI0t+AM/MDtX+qdJ
	 981LxSxJguF8iyGUmw3e9flMVnhOqZqKSZK935IWDYzwcjmYP2srmYYN4AtbPGK4Rl
	 CIpG4gtohqNHjT3sMBcyO3OVl+dyYFeyybKl/5GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC42FF801EB;
	Wed, 23 Dec 2020 03:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F63F801D5; Wed, 23 Dec 2020 03:16:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BEEFF8013F
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEEFF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O3M4nxp0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E47E3229CA;
 Wed, 23 Dec 2020 02:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689803;
 bh=6m4j7PoAUO6tgvACC/ztjfDAnaIcgyfLORwev4jkTp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O3M4nxp0MAUFYLPn+e+ctbgLa5pyaCQzReroMxq8RI8Sr3SnZ6ZJ7KvyR5uB8z4vc
 JzrT95tVN0WjVHAO4P93qpUzLZ9hm8ikjD6M2pA4vXWKB9ulRIDmis4CtFKs0V1Q4z
 3HuX1QD7EuwAjV3/JzLhX4V+bBNiHIgluDi+jJP8yQT+Ru9+9zcjcHXwFsgimNQJwL
 Sp66eXkcqOoQ51Jpk4qjUUEJqSa7Syt6JDTXazHVULSSLryobjUoSfBgcwCyXjc+T4
 1Hlwnjk9kKr8kP6hAIgP03HHeSdCjntoVWzy/KfT8zF99J/Tmmjd1VEZ4Y1/0b4/kh
 JbrAyYmeLhBTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 013/217] ASoC: intel: sof_rt5682: Add quirk for
 Dooly
Date: Tue, 22 Dec 2020 21:13:02 -0500
Message-Id: <20201223021626.2790791-13-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

[ Upstream commit bdd088ce5bfd32b95ab1bd90b49405e7c1f1fff5 ]

This DMI product family string of this board is "Google_Hatch" so the
DMI quirk will take place. However, this board is using rt1015 speaker
amp instead of max98357a specified in the quirk. Therefore, we need an
new DMI quirk for this board.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20201030170559.20370-3-brent.lu@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ddbb9fe7cc06b..c6c33910bc354 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -99,6 +99,24 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(1)),
 	},
+	{
+		/*
+		 * Dooly is hatch family but using rt1015 amp so it
+		 * requires a quirk before "Google_Hatch".
+		 */
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dooly"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_100FS |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.27.0

