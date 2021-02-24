Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBFF323C77
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E22816A3;
	Wed, 24 Feb 2021 13:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E22816A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171430;
	bh=L2aMcF586Frp6m5Wo5BfpkQl5g6tzyJtP53E0wsBmRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8eDFNE/KbWdQ7oiWHPoRKlnrakJeLz0PXh43VDXoulUBrebCbEQGrfXPCPOPcHwa
	 CrzumnQZ8LUc0l+8YXc/hxt0nD6AKVCJwhysgSjWuTvZoy6x/mazgONxsk1h7tlj9F
	 mbIfiv0LPuFTHSJ5k8cbeZm089kopDmXiHUYZTL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C55F8028B;
	Wed, 24 Feb 2021 13:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A0FF80234; Wed, 24 Feb 2021 13:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E9AF800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E9AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mCFl7yal"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E758064F53;
 Wed, 24 Feb 2021 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171168;
 bh=L2aMcF586Frp6m5Wo5BfpkQl5g6tzyJtP53E0wsBmRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mCFl7yal49rDQAXt/uXYwzh59BxigGzLXd4gG6rU6+s/eN9NuFENYBC2nY+hQThL0
 nrew3jHVoYQFCGEPJMImnOnupSWrVFJYY2QJEeeH6msvZAumtO+BL93OToQ58HgKne
 fJjc8mxakXrxqSG9f5/UB1HAZsY6p8R1wKKbeS3Hjj5TCEHCsrNLwXV83HsIn6qudL
 6mjwrjx9b+lXKCybkq0MOlQ6ViJuJ3/V0Nehslyn00hPRLihVlJihFhH5blW3JEpOm
 SttDwI2uhHPuuRZCV3GiRCR3NGX8OZV63i1EZoubsyocz3Vsp7I/YFxHT/EM3y0Iq7
 zQYzZTcUXsIbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 27/56] ASoC: Intel: bytcr_rt5640: Add new
 BYT_RT5640_NO_SPEAKERS quirk-flag
Date: Wed, 24 Feb 2021 07:51:43 -0500
Message-Id: <20210224125212.482485-27-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Rasmus Porsager <rasmus@beat.dk>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 1851ccf9e155b2a6f6cca1a7bd49325f5efbd5d2 ]

Some devices, like mini PCs/media/top-set boxes do not have any speakers
at all, an example of the is the Mele PCG03 Mini PC.

Add a new BYT_RT5640_NO_SPEAKERS quirk-flag which when sets does not add
speaker routes and modifies the components and the (optional) long_name
strings to reflect that there are no speakers.

Cc: Rasmus Porsager <rasmus@beat.dk>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210109210119.159032-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index f790514a147dd..db3633de9122f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -71,6 +71,7 @@ enum {
 #define BYT_RT5640_SSP0_AIF2		BIT(21)
 #define BYT_RT5640_MCLK_EN		BIT(22)
 #define BYT_RT5640_MCLK_25MHZ		BIT(23)
+#define BYT_RT5640_NO_SPEAKERS		BIT(24)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -132,6 +133,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk JD_NOT_INV enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER)
 		dev_info(dev, "quirk MONO_SPEAKER enabled\n");
+	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)
+		dev_info(dev, "quirk NO_SPEAKERS enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_DIFF_MIC)
 		dev_info(dev, "quirk DIFF_MIC enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) {
@@ -934,7 +937,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		ret = snd_soc_dapm_add_routes(&card->dapm,
 					byt_rt5640_mono_spk_map,
 					ARRAY_SIZE(byt_rt5640_mono_spk_map));
-	} else {
+	} else if (!(byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)) {
 		ret = snd_soc_dapm_add_routes(&card->dapm,
 					byt_rt5640_stereo_spk_map,
 					ARRAY_SIZE(byt_rt5640_stereo_spk_map));
@@ -1179,6 +1182,7 @@ struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 {
 	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3" };
+	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
 	struct byt_rt5640_private *priv;
 	struct snd_soc_acpi_mach *mach;
@@ -1186,7 +1190,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	int ret_val = 0;
 	int dai_index = 0;
-	int i;
+	int i, cfg_spk;
 
 	is_bytcr = false;
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1325,16 +1329,24 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS) {
+		cfg_spk = 0;
+		spk_type = "none";
+	} else if (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) {
+		cfg_spk = 1;
+		spk_type = "mono";
+	} else {
+		cfg_spk = 2;
+		spk_type = "stereo";
+	}
+
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-		 "cfg-spk:%s cfg-mic:%s",
-		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ? "1" : "2",
+		 "cfg-spk:%d cfg-mic:%s", cfg_spk,
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
 	byt_rt5640_card.components = byt_rt5640_components;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
-		 "bytcr-rt5640-%s-spk-%s-mic",
-		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ?
-			"mono" : "stereo",
+		 "bytcr-rt5640-%s-spk-%s-mic", spk_type,
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
 	byt_rt5640_card.long_name = byt_rt5640_long_name;
 #endif
-- 
2.27.0

