Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BB650014
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Dec 2022 17:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF6829C5;
	Sun, 18 Dec 2022 17:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF6829C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671379766;
	bh=94mJ4ktmnNf7/RYeKm5j2AXaLYPBiO/CeY1y913/4sU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mCCTC5LZD2n27Onk/bmikfFfYVg650YPoxsjVXRBaa6Sd7DCILzQE9QN6RDnKTKwe
	 aofz+BNjJbPRXlEf3WFlOjvSeJhnT8V63tsMF+DviOBGw8TTOAG7YneYOE5kjZvxHM
	 w/6BLiNNJQ7TCs15ndyAzYuGIhwFfO2uzLWDBGtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BB5F8025E;
	Sun, 18 Dec 2022 17:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C769F804FF; Sun, 18 Dec 2022 17:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12876F8025E
 for <alsa-devel@alsa-project.org>; Sun, 18 Dec 2022 17:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12876F8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P3AB9F9d
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE5E1B80BA5;
 Sun, 18 Dec 2022 16:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DA8C433D2;
 Sun, 18 Dec 2022 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379698;
 bh=94mJ4ktmnNf7/RYeKm5j2AXaLYPBiO/CeY1y913/4sU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3AB9F9dyJKBSQMeRQctrtKpHi3xb1nmb9vIMQsnZUbqWgP6ZeNXd4vp8025Dll9Y
 SJHSGsoiKPz/Xyu/tUf+Zot6cxuBiyk0/iSlBkCujOvRE20klaH6w148uSJjjcB2we
 t8rILqCRwMrmb6B+KTsnIATQ0m9NKlyXoMk142LfmRHly8ZCzsejkyfdCeav5tp/lW
 tzUhQZQ1aeA9O3Cti3d5bBFHTBSaNLLDm7DNLE23sqNP5cpRMecqe/LZZbohTRne1j
 /kiJjestG7OQh1cYOVaiHFjKAuWvwfMExOeuRaI7wLd1cBtOok8mtOUHyvKAfb/FO2
 9o8xiKY9Ke66Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 07/73] ASoC: Intel: avs: Add quirk for KBL-R RVP
 platform
Date: Sun, 18 Dec 2022 11:06:35 -0500
Message-Id: <20221218160741.927862-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, peter.ujfalusi@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 9d0737fa0e7530313634c0ecd75f09a95ba8d44a ]

KBL-R RVPs contain built-in rt298 codec which requires different PLL
clock and .dai_fmt configuration than seen on other boards.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20221010121955.718168-5-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/boards/rt298.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index b28d36872dcb..58c9d9edecf0 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/dmi.h>
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -14,6 +15,16 @@
 #include <sound/soc-acpi.h>
 #include "../../../codecs/rt298.h"
 
+static const struct dmi_system_id kblr_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Kabylake R DDR4 RVP"),
+		},
+	},
+	{}
+};
+
 static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -96,9 +107,15 @@ avs_rt298_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_param
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int clk_freq;
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL, 19200000, SND_SOC_CLOCK_IN);
+	if (dmi_first_match(kblr_dmi_table))
+		clk_freq = 24000000;
+	else
+		clk_freq = 19200000;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL, clk_freq, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "Set codec sysclk failed: %d\n", ret);
 
@@ -139,7 +156,10 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	if (dmi_first_match(kblr_dmi_table))
+		dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	else
+		dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
 	dl->init = avs_rt298_codec_init;
 	dl->be_hw_params_fixup = avs_rt298_be_fixup;
 	dl->ops = &avs_rt298_ops;
-- 
2.35.1

