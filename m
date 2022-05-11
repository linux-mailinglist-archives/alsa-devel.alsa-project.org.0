Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E4522C45
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 08:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47DAC176E;
	Wed, 11 May 2022 08:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47DAC176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652250395;
	bh=6pExoMLixL6gG2J0+H/4Q3LjV8rOcI8qnKi0JiD7gmw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GQ+qV6ikj7vATWuHxGnZSbqCLzGiqaczX7sC+q574xUQPd+5GPF2kkXkGxBBZMyAF
	 ifrVYKz9V5B8YizzfQvQ/gHEp165KPsr4tPsdsUzKuBnNwcCt6HtXbgwR6ms2UJ77B
	 3BWDyQtiQftSAKminSRFxrPX2bpQt7zeLcb8d96M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D0EF80116;
	Wed, 11 May 2022 08:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA2CF8015B; Wed, 11 May 2022 08:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212B4F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 08:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212B4F800BB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.b="FQWTpU+q"
Received: by mail-pf1-x434.google.com with SMTP id d25so1117352pfo.10
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 23:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A5C7OXci5nwdErfgICDesxwtivpbKyTExi4Vox7FELc=;
 b=FQWTpU+quExij5RCPnOU3jbV6rQpIFmAI694/Fy0FxoYtCSzOvuPp18azYSHLEE5aI
 fEvGE7W+hIxZ1IptkIiNXz3LLpRkd6xAKn1p2p7+uR3ckfmAOBwDNUGrXK2Gk17hAKb5
 Ga+OL780NGq7hZ+P+E+bCqEDChZXQgvz8lJOgj89q4WEGzlXPMDbz5Tg/76M8EGVFgf8
 FEWFWqeWNekP9lkzcKcgHoCyvMwMOL0EM+Ty1Cju1a8Mo9T80rm8eLLTRGy+YuBhB0NL
 4frSR+fuZIZeV4g53ubZr9yPqSwnmzsyiReLlhArC/huGfBg2NvabTPyvl/V+YbOFn9h
 AWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A5C7OXci5nwdErfgICDesxwtivpbKyTExi4Vox7FELc=;
 b=uxPTsw1SmMiys87CDP2TQil/H3HMQKddbbfgk4TGOHzz+Ncb7VKPba9OUrw7ofsEDv
 Czfdew+xG3fY3Rsu4HPD0YElcpD8Qi2/+WAaN+q/nU35zUky42vq0ShVrunlQdKTLqDe
 ud1ZnTmeBl8wTynsqXuCM6zfuPoN1uY8ux4K1Eyh13HmypbIbOSSht9bQunKY2+gtlfo
 9u3iUJXCQUqkdBjIMIOCu84kxZT2STQ3aalScV54vRWD4VsgG2Ywv6bIADtQicTGLemU
 SqBLwaGAov1A9igdFzn+5F8SJ2iTY1kRddFU4XC54TQ5zmmOoemWbKfc3JRucNtTpRDx
 jH8g==
X-Gm-Message-State: AOAM53275wBPH4HW2OmceVLPYjOQ8dj5PhMW+HbF2TpsIR4TEDWb3SKV
 m1Eq95GQYXS+QNTvZBtjiNgKuXDzmCy88utfL50=
X-Google-Smtp-Source: ABdhPJy/oQDgFkEh/tjm9dOvcT7za1mLaFGJQzSWvsGrFaolHaJawbYZUnPZfQ64jixTAsvL28QOVg==
X-Received: by 2002:a63:2a4f:0:b0:3c1:bf77:b81f with SMTP id
 q76-20020a632a4f000000b003c1bf77b81fmr19650508pgq.364.1652250324273; 
 Tue, 10 May 2022 23:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:478:2175:74a6:2181:e968:3721])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a64c300b001cd4989ff4esm839533pjm.21.2022.05.10.23.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 23:25:24 -0700 (PDT)
From: Terry Chen <terry_chen@wistron.corp-partner.google.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] [v3]FROMLIST: ASoC: Intel: sof_cs42l42: adding support for
 ADL configuration and BT offload audio
Date: Wed, 11 May 2022 14:25:14 +0800
Message-Id: <20220511062514.1743838-1-terry_chen@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: terry_chen@wistron.corp-partner.google.com, cezary.rojewski@intel.com,
 casey.g.bowman@intel.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com,
 mark_hsieh@wistron.corp-partner.google.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, seanpaul@chromium.org,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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

To be able to do  driver data for adl_mx98360a_cs4242 which supports
two max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec
on SSP0 running on ADL platform. Also add the capability to machine driver
of creating DAI Link for BT offload. Although BT offload always uses SSP2
port but we reserve the flexibility to assign the port number in macro.

Signed-off-by: Terry Chen <terry_chen@wistron.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_cs42l42.c          | 92 ++++++++++++++++++-
 .../intel/common/soc-acpi-intel-adl-match.c   |  8 ++
 2 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index ce78c18798876..e7711480922cd 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -41,8 +41,13 @@
 #define SOF_CS42L42_DAILINK_MASK		(GENMASK(24, 10))
 #define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
 	((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
-#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(25)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(26)
+#define SOF_BT_OFFLOAD_PRESENT			BIT(25)
+#define SOF_CS42L42_SSP_BT_SHIFT		26
+#define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
+#define SOF_CS42L42_SSP_BT(quirk)	\
+	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
+#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(29)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(30)
 
 enum {
 	LINK_NONE = 0,
@@ -50,6 +55,7 @@ enum {
 	LINK_SPK = 2,
 	LINK_DMIC = 3,
 	LINK_HDMI = 4,
+	LINK_BT = 5,
 };
 
 /* Default: SSP2 */
@@ -278,6 +284,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component dummy_component[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
 static int create_spk_amp_dai_links(struct device *dev,
 				    struct snd_soc_dai_link *links,
 				    struct snd_soc_dai_link_component *cpus,
@@ -467,9 +480,56 @@ static int create_hdmi_dai_links(struct device *dev,
 	return -ENOMEM;
 }
 
+static int create_bt_offload_dai_links(struct device *dev,
+				       struct snd_soc_dai_link *links,
+				       struct snd_soc_dai_link_component *cpus,
+				       int *id, int ssp_bt)
+{
+	int ret = 0;
+
+	/* bt offload */
+	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
+		return 0;
+
+	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
+					 ssp_bt);
+	if (!links[*id].name) {
+		ret = -ENOMEM;
+		goto devm_err;
+	}
+
+	links[*id].id = *id;
+	links[*id].codecs = dummy_component;
+	links[*id].num_codecs = ARRAY_SIZE(dummy_component);
+	links[*id].platforms = platform_component;
+	links[*id].num_platforms = ARRAY_SIZE(platform_component);
+
+	links[*id].dpcm_playback = 1;
+	links[*id].dpcm_capture = 1;
+	links[*id].no_pcm = 1;
+	links[*id].cpus = &cpus[*id];
+	links[*id].num_cpus = 1;
+
+	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+						   "SSP%d Pin",
+						   ssp_bt);
+	if (!links[*id].cpus->dai_name) {
+		ret = -ENOMEM;
+		goto devm_err;
+	}
+
+	(*id)++;
+
+	return 0;
+
+devm_err:
+	return -ENOMEM;
+}
+
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
+							  int ssp_bt,
 							  int dmic_be_num,
 							  int hdmi_num)
 {
@@ -522,6 +582,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				goto devm_err;
 			}
 			break;
+		case LINK_BT:
+			ret = create_bt_offload_dai_links(dev, links, cpus, &id, ssp_bt);
+			if (ret < 0) {
+				dev_err(dev, "fail to create bt offload dai links, ret %d\n",
+					ret);
+				goto devm_err;
+			}
+			break;
 		case LINK_NONE:
 			/* caught here if it's not used as terminator in macro */
 		default:
@@ -543,7 +611,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
-	int ret, ssp_amp, ssp_codec;
+	int ret, ssp_bt, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -568,6 +636,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
 
+	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
+			SOF_CS42L42_SSP_BT_SHIFT;
+
 	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
@@ -578,9 +649,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_cs42l42.num_links++;
+	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      dmic_be_num, hdmi_num);
+					      ssp_bt, dmic_be_num, hdmi_num);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -621,6 +694,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_CS42L42_SSP_AMP(1)) |
 					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
 	},
+	{
+		.name = "adl_mx98360a_cs4242",
+		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_CS42L42_SSP_AMP(1) |
+					SOF_CS42L42_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_CS42L42_SSP_BT(2)) |
+					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_BT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 7c8cd00457f81..3f40519250a90 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -384,6 +384,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "adl_mx98360a_cs4242",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

