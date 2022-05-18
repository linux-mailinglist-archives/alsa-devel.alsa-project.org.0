Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7A52B0CE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 05:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C007A83E;
	Wed, 18 May 2022 05:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C007A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652844799;
	bh=dH5oGHYx4IK2xbOvE/C2stYdBV+W3PcNMBl1wY3Spho=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pZmcxLALUNskx1uBRaxvk+40Fi3RF0jPKx+9oDkOHu1cIID51sgvgr2zEnXE6S3/l
	 JfEdirE41ieJw2vZWLLY8hphGNipRcI7W0H7WllKbDRJExV3QxCrG/8GWP5+4t5zkZ
	 ihXge4LDCNSFS7WE8M+4zUXIrj5s+ZXJoBN+GlU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5F6F80279;
	Wed, 18 May 2022 05:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C006BF800E1; Wed, 18 May 2022 05:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E1FEF800E1
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 05:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1FEF800E1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.b="m8WkiVFk"
Received: by mail-pj1-x102d.google.com with SMTP id ds11so781610pjb.0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 20:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wD+3DPNBHWrSJJ39pUpfwVdR2mdxSqgxqlbfe6iw9bw=;
 b=m8WkiVFktvNXSIHh1KGJVdB+Ip5AYaNs2JShyN2RHc9iArQOJOR6MqrVjLbkoJxXJy
 RncGUbxUyy26NYHWR6KB9xqnt3znuO4rkPd7FRMGtMQVdqXeE701EMaJlz216voyGrJy
 P8N02NUY6MpTAtsPF6oUFBqZBOYY9WFCxZ699qYsVKVwGJludoUMYk53pbm3ZtZ3YCny
 GP6gtGdu4GiXgGoYmD6qjufKxFZchfX9yyypjVmAGjnNJbNU1oeWrkHgeD8dDuAHuQ17
 kJE6RnPsuERrVqUSg4JtAeASHmRbx5M3hdvjQ4Iw72R/fp4aRxV3+MtF7vSmr1B2VJDL
 C71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wD+3DPNBHWrSJJ39pUpfwVdR2mdxSqgxqlbfe6iw9bw=;
 b=023I3OO3yMnH+2aekxjYd6NlXrrHoP2gYnxSiTfSCxw27VCPlOpZ2GA9Db+fIq3Vrh
 hJEoElsA32zhjqSoNVkcU2DXh6mL/V8C25Lj3uV1qZtlAsbUYARdxbBXX8G3uzCtKpbo
 DFWnUlM7Q8aOw3HMxJtqXPFlB5lfKuxW5gCnmscC10VJCdskl4i/rXFGZWPgMUuS1rcR
 2YTUa4CH+hpYl2erdDyOP6V8eW+/gQ5Ur0hGn/aC7It+AQoPUTu0KypVKzgasVKHDnbw
 lRfa8XCvabgNrRn7G5KV8wQkFiphHJX8jXHBn60gRyj7yMvMuVtHGXJAMKCEtsJA4rpv
 17ZQ==
X-Gm-Message-State: AOAM530ML7T5lfFqjlZIP5HgzWK4igdwGd7t4yfBptMk88jEnD23FfNP
 jJly2O60G4OZW/wcqabtcPvWLWIPCPsrEQ==
X-Google-Smtp-Source: ABdhPJxKW0jludrYLG24IuREpgAjLIpTyD+PrhktiytETgjGu+NC3itR7uJWXwdrGV/tUL+hvtLhjA==
X-Received: by 2002:a17:90a:4413:b0:1cd:2d00:9d0b with SMTP id
 s19-20020a17090a441300b001cd2d009d0bmr28344830pjg.81.1652844729779; 
 Tue, 17 May 2022 20:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:5f5b:1ac3:6bcc:2a83:347b])
 by smtp.gmail.com with ESMTPSA id
 bp18-20020a17090b0c1200b001df2538c61dsm365931pjb.23.2022.05.17.20.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 20:32:09 -0700 (PDT)
From: Terry Chen <terry_chen@wistron.corp-partner.google.com>
To: alsa-devel@alsa-project.org
Subject: [v7] FROMLIST: ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Date: Wed, 18 May 2022 11:32:00 +0800
Message-Id: <20220518033200.1471841-1-terry_chen@wistron.corp-partner.google.com>
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
 sound/soc/intel/boards/sof_cs42l42.c          | 86 ++++++++++++++++++-
 .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++
 2 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index ce78c18798876..56bae2185904b 100644
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
@@ -467,9 +480,50 @@ static int create_hdmi_dai_links(struct device *dev,
 	return -ENOMEM;
 }
 
+static int create_bt_offload_dai_links(struct device *dev,
+				       struct snd_soc_dai_link *links,
+				       struct snd_soc_dai_link_component *cpus,
+				       int *id, int ssp_bt)
+{
+	/* bt offload */
+	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
+		return 0;
+
+	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
+					 ssp_bt);
+	if (!links[*id].name)
+		goto devm_err;
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
+	if (!links[*id].cpus->dai_name)
+		goto devm_err;
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
@@ -522,6 +576,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
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
@@ -543,7 +605,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
-	int ret, ssp_amp, ssp_codec;
+	int ret, ssp_bt, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -568,6 +630,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
 
+	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
+			SOF_CS42L42_SSP_BT_SHIFT;
+
 	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
@@ -578,9 +643,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_cs42l42.num_links++;
+	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      dmic_be_num, hdmi_num);
+					      ssp_bt, dmic_be_num, hdmi_num);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -621,6 +688,17 @@ static const struct platform_device_id board_ids[] = {
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
index 7c8cd00457f81..311adeb3afbc4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -384,6 +384,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "adl_mx98360a_cs4242",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

