Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71316403D13
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9671016D0;
	Wed,  8 Sep 2021 17:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9671016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116662;
	bh=1qkSKTokszjIElW20+PJ0aJdbn9qh9JmtbP+Qu7TQQk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvGyifwq7AL7Sa5cpKcsj5dM9o3lPfO0NtfJyOGmRk9LYo5g3HTgG1fw2f+iHAF18
	 PBCZsvJZIe7JicU6Ij1nBMInxUt1twoEVN2XAJo9ENWg59XgSN15doFCBtTEpCt5fH
	 TMj46XLf6TiPJITVIIUf69TsUGzm9u49+oFNOeaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F87AF804F1;
	Wed,  8 Sep 2021 17:55:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306DEF804E6; Wed,  8 Sep 2021 17:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61ADF8026C
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61ADF8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="v1jIBtQE"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188FpEW5005684;
 Wed, 8 Sep 2021 17:55:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=GCSSvY8XrvSItV3HUoBzc89zbZmgPgQTdQFSowWleSU=;
 b=v1jIBtQEtftF/ryoalfrxM6av1mz+AIVgC2mfMc3ec9Sf+5dqORJkeRkxY0O2N/F2YPz
 CESLcS0xbz4Wr4HfRYrk//wWvjljYF7HiD5ez/pqcZg/9HDc06OzGrk5eQE1Zvm0ZQRc
 kWBy7oqTc11t1ZG6MqKhBpX3rYcDser6gJgIkiDlKtWCI0Kach/6qQikXbsxXhWYbtjA
 ngSdug8IVF7gurdHKJSbi/H+fsFsnxChBNtPhgAlOFDrDeEu2lGylOWBUvU2XhBsMT6h
 7t5LRdV2zq6xvIExtxV8JuCqwF729ksi+hPVa0/sxnbmVpCd2AWlNkFa2mr3C+hFR5e9 IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axtha2b80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6001310002A;
 Wed,  8 Sep 2021 17:55:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44C15229A9E;
 Wed,  8 Sep 2021 17:55:03 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:55:02
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/7] iio: adc: stm32-adc: add support of internal channels
Date: Wed, 8 Sep 2021 17:54:50 +0200
Message-ID: <20210908155452.25458-6-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Add support of ADC2 internal channels VDDCORE, VREFINT and VBAT.
The reserved label name "vddcore", "vrefint" and "vbat" must
be used in Device Tree channel node, to enable the corresponding
internal channel.

Note: This patch does not provide support of internal channels
for F4 and H7.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc-core.h |   8 ++
 drivers/iio/adc/stm32-adc.c      | 123 ++++++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
index 2322809bfd2f..7c924f463f67 100644
--- a/drivers/iio/adc/stm32-adc-core.h
+++ b/drivers/iio/adc/stm32-adc-core.h
@@ -102,6 +102,9 @@
 #define STM32H7_ADC_CALFACT		0xC4
 #define STM32H7_ADC_CALFACT2		0xC8
 
+/* STM32MP1 - ADC2 instance option register */
+#define STM32MP1_ADC2_OR		0xD0
+
 /* STM32H7 - common registers for all ADC instances */
 #define STM32H7_ADC_CSR			(STM32_ADCX_COMN_OFFSET + 0x00)
 #define STM32H7_ADC_CCR			(STM32_ADCX_COMN_OFFSET + 0x08)
@@ -168,11 +171,16 @@ enum stm32h7_adc_dmngt {
 #define STM32H7_EOC_MST			BIT(2)
 
 /* STM32H7_ADC_CCR - bit fields */
+#define STM32H7_VBATEN			BIT(24)
+#define STM32H7_VREFEN			BIT(22)
 #define STM32H7_PRESC_SHIFT		18
 #define STM32H7_PRESC_MASK		GENMASK(21, 18)
 #define STM32H7_CKMODE_SHIFT		16
 #define STM32H7_CKMODE_MASK		GENMASK(17, 16)
 
+/* STM32MP1_ADC2_OR - bit fields */
+#define STM32MP1_VDDCOREEN		BIT(0)
+
 /**
  * struct stm32_adc_common - stm32 ADC driver common data (for all instances)
  * @base:		control registers base cpu addr
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index ae4a314854f7..ef3d2af98025 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -41,6 +41,7 @@
 #define STM32_ADC_TIMEOUT_US		100000
 #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
 #define STM32_ADC_HW_STOP_DELAY_MS	100
+#define STM32_ADC_CHAN_NONE		-1
 
 #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
 
@@ -77,6 +78,29 @@ enum stm32_adc_extsel {
 	STM32_EXT20,
 };
 
+enum stm32_adc_int_ch {
+	STM32_ADC_INT_CH_VDDCORE,
+	STM32_ADC_INT_CH_VREFINT,
+	STM32_ADC_INT_CH_VBAT,
+	STM32_ADC_INT_CH_NB,
+};
+
+/**
+ * struct stm32_adc_ic - ADC internal channels
+ * @name:	name of the internal channel
+ * @idx:	internal channel enum index
+ */
+struct stm32_adc_ic {
+	const char *name;
+	u32 idx;
+};
+
+static const struct stm32_adc_ic stm32_adc_ic[STM32_ADC_INT_CH_NB] = {
+	{ "vddcore", STM32_ADC_INT_CH_VDDCORE },
+	{ "vrefint", STM32_ADC_INT_CH_VREFINT },
+	{ "vbat", STM32_ADC_INT_CH_VBAT },
+};
+
 /**
  * struct stm32_adc_trig_info - ADC trigger info
  * @name:		name of the trigger, corresponding to its source
@@ -126,6 +150,9 @@ struct stm32_adc_regs {
  * @res:		resolution selection register & bitfield
  * @smpr:		smpr1 & smpr2 registers offset array
  * @smp_bits:		smpr1 & smpr2 index and bitfields
+ * @or_vdd:		option register & vddcore bitfield
+ * @ccr_vbat:		common register & vbat bitfield
+ * @ccr_vref:		common register & vrefint bitfield
  */
 struct stm32_adc_regspec {
 	const u32 dr;
@@ -139,6 +166,9 @@ struct stm32_adc_regspec {
 	const struct stm32_adc_regs res;
 	const u32 smpr[2];
 	const struct stm32_adc_regs *smp_bits;
+	const struct stm32_adc_regs or_vdd;
+	const struct stm32_adc_regs ccr_vbat;
+	const struct stm32_adc_regs ccr_vref;
 };
 
 struct stm32_adc;
@@ -195,6 +225,7 @@ struct stm32_adc_cfg {
  * @cal:		optional calibration data on some devices
  * @chan_name:		channel name array
  * @num_diff:		number of differential channels
+ * @int_ch:		internal channel indexes array
  */
 struct stm32_adc {
 	struct stm32_adc_common	*common;
@@ -219,6 +250,7 @@ struct stm32_adc {
 	struct stm32_adc_calib	cal;
 	char			chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
 	u32			num_diff;
+	int			int_ch[STM32_ADC_INT_CH_NB];
 };
 
 struct stm32_adc_diff_channel {
@@ -451,6 +483,24 @@ static const struct stm32_adc_regspec stm32h7_adc_regspec = {
 	.smp_bits = stm32h7_smp_bits,
 };
 
+static const struct stm32_adc_regspec stm32mp1_adc_regspec = {
+	.dr = STM32H7_ADC_DR,
+	.ier_eoc = { STM32H7_ADC_IER, STM32H7_EOCIE },
+	.ier_ovr = { STM32H7_ADC_IER, STM32H7_OVRIE },
+	.isr_eoc = { STM32H7_ADC_ISR, STM32H7_EOC },
+	.isr_ovr = { STM32H7_ADC_ISR, STM32H7_OVR },
+	.sqr = stm32h7_sq,
+	.exten = { STM32H7_ADC_CFGR, STM32H7_EXTEN_MASK, STM32H7_EXTEN_SHIFT },
+	.extsel = { STM32H7_ADC_CFGR, STM32H7_EXTSEL_MASK,
+		    STM32H7_EXTSEL_SHIFT },
+	.res = { STM32H7_ADC_CFGR, STM32H7_RES_MASK, STM32H7_RES_SHIFT },
+	.smpr = { STM32H7_ADC_SMPR1, STM32H7_ADC_SMPR2 },
+	.smp_bits = stm32h7_smp_bits,
+	.or_vdd = { STM32MP1_ADC2_OR, STM32MP1_VDDCOREEN },
+	.ccr_vbat = { STM32H7_ADC_CCR, STM32H7_VBATEN },
+	.ccr_vref = { STM32H7_ADC_CCR, STM32H7_VREFEN },
+};
+
 /*
  * STM32 ADC registers access routines
  * @adc: stm32 adc instance
@@ -579,6 +629,61 @@ static int stm32_adc_hw_start(struct device *dev)
 	return ret;
 }
 
+static void stm32_adc_int_ch_enable(struct iio_dev *indio_dev)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	u32 i, val, bits = 0, offset = 0;
+
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+		if (adc->int_ch[i] == STM32_ADC_CHAN_NONE)
+			continue;
+
+		switch (i) {
+		case STM32_ADC_INT_CH_VDDCORE:
+			dev_dbg(&indio_dev->dev, "Enable VDDCore\n");
+			stm32_adc_set_bits(adc, adc->cfg->regs->or_vdd.reg,
+					   adc->cfg->regs->or_vdd.mask);
+			break;
+		case STM32_ADC_INT_CH_VREFINT:
+			dev_dbg(&indio_dev->dev, "Enable VREFInt\n");
+			offset = adc->cfg->regs->ccr_vref.reg;
+			bits |= adc->cfg->regs->ccr_vref.mask;
+			break;
+		case STM32_ADC_INT_CH_VBAT:
+			dev_dbg(&indio_dev->dev, "Enable VBAT\n");
+			offset = adc->cfg->regs->ccr_vbat.reg;
+			bits |= adc->cfg->regs->ccr_vbat.mask;
+			break;
+		}
+	}
+
+	if (bits) {
+		val = readl_relaxed(adc->common->base + offset);
+		val |= bits;
+		writel_relaxed(val, adc->common->base + offset);
+	}
+}
+
+static void stm32_adc_int_ch_disable(struct stm32_adc *adc)
+{
+	u32 val, bits, offset, i;
+
+	stm32_adc_clr_bits(adc, adc->cfg->regs->or_vdd.reg,
+			   adc->cfg->regs->or_vdd.mask);
+
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+		if (adc->int_ch[i] != STM32_ADC_CHAN_NONE) {
+			offset = adc->cfg->regs->ccr_vref.reg;
+			bits = adc->cfg->regs->ccr_vref.mask |
+				adc->cfg->regs->ccr_vbat.mask;
+			val = readl_relaxed(adc->common->base + offset);
+			val &= ~bits;
+			writel_relaxed(bits, adc->common->base + offset);
+			break;
+		}
+	}
+}
+
 /**
  * stm32f4_adc_start_conv() - Start conversions for regular channels.
  * @indio_dev: IIO device instance
@@ -947,11 +1052,13 @@ static int stm32h7_adc_prepare(struct iio_dev *indio_dev)
 		goto pwr_dwn;
 	calib = ret;
 
+	stm32_adc_int_ch_enable(indio_dev);
+
 	stm32_adc_writel(adc, STM32H7_ADC_DIFSEL, adc->difsel);
 
 	ret = stm32h7_adc_enable(indio_dev);
 	if (ret)
-		goto pwr_dwn;
+		goto ch_disable;
 
 	/* Either restore or read calibration result for future reference */
 	if (calib)
@@ -967,6 +1074,8 @@ static int stm32h7_adc_prepare(struct iio_dev *indio_dev)
 
 disable:
 	stm32h7_adc_disable(indio_dev);
+ch_disable:
+	stm32_adc_int_ch_disable(adc);
 pwr_dwn:
 	stm32h7_adc_enter_pwr_down(adc);
 
@@ -978,6 +1087,7 @@ static void stm32h7_adc_unprepare(struct iio_dev *indio_dev)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 
 	stm32h7_adc_disable(indio_dev);
+	stm32_adc_int_ch_disable(adc);
 	stm32h7_adc_enter_pwr_down(adc);
 }
 
@@ -1805,10 +1915,13 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	struct device_node *child;
 	const char *name;
-	int val, scan_index = 0, ret;
+	int val, scan_index = 0, ret, i;
 	bool differential;
 	u32 vin[2];
 
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++)
+		adc->int_ch[i] = STM32_ADC_CHAN_NONE;
+
 	for_each_available_child_of_node(node, child) {
 		ret = of_property_read_u32(child, "reg", &val);
 		if (ret) {
@@ -1825,6 +1938,10 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 				return -EINVAL;
 			}
 			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
+			for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+				if (!strncmp(stm32_adc_ic[i].name, name, STM32_ADC_CH_SZ))
+					adc->int_ch[i] = val;
+			}
 		} else if (ret != -EINVAL) {
 			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
 			goto err;
@@ -2223,7 +2340,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 };
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
-	.regs = &stm32h7_adc_regspec,
+	.regs = &stm32mp1_adc_regspec,
 	.adc_info = &stm32h7_adc_info,
 	.trigs = stm32h7_adc_trigs,
 	.has_vregready = true,
-- 
2.17.1

