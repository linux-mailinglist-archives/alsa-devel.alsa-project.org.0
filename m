Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF46653B48
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 05:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EFB72A9A;
	Thu, 22 Dec 2022 05:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EFB72A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671683272;
	bh=6DXcp2Jn846GvBLj5Avpx0KgutEoZFfJvX0RgVOyzy8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jss0VlEOn6/mkxL7V5ldZS7YACXguAbuprbmxv/dCDlJ1RvSFUGp/L4iW6MEmHW2D
	 Q2B7fJNotnqIB5hpGsO6zqeP98WGyEnbmh+oMYKw52imUPN6GG1dFytuDCEB/gNQ2O
	 sbo5rovlkdGcsL0PdPbAdbRsCkepRu44L8LHy+mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A8AF80022;
	Thu, 22 Dec 2022 05:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7152F8024D; Thu, 22 Dec 2022 05:26:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511C0F8026D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 05:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511C0F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=GUVigi1S
Received: by mail-pj1-x1032.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so701207pjm.2
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 20:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=83IiZKKqeyFIPbt60kx1s4S33RFQeqF/INn7EFkiJWE=;
 b=GUVigi1Sp2FNxfUmEOdGyWZf6iA44V655PYUi0Un0GFD69bZQlUYaKNrBrP2bVLzuO
 7gNkN6AcFluR2IVssNsgJtWwWYdorDOcUj/FYEmaRZc9el/7gqtI7F3CI2dbKuXoicFx
 Kb8RgfYmy7ri1Qam18pe/J0cVzhR5MxVetJPk63DtFBrs3xF/PCear9Hji1HqfwbqDN1
 dhqDLr8VSSBZiQz+xsQ1Ai9GEEMI8/oNEFAxsLHXstPAsRTq08iADZKsytScsQtL2DKz
 jqI7LlUN5+ITkNloFHEukMk4fXHHZE9KOTRCKg+KBdTFef5vAP3rTOEXiKYS/s4eV0WV
 u2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83IiZKKqeyFIPbt60kx1s4S33RFQeqF/INn7EFkiJWE=;
 b=tTZmpm6t13PP7vxk2pHa8mdtDAyMpNLxt9uFts3g2YKP/aRk669pvLO8xEQi9EEPDV
 sFLEYO7CQj24I7Tv+CHQ2dy1CUug6zwoIjW1qpsJeqXmS2E44DvdpOdalTgNVo9WOfc0
 833pvNEBzEnLeloyCszAWxeHDgba4SIVfeF0++xg3eSoNNkgNvJu3QtcEjW8EEMieV+D
 bpbird1V+xfSQ4v4zw/EDVb0Mz/KQ6k4FspCpLNXvDh4xLtEugQJ1oezvUFuk4xGAavD
 VZ2XNTN1Cb0teBvOwjdj6LNhMPdN5b6RH9i0qzbyXMt5qs6gWqn1t6L5xf0HKp3Pyipi
 Eqmg==
X-Gm-Message-State: AFqh2koDPPeUAiNqfmhpQk0XBrnSOV5lWQ6o3YmaYkec2NkVswirqVoP
 FBq+z7gvTvBXmtvt+EctxrN9WA==
X-Google-Smtp-Source: AMrXdXtAcLvhmdXv3zALbUM+xSxaidfY2tI4Q/XslneGGdyo2VnpEEJlFzBBZlm2davf3bX6cTTaNw==
X-Received: by 2002:a17:902:d34a:b0:188:5256:bf60 with SMTP id
 l10-20020a170902d34a00b001885256bf60mr4401845plk.25.1671683206613; 
 Wed, 21 Dec 2022 20:26:46 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:56a:a93e:d2b2:b38a:f4a1:ecec])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902e84b00b00183e2a96414sm12250691plg.121.2022.12.21.20.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 20:26:46 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Date: Thu, 22 Dec 2022 12:26:24 +0800
Message-Id: <20221222042624.557869-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds the driver data for two nau8318 speaker amplifiers on
SSP1 and nau8825 on SSP0 for ADL platform.

The nau8315 and nau8318 are both Nuvoton Amp chips. They use the same
Amp driver nau8315.c. The acpi_device_id for nau8315 is "NVTN2010",
for nau8318 is "NVTN2012".
The nau8825 is one of Nuvoton headset codec, and its acpi_device_id is
"10508825".

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 changes from v1->v2:
 * Modify title and add explanations in commit messages .
 * Use new topology file "sof-adl-nau8318-nau8825.tplg" instead of sof-adl-max98360a-nau8825.tplg.
 changes from v2-v3:
 * Modify drv_name string from "adl_nau8318_nau8825" to "adl_nau8318_8825".

 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/sof_nau8825.c          | 23 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   | 12 ++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a472de1909f4..3f68e9edd853 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -554,6 +554,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_RT1015P
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98357A
+	select SND_SOC_NAU8315
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 27880224359d..78d84527081a 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -48,6 +48,7 @@
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
 #define SOF_RT1015P_SPEAKER_AMP_PRESENT	BIT(17)
+#define SOF_NAU8318_SPEAKER_AMP_PRESENT	BIT(18)
 
 static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 
@@ -338,6 +339,13 @@ static struct snd_soc_dai_link_component rt1019p_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component nau8318_components[] = {
+	{
+		.name = "NVTN2012:00",
+		.dai_name = "nau8315-hifi",
+	}
+};
+
 static struct snd_soc_dai_link_component dummy_component[] = {
 	{
 		.name = "snd-soc-dummy",
@@ -486,6 +494,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			max_98360a_dai_link(&links[id]);
 		} else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
 			sof_rt1015p_dai_link(&links[id]);
+		} else if (sof_nau8825_quirk &
+				SOF_NAU8318_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = nau8318_components;
+			links[id].num_codecs = ARRAY_SIZE(nau8318_components);
+			links[id].init = speaker_codec_init;
 		} else {
 			goto devm_err;
 		}
@@ -657,6 +670,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "adl_nau8318_8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_NAU8318_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 60aee56f94bd..b1c0a89a8787 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -450,6 +450,11 @@ static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
+static const struct snd_soc_acpi_codecs adl_nau8318_amp = {
+	.num_codecs = 1,
+	.codecs = {"NVTN2012"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
@@ -507,6 +512,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1015p_amp,
 		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
 	},
+	{
+		.id = "10508825",
+		.drv_name = "adl_nau8318_8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_nau8318_amp,
+		.sof_tplg_filename = "sof-adl-nau8318-nau8825.tplg",
+	},
 	{
 		.id = "10508825",
 		.drv_name = "sof_nau8825",
-- 
2.25.1

