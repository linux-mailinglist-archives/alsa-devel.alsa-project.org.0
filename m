Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5568B1DC2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 11:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7D8E68;
	Thu, 25 Apr 2024 11:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7D8E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714036914;
	bh=RHq0DqfOKZzWA7H3SHOSOnycMt31YIuU1r7+RLKpICE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RrvN3U/WwCuSo3mSlAAV+vU7OYtYSAMPQM1DqEKH4Vnk7yNV/hjtaVUSMtONr/FrQ
	 0mHdtaiw4QWeyun52+azT2s8fLN2MR+nkw9oyM6cGPKbdaV9j9+XvgCrg4yWslwni1
	 XTRlgOwcIzI+uLnq7mw4Z6pXxrhlZ5lpvMHsBIeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E22F80614; Thu, 25 Apr 2024 11:20:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D2EF80620;
	Thu, 25 Apr 2024 11:20:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15668F805F2; Thu, 25 Apr 2024 11:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3077AF80423
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 11:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3077AF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=dj8P2gUg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43P6GnNS027760;
	Thu, 25 Apr 2024 09:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=vk8BVRfOCYOTgt76lYKJL4t+eNbI2f9A09Y25G0Lvgo=; b=dj
	8P2gUgaReLwZwp54e/Dc7hKiJ+ia9z9oeMPaXBjOaVrzRiRl20Y7PzFHcKpzDX4t
	Ire4i2QyquaxlazaIL7kzl49T11y56Z2EIgZAzSCQsVCKlPGgWhdJBBbUxV2IfKs
	z/L77rwn2xqv9O2lYaHorY4L0sHaqjC726WMM7ucnpuf04fJ2ovUTQY5hIJ0RvsY
	lxhlZK2wdOsmql+oZwrciiubn1xROHlN3Ecp9cMYzbnXIIc0zl8xGh0GR7d4H6EO
	6UDlZjXws7BueBKJ95yzLwcLpwQw2v6vIAqA4+IbXM5RTf0MbPN7NsIEQxnyzGas
	QCFB90BEJqmkb8v/FtZA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenh1msc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:20:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43P9KQpk017031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:20:26 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 02:20:21 -0700
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
CC: <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 4/7] ASoC: codecs: wcd937x: add basic controls
Date: Thu, 25 Apr 2024 14:48:54 +0530
Message-ID: <20240425091857.2161088-5-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425091857.2161088-1-quic_mohs@quicinc.com>
References: <20240425091857.2161088-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 37hNVuQOATfpsHaxgCLP_c3Hz_TNc7n1
X-Proofpoint-GUID: 37hNVuQOATfpsHaxgCLP_c3Hz_TNc7n1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=867 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250066
Message-ID-Hash: D5JFBEVPHLSSEVKEKX6PSZHX4PN3AL3M
X-Message-ID-Hash: D5JFBEVPHLSSEVKEKX6PSZHX4PN3AL3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5JFBEVPHLSSEVKEKX6PSZHX4PN3AL3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds basic controls found in WCD9370/WCD9375 codec.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 sound/soc/codecs/wcd937x.c | 212 +++++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index b2d5d29303b6..be63662a52be 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -121,6 +121,9 @@ struct wcd937x_priv {
 	atomic_t ana_clk_count;
 };
 
+static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
+static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
+
 struct wcd937x_mbhc_zdet_param {
 	u16 ldo_ctl;
 	u16 noff;
@@ -477,6 +480,169 @@ static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch
 	return 0;
 }
 
+static int wcd937x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd937x->hph_mode;
+	return 0;
+}
+
+static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+				snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	u32 mode_val;
+
+	mode_val = ucontrol->value.enumerated.item[0];
+	if (!mode_val) {
+		dev_warn(component->dev, "Invalid HPH Mode, default to class_AB\n");
+		mode_val = CLS_AB;
+	}
+
+	wcd937x->hph_mode = mode_val;
+
+	return 0;
+}
+
+static int wcd937x_ear_pa_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	u8 ear_pa_gain;
+
+	ear_pa_gain = snd_soc_component_read(component, WCD937X_ANA_EAR_COMPANDER_CTL);
+
+	ucontrol->value.integer.value[0] = FIELD_GET(WCD937X_EAR_GAIN_MASK, ear_pa_gain);
+
+	return 0;
+}
+
+static int wcd937x_ear_pa_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	u8 ear_pa_gain = 0;
+
+	ear_pa_gain = ucontrol->value.integer.value[0] << 2;
+
+	if (!wcd937x->comp1_enable) {
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_EAR_COMPANDER_CTL,
+					      0x7c, ear_pa_gain);
+	}
+
+	return 0;
+}
+
+static int wcd937x_get_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	ucontrol->value.integer.value[0] = hphr ? wcd937x->comp2_enable :
+						  wcd937x->comp1_enable;
+	return 0;
+}
+
+static int wcd937x_set_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[AIF1_PB];
+	int value = ucontrol->value.integer.value[0];
+	struct soc_mixer_control *mc;
+	int portidx;
+	bool hphr;
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+
+	if (hphr)
+		wcd937x->comp2_enable = value;
+	else
+		wcd937x->comp1_enable = value;
+
+	portidx = wcd->ch_info[mc->reg].port_num;
+
+	wcd937x_connect_port(wcd, portidx, mc->reg, !!value);
+
+	return 1;
+}
+
+static int wcd937x_get_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
+	struct wcd937x_sdw_priv *wcd;
+	int dai_id = mixer->shift;
+	int ch_idx = mixer->reg;
+	int portidx;
+
+	wcd = wcd937x->sdw_priv[dai_id];
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
+
+	return 0;
+}
+
+static int wcd937x_set_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
+	struct wcd937x_sdw_priv *wcd;
+	int dai_id = mixer->shift;
+	int ch_idx = mixer->reg;
+	int portidx;
+	bool enable;
+
+	wcd = wcd937x->sdw_priv[dai_id];
+
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	enable = !!ucontrol->value.integer.value[0];
+
+	wcd->port_enable[portidx] = enable;
+	wcd937x_connect_port(wcd, portidx, ch_idx, enable);
+
+	return 1;
+}
+
+static const char * const rx_hph_mode_mux_text[] = {
+	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
+	"CLS_H_ULP", "CLS_AB_HIFI",
+};
+
+static const char * const wcd937x_ear_pa_gain_text[] = {
+	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
+	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
+	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
+	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
+	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
+};
+
+static const struct soc_enum rx_hph_mode_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text), rx_hph_mode_mux_text);
+
+static SOC_ENUM_SINGLE_EXT_DECL(wcd937x_ear_pa_gain_enum, wcd937x_ear_pa_gain_text);
+
 /* MBHC related */
 static void wcd937x_mbhc_clk_setup(struct snd_soc_component *component,
 				   bool enable)
@@ -1151,6 +1317,50 @@ static void wcd937x_mbhc_deinit(struct snd_soc_component *component)
 
 /* END MBHC */
 
+static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
+	SOC_ENUM_EXT("EAR PA GAIN", wcd937x_ear_pa_gain_enum,
+		     wcd937x_ear_pa_gain_get, wcd937x_ear_pa_gain_put),
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
+		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
+
+	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+		       wcd937x_get_compander, wcd937x_set_compander),
+	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+		       wcd937x_get_compander, wcd937x_set_compander),
+
+	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD937X_HPH_R_EN, 0, 20, 1, line_gain),
+	SOC_SINGLE_TLV("ADC1 Volume", WCD937X_ANA_TX_CH1, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC2 Volume", WCD937X_ANA_TX_CH2, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC3 Volume", WCD937X_ANA_TX_CH3, 0, 20, 0, analog_gain),
+
+	SOC_SINGLE_EXT("HPHL Switch", WCD937X_HPH_L, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("HPHR Switch", WCD937X_HPH_R, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+
+	SOC_SINGLE_EXT("ADC1 Switch", WCD937X_ADC1, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("ADC2 Switch", WCD937X_ADC2, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("ADC3 Switch", WCD937X_ADC3, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC0 Switch", WCD937X_DMIC0, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC1 Switch", WCD937X_DMIC1, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("MBHC Switch", WCD937X_MBHC, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC2 Switch", WCD937X_DMIC2, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC3 Switch", WCD937X_DMIC3, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC4 Switch", WCD937X_DMIC4, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DMIC5 Switch", WCD937X_DMIC5, 1, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+};
+
 static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
 {
 	int vout_ctl[3];
@@ -1317,6 +1527,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.name = "wcd937x_codec",
 	.probe = wcd937x_soc_codec_probe,
 	.remove = wcd937x_soc_codec_remove,
+	.controls = wcd937x_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd937x_snd_controls),
 	.set_jack = wcd937x_codec_set_jack,
 	.endianness = 1,
 };
-- 
2.25.1

