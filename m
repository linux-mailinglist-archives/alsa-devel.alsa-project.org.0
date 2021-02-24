Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E7323C79
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563531689;
	Wed, 24 Feb 2021 13:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563531689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171469;
	bh=70Y7INUGQhr8PaoroJVk0Sxg0Wg0W4AT6d0SfdHzp90=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2J8CaJKIjI2phhnb1mKZq8JkMsfhLkvDR5jjvbZYVn5WODGnzZii20MKhOnzbDZO
	 tq7myzhqMTqV0kYuWksw+8wt/fRwD+TP862/n1aNBPwVvX29SDp2IT4a2ghF74zWhF
	 2+24k7g0WKiCqfmBGTQRqVCKnB4DDTq2J9w0nRmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1613AF80129;
	Wed, 24 Feb 2021 13:53:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97A74F802CA; Wed, 24 Feb 2021 13:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F238FF8016C
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F238FF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ok9dUOa/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5706E64F5F;
 Wed, 24 Feb 2021 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171195;
 bh=70Y7INUGQhr8PaoroJVk0Sxg0Wg0W4AT6d0SfdHzp90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ok9dUOa/KlOui5XpWGwEhUhHsOibxFV9QejShmqQaBfQ9qPXFxkloUmw5eDEtMiwJ
 0ndJtNm7bDBUFdBI1lZR2J99DFy2qyfEzMgRmkRv2Gf95OxgAKUwgD1qt8FgZcP1pg
 k7vVYI6blg2M+WaB96rBC+22OH7eio26zWRJF1cdxv2uzjfHlbUmDyqYNbgR/8M01G
 M1U1q/k7EdL/d+GhiEuVaVyD9qkeOfMas0ZgLrjXB7mnGJR+C+OfVmu5rJgNpMRlDv
 BztNxNqr3c1Awc0ibbGctd10lM8m7rpHyZTuKi0cROHnmHDgNEZrgGmX+0aOESYNL0
 SHXs86ndC8+MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 47/56] ASoC: Intel: sof-sdw: indent and add
 quirks consistently
Date: Wed, 24 Feb 2021 07:52:03 -0500
Message-Id: <20210224125212.482485-47-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 8caf37e2be761688c396c609880936a807af490f ]

Use the same style for all quirks to avoid misses and errors

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20210208233336.59449-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a8d43c87cb5a2..2d2b0519eee25 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -113,9 +113,10 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME,
 				  "Tiger Lake Client Platform"),
 		},
-		.driver_data = (void *)(SOF_RT711_JD_SRC_JD1 |
-				SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
-				SOF_SSP_PORT(SOF_I2S_SSP2)),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_RT711_JD_SRC_JD1 |
+					SOF_SDW_PCH_DMIC |
+					SOF_SSP_PORT(SOF_I2S_SSP2)),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -139,7 +140,8 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Volteer"),
 		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
 					SOF_SDW_FOUR_SPK),
 	},
 	{
@@ -148,7 +150,8 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ripto"),
 		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
 					SOF_SDW_FOUR_SPK),
 	},
 
-- 
2.27.0

