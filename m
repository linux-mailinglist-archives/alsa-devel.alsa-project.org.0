Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F6323C7B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:58:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F073916A8;
	Wed, 24 Feb 2021 13:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F073916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171492;
	bh=9W+ReJxCUumQSK4opzEIYarUYr0V/fqR6MJJs096GX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1pk2eT21icbS7Cy0SYtt4e4u3Zbo3vrT5SfsKrC32C/dTzFGTdQBXwTC7VQvjPzU
	 35YIB6bgwh6Pwg+DpO5gwJ3IPSxBtiCC98oqrl8kzNsNzbAp8ub38cz1sug6R2WGWL
	 wq3Z6wSF6Rwo+3aSpB3St+jYQxqvx+vYqZa7D/X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E40F802E2;
	Wed, 24 Feb 2021 13:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C460CF8032B; Wed, 24 Feb 2021 13:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F9F8F80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F9F8F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BuWrdPIf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE09264F5C;
 Wed, 24 Feb 2021 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171196;
 bh=9W+ReJxCUumQSK4opzEIYarUYr0V/fqR6MJJs096GX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BuWrdPIfMk3AWEQn9+XqHswRG1g62QaD9GJ8KdDuAuRjl/g2Zeciq0PSePpnQC/t+
 EQlHh6YnkY6buxjfpJdq5sxGbQ9YdCztCybiaymFl0DdbFZnazZHVj+CWRbuHI0z4I
 hfhqRv78vjdoAMeyrEYA1MrmGOEvTTQYb32uy7LfxljmfIyZBZpeJSiKYKVoOKEaBY
 vFieGW+PhC3I+vw6EYDoqEv5hQuhdz3hs0Ews44P4Agx1juPrl1ATkkV2x4msOvrj4
 Wwqv41DArcHCWEvLpVRIPfSk9qSOUpJJIlJbtwGa486sWdXcizsa6l4YVhQAU6YEhd
 B6spkzModMpag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 48/56] ASoC: Intel: sof_sdw: detect DMIC number
 based on mach params
Date: Wed, 24 Feb 2021 07:52:04 -0500
Message-Id: <20210224125212.482485-48-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

[ Upstream commit f88dcb9b98d3f86ead04d2453475267910448bb8 ]

Current driver create DMIC dai based on quirk for each platforms,
so we need to add quirk for new platforms. Now driver reports DMIC
number to machine driver and machine driver can create DMIC dai based
on this information. The old check is reserved for some platforms
may be failed to set the DMIC number in BIOS.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210208233336.59449-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2d2b0519eee25..a30c1d7b3d95f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -923,7 +923,7 @@ static int sof_card_dai_links_create(struct device *dev,
 		ctx->idisp_codec = true;
 
 	/* enable dmic01 & dmic16k */
-	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC) ? 2 : 0;
+	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num) ? 2 : 0;
 	comp_num += dmic_num;
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
-- 
2.27.0

