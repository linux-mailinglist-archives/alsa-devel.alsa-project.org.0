Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DAA44B706
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:29:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1C2166A;
	Tue,  9 Nov 2021 23:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1C2166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496941;
	bh=8gin4xYFGZZvnvIufp+YTmpLpY//PfSLSiDa2pG5IrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TgbvIKT4ccctnjWJqkKeYmFoFKdMYvSwugBUmk/3ah9wnrpBDGYmWv4u/iJ4a9CgL
	 CFbjNmBZGdLlWVohMSD/Mr3UvH4BIFipMzLT4+iO5kRzV3hg1iGs+bNykCCY/VY/FL
	 GtILsdmigiSrU+MHd3n4+9FAKGaNCTgOBOahVU+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB72F805A0;
	Tue,  9 Nov 2021 23:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CFF4F80588; Tue,  9 Nov 2021 23:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8D31F8058C
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D31F8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HoA9y6W0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86C8161A8B;
 Tue,  9 Nov 2021 22:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496513;
 bh=8gin4xYFGZZvnvIufp+YTmpLpY//PfSLSiDa2pG5IrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HoA9y6W0OBaJ0SwLwrNricAnVu4EnEsChSEjiLXsQTOZdm+dGzjPtRx3gvgynQE+Y
 N3PiZjo/cqWmbZW8y2JwO7LvXtSft23jjSLrn77MUjQm1Z3UgrsI/g7BMeAsyT86qD
 G1f85yIoi4sbJwWDaF6DDMFgWVYmbKz/t8yzve/vxwqG3A+OZnlepms/b/dCeAN89m
 +XTTjffarOB4BL+KYnYQZMtR3YESpz/jfpqvPM3V3CF6DabMBjZAxn2417AcYS5aG5
 9o4iFgr73PEvaWaXl87yTHmn6jtdauO+6qRoZQ9Wx894vJ0A/wZnarnP9mkEEghoK6
 c2Pta/hRkdBbw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 30/50] ASoC: Intel: sof_sdw: add missing quirk
 for Dell SKU 0A45
Date: Tue,  9 Nov 2021 17:20:43 -0500
Message-Id: <20211109222103.1234885-30-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222103.1234885-1-sashal@kernel.org>
References: <20211109222103.1234885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Rander Wang <rander.wang@intel.com>,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 64ba6d2ce72ffde70dc5a1794917bf1573203716 ]

This device is based on SDCA codecs but with a single amplifier
instead of two.

BugLink: https://github.com/thesofproject/linux/issues/3161
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Link: https://lore.kernel.org/r/20211004213512.220836-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 25548555d8d79..d9b864856be19 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -187,6 +187,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A45")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_RT715_DAI_ID_FIX),
+	},
 	/* AlderLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.33.0

