Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660604EC25E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C9B1936;
	Wed, 30 Mar 2022 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C9B1936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641584;
	bh=o7G5zI7MNaBY1ywbLUsSUnTGxhdeWJI4/+wNTDy21Fc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hmc1khTNkMYBwzlVMUdAMcgcFb11TKCJvO+BuaQuVQxS4UDSqVwTKeH+UvzZRcj7H
	 tni16yP3TxN0az4EX1PBW2BZ/kLfLlI30UExrj4+7T0UchUgO/yZ+x9b/KDfoKddLa
	 7b+wawV1MaaBzTo+GwClbluvmGmlEslk+8O8fZkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1F7F8060D;
	Wed, 30 Mar 2022 13:50:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C41DBF80533; Wed, 30 Mar 2022 13:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E2B6F80602
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2B6F80602
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l50mm/sh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5F0AB81C25;
 Wed, 30 Mar 2022 11:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EF7C36AE2;
 Wed, 30 Mar 2022 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640993;
 bh=o7G5zI7MNaBY1ywbLUsSUnTGxhdeWJI4/+wNTDy21Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l50mm/shwsZzQ5pD+XTkLPO0B39DI+Ta4rgx5yc/Eep3dmx+19MHJE74mZv3NBKIh
 Etj4zATjOfJYpaw5K+2fgqLXKKgLWLQufA3Shk+e7/RM4mbO4Q72siPxvLod/hRV0Z
 FDq0VHqkCuax5c7ZGYTaveaZ78VQaVbpmbVX7McB/zyhJZC0TvsZfjaJd+tYYSK3oF
 2LIBDrspiSw8VHro1AVgy70a/HNgXC6aH9TftSPtB2CyO+SdstTKYstTfoIJIJXAdK
 icGQ842OK1wy0h/T6E4T2+7mnJSX0Dx6Y19AtkIYYo8JXWhOLXaudHlEiiBXiFmfa0
 lwOHrpWFH2Ubw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 52/59] ASoC: Intel: Revert "ASoC: Intel:
 sof_es8336: add quirk for Huawei D15 2021"
Date: Wed, 30 Mar 2022 07:48:24 -0400
Message-Id: <20220330114831.1670235-52-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

[ Upstream commit 1b5283483a782f6560999d8d5965b1874d104812 ]

This reverts commit ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71.

The next patch will add run-time detection of the required SSP and
this hard-coded quirk is not needed.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220308192610.392950-14-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e6d599f0cd26..20d577eaab6d 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -247,14 +247,6 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 					SOF_ES8336_TGL_GPIO_QUIRK |
 					SOF_ES8336_ENABLE_DMIC)
 	},
-	{
-		.callback = sof_es8336_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
-			DMI_MATCH(DMI_BOARD_NAME, "BOHB-WAX9-PCB-B2"),
-		},
-		.driver_data = (void *)SOF_ES8336_SSP_CODEC(0)
-	},
 	{}
 };
 
-- 
2.34.1

