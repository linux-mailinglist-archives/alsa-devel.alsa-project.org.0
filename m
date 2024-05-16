Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70A8C7128
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 06:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E22DF6;
	Thu, 16 May 2024 06:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E22DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715835089;
	bh=ksqeTxiAUsnpvkXfnBNPMyNSYZjCWVY13a0e2mxySiA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bwDjzwSopkLbIa9lvNyzaLqKkFbsazmwdtbdN2j3uIFlU2gCuAaJdJuI5jLDjxVcy
	 CnKCzwqD1XWsNRte8h++492NPS7OEBNlZGexPt3+1P8uQbPlsO/PbabdiwAyxGKAUY
	 P7Kpr9ZgQ+PoneNzjJORXDNJ5+/qUZ0lEqurBJ1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41BE1F8065E; Thu, 16 May 2024 06:49:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB4AF8067B;
	Thu, 16 May 2024 06:49:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1238F805B3; Thu, 16 May 2024 06:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AC10F80224
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 06:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC10F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LeyOqVpa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44FM8J8E012163;
	Thu, 16 May 2024 04:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=HO2sxxi023XdGNsGIJXgSAc9lJcSuU1g/NM3thqasSI=; b=Le
	yOqVpaxjoJ8LJWtlh1Q4Wow887/g4wVzs5zwIOjfD1bw1krrLOJc3xmBj3HhC+gI
	xbmS/Q3BhmpLieuZjBMDu31HumkkmrowrLGRCKHwbN+f4HXiqCzNHwh7HfWNlMJI
	f7H4+0SRZx2TlwMphQqaNYMC20FfWyTpDddHZ+HYmQauhcScdtfyLagQL5oXhP1q
	FIp+DTe60SovxZe9d127oHbh5EE202t2xywtgiF0nObs9qVI50QnHOSAUHAuXFqI
	e26KQcYNpPAqL2MoHQGZ/FowJRaGNy5f3yAerLwSOpte+kaWib4jDwXOcY1atSMZ
	vSg0lP+Z5VctKrmEy7vA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28qaad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44G4nLtW020670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:21 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 21:49:16 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v4 7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
Date: Thu, 16 May 2024 10:18:01 +0530
Message-ID: <20240516044801.1061838-8-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516044801.1061838-1-quic_mohs@quicinc.com>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pugH2yf-icJLmSXldL5XcyD_1ZUog09r
X-Proofpoint-GUID: pugH2yf-icJLmSXldL5XcyD_1ZUog09r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160031
Message-ID-Hash: HKGLG7CFEJTGOQHWTXYSR5PLAAEVZGGA
X-Message-ID-Hash: HKGLG7CFEJTGOQHWTXYSR5PLAAEVZGGA
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKGLG7CFEJTGOQHWTXYSR5PLAAEVZGGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds audio routing for both playback and capture and
Makefile and Kconfigs changes for wcd937x.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/Kconfig   | 20 ++++++++++
 sound/soc/codecs/Makefile  |  7 ++++
 sound/soc/codecs/wcd937x.c | 80 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4afc43d3f71f..a6bb5716632d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -278,6 +278,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_WCD937X_SDW
 	imply SND_SOC_WCD938X_SDW
 	imply SND_SOC_WCD939X_SDW
 	imply SND_SOC_LPASS_MACRO_COMMON
@@ -2100,6 +2101,25 @@ config SND_SOC_WCD934X
 	  The WCD9340/9341 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SDM845.
 
+config SND_SOC_WCD937X
+	depends on SND_SOC_WCD937X_SDW
+	tristate
+	depends on SOUNDWIRE || !SOUNDWIRE
+	select SND_SOC_WCD_CLASSH
+
+config SND_SOC_WCD937X_SDW
+	tristate "WCD9370/WCD9375 Codec - SDW"
+	select SND_SOC_WCD937X
+	select SND_SOC_WCD_MBHC
+	select REGMAP_IRQ
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	help
+	  The WCD9370/9375 is an audio codec IC used with SoCs
+	  like SC7280 or QCM6490 chipsets, and it connected
+	  via soundwire.
+	  To compile this codec driver say Y or m.
+
 config SND_SOC_WCD938X
 	depends on SND_SOC_WCD938X_SDW
 	tristate
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index b4df22186e25..c6f0cd5815f2 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -316,6 +316,8 @@ snd-soc-wcd-classh-y := wcd-clsh-v2.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
+snd-soc-wcd937x-objs := wcd937x.o
+snd-soc-wcd937x-sdw-objs := wcd937x-sdw.o
 snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
@@ -710,6 +712,11 @@ obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
+obj-$(CONFIG_SND_SOC_WCD937X)	+= snd-soc-wcd937x.o
+ifdef CONFIG_SND_SOC_WCD937X_SDW
+# avoid link failure by forcing sdw code built-in when needed
+obj-$(CONFIG_SND_SOC_WCD937X) += snd-soc-wcd937x-sdw.o
+endif
 obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
 ifdef CONFIG_SND_SOC_WCD938X_SDW
 # avoid link failure by forcing sdw code built-in when needed
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 8c1c0d7a0fa0..81263596d891 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2420,6 +2420,77 @@ static const struct snd_soc_dapm_widget wcd9375_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("DMIC6_OUTPUT"),
 };
 
+static const struct snd_soc_dapm_route wcd937x_audio_map[] = {
+	{ "ADC1_OUTPUT", NULL, "ADC1_MIXER" },
+	{ "ADC1_MIXER", "Switch", "ADC1 REQ" },
+	{ "ADC1 REQ", NULL, "ADC1" },
+	{ "ADC1", NULL, "AMIC1" },
+
+	{ "ADC2_OUTPUT", NULL, "ADC2_MIXER" },
+	{ "ADC2_MIXER", "Switch", "ADC2 REQ" },
+	{ "ADC2 REQ", NULL, "ADC2" },
+	{ "ADC2", NULL, "ADC2 MUX" },
+	{ "ADC2 MUX", "INP3", "AMIC3" },
+	{ "ADC2 MUX", "INP2", "AMIC2" },
+
+	{ "IN1_HPHL", NULL, "VDD_BUCK" },
+	{ "IN1_HPHL", NULL, "CLS_H_PORT" },
+	{ "RX1", NULL, "IN1_HPHL" },
+	{ "RDAC1", NULL, "RX1" },
+	{ "HPHL_RDAC", "Switch", "RDAC1" },
+	{ "HPHL PGA", NULL, "HPHL_RDAC" },
+	{ "HPHL", NULL, "HPHL PGA" },
+
+	{ "IN2_HPHR", NULL, "VDD_BUCK" },
+	{ "IN2_HPHR", NULL, "CLS_H_PORT" },
+	{ "RX2", NULL, "IN2_HPHR" },
+	{ "RDAC2", NULL, "RX2" },
+	{ "HPHR_RDAC", "Switch", "RDAC2" },
+	{ "HPHR PGA", NULL, "HPHR_RDAC" },
+	{ "HPHR", NULL, "HPHR PGA" },
+
+	{ "IN3_AUX", NULL, "VDD_BUCK" },
+	{ "IN3_AUX", NULL, "CLS_H_PORT" },
+	{ "RX3", NULL, "IN3_AUX" },
+	{ "RDAC4", NULL, "RX3" },
+	{ "AUX_RDAC", "Switch", "RDAC4" },
+	{ "AUX PGA", NULL, "AUX_RDAC" },
+	{ "AUX", NULL, "AUX PGA" },
+
+	{ "RDAC3_MUX", "RX3", "RX3" },
+	{ "RDAC3_MUX", "RX1", "RX1" },
+	{ "RDAC3", NULL, "RDAC3_MUX" },
+	{ "EAR_RDAC", "Switch", "RDAC3" },
+	{ "EAR PGA", NULL, "EAR_RDAC" },
+	{ "EAR", NULL, "EAR PGA" },
+};
+
+static const struct snd_soc_dapm_route wcd9375_audio_map[] = {
+	{ "ADC3_OUTPUT", NULL, "ADC3_MIXER" },
+	{ "ADC3_OUTPUT", NULL, "ADC3_MIXER" },
+	{ "ADC3_MIXER", "Switch", "ADC3 REQ" },
+	{ "ADC3 REQ", NULL, "ADC3" },
+	{ "ADC3", NULL, "AMIC4" },
+
+	{ "DMIC1_OUTPUT", NULL, "DMIC1_MIXER" },
+	{ "DMIC1_MIXER", "Switch", "DMIC1" },
+
+	{ "DMIC2_OUTPUT", NULL, "DMIC2_MIXER" },
+	{ "DMIC2_MIXER", "Switch", "DMIC2" },
+
+	{ "DMIC3_OUTPUT", NULL, "DMIC3_MIXER" },
+	{ "DMIC3_MIXER", "Switch", "DMIC3" },
+
+	{ "DMIC4_OUTPUT", NULL, "DMIC4_MIXER" },
+	{ "DMIC4_MIXER", "Switch", "DMIC4" },
+
+	{ "DMIC5_OUTPUT", NULL, "DMIC5_MIXER" },
+	{ "DMIC5_MIXER", "Switch", "DMIC5" },
+
+	{ "DMIC6_OUTPUT", NULL, "DMIC6_MIXER" },
+	{ "DMIC6_MIXER", "Switch", "DMIC6" },
+};
+
 static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
 {
 	int vout_ctl[3];
@@ -2556,6 +2627,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 			dev_err(component->dev, "Failed to add snd_ctls\n");
 			return ret;
 		}
+
+		ret = snd_soc_dapm_add_routes(dapm, wcd9375_audio_map,
+					      ARRAY_SIZE(wcd9375_audio_map));
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to add routes\n");
+			return ret;
+		}
 	}
 
 	ret = wcd937x_mbhc_init(component);
@@ -2599,6 +2677,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.num_controls = ARRAY_SIZE(wcd937x_snd_controls),
 	.dapm_widgets = wcd937x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd937x_dapm_widgets),
+	.dapm_routes = wcd937x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd937x_audio_map),
 	.set_jack = wcd937x_codec_set_jack,
 	.endianness = 1,
 };
-- 
2.25.1

