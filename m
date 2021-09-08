Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEB403D1A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30DD1693;
	Wed,  8 Sep 2021 17:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30DD1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116678;
	bh=3tfFko3n4XxKjFsHm2ilt3CV/mnOJs0accibgslCQWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4h5YmQ6fwZvd865c7n1szpZ+pYAJWjazBKR2KFsVmncbLuY8ZdOCkX5ZoCa+iofX
	 6jH47TGzvcq7vye0DnzU6L3TtV/mKoD7sIdDN/0wDxVnDdctJjKDB6MzYtOjFfwpg3
	 14fCak5OqS6ShMSESOl/YMYNldET2fwcn8t2RwIw=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 977F0F804FD;
	Wed,  8 Sep 2021 17:55:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84289F804F2; Wed,  8 Sep 2021 17:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212A6F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212A6F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="2L4kQ7mY"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188FpSjo007771;
 Wed, 8 Sep 2021 17:55:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=7c/a7QYZhvYe13U6jCTLYsPuBAp1wOiYKgfl2jIFVcY=;
 b=2L4kQ7mYj7MML1t1SqDoRR7xgy4GFD2udLFnL1D0YnxoaMpHk0TrD27oPImi4aw9f+0z
 VbnoyhaFQcM4nuRYtVTZFugUpiVZV0+uk2UJniqH9LwJdGnE4P5UIu/MMQxL0DCk81ci
 BwicaVykyS7WRCNYaPxJN6cWfdNhqC9y/hh6SrJCUjoZ7zAaAYzazjtOFxSLwyuvKnbN
 sgWoDaTreEWCK4pZm5EcXa90iRq4WpZHf3FIlNLHN+q7BjIrh/dgDjuwwWhzBgpglSHl
 oMmhkhQ28QlpGRqssa71CXyIZp/9wizJcOr0EQzCrLQPVbyK9CByuedhuYFxyfZsVfpp Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axt4majgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B06010002A;
 Wed,  8 Sep 2021 17:55:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7869D2203A5;
 Wed,  8 Sep 2021 17:55:01 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:55:00
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/7] iio: adc stm32-adc: split channel init into several
 routines
Date: Wed, 8 Sep 2021 17:54:48 +0200
Message-ID: <20210908155452.25458-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
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

Split stm32_adc_chan_of_init channel initialization function into
several routines to increase readability and prepare channel
generic binding handling.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 131 ++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 44 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5088de835bb1..2f137d14f141 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -194,6 +194,7 @@ struct stm32_adc_cfg {
  * @smpr_val:		sampling time settings (e.g. smpr1 / smpr2)
  * @cal:		optional calibration data on some devices
  * @chan_name:		channel name array
+ * @num_diff:		number of differential channels
  */
 struct stm32_adc {
 	struct stm32_adc_common	*common;
@@ -217,6 +218,7 @@ struct stm32_adc {
 	u32			smpr_val[2];
 	struct stm32_adc_calib	cal;
 	char			chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
+	u32			num_diff;
 };
 
 struct stm32_adc_diff_channel {
@@ -1706,17 +1708,11 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
 	}
 }
 
-static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
+static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm32_adc *adc)
 {
 	struct device_node *node = indio_dev->dev.of_node;
-	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
-	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
-	struct property *prop;
-	const __be32 *cur;
-	struct iio_chan_spec *channels;
-	int scan_index = 0, num_channels = 0, num_diff = 0, ret, i;
-	u32 val, smp = 0;
+	int num_channels = 0, ret;
 
 	ret = of_property_count_u32_elems(node, "st,adc-channels");
 	if (ret > adc_info->max_channels) {
@@ -1727,41 +1723,54 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	}
 
 	ret = of_property_count_elems_of_size(node, "st,adc-diff-channels",
-					      sizeof(*diff));
+					      sizeof(struct stm32_adc_diff_channel));
 	if (ret > adc_info->max_channels) {
 		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
 		return -EINVAL;
 	} else if (ret > 0) {
-		int size = ret * sizeof(*diff) / sizeof(u32);
-
-		num_diff = ret;
+		adc->num_diff = ret;
 		num_channels += ret;
+	}
+
+	return num_channels;
+}
+
+static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
+				      struct stm32_adc *adc,
+				      struct iio_chan_spec *channels)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
+	u32 num_diff = adc->num_diff;
+	int size = num_diff * sizeof(*diff) / sizeof(u32);
+	int scan_index = 0, val, ret, i;
+	struct property *prop;
+	const __be32 *cur;
+
+	if (num_diff) {
 		ret = of_property_read_u32_array(node, "st,adc-diff-channels",
 						 (u32 *)diff, size);
-		if (ret)
+		if (ret) {
+			dev_err(&indio_dev->dev, "Failed to get diff channels %d\n", ret);
 			return ret;
-	}
+		}
 
-	if (!num_channels) {
-		dev_err(&indio_dev->dev, "No channels configured\n");
-		return -ENODATA;
-	}
+		for (i = 0; i < num_diff; i++) {
+			if (diff[i].vinp >= adc_info->max_channels ||
+			    diff[i].vinn >= adc_info->max_channels) {
+				dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
+					diff[i].vinp, diff[i].vinn);
+				return -EINVAL;
+			}
 
-	/* Optional sample time is provided either for each, or all channels */
-	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
-	if (ret > 1 && ret != num_channels) {
-		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
-		return -EINVAL;
+			stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
+						diff[i].vinp, diff[i].vinn,
+						scan_index, true);
+			scan_index++;
+		}
 	}
 
-	if (timestamping)
-		num_channels++;
-
-	channels = devm_kcalloc(&indio_dev->dev, num_channels,
-				sizeof(struct iio_chan_spec), GFP_KERNEL);
-	if (!channels)
-		return -ENOMEM;
-
 	of_property_for_each_u32(node, "st,adc-channels", prop, cur, val) {
 		if (val >= adc_info->max_channels) {
 			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
@@ -1771,8 +1780,7 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		/* Channel can't be configured both as single-ended & diff */
 		for (i = 0; i < num_diff; i++) {
 			if (val == diff[i].vinp) {
-				dev_err(&indio_dev->dev,
-					"channel %d miss-configured\n",	val);
+				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	val);
 				return -EINVAL;
 			}
 		}
@@ -1781,19 +1789,54 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		scan_index++;
 	}
 
-	for (i = 0; i < num_diff; i++) {
-		if (diff[i].vinp >= adc_info->max_channels ||
-		    diff[i].vinn >= adc_info->max_channels) {
-			dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
-				diff[i].vinp, diff[i].vinn);
-			return -EINVAL;
-		}
-		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
-					diff[i].vinp, diff[i].vinn, scan_index,
-					true);
-		scan_index++;
+	return scan_index;
+}
+
+static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct iio_chan_spec *channels;
+	int scan_index = 0, num_channels = 0, ret, i;
+	u32 smp = 0;
+
+	ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
+	if (ret < 0)
+		return ret;
+	num_channels = ret;
+
+	if (!num_channels) {
+		dev_err(&indio_dev->dev, "No channels configured\n");
+		return -ENODATA;
 	}
 
+	if (num_channels > adc_info->max_channels) {
+		dev_err(&indio_dev->dev, "Channel number [%d] exceeds %d\n",
+			num_channels, adc_info->max_channels);
+		return -EINVAL;
+	}
+
+	/* Optional sample time is provided either for each, or all channels */
+	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
+	if (ret > 1 && ret != num_channels) {
+		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
+		return -EINVAL;
+	}
+
+	if (timestamping)
+		num_channels++;
+
+	channels = devm_kcalloc(&indio_dev->dev, num_channels,
+				sizeof(struct iio_chan_spec), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	if (ret < 0)
+		return ret;
+	scan_index = ret;
+
 	for (i = 0; i < scan_index; i++) {
 		/*
 		 * Using of_property_read_u32_index(), smp value will only be
-- 
2.17.1

