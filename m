Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E6403D1E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9625A16BF;
	Wed,  8 Sep 2021 17:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9625A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116697;
	bh=FJ5QfNPsyIHfiB6Raaz/3NRe8Vg4vBtXHy7sdmBr58Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My5u9XMdwSCJ2FXMb0YssaXtQSV78JpU/jxazxLbESnkC0ocF2q+7kBYzHPZebXjr
	 L8dkOIOSWCXHIIE8pGONgC5KPdh9dWUWgTwhz2XnFG454EVMOwKLIWxexqmmIWzhQz
	 aGRE5ZrGXhyNUh4UXV75TgpHBA4X8BoYGH7a9UpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B53DF80507;
	Wed,  8 Sep 2021 17:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC7FCF804FC; Wed,  8 Sep 2021 17:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A84EF80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A84EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="geyj3Vm0"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188FpDvj017933;
 Wed, 8 Sep 2021 17:55:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=e/oa1unCRWL4AroRZ8b6CGYEbaQjckTlJaMT/ZZmzuI=;
 b=geyj3Vm057r+eAGIcs/KMLLh259gGdN2hQBvWyMUxLBm/1JXRO0nXyoVf8LG5+YsZ5WR
 c938NpeKJYnBL8fGbCZ82tBj59jQ2e1Ux8t3WxiBSNMOD65zwJmJeaMvbGPNIGT/11TB
 wASZwqlD5Rsl0Go2JeVVDoJ1nGjBvcFCV+IpQC1dW/uQNP1FXF0HyQxGShKo8hlgwiFW
 8oGq1OaZ7zpEGyn31fvtt6p6QO4PVDf4egE3PslL53mB4DoYEItfc6faAhJ7LoARWjbk
 pVJNflo70Nn9joggXcnN/0YykV4zwDZ4oghpVf20+S8hfb+gVEJ3yFPTlu0t19rUFjSj vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axwtygupq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F83F100034;
 Wed,  8 Sep 2021 17:55:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CA8D2203A5;
 Wed,  8 Sep 2021 17:55:02 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:55:01
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/7] iio: adc: stm32-adc: add support of generic channels
 binding
Date: Wed, 8 Sep 2021 17:54:49 +0200
Message-ID: <20210908155452.25458-5-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
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

Add support of generic IIO channel binding:
./devicetree/bindings/iio/adc/adc.yaml
Keep support of st,adc-channels and st,adc-diff-channels
for backward compatibility.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 99 +++++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 2f137d14f141..ae4a314854f7 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -35,7 +35,7 @@
 #define STM32H7_BOOST_CLKRATE		20000000UL
 
 #define STM32_ADC_CH_MAX		20	/* max number of channels */
-#define STM32_ADC_CH_SZ			10	/* max channel name size */
+#define STM32_ADC_CH_SZ			16	/* max channel name size */
 #define STM32_ADC_MAX_SQ		16	/* SQ1..SQ16 */
 #define STM32_ADC_MAX_SMP		7	/* SMPx range is [0..7] */
 #define STM32_ADC_TIMEOUT_US		100000
@@ -1732,6 +1732,11 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
 		num_channels += ret;
 	}
 
+	if (!num_channels) {
+		dev_err(indio_dev->dev.parent, "No channel found\n");
+		return -ENODATA;
+	}
+
 	return num_channels;
 }
 
@@ -1792,6 +1797,73 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 	return scan_index;
 }
 
+static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
+				       struct stm32_adc *adc,
+				       struct iio_chan_spec *channels)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct device_node *child;
+	const char *name;
+	int val, scan_index = 0, ret;
+	bool differential;
+	u32 vin[2];
+
+	for_each_available_child_of_node(node, child) {
+		ret = of_property_read_u32(child, "reg", &val);
+		if (ret) {
+			dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
+			goto err;
+		}
+
+		ret = of_property_read_string(child, "label", &name);
+		/* label is optional */
+		if (!ret) {
+			if (strlen(name) >= STM32_ADC_CH_SZ) {
+				dev_err(&indio_dev->dev, "Label %s exceeds %d characters\n",
+					name, STM32_ADC_CH_SZ);
+				return -EINVAL;
+			}
+			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
+		} else if (ret != -EINVAL) {
+			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
+			goto err;
+		}
+
+		if (val >= adc_info->max_channels) {
+			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		differential = false;
+		ret = of_property_read_u32_array(child, "diff-channels", vin, 2);
+		/* diff-channels is optional */
+		if (!ret) {
+			differential = true;
+			if (vin[0] != val || vin[1] >= adc_info->max_channels) {
+				dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
+					vin[0], vin[1]);
+				goto err;
+			}
+		} else if (ret != -EINVAL) {
+			dev_err(&indio_dev->dev, "Invalid diff-channels property %d\n", ret);
+			goto err;
+		}
+
+		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
+					vin[1], scan_index, differential);
+		scan_index++;
+	}
+
+	return scan_index;
+
+err:
+	of_node_put(child);
+
+	return ret;
+}
+
 static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 {
 	struct device_node *node = indio_dev->dev.of_node;
@@ -1800,15 +1872,21 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	struct iio_chan_spec *channels;
 	int scan_index = 0, num_channels = 0, ret, i;
 	u32 smp = 0;
+	bool legacy = false;
 
-	ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
-	if (ret < 0)
-		return ret;
-	num_channels = ret;
-
+	num_channels = of_get_available_child_count(node);
+	/*
+	 * If no channels have been found, fallback to channels legacy properties.
+	 * Legacy channel properties will be ignored, if some channels are
+	 * already defined using the standard binding.
+	 */
 	if (!num_channels) {
-		dev_err(&indio_dev->dev, "No channels configured\n");
-		return -ENODATA;
+		ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
+		if (ret < 0)
+			return ret;
+
+		legacy = true;
+		num_channels = ret;
 	}
 
 	if (num_channels > adc_info->max_channels) {
@@ -1832,7 +1910,10 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	if (!channels)
 		return -ENOMEM;
 
-	ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	if (legacy)
+		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	else
+		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
 	if (ret < 0)
 		return ret;
 	scan_index = ret;
-- 
2.17.1

