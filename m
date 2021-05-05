Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08437427E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB0E1762;
	Wed,  5 May 2021 18:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB0E1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233253;
	bh=Y2VUWYraSN5FyUcYUeBh1M7kKcw5J7BRqrpQwrz/wn0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mATzLmcN9Q299fa4tdHnIwFyB+lifwXSifzMqz8wY2X9NAo6/Id0qDUsUPMPdVxyZ
	 uBbL4+4iLV2W2lccXFtukjHNuzSLQYjg0yHJvKcF8mlqyHDue0uqrGbLx6glTpDN9K
	 ncs+KGg/spuKe71+JOawUO5/4Vz7HEbexOsbTB8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E73F805B1;
	Wed,  5 May 2021 18:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4055F805A0; Wed,  5 May 2021 18:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6732DF805A0
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6732DF805A0
IronPort-SDR: Dwb2N2JMRrDRgDRsYwKAjORcBo+2ND5wbt+yz7d+G/FIqRQg7ALjp8L0GqjbASIO8t1ykrrALI
 MV31P0ukc3Zg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219157"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219157"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:18 -0700
IronPort-SDR: xbD4sgDqYlh9Q7gHQOt0eyFYfK1U6Fc3563Wq9FR6QT8HQUV+9ir+gX0C+s8A1qrIVZY6J+2qn
 OJqKp+2poykg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800002"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/13] ASoC: Intel: Boards: tgl_max98373: Add BT offload
 support
Date: Wed,  5 May 2021 11:36:53 -0500
Message-Id: <20210505163705.305616-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

BT audio offload is internally configured with virtual GPIOs,
the port assignment is fixed on SSP2 for TGL/ADL platforms.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 42 +++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 58548ea0d915..5e8f1022a21a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -50,6 +50,13 @@
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
 
+/* BT audio offload: reserve 3 bits for future */
+#define SOF_BT_OFFLOAD_SSP_SHIFT		19
+#define SOF_BT_OFFLOAD_SSP_MASK		(GENMASK(21, 19))
+#define SOF_BT_OFFLOAD_SSP(quirk)	\
+	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
+#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
+
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0);
@@ -591,6 +598,13 @@ static struct snd_soc_dai_link_component rt1015_components[] = {
 	},
 };
 
+static struct snd_soc_dai_link_component dummy_component[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
@@ -780,6 +794,31 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].cpus->dai_name)
 				goto devm_err;
 		}
+		id++;
+	}
+
+	/* BT audio offload */
+	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		int port = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+				SOF_BT_OFFLOAD_SSP_SHIFT;
+
+		links[id].id = id;
+		links[id].cpus = &cpus[id];
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SSP%d Pin", port);
+		if (!links[id].cpus->dai_name)
+			goto devm_err;
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+		if (!links[id].name)
+			goto devm_err;
+		links[id].codecs = dummy_component;
+		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].dpcm_playback = 1;
+		links[id].dpcm_capture = 1;
+		links[id].no_pcm = 1;
+		links[id].num_cpus = 1;
 	}
 
 	return links;
@@ -869,6 +908,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 
+	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+		sof_audio_card_rt5682.num_links++;
+
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num);
 	if (!dai_links)
-- 
2.25.1

