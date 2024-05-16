Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229FF8C7120
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 06:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577B1DEC;
	Thu, 16 May 2024 06:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577B1DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715835059;
	bh=ilH8f3oCmov3SrLFV7X65XPHOPIzgkkeT4uE4QBLjV0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8epkHGo4WgphlVwkxyfxUUeBDpzQCIxmOfdIkfkr6og4LZ0Y7a4FKy3vHfC208dx
	 qxusDuvbiF2irpuF6GCMaR6j+ROtDTv2IDkCNPZ0cBAh9SSj4tyA7/Wc7QEqL2rTsh
	 ioqZ+xFHpj5pKeVobvkrXfECb8ZQzf6TZ6wZcgZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 233A2F80618; Thu, 16 May 2024 06:49:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B07F80615;
	Thu, 16 May 2024 06:49:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFB26F805F0; Thu, 16 May 2024 06:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 460CEF804FB
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 06:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 460CEF804FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YsaAHPVi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44FKGVLE012294;
	Thu, 16 May 2024 04:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=hQGDi/4ePTkE/SNT4pc4Lu+TMU/kyCBMOpZriGy+XTo=; b=Ys
	aAHPViLWVhdUG0T/+rGCCL9rB7U5MLVifco9n1sK+eugYlpxBBQipk3VB+UN7ILR
	Q32u1+6uZUO2YCcjfGUxoYbThpyCOcXEUlJHYjd4Q9HUV4V27yk/+DDi6jg/vKxD
	RipABieKFbp5dxkP4tWoVVQJEoWl41axwqkP8Pjrf11DQRo72Rn+68vhQaiXyTWe
	0mcJFE8WTlNm3alpBGwwCH3TfETpZWBLraY6/hI2VzdAH+7/3BscV+szhtcaAWV3
	pSZMvI7+TAoCXdPCS6au6Z8b78wK2k2w3VoAhTIqVNQXD1p7WuR7lRXv5OO18Z3U
	kFn5x3zJ9TGUMFUHTP9Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28qaa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44G4nBAe011501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:11 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 21:49:06 -0700
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
Subject: [PATCH v4 5/7] ASoC: codecs: wcd937x: add playback dapm widgets
Date: Thu, 16 May 2024 10:17:59 +0530
Message-ID: <20240516044801.1061838-6-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: WSklxJd3JZtOi3t1bFfuKSytMSf0JSAw
X-Proofpoint-GUID: WSklxJd3JZtOi3t1bFfuKSytMSf0JSAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=731
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160031
Message-ID-Hash: TCPV6J4WFE3VR4SDXOYOPFGFVYQKG3H6
X-Message-ID-Hash: TCPV6J4WFE3VR4SDXOYOPFGFVYQKG3H6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCPV6J4WFE3VR4SDXOYOPFGFVYQKG3H6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds required dapm widgets for playback.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x.c | 667 +++++++++++++++++++++++++++++++++++++
 1 file changed, 667 insertions(+)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 32d94620f911..cccb1fcb0741 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -341,6 +341,569 @@ static int wcd937x_rx_clk_disable(struct snd_soc_component *component)
 	return 0;
 }
 
+static int wcd937x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(0), BIT(0));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_RDAC_CLK_CTL1,
+					      BIT(7), 0x00);
+		set_bit(HPH_COMP_DELAY, &wcd937x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+						      0x0f, BIT(1));
+		else if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+						      0x0f, 0x06);
+
+		if (wcd937x->comp1_enable) {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(1), BIT(1));
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_L_EN,
+						      BIT(5), 0x00);
+
+			if (wcd937x->comp2_enable) {
+				snd_soc_component_update_bits(component,
+							      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+							      BIT(0), BIT(0));
+				snd_soc_component_update_bits(component,
+							      WCD937X_HPH_R_EN, BIT(5), 0x00);
+			}
+
+			if (test_bit(HPH_COMP_DELAY, &wcd937x->status_mask)) {
+				usleep_range(5000, 5110);
+				clear_bit(HPH_COMP_DELAY, &wcd937x->status_mask);
+			}
+		} else {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(1), 0x00);
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_L_EN,
+						      BIT(5), BIT(5));
+		}
+
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_HPH_TIMER1,
+					      BIT(1), 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+					      0x0f, BIT(0));
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL, BIT(1), BIT(1));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_HPH_GAIN_CTL, BIT(3), BIT(3));
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_RDAC_CLK_CTL1, BIT(7), 0x00);
+		set_bit(HPH_COMP_DELAY, &wcd937x->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+						      0x0f, BIT(1));
+		else if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+						      0x0f, 0x06);
+		if (wcd937x->comp2_enable) {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(0), BIT(0));
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_R_EN, BIT(5), 0x00);
+			if (wcd937x->comp1_enable) {
+				snd_soc_component_update_bits(component,
+							      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+							      BIT(1), BIT(1));
+				snd_soc_component_update_bits(component,
+							      WCD937X_HPH_L_EN,
+							      BIT(5), 0x00);
+			}
+
+			if (test_bit(HPH_COMP_DELAY, &wcd937x->status_mask)) {
+				usleep_range(5000, 5110);
+				clear_bit(HPH_COMP_DELAY, &wcd937x->status_mask);
+			}
+		} else {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(0), 0x00);
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_R_EN,
+						      BIT(5), BIT(5));
+		}
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_HPH_TIMER1,
+					      BIT(1), 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R,
+					      0x0f, BIT(0));
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_HPH_GAIN_CTL,
+					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(0), BIT(0));
+
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+						      0x0f, BIT(1));
+		else if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+						      0x0f, 0x06);
+		if (wcd937x->comp1_enable)
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(1), BIT(1));
+		usleep_range(5000, 5010);
+
+		snd_soc_component_update_bits(component, WCD937X_FLYBACK_EN, BIT(2), 0x00);
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_EAR,
+					hph_mode);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_LOHIFI ||
+		    hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,
+						      0x0f, BIT(0));
+		if (wcd937x->comp1_enable)
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_COMP_CTL_0,
+						      BIT(1), 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
+					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_AUX_GAIN_CTL,
+					      BIT(0), BIT(0));
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_AUX,
+					hph_mode);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
+					      BIT(2), 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHR,
+					hph_mode);
+		snd_soc_component_update_bits(component, WCD937X_ANA_HPH,
+					      BIT(4), BIT(4));
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL1,
+					      0x07, 0x03);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (test_bit(HPH_PA_DELAY, &wcd937x->status_mask)) {
+			if (wcd937x->comp2_enable)
+				usleep_range(7000, 7100);
+			else
+				usleep_range(20000, 20100);
+			clear_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		}
+
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_HPH_TIMER1,
+					      BIT(1), BIT(1));
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+		enable_irq(wcd937x->hphr_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
+		set_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		wcd_mbhc_event_notify(wcd937x->wcd_mbhc, WCD_EVENT_PRE_HPHR_PA_OFF);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (test_bit(HPH_PA_DELAY, &wcd937x->status_mask)) {
+			if (wcd937x->comp2_enable)
+				usleep_range(7000, 7100);
+			else
+				usleep_range(20000, 20100);
+			clear_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		}
+
+		wcd_mbhc_event_notify(wcd937x->wcd_mbhc, WCD_EVENT_POST_HPHR_PA_OFF);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL1, 0x07, 0x00);
+		snd_soc_component_update_bits(component, WCD937X_ANA_HPH,
+					      BIT(4), 0x00);
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHR,
+					hph_mode);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHL,
+					hph_mode);
+		snd_soc_component_update_bits(component, WCD937X_ANA_HPH,
+					      BIT(5), BIT(5));
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL0, 0x07, 0x03);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (test_bit(HPH_PA_DELAY, &wcd937x->status_mask)) {
+			if (!wcd937x->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		}
+
+		snd_soc_component_update_bits(component,
+					      WCD937X_HPH_NEW_INT_HPH_TIMER1,
+					      BIT(1), BIT(1));
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+		enable_irq(wcd937x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
+		set_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		wcd_mbhc_event_notify(wcd937x->wcd_mbhc, WCD_EVENT_PRE_HPHL_PA_OFF);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (test_bit(HPH_PA_DELAY, &wcd937x->status_mask)) {
+			if (!wcd937x->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd937x->status_mask);
+		}
+
+		wcd_mbhc_event_notify(wcd937x->wcd_mbhc, WCD_EVENT_POST_HPHL_PA_OFF);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL0, 0x07, 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_HPH, BIT(5), 0x00);
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHL,
+					hph_mode);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL2,
+					      BIT(0), BIT(0));
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1010);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+		enable_irq(wcd937x->aux_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		usleep_range(2000, 2010);
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_AUX,
+					hph_mode);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_PDM_WD_CTL2,
+					      BIT(0), 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int hph_mode = wcd937x->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable watchdog interrupt for HPHL or AUX depending on mux value */
+		wcd937x->ear_rx_path = snd_soc_component_read(component,
+							      WCD937X_DIGITAL_CDC_EAR_PATH_CTL);
+
+		if (wcd937x->ear_rx_path & EAR_RX_PATH_AUX)
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_PDM_WD_CTL2,
+						      BIT(0), BIT(0));
+		else
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_PDM_WD_CTL0,
+						      0x07, 0x03);
+		if (!wcd937x->comp1_enable)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_EAR_COMPANDER_CTL,
+						      BIT(7), BIT(7));
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(6000, 6010);
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+
+		if (wcd937x->ear_rx_path & EAR_RX_PATH_AUX)
+			enable_irq(wcd937x->aux_pdm_wd_int);
+		else
+			enable_irq(wcd937x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		if (wcd937x->ear_rx_path & EAR_RX_PATH_AUX)
+			disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+		else
+			disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (!wcd937x->comp1_enable)
+			snd_soc_component_update_bits(component,
+						      WCD937X_ANA_EAR_COMPANDER_CTL,
+						      BIT(7), 0x00);
+		usleep_range(7000, 7010);
+		wcd_clsh_ctrl_set_state(wcd937x->clsh_info,
+					WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_EAR,
+					hph_mode);
+		snd_soc_component_update_bits(component, WCD937X_FLYBACK_EN,
+					      BIT(2), BIT(2));
+
+		if (wcd937x->ear_rx_path & EAR_RX_PATH_AUX)
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_PDM_WD_CTL2,
+						      BIT(0), 0x00);
+		else
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_PDM_WD_CTL0,
+						      0x07, 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_enable_rx1(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	if (event == SND_SOC_DAPM_POST_PMD) {
+		wcd937x_rx_clk_disable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(0), 0x00);
+	}
+
+	return 0;
+}
+
+static int wcd937x_enable_rx2(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	if (event == SND_SOC_DAPM_POST_PMD) {
+		wcd937x_rx_clk_disable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(1), 0x00);
+	}
+
+	return 0;
+}
+
+static int wcd937x_enable_rx3(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	if (event == SND_SOC_DAPM_POST_PMD) {
+		usleep_range(6000, 6010);
+		wcd937x_rx_clk_disable(component);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(2), 0x00);
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_vdd_buck(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol,
+					 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (test_bit(ALLOW_BUCK_DISABLE, &wcd937x->status_mask)) {
+			dev_err(component->dev, "buck already in enabled state\n");
+			clear_bit(ALLOW_BUCK_DISABLE, &wcd937x->status_mask);
+			return 0;
+		}
+		ret = regulator_enable(wcd937x->buck_supply);
+		if (ret) {
+			dev_err(component->dev, "VDD_BUCK is not enabled\n");
+			return ret;
+		}
+		clear_bit(ALLOW_BUCK_DISABLE, &wcd937x->status_mask);
+		usleep_range(200, 250);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		set_bit(ALLOW_BUCK_DISABLE, &wcd937x->status_mask);
+		break;
+	}
+
+	return 0;
+}
+
 static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
 {
 	if (micb_mv < 1000 || micb_mv > 2850) {
@@ -1360,6 +1923,108 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 };
 
+static const struct snd_kcontrol_new ear_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new aux_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphl_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphr_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const char * const rdac3_mux_text[] = {
+	"RX1", "RX3"
+};
+
+static const struct soc_enum rdac3_enum =
+	SOC_ENUM_SINGLE(WCD937X_DIGITAL_CDC_EAR_PATH_CTL, 0,
+			ARRAY_SIZE(rdac3_mux_text), rdac3_mux_text);
+
+static const struct snd_kcontrol_new rx_rdac3_mux = SOC_DAPM_ENUM("RDAC3_MUX Mux", rdac3_enum);
+
+static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
+	/* Input widgets */
+	SND_SOC_DAPM_INPUT("IN1_HPHL"),
+	SND_SOC_DAPM_INPUT("IN2_HPHR"),
+	SND_SOC_DAPM_INPUT("IN3_AUX"),
+
+	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_vdd_buck,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("CLS_H_PORT", 1, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* RX widgets */
+	SND_SOC_DAPM_PGA_E("EAR PGA", WCD937X_ANA_EAR, 7, 0, NULL, 0,
+			   wcd937x_codec_enable_ear_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("AUX PGA", WCD937X_AUX_AUXPA, 7, 0, NULL, 0,
+			   wcd937x_codec_enable_aux_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD937X_ANA_HPH, 7, 0, NULL, 0,
+			   wcd937x_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD937X_ANA_HPH, 6, 0, NULL, 0,
+			   wcd937x_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC2", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC3", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_ear_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC4", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_aux_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RDAC3_MUX", SND_SOC_NOPM, 0, 0, &rx_rdac3_mux),
+
+	SND_SOC_DAPM_MIXER_E("RX1", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd937x_enable_rx1, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("RX2", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd937x_enable_rx2, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("RX3", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd937x_enable_rx3, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	/* RX mixer widgets*/
+	SND_SOC_DAPM_MIXER("EAR_RDAC", SND_SOC_NOPM, 0, 0,
+			   ear_rdac_switch, ARRAY_SIZE(ear_rdac_switch)),
+	SND_SOC_DAPM_MIXER("AUX_RDAC", SND_SOC_NOPM, 0, 0,
+			   aux_rdac_switch, ARRAY_SIZE(aux_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHL_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphl_rdac_switch, ARRAY_SIZE(hphl_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
+
+	/* RX output widgets */
+	SND_SOC_DAPM_OUTPUT("EAR"),
+	SND_SOC_DAPM_OUTPUT("AUX"),
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+};
+
 static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
 {
 	int vout_ctl[3];
@@ -1528,6 +2193,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.remove = wcd937x_soc_codec_remove,
 	.controls = wcd937x_snd_controls,
 	.num_controls = ARRAY_SIZE(wcd937x_snd_controls),
+	.dapm_widgets = wcd937x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd937x_dapm_widgets),
 	.set_jack = wcd937x_codec_set_jack,
 	.endianness = 1,
 };
-- 
2.25.1

