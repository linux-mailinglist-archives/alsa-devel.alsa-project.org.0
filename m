Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0203A7B49
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2347816B0;
	Tue, 15 Jun 2021 11:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2347816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623751016;
	bh=HlT2grMHz83aYRBinV9Rbkb4vK+1EtzS22K7ueZF5Mk=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:In-Reply-To:
	 References:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I7BkMKboR5LPPuyOrVQ9AmwvCF2hwr5ePGeeBCUlHMRqLYnsf8YD03nIOw+O9rTP9
	 FAU6asgbcL9fMg98yu0c3d2DMytLCViFW8K0/uyxHc9ysd9S+mwuEZ0epJw+xzWnMC
	 gPhdnM2SJavrCtSAhhw8jcjXJswee7U+oUFGOD/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD69F80515;
	Tue, 15 Jun 2021 11:52:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCAEBF80424; Mon, 14 Jun 2021 22:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 337CEF8025E
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 22:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 337CEF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="bdGrUyS4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3077F6128A
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="bdGrUyS4"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Mon, 14 Jun 2021 21:12:47 +0100
Resent-Message-ID: <20210614201247.GH5646@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Sat, 05 Jun 2021 03:29:43 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org>)
 id 1lpM4D-004Jha-1Y
 for broonie@sirena.co.uk; Sat, 05 Jun 2021 03:29:43 +0100
Received: by mail.kernel.org (Postfix)
 id 87A2B61417; Sat,  5 Jun 2021 02:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D8837613F1
 for <broonie@kernel.org>; Sat,  5 Jun 2021 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8837613F1
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none)
 header.from=disroot.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=ultracoolguy@disroot.org
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 987F25BDCB;
 Sat,  5 Jun 2021 04:23:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtnHM_Ogu9Ov; Sat,  5 Jun 2021 04:23:23 +0200 (CEST)
From: Gabriel David <ultracoolguy@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1622859803; bh=HlT2grMHz83aYRBinV9Rbkb4vK+1EtzS22K7ueZF5Mk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bdGrUyS4lS9TRIi4ktfVbgc0829TKPWHKOhXX/Poukg/u0fqbE8evtzvYk5Py162j
 vvSQYF5oCRRye9+CAHxdM9ilcPq8LaUK+vwQHgAHmhTjxaCHSowzMUZ7zAXbBHiWNi
 /KiLjcT5jNgfL+zt3sB3xp0r0klgEkbmIjWpK/wz2NYu1ajXq74V7V85BoEUp2vtyC
 VvKnIg2d02MFrJvptHpPbFNOwSj0iEDK/yeR/gxDBTKb9sqlYiM5fQu8Pn8t1GsxG9
 GoThBYwVEnAWYnFe9Ybg05iMdcw9kv2RxniNp9lyzR9YLaZ1z4waClgMB/rDAOADfm
 2MNCuh1RP0t/Q==
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Date: Fri,  4 Jun 2021 22:22:05 -0400
Message-Id: <20210605022206.13226-4-ultracoolguy@disroot.org>
In-Reply-To: <20210605022206.13226-1-ultracoolguy@disroot.org>
References: <20210605022206.13226-1-ultracoolguy@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org
Subject: [PATCH 3/4] ASoC: qdsp6: q6afe-dai: Add Quinary MI2S ports
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: Q89eNM6IyMDf
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: alsa-devel@alsa-project.org, Gabriel David <ultracoolguy@disroot.org>
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

This patch adds support to Quinary MI2S ports supported in AFE.

Signed-off-by: Gabriel David <ultracoolguy@disroot.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index b539af86e8f7..ac8f7324e94b 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -475,6 +475,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_slim_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].slim);
 		break;
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
@@ -598,6 +599,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Secondary MI2S Playback", NULL, "SEC_MI2S_RX"},
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
+	{"Quinary MI2S Playback", NULL, "QUIN_MI2S_RX"},
 
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
@@ -693,6 +695,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"PRI_MI2S_TX", NULL, "Primary MI2S Capture"},
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
+	{"QUIN_MI2S_TX", NULL, "Quinary MI2S Capture"},
 
 	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
 	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
@@ -1190,6 +1193,39 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.ops = &q6i2s_ops,
 		.probe = msm_dai_q6_dai_probe,
 		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.playback = {
+			.stream_name = "Quinary MI2S Playback",
+			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
+			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
+			SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = QUINARY_MI2S_RX,
+		.name = "QUIN_MI2S_RX",
+		.ops = &q6i2s_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.capture = {
+			.stream_name = "Quinary MI2S Capture",
+			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = QUINARY_MI2S_TX,
+		.name = "QUIN_MI2S_TX",
+		.ops = &q6i2s_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
 	},
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
@@ -1349,6 +1385,10 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("QUIN_MI2S_RX", NULL,
+						0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("QUIN_MI2S_TX", NULL,
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_MI2S_RX", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_MI2S_TX", NULL,
@@ -1610,6 +1650,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 
 		switch (id) {
 		/* MI2S specific properties */
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
-- 
2.31.1

