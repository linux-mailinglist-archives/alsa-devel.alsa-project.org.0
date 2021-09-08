Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C32403D28
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C04916A9;
	Wed,  8 Sep 2021 17:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C04916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116741;
	bh=JnGn0qcBZLtnckdR+g35tPjJd63uRvQTBPfKj+MeXtE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/Yb7HT4yGv3ZorYDjZ+THEekHOJGyOpz28wcTx+vkNMIIPWrmfgQ4a6NcRgPS9rb
	 ulBmxhWlkb9s3L6+ABO1VfR+LsNSWmje9SUmKElvrK/BaIslC6CTyv5hEaEkPLfSBo
	 WPKucwmTRYBByZLAo1fpEulse2NaJVNJPC5iEpvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B473EF80518;
	Wed,  8 Sep 2021 17:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17288F80518; Wed,  8 Sep 2021 17:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1B98F80518
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1B98F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="wF/aRBZu"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188FpD5a007620;
 Wed, 8 Sep 2021 17:55:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=VvHoepqjh9lgy+RlZqlNBMzDEwzNhV8nbDRE6/jdGUs=;
 b=wF/aRBZuNKRNfEeIHceMBnp0PrCCs+NjScRJlEVrPYJs9+ERF2Pmd3BT787tdkjJ3NfN
 wtN8i/iwUbQTrMx0vV/AdIYQbmG/3b4/LbZyzTgXH8G0iXA149ff7DgsYH4w6vfMZRjP
 Z4GFmdNN6fv2WjlaW1dLKmijBkbhzc5LeEDW+tQzb0gDpTN5zHdnv1mbzPEWiApYZtIM
 KInl2Uizv+w9+egygmjgpSR6kAIr/n35py7Jm9kwvna5y3CKJXEwbjMZU6mmf4acQHxB
 Qo4QVCveBYsjfZscvEvsBJK2OqGX/mRKfpXb4YQbgAN/2hoarhlaO2W/332VbuFm25WJ Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axt4majjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23E5610003B;
 Wed,  8 Sep 2021 17:55:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1416721F0A7;
 Wed,  8 Sep 2021 17:55:26 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:55:25
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 7/7] iio: adc: stm32-adc: use generic binding for sample-time
Date: Wed, 8 Sep 2021 17:54:52 +0200
Message-ID: <20210908155452.25458-8-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG1NODE3.st.com
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

Add st,min-sample-time-nsecs to channel generic binding.
Sample time can be defined par channel node. If a channel
is configured as differential, the same sample time applies
for both inputs.
Keep support of legacy st,min-sample-time-nsecs property
for backward compatibility.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 75 +++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 9e52a7de9b16..2d52415770b3 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1806,6 +1806,14 @@ static void stm32_adc_smpr_init(struct stm32_adc *adc, int channel, u32 smp_ns)
 	u32 period_ns, shift = smpr->shift, mask = smpr->mask;
 	unsigned int smp, r = smpr->reg;
 
+	/*
+	 * For vrefint channel, ensure that the sampling time cannot
+	 * be lower than the one specified in the datasheet
+	 */
+	if (channel == adc->int_ch[STM32_ADC_INT_CH_VREFINT] &&
+	    smp_ns < adc->cfg->ts_vrefint_ns)
+		smp_ns = adc->cfg->ts_vrefint_ns;
+
 	/* Determine sampling time (ADC clock cycles) */
 	period_ns = NSEC_PER_SEC / adc->common->rate;
 	for (smp = 0; smp <= STM32_ADC_MAX_SMP; smp++)
@@ -1884,6 +1892,13 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
 		return -ENODATA;
 	}
 
+	/* Optional sample time is provided either for each, or all channels */
+	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
+	if (ret > 1 && ret != num_channels) {
+		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
+		return -EINVAL;
+	}
+
 	return num_channels;
 }
 
@@ -1899,6 +1914,7 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 	int scan_index = 0, val, ret, i;
 	struct property *prop;
 	const __be32 *cur;
+	u32 smp = 0;
 
 	if (num_diff) {
 		ret = of_property_read_u32_array(node, "st,adc-diff-channels",
@@ -1941,6 +1957,19 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 		scan_index++;
 	}
 
+	for (i = 0; i < scan_index; i++) {
+		/*
+		 * Using of_property_read_u32_index(), smp value will only be
+		 * modified if valid u32 value can be decoded. This allows to
+		 * get either no value, 1 shared value for all indexes, or one
+		 * value per channel.
+		 */
+		of_property_read_u32_index(node, "st,min-sample-time-nsecs", i, &smp);
+
+		/* Prepare sampling time settings */
+		stm32_adc_smpr_init(adc, channels[i].channel, smp);
+	}
+
 	return scan_index;
 }
 
@@ -2035,6 +2064,19 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 
 		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
 					vin[1], scan_index, differential);
+
+		ret = of_property_read_u32(child, "st,min-sample-time-nsecs", &val);
+		/* st,min-sample-time-nsecs is optional */
+		if (!ret) {
+			stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
+			if (vin[1])
+				stm32_adc_smpr_init(adc, vin[1], val);
+		} else if (ret != -EINVAL) {
+			dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs property %d\n",
+				ret);
+			goto err;
+		}
+
 		scan_index++;
 	}
 
@@ -2052,8 +2094,7 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	struct iio_chan_spec *channels;
-	int scan_index = 0, num_channels = 0, ret, i;
-	u32 smp = 0;
+	int scan_index = 0, num_channels = 0, ret;
 	bool legacy = false;
 
 	num_channels = of_get_available_child_count(node);
@@ -2077,13 +2118,6 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		return -EINVAL;
 	}
 
-	/* Optional sample time is provided either for each, or all channels */
-	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
-	if (ret > 1 && ret != num_channels) {
-		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
-		return -EINVAL;
-	}
-
 	if (timestamping)
 		num_channels++;
 
@@ -2100,29 +2134,6 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		return ret;
 	scan_index = ret;
 
-	for (i = 0; i < scan_index; i++) {
-		/*
-		 * Using of_property_read_u32_index(), smp value will only be
-		 * modified if valid u32 value can be decoded. This allows to
-		 * get either no value, 1 shared value for all indexes, or one
-		 * value per channel.
-		 */
-		of_property_read_u32_index(node, "st,min-sample-time-nsecs",
-					   i, &smp);
-
-		/*
-		 * For vrefint channel, ensure that the sampling time cannot
-		 * be lower than the one specified in the datasheet
-		 */
-		if (channels[i].channel == adc->int_ch[STM32_ADC_INT_CH_VREFINT] &&
-		    smp < adc->cfg->ts_vrefint_ns) {
-			smp = adc->cfg->ts_vrefint_ns;
-		}
-
-		/* Prepare sampling time settings */
-		stm32_adc_smpr_init(adc, channels[i].channel, smp);
-	}
-
 	if (timestamping) {
 		struct iio_chan_spec *timestamp = &channels[scan_index];
 
-- 
2.17.1

