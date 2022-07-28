Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B4583946
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 09:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA3F1631;
	Thu, 28 Jul 2022 09:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA3F1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658992331;
	bh=mejG/NDCyAjMqXkPaA1wiWAjkdJCdXOwRKPUnzLBIqM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TTjf/IgoBTZqzWK+8MsJeDgpp+GRBuRcDRiUPSDjYX/N2yGi3n+vL3YzeG1WZwVm8
	 B26ab1ff1stels6uDrgpKEiokj+5+0DDxAKFTf0bSgj63WW+OGl331RGXirjibrkg9
	 cvj3k5sIoOTlAeBmPGLHKrEs6MQx9VhX9/VXchOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C63BDF80508;
	Thu, 28 Jul 2022 09:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77484F800FA; Thu, 28 Jul 2022 09:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3D63F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 09:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D63F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="fpWgvXZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658992264; x=1690528264;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=R4lt1h/LtXD8XZCgX0MqvcNhHlPUrXLCVf+2J1eJ5RA=;
 b=fpWgvXZbxxMFrl1v4hVEhSbzGqHIJJWDcLpd5Aqz5wENPhgJb1XjOoe3
 BjNv2r0Xbl2pBXVxpIj84o6dfneOcURlnpByCjjg7haejghlk7f8PGMDP
 IgY3whcs2er7iZVk63nLgVcGP4hQbOeVeIE/S1mi+l6KEaMBrXNs3PVq+ 4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jul 2022 00:10:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 00:10:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 00:10:55 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 00:10:50 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] ASoC: qcom: SC7280: Add support for external DMIC bias supply
Date: Thu, 28 Jul 2022 12:40:33 +0530
Message-ID: <1658992233-28372-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update SC7280 machine driver for enabling external mic bias supply,
Which is required for villager rev boards.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 sound/soc/qcom/sc7280.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index da7469a..6404e94 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -33,6 +33,7 @@ struct sc7280_snd_data {
 	struct snd_soc_jack hdmi_jack;
 	bool jack_setup;
 	bool stream_prepared[LPASS_MAX_PORTS];
+	struct regulator *vdd_supply;
 };
 
 static void sc7280_jack_free(struct snd_jack *jack)
@@ -345,6 +346,24 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 	return ret;
 }
 
+static int sc7280_dmic_micbias(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = regulator_enable(data->vdd_supply);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = regulator_disable(data->vdd_supply);
+		break;
+	}
+	return ret;
+}
+
 static const struct snd_soc_ops sc7280_ops = {
 	.startup = sc7280_snd_startup,
 	.hw_params = sc7280_snd_hw_params,
@@ -356,6 +375,7 @@ static const struct snd_soc_ops sc7280_ops = {
 static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("PMIC BIAS", sc7280_dmic_micbias),
 };
 
 static int sc7280_snd_platform_probe(struct platform_device *pdev)
@@ -389,6 +409,10 @@ static int sc7280_snd_platform_probe(struct platform_device *pdev)
 		link->ops = &sc7280_ops;
 	}
 
+	data->vdd_supply = devm_regulator_get(dev, "vdd-dmic-bias");
+	if (IS_ERR(data->vdd_supply)
+		return PTR_ERR(data->vdd_supply);
+
 	return devm_snd_soc_register_card(dev, card);
 }
 
-- 
2.7.4

