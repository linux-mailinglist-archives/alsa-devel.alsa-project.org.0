Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574A8CE01F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 06:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2811208;
	Fri, 24 May 2024 06:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2811208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716523249;
	bh=4qNbw/0jEeMa5nPRyAEC64zs9R8c8H3GoX3h4fdSJzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JPqBhNNmP1PzSZHbjp1DmvC31TSZOat74GsRxsFZpjPaZ4ZFHZMvHsAwj1XUy2BkJ
	 Rz5ncPDrJJRaHXHnWLrBFrNMC0pXFt6+gbEBeSHMtPHQiQlFopaYoCaWWcHPg4sowU
	 2aY3cF9xawQkzQdDp1UwMdRzNxZQufjKmsTqfSaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8E37F80640; Fri, 24 May 2024 05:59:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0817F8063A;
	Fri, 24 May 2024 05:59:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACFE5F8020D; Fri, 24 May 2024 05:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDC9CF8016B
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 05:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC9CF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=L+KwwjRH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44NNPIDK004407;
	Fri, 24 May 2024 03:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fXIE51oFHRoLJA/CbB24NGmYuwCq6F2uJNllBJ+SlU=; b=L+KwwjRHYddLcTLm
	5VHYRt2H8l0X9byLaKYJd+RvSqz+7E+A7klc8wWcXB4p/Xrx2PYLXfIALQETzxU3
	aXymOKz5joNySIY7DR1TS2tDsEskizQ6hE4siVvNrhzbZ3oOE1Se+raytWWHC9qb
	mlg93rTaBgotDCAj4Bo2VAIjBW390YUHNRbGMQL1/VCgAAYD1Gi4606pZrp8Xx8I
	7rmbIRzWitbz3Evisvz3mcXKiPvJiCrhmcpM2XMofvvrrSKOi+qbLp5ZZ1kf1jBO
	C2oiFYgigtyecAAg/2btQ7tBhaGKT7xWu4Mju8c9/Zc3m1M/kQnmUPlNj6b0AsCM
	NFyJYw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaabq13hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:56:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44O3uXki024108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:56:33 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 20:56:28 -0700
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
Subject: [PATCH v5 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Date: Fri, 24 May 2024 09:25:30 +0530
Message-ID: <20240524035535.3119208-3-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524035535.3119208-1-quic_mohs@quicinc.com>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KtFE6P-Fq5FaEdgdZ1GFY4bYkvXaw0wM
X-Proofpoint-ORIG-GUID: KtFE6P-Fq5FaEdgdZ1GFY4bYkvXaw0wM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240026
Message-ID-Hash: Q4OF4M6ROPYW7ULHPVHXX7JGM5LOA64E
X-Message-ID-Hash: Q4OF4M6ROPYW7ULHPVHXX7JGM5LOA64E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4OF4M6ROPYW7ULHPVHXX7JGM5LOA64E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds support to SoundWire devices on WCD9370/WCD9375 Codec.

The WCD9370/WCD9375 Soundwire devices will be used by the
main WCD9370/WCD9375 Audio Codec driver to access registers
and configure Soundwire RX and TX ports.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 1139 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd937x.h     |  653 ++++++++++++++++++
 2 files changed, 1792 insertions(+)
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.h

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
new file mode 100644
index 000000000000..a45025bf96c6
--- /dev/null
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -0,0 +1,1139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc.h>
+#include "wcd937x.h"
+
+static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
+	WCD_SDW_CH(WCD937X_HPH_L, WCD937X_HPH_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_HPH_R, WCD937X_HPH_PORT, BIT(1)),
+	WCD_SDW_CH(WCD937X_CLSH, WCD937X_CLSH_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_COMP_L, WCD937X_COMP_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_COMP_R, WCD937X_COMP_PORT, BIT(1)),
+	WCD_SDW_CH(WCD937X_LO, WCD937X_LO_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_DSD_L, WCD937X_DSD_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_DSD_R, WCD937X_DSD_PORT, BIT(1)),
+};
+
+static struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
+	WCD_SDW_CH(WCD937X_ADC1, WCD937X_ADC_1_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_ADC2, WCD937X_ADC_2_3_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_ADC3, WCD937X_ADC_2_3_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_DMIC0, WCD937X_DMIC_0_3_MBHC_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_DMIC1, WCD937X_DMIC_0_3_MBHC_PORT, BIT(1)),
+	WCD_SDW_CH(WCD937X_MBHC, WCD937X_DMIC_0_3_MBHC_PORT, BIT(2)),
+	WCD_SDW_CH(WCD937X_DMIC2, WCD937X_DMIC_0_3_MBHC_PORT, BIT(2)),
+	WCD_SDW_CH(WCD937X_DMIC3, WCD937X_DMIC_0_3_MBHC_PORT, BIT(3)),
+	WCD_SDW_CH(WCD937X_DMIC4, WCD937X_DMIC_4_6_PORT, BIT(0)),
+	WCD_SDW_CH(WCD937X_DMIC5, WCD937X_DMIC_4_6_PORT, BIT(1)),
+	WCD_SDW_CH(WCD937X_DMIC6, WCD937X_DMIC_4_6_PORT, BIT(2)),
+};
+
+static struct sdw_dpn_prop wcd937x_dpn_prop[WCD937X_MAX_SWR_PORTS] = {
+	{
+		.num = 1,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 8,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 2,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 3,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 4,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 5,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}
+};
+
+struct device *wcd937x_sdw_device_get(struct device_node *np)
+{
+	return bus_find_device_by_of_node(&sdw_bus_type, np);
+}
+EXPORT_SYMBOL_GPL(wcd937x_sdw_device_get);
+
+int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *dai)
+{
+	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
+	unsigned long ch_mask;
+	int i, j;
+
+	wcd->sconfig.ch_count = 1;
+	wcd->active_ports = 0;
+	for (i = 0; i < WCD937X_MAX_SWR_PORTS; i++) {
+		ch_mask = wcd->port_config[i].ch_mask;
+		if (!ch_mask)
+			continue;
+
+		for_each_set_bit(j, &ch_mask, 4)
+			wcd->sconfig.ch_count++;
+
+		port_config[wcd->active_ports] = wcd->port_config[i];
+		wcd->active_ports++;
+	}
+
+	wcd->sconfig.bps = 1;
+	wcd->sconfig.frame_rate = params_rate(params);
+	wcd->sconfig.direction = wcd->is_tx ? SDW_DATA_DIR_TX : SDW_DATA_DIR_RX;
+	wcd->sconfig.type = SDW_STREAM_PCM;
+
+	return sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
+				    &port_config[0], wcd->active_ports,
+				    wcd->sruntime);
+}
+EXPORT_SYMBOL_GPL(wcd937x_sdw_hw_params);
+
+static int wcd9370_update_status(struct sdw_slave *slave, enum sdw_slave_status status)
+{
+	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
+
+	if (wcd->regmap && status == SDW_SLAVE_ATTACHED) {
+		/* Write out any cached changes that happened between probe and attach */
+		regcache_cache_only(wcd->regmap, false);
+		return regcache_sync(wcd->regmap);
+	}
+
+	return 0;
+}
+
+/*
+ * Handle Soundwire out-of-band interrupt event by triggering
+ * the first irq of the slave_irq irq domain, which then will
+ * be handled by the regmap_irq threaded irq.
+ * Looping is to ensure no interrupts were missed in the process.
+ */
+static int wcd9370_interrupt_callback(struct sdw_slave *slave,
+				      struct sdw_slave_intr_status *status)
+{
+	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
+	struct irq_domain *slave_irq = wcd->slave_irq;
+	u32 sts1, sts2, sts3;
+
+	do {
+		handle_nested_irq(irq_find_mapping(slave_irq, 0));
+		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_0, &sts1);
+		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_1, &sts2);
+		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_2, &sts3);
+
+	} while (sts1 || sts2 || sts3);
+
+	return IRQ_HANDLED;
+}
+
+static const struct reg_default wcd937x_defaults[] = {
+	/* Default values except for Read-Only & Volatile registers */
+	{ WCD937X_ANA_BIAS,					0x00 },
+	{ WCD937X_ANA_RX_SUPPLIES,				0x00 },
+	{ WCD937X_ANA_HPH,					0x0c },
+	{ WCD937X_ANA_EAR,					0x00 },
+	{ WCD937X_ANA_EAR_COMPANDER_CTL,			0x02 },
+	{ WCD937X_ANA_TX_CH1,					0x20 },
+	{ WCD937X_ANA_TX_CH2,					0x00 },
+	{ WCD937X_ANA_TX_CH3,					0x20 },
+	{ WCD937X_ANA_TX_CH3_HPF,				0x00 },
+	{ WCD937X_ANA_MICB1_MICB2_DSP_EN_LOGIC,			0x00 },
+	{ WCD937X_ANA_MICB3_DSP_EN_LOGIC,			0x00 },
+	{ WCD937X_ANA_MBHC_MECH,				0x39 },
+	{ WCD937X_ANA_MBHC_ELECT,				0x08 },
+	{ WCD937X_ANA_MBHC_ZDET,				0x00 },
+	{ WCD937X_ANA_MBHC_BTN0,				0x00 },
+	{ WCD937X_ANA_MBHC_BTN1,				0x10 },
+	{ WCD937X_ANA_MBHC_BTN2,				0x20 },
+	{ WCD937X_ANA_MBHC_BTN3,				0x30 },
+	{ WCD937X_ANA_MBHC_BTN4,				0x40 },
+	{ WCD937X_ANA_MBHC_BTN5,				0x50 },
+	{ WCD937X_ANA_MBHC_BTN6,				0x60 },
+	{ WCD937X_ANA_MBHC_BTN7,				0x70 },
+	{ WCD937X_ANA_MICB1,					0x10 },
+	{ WCD937X_ANA_MICB2,					0x10 },
+	{ WCD937X_ANA_MICB2_RAMP,				0x00 },
+	{ WCD937X_ANA_MICB3,					0x10 },
+	{ WCD937X_BIAS_CTL,					0x2a },
+	{ WCD937X_BIAS_VBG_FINE_ADJ,				0x55 },
+	{ WCD937X_LDOL_VDDCX_ADJUST,				0x01 },
+	{ WCD937X_LDOL_DISABLE_LDOL,				0x00 },
+	{ WCD937X_MBHC_CTL_CLK,					0x00 },
+	{ WCD937X_MBHC_CTL_ANA,					0x00 },
+	{ WCD937X_MBHC_CTL_SPARE_1,				0x00 },
+	{ WCD937X_MBHC_CTL_SPARE_2,				0x00 },
+	{ WCD937X_MBHC_CTL_BCS,					0x00 },
+	{ WCD937X_MBHC_TEST_CTL,				0x00 },
+	{ WCD937X_LDOH_MODE,					0x2b },
+	{ WCD937X_LDOH_BIAS,					0x68 },
+	{ WCD937X_LDOH_STB_LOADS,				0x00 },
+	{ WCD937X_LDOH_SLOWRAMP,				0x50 },
+	{ WCD937X_MICB1_TEST_CTL_1,				0x1a },
+	{ WCD937X_MICB1_TEST_CTL_2,				0x18 },
+	{ WCD937X_MICB1_TEST_CTL_3,				0xa4 },
+	{ WCD937X_MICB2_TEST_CTL_1,				0x1a },
+	{ WCD937X_MICB2_TEST_CTL_2,				0x18 },
+	{ WCD937X_MICB2_TEST_CTL_3,				0xa4 },
+	{ WCD937X_MICB3_TEST_CTL_1,				0x1a },
+	{ WCD937X_MICB3_TEST_CTL_2,				0x18 },
+	{ WCD937X_MICB3_TEST_CTL_3,				0xa4 },
+	{ WCD937X_TX_COM_ADC_VCM,				0x39 },
+	{ WCD937X_TX_COM_BIAS_ATEST,				0xc0 },
+	{ WCD937X_TX_COM_ADC_INT1_IB,				0x6f },
+	{ WCD937X_TX_COM_ADC_INT2_IB,				0x4f },
+	{ WCD937X_TX_COM_TXFE_DIV_CTL,				0x2e },
+	{ WCD937X_TX_COM_TXFE_DIV_START,			0x00 },
+	{ WCD937X_TX_COM_TXFE_DIV_STOP_9P6M,			0xc7 },
+	{ WCD937X_TX_COM_TXFE_DIV_STOP_12P288M,			0xff },
+	{ WCD937X_TX_1_2_TEST_EN,				0xcc },
+	{ WCD937X_TX_1_2_ADC_IB,				0x09 },
+	{ WCD937X_TX_1_2_ATEST_REFCTL,				0x0a },
+	{ WCD937X_TX_1_2_TEST_CTL,				0x38 },
+	{ WCD937X_TX_1_2_TEST_BLK_EN,				0xff },
+	{ WCD937X_TX_1_2_TXFE_CLKDIV,				0x00 },
+	{ WCD937X_TX_3_TEST_EN,					0xcc },
+	{ WCD937X_TX_3_ADC_IB,					0x09 },
+	{ WCD937X_TX_3_ATEST_REFCTL,				0x0a },
+	{ WCD937X_TX_3_TEST_CTL,				0x38 },
+	{ WCD937X_TX_3_TEST_BLK_EN,				0xff },
+	{ WCD937X_TX_3_TXFE_CLKDIV,				0x00 },
+	{ WCD937X_TX_3_SPARE_MONO,				0x00 },
+	{ WCD937X_CLASSH_MODE_1,				0x40 },
+	{ WCD937X_CLASSH_MODE_2,				0x3a },
+	{ WCD937X_CLASSH_MODE_3,				0x00 },
+	{ WCD937X_CLASSH_CTRL_VCL_1,				0x70 },
+	{ WCD937X_CLASSH_CTRL_VCL_2,				0x82 },
+	{ WCD937X_CLASSH_CTRL_CCL_1,				0x31 },
+	{ WCD937X_CLASSH_CTRL_CCL_2,				0x80 },
+	{ WCD937X_CLASSH_CTRL_CCL_3,				0x80 },
+	{ WCD937X_CLASSH_CTRL_CCL_4,				0x51 },
+	{ WCD937X_CLASSH_CTRL_CCL_5,				0x00 },
+	{ WCD937X_CLASSH_BUCK_TMUX_A_D,				0x00 },
+	{ WCD937X_CLASSH_BUCK_SW_DRV_CNTL,			0x77 },
+	{ WCD937X_CLASSH_SPARE,					0x00 },
+	{ WCD937X_FLYBACK_EN,					0x4e },
+	{ WCD937X_FLYBACK_VNEG_CTRL_1,				0x0b },
+	{ WCD937X_FLYBACK_VNEG_CTRL_2,				0x45 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_3,				0x74 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_4,				0x7f },
+	{ WCD937X_FLYBACK_VNEG_CTRL_5,				0x83 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_6,				0x98 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_7,				0xa9 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_8,				0x68 },
+	{ WCD937X_FLYBACK_VNEG_CTRL_9,				0x64 },
+	{ WCD937X_FLYBACK_VNEGDAC_CTRL_1,			0xed },
+	{ WCD937X_FLYBACK_VNEGDAC_CTRL_2,			0xf0 },
+	{ WCD937X_FLYBACK_VNEGDAC_CTRL_3,			0xa6 },
+	{ WCD937X_FLYBACK_CTRL_1,				0x65 },
+	{ WCD937X_FLYBACK_TEST_CTL,				0x00 },
+	{ WCD937X_RX_AUX_SW_CTL,				0x00 },
+	{ WCD937X_RX_PA_AUX_IN_CONN,				0x00 },
+	{ WCD937X_RX_TIMER_DIV,					0x32 },
+	{ WCD937X_RX_OCP_CTL,					0x1f },
+	{ WCD937X_RX_OCP_COUNT,					0x77 },
+	{ WCD937X_RX_BIAS_EAR_DAC,				0xa0 },
+	{ WCD937X_RX_BIAS_EAR_AMP,				0xaa },
+	{ WCD937X_RX_BIAS_HPH_LDO,				0xa9 },
+	{ WCD937X_RX_BIAS_HPH_PA,				0xaa },
+	{ WCD937X_RX_BIAS_HPH_RDACBUFF_CNP2,			0x8a },
+	{ WCD937X_RX_BIAS_HPH_RDAC_LDO,				0x88 },
+	{ WCD937X_RX_BIAS_HPH_CNP1,				0x82 },
+	{ WCD937X_RX_BIAS_HPH_LOWPOWER,				0x82 },
+	{ WCD937X_RX_BIAS_AUX_DAC,				0xa0 },
+	{ WCD937X_RX_BIAS_AUX_AMP,				0xaa },
+	{ WCD937X_RX_BIAS_VNEGDAC_BLEEDER,			0x50 },
+	{ WCD937X_RX_BIAS_MISC,					0x00 },
+	{ WCD937X_RX_BIAS_BUCK_RST,				0x08 },
+	{ WCD937X_RX_BIAS_BUCK_VREF_ERRAMP,			0x44 },
+	{ WCD937X_RX_BIAS_FLYB_ERRAMP,				0x40 },
+	{ WCD937X_RX_BIAS_FLYB_BUFF,				0xaa },
+	{ WCD937X_RX_BIAS_FLYB_MID_RST,				0x14 },
+	{ WCD937X_HPH_CNP_EN,					0x80 },
+	{ WCD937X_HPH_CNP_WG_CTL,				0x9a },
+	{ WCD937X_HPH_CNP_WG_TIME,				0x14 },
+	{ WCD937X_HPH_OCP_CTL,					0x28 },
+	{ WCD937X_HPH_AUTO_CHOP,				0x16 },
+	{ WCD937X_HPH_CHOP_CTL,					0x83 },
+	{ WCD937X_HPH_PA_CTL1,					0x46 },
+	{ WCD937X_HPH_PA_CTL2,					0x50 },
+	{ WCD937X_HPH_L_EN,					0x80 },
+	{ WCD937X_HPH_L_TEST,					0xe0 },
+	{ WCD937X_HPH_L_ATEST,					0x50 },
+	{ WCD937X_HPH_R_EN,					0x80 },
+	{ WCD937X_HPH_R_TEST,					0xe0 },
+	{ WCD937X_HPH_R_ATEST,					0x54 },
+	{ WCD937X_HPH_RDAC_CLK_CTL1,				0x99 },
+	{ WCD937X_HPH_RDAC_CLK_CTL2,				0x9b },
+	{ WCD937X_HPH_RDAC_LDO_CTL,				0x33 },
+	{ WCD937X_HPH_RDAC_CHOP_CLK_LP_CTL,			0x00 },
+	{ WCD937X_HPH_REFBUFF_UHQA_CTL,				0xa8 },
+	{ WCD937X_HPH_REFBUFF_LP_CTL,				0x0e },
+	{ WCD937X_HPH_L_DAC_CTL,				0x20 },
+	{ WCD937X_HPH_R_DAC_CTL,				0x20 },
+	{ WCD937X_HPH_SURGE_HPHLR_SURGE_COMP_SEL,		0x55 },
+	{ WCD937X_HPH_SURGE_HPHLR_SURGE_EN,			0x19 },
+	{ WCD937X_HPH_SURGE_HPHLR_SURGE_MISC1,			0xa0 },
+	{ WCD937X_EAR_EAR_EN_REG,				0x22 },
+	{ WCD937X_EAR_EAR_PA_CON,				0x44 },
+	{ WCD937X_EAR_EAR_SP_CON,				0xdb },
+	{ WCD937X_EAR_EAR_DAC_CON,				0x80 },
+	{ WCD937X_EAR_EAR_CNP_FSM_CON,				0xb2 },
+	{ WCD937X_EAR_TEST_CTL,					0x00 },
+	{ WCD937X_ANA_NEW_PAGE_REGISTER,			0x00 },
+	{ WCD937X_HPH_NEW_ANA_HPH2,				0x00 },
+	{ WCD937X_HPH_NEW_ANA_HPH3,				0x00 },
+	{ WCD937X_SLEEP_CTL,					0x16 },
+	{ WCD937X_SLEEP_WATCHDOG_CTL,				0x00 },
+	{ WCD937X_MBHC_NEW_ELECT_REM_CLAMP_CTL,			0x00 },
+	{ WCD937X_MBHC_NEW_CTL_1,				0x02 },
+	{ WCD937X_MBHC_NEW_CTL_2,				0x05 },
+	{ WCD937X_MBHC_NEW_PLUG_DETECT_CTL,			0xe9 },
+	{ WCD937X_MBHC_NEW_ZDET_ANA_CTL,			0x0f },
+	{ WCD937X_MBHC_NEW_ZDET_RAMP_CTL,			0x00 },
+	{ WCD937X_TX_NEW_TX_CH2_SEL,				0x00 },
+	{ WCD937X_AUX_AUXPA,					0x00 },
+	{ WCD937X_LDORXTX_MODE,					0x0c },
+	{ WCD937X_LDORXTX_CONFIG,				0x10 },
+	{ WCD937X_DIE_CRACK_DIE_CRK_DET_EN,			0x00 },
+	{ WCD937X_HPH_NEW_INT_RDAC_GAIN_CTL,			0x40 },
+	{ WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L,			0x81 },
+	{ WCD937X_HPH_NEW_INT_RDAC_VREF_CTL,			0x10 },
+	{ WCD937X_HPH_NEW_INT_RDAC_OVERRIDE_CTL,		0x00 },
+	{ WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R,			0x81 },
+	{ WCD937X_HPH_NEW_INT_PA_MISC1,				0x22 },
+	{ WCD937X_HPH_NEW_INT_PA_MISC2,				0x00 },
+	{ WCD937X_HPH_NEW_INT_PA_RDAC_MISC,			0x00 },
+	{ WCD937X_HPH_NEW_INT_HPH_TIMER1,			0xfe },
+	{ WCD937X_HPH_NEW_INT_HPH_TIMER2,			0x02 },
+	{ WCD937X_HPH_NEW_INT_HPH_TIMER3,			0x4e },
+	{ WCD937X_HPH_NEW_INT_HPH_TIMER4,			0x54 },
+	{ WCD937X_HPH_NEW_INT_PA_RDAC_MISC2,			0x00 },
+	{ WCD937X_HPH_NEW_INT_PA_RDAC_MISC3,			0x00 },
+	{ WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI,		0x62 },
+	{ WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_ULP,			0x01 },
+	{ WCD937X_RX_NEW_INT_HPH_RDAC_LDO_LP,			0x11 },
+	{ WCD937X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL,		0x57 },
+	{ WCD937X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL,	0x01 },
+	{ WCD937X_MBHC_NEW_INT_MECH_DET_CURRENT,		0x00 },
+	{ WCD937X_MBHC_NEW_INT_SPARE_2,				0x00 },
+	{ WCD937X_EAR_INT_NEW_EAR_CHOPPER_CON,			0xa8 },
+	{ WCD937X_EAR_INT_NEW_CNP_VCM_CON1,			0x42 },
+	{ WCD937X_EAR_INT_NEW_CNP_VCM_CON2,			0x22 },
+	{ WCD937X_EAR_INT_NEW_EAR_DYNAMIC_BIAS,			0x00 },
+	{ WCD937X_AUX_INT_EN_REG,				0x00 },
+	{ WCD937X_AUX_INT_PA_CTRL,				0x06 },
+	{ WCD937X_AUX_INT_SP_CTRL,				0xd2 },
+	{ WCD937X_AUX_INT_DAC_CTRL,				0x80 },
+	{ WCD937X_AUX_INT_CLK_CTRL,				0x50 },
+	{ WCD937X_AUX_INT_TEST_CTRL,				0x00 },
+	{ WCD937X_AUX_INT_STATUS_REG,				0x00 },
+	{ WCD937X_AUX_INT_MISC,					0x00 },
+	{ WCD937X_LDORXTX_INT_BIAS,				0x6e },
+	{ WCD937X_LDORXTX_INT_STB_LOADS_DTEST,			0x50 },
+	{ WCD937X_LDORXTX_INT_TEST0,				0x1c },
+	{ WCD937X_LDORXTX_INT_STARTUP_TIMER,			0xff },
+	{ WCD937X_LDORXTX_INT_TEST1,				0x1f },
+	{ WCD937X_LDORXTX_INT_STATUS,				0x00 },
+	{ WCD937X_SLEEP_INT_WATCHDOG_CTL_1,			0x0a },
+	{ WCD937X_SLEEP_INT_WATCHDOG_CTL_2,			0x0a },
+	{ WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT1,		0x02 },
+	{ WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT2,		0x60 },
+	{ WCD937X_DIGITAL_PAGE_REGISTER,			0x00 },
+	{ WCD937X_DIGITAL_CDC_RST_CTL,				0x03 },
+	{ WCD937X_DIGITAL_TOP_CLK_CFG,				0x00 },
+	{ WCD937X_DIGITAL_CDC_ANA_CLK_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_DIG_CLK_CTL,			0x00 },
+	{ WCD937X_DIGITAL_SWR_RST_EN,				0x00 },
+	{ WCD937X_DIGITAL_CDC_PATH_MODE,			0x55 },
+	{ WCD937X_DIGITAL_CDC_RX_RST,				0x00 },
+	{ WCD937X_DIGITAL_CDC_RX0_CTL,				0xfc },
+	{ WCD937X_DIGITAL_CDC_RX1_CTL,				0xfc },
+	{ WCD937X_DIGITAL_CDC_RX2_CTL,				0xfc },
+	{ WCD937X_DIGITAL_DEM_BYPASS_DATA0,			0x55 },
+	{ WCD937X_DIGITAL_DEM_BYPASS_DATA1,			0x55 },
+	{ WCD937X_DIGITAL_DEM_BYPASS_DATA2,			0x55 },
+	{ WCD937X_DIGITAL_DEM_BYPASS_DATA3,			0x01 },
+	{ WCD937X_DIGITAL_CDC_COMP_CTL_0,			0x00 },
+	{ WCD937X_DIGITAL_CDC_RX_DELAY_CTL,			0x66 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A1_0,			0x00 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A1_1,			0x01 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A2_0,			0x63 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A2_1,			0x04 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A3_0,			0xac },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A3_1,			0x04 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A4_0,			0x1a },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A4_1,			0x03 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A5_0,			0xbc },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A5_1,			0x02 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A6_0,			0xc7 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_A7_0,			0xf8 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_C_0,			0x47 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_C_1,			0x43 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_C_2,			0xb1 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_C_3,			0x17 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R1,			0x4b },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R2,			0x26 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R3,			0x32 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R4,			0x57 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R5,			0x63 },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R6,			0x7c },
+	{ WCD937X_DIGITAL_CDC_HPH_DSM_R7,			0x57 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A1_0,			0x00 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A1_1,			0x01 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A2_0,			0x96 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A2_1,			0x09 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A3_0,			0xab },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A3_1,			0x05 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A4_0,			0x1c },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A4_1,			0x02 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A5_0,			0x17 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A5_1,			0x02 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A6_0,			0xaa },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_A7_0,			0xe3 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_C_0,			0x69 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_C_1,			0x54 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_C_2,			0x02 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_C_3,			0x15 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R1,			0xa4 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R2,			0xb5 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R3,			0x86 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R4,			0x85 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R5,			0xaa },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R6,			0xe2 },
+	{ WCD937X_DIGITAL_CDC_AUX_DSM_R7,			0x62 },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_RX_0,			0x55 },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_RX_1,			0xa9 },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_0,			0x3d },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_1,			0x2e },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_2,			0x01 },
+	{ WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_0,			0x00 },
+	{ WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_1,			0xfc },
+	{ WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_2,			0x01 },
+	{ WCD937X_DIGITAL_CDC_HPH_GAIN_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_AUX_GAIN_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_EAR_PATH_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_SWR_CLH,				0x00 },
+	{ WCD937X_DIGITAL_SWR_CLH_BYP,				0x00 },
+	{ WCD937X_DIGITAL_CDC_TX0_CTL,				0x68 },
+	{ WCD937X_DIGITAL_CDC_TX1_CTL,				0x68 },
+	{ WCD937X_DIGITAL_CDC_TX2_CTL,				0x68 },
+	{ WCD937X_DIGITAL_CDC_TX_RST,				0x00 },
+	{ WCD937X_DIGITAL_CDC_REQ_CTL,				0x01 },
+	{ WCD937X_DIGITAL_CDC_AMIC_CTL,				0x07 },
+	{ WCD937X_DIGITAL_CDC_DMIC_CTL,				0x00 },
+	{ WCD937X_DIGITAL_CDC_DMIC1_CTL,			0x01 },
+	{ WCD937X_DIGITAL_CDC_DMIC2_CTL,			0x01 },
+	{ WCD937X_DIGITAL_CDC_DMIC3_CTL,			0x01 },
+	{ WCD937X_DIGITAL_EFUSE_CTL,				0x2b },
+	{ WCD937X_DIGITAL_EFUSE_PRG_CTL,			0x00 },
+	{ WCD937X_DIGITAL_EFUSE_TEST_CTL_0,			0x00 },
+	{ WCD937X_DIGITAL_EFUSE_TEST_CTL_1,			0x00 },
+	{ WCD937X_DIGITAL_PDM_WD_CTL0,				0x00 },
+	{ WCD937X_DIGITAL_PDM_WD_CTL1,				0x00 },
+	{ WCD937X_DIGITAL_PDM_WD_CTL2,				0x00 },
+	{ WCD937X_DIGITAL_INTR_MODE,				0x00 },
+	{ WCD937X_DIGITAL_INTR_MASK_0,				0xff },
+	{ WCD937X_DIGITAL_INTR_MASK_1,				0xff },
+	{ WCD937X_DIGITAL_INTR_MASK_2,				0x0f },
+	{ WCD937X_DIGITAL_INTR_CLEAR_0,				0x00 },
+	{ WCD937X_DIGITAL_INTR_CLEAR_1,				0x00 },
+	{ WCD937X_DIGITAL_INTR_CLEAR_2,				0x00 },
+	{ WCD937X_DIGITAL_INTR_LEVEL_0,				0x00 },
+	{ WCD937X_DIGITAL_INTR_LEVEL_1,				0x00 },
+	{ WCD937X_DIGITAL_INTR_LEVEL_2,				0x00 },
+	{ WCD937X_DIGITAL_INTR_SET_0,				0x00 },
+	{ WCD937X_DIGITAL_INTR_SET_1,				0x00 },
+	{ WCD937X_DIGITAL_INTR_SET_2,				0x00 },
+	{ WCD937X_DIGITAL_INTR_TEST_0,				0x00 },
+	{ WCD937X_DIGITAL_INTR_TEST_1,				0x00 },
+	{ WCD937X_DIGITAL_INTR_TEST_2,				0x00 },
+	{ WCD937X_DIGITAL_CDC_CONN_RX0_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_CONN_RX1_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_CONN_RX2_CTL,			0x00 },
+	{ WCD937X_DIGITAL_CDC_CONN_TX_CTL,			0x00 },
+	{ WCD937X_DIGITAL_LOOP_BACK_MODE,			0x00 },
+	{ WCD937X_DIGITAL_SWR_DAC_TEST,				0x00 },
+	{ WCD937X_DIGITAL_SWR_HM_TEST_RX_0,			0x40 },
+	{ WCD937X_DIGITAL_SWR_HM_TEST_TX_0,			0x40 },
+	{ WCD937X_DIGITAL_SWR_HM_TEST_RX_1,			0x00 },
+	{ WCD937X_DIGITAL_SWR_HM_TEST_TX_1,			0x00 },
+	{ WCD937X_DIGITAL_PAD_CTL_PDM_RX0,			0xf1 },
+	{ WCD937X_DIGITAL_PAD_CTL_PDM_RX1,			0xf1 },
+	{ WCD937X_DIGITAL_PAD_CTL_PDM_TX0,			0xf1 },
+	{ WCD937X_DIGITAL_PAD_CTL_PDM_TX1,			0xf1 },
+	{ WCD937X_DIGITAL_PAD_INP_DIS_0,			0x00 },
+	{ WCD937X_DIGITAL_PAD_INP_DIS_1,			0x00 },
+	{ WCD937X_DIGITAL_DRIVE_STRENGTH_0,			0x00 },
+	{ WCD937X_DIGITAL_DRIVE_STRENGTH_1,			0x00 },
+	{ WCD937X_DIGITAL_DRIVE_STRENGTH_2,			0x00 },
+	{ WCD937X_DIGITAL_RX_DATA_EDGE_CTL,			0x1f },
+	{ WCD937X_DIGITAL_TX_DATA_EDGE_CTL,			0x10 },
+	{ WCD937X_DIGITAL_GPIO_MODE,				0x00 },
+	{ WCD937X_DIGITAL_PIN_CTL_OE,				0x00 },
+	{ WCD937X_DIGITAL_PIN_CTL_DATA_0,			0x00 },
+	{ WCD937X_DIGITAL_PIN_CTL_DATA_1,			0x00 },
+	{ WCD937X_DIGITAL_DIG_DEBUG_CTL,			0x00 },
+	{ WCD937X_DIGITAL_DIG_DEBUG_EN,				0x00 },
+	{ WCD937X_DIGITAL_ANA_CSR_DBG_ADD,			0x00 },
+	{ WCD937X_DIGITAL_ANA_CSR_DBG_CTL,			0x48 },
+	{ WCD937X_DIGITAL_SSP_DBG,				0x00 },
+	{ WCD937X_DIGITAL_SPARE_0,				0x00 },
+	{ WCD937X_DIGITAL_SPARE_1,				0x00 },
+	{ WCD937X_DIGITAL_SPARE_2,				0x00 },
+};
+
+static bool wcd937x_rdwr_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD937X_ANA_BIAS:
+	case WCD937X_ANA_RX_SUPPLIES:
+	case WCD937X_ANA_HPH:
+	case WCD937X_ANA_EAR:
+	case WCD937X_ANA_EAR_COMPANDER_CTL:
+	case WCD937X_ANA_TX_CH1:
+	case WCD937X_ANA_TX_CH2:
+	case WCD937X_ANA_TX_CH3:
+	case WCD937X_ANA_TX_CH3_HPF:
+	case WCD937X_ANA_MICB1_MICB2_DSP_EN_LOGIC:
+	case WCD937X_ANA_MICB3_DSP_EN_LOGIC:
+	case WCD937X_ANA_MBHC_MECH:
+	case WCD937X_ANA_MBHC_ELECT:
+	case WCD937X_ANA_MBHC_ZDET:
+	case WCD937X_ANA_MBHC_BTN0:
+	case WCD937X_ANA_MBHC_BTN1:
+	case WCD937X_ANA_MBHC_BTN2:
+	case WCD937X_ANA_MBHC_BTN3:
+	case WCD937X_ANA_MBHC_BTN4:
+	case WCD937X_ANA_MBHC_BTN5:
+	case WCD937X_ANA_MBHC_BTN6:
+	case WCD937X_ANA_MBHC_BTN7:
+	case WCD937X_ANA_MICB1:
+	case WCD937X_ANA_MICB2:
+	case WCD937X_ANA_MICB2_RAMP:
+	case WCD937X_ANA_MICB3:
+	case WCD937X_BIAS_CTL:
+	case WCD937X_BIAS_VBG_FINE_ADJ:
+	case WCD937X_LDOL_VDDCX_ADJUST:
+	case WCD937X_LDOL_DISABLE_LDOL:
+	case WCD937X_MBHC_CTL_CLK:
+	case WCD937X_MBHC_CTL_ANA:
+	case WCD937X_MBHC_CTL_SPARE_1:
+	case WCD937X_MBHC_CTL_SPARE_2:
+	case WCD937X_MBHC_CTL_BCS:
+	case WCD937X_MBHC_TEST_CTL:
+	case WCD937X_LDOH_MODE:
+	case WCD937X_LDOH_BIAS:
+	case WCD937X_LDOH_STB_LOADS:
+	case WCD937X_LDOH_SLOWRAMP:
+	case WCD937X_MICB1_TEST_CTL_1:
+	case WCD937X_MICB1_TEST_CTL_2:
+	case WCD937X_MICB1_TEST_CTL_3:
+	case WCD937X_MICB2_TEST_CTL_1:
+	case WCD937X_MICB2_TEST_CTL_2:
+	case WCD937X_MICB2_TEST_CTL_3:
+	case WCD937X_MICB3_TEST_CTL_1:
+	case WCD937X_MICB3_TEST_CTL_2:
+	case WCD937X_MICB3_TEST_CTL_3:
+	case WCD937X_TX_COM_ADC_VCM:
+	case WCD937X_TX_COM_BIAS_ATEST:
+	case WCD937X_TX_COM_ADC_INT1_IB:
+	case WCD937X_TX_COM_ADC_INT2_IB:
+	case WCD937X_TX_COM_TXFE_DIV_CTL:
+	case WCD937X_TX_COM_TXFE_DIV_START:
+	case WCD937X_TX_COM_TXFE_DIV_STOP_9P6M:
+	case WCD937X_TX_COM_TXFE_DIV_STOP_12P288M:
+	case WCD937X_TX_1_2_TEST_EN:
+	case WCD937X_TX_1_2_ADC_IB:
+	case WCD937X_TX_1_2_ATEST_REFCTL:
+	case WCD937X_TX_1_2_TEST_CTL:
+	case WCD937X_TX_1_2_TEST_BLK_EN:
+	case WCD937X_TX_1_2_TXFE_CLKDIV:
+	case WCD937X_TX_3_TEST_EN:
+	case WCD937X_TX_3_ADC_IB:
+	case WCD937X_TX_3_ATEST_REFCTL:
+	case WCD937X_TX_3_TEST_CTL:
+	case WCD937X_TX_3_TEST_BLK_EN:
+	case WCD937X_TX_3_TXFE_CLKDIV:
+	case WCD937X_CLASSH_MODE_1:
+	case WCD937X_CLASSH_MODE_2:
+	case WCD937X_CLASSH_MODE_3:
+	case WCD937X_CLASSH_CTRL_VCL_1:
+	case WCD937X_CLASSH_CTRL_VCL_2:
+	case WCD937X_CLASSH_CTRL_CCL_1:
+	case WCD937X_CLASSH_CTRL_CCL_2:
+	case WCD937X_CLASSH_CTRL_CCL_3:
+	case WCD937X_CLASSH_CTRL_CCL_4:
+	case WCD937X_CLASSH_CTRL_CCL_5:
+	case WCD937X_CLASSH_BUCK_TMUX_A_D:
+	case WCD937X_CLASSH_BUCK_SW_DRV_CNTL:
+	case WCD937X_CLASSH_SPARE:
+	case WCD937X_FLYBACK_EN:
+	case WCD937X_FLYBACK_VNEG_CTRL_1:
+	case WCD937X_FLYBACK_VNEG_CTRL_2:
+	case WCD937X_FLYBACK_VNEG_CTRL_3:
+	case WCD937X_FLYBACK_VNEG_CTRL_4:
+	case WCD937X_FLYBACK_VNEG_CTRL_5:
+	case WCD937X_FLYBACK_VNEG_CTRL_6:
+	case WCD937X_FLYBACK_VNEG_CTRL_7:
+	case WCD937X_FLYBACK_VNEG_CTRL_8:
+	case WCD937X_FLYBACK_VNEG_CTRL_9:
+	case WCD937X_FLYBACK_VNEGDAC_CTRL_1:
+	case WCD937X_FLYBACK_VNEGDAC_CTRL_2:
+	case WCD937X_FLYBACK_VNEGDAC_CTRL_3:
+	case WCD937X_FLYBACK_CTRL_1:
+	case WCD937X_FLYBACK_TEST_CTL:
+	case WCD937X_RX_AUX_SW_CTL:
+	case WCD937X_RX_PA_AUX_IN_CONN:
+	case WCD937X_RX_TIMER_DIV:
+	case WCD937X_RX_OCP_CTL:
+	case WCD937X_RX_OCP_COUNT:
+	case WCD937X_RX_BIAS_EAR_DAC:
+	case WCD937X_RX_BIAS_EAR_AMP:
+	case WCD937X_RX_BIAS_HPH_LDO:
+	case WCD937X_RX_BIAS_HPH_PA:
+	case WCD937X_RX_BIAS_HPH_RDACBUFF_CNP2:
+	case WCD937X_RX_BIAS_HPH_RDAC_LDO:
+	case WCD937X_RX_BIAS_HPH_CNP1:
+	case WCD937X_RX_BIAS_HPH_LOWPOWER:
+	case WCD937X_RX_BIAS_AUX_DAC:
+	case WCD937X_RX_BIAS_AUX_AMP:
+	case WCD937X_RX_BIAS_VNEGDAC_BLEEDER:
+	case WCD937X_RX_BIAS_MISC:
+	case WCD937X_RX_BIAS_BUCK_RST:
+	case WCD937X_RX_BIAS_BUCK_VREF_ERRAMP:
+	case WCD937X_RX_BIAS_FLYB_ERRAMP:
+	case WCD937X_RX_BIAS_FLYB_BUFF:
+	case WCD937X_RX_BIAS_FLYB_MID_RST:
+	case WCD937X_HPH_CNP_EN:
+	case WCD937X_HPH_CNP_WG_CTL:
+	case WCD937X_HPH_CNP_WG_TIME:
+	case WCD937X_HPH_OCP_CTL:
+	case WCD937X_HPH_AUTO_CHOP:
+	case WCD937X_HPH_CHOP_CTL:
+	case WCD937X_HPH_PA_CTL1:
+	case WCD937X_HPH_PA_CTL2:
+	case WCD937X_HPH_L_EN:
+	case WCD937X_HPH_L_TEST:
+	case WCD937X_HPH_L_ATEST:
+	case WCD937X_HPH_R_EN:
+	case WCD937X_HPH_R_TEST:
+	case WCD937X_HPH_R_ATEST:
+	case WCD937X_HPH_RDAC_CLK_CTL1:
+	case WCD937X_HPH_RDAC_CLK_CTL2:
+	case WCD937X_HPH_RDAC_LDO_CTL:
+	case WCD937X_HPH_RDAC_CHOP_CLK_LP_CTL:
+	case WCD937X_HPH_REFBUFF_UHQA_CTL:
+	case WCD937X_HPH_REFBUFF_LP_CTL:
+	case WCD937X_HPH_L_DAC_CTL:
+	case WCD937X_HPH_R_DAC_CTL:
+	case WCD937X_HPH_SURGE_HPHLR_SURGE_COMP_SEL:
+	case WCD937X_HPH_SURGE_HPHLR_SURGE_EN:
+	case WCD937X_HPH_SURGE_HPHLR_SURGE_MISC1:
+	case WCD937X_EAR_EAR_EN_REG:
+	case WCD937X_EAR_EAR_PA_CON:
+	case WCD937X_EAR_EAR_SP_CON:
+	case WCD937X_EAR_EAR_DAC_CON:
+	case WCD937X_EAR_EAR_CNP_FSM_CON:
+	case WCD937X_EAR_TEST_CTL:
+	case WCD937X_HPH_NEW_ANA_HPH2:
+	case WCD937X_HPH_NEW_ANA_HPH3:
+	case WCD937X_SLEEP_CTL:
+	case WCD937X_SLEEP_WATCHDOG_CTL:
+	case WCD937X_MBHC_NEW_ELECT_REM_CLAMP_CTL:
+	case WCD937X_MBHC_NEW_CTL_1:
+	case WCD937X_MBHC_NEW_CTL_2:
+	case WCD937X_MBHC_NEW_PLUG_DETECT_CTL:
+	case WCD937X_MBHC_NEW_ZDET_ANA_CTL:
+	case WCD937X_MBHC_NEW_ZDET_RAMP_CTL:
+	case WCD937X_TX_NEW_TX_CH2_SEL:
+	case WCD937X_AUX_AUXPA:
+	case WCD937X_LDORXTX_MODE:
+	case WCD937X_LDORXTX_CONFIG:
+	case WCD937X_DIE_CRACK_DIE_CRK_DET_EN:
+	case WCD937X_HPH_NEW_INT_RDAC_GAIN_CTL:
+	case WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L:
+	case WCD937X_HPH_NEW_INT_RDAC_VREF_CTL:
+	case WCD937X_HPH_NEW_INT_RDAC_OVERRIDE_CTL:
+	case WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R:
+	case WCD937X_HPH_NEW_INT_PA_MISC1:
+	case WCD937X_HPH_NEW_INT_PA_MISC2:
+	case WCD937X_HPH_NEW_INT_PA_RDAC_MISC:
+	case WCD937X_HPH_NEW_INT_HPH_TIMER1:
+	case WCD937X_HPH_NEW_INT_HPH_TIMER2:
+	case WCD937X_HPH_NEW_INT_HPH_TIMER3:
+	case WCD937X_HPH_NEW_INT_HPH_TIMER4:
+	case WCD937X_HPH_NEW_INT_PA_RDAC_MISC2:
+	case WCD937X_HPH_NEW_INT_PA_RDAC_MISC3:
+	case WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI:
+	case WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_ULP:
+	case WCD937X_RX_NEW_INT_HPH_RDAC_LDO_LP:
+	case WCD937X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL:
+	case WCD937X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL:
+	case WCD937X_MBHC_NEW_INT_MECH_DET_CURRENT:
+	case WCD937X_MBHC_NEW_INT_SPARE_2:
+	case WCD937X_EAR_INT_NEW_EAR_CHOPPER_CON:
+	case WCD937X_EAR_INT_NEW_CNP_VCM_CON1:
+	case WCD937X_EAR_INT_NEW_CNP_VCM_CON2:
+	case WCD937X_EAR_INT_NEW_EAR_DYNAMIC_BIAS:
+	case WCD937X_AUX_INT_EN_REG:
+	case WCD937X_AUX_INT_PA_CTRL:
+	case WCD937X_AUX_INT_SP_CTRL:
+	case WCD937X_AUX_INT_DAC_CTRL:
+	case WCD937X_AUX_INT_CLK_CTRL:
+	case WCD937X_AUX_INT_TEST_CTRL:
+	case WCD937X_AUX_INT_MISC:
+	case WCD937X_LDORXTX_INT_BIAS:
+	case WCD937X_LDORXTX_INT_STB_LOADS_DTEST:
+	case WCD937X_LDORXTX_INT_TEST0:
+	case WCD937X_LDORXTX_INT_STARTUP_TIMER:
+	case WCD937X_LDORXTX_INT_TEST1:
+	case WCD937X_SLEEP_INT_WATCHDOG_CTL_1:
+	case WCD937X_SLEEP_INT_WATCHDOG_CTL_2:
+	case WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT1:
+	case WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT2:
+	case WCD937X_DIGITAL_CDC_RST_CTL:
+	case WCD937X_DIGITAL_TOP_CLK_CFG:
+	case WCD937X_DIGITAL_CDC_ANA_CLK_CTL:
+	case WCD937X_DIGITAL_CDC_DIG_CLK_CTL:
+	case WCD937X_DIGITAL_SWR_RST_EN:
+	case WCD937X_DIGITAL_CDC_PATH_MODE:
+	case WCD937X_DIGITAL_CDC_RX_RST:
+	case WCD937X_DIGITAL_CDC_RX0_CTL:
+	case WCD937X_DIGITAL_CDC_RX1_CTL:
+	case WCD937X_DIGITAL_CDC_RX2_CTL:
+	case WCD937X_DIGITAL_DEM_BYPASS_DATA0:
+	case WCD937X_DIGITAL_DEM_BYPASS_DATA1:
+	case WCD937X_DIGITAL_DEM_BYPASS_DATA2:
+	case WCD937X_DIGITAL_DEM_BYPASS_DATA3:
+	case WCD937X_DIGITAL_CDC_COMP_CTL_0:
+	case WCD937X_DIGITAL_CDC_RX_DELAY_CTL:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A1_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A1_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A2_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A2_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A3_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A3_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A4_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A4_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A5_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A5_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A6_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_A7_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_C_0:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_C_1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_C_2:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_C_3:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R1:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R2:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R3:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R4:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R5:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R6:
+	case WCD937X_DIGITAL_CDC_HPH_DSM_R7:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A1_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A1_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A2_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A2_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A3_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A3_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A4_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A4_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A5_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A5_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A6_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_A7_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_C_0:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_C_1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_C_2:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_C_3:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R1:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R2:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R3:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R4:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R5:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R6:
+	case WCD937X_DIGITAL_CDC_AUX_DSM_R7:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_RX_0:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_RX_1:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_0:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_1:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_2:
+	case WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_0:
+	case WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_1:
+	case WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_2:
+	case WCD937X_DIGITAL_CDC_HPH_GAIN_CTL:
+	case WCD937X_DIGITAL_CDC_AUX_GAIN_CTL:
+	case WCD937X_DIGITAL_CDC_EAR_PATH_CTL:
+	case WCD937X_DIGITAL_CDC_SWR_CLH:
+	case WCD937X_DIGITAL_SWR_CLH_BYP:
+	case WCD937X_DIGITAL_CDC_TX0_CTL:
+	case WCD937X_DIGITAL_CDC_TX1_CTL:
+	case WCD937X_DIGITAL_CDC_TX2_CTL:
+	case WCD937X_DIGITAL_CDC_TX_RST:
+	case WCD937X_DIGITAL_CDC_REQ_CTL:
+	case WCD937X_DIGITAL_CDC_AMIC_CTL:
+	case WCD937X_DIGITAL_CDC_DMIC_CTL:
+	case WCD937X_DIGITAL_CDC_DMIC1_CTL:
+	case WCD937X_DIGITAL_CDC_DMIC2_CTL:
+	case WCD937X_DIGITAL_CDC_DMIC3_CTL:
+	case WCD937X_DIGITAL_EFUSE_CTL:
+	case WCD937X_DIGITAL_EFUSE_PRG_CTL:
+	case WCD937X_DIGITAL_EFUSE_TEST_CTL_0:
+	case WCD937X_DIGITAL_EFUSE_TEST_CTL_1:
+	case WCD937X_DIGITAL_PDM_WD_CTL0:
+	case WCD937X_DIGITAL_PDM_WD_CTL1:
+	case WCD937X_DIGITAL_PDM_WD_CTL2:
+	case WCD937X_DIGITAL_INTR_MODE:
+	case WCD937X_DIGITAL_INTR_MASK_0:
+	case WCD937X_DIGITAL_INTR_MASK_1:
+	case WCD937X_DIGITAL_INTR_MASK_2:
+	case WCD937X_DIGITAL_INTR_CLEAR_0:
+	case WCD937X_DIGITAL_INTR_CLEAR_1:
+	case WCD937X_DIGITAL_INTR_CLEAR_2:
+	case WCD937X_DIGITAL_INTR_LEVEL_0:
+	case WCD937X_DIGITAL_INTR_LEVEL_1:
+	case WCD937X_DIGITAL_INTR_LEVEL_2:
+	case WCD937X_DIGITAL_INTR_SET_0:
+	case WCD937X_DIGITAL_INTR_SET_1:
+	case WCD937X_DIGITAL_INTR_SET_2:
+	case WCD937X_DIGITAL_INTR_TEST_0:
+	case WCD937X_DIGITAL_INTR_TEST_1:
+	case WCD937X_DIGITAL_INTR_TEST_2:
+	case WCD937X_DIGITAL_CDC_CONN_RX0_CTL:
+	case WCD937X_DIGITAL_CDC_CONN_RX1_CTL:
+	case WCD937X_DIGITAL_CDC_CONN_RX2_CTL:
+	case WCD937X_DIGITAL_CDC_CONN_TX_CTL:
+	case WCD937X_DIGITAL_LOOP_BACK_MODE:
+	case WCD937X_DIGITAL_SWR_DAC_TEST:
+	case WCD937X_DIGITAL_SWR_HM_TEST_RX_0:
+	case WCD937X_DIGITAL_SWR_HM_TEST_TX_0:
+	case WCD937X_DIGITAL_SWR_HM_TEST_RX_1:
+	case WCD937X_DIGITAL_SWR_HM_TEST_TX_1:
+	case WCD937X_DIGITAL_SWR_HM_TEST:
+	case WCD937X_DIGITAL_PAD_CTL_PDM_RX0:
+	case WCD937X_DIGITAL_PAD_CTL_PDM_RX1:
+	case WCD937X_DIGITAL_PAD_CTL_PDM_TX0:
+	case WCD937X_DIGITAL_PAD_CTL_PDM_TX1:
+	case WCD937X_DIGITAL_PAD_INP_DIS_0:
+	case WCD937X_DIGITAL_PAD_INP_DIS_1:
+	case WCD937X_DIGITAL_DRIVE_STRENGTH_0:
+	case WCD937X_DIGITAL_DRIVE_STRENGTH_1:
+	case WCD937X_DIGITAL_DRIVE_STRENGTH_2:
+	case WCD937X_DIGITAL_RX_DATA_EDGE_CTL:
+	case WCD937X_DIGITAL_TX_DATA_EDGE_CTL:
+	case WCD937X_DIGITAL_GPIO_MODE:
+	case WCD937X_DIGITAL_PIN_CTL_OE:
+	case WCD937X_DIGITAL_PIN_CTL_DATA_0:
+	case WCD937X_DIGITAL_PIN_CTL_DATA_1:
+	case WCD937X_DIGITAL_PIN_STATUS_0:
+	case WCD937X_DIGITAL_PIN_STATUS_1:
+	case WCD937X_DIGITAL_DIG_DEBUG_CTL:
+	case WCD937X_DIGITAL_DIG_DEBUG_EN:
+	case WCD937X_DIGITAL_ANA_CSR_DBG_ADD:
+	case WCD937X_DIGITAL_ANA_CSR_DBG_CTL:
+	case WCD937X_DIGITAL_SSP_DBG:
+	case WCD937X_DIGITAL_MODE_STATUS_0:
+	case WCD937X_DIGITAL_MODE_STATUS_1:
+	case WCD937X_DIGITAL_SPARE_0:
+	case WCD937X_DIGITAL_SPARE_1:
+	case WCD937X_DIGITAL_SPARE_2:
+		return true;
+	}
+
+	return false;
+}
+
+static bool wcd937x_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD937X_ANA_MBHC_RESULT_1:
+	case WCD937X_ANA_MBHC_RESULT_2:
+	case WCD937X_ANA_MBHC_RESULT_3:
+	case WCD937X_MBHC_MOISTURE_DET_FSM_STATUS:
+	case WCD937X_TX_1_2_SAR2_ERR:
+	case WCD937X_TX_1_2_SAR1_ERR:
+	case WCD937X_TX_3_SPARE_MONO:
+	case WCD937X_TX_3_SAR1_ERR:
+	case WCD937X_HPH_L_STATUS:
+	case WCD937X_HPH_R_STATUS:
+	case WCD937X_HPH_SURGE_HPHLR_SURGE_STATUS:
+	case WCD937X_EAR_STATUS_REG_1:
+	case WCD937X_EAR_STATUS_REG_2:
+	case WCD937X_MBHC_NEW_FSM_STATUS:
+	case WCD937X_MBHC_NEW_ADC_RESULT:
+	case WCD937X_DIE_CRACK_DIE_CRK_DET_OUT:
+	case WCD937X_AUX_INT_STATUS_REG:
+	case WCD937X_LDORXTX_INT_STATUS:
+	case WCD937X_DIGITAL_CHIP_ID0:
+	case WCD937X_DIGITAL_CHIP_ID1:
+	case WCD937X_DIGITAL_CHIP_ID2:
+	case WCD937X_DIGITAL_CHIP_ID3:
+	case WCD937X_DIGITAL_EFUSE_T_DATA_0:
+	case WCD937X_DIGITAL_EFUSE_T_DATA_1:
+	case WCD937X_DIGITAL_INTR_STATUS_0:
+	case WCD937X_DIGITAL_INTR_STATUS_1:
+	case WCD937X_DIGITAL_INTR_STATUS_2:
+	case WCD937X_DIGITAL_EFUSE_REG_0:
+	case WCD937X_DIGITAL_EFUSE_REG_1:
+	case WCD937X_DIGITAL_EFUSE_REG_2:
+	case WCD937X_DIGITAL_EFUSE_REG_3:
+	case WCD937X_DIGITAL_EFUSE_REG_4:
+	case WCD937X_DIGITAL_EFUSE_REG_5:
+	case WCD937X_DIGITAL_EFUSE_REG_6:
+	case WCD937X_DIGITAL_EFUSE_REG_7:
+	case WCD937X_DIGITAL_EFUSE_REG_8:
+	case WCD937X_DIGITAL_EFUSE_REG_9:
+	case WCD937X_DIGITAL_EFUSE_REG_10:
+	case WCD937X_DIGITAL_EFUSE_REG_11:
+	case WCD937X_DIGITAL_EFUSE_REG_12:
+	case WCD937X_DIGITAL_EFUSE_REG_13:
+	case WCD937X_DIGITAL_EFUSE_REG_14:
+	case WCD937X_DIGITAL_EFUSE_REG_15:
+	case WCD937X_DIGITAL_EFUSE_REG_16:
+	case WCD937X_DIGITAL_EFUSE_REG_17:
+	case WCD937X_DIGITAL_EFUSE_REG_18:
+	case WCD937X_DIGITAL_EFUSE_REG_19:
+	case WCD937X_DIGITAL_EFUSE_REG_20:
+	case WCD937X_DIGITAL_EFUSE_REG_21:
+	case WCD937X_DIGITAL_EFUSE_REG_22:
+	case WCD937X_DIGITAL_EFUSE_REG_23:
+	case WCD937X_DIGITAL_EFUSE_REG_24:
+	case WCD937X_DIGITAL_EFUSE_REG_25:
+	case WCD937X_DIGITAL_EFUSE_REG_26:
+	case WCD937X_DIGITAL_EFUSE_REG_27:
+	case WCD937X_DIGITAL_EFUSE_REG_28:
+	case WCD937X_DIGITAL_EFUSE_REG_29:
+	case WCD937X_DIGITAL_EFUSE_REG_30:
+	case WCD937X_DIGITAL_EFUSE_REG_31:
+		return true;
+	}
+
+	return wcd937x_rdwr_register(dev, reg);
+}
+
+static bool wcd937x_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD937X_ANA_MBHC_RESULT_1:
+	case WCD937X_ANA_MBHC_RESULT_2:
+	case WCD937X_ANA_MBHC_RESULT_3:
+	case WCD937X_MBHC_MOISTURE_DET_FSM_STATUS:
+	case WCD937X_TX_1_2_SAR1_ERR:
+	case WCD937X_TX_1_2_SAR2_ERR:
+	case WCD937X_TX_3_SAR1_ERR:
+	case WCD937X_HPH_L_STATUS:
+	case WCD937X_HPH_R_STATUS:
+	case WCD937X_HPH_SURGE_HPHLR_SURGE_STATUS:
+	case WCD937X_EAR_STATUS_REG_1:
+	case WCD937X_EAR_STATUS_REG_2:
+	case WCD937X_MBHC_NEW_FSM_STATUS:
+	case WCD937X_MBHC_NEW_ADC_RESULT:
+	case WCD937X_DIE_CRACK_DIE_CRK_DET_OUT:
+	case WCD937X_DIGITAL_INTR_STATUS_0:
+	case WCD937X_DIGITAL_INTR_STATUS_1:
+	case WCD937X_DIGITAL_INTR_STATUS_2:
+	case WCD937X_DIGITAL_SWR_HM_TEST:
+	case WCD937X_DIGITAL_PIN_STATUS_0:
+	case WCD937X_DIGITAL_PIN_STATUS_1:
+	case WCD937X_DIGITAL_MODE_STATUS_0:
+	case WCD937X_DIGITAL_MODE_STATUS_1:
+		return true;
+	}
+	return false;
+}
+
+static const struct regmap_config wcd937x_regmap_config = {
+	.name = "wcd937x_csr",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = wcd937x_defaults,
+	.num_reg_defaults = ARRAY_SIZE(wcd937x_defaults),
+	.max_register = WCD937X_MAX_REGISTER,
+	.readable_reg = wcd937x_readable_register,
+	.writeable_reg = wcd937x_rdwr_register,
+	.volatile_reg = wcd937x_volatile_register,
+};
+
+static const struct sdw_slave_ops wcd9370_slave_ops = {
+	.update_status = wcd9370_update_status,
+	.interrupt_callback = wcd9370_interrupt_callback,
+};
+
+static int wcd937x_sdw_component_bind(struct device *dev,
+				      struct device *master, void *data)
+{
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void wcd937x_sdw_component_unbind(struct device *dev,
+					 struct device *master, void *data)
+{
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+}
+
+static const struct component_ops wcd937x_sdw_component_ops = {
+	.bind = wcd937x_sdw_component_bind,
+	.unbind = wcd937x_sdw_component_unbind,
+};
+
+static int wcd9370_probe(struct sdw_slave *pdev,
+			 const struct sdw_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd937x_sdw_priv *wcd;
+	int ret;
+
+	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
+	if (!wcd)
+		return -ENOMEM;
+
+	/* Port map index starts at 0, however the data port for this codec start at index 1 */
+	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
+		wcd->is_tx = true;
+		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
+						 &pdev->m_port_map[1],
+						 WCD937X_MAX_TX_SWR_PORTS);
+	} else {
+		ret = of_property_read_u32_array(dev->of_node, "qcom,rx-port-mapping",
+						 &pdev->m_port_map[1],
+						 WCD937X_MAX_SWR_PORTS);
+	}
+	if (ret < 0)
+		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
+			 wcd->is_tx ? "TX" : "RX", ret);
+
+	wcd->sdev = pdev;
+	dev_set_drvdata(dev, wcd);
+
+	pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
+				   SDW_SCP_INT1_BUS_CLASH |
+				   SDW_SCP_INT1_PARITY;
+	pdev->prop.lane_control_support = true;
+	pdev->prop.simple_clk_stop_capable = true;
+	if (wcd->is_tx) {
+		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
+		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
+		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
+		pdev->prop.wake_capable = true;
+
+		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd937x_regmap_config);
+		if (IS_ERR(wcd->regmap))
+			return dev_err_probe(dev, PTR_ERR(wcd->regmap),
+					     "Regmap init failed\n");
+
+		/* Start in cache-only until device is enumerated */
+		regcache_cache_only(wcd->regmap, true);
+	} else {
+		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS, 0);
+		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
+		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
+	}
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return component_add(dev, &wcd937x_sdw_component_ops);
+}
+
+static int wcd9370_remove(struct sdw_slave *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_del(dev, &wcd937x_sdw_component_ops);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	return 0;
+}
+
+static const struct sdw_device_id wcd9370_slave_id[] = {
+	SDW_SLAVE_ENTRY(0x0217, 0x10a, 0), /* WCD9370 RX/TX Device ID */
+	{ },
+};
+MODULE_DEVICE_TABLE(sdw, wcd9370_slave_id);
+
+static int __maybe_unused wcd937x_sdw_runtime_suspend(struct device *dev)
+{
+	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
+
+	if (wcd->regmap) {
+		regcache_cache_only(wcd->regmap, true);
+		regcache_mark_dirty(wcd->regmap);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused wcd937x_sdw_runtime_resume(struct device *dev)
+{
+	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
+
+	if (wcd->regmap) {
+		regcache_cache_only(wcd->regmap, false);
+		regcache_sync(wcd->regmap);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops wcd937x_sdw_pm_ops = {
+	SET_RUNTIME_PM_OPS(wcd937x_sdw_runtime_suspend, wcd937x_sdw_runtime_resume, NULL)
+};
+
+static struct sdw_driver wcd9370_codec_driver = {
+	.probe = wcd9370_probe,
+	.remove = wcd9370_remove,
+	.ops = &wcd9370_slave_ops,
+	.id_table = wcd9370_slave_id,
+	.driver = {
+		.name = "wcd9370-codec",
+		.pm = &wcd937x_sdw_pm_ops,
+	}
+};
+module_sdw_driver(wcd9370_codec_driver);
+
+MODULE_DESCRIPTION("WCD937X SDW codec driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
new file mode 100644
index 000000000000..e6e1ad5926d5
--- /dev/null
+++ b/sound/soc/codecs/wcd937x.h
@@ -0,0 +1,653 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _WCD937X_REGISTERS_H
+#define _WCD937X_REGISTERS_H
+
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+
+#define WCD937X_BASE_ADDRESS			0x3000
+#define WCD937X_ANA_BIAS			0x3001
+#define WCD937X_ANA_RX_SUPPLIES			0x3008
+#define WCD937X_ANA_HPH				0x3009
+#define WCD937X_ANA_EAR				0x300A
+#define WCD937X_ANA_EAR_COMPANDER_CTL		0x300B
+#define WCD937X_EAR_GAIN_MASK			GENMASK(6, 2)
+#define WCD937X_ANA_TX_CH1			0x300E
+#define WCD937X_ANA_TX_CH2			0x300F
+#define WCD937X_ANA_TX_CH3			0x3010
+#define WCD937X_ANA_TX_CH3_HPF			0x3011
+#define WCD937X_ANA_MICB1_MICB2_DSP_EN_LOGIC	0x3012
+#define WCD937X_ANA_MICB3_DSP_EN_LOGIC		0x3013
+#define WCD937X_ANA_MBHC_MECH			0x3014
+#define WCD937X_MBHC_L_DET_EN_MASK		BIT(7)
+#define WCD937X_MBHC_L_DET_EN			BIT(7)
+#define WCD937X_MBHC_GND_DET_EN_MASK		BIT(6)
+#define WCD937X_MBHC_MECH_DETECT_TYPE_MASK	BIT(5)
+#define WCD937X_MBHC_MECH_DETECT_TYPE_INS	1
+#define WCD937X_MBHC_HPHL_PLUG_TYPE_MASK	BIT(4)
+#define WCD937X_MBHC_HPHL_PLUG_TYPE_NO		1
+#define WCD937X_MBHC_GND_PLUG_TYPE_MASK		BIT(3)
+#define WCD937X_MBHC_GND_PLUG_TYPE_NO		1
+#define WCD937X_MBHC_HSL_PULLUP_COMP_EN		BIT(2)
+#define WCD937X_MBHC_HSG_PULLUP_COMP_EN		BIT(1)
+#define WCD937X_MBHC_HPHL_100K_TO_GND_EN	BIT(0)
+#define WCD937X_ANA_MBHC_ELECT			0x3015
+#define WCD937X_ANA_MBHC_BD_ISRC_CTL_MASK	GENMASK(6, 4)
+#define WCD937X_ANA_MBHC_BD_ISRC_100UA		GENMASK(5, 4)
+#define WCD937X_ANA_MBHC_BD_ISRC_OFF		0
+#define WCD937X_ANA_MBHC_BIAS_EN_MASK		BIT(0)
+#define WCD937X_ANA_MBHC_BIAS_EN		BIT(0)
+#define WCD937X_ANA_MBHC_ZDET			0x3016
+#define WCD937X_ANA_MBHC_RESULT_1		0x3017
+#define WCD937X_ANA_MBHC_RESULT_2		0x3018
+#define WCD937X_ANA_MBHC_RESULT_3		0x3019
+#define WCD937X_MBHC_BTN_RESULT_MASK		GENMASK(2, 0)
+#define WCD937X_ANA_MBHC_BTN0			0x301A
+#define WCD937X_MBHC_BTN_VTH_MASK		GENMASK(7, 2)
+#define WCD937X_ANA_MBHC_BTN1			0x301B
+#define WCD937X_ANA_MBHC_BTN2			0x301C
+#define WCD937X_ANA_MBHC_BTN3			0x301D
+#define WCD937X_ANA_MBHC_BTN4			0x301E
+#define WCD937X_ANA_MBHC_BTN5			0x301F
+#define WCD937X_VTH_MASK			GENMASK(7, 2)
+#define WCD937X_ANA_MBHC_BTN6			0x3020
+#define WCD937X_ANA_MBHC_BTN7			0x3021
+#define WCD937X_ANA_MICB1			0x3022
+#define WCD937X_MICB_VOUT_MASK			GENMASK(5, 0)
+#define WCD937X_MICB_EN_MASK			GENMASK(7, 6)
+#define WCD937X_MICB_DISABLE			0
+#define WCD937X_MICB_ENABLE			1
+#define WCD937X_MICB_PULL_UP			2
+#define WCD937X_MICB_PULL_DOWN			3
+#define WCD937X_ANA_MICB2			0x3023
+#define WCD937X_ANA_MICB2_ENABLE		BIT(6)
+#define WCD937X_ANA_MICB2_ENABLE_MASK		GENMASK(7, 6)
+#define WCD937X_ANA_MICB2_VOUT_MASK		GENMASK(5, 0)
+#define WCD937X_ANA_MICB2_RAMP			0x3024
+#define WCD937X_RAMP_EN_MASK			BIT(7)
+#define WCD937X_RAMP_SHIFT_CTRL_MASK		GENMASK(4, 2)
+#define WCD937X_ANA_MICB3			0x3025
+#define WCD937X_ANA_MICB_EN			GENMASK(7, 6)
+#define WCD937X_MICB_DISABLE			0
+#define WCD937X_MICB_ENABLE			1
+#define WCD937X_MICB_PULL_UP			2
+#define WCD937X_ANA_MICB_VOUT			GENMASK(5, 0)
+#define WCD937X_BIAS_CTL			0x3028
+#define WCD937X_BIAS_VBG_FINE_ADJ		0x3029
+#define WCD937X_LDOL_VDDCX_ADJUST		0x3040
+#define WCD937X_LDOL_DISABLE_LDOL		0x3041
+#define WCD937X_MBHC_CTL_CLK			0x3056
+#define WCD937X_MBHC_CTL_ANA			0x3057
+#define WCD937X_MBHC_CTL_SPARE_1		0x3058
+#define WCD937X_MBHC_CTL_SPARE_2		0x3059
+#define WCD937X_MBHC_CTL_BCS			0x305A
+#define WCD937X_MBHC_MOISTURE_DET_FSM_STATUS	0x305B
+#define WCD937X_MBHC_TEST_CTL			0x305C
+#define WCD937X_LDOH_MODE			0x3067
+#define WCD937X_LDOH_BIAS			0x3068
+#define WCD937X_LDOH_STB_LOADS			0x3069
+#define WCD937X_LDOH_SLOWRAMP			0x306A
+#define WCD937X_MICB1_TEST_CTL_1		0x306B
+#define WCD937X_MICB1_TEST_CTL_2		0x306C
+#define WCD937X_MICB1_TEST_CTL_3		0x306D
+#define WCD937X_MICB2_TEST_CTL_1		0x306E
+#define WCD937X_MICB2_TEST_CTL_2		0x306F
+#define WCD937X_MICB2_TEST_CTL_3		0x3070
+#define WCD937X_MICB3_TEST_CTL_1		0x3071
+#define WCD937X_MICB3_TEST_CTL_2		0x3072
+#define WCD937X_MICB3_TEST_CTL_3		0x3073
+#define WCD937X_TX_COM_ADC_VCM			0x3077
+#define WCD937X_TX_COM_BIAS_ATEST		0x3078
+#define WCD937X_TX_COM_ADC_INT1_IB		0x3079
+#define WCD937X_TX_COM_ADC_INT2_IB		0x307A
+#define WCD937X_TX_COM_TXFE_DIV_CTL		0x307B
+#define WCD937X_TX_COM_TXFE_DIV_START		0x307C
+#define WCD937X_TX_COM_TXFE_DIV_STOP_9P6M	0x307D
+#define WCD937X_TX_COM_TXFE_DIV_STOP_12P288M	0x307E
+#define WCD937X_TX_1_2_TEST_EN			0x307F
+#define WCD937X_TX_1_2_ADC_IB			0x3080
+#define WCD937X_TX_1_2_ATEST_REFCTL		0x3081
+#define WCD937X_TX_1_2_TEST_CTL			0x3082
+#define WCD937X_TX_1_2_TEST_BLK_EN		0x3083
+#define WCD937X_TX_1_2_TXFE_CLKDIV		0x3084
+#define WCD937X_TX_1_2_SAR2_ERR			0x3085
+#define WCD937X_TX_1_2_SAR1_ERR			0x3086
+#define WCD937X_TX_3_TEST_EN			0x3087
+#define WCD937X_TX_3_ADC_IB			0x3088
+#define WCD937X_TX_3_ATEST_REFCTL		0x3089
+#define WCD937X_TX_3_TEST_CTL			0x308A
+#define WCD937X_TX_3_TEST_BLK_EN		0x308B
+#define WCD937X_TX_3_TXFE_CLKDIV		0x308C
+#define WCD937X_TX_3_SPARE_MONO			0x308D
+#define WCD937X_TX_3_SAR1_ERR			0x308E
+#define WCD937X_CLASSH_MODE_1			0x3097
+#define WCD937X_CLASSH_MODE_2			0x3098
+#define WCD937X_CLASSH_MODE_3			0x3099
+#define WCD937X_CLASSH_CTRL_VCL_1		0x309A
+#define WCD937X_CLASSH_CTRL_VCL_2		0x309B
+#define WCD937X_CLASSH_CTRL_CCL_1		0x309C
+#define WCD937X_CLASSH_CTRL_CCL_2		0x309D
+#define WCD937X_CLASSH_CTRL_CCL_3		0x309E
+#define WCD937X_CLASSH_CTRL_CCL_4		0x309F
+#define WCD937X_CLASSH_CTRL_CCL_5		0x30A0
+#define WCD937X_CLASSH_BUCK_TMUX_A_D		0x30A1
+#define WCD937X_CLASSH_BUCK_SW_DRV_CNTL		0x30A2
+#define WCD937X_CLASSH_SPARE			0x30A3
+#define WCD937X_FLYBACK_EN			0x30A4
+#define WCD937X_FLYBACK_VNEG_CTRL_1		0x30A5
+#define WCD937X_FLYBACK_VNEG_CTRL_2		0x30A6
+#define WCD937X_FLYBACK_VNEG_CTRL_3		0x30A7
+#define WCD937X_FLYBACK_VNEG_CTRL_4		0x30A8
+#define WCD937X_FLYBACK_VNEG_CTRL_5		0x30A9
+#define WCD937X_FLYBACK_VNEG_CTRL_6		0x30AA
+#define WCD937X_FLYBACK_VNEG_CTRL_7		0x30AB
+#define WCD937X_FLYBACK_VNEG_CTRL_8		0x30AC
+#define WCD937X_FLYBACK_VNEG_CTRL_9		0x30AD
+#define WCD937X_FLYBACK_VNEGDAC_CTRL_1		0x30AE
+#define WCD937X_FLYBACK_VNEGDAC_CTRL_2		0x30AF
+#define WCD937X_FLYBACK_VNEGDAC_CTRL_3		0x30B0
+#define WCD937X_FLYBACK_CTRL_1			0x30B1
+#define WCD937X_FLYBACK_TEST_CTL		0x30B2
+#define WCD937X_RX_AUX_SW_CTL			0x30B3
+#define WCD937X_RX_PA_AUX_IN_CONN		0x30B4
+#define WCD937X_RX_TIMER_DIV			0x30B5
+#define WCD937X_RX_OCP_CTL			0x30B6
+#define WCD937X_RX_OCP_COUNT			0x30B7
+#define WCD937X_RX_BIAS_EAR_DAC			0x30B8
+#define WCD937X_RX_BIAS_EAR_AMP			0x30B9
+#define WCD937X_RX_BIAS_HPH_LDO			0x30BA
+#define WCD937X_RX_BIAS_HPH_PA			0x30BB
+#define WCD937X_RX_BIAS_HPH_RDACBUFF_CNP2	0x30BC
+#define WCD937X_RX_BIAS_HPH_RDAC_LDO		0x30BD
+#define WCD937X_RX_BIAS_HPH_CNP1		0x30BE
+#define WCD937X_RX_BIAS_HPH_LOWPOWER		0x30BF
+#define WCD937X_RX_BIAS_AUX_DAC			0x30C0
+#define WCD937X_RX_BIAS_AUX_AMP			0x30C1
+#define WCD937X_RX_BIAS_VNEGDAC_BLEEDER		0x30C2
+#define WCD937X_RX_BIAS_MISC			0x30C3
+#define WCD937X_RX_BIAS_BUCK_RST		0x30C4
+#define WCD937X_RX_BIAS_BUCK_VREF_ERRAMP	0x30C5
+#define WCD937X_RX_BIAS_FLYB_ERRAMP		0x30C6
+#define WCD937X_RX_BIAS_FLYB_BUFF		0x30C7
+#define WCD937X_RX_BIAS_FLYB_MID_RST		0x30C8
+#define WCD937X_HPH_L_STATUS			0x30C9
+#define WCD937X_HPH_R_STATUS			0x30CA
+#define WCD937X_HPH_CNP_EN			0x30CB
+#define WCD937X_HPH_CNP_WG_CTL			0x30CC
+#define WCD937X_HPH_CNP_WG_TIME			0x30CD
+#define WCD937X_HPH_OCP_CTL			0x30CE
+#define WCD937X_HPH_AUTO_CHOP			0x30CF
+#define WCD937X_HPH_CHOP_CTL			0x30D0
+#define WCD937X_HPH_PA_CTL1			0x30D1
+#define WCD937X_HPH_PA_CTL2			0x30D2
+#define WCD937X_HPHPA_GND_R_MASK		BIT(6)
+#define WCD937X_HPHPA_GND_L_MASK		BIT(4)
+#define WCD937X_HPH_L_EN			0x30D3
+#define WCD937X_HPH_L_TEST			0x30D4
+#define WCD937X_HPH_L_ATEST			0x30D5
+#define WCD937X_HPH_R_EN			0x30D6
+#define WCD937X_GAIN_SRC_SEL_MASK		BIT(5)
+#define WCD937X_GAIN_SRC_SEL_REGISTER		1
+#define WCD937X_HPH_R_TEST			0x30D7
+#define WCD937X_HPH_R_ATEST			0x30D8
+#define WCD937X_HPH_RDAC_CLK_CTL1		0x30D9
+#define WCD937X_HPHPA_GND_OVR_MASK		BIT(1)
+#define WCD937X_CHOP_CLK_EN_MASK		BIT(7)
+#define WCD937X_HPH_RDAC_CLK_CTL2		0x30DA
+#define WCD937X_HPH_RDAC_LDO_CTL		0x30DB
+#define WCD937X_HPH_RDAC_CHOP_CLK_LP_CTL	0x30DC
+#define WCD937X_HPH_REFBUFF_UHQA_CTL		0x30DD
+#define WCD937X_HPH_REFBUFF_LP_CTL		0x30DE
+#define WCD937X_PREREF_FLIT_BYPASS_MASK		BIT(0)
+#define WCD937X_HPH_L_DAC_CTL			0x30DF
+#define WCD937X_HPH_R_DAC_CTL			0x30E0
+#define WCD937X_HPH_SURGE_HPHLR_SURGE_COMP_SEL	0x30E1
+#define WCD937X_HPH_SURGE_HPHLR_SURGE_EN	0x30E2
+#define WCD937X_HPH_SURGE_HPHLR_SURGE_MISC1	0x30E3
+#define WCD937X_HPH_SURGE_HPHLR_SURGE_STATUS	0x30E4
+#define WCD937X_EAR_EAR_EN_REG			0x30E9
+#define WCD937X_EAR_EAR_PA_CON			0x30EA
+#define WCD937X_EAR_EAR_SP_CON			0x30EB
+#define WCD937X_EAR_EAR_DAC_CON			0x30EC
+#define WCD937X_EAR_EAR_CNP_FSM_CON		0x30ED
+#define WCD937X_EAR_TEST_CTL			0x30EE
+#define WCD937X_EAR_STATUS_REG_1		0x30EF
+#define WCD937X_EAR_STATUS_REG_2		0x30F0
+#define WCD937X_ANA_NEW_PAGE_REGISTER		0x3100
+#define WCD937X_HPH_NEW_ANA_HPH2		0x3101
+#define WCD937X_HPH_NEW_ANA_HPH3		0x3102
+#define WCD937X_SLEEP_CTL			0x3103
+#define WCD937X_SLEEP_WATCHDOG_CTL		0x3104
+#define WCD937X_MBHC_NEW_ELECT_REM_CLAMP_CTL	0x311F
+#define WCD937X_MBHC_NEW_CTL_1			0x3120
+#define WCD937X_MBHC_CTL_RCO_EN_MASK		BIT(7)
+#define WCD937X_MBHC_CTL_RCO_EN			BIT(7)
+#define WCD937X_MBHC_BTN_DBNC_MASK		GENMASK(1, 0)
+#define WCD937X_MBHC_BTN_DBNC_T_16_MS		0x2
+#define WCD937X_MBHC_NEW_CTL_2			0x3121
+#define WCD937X_MBHC_NEW_PLUG_DETECT_CTL	0x3122
+#define WCD937X_MBHC_NEW_ZDET_ANA_CTL		0x3123
+#define WCD937X_M_RTH_CTL_MASK			GENMASK(3, 2)
+#define WCD937X_MBHC_HS_VREF_CTL_MASK		GENMASK(1, 0)
+#define WCD937X_MBHC_HS_VREF_1P5_V		0x1
+#define WCD937X_MBHC_DBNC_TIMER_INSREM_DBNC_T_96_MS	0x6
+#define WCD937X_ZDET_RANGE_CTL_MASK		GENMASK(3, 0)
+#define WCD937X_ZDET_MAXV_CTL_MASK		GENMASK(6, 4)
+#define WCD937X_MBHC_NEW_ZDET_RAMP_CTL		0x3124
+#define WCD937X_MBHC_NEW_FSM_STATUS		0x3125
+#define WCD937X_MBHC_NEW_ADC_RESULT		0x3126
+#define WCD937X_TX_NEW_TX_CH2_SEL		0x3127
+#define WCD937X_AUX_AUXPA			0x3128
+#define WCD937X_AUXPA_CLK_EN_MASK		BIT(4)
+#define WCD937X_AUXPA_CLK_EN_MASK		BIT(4)
+#define WCD937X_LDORXTX_MODE			0x3129
+#define WCD937X_LDORXTX_CONFIG			0x312A
+#define WCD937X_DIE_CRACK_DIE_CRK_DET_EN	0x312C
+#define WCD937X_DIE_CRACK_DIE_CRK_DET_OUT	0x312D
+#define WCD937X_HPH_NEW_INT_RDAC_GAIN_CTL	0x3132
+#define WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_L	0x3133
+#define WCD937X_HPH_NEW_INT_RDAC_VREF_CTL	0x3134
+#define WCD937X_HPH_NEW_INT_RDAC_OVERRIDE_CTL	0x3135
+#define WCD937X_HPH_NEW_INT_RDAC_HD2_CTL_R	0x3136
+#define WCD937X_HPH_NEW_INT_PA_MISC1		0x3137
+#define WCD937X_HPH_NEW_INT_PA_MISC2		0x3138
+#define WCD937X_HPH_NEW_INT_PA_RDAC_MISC	0x3139
+#define WCD937X_HPH_NEW_INT_HPH_TIMER1		0x313A
+#define WCD937X_HPH_NEW_INT_HPH_TIMER2		0x313B
+#define WCD937X_HPH_NEW_INT_HPH_TIMER3		0x313C
+#define WCD937X_HPH_NEW_INT_HPH_TIMER4		0x313D
+#define WCD937X_HPH_NEW_INT_PA_RDAC_MISC2	0x313E
+#define WCD937X_HPH_NEW_INT_PA_RDAC_MISC3	0x313F
+#define WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI	0x3145
+#define WCD937X_RX_NEW_INT_HPH_RDAC_BIAS_ULP	0x3146
+#define WCD937X_RX_NEW_INT_HPH_RDAC_LDO_LP	0x3147
+#define WCD937X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL			0x31AF
+#define WCD937X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL			0x31B0
+#define WCD937X_MOISTURE_EN_POLLING_MASK	BIT(2)
+#define WCD937X_HSDET_PULLUP_C_MASK		GENMASK(4, 0)
+#define WCD937X_MBHC_NEW_INT_MECH_DET_CURRENT	0x31B1
+#define WCD937X_MBHC_NEW_INT_SPARE_2		0x31B2
+#define WCD937X_EAR_INT_NEW_EAR_CHOPPER_CON	0x31B7
+#define WCD937X_EAR_INT_NEW_CNP_VCM_CON1	0x31B8
+#define WCD937X_EAR_INT_NEW_CNP_VCM_CON2	0x31B9
+#define WCD937X_EAR_INT_NEW_EAR_DYNAMIC_BIAS	0x31BA
+#define WCD937X_AUX_INT_EN_REG			0x31BD
+#define WCD937X_AUX_INT_PA_CTRL			0x31BE
+#define WCD937X_AUX_INT_SP_CTRL			0x31BF
+#define WCD937X_AUX_INT_DAC_CTRL		0x31C0
+#define WCD937X_AUX_INT_CLK_CTRL		0x31C1
+#define WCD937X_AUX_INT_TEST_CTRL		0x31C2
+#define WCD937X_AUX_INT_STATUS_REG		0x31C3
+#define WCD937X_AUX_INT_MISC			0x31C4
+#define WCD937X_LDORXTX_INT_BIAS		0x31C5
+#define WCD937X_LDORXTX_INT_STB_LOADS_DTEST	0x31C6
+#define WCD937X_LDORXTX_INT_TEST0		0x31C7
+#define WCD937X_LDORXTX_INT_STARTUP_TIMER	0x31C8
+#define WCD937X_LDORXTX_INT_TEST1		0x31C9
+#define WCD937X_LDORXTX_INT_STATUS		0x31CA
+#define WCD937X_SLEEP_INT_WATCHDOG_CTL_1	0x31D0
+#define WCD937X_SLEEP_INT_WATCHDOG_CTL_2	0x31D1
+#define WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT1	0x31D3
+#define WCD937X_DIE_CRACK_INT_DIE_CRK_DET_INT2	0x31D4
+#define WCD937X_DIGITAL_PAGE_REGISTER		0x3400
+#define WCD937X_DIGITAL_CHIP_ID0		0x3401
+#define WCD937X_DIGITAL_CHIP_ID1		0x3402
+#define WCD937X_DIGITAL_CHIP_ID2		0x3403
+#define WCD937X_DIGITAL_CHIP_ID3		0x3404
+#define WCD937X_DIGITAL_CDC_RST_CTL		0x3406
+#define WCD937X_DIGITAL_TOP_CLK_CFG		0x3407
+#define WCD937X_DIGITAL_CDC_ANA_CLK_CTL		0x3408
+#define WCD937X_DIGITAL_CDC_DIG_CLK_CTL		0x3409
+#define WCD937X_DIGITAL_SWR_RST_EN		0x340A
+#define WCD937X_DIGITAL_CDC_PATH_MODE		0x340B
+#define WCD937X_DIGITAL_CDC_RX_RST		0x340C
+#define WCD937X_DIGITAL_CDC_RX0_CTL		0x340D
+#define WCD937X_DIGITAL_CDC_RX1_CTL		0x340E
+#define WCD937X_DIGITAL_CDC_RX2_CTL		0x340F
+#define WCD937X_DIGITAL_DEM_BYPASS_DATA0	0x3410
+#define WCD937X_DIGITAL_DEM_BYPASS_DATA1	0x3411
+#define WCD937X_DIGITAL_DEM_BYPASS_DATA2	0x3412
+#define WCD937X_DIGITAL_DEM_BYPASS_DATA3	0x3413
+#define WCD937X_DIGITAL_CDC_COMP_CTL_0		0x3414
+#define WCD937X_DIGITAL_CDC_RX_DELAY_CTL	0x3417
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A1_0	0x3418
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A1_1	0x3419
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A2_0	0x341A
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A2_1	0x341B
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A3_0	0x341C
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A3_1	0x341D
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A4_0	0x341E
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A4_1	0x341F
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A5_0	0x3420
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A5_1	0x3421
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A6_0	0x3422
+#define WCD937X_DIGITAL_CDC_HPH_DSM_A7_0	0x3423
+#define WCD937X_DIGITAL_CDC_HPH_DSM_C_0		0x3424
+#define WCD937X_DIGITAL_CDC_HPH_DSM_C_1		0x3425
+#define WCD937X_DIGITAL_CDC_HPH_DSM_C_2		0x3426
+#define WCD937X_DIGITAL_CDC_HPH_DSM_C_3		0x3427
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R1		0x3428
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R2		0x3429
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R3		0x342A
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R4		0x342B
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R5		0x342C
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R6		0x342D
+#define WCD937X_DIGITAL_CDC_HPH_DSM_R7		0x342E
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A1_0	0x342F
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A1_1	0x3430
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A2_0	0x3431
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A2_1	0x3432
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A3_0	0x3433
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A3_1	0x3434
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A4_0	0x3435
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A4_1	0x3436
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A5_0	0x3437
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A5_1	0x3438
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A6_0	0x3439
+#define WCD937X_DIGITAL_CDC_AUX_DSM_A7_0	0x343A
+#define WCD937X_DIGITAL_CDC_AUX_DSM_C_0		0x343B
+#define WCD937X_DIGITAL_CDC_AUX_DSM_C_1		0x343C
+#define WCD937X_DIGITAL_CDC_AUX_DSM_C_2		0x343D
+#define WCD937X_DIGITAL_CDC_AUX_DSM_C_3		0x343E
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R1		0x343F
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R2		0x3440
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R3		0x3441
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R4		0x3442
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R5		0x3443
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R6		0x3444
+#define WCD937X_DIGITAL_CDC_AUX_DSM_R7		0x3445
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_RX_0	0x3446
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_RX_1	0x3447
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_0	0x3448
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_1	0x3449
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_DSD_2	0x344A
+#define WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_0	0x344B
+#define WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_1	0x344C
+#define WCD937X_DIGITAL_CDC_AUX_GAIN_DSD_2	0x344D
+#define WCD937X_DIGITAL_CDC_HPH_GAIN_CTL	0x344E
+#define WCD937X_DIGITAL_CDC_AUX_GAIN_CTL	0x344F
+#define WCD937X_DIGITAL_CDC_EAR_PATH_CTL	0x3450
+#define WCD937X_DIGITAL_CDC_SWR_CLH		0x3451
+#define WCD937X_DIGITAL_SWR_CLH_BYP		0x3452
+#define WCD937X_DIGITAL_CDC_TX0_CTL		0x3453
+#define WCD937X_DIGITAL_CDC_TX1_CTL		0x3454
+#define WCD937X_DIGITAL_CDC_TX2_CTL		0x3455
+#define WCD937X_DIGITAL_CDC_TX_RST		0x3456
+#define WCD937X_DIGITAL_CDC_REQ_CTL		0x3457
+#define WCD937X_DIGITAL_CDC_AMIC_CTL		0x345A
+#define WCD937X_DIGITAL_CDC_DMIC_CTL		0x345B
+#define WCD937X_DIGITAL_CDC_DMIC1_CTL		0x345C
+#define WCD937X_DIGITAL_CDC_DMIC2_CTL		0x345D
+#define WCD937X_DIGITAL_CDC_DMIC3_CTL		0x345E
+#define WCD937X_DIGITAL_EFUSE_CTL		0x345F
+#define WCD937X_DIGITAL_EFUSE_PRG_CTL		0x3460
+#define WCD937X_DIGITAL_EFUSE_TEST_CTL_0	0x3461
+#define WCD937X_DIGITAL_EFUSE_TEST_CTL_1	0x3462
+#define WCD937X_DIGITAL_EFUSE_T_DATA_0		0x3463
+#define WCD937X_DIGITAL_EFUSE_T_DATA_1		0x3464
+#define WCD937X_DIGITAL_PDM_WD_CTL0		0x3465
+#define WCD937X_DIGITAL_PDM_WD_CTL1		0x3466
+#define WCD937X_DIGITAL_PDM_WD_CTL2		0x3467
+#define WCD937X_DIGITAL_INTR_MODE		0x346A
+#define WCD937X_DIGITAL_INTR_MASK_0		0x346B
+#define WCD937X_DIGITAL_INTR_MASK_1		0x346C
+#define WCD937X_DIGITAL_INTR_MASK_2		0x346D
+#define WCD937X_DIGITAL_INTR_STATUS_0		0x346E
+#define WCD937X_DIGITAL_INTR_STATUS_1		0x346F
+#define WCD937X_DIGITAL_INTR_STATUS_2		0x3470
+#define WCD937X_DIGITAL_INTR_CLEAR_0		0x3471
+#define WCD937X_DIGITAL_INTR_CLEAR_1		0x3472
+#define WCD937X_DIGITAL_INTR_CLEAR_2		0x3473
+#define WCD937X_DIGITAL_INTR_LEVEL_0		0x3474
+#define WCD937X_DIGITAL_INTR_LEVEL_1		0x3475
+#define WCD937X_DIGITAL_INTR_LEVEL_2		0x3476
+#define WCD937X_DIGITAL_INTR_SET_0		0x3477
+#define WCD937X_DIGITAL_INTR_SET_1		0x3478
+#define WCD937X_DIGITAL_INTR_SET_2		0x3479
+#define WCD937X_DIGITAL_INTR_TEST_0		0x347A
+#define WCD937X_DIGITAL_INTR_TEST_1		0x347B
+#define WCD937X_DIGITAL_INTR_TEST_2		0x347C
+#define WCD937X_DIGITAL_CDC_CONN_RX0_CTL	0x347F
+#define WCD937X_DIGITAL_CDC_CONN_RX1_CTL	0x3480
+#define WCD937X_DIGITAL_CDC_CONN_RX2_CTL	0x3481
+#define WCD937X_DIGITAL_CDC_CONN_TX_CTL		0x3482
+#define WCD937X_DIGITAL_LOOP_BACK_MODE		0x3483
+#define WCD937X_DIGITAL_SWR_DAC_TEST		0x3484
+#define WCD937X_DIGITAL_SWR_HM_TEST_RX_0	0x3485
+#define WCD937X_DIGITAL_SWR_HM_TEST_TX_0	0x3491
+#define WCD937X_DIGITAL_SWR_HM_TEST_RX_1	0x3492
+#define WCD937X_DIGITAL_SWR_HM_TEST_TX_1	0x3493
+#define WCD937X_DIGITAL_SWR_HM_TEST		0x3494
+#define WCD937X_DIGITAL_PAD_CTL_PDM_RX0		0x3495
+#define WCD937X_DIGITAL_PAD_CTL_PDM_RX1		0x3496
+#define WCD937X_DIGITAL_PAD_CTL_PDM_TX0		0x3497
+#define WCD937X_DIGITAL_PAD_CTL_PDM_TX1		0x3498
+#define WCD937X_DIGITAL_PAD_INP_DIS_0		0x3499
+#define WCD937X_DIGITAL_PAD_INP_DIS_1		0x349A
+#define WCD937X_DIGITAL_DRIVE_STRENGTH_0	0x349B
+#define WCD937X_DIGITAL_DRIVE_STRENGTH_1	0x349C
+#define WCD937X_DIGITAL_DRIVE_STRENGTH_2	0x349D
+#define WCD937X_DIGITAL_RX_DATA_EDGE_CTL	0x349E
+#define WCD937X_DIGITAL_TX_DATA_EDGE_CTL	0x349F
+#define WCD937X_DIGITAL_GPIO_MODE		0x34A0
+#define WCD937X_DIGITAL_PIN_CTL_OE		0x34A1
+#define WCD937X_DIGITAL_PIN_CTL_DATA_0		0x34A2
+#define WCD937X_DIGITAL_PIN_CTL_DATA_1		0x34A3
+#define WCD937X_DIGITAL_PIN_STATUS_0		0x34A4
+#define WCD937X_DIGITAL_PIN_STATUS_1		0x34A5
+#define WCD937X_DIGITAL_DIG_DEBUG_CTL		0x34A6
+#define WCD937X_DIGITAL_DIG_DEBUG_EN		0x34A7
+#define WCD937X_DIGITAL_ANA_CSR_DBG_ADD		0x34A8
+#define WCD937X_DIGITAL_ANA_CSR_DBG_CTL		0x34A9
+#define WCD937X_DIGITAL_SSP_DBG			0x34AA
+#define WCD937X_DIGITAL_MODE_STATUS_0		0x34AB
+#define WCD937X_DIGITAL_MODE_STATUS_1		0x34AC
+#define WCD937X_DIGITAL_SPARE_0			0x34AD
+#define WCD937X_DIGITAL_SPARE_1			0x34AE
+#define WCD937X_DIGITAL_SPARE_2			0x34AF
+#define WCD937X_DIGITAL_EFUSE_REG_0		0x34B0
+#define WCD937X_DIGITAL_EFUSE_REG_1		0x34B1
+#define WCD937X_DIGITAL_EFUSE_REG_2		0x34B2
+#define WCD937X_DIGITAL_EFUSE_REG_3		0x34B3
+#define WCD937X_DIGITAL_EFUSE_REG_4		0x34B4
+#define WCD937X_DIGITAL_EFUSE_REG_5		0x34B5
+#define WCD937X_DIGITAL_EFUSE_REG_6		0x34B6
+#define WCD937X_DIGITAL_EFUSE_REG_7		0x34B7
+#define WCD937X_DIGITAL_EFUSE_REG_8		0x34B8
+#define WCD937X_DIGITAL_EFUSE_REG_9		0x34B9
+#define WCD937X_DIGITAL_EFUSE_REG_10		0x34BA
+#define WCD937X_DIGITAL_EFUSE_REG_11		0x34BB
+#define WCD937X_DIGITAL_EFUSE_REG_12		0x34BC
+#define WCD937X_DIGITAL_EFUSE_REG_13		0x34BD
+#define WCD937X_DIGITAL_EFUSE_REG_14		0x34BE
+#define WCD937X_DIGITAL_EFUSE_REG_15		0x34BF
+#define WCD937X_DIGITAL_EFUSE_REG_16		0x34C0
+#define WCD937X_DIGITAL_EFUSE_REG_17		0x34C1
+#define WCD937X_DIGITAL_EFUSE_REG_18		0x34C2
+#define WCD937X_DIGITAL_EFUSE_REG_19		0x34C3
+#define WCD937X_DIGITAL_EFUSE_REG_20		0x34C4
+#define WCD937X_DIGITAL_EFUSE_REG_21		0x34C5
+#define WCD937X_DIGITAL_EFUSE_REG_22		0x34C6
+#define WCD937X_DIGITAL_EFUSE_REG_23		0x34C7
+#define WCD937X_DIGITAL_EFUSE_REG_24		0x34C8
+#define WCD937X_DIGITAL_EFUSE_REG_25		0x34C9
+#define WCD937X_DIGITAL_EFUSE_REG_26		0x34CA
+#define WCD937X_DIGITAL_EFUSE_REG_27		0x34CB
+#define WCD937X_DIGITAL_EFUSE_REG_28		0x34CC
+#define WCD937X_DIGITAL_EFUSE_REG_29		0x34CD
+#define WCD937X_DIGITAL_EFUSE_REG_30		0x34CE
+#define WCD937X_DIGITAL_EFUSE_REG_31		0x34CF
+#define WCD937X_MAX_REGISTER			(WCD937X_DIGITAL_EFUSE_REG_31)
+
+#define WCD937X_MAX_MICBIAS			3
+#define WCD937X_MAX_BULK_SUPPLY			3
+#define WCD937X_MAX_TX_SWR_PORTS		4
+#define WCD937X_MAX_SWR_PORTS			5
+#define WCD937X_MAX_SWR_CH_IDS			15
+
+/* Convert from vout ctl to micbias voltage in mV */
+#define WCD_VOUT_CTL_TO_MICB(v)	(1000 + (v) * 50)
+#define MAX_PORT 8
+#define MAX_CH_PER_PORT 8
+#define MAX_TX_PWR_CH 2
+#define SWR_NUM_PORTS 4
+
+#define WCD937X_MAX_SLAVE_PORT_TYPES 10
+
+struct codec_port_info {
+	u32 slave_port_type;
+	u32 master_port_type;
+	u32 ch_mask;
+	u32 num_ch;
+	u32 ch_rate;
+};
+
+struct wcd937x_sdw_ch_info {
+	int port_num;
+	unsigned int ch_mask;
+};
+
+#define WCD_SDW_CH(id, pn, cmask)	\
+	[id] = {			\
+		.port_num = pn,		\
+		.ch_mask = cmask,	\
+	}
+
+struct wcd937x_priv;
+struct wcd937x_sdw_priv {
+	struct sdw_slave *sdev;
+	struct sdw_stream_config sconfig;
+	struct sdw_stream_runtime *sruntime;
+	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
+	struct wcd937x_sdw_ch_info *ch_info;
+	bool port_enable[WCD937X_MAX_SWR_CH_IDS];
+	int active_ports;
+	int num_ports;
+	bool is_tx;
+	struct wcd937x_priv *wcd937x;
+	struct irq_domain *slave_irq;
+	struct regmap *regmap;
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_WCD937X_SDW)
+int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+		     struct snd_pcm_substream *substream,
+		     struct snd_soc_dai *dai);
+int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+			       struct snd_soc_dai *dai,
+			       void *stream, int direction);
+int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *dai);
+
+struct device *wcd937x_sdw_device_get(struct device_node *np);
+
+#else
+int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+		     struct snd_pcm_substream *substream,
+		     struct snd_soc_dai *dai)
+{
+	return -EOPNOTSUPP;
+}
+
+int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+			       struct snd_soc_dai *dai,
+			       void *stream, int direction)
+{
+	return -EOPNOTSUPP;
+}
+
+int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *dai)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+enum {
+	WCD_RX1,
+	WCD_RX2,
+	WCD_RX3
+};
+
+enum {
+	/* INTR_CTRL_INT_MASK_0 */
+	WCD937X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
+	WCD937X_IRQ_MBHC_BUTTON_RELEASE_DET,
+	WCD937X_IRQ_MBHC_ELECT_INS_REM_DET,
+	WCD937X_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
+	WCD937X_IRQ_MBHC_SW_DET,
+	WCD937X_IRQ_HPHR_OCP_INT,
+	WCD937X_IRQ_HPHR_CNP_INT,
+	WCD937X_IRQ_HPHL_OCP_INT,
+
+	/* INTR_CTRL_INT_MASK_1 */
+	WCD937X_IRQ_HPHL_CNP_INT,
+	WCD937X_IRQ_EAR_CNP_INT,
+	WCD937X_IRQ_EAR_SCD_INT,
+	WCD937X_IRQ_AUX_CNP_INT,
+	WCD937X_IRQ_AUX_SCD_INT,
+	WCD937X_IRQ_HPHL_PDM_WD_INT,
+	WCD937X_IRQ_HPHR_PDM_WD_INT,
+	WCD937X_IRQ_AUX_PDM_WD_INT,
+
+	/* INTR_CTRL_INT_MASK_2 */
+	WCD937X_IRQ_LDORT_SCD_INT,
+	WCD937X_IRQ_MBHC_MOISTURE_INT,
+	WCD937X_IRQ_HPHL_SURGE_DET_INT,
+	WCD937X_IRQ_HPHR_SURGE_DET_INT,
+	WCD937X_NUM_IRQS,
+};
+
+enum wcd937x_tx_sdw_ports {
+	WCD937X_ADC_1_PORT = 1,
+	WCD937X_ADC_2_3_PORT,
+	WCD937X_DMIC_0_3_MBHC_PORT,
+	WCD937X_DMIC_4_6_PORT,
+};
+
+enum wcd937x_tx_sdw_channels {
+	WCD937X_ADC1,
+	WCD937X_ADC2,
+	WCD937X_ADC3,
+	WCD937X_DMIC0,
+	WCD937X_DMIC1,
+	WCD937X_MBHC,
+	WCD937X_DMIC2,
+	WCD937X_DMIC3,
+	WCD937X_DMIC4,
+	WCD937X_DMIC5,
+	WCD937X_DMIC6,
+};
+
+enum wcd937x_rx_sdw_ports {
+	WCD937X_HPH_PORT = 1,
+	WCD937X_CLSH_PORT,
+	WCD937X_COMP_PORT,
+	WCD937X_LO_PORT,
+	WCD937X_DSD_PORT,
+};
+
+enum wcd937x_rx_sdw_channels {
+	WCD937X_HPH_L,
+	WCD937X_HPH_R,
+	WCD937X_CLSH,
+	WCD937X_COMP_L,
+	WCD937X_COMP_R,
+	WCD937X_LO,
+	WCD937X_DSD_R,
+	WCD937X_DSD_L,
+};
+
+enum {
+	WCD937X_SDW_DIR_RX,
+	WCD937X_SDW_DIR_TX,
+};
+
+#endif
-- 
2.25.1

