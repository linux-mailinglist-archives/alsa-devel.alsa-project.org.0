Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2C6C556F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 20:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF58CEBD;
	Wed, 22 Mar 2023 20:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF58CEBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515120;
	bh=XrrhMWQnqt1ikQWLiMWwcVO1PUIEDtnXn1ngPJpkiys=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tkPxm+Xw7KcGuiK9x0tPfDJ37sTcEMXxzIyzap/l9iHGIRYCGNjtF9/NFYzVon4Jx
	 lxA2OzzaRMWjyIq7zodKf/C9x9ZjEOidtNFyW/GGQ9lPOKI2XgCL2CBJAbUCBDcTAz
	 RijYM8e2tmTbX84Pb7hkUj/gvEWGFHqWgo7B6XO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 961B6F804B1;
	Wed, 22 Mar 2023 20:57:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 314FFF8027B; Wed, 22 Mar 2023 20:56:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE77F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE77F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ah7XpLjL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D38F7622B2;
	Wed, 22 Mar 2023 19:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33B8C433EF;
	Wed, 22 Mar 2023 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515013;
	bh=XrrhMWQnqt1ikQWLiMWwcVO1PUIEDtnXn1ngPJpkiys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ah7XpLjL9ye5D+AnQpbshf4njYK0ylip+22deqyTRJZBupxJDUfccZRve2iWHhJtn
	 pfABLLt9pvdU/vzTg+1ro8+VNUHRvGNvRQRRukosW4v5PFDQNXisJPDa8Do7tx9ajB
	 AKZopyf0DGxl7iLn3SwhkuNQSnExvVe1nWP4lKOy0T6TN6fnv3rAnvLlIA7+O/Yj3g
	 x/ntkB1QPSUiKaMelviV6G4KNxNZDZaGsWwXJnHnZH5l0aeTrPKCH7VrE4fWn1ieQU
	 QOBYgAnZhXGCfAikmtU6RYU6wd+BGX4HtyuEAx5EahVV8x1TxCeFIGJkcdbUdDQBIF
	 2PrmNum4UvZaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 03/45] ASoC: Intel: avs: max98357a: Explicitly
 define codec format
Date: Wed, 22 Mar 2023 15:55:57 -0400
Message-Id: <20230322195639.1995821-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U2WMFU6BUA4BMKCTB2HFWKERSNBVBSEY
X-Message-ID-Hash: U2WMFU6BUA4BMKCTB2HFWKERSNBVBSEY
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2WMFU6BUA4BMKCTB2HFWKERSNBVBSEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit d16c893425d07ada1fdd817ec06d322efcf69480 ]

max98357a is speaker codec configured in 48000/2/S16_LE format
regardless of front end format, so force it to be so.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230303134854.2277146-2-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/boards/max98357a.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 921f42caf7e09..183123d08c5a3 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
@@ -24,6 +25,26 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "Spk", NULL, "Speaker" },
 };
 
+static int
+avs_max98357a_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* The ADSP will convert the FE rate to 48k, stereo */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP0 to 16 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+	return 0;
+}
+
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
 			       struct snd_soc_dai_link **dai_link)
 {
@@ -55,6 +76,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
 	dl->dpcm_playback = 1;
-- 
2.39.2

