Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D373602BC
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 08:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140E515F2;
	Thu, 15 Apr 2021 08:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140E515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618469512;
	bh=X9tKm6ukHlbfExtP6Pz8Xx+ZTpApiHEn+GIMx3iT+WY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J5RM3hiGZeSXyJTL8seSNbMudJp6iobitSF9EutzO26av+qVSaPoToZaym8Ua9nP3
	 a865b0KLJTy3sl9GvMWxfc4MJWYp1YrUPAOnsK0wXRIapAWxmNDC0OIc8/V5zSG5Gw
	 levSRSLyP6K5m5tWbrxS9AXnP1CWudo87bi8g3H4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71964F800FF;
	Thu, 15 Apr 2021 08:50:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D8CF8022B; Thu, 15 Apr 2021 08:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A10F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 08:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A10F80128
IronPort-SDR: 40KE65dLgwXz7AJoM+/TrjK4XUDZkkXmdQvSEKLNDaoeaqZ5niDoRILyYnApMndYRtR9yZ8lqc
 PckhemaWyYvg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194360762"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="194360762"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 23:50:05 -0700
IronPort-SDR: S3Szj9F+rEWZaZnkZFjHAV1ZBd7O+G0gHjmfZUgQMpk5u/53o+1r0keDJZjzaWhylSDqLV0Iyt
 1uSwQkDdvFCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="452791311"
Received: from cooperch-pc1.itwn.intel.com ([10.5.215.29])
 by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2021 23:50:04 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Boards: cml_da7219_max98390: set TDM format
 configuration
Date: Thu, 15 Apr 2021 14:59:27 +0800
Message-Id: <1618469967-16623-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: mac.chiang@intel.com, broonie@kernel.org, SteveS.Lee@maximintegrated.com,
 pierre-louis.bossart@linux.intel.com
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

From: Mac Chiang <mac.chiang@intel.com>

add tx/rx 2 channels, 32bits support

Signed-off-by: Steve Lee <SteveS.Lee@maximintegrated.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 9ffef39..515379cd 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -253,6 +253,30 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int max98390_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	int j;
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV0_NAME)) {
+			/* DEV0 tdm slot configuration */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x1, 3, 2, 32);
+		}
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV1_NAME)) {
+			/* DEV1 tdm slot configuration */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x2, 3, 2, 32);
+		}
+	}
+	return 0;
+}
+
+struct snd_soc_ops max_98390_ops = {
+	.hw_params = max98390_hw_params,
+};
+
 static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -813,6 +837,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				if (ctx->spkamp == SPKAMP_MAX98390) {
 					broxton_dais[i].codecs = max98390_codec;
 					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
+					broxton_dais[i].ops = &max_98390_ops;
 					broxton_dais[i].dpcm_capture = 1;
 				}
 			}
-- 
2.7.4

