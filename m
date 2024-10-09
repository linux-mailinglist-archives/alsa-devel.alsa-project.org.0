Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D159961F7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2024 10:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE7386E;
	Wed,  9 Oct 2024 10:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE7386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728461481;
	bh=tFE5nv9zTJEDkzyKc8O9At/Af8djsSGyqcmqplt/6pI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tvV9MvVhgQCpeq2kIiby+6a0KP963Bxa9o9E8IdI6ZQXnahpHleeOQaZvUotc3hRp
	 Nosgiuk4VvrPNeUnhCe6MZScP3quSYeXW8pehjppBX+Q33dViNpoN96pj/KW0SdR1I
	 f37769u4fJZb5O2/6wguhDSZRF+taLOj3oeSWY1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3587F805FE; Wed,  9 Oct 2024 10:10:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A008DF805FA;
	Wed,  9 Oct 2024 10:10:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D196CF80528; Wed,  9 Oct 2024 10:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B431F8001E
	for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2024 10:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B431F8001E
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 124A41A27F8;
	Wed,  9 Oct 2024 10:10:08 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CEA541A223E;
	Wed,  9 Oct 2024 10:10:07 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 71A87183F0C0;
	Wed,  9 Oct 2024 16:10:06 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chancel.liu@nxp.com
Subject: [PATCH 2/2] ASoC: imx-card: Add CS42888 support
Date: Wed,  9 Oct 2024 15:46:44 +0800
Message-Id: <1728460004-364-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: KOZCEJ4JZXX6C4Z47T2Q2ZPEC47CNNJB
X-Message-ID-Hash: KOZCEJ4JZXX6C4Z47T2Q2ZPEC47CNNJB
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOZCEJ4JZXX6C4Z47T2Q2ZPEC47CNNJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chancel Liu <chancel.liu@nxp.com>

CS42888 codec provides 4 multi-bit ADC and 8 multi-bit DAC.
Add support for this codec in imx-card ASoC machine driver.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 54 ++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 2f3dbbd15791..306168b164d3 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -25,6 +25,7 @@ enum codec_type {
 	CODEC_AK4458,
 	CODEC_AK4497,
 	CODEC_AK5552,
+	CODEC_CS42888,
 };
 
 /*
@@ -185,6 +186,16 @@ static struct imx_akcodec_tdm_fs_mul ak5558_tdm_fs_mul[] = {
 	{ .min = 512,	.max = 512,	.mul = 1024 },
 };
 
+static struct imx_akcodec_fs_mul cs42888_fs_mul[] = {
+	{ .rmin = 8000,   .rmax = 48000,  .wmin = 256,  .wmax = 1024, },
+	{ .rmin = 64000,  .rmax = 96000,  .wmin = 128,  .wmax = 512, },
+	{ .rmin = 176400, .rmax = 192000, .wmin = 64,  .wmax = 256, },
+};
+
+static struct imx_akcodec_tdm_fs_mul cs42888_tdm_fs_mul[] = {
+	{ .min = 256,	.max = 256,	.mul = 256 },
+};
+
 static const u32 akcodec_rates[] = {
 	8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
 	96000, 176400, 192000, 352800, 384000, 705600, 768000,
@@ -210,6 +221,14 @@ static const u32 ak5558_tdm_channels[] = {
 	1, 2, 3, 4, 5, 6, 7, 8,
 };
 
+static const u32 cs42888_channels[] = {
+	1, 2, 4, 6, 8,
+};
+
+static const u32 cs42888_tdm_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8,
+};
+
 static bool format_is_dsd(struct snd_pcm_hw_params *params)
 {
 	snd_pcm_format_t format = params_format(params);
@@ -241,6 +260,7 @@ static bool codec_is_akcodec(unsigned int type)
 	case CODEC_AK4497:
 	case CODEC_AK5558:
 	case CODEC_AK5552:
+	case CODEC_CS42888:
 		return true;
 	default:
 		break;
@@ -340,13 +360,15 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(codec_dai,
-					       BIT(slots) - 1,
-					       BIT(slots) - 1,
-					       slots, slot_width);
-		if (ret && ret != -ENOTSUPP) {
-			dev_err(dev, "failed to set codec dai[%d] tdm slot: %d\n", i, ret);
-			return ret;
+		if (format_is_tdm(link_data)) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       BIT(slots) - 1,
+						       BIT(slots) - 1,
+						       slots, slot_width);
+			if (ret && ret != -ENOTSUPP) {
+				dev_err(dev, "failed to set codec dai[%d] tdm slot: %d\n", i, ret);
+				return ret;
+			}
 		}
 	}
 
@@ -609,6 +631,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5558;
 			else if (!strcmp(link->codecs->dai_name, "ak5552-aif"))
 				plat_data->type = CODEC_AK5552;
+			else if (!strcmp(link->codecs->dai_name, "cs42888"))
+				plat_data->type = CODEC_CS42888;
 
 		} else {
 			link->codecs	 = &snd_soc_dummy_dlc;
@@ -766,6 +790,12 @@ static int imx_card_probe(struct platform_device *pdev)
 		data->dapm_routes[i].sink = "ASRC-Capture";
 		data->dapm_routes[i].source = "CPU-Capture";
 		break;
+	case CODEC_CS42888:
+		data->dapm_routes[0].sink = "Playback";
+		data->dapm_routes[0].source = "CPU-Playback";
+		data->dapm_routes[1].sink = "CPU-Capture";
+		data->dapm_routes[1].source = "Capture";
+		break;
 	default:
 		break;
 	}
@@ -805,6 +835,16 @@ static int imx_card_probe(struct platform_device *pdev)
 			plat_data->support_tdm_channels = ak5558_tdm_channels;
 			plat_data->num_tdm_channels = ARRAY_SIZE(ak5558_tdm_channels);
 			break;
+		case CODEC_CS42888:
+			plat_data->fs_mul = cs42888_fs_mul;
+			plat_data->num_fs_mul = ARRAY_SIZE(cs42888_fs_mul);
+			plat_data->tdm_fs_mul = cs42888_tdm_fs_mul;
+			plat_data->num_tdm_fs_mul = ARRAY_SIZE(cs42888_tdm_fs_mul);
+			plat_data->support_channels = cs42888_channels;
+			plat_data->num_channels = ARRAY_SIZE(cs42888_channels);
+			plat_data->support_tdm_channels = cs42888_tdm_channels;
+			plat_data->num_tdm_channels = ARRAY_SIZE(cs42888_tdm_channels);
+			break;
 		default:
 			break;
 		}
-- 
2.34.1

