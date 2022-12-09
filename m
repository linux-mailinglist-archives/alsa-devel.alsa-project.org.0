Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C8964849B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 16:06:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C02892243;
	Fri,  9 Dec 2022 16:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C02892243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670598376;
	bh=5HjkS5qOo+gPezsyLThPhk3akTWsqGHavEYk0BWESbs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LnYD7/DQWvyOAz0TqtVeOOWWL98a6mCVhPEpCh9E+K8R7AS4gw8z35LL2BkrL7uTg
	 FrXCC8vlxAlV9mUN+zOrFdPILS0bnJMVCHvOjANaMwO2IMX43EKj0JD+S1RgU9k5EP
	 dRLPLK8fWvmirD0MAG2cTwAWZQCCyocE5DhESpCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F14F800F8;
	Fri,  9 Dec 2022 16:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD4DF8022D; Fri,  9 Dec 2022 16:05:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE71F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 16:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE71F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=r82KimHT
Received: by mail-pj1-x102b.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so8505749pjb.0
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 07:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bYXaODBVhflASZ7OxFAgzxq0Ral2A1PhxDvbahBGsvE=;
 b=r82KimHTdYUJfTD2kSEU0d5/sHOgGIZebkfojO+q3neNyh7NCtKuRC6Zz3c9PE3ibd
 iKKAoa23sJV2mQfhfpvTYF3KNMr3Tv9e8rwlZLDU7HfYjbDzTMIfDebIPNcK3i4X+wfS
 eN+dv2k74QzCjEokGJya1Z8SrZVl9L0uF5jLW1C7VoJ4neLWAZrfU6vwk9G2Xu5C7fr6
 LWx82xaeXPrR0v1L5jZt4pzQm2pV7naPBPxkZlBlgy0LIMq0u9Yom3PNl8Bs+6DgjcfR
 pBvnf7m0h2TLoQ6wOjt4xRmbJaWUaH0+Y4jobjQRErSRIaKteuBhv4RA+MsUyKLoi3cm
 jnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bYXaODBVhflASZ7OxFAgzxq0Ral2A1PhxDvbahBGsvE=;
 b=zyjciJaIg+LW2jL41xKWGg3yQkGM7d+yDXDdwwEPf7wj9dfKl+Wtcg5lo9GjRkJGj+
 CqJfznPC86DXjdtq5+n+Uf2LeOEzQ2m56zhKBegmBH+7ziAP//VsFzIVnxDv6W2hy7mQ
 r/gVLvDUwIDVrqvsZUTBlnWpMC2dJ3H/5kWJDFnkeLUMpcFyjC0kv7wFJo/xGElImbwz
 cm8zta2Id8GKB48AZ3TJzqqQnDbXFraZnGGEYRoXm0UDBzej+UI5PNYXzWVFJpZS9W98
 zDTHL0uRE1kodwnSi9Ohj4fdeiFEZVrW0rUZEYUveyUXyNR1yi9yQh32LtxTD5XABNrO
 Eo0w==
X-Gm-Message-State: ANoB5pkhR7h5FSLq+r4b5vjHR+lzeMp0TyyL/zZVowc8MGjb1FqG2SlA
 wXYLSaItDSnMhQb+S4hO12kmBw==
X-Google-Smtp-Source: AA0mqf7P2PScex89JkMHbkg7PXQ7ZPThb0uB4RrC4jJtpuZmE2zqb70l8OWHL1W52fylS8loKkwsEg==
X-Received: by 2002:a17:90a:ba01:b0:218:8263:4aac with SMTP id
 s1-20020a17090aba0100b0021882634aacmr6258953pjr.17.1670598313688; 
 Fri, 09 Dec 2022 07:05:13 -0800 (PST)
Received: from ajye-OMEN-by-HP-Laptop-S.hitronhub.home
 (123-195-117-216.dynamic.kbronet.com.tw. [123.195.117.216])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090a410200b002187a4dd830sm1267137pjf.46.2022.12.09.07.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:05:13 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: Intel: sof_nau8825: add support for nau8825 with amp
 nau8318
Date: Fri,  9 Dec 2022 23:05:03 +0800
Message-Id: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
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
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds the driver data for two nau8318 speaker amplifiers on
SSP1 and nau8825 on SSP0 for ADL platform.
And reusing max98360's topology since DAI setting could be leveraged.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
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
index 27880224359d..0936450be153 100644
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
+		.name = "adl_nau8318_nau8825",
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
index 60aee56f94bd..282b9c966ce6 100644
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
+		.drv_name = "adl_nau8318_nau8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_nau8318_amp,
+		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
+	},
 	{
 		.id = "10508825",
 		.drv_name = "sof_nau8825",
-- 
2.25.1

