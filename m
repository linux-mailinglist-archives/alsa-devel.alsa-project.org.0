Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352B537BFD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091D21B18;
	Mon, 30 May 2022 15:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091D21B18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917381;
	bh=yWcmRdVyi+FWys7GZ9HWj6oxRlxBcBG6kQKuSmRN7nY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEB7zbvnxPbaWNcVVVQmGBcxE1dMIMVpsL582+shD4Ucy425YeZsUPsLhkIOM6S/C
	 Jz9TtSBvlGZ2X7VOENgZpoBrpZ5RUmJXlU2craT8j3DWAACZvHOpNO1bLE0ZeBy9aw
	 HJIFb33TFQZfRJ9PeFmT3bgeD8j1VBDV8Q/jW0jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3B5F8051F;
	Mon, 30 May 2022 15:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5937F804EC; Mon, 30 May 2022 15:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84C81F804EC
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C81F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbNB4qr/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2453E60EC3;
 Mon, 30 May 2022 13:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F55C385B8;
 Mon, 30 May 2022 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917317;
 bh=yWcmRdVyi+FWys7GZ9HWj6oxRlxBcBG6kQKuSmRN7nY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbNB4qr/P6przBXEvy6yEWNy1KJI51RZMiPTZ7oqOlSN+NISgv1IoHAorhXld4YoB
 G2mv5rj4BJXQKq/ZItAJU+ML/MTgrs1wqb/5ZOocpLXaQU4jOYJtO+O+IaFrfnYkQ2
 J54ZNSI8BBM13mmESHP01L4uUgqyV3TnRLqffUIKnM9pBl7s64J8WLPpTSmErm0FZH
 VdKd2u0JMAGnwR0gT93PMBhL4zaz/5tUYsciN6cCYXjyycTgaEulI9R6Cwhhhy0od8
 ygRTasqqDhtOBB4unqwYkXNYSTas7SqDivs0N4zumyiY1JGmSLgcRipo3W/zgDXM8L
 BGn27ldQbd2MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 091/159] ASoC: Intel: sof_ssp_amp: fix no DMIC BE
 Link on Chromebooks
Date: Mon, 30 May 2022 09:23:16 -0400
Message-Id: <20220530132425.1929512-91-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, akihiko.odaki@gmail.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

[ Upstream commit d1c808765deb2bcd35d827402ed4d75d068aae18 ]

The SOF topology supports 2 BE Links(dmic01 and dmic16k) and each
link supports up to four DMICs. However, Chromebook does not implement
ACPI NHLT table so the mach->mach_params.dmic_num is always zero. We
add a quirk so machine driver knows it's running on a Chromebook and
need to create BE Links for DMIC.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220509170922.54868-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 88530e9de543..ef70c6f27fe1 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
@@ -78,6 +79,16 @@ struct sof_card_private {
 	bool idisp_codec;
 };
 
+static const struct dmi_system_id chromebook_platforms[] = {
+	{
+		.ident = "Google Chromebooks",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+		}
+	},
+	{},
+};
+
 static const struct snd_soc_dapm_widget sof_ssp_amp_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
@@ -371,7 +382,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
-	int dmic_be_num, hdmi_num = 0;
+	int dmic_be_num = 0, hdmi_num = 0;
 	int ret, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -383,7 +394,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 	mach = pdev->dev.platform_data;
 
-	dmic_be_num = mach->mach_params.dmic_num;
+	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
+		dmic_be_num = 2;
 
 	ssp_codec = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
-- 
2.35.1

