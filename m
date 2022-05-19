Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCD52D980
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800EF174D;
	Thu, 19 May 2022 17:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800EF174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975786;
	bh=ryJNHss6QTGmLx8mkYYc5ksPTpXmVTzXHSB5zHuYWvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMttV1zlDkCmvJwaHYh62Gw0fy28TYboXU+3ykMd5sKg5zatKltyIAMWNt/fU70DS
	 bfCq+3s2AGi9+GRT84txfXRHXH/+E1AWNSs6gH7lmDp0XSxPJXm2XVDUbDr2P0LCCm
	 0HFL+aWQqHJU5EajhexXwEB2lTbnjREcUis/e+Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D78F80671;
	Thu, 19 May 2022 17:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A83A4F80617; Thu, 19 May 2022 17:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92DAEF80564
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DAEF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Hvf/VWWu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11w002261;
 Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M2IDrEb5l2+llrK3AWp4NytfJMdMlvgjjqfAQyTGOFY=;
 b=Hvf/VWWuJTxL/QeMVXtUWD9CdqbYQldrSJlKQnKSCLiMvKOM4CQOLMTKR5TkUxS18vej
 3gK7LDtO28l91Fa4owOa/Xh2fxF1/3OqFCrjS9vQVeej0K+ACQudoK6BWiPWSdDZTBUF
 V2X73VOv26SQiGDJKeuSxP4JXBJgvlD/0GXIgGQ3x/3h4Tj0Y1IkX4oJSxkzRLiZeSwQ
 rGl5AoHf1kBBSpyRO2PrSKmaCeG1SQvrO1bZnCt6Bxz2Pmd//glzWxbYUhgCcCB+ECKJ
 s3oqpa3VEQPF2AP0GfIYaaxfciBzN4CEoOcQdk7bHcq7Kb6Xe3oMKJpa8HmdZmmp0YUd Jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6425711D1;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 28/56] ASoC: core: Always send the CPU DAI a direct clock
 specifier
Date: Thu, 19 May 2022 16:42:50 +0100
Message-ID: <20220519154318.2153729-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-ORIG-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

All CPU drivers are now updated to accept a direct indication of
whether they are clock provider or consumer, rather than being told
if the CODEC is clock provider. As such update the core to always
pass this direct indication rather than only if the new set_fmt_new
callback is defined. Note this makes no difference to the CODEC
side of the DAI link as it was already being directly told if it
was clock provider under the old system.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 90f4265bea501..227540851dedf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1214,7 +1214,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1227,19 +1226,11 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 	}
 
-	/*
-	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
-	 */
-	inv_dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
+	/* Flip the polarity for the "CPU" end of link */
+	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		unsigned int fmt = dai_fmt;
-
-		if (cpu_dai->driver->ops->set_fmt_new ||
-		    snd_soc_component_is_codec(cpu_dai->component))
-			fmt = inv_dai_fmt;
-
-		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.30.2

