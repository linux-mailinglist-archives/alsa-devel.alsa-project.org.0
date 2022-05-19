Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20652D9A5
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F6D1779;
	Thu, 19 May 2022 17:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F6D1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975988;
	bh=Xuqdt2ICVEYvGpDIyib3R+xe8QkSqHv0ng0m18h5HIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1eK/NfzG7Z3O5wHcWfFbrtNQQbQi61qtU19V+cuqgfUqEJCw/0sRu7u0cwTWUvbl
	 zc9ojDQdJLpDhMeepI1SWn7qYOceqMF1nLslCPQdKuw2rhOXpzribyM7KmUQSBDTcT
	 tkYxRDCBxAisOFYDNcakOebp4mhZ6BV1ObXuQhKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E3FF80718;
	Thu, 19 May 2022 17:44:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA20F80641; Thu, 19 May 2022 17:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB12FF805AE
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB12FF805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Fw/l0bUS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k129002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hpWl9/bUWKRwQHJWsXvwf+TuqinqBEKEX6V0X98Nggc=;
 b=Fw/l0bUSgqC4OivzJSIcCexpxxvG2/bHSdr53Q4MovYkon1mdhUDBThA2TV21toEPOyh
 gYsliKEGnUclbAMW3OuorOHUB1zmeDPtmzszmXuD43m1HhJu6GcdRIDWIf0xm2B/GBsF
 V7M2e8odu8slrYcWLG7N0yn6K7b4dFIAScBlMJoR5qeruryRvxSZLbiEVtEYMQK+uwaZ
 +CDWu834y9A8ByuDGJjTIhwPE0seJWPyiRfmuW1BFneIQFxszeA6f2LqoyR6UYFrfodL
 0XCH9NujpiTNRZsj6I9nwStTHAIOFz5rikDqF/i1I8DT5snycJo1UnjoVeY6j2sfaFea 0g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40A3411DB;
 Thu, 19 May 2022 15:43:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 40/56] ASoC: mediatek: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:02 +0100
Message-ID: <20220519154318.2153729-41-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NrmIbN4w5_yL228UDyFvtSPeRhWUvcZD
X-Proofpoint-ORIG-GUID: NrmIbN4w5_yL228UDyFvtSPeRhWUvcZD
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
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 ++--
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5f7c9516dfa18..c2e268054773d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2346,7 +2346,7 @@ static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.hw_params = mtk_dai_etdm_hw_params,
 	.trigger = mtk_dai_etdm_trigger,
 	.set_sysclk = mtk_dai_etdm_set_sysclk,
-	.set_fmt_new = mtk_dai_etdm_set_fmt,
+	.set_fmt = mtk_dai_etdm_set_fmt,
 	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
 };
 
@@ -2356,7 +2356,7 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
-	.set_fmt_new	= mtk_dai_etdm_set_fmt,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 37a8968ac21dc..caceb0deb467f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -282,7 +282,7 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
-	.set_fmt_new	= mtk_dai_pcm_set_fmt,
+	.set_fmt	= mtk_dai_pcm_set_fmt,
 };
 
 /* dai driver */
-- 
2.30.2

