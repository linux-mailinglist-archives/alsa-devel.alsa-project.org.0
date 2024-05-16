Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A718C711A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 06:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4587F1;
	Thu, 16 May 2024 06:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4587F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715835027;
	bh=y/bNGlyfF/oGDB7TiHTQamcc4NfXUZWL0JSycfMRSuY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S+yi8sRRVkJTYNHhuE7ImV+F5RgM3kAq1iGAMJirpXFzse2thiTD6SyNgbOn7PqsL
	 qorUdogkoyQJXLfoQjJhJGMV01Qta+CXMH0FOvcPn9MCk0FY452lekIcq3YY/K5ctS
	 PQ4/WHXNSdERw15awjFsjrQIsaOioxCCApnGWAEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89217F805EA; Thu, 16 May 2024 06:49:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8E3F805BA;
	Thu, 16 May 2024 06:49:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DCE2F8057F; Thu, 16 May 2024 06:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0278F8024C
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 06:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0278F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DE0qPRLU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44FLNpD1021381;
	Thu, 16 May 2024 04:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=U1ogcjEM2N62HVP14KdtKY5GmCbiQFaCyzabSwmeZjc=; b=DE
	0qPRLUQm5oFOFCsuU3B+yvrZmdWv7duOMhrJhIxoiXsCCSePRtjNRUUKhDMloDHY
	EgT+WP72ECk1WNb03DnTAmp+A3oU4+4hkj7ezy/plIElCAP3y6RUxpaD84PgeWcC
	zlGnoWg+ea6pCQq2zCZB7Wa1p283FR+k85Kdb9HWL9n6raXsaXiGNtqsvfkaTkyA
	k1qtvZ5nTq6A9/rrqiiy1YWh26KOFVjO/7+C/qzSJmkVPIgEjyqCayTqMU0fbVhh
	w22KgiGFuFIXpk3x7ts1WlVgPgrSCQQrWKjLmBXHD/HGxgN43Gre7wV20CtrjpIE
	sE2cbm9j0Kv9qEQES1xQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbcrec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44G4n1sT020039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:49:01 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 21:48:56 -0700
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
Subject: [PATCH v4 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Date: Thu, 16 May 2024 10:17:57 +0530
Message-ID: <20240516044801.1061838-4-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: 8p4mpjap7ZnEexlm0lMxHMs7o7g_oYR0
X-Proofpoint-ORIG-GUID: 8p4mpjap7ZnEexlm0lMxHMs7o7g_oYR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160031
Message-ID-Hash: ZKXJTPA76N324GWP5DRSLVPN3EYXRE4J
X-Message-ID-Hash: ZKXJTPA76N324GWP5DRSLVPN3EYXRE4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKXJTPA76N324GWP5DRSLVPN3EYXRE4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds basic SoundWire codec driver to support for
WCD9370/WCD9375 TX and RX devices.

The WCD9370/WCD9375 has Multi Button Headset Control hardware to
support Headset insertion, type detection, 8 headset buttons detection,
Over Current detection and Impedence measurements.
This patch adds support for this using wcd-mbhc apis.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x.c | 1677 ++++++++++++++++++++++++++++++++++++
 1 file changed, 1677 insertions(+)
 create mode 100644 sound/soc/codecs/wcd937x.c

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
new file mode 100644
index 000000000000..6038739beb19
--- /dev/null
+++ b/sound/soc/codecs/wcd937x.c
@@ -0,0 +1,1677 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/pcm.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "wcd-clsh-v2.h"
+#include "wcd-mbhc-v2.h"
+#include "wcd937x.h"
+
+enum {
+	CHIPID_WCD9370 = 0,
+	CHIPID_WCD9375 = 5,
+};
+
+/* Z value defined in milliohm */
+#define WCD937X_ZDET_VAL_32             (32000)
+#define WCD937X_ZDET_VAL_400            (400000)
+#define WCD937X_ZDET_VAL_1200           (1200000)
+#define WCD937X_ZDET_VAL_100K           (100000000)
+/* Z floating defined in ohms */
+#define WCD937X_ZDET_FLOATING_IMPEDANCE	(0x0FFFFFFE)
+#define WCD937X_ZDET_NUM_MEASUREMENTS   (900)
+#define WCD937X_MBHC_GET_C1(c)          (((c) & 0xC000) >> 14)
+#define WCD937X_MBHC_GET_X1(x)          ((x) & 0x3FFF)
+/* Z value compared in milliOhm */
+#define WCD937X_MBHC_IS_SECOND_RAMP_REQUIRED(z) (((z) > 400000) || ((z) < 32000))
+#define WCD937X_MBHC_ZDET_CONST         (86 * 16384)
+#define WCD937X_MBHC_MOISTURE_RREF      R_24_KOHM
+#define WCD_MBHC_HS_V_MAX           1600
+#define EAR_RX_PATH_AUX		1
+#define WCD937X_MBHC_MAX_BUTTONS	8
+
+#define WCD937X_RATES (SNDRV_PCM_RATE_8000  | SNDRV_PCM_RATE_16000 |\
+		       SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
+		       SNDRV_PCM_RATE_384000)
+
+/* Fractional Rates */
+#define WCD937X_FRAC_RATES (SNDRV_PCM_RATE_44100  | SNDRV_PCM_RATE_88200 |\
+			    SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
+
+#define WCD937X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+enum {
+	ALLOW_BUCK_DISABLE,
+	HPH_COMP_DELAY,
+	HPH_PA_DELAY,
+	AMIC2_BCS_ENABLE,
+};
+
+enum {
+	AIF1_PB = 0,
+	AIF1_CAP,
+	NUM_CODEC_DAIS,
+};
+
+struct wcd937x_priv {
+	struct sdw_slave *tx_sdw_dev;
+	struct wcd937x_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
+	struct device *txdev;
+	struct device *rxdev;
+	struct device_node *rxnode;
+	struct device_node *txnode;
+	struct regmap *regmap;
+	/* micb setup lock */
+	struct mutex micb_lock;
+	/* mbhc module */
+	struct wcd_mbhc *wcd_mbhc;
+	struct wcd_mbhc_config mbhc_cfg;
+	struct wcd_mbhc_intr intr_ids;
+	struct wcd_clsh_ctrl *clsh_info;
+	struct irq_domain *virq;
+	struct regmap_irq_chip *wcd_regmap_irq_chip;
+	struct regmap_irq_chip_data *irq_chip;
+	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
+	struct regulator *buck_supply;
+	struct snd_soc_jack *jack;
+	unsigned long status_mask;
+	s32 micb_ref[WCD937X_MAX_MICBIAS];
+	s32 pullup_ref[WCD937X_MAX_MICBIAS];
+	u32 hph_mode;
+	int ear_rx_path;
+	u32 chipid;
+	u32 micb1_mv;
+	u32 micb2_mv;
+	u32 micb3_mv;
+	u32 micb4_mv; /* 9375 only */
+	int hphr_pdm_wd_int;
+	int hphl_pdm_wd_int;
+	int aux_pdm_wd_int;
+	bool comp1_enable;
+	bool comp2_enable;
+
+	struct gpio_desc *us_euro_gpio;
+	struct gpio_desc *reset_gpio;
+
+	int dmic_0_1_clk_cnt;
+	int dmic_2_3_clk_cnt;
+	int dmic_4_5_clk_cnt;
+	atomic_t rx_clk_cnt;
+	atomic_t ana_clk_count;
+};
+
+struct wcd937x_mbhc_zdet_param {
+	u16 ldo_ctl;
+	u16 noff;
+	u16 nshift;
+	u16 btn5;
+	u16 btn6;
+	u16 btn7;
+};
+
+static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD937X_ANA_MBHC_MECH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD937X_ANA_MBHC_MECH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD937X_ANA_MBHC_MECH, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_CLAMP_CTL, WCD937X_MBHC_NEW_PLUG_DETECT_CTL, 0x30),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_DETECTION_TYPE, WCD937X_ANA_MBHC_ELECT, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_CTRL, WCD937X_MBHC_NEW_INT_MECH_DET_CURRENT, 0x1F),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, WCD937X_ANA_MBHC_MECH, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PLUG_TYPE, WCD937X_ANA_MBHC_MECH, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_GND_PLUG_TYPE, WCD937X_ANA_MBHC_MECH, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_SW_HPH_LP_100K_TO_GND, WCD937X_ANA_MBHC_MECH, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_SCHMT_ISRC, WCD937X_ANA_MBHC_ELECT, 0x06),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_EN, WCD937X_ANA_MBHC_ELECT, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_INSREM_DBNC, WCD937X_MBHC_NEW_PLUG_DETECT_CTL, 0x0F),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_DBNC, WCD937X_MBHC_NEW_CTL_1, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_VREF, WCD937X_MBHC_NEW_CTL_2, 0x03),
+	WCD_MBHC_FIELD(WCD_MBHC_HS_COMP_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_IN2P_CLAMP_STATE, WCD937X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_MIC_SCHMT_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_SCHMT_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_SCHMT_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_OCP_FSM_EN, WCD937X_HPH_OCP_CTL, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0x07),
+	WCD_MBHC_FIELD(WCD_MBHC_BTN_ISRC_CTL, WCD937X_ANA_MBHC_ELECT, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_RESULT, WCD937X_ANA_MBHC_RESULT_3, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB_CTRL, WCD937X_ANA_MICB2, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_CNP_WG_TIME, WCD937X_HPH_CNP_WG_TIME, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_PA_EN, WCD937X_ANA_HPH, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_PA_EN, WCD937X_ANA_HPH, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPH_PA_EN, WCD937X_ANA_HPH, 0xC0),
+	WCD_MBHC_FIELD(WCD_MBHC_SWCH_LEVEL_REMOVE, WCD937X_ANA_MBHC_RESULT_3, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_ANC_DET_EN, WCD937X_MBHC_CTL_BCS, 0x02),
+	WCD_MBHC_FIELD(WCD_MBHC_FSM_STATUS, WCD937X_MBHC_NEW_FSM_STATUS, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_MUX_CTL, WCD937X_MBHC_NEW_CTL_2, 0x70),
+	WCD_MBHC_FIELD(WCD_MBHC_MOISTURE_STATUS, WCD937X_MBHC_NEW_FSM_STATUS, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_GND, WCD937X_HPH_PA_CTL2, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_GND, WCD937X_HPH_PA_CTL2, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_DET_EN, WCD937X_HPH_L_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_DET_EN, WCD937X_HPH_R_TEST, 0x01),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHL_OCP_STATUS, WCD937X_DIGITAL_INTR_STATUS_0, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_HPHR_OCP_STATUS, WCD937X_DIGITAL_INTR_STATUS_0, 0x20),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_EN, WCD937X_MBHC_NEW_CTL_1, 0x08),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_COMPLETE, WCD937X_MBHC_NEW_FSM_STATUS, 0x40),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_TIMEOUT, WCD937X_MBHC_NEW_FSM_STATUS, 0x80),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_RESULT, WCD937X_MBHC_NEW_ADC_RESULT, 0xFF),
+	WCD_MBHC_FIELD(WCD_MBHC_MICB2_VOUT, WCD937X_ANA_MICB2, 0x3F),
+	WCD_MBHC_FIELD(WCD_MBHC_ADC_MODE, WCD937X_MBHC_NEW_CTL_1, 0x10),
+	WCD_MBHC_FIELD(WCD_MBHC_DETECTION_DONE, WCD937X_MBHC_NEW_CTL_1, 0x04),
+	WCD_MBHC_FIELD(WCD_MBHC_ELECT_ISRC_EN, WCD937X_ANA_MBHC_ZDET, 0x02),
+};
+
+static const struct regmap_irq wcd937x_irqs[WCD937X_NUM_IRQS] = {
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_BUTTON_PRESS_DET, 0, BIT(0)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_BUTTON_RELEASE_DET, 0, BIT(1)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_ELECT_INS_REM_DET, 0, BIT(2)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, BIT(3)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_SW_DET, 0, BIT(4)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHR_OCP_INT, 0, BIT(5)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHR_CNP_INT, 0, BIT(6)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHL_OCP_INT, 0, BIT(7)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHL_CNP_INT, 1, BIT(0)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_EAR_CNP_INT, 1, BIT(1)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_EAR_SCD_INT, 1, BIT(2)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_AUX_CNP_INT, 1, BIT(3)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_AUX_SCD_INT, 1, BIT(4)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHL_PDM_WD_INT, 1, BIT(5)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHR_PDM_WD_INT, 1, BIT(6)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_AUX_PDM_WD_INT, 1, BIT(7)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_LDORT_SCD_INT, 2, BIT(0)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_MBHC_MOISTURE_INT, 2, BIT(1)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHL_SURGE_DET_INT, 2, BIT(2)),
+	REGMAP_IRQ_REG(WCD937X_IRQ_HPHR_SURGE_DET_INT, 2, BIT(3)),
+};
+
+static int wcd937x_handle_post_irq(void *data)
+{
+	struct wcd937x_priv *wcd937x;
+
+	if (data)
+		wcd937x = (struct wcd937x_priv *)data;
+	else
+		return IRQ_HANDLED;
+
+	regmap_write(wcd937x->regmap, WCD937X_DIGITAL_INTR_CLEAR_0, 0);
+	regmap_write(wcd937x->regmap, WCD937X_DIGITAL_INTR_CLEAR_1, 0);
+	regmap_write(wcd937x->regmap, WCD937X_DIGITAL_INTR_CLEAR_2, 0);
+
+	return IRQ_HANDLED;
+}
+
+static const u32 wcd937x_config_regs[] = {
+	WCD937X_DIGITAL_INTR_LEVEL_0,
+};
+
+static struct regmap_irq_chip wcd937x_regmap_irq_chip = {
+	.name = "wcd937x",
+	.irqs = wcd937x_irqs,
+	.num_irqs = ARRAY_SIZE(wcd937x_irqs),
+	.num_regs = 3,
+	.status_base = WCD937X_DIGITAL_INTR_STATUS_0,
+	.mask_base = WCD937X_DIGITAL_INTR_MASK_0,
+	.ack_base = WCD937X_DIGITAL_INTR_CLEAR_0,
+	.use_ack = 1,
+	.clear_ack = 1,
+	.config_base = wcd937x_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd937x_config_regs),
+	.num_config_regs = 1,
+	.runtime_pm = true,
+	.handle_post_irq = wcd937x_handle_post_irq,
+	.irq_drv_data = NULL,
+};
+
+static void wcd937x_reset(struct wcd937x_priv *wcd937x)
+{
+	usleep_range(20, 30);
+
+	gpiod_set_value(wcd937x->reset_gpio, 1);
+
+	usleep_range(20, 30);
+}
+
+static void wcd937x_io_init(struct regmap *regmap)
+{
+	u32 val = 0, temp = 0, temp1 = 0;
+
+	regmap_read(regmap, WCD937X_DIGITAL_EFUSE_REG_29, &val);
+
+	val = val & 0x0F;
+
+	regmap_read(regmap, WCD937X_DIGITAL_EFUSE_REG_16, &temp);
+	regmap_read(regmap, WCD937X_DIGITAL_EFUSE_REG_17, &temp1);
+
+	if (temp == 0x02 || temp1 > 0x09)
+		regmap_update_bits(regmap, WCD937X_SLEEP_CTL, 0x0E, val);
+	else
+		regmap_update_bits(regmap, WCD937X_SLEEP_CTL, 0x0e, 0x0e);
+
+	regmap_update_bits(regmap, WCD937X_SLEEP_CTL, 0x80, 0x80);
+	usleep_range(1000, 1010);
+
+	regmap_update_bits(regmap, WCD937X_SLEEP_CTL, 0x40, 0x40);
+	usleep_range(1000, 1010);
+
+	regmap_update_bits(regmap, WCD937X_LDORXTX_CONFIG, BIT(4), 0x00);
+	regmap_update_bits(regmap, WCD937X_BIAS_VBG_FINE_ADJ, 0xf0, BIT(7));
+	regmap_update_bits(regmap, WCD937X_ANA_BIAS, BIT(7), BIT(7));
+	regmap_update_bits(regmap, WCD937X_ANA_BIAS, BIT(6), BIT(6));
+	usleep_range(10000, 10010);
+
+	regmap_update_bits(regmap, WCD937X_ANA_BIAS, BIT(6), 0x00);
+	regmap_update_bits(regmap, WCD937X_HPH_SURGE_HPHLR_SURGE_EN, 0xff, 0xd9);
+	regmap_update_bits(regmap, WCD937X_MICB1_TEST_CTL_1, 0xff, 0xfa);
+	regmap_update_bits(regmap, WCD937X_MICB2_TEST_CTL_1, 0xff, 0xfa);
+	regmap_update_bits(regmap, WCD937X_MICB3_TEST_CTL_1, 0xff, 0xfa);
+
+	regmap_update_bits(regmap, WCD937X_MICB1_TEST_CTL_2, 0x38, 0x00);
+	regmap_update_bits(regmap, WCD937X_MICB2_TEST_CTL_2, 0x38, 0x00);
+	regmap_update_bits(regmap, WCD937X_MICB3_TEST_CTL_2, 0x38, 0x00);
+
+	/* Set Bandgap Fine Adjustment to +5mV for Tanggu SMIC part */
+	regmap_read(regmap, WCD937X_DIGITAL_EFUSE_REG_16, &val);
+	if (val == 0x01) {
+		regmap_update_bits(regmap, WCD937X_BIAS_VBG_FINE_ADJ, 0xF0, 0xB0);
+	} else if (val == 0x02) {
+		regmap_update_bits(regmap, WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L, 0x1F, 0x04);
+		regmap_update_bits(regmap, WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R, 0x1F, 0x04);
+		regmap_update_bits(regmap, WCD937X_BIAS_VBG_FINE_ADJ, 0xF0, 0xB0);
+		regmap_update_bits(regmap, WCD937X_HPH_NEW_INT_RDAC_GAIN_CTL, 0xF0, 0x50);
+	}
+}
+
+static int wcd937x_rx_clk_enable(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	if (atomic_read(&wcd937x->rx_clk_cnt))
+		return 0;
+
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_DIG_CLK_CTL, BIT(3), BIT(3));
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(0), BIT(0));
+	snd_soc_component_update_bits(component, WCD937X_ANA_RX_SUPPLIES, BIT(0), BIT(0));
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_RX0_CTL, BIT(6), 0x00);
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_RX1_CTL, BIT(6), 0x00);
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_RX2_CTL, BIT(6), 0x00);
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(1), BIT(1));
+
+	atomic_inc(&wcd937x->rx_clk_cnt);
+
+	return 0;
+}
+
+static int wcd937x_rx_clk_disable(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	if (!atomic_read(&wcd937x->rx_clk_cnt)) {
+		dev_err(component->dev, "clk already disabled\n");
+		return 0;
+	}
+
+	atomic_dec(&wcd937x->rx_clk_cnt);
+
+	snd_soc_component_update_bits(component, WCD937X_ANA_RX_SUPPLIES, BIT(0), 0x00);
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(1), 0x00);
+	snd_soc_component_update_bits(component, WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(0), 0x00);
+
+	return 0;
+}
+
+static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
+{
+	if (micb_mv < 1000 || micb_mv > 2850) {
+		pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
+		return -EINVAL;
+	}
+
+	return (micb_mv - 1000) / 50;
+}
+
+static int wcd937x_micbias_control(struct snd_soc_component *component,
+				   int micb_num, int req, bool is_dapm)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int micb_index = micb_num - 1;
+	u16 micb_reg;
+
+	if (micb_index < 0 || (micb_index > WCD937X_MAX_MICBIAS - 1)) {
+		dev_err(component->dev, "Invalid micbias index, micb_ind:%d\n", micb_index);
+		return -EINVAL;
+	}
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD937X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD937X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD937X_ANA_MICB3;
+		break;
+	default:
+		dev_err(component->dev, "Invalid micbias number: %d\n", micb_num);
+		return -EINVAL;
+	}
+
+	mutex_lock(&wcd937x->micb_lock);
+	switch (req) {
+	case MICB_PULLUP_ENABLE:
+		wcd937x->pullup_ref[micb_index]++;
+		if (wcd937x->pullup_ref[micb_index] == 1 &&
+		    wcd937x->micb_ref[micb_index] == 0)
+			snd_soc_component_update_bits(component, micb_reg,
+						      0xc0, BIT(7));
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd937x->pullup_ref[micb_index] > 0)
+			wcd937x->pullup_ref[micb_index]++;
+		if (wcd937x->pullup_ref[micb_index] == 0 &&
+		    wcd937x->micb_ref[micb_index] == 0)
+			snd_soc_component_update_bits(component, micb_reg,
+						      0xc0, 0x00);
+		break;
+	case MICB_ENABLE:
+		wcd937x->micb_ref[micb_index]++;
+		atomic_inc(&wcd937x->ana_clk_count);
+		if (wcd937x->micb_ref[micb_index] == 1) {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+						      0xf0, 0xf0);
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
+						      BIT(4), BIT(4));
+			snd_soc_component_update_bits(component,
+						      WCD937X_MICB1_TEST_CTL_2,
+						      BIT(0), BIT(0));
+			snd_soc_component_update_bits(component,
+						      WCD937X_MICB2_TEST_CTL_2,
+						      BIT(0), BIT(0));
+			snd_soc_component_update_bits(component,
+						      WCD937X_MICB3_TEST_CTL_2,
+						      BIT(0), BIT(0));
+			snd_soc_component_update_bits(component,
+						      micb_reg, 0xc0, BIT(6));
+
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd937x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_ON);
+
+			if (micb_num  == MIC_BIAS_2 && is_dapm)
+				wcd_mbhc_event_notify(wcd937x->wcd_mbhc,
+						      WCD_EVENT_POST_DAPM_MICBIAS_2_ON);
+		}
+		break;
+	case MICB_DISABLE:
+		atomic_dec(&wcd937x->ana_clk_count);
+		if (wcd937x->micb_ref[micb_index] > 0)
+			wcd937x->micb_ref[micb_index]--;
+		if (wcd937x->micb_ref[micb_index] == 0 &&
+		    wcd937x->pullup_ref[micb_index] > 0)
+			snd_soc_component_update_bits(component, micb_reg,
+						      0xc0, BIT(7));
+		else if (wcd937x->micb_ref[micb_index] == 0 &&
+			 wcd937x->pullup_ref[micb_index] == 0) {
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd937x->wcd_mbhc,
+						      WCD_EVENT_PRE_MICBIAS_2_OFF);
+
+			snd_soc_component_update_bits(component, micb_reg,
+						      0xc0, 0x00);
+			if (micb_num  == MIC_BIAS_2)
+				wcd_mbhc_event_notify(wcd937x->wcd_mbhc,
+						      WCD_EVENT_POST_MICBIAS_2_OFF);
+		}
+
+		if (is_dapm && micb_num  == MIC_BIAS_2)
+			wcd_mbhc_event_notify(wcd937x->wcd_mbhc,
+					      WCD_EVENT_POST_DAPM_MICBIAS_2_OFF);
+		if (atomic_read(&wcd937x->ana_clk_count) <= 0) {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
+						      BIT(4), 0x00);
+			atomic_set(&wcd937x->ana_clk_count, 0);
+		}
+		break;
+	}
+	mutex_unlock(&wcd937x->micb_lock);
+
+	return 0;
+}
+
+static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch_id, bool enable)
+{
+	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
+	struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
+	u8 port_num = ch_info->port_num;
+	u8 ch_mask = ch_info->ch_mask;
+
+	port_config->num = port_num;
+
+	if (enable)
+		port_config->ch_mask |= ch_mask;
+	else
+		port_config->ch_mask &= ~ch_mask;
+
+	return 0;
+}
+
+/* MBHC related */
+static void wcd937x_mbhc_clk_setup(struct snd_soc_component *component,
+				   bool enable)
+{
+	snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_1,
+				      WCD937X_MBHC_CTL_RCO_EN_MASK, enable);
+}
+
+static void wcd937x_mbhc_mbhc_bias_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	snd_soc_component_write_field(component, WCD937X_ANA_MBHC_ELECT,
+				      WCD937X_ANA_MBHC_BIAS_EN, enable);
+}
+
+static void wcd937x_mbhc_program_btn_thr(struct snd_soc_component *component,
+					 int *btn_low, int *btn_high,
+					 int num_btn, bool is_micbias)
+{
+	int i, vth;
+
+	if (num_btn > WCD_MBHC_DEF_BUTTONS) {
+		dev_err(component->dev, "%s: invalid number of buttons: %d\n",
+			__func__, num_btn);
+		return;
+	}
+
+	for (i = 0; i < num_btn; i++) {
+		vth = ((btn_high[i] * 2) / 25) & 0x3F;
+		snd_soc_component_write_field(component, WCD937X_ANA_MBHC_BTN0 + i,
+					      WCD937X_MBHC_BTN_VTH_MASK, vth);
+	}
+}
+
+static bool wcd937x_mbhc_micb_en_status(struct snd_soc_component *component, int micb_num)
+{
+	u8 val;
+
+	if (micb_num == MIC_BIAS_2) {
+		val = snd_soc_component_read_field(component,
+						   WCD937X_ANA_MICB2,
+						   WCD937X_ANA_MICB2_ENABLE_MASK);
+		if (val == WCD937X_MICB_ENABLE)
+			return true;
+	}
+	return false;
+}
+
+static void wcd937x_mbhc_hph_l_pull_up_control(struct snd_soc_component *component,
+					       int pull_up_cur)
+{
+	/* Default pull up current to 2uA */
+	if (pull_up_cur > HS_PULLUP_I_OFF || pull_up_cur < HS_PULLUP_I_3P0_UA)
+		pull_up_cur = HS_PULLUP_I_2P0_UA;
+
+	snd_soc_component_write_field(component,
+				      WCD937X_MBHC_NEW_INT_MECH_DET_CURRENT,
+				      WCD937X_HSDET_PULLUP_C_MASK, pull_up_cur);
+}
+
+static int wcd937x_mbhc_request_micbias(struct snd_soc_component *component,
+					int micb_num, int req)
+{
+	return wcd937x_micbias_control(component, micb_num, req, false);
+}
+
+static void wcd937x_mbhc_micb_ramp_control(struct snd_soc_component *component,
+					   bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD937X_ANA_MICB2_RAMP,
+					      WCD937X_RAMP_SHIFT_CTRL_MASK, 0x0C);
+		snd_soc_component_write_field(component, WCD937X_ANA_MICB2_RAMP,
+					      WCD937X_RAMP_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD937X_ANA_MICB2_RAMP,
+					      WCD937X_RAMP_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD937X_ANA_MICB2_RAMP,
+					      WCD937X_RAMP_SHIFT_CTRL_MASK, 0);
+	}
+}
+
+static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
+					    int req_volt, int micb_num)
+{
+	struct wcd937x_priv *wcd937x =  snd_soc_component_get_drvdata(component);
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD937X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD937X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD937X_ANA_MICB3;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mutex_lock(&wcd937x->micb_lock);
+	/*
+	 * If requested micbias voltage is same as current micbias
+	 * voltage, then just return. Otherwise, adjust voltage as
+	 * per requested value. If micbias is already enabled, then
+	 * to avoid slow micbias ramp-up or down enable pull-up
+	 * momentarily, change the micbias value and then re-enable
+	 * micbias.
+	 */
+	micb_en = snd_soc_component_read_field(component, micb_reg,
+					       WCD937X_MICB_EN_MASK);
+	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
+						    WCD937X_MICB_VOUT_MASK);
+
+	req_vout_ctl = wcd937x_get_micb_vout_ctl_val(req_volt);
+	if (req_vout_ctl < 0) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cur_vout_ctl == req_vout_ctl) {
+		ret = 0;
+		goto exit;
+	}
+
+	if (micb_en == WCD937X_MICB_ENABLE)
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD937X_MICB_EN_MASK,
+					      WCD937X_MICB_PULL_UP);
+
+	snd_soc_component_write_field(component, micb_reg,
+				      WCD937X_MICB_VOUT_MASK,
+				      req_vout_ctl);
+
+	if (micb_en == WCD937X_MICB_ENABLE) {
+		snd_soc_component_write_field(component, micb_reg,
+					      WCD937X_MICB_EN_MASK,
+					      WCD937X_MICB_ENABLE);
+		/*
+		 * Add 2ms delay as per HW requirement after enabling
+		 * micbias
+		 */
+		usleep_range(2000, 2100);
+	}
+exit:
+	mutex_unlock(&wcd937x->micb_lock);
+	return ret;
+}
+
+static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
+						int micb_num, bool req_en)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int micb_mv;
+
+	if (micb_num != MIC_BIAS_2)
+		return -EINVAL;
+	/*
+	 * If device tree micbias level is already above the minimum
+	 * voltage needed to detect threshold microphone, then do
+	 * not change the micbias, just return.
+	 */
+	if (wcd937x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+		return 0;
+
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
+
+	return wcd937x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
+}
+
+static void wcd937x_mbhc_get_result_params(struct snd_soc_component *component,
+					   s16 *d1_a, u16 noff,
+					   int32_t *zdet)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	int i;
+	int val, val1;
+	s16 c1;
+	s32 x1, d1;
+	s32 denom;
+	static const int minCode_param[] = {
+		3277, 1639, 820, 410, 205, 103, 52, 26
+	};
+
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MBHC_ZDET, 0x20, 0x20);
+	for (i = 0; i < WCD937X_ZDET_NUM_MEASUREMENTS; i++) {
+		regmap_read(wcd937x->regmap, WCD937X_ANA_MBHC_RESULT_2, &val);
+		if (val & 0x80)
+			break;
+	}
+	val = val << 0x8;
+	regmap_read(wcd937x->regmap, WCD937X_ANA_MBHC_RESULT_1, &val1);
+	val |= val1;
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MBHC_ZDET, 0x20, 0x00);
+	x1 = WCD937X_MBHC_GET_X1(val);
+	c1 = WCD937X_MBHC_GET_C1(val);
+	/* If ramp is not complete, give additional 5ms */
+	if (c1 < 2 && x1)
+		usleep_range(5000, 5050);
+
+	if (!c1 || !x1) {
+		dev_err(component->dev, "Impedance detect ramp error, c1=%d, x1=0x%x\n",
+			c1, x1);
+		goto ramp_down;
+	}
+	d1 = d1_a[c1];
+	denom = (x1 * d1) - (1 << (14 - noff));
+	if (denom > 0)
+		*zdet = (WCD937X_MBHC_ZDET_CONST * 1000) / denom;
+	else if (x1 < minCode_param[noff])
+		*zdet = WCD937X_ZDET_FLOATING_IMPEDANCE;
+
+	dev_err(component->dev, "%s: d1=%d, c1=%d, x1=0x%x, z_val=%d (milliohm)\n",
+		__func__, d1, c1, x1, *zdet);
+ramp_down:
+	i = 0;
+	while (x1) {
+		regmap_read(wcd937x->regmap,
+			    WCD937X_ANA_MBHC_RESULT_1, &val);
+		regmap_read(wcd937x->regmap,
+			    WCD937X_ANA_MBHC_RESULT_2, &val1);
+		val = val << 0x08;
+		val |= val1;
+		x1 = WCD937X_MBHC_GET_X1(val);
+		i++;
+		if (i == WCD937X_ZDET_NUM_MEASUREMENTS)
+			break;
+	}
+}
+
+static void wcd937x_mbhc_zdet_ramp(struct snd_soc_component *component,
+				   struct wcd937x_mbhc_zdet_param *zdet_param,
+				   s32 *zl, s32 *zr, s16 *d1_a)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	s32 zdet = 0;
+
+	snd_soc_component_write_field(component, WCD937X_MBHC_NEW_ZDET_ANA_CTL,
+				      WCD937X_ZDET_MAXV_CTL_MASK, zdet_param->ldo_ctl);
+	snd_soc_component_update_bits(component, WCD937X_ANA_MBHC_BTN5,
+				      WCD937X_VTH_MASK, zdet_param->btn5);
+	snd_soc_component_update_bits(component, WCD937X_ANA_MBHC_BTN6,
+				      WCD937X_VTH_MASK, zdet_param->btn6);
+	snd_soc_component_update_bits(component, WCD937X_ANA_MBHC_BTN7,
+				      WCD937X_VTH_MASK, zdet_param->btn7);
+	snd_soc_component_write_field(component, WCD937X_MBHC_NEW_ZDET_ANA_CTL,
+				      WCD937X_ZDET_RANGE_CTL_MASK, zdet_param->noff);
+	snd_soc_component_update_bits(component, WCD937X_MBHC_NEW_ZDET_RAMP_CTL,
+				      0x0F, zdet_param->nshift);
+
+	if (!zl)
+		goto z_right;
+	/* Start impedance measurement for HPH_L */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_ZDET, 0x80, 0x80);
+	wcd937x_mbhc_get_result_params(component, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_ZDET, 0x80, 0x00);
+
+	*zl = zdet;
+
+z_right:
+	if (!zr)
+		return;
+	/* Start impedance measurement for HPH_R */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_ZDET, 0x40, 0x40);
+	wcd937x_mbhc_get_result_params(component, d1_a, zdet_param->noff, &zdet);
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_ZDET, 0x40, 0x00);
+
+	*zr = zdet;
+}
+
+static void wcd937x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+				       s32 *z_val, int flag_l_r)
+{
+	s16 q1;
+	int q1_cal;
+
+	if (*z_val < (WCD937X_ZDET_VAL_400 / 1000))
+		q1 = snd_soc_component_read(component,
+					    WCD937X_DIGITAL_EFUSE_REG_23 + (2 * flag_l_r));
+	else
+		q1 = snd_soc_component_read(component,
+					    WCD937X_DIGITAL_EFUSE_REG_24 + (2 * flag_l_r));
+	if (q1 & 0x80)
+		q1_cal = (10000 - ((q1 & 0x7F) * 25));
+	else
+		q1_cal = (10000 + (q1 * 25));
+	if (q1_cal > 0)
+		*z_val = ((*z_val) * 10000) / q1_cal;
+}
+
+static void wcd937x_wcd_mbhc_calc_impedance(struct snd_soc_component *component,
+					    u32 *zl, u32 *zr)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	s16 reg0, reg1, reg2, reg3, reg4;
+	s32 z1l, z1r, z1ls;
+	int zMono, z_diff1, z_diff2;
+	bool is_fsm_disable = false;
+	struct wcd937x_mbhc_zdet_param zdet_param[] = {
+		{4, 0, 4, 0x08, 0x14, 0x18}, /* < 32ohm */
+		{2, 0, 3, 0x18, 0x7C, 0x90}, /* 32ohm < Z < 400ohm */
+		{1, 4, 5, 0x18, 0x7C, 0x90}, /* 400ohm < Z < 1200ohm */
+		{1, 6, 7, 0x18, 0x7C, 0x90}, /* >1200ohm */
+	};
+	struct wcd937x_mbhc_zdet_param *zdet_param_ptr = NULL;
+	s16 d1_a[][4] = {
+		{0, 30, 90, 30},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+		{0, 30, 30, 5},
+	};
+	s16 *d1 = NULL;
+
+	reg0 = snd_soc_component_read(component, WCD937X_ANA_MBHC_BTN5);
+	reg1 = snd_soc_component_read(component, WCD937X_ANA_MBHC_BTN6);
+	reg2 = snd_soc_component_read(component, WCD937X_ANA_MBHC_BTN7);
+	reg3 = snd_soc_component_read(component, WCD937X_MBHC_CTL_CLK);
+	reg4 = snd_soc_component_read(component, WCD937X_MBHC_NEW_ZDET_ANA_CTL);
+
+	if (snd_soc_component_read(component, WCD937X_ANA_MBHC_ELECT) & 0x80) {
+		is_fsm_disable = true;
+		regmap_update_bits(wcd937x->regmap,
+				   WCD937X_ANA_MBHC_ELECT, 0x80, 0x00);
+	}
+
+	/* For NO-jack, disable L_DET_EN before Z-det measurements */
+	if (wcd937x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd937x->regmap,
+				   WCD937X_ANA_MBHC_MECH, 0x80, 0x00);
+
+	/* Turn off 100k pull down on HPHL */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_MECH, 0x01, 0x00);
+
+	/* Disable surge protection before impedance detection.
+	 * This is done to give correct value for high impedance.
+	 */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0x00);
+	/* 1ms delay needed after disable surge protection */
+	usleep_range(1000, 1010);
+
+	/* First get impedance on Left */
+	d1 = d1_a[1];
+	zdet_param_ptr = &zdet_param[1];
+	wcd937x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1l, NULL, d1);
+
+	if (!WCD937X_MBHC_IS_SECOND_RAMP_REQUIRED(z1l))
+		goto left_ch_impedance;
+
+	/* Second ramp for left ch */
+	if (z1l < WCD937X_ZDET_VAL_32) {
+		zdet_param_ptr = &zdet_param[0];
+		d1 = d1_a[0];
+	} else if ((z1l > WCD937X_ZDET_VAL_400) &&
+		  (z1l <= WCD937X_ZDET_VAL_1200)) {
+		zdet_param_ptr = &zdet_param[2];
+		d1 = d1_a[2];
+	} else if (z1l > WCD937X_ZDET_VAL_1200) {
+		zdet_param_ptr = &zdet_param[3];
+		d1 = d1_a[3];
+	}
+	wcd937x_mbhc_zdet_ramp(component, zdet_param_ptr, &z1l, NULL, d1);
+
+left_ch_impedance:
+	if (z1l == WCD937X_ZDET_FLOATING_IMPEDANCE ||
+	    z1l > WCD937X_ZDET_VAL_100K) {
+		*zl = WCD937X_ZDET_FLOATING_IMPEDANCE;
+		zdet_param_ptr = &zdet_param[1];
+		d1 = d1_a[1];
+	} else {
+		*zl = z1l / 1000;
+		wcd937x_wcd_mbhc_qfuse_cal(component, zl, 0);
+	}
+
+	/* Start of right impedance ramp and calculation */
+	wcd937x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1r, d1);
+	if (WCD937X_MBHC_IS_SECOND_RAMP_REQUIRED(z1r)) {
+		if ((z1r > WCD937X_ZDET_VAL_1200 &&
+		     zdet_param_ptr->noff == 0x6) ||
+		     ((*zl) != WCD937X_ZDET_FLOATING_IMPEDANCE))
+			goto right_ch_impedance;
+		/* Second ramp for right ch */
+		if (z1r < WCD937X_ZDET_VAL_32) {
+			zdet_param_ptr = &zdet_param[0];
+			d1 = d1_a[0];
+		} else if ((z1r > WCD937X_ZDET_VAL_400) &&
+			(z1r <= WCD937X_ZDET_VAL_1200)) {
+			zdet_param_ptr = &zdet_param[2];
+			d1 = d1_a[2];
+		} else if (z1r > WCD937X_ZDET_VAL_1200) {
+			zdet_param_ptr = &zdet_param[3];
+			d1 = d1_a[3];
+		}
+		wcd937x_mbhc_zdet_ramp(component, zdet_param_ptr, NULL, &z1r, d1);
+	}
+right_ch_impedance:
+	if (z1r == WCD937X_ZDET_FLOATING_IMPEDANCE ||
+	    z1r > WCD937X_ZDET_VAL_100K) {
+		*zr = WCD937X_ZDET_FLOATING_IMPEDANCE;
+	} else {
+		*zr = z1r / 1000;
+		wcd937x_wcd_mbhc_qfuse_cal(component, zr, 1);
+	}
+
+	/* Mono/stereo detection */
+	if ((*zl == WCD937X_ZDET_FLOATING_IMPEDANCE) &&
+	    (*zr == WCD937X_ZDET_FLOATING_IMPEDANCE)) {
+		dev_err(component->dev,
+			"%s: plug type is invalid or extension cable\n",
+			__func__);
+		goto zdet_complete;
+	}
+	if ((*zl == WCD937X_ZDET_FLOATING_IMPEDANCE) ||
+	    (*zr == WCD937X_ZDET_FLOATING_IMPEDANCE) ||
+	    ((*zl < WCD_MONO_HS_MIN_THR) && (*zr > WCD_MONO_HS_MIN_THR)) ||
+	    ((*zl > WCD_MONO_HS_MIN_THR) && (*zr < WCD_MONO_HS_MIN_THR))) {
+		wcd_mbhc_set_hph_type(wcd937x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+		goto zdet_complete;
+	}
+	snd_soc_component_write_field(component, WCD937X_HPH_R_ATEST,
+				      WCD937X_HPHPA_GND_OVR_MASK, 1);
+	snd_soc_component_write_field(component, WCD937X_HPH_PA_CTL2,
+				      WCD937X_HPHPA_GND_R_MASK, 1);
+	if (*zl < (WCD937X_ZDET_VAL_32 / 1000))
+		wcd937x_mbhc_zdet_ramp(component, &zdet_param[0], &z1ls, NULL, d1);
+	else
+		wcd937x_mbhc_zdet_ramp(component, &zdet_param[1], &z1ls, NULL, d1);
+	snd_soc_component_write_field(component, WCD937X_HPH_PA_CTL2,
+				      WCD937X_HPHPA_GND_R_MASK, 0);
+	snd_soc_component_write_field(component, WCD937X_HPH_R_ATEST,
+				      WCD937X_HPHPA_GND_OVR_MASK, 0);
+	z1ls /= 1000;
+	wcd937x_wcd_mbhc_qfuse_cal(component, &z1ls, 0);
+	/* Parallel of left Z and 9 ohm pull down resistor */
+	zMono = ((*zl) * 9) / ((*zl) + 9);
+	z_diff1 = (z1ls > zMono) ? (z1ls - zMono) : (zMono - z1ls);
+	z_diff2 = ((*zl) > z1ls) ? ((*zl) - z1ls) : (z1ls - (*zl));
+	if ((z_diff1 * (*zl + z1ls)) > (z_diff2 * (z1ls + zMono)))
+		wcd_mbhc_set_hph_type(wcd937x->wcd_mbhc, WCD_MBHC_HPH_STEREO);
+	else
+		wcd_mbhc_set_hph_type(wcd937x->wcd_mbhc, WCD_MBHC_HPH_MONO);
+
+	/* Enable surge protection again after impedance detection */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0xC0);
+zdet_complete:
+	snd_soc_component_write(component, WCD937X_ANA_MBHC_BTN5, reg0);
+	snd_soc_component_write(component, WCD937X_ANA_MBHC_BTN6, reg1);
+	snd_soc_component_write(component, WCD937X_ANA_MBHC_BTN7, reg2);
+	/* Turn on 100k pull down on HPHL */
+	regmap_update_bits(wcd937x->regmap,
+			   WCD937X_ANA_MBHC_MECH, 0x01, 0x01);
+
+	/* For NO-jack, re-enable L_DET_EN after Z-det measurements */
+	if (wcd937x->mbhc_cfg.hphl_swh)
+		regmap_update_bits(wcd937x->regmap,
+				   WCD937X_ANA_MBHC_MECH, 0x80, 0x80);
+
+	snd_soc_component_write(component, WCD937X_MBHC_NEW_ZDET_ANA_CTL, reg4);
+	snd_soc_component_write(component, WCD937X_MBHC_CTL_CLK, reg3);
+	if (is_fsm_disable)
+		regmap_update_bits(wcd937x->regmap,
+				   WCD937X_ANA_MBHC_ELECT, 0x80, 0x80);
+}
+
+static void wcd937x_mbhc_gnd_det_ctrl(struct snd_soc_component *component,
+				      bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, WCD937X_ANA_MBHC_MECH,
+					      WCD937X_MBHC_HSG_PULLUP_COMP_EN, 1);
+		snd_soc_component_write_field(component, WCD937X_ANA_MBHC_MECH,
+					      WCD937X_MBHC_GND_DET_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, WCD937X_ANA_MBHC_MECH,
+					      WCD937X_MBHC_GND_DET_EN_MASK, 0);
+		snd_soc_component_write_field(component, WCD937X_ANA_MBHC_MECH,
+					      WCD937X_MBHC_HSG_PULLUP_COMP_EN, 0);
+	}
+}
+
+static void wcd937x_mbhc_hph_pull_down_ctrl(struct snd_soc_component *component,
+					    bool enable)
+{
+	snd_soc_component_write_field(component, WCD937X_HPH_PA_CTL2,
+				      WCD937X_HPHPA_GND_R_MASK, enable);
+	snd_soc_component_write_field(component, WCD937X_HPH_PA_CTL2,
+				      WCD937X_HPHPA_GND_L_MASK, enable);
+}
+
+static void wcd937x_mbhc_moisture_config(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	if (wcd937x->mbhc_cfg.moist_rref == R_OFF) {
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, R_OFF);
+		return;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd937x->mbhc_cfg.hphl_swh) {
+		dev_err(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, R_OFF);
+		return;
+	}
+
+	snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+				      WCD937X_M_RTH_CTL_MASK, wcd937x->mbhc_cfg.moist_rref);
+}
+
+static void wcd937x_mbhc_moisture_detect_en(struct snd_soc_component *component, bool enable)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	if (enable)
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, wcd937x->mbhc_cfg.moist_rref);
+	else
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, R_OFF);
+}
+
+static bool wcd937x_mbhc_get_moisture_status(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	bool ret = false;
+
+	if (wcd937x->mbhc_cfg.moist_rref == R_OFF) {
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, R_OFF);
+		goto done;
+	}
+
+	/* Do not enable moisture detection if jack type is NC */
+	if (!wcd937x->mbhc_cfg.hphl_swh) {
+		dev_err(component->dev, "%s: disable moisture detection for NC\n",
+			__func__);
+		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
+					      WCD937X_M_RTH_CTL_MASK, R_OFF);
+		goto done;
+	}
+
+	/*
+	 * If moisture_en is already enabled, then skip to plug type
+	 * detection.
+	 */
+	if (snd_soc_component_read_field(component, WCD937X_MBHC_NEW_CTL_2, WCD937X_M_RTH_CTL_MASK))
+		goto done;
+
+	wcd937x_mbhc_moisture_detect_en(component, true);
+	/* Read moisture comparator status */
+	ret = ((snd_soc_component_read(component, WCD937X_MBHC_NEW_FSM_STATUS)
+				       & 0x20) ? 0 : 1);
+done:
+	return ret;
+}
+
+static void wcd937x_mbhc_moisture_polling_ctrl(struct snd_soc_component *component,
+					       bool enable)
+{
+	snd_soc_component_write_field(component,
+				      WCD937X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL,
+				      WCD937X_MOISTURE_EN_POLLING_MASK, enable);
+}
+
+static const struct wcd_mbhc_cb mbhc_cb = {
+	.clk_setup = wcd937x_mbhc_clk_setup,
+	.mbhc_bias = wcd937x_mbhc_mbhc_bias_control,
+	.set_btn_thr = wcd937x_mbhc_program_btn_thr,
+	.micbias_enable_status = wcd937x_mbhc_micb_en_status,
+	.hph_pull_up_control_v2 = wcd937x_mbhc_hph_l_pull_up_control,
+	.mbhc_micbias_control = wcd937x_mbhc_request_micbias,
+	.mbhc_micb_ramp_control = wcd937x_mbhc_micb_ramp_control,
+	.mbhc_micb_ctrl_thr_mic = wcd937x_mbhc_micb_ctrl_threshold_mic,
+	.compute_impedance = wcd937x_wcd_mbhc_calc_impedance,
+	.mbhc_gnd_det_ctrl = wcd937x_mbhc_gnd_det_ctrl,
+	.hph_pull_down_ctrl = wcd937x_mbhc_hph_pull_down_ctrl,
+	.mbhc_moisture_config = wcd937x_mbhc_moisture_config,
+	.mbhc_get_moisture_status = wcd937x_mbhc_get_moisture_status,
+	.mbhc_moisture_polling_ctrl = wcd937x_mbhc_moisture_polling_ctrl,
+	.mbhc_moisture_detect_en = wcd937x_mbhc_moisture_detect_en,
+};
+
+static int wcd937x_get_hph_type(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd937x->wcd_mbhc);
+
+	return 0;
+}
+
+static int wcd937x_hph_impedance_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	u32 zl, zr;
+	bool hphr;
+	struct soc_mixer_control *mc;
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	mc = (struct soc_mixer_control *)(kcontrol->private_value);
+	hphr = mc->shift;
+	wcd_mbhc_get_impedance(wcd937x->wcd_mbhc, &zl, &zr);
+	ucontrol->value.integer.value[0] = hphr ? zr : zl;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new hph_type_detect_controls[] = {
+	SOC_SINGLE_EXT("HPH Type", 0, 0, WCD_MBHC_HPH_STEREO, 0,
+		       wcd937x_get_hph_type, NULL),
+};
+
+static const struct snd_kcontrol_new impedance_detect_controls[] = {
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, INT_MAX, 0,
+		       wcd937x_hph_impedance_get, NULL),
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, INT_MAX, 0,
+		       wcd937x_hph_impedance_get, NULL),
+};
+
+static int wcd937x_mbhc_init(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc_intr *intr_ids = &wcd937x->intr_ids;
+
+	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd937x->irq_chip,
+						     WCD937X_IRQ_MBHC_SW_DET);
+	intr_ids->mbhc_btn_press_intr = regmap_irq_get_virq(wcd937x->irq_chip,
+							    WCD937X_IRQ_MBHC_BUTTON_PRESS_DET);
+	intr_ids->mbhc_btn_release_intr = regmap_irq_get_virq(wcd937x->irq_chip,
+							      WCD937X_IRQ_MBHC_BUTTON_RELEASE_DET);
+	intr_ids->mbhc_hs_ins_intr = regmap_irq_get_virq(wcd937x->irq_chip,
+							 WCD937X_IRQ_MBHC_ELECT_INS_REM_LEG_DET);
+	intr_ids->mbhc_hs_rem_intr = regmap_irq_get_virq(wcd937x->irq_chip,
+							 WCD937X_IRQ_MBHC_ELECT_INS_REM_DET);
+	intr_ids->hph_left_ocp = regmap_irq_get_virq(wcd937x->irq_chip,
+						     WCD937X_IRQ_HPHL_OCP_INT);
+	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd937x->irq_chip,
+						      WCD937X_IRQ_HPHR_OCP_INT);
+
+	wcd937x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(wcd937x->wcd_mbhc))
+		return PTR_ERR(wcd937x->wcd_mbhc);
+
+	snd_soc_add_component_controls(component, impedance_detect_controls,
+				       ARRAY_SIZE(impedance_detect_controls));
+	snd_soc_add_component_controls(component, hph_type_detect_controls,
+				       ARRAY_SIZE(hph_type_detect_controls));
+
+	return 0;
+}
+
+static void wcd937x_mbhc_deinit(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	wcd_mbhc_deinit(wcd937x->wcd_mbhc);
+}
+
+/* END MBHC */
+
+static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
+{
+	int vout_ctl[3];
+
+	/* Set micbias voltage */
+	vout_ctl[0] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb1_mv);
+	vout_ctl[1] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb2_mv);
+	vout_ctl[2] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb3_mv);
+	if ((vout_ctl[0] | vout_ctl[1] | vout_ctl[2]) < 0)
+		return -EINVAL;
+
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MICB_VOUT, vout_ctl[0]);
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MICB_VOUT, vout_ctl[1]);
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MICB_VOUT, vout_ctl[2]);
+
+	return 0;
+}
+
+static irqreturn_t wcd937x_wd_handle_irq(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static struct irq_chip wcd_irq_chip = {
+	.name = "WCD937x",
+};
+
+static int wcd_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
+			    irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &wcd_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops wcd_domain_ops = {
+	.map = wcd_irq_chip_map,
+};
+
+static int wcd937x_irq_init(struct wcd937x_priv *wcd, struct device *dev)
+{
+	wcd->virq = irq_domain_add_linear(NULL, 1, &wcd_domain_ops, NULL);
+	if (!(wcd->virq)) {
+		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
+		return -EINVAL;
+	}
+
+	return devm_regmap_add_irq_chip(dev, wcd->regmap,
+					irq_create_mapping(wcd->virq, 0),
+					IRQF_ONESHOT, 0, &wcd937x_regmap_irq_chip,
+					&wcd->irq_chip);
+}
+
+static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	struct sdw_slave *tx_sdw_dev = wcd937x->tx_sdw_dev;
+	struct device *dev = component->dev;
+	unsigned long time_left;
+	int i, ret;
+
+	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
+						msecs_to_jiffies(5000));
+	if (!time_left) {
+		dev_err(dev, "soundwire device init timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	snd_soc_component_init_regmap(component, wcd937x->regmap);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	wcd937x->chipid = (snd_soc_component_read(component,
+				WCD937X_DIGITAL_EFUSE_REG_0) & 0x1e) >> 1;
+	if (wcd937x->chipid != CHIPID_WCD9370 &&
+	    wcd937x->chipid != CHIPID_WCD9375) {
+		dev_err(dev, "Got unknown chip id: 0x%x\n", wcd937x->chipid);
+		pm_runtime_put(dev);
+		return -EINVAL;
+	}
+
+	wcd937x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD937X);
+	if (IS_ERR(wcd937x->clsh_info)) {
+		pm_runtime_put(dev);
+		return PTR_ERR(wcd937x->clsh_info);
+	}
+
+	wcd937x_io_init(wcd937x->regmap);
+	/* Set all interrupts as edge triggered */
+	for (i = 0; i < wcd937x_regmap_irq_chip.num_regs; i++)
+		regmap_write(wcd937x->regmap, (WCD937X_DIGITAL_INTR_LEVEL_0 + i), 0);
+
+	pm_runtime_put(dev);
+
+	wcd937x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
+						       WCD937X_IRQ_HPHR_PDM_WD_INT);
+	wcd937x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
+						       WCD937X_IRQ_HPHL_PDM_WD_INT);
+	wcd937x->aux_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
+						      WCD937X_IRQ_AUX_PDM_WD_INT);
+
+	/* Request for watchdog interrupt */
+	ret = devm_request_threaded_irq(dev, wcd937x->hphr_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"HPHR PDM WDOG INT", wcd937x);
+	if (ret)
+		dev_err(dev, "Failed to request HPHR watchdog interrupt (%d)\n", ret);
+
+	ret = devm_request_threaded_irq(dev, wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"HPHL PDM WDOG INT", wcd937x);
+	if (ret)
+		dev_err(dev, "Failed to request HPHL watchdog interrupt (%d)\n", ret);
+
+	ret = devm_request_threaded_irq(dev, wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"AUX PDM WDOG INT", wcd937x);
+	if (ret)
+		dev_err(dev, "Failed to request Aux watchdog interrupt (%d)\n", ret);
+
+	/* Disable watchdog interrupt for HPH and AUX */
+	disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
+	disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
+	disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+
+	ret = wcd937x_mbhc_init(component);
+	if (ret)
+		dev_err(component->dev,  "mbhc initialization failed\n");
+
+	return ret;
+}
+
+static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
+{
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	wcd937x_mbhc_deinit(component);
+	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
+	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
+	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
+
+	wcd_clsh_ctrl_free(wcd937x->clsh_info);
+}
+
+static int wcd937x_codec_set_jack(struct snd_soc_component *comp,
+				  struct snd_soc_jack *jack, void *data)
+{
+	struct wcd937x_priv *wcd = dev_get_drvdata(comp->dev);
+	int ret = 0;
+
+	if (jack)
+		ret = wcd_mbhc_start(wcd->wcd_mbhc, &wcd->mbhc_cfg, jack);
+	else
+		wcd_mbhc_stop(wcd->wcd_mbhc);
+
+	return ret;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
+	.name = "wcd937x_codec",
+	.probe = wcd937x_soc_codec_probe,
+	.remove = wcd937x_soc_codec_remove,
+	.set_jack = wcd937x_codec_set_jack,
+	.endianness = 1,
+};
+
+static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd937x_priv *wcd)
+{
+	struct device_node *np = dev->of_node;
+	u32 prop_val = 0;
+	int ret = 0;
+
+	ret = of_property_read_u32(np, "qcom,micbias1-microvolt", &prop_val);
+	if (!ret)
+		wcd->micb1_mv = prop_val / 1000;
+	else
+		dev_warn(dev, "Micbias1 DT property not found\n");
+
+	ret = of_property_read_u32(np, "qcom,micbias2-microvolt", &prop_val);
+	if (!ret)
+		wcd->micb2_mv = prop_val / 1000;
+	else
+		dev_warn(dev, "Micbias2 DT property not found\n");
+
+	ret = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
+	if (!ret)
+		wcd->micb3_mv = prop_val / 1000;
+	else
+		dev_warn(dev, "Micbias3 DT property not found\n");
+}
+
+static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+{
+	int value;
+	struct wcd937x_priv *wcd937x;
+
+	wcd937x = snd_soc_component_get_drvdata(component);
+
+	value = gpiod_get_value(wcd937x->us_euro_gpio);
+	gpiod_set_value(wcd937x->us_euro_gpio, !value);
+
+	return true;
+}
+
+static int wcd937x_codec_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dai->dev);
+	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[dai->id];
+
+	return wcd937x_sdw_hw_params(wcd, substream, params, dai);
+}
+
+static int wcd937x_codec_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dai->dev);
+	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[dai->id];
+
+	return sdw_stream_remove_slave(wcd->sdev, wcd->sruntime);
+}
+
+static int wcd937x_codec_set_sdw_stream(struct snd_soc_dai *dai,
+					void *stream, int direction)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dai->dev);
+	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[dai->id];
+
+	wcd->sruntime = stream;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops wcd937x_sdw_dai_ops = {
+	.hw_params = wcd937x_codec_hw_params,
+	.hw_free = wcd937x_codec_free,
+	.set_stream = wcd937x_codec_set_sdw_stream,
+};
+
+static struct snd_soc_dai_driver wcd937x_dais[] = {
+	[0] = {
+		.name = "wcd937x-sdw-rx",
+		.playback = {
+			.stream_name = "WCD AIF Playback",
+			.rates = WCD937X_RATES | WCD937X_FRAC_RATES,
+			.formats = WCD937X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 4,
+		},
+		.ops = &wcd937x_sdw_dai_ops,
+	},
+	[1] = {
+		.name = "wcd937x-sdw-tx",
+		.capture = {
+			.stream_name = "WCD AIF Capture",
+			.rates = WCD937X_RATES,
+			.formats = WCD937X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 192000,
+			.channels_min = 1,
+			.channels_max = 4,
+		},
+		.ops = &wcd937x_sdw_dai_ops,
+	},
+};
+
+static int wcd937x_bind(struct device *dev)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dev);
+	int ret;
+
+	/* Give the SDW subdevices some more time to settle */
+	usleep_range(5000, 5010);
+
+	ret = component_bind_all(dev, wcd937x);
+	if (ret) {
+		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	if (!wcd937x->rxdev) {
+		dev_err(dev, "could not find slave with matching of node\n");
+		return -EINVAL;
+	}
+
+	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
+	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
+
+	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	if (!wcd937x->txdev) {
+		dev_err(dev, "could not find txslave with matching of node\n");
+		return -EINVAL;
+	}
+
+	wcd937x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd937x->txdev);
+	wcd937x->sdw_priv[AIF1_CAP]->wcd937x = wcd937x;
+	wcd937x->tx_sdw_dev = dev_to_sdw_dev(wcd937x->txdev);
+	if (!wcd937x->tx_sdw_dev) {
+		dev_err(dev, "could not get txslave with matching of dev\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * As TX is the main CSR reg interface, which should not be suspended first.
+	 * expicilty add the dependency link
+	 */
+	if (!device_link_add(wcd937x->rxdev, wcd937x->txdev,
+			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "Could not devlink TX and RX\n");
+		return -EINVAL;
+	}
+
+	if (!device_link_add(dev, wcd937x->txdev,
+			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "Could not devlink WCD and TX\n");
+		return -EINVAL;
+	}
+
+	if (!device_link_add(dev, wcd937x->rxdev,
+			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "Could not devlink WCD and RX\n");
+		return -EINVAL;
+	}
+
+	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	if (!wcd937x->regmap) {
+		dev_err(dev, "could not get TX device regmap\n");
+		return -EINVAL;
+	}
+
+	ret = wcd937x_irq_init(wcd937x, dev);
+	if (ret) {
+		dev_err(dev, "IRQ init failed: %d\n", ret);
+		return ret;
+	}
+
+	wcd937x->sdw_priv[AIF1_PB]->slave_irq = wcd937x->virq;
+	wcd937x->sdw_priv[AIF1_CAP]->slave_irq = wcd937x->virq;
+
+	ret = wcd937x_set_micbias_data(wcd937x);
+	if (ret < 0) {
+		dev_err(dev, "Bad micbias pdata\n");
+		return ret;
+	}
+
+	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd937x,
+					 wcd937x_dais, ARRAY_SIZE(wcd937x_dais));
+	if (ret)
+		dev_err(dev, "Codec registration failed\n");
+
+	return ret;
+}
+
+static void wcd937x_unbind(struct device *dev)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dev);
+
+	snd_soc_unregister_component(dev);
+	device_link_remove(dev, wcd937x->txdev);
+	device_link_remove(dev, wcd937x->rxdev);
+	device_link_remove(wcd937x->rxdev, wcd937x->txdev);
+	component_unbind_all(dev, wcd937x);
+	mutex_destroy(&wcd937x->micb_lock);
+}
+
+static const struct component_master_ops wcd937x_comp_ops = {
+	.bind   = wcd937x_bind,
+	.unbind = wcd937x_unbind,
+};
+
+static int wcd937x_add_slave_components(struct wcd937x_priv *wcd937x,
+					struct device *dev,
+					struct component_match **matchptr)
+{
+	struct device_node *np = dev->of_node;
+
+	wcd937x->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
+	if (!wcd937x->rxnode) {
+		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
+		return -ENODEV;
+	}
+	of_node_get(wcd937x->rxnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd937x->rxnode);
+
+	wcd937x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
+	if (!wcd937x->txnode) {
+		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
+			return -ENODEV;
+	}
+	of_node_get(wcd937x->txnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd937x->txnode);
+
+	return 0;
+}
+
+static int wcd937x_probe(struct platform_device *pdev)
+{
+	struct component_match *match = NULL;
+	struct device *dev = &pdev->dev;
+	struct wcd937x_priv *wcd937x;
+	struct wcd_mbhc_config *cfg;
+	int ret;
+
+	wcd937x = devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
+	if (!wcd937x)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, wcd937x);
+	mutex_init(&wcd937x->micb_lock);
+
+	wcd937x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd937x->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd937x->reset_gpio),
+				     "failed to reset wcd gpio\n");
+
+	wcd937x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd937x->us_euro_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd937x->us_euro_gpio),
+				"us-euro swap Control GPIO not found\n");
+
+	cfg = &wcd937x->mbhc_cfg;
+	cfg->swap_gnd_mic = wcd937x_swap_gnd_mic;
+
+	wcd937x->supplies[0].supply = "vdd-rxtx";
+	wcd937x->supplies[1].supply = "vdd-px";
+	wcd937x->supplies[2].supply = "vdd-mic-bias";
+
+	ret = devm_regulator_bulk_get(dev, WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
+
+	/* Get the buck separately, as it needs special handling */
+	wcd937x->buck_supply = devm_regulator_get(dev, "vdd-buck");
+	if (IS_ERR(wcd937x->buck_supply))
+		return dev_err_probe(dev, PTR_ERR(wcd937x->buck_supply),
+				     "Failed to get buck supply\n");
+
+	ret = regulator_enable(wcd937x->buck_supply);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable buck supply\n");
+
+	wcd937x_dt_parse_micbias_info(dev, wcd937x);
+
+	cfg->mbhc_micbias = MIC_BIAS_2;
+	cfg->anc_micbias = MIC_BIAS_2;
+	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
+	cfg->num_btn = WCD937X_MBHC_MAX_BUTTONS;
+	cfg->micb_mv = wcd937x->micb2_mv;
+	cfg->linein_th = 5000;
+	cfg->hs_thr = 1700;
+	cfg->hph_thr = 50;
+
+	wcd_dt_parse_mbhc_data(dev, &wcd937x->mbhc_cfg);
+
+	ret = wcd937x_add_slave_components(wcd937x, dev, &match);
+	if (ret)
+		return ret;
+
+	wcd937x_reset(wcd937x);
+
+	ret = component_master_add_with_match(dev, &wcd937x_comp_ops, match);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return ret;
+}
+
+static void wcd937x_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dev);
+
+	component_master_del(&pdev->dev, &wcd937x_comp_ops);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id wcd937x_of_match[] = {
+	{ .compatible = "qcom,wcd9370-codec" },
+	{ .compatible = "qcom,wcd9375-codec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wcd937x_of_match);
+#endif
+
+static struct platform_driver wcd937x_codec_driver = {
+	.probe = wcd937x_probe,
+	.remove_new = wcd937x_remove,
+	.driver = {
+		.name = "wcd937x_codec",
+		.of_match_table = of_match_ptr(wcd937x_of_match),
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(wcd937x_codec_driver);
+MODULE_DESCRIPTION("WCD937X Codec driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

