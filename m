Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E052D971
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDCC616FD;
	Thu, 19 May 2022 17:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDCC616FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975650;
	bh=mzbzbd4d0Iq718faZ9f+PI1qVkiyUdLLyQVdhtUF0q4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aSEcxuUi1YhKE4VovYXlmc9tJe1vnx36AoWJjLSeDMIy+HRScv9Oh42dXfFtHIR6i
	 GSybfdjaI9czB7sOAwjjmUt54LAqsWOzR5PPe59X3GjoubkOZDMeU4qqhifHcvGiBM
	 JfhZGUxvoAQHzKtdBuNn1lx+mljqcF7CasrhIiN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B03D7F80621;
	Thu, 19 May 2022 17:44:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28290F805EF; Thu, 19 May 2022 17:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D13E8F80544
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13E8F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ORyx7ppv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtak024228;
 Thu, 19 May 2022 10:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/gQn5VqxSvFGthWPKYzAXcr6OhyWOljQxKT58oQ/PNs=;
 b=ORyx7ppv3ZYqmdTjinNhY95PTkMT6kF9bPchZUmTwu67B4i4rXPj4CG96ERS8wd/D43b
 bw+LuBUl9AbuCIJ13g8iPLmf/MgU0PqmG/iOcKVjNjppL03Hdq6VuoEMe67/RkuiFRXG
 2zRGqHwnafP3PFyb4B/VkQ2F5R3RraiIfGbzeqx8GRjLa8uvOYIRIxInoM3wSw3ez+xI
 fGBG50QEcUB7Cxeu6iIiMOywnxkehe2MYJ/NW+IDMys4HpxUDoNYSV5kVw/QO4OjjDfW
 GJYmTPMCPyk62ezMPizfxFwU/ZUtN3yJ/PwZ5E/FBMr0sAhz+x9v2AvBWU/1YFXfJw7x hA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8043211DB;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 30/56] ASoC: atmel: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:52 +0100
Message-ID: <20220519154318.2153729-31-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BV7oT_e1dJCP6p6_K2YC2RjwWOsk2pVq
X-Proofpoint-ORIG-GUID: BV7oT_e1dJCP6p6_K2YC2RjwWOsk2pVq
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/atmel/atmel-i2s.c     | 2 +-
 sound/soc/atmel/atmel_ssc_dai.c | 2 +-
 sound/soc/atmel/mchp-i2s-mcc.c  | 2 +-
 sound/soc/atmel/mchp-pdmc.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index c5ce695da5866..ba56d6ac7e571 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -533,7 +533,7 @@ static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
 	.prepare	= atmel_i2s_prepare,
 	.trigger	= atmel_i2s_trigger,
 	.hw_params	= atmel_i2s_hw_params,
-	.set_fmt_new	= atmel_i2s_set_dai_fmt,
+	.set_fmt	= atmel_i2s_set_dai_fmt,
 };
 
 static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index da094762dc994..c92905e343e7e 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -835,7 +835,7 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.prepare	= atmel_ssc_prepare,
 	.trigger	= atmel_ssc_trigger,
 	.hw_params	= atmel_ssc_hw_params,
-	.set_fmt_new	= atmel_ssc_set_dai_fmt,
+	.set_fmt	= atmel_ssc_set_dai_fmt,
 	.set_clkdiv	= atmel_ssc_set_dai_clkdiv,
 };
 
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 48d434e0c3318..269eab56b6dd9 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -877,7 +877,7 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.trigger	= mchp_i2s_mcc_trigger,
 	.hw_params	= mchp_i2s_mcc_hw_params,
 	.hw_free	= mchp_i2s_mcc_hw_free,
-	.set_fmt_new	= mchp_i2s_mcc_set_dai_fmt,
+	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
 	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
 };
 
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index b3f04fa2f6089..b9f6370594482 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -708,7 +708,7 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
-	.set_fmt_new	= mchp_pdmc_set_fmt,
+	.set_fmt	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
 	.shutdown	= mchp_pdmc_shutdown,
 	.hw_params	= mchp_pdmc_hw_params,
-- 
2.30.2

