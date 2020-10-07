Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D7286247
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E663D16CB;
	Wed,  7 Oct 2020 17:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E663D16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602085096;
	bh=5wVXsHiSnyky/5EVB+ezwPF6NohJOWfQc3ol4KiRorc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1TDM7N/QFqdlVbFoMMGVdrElNMBwoZ2oWglIzUY8mzNBoYDNtYnSPLIH9kWFYLsv
	 x/8zHZs1mBiF1jxE22rM2w80IEBCzjL0OuuMCehIA6tQ73LbqCjpZlAQaJMDLAdwB/
	 bAUgiEATTlUovk9sorvEAmtXGRPzCaHGG81obtE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD87F8016D;
	Wed,  7 Oct 2020 17:35:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F26E3F80225; Wed,  7 Oct 2020 17:35:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA6F2F8016D
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 17:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA6F2F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="lm1iWgIp"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FWDIn023606; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LPmTNBs4XJT9cCBJcxCmDFKkYPrNIrwRIBlSBsDz2R0=;
 b=lm1iWgIpw3IRxl+qksHroByVOItjRbOuuvxvijzveW7+Y9ICpeptdf6WIc5pIZiTqKAp
 jpWvLuQrdzZx4Fd7EJm3glQXfQnoBVYovukBy4jRmLDNCMyeOprguLv8mXyUM+vKE/+J
 mco1YAzJVY4FPvUGYMhspQW42Cua6au0cmdKHeciHHmcQOSulhJaC/uhZQCMf95m8RX2
 K6p6JN7wGf4Gx9lXCmjeK5FKt59HOP/M74padGli3II1RjJELU4s0f8837tiRtY4K32I
 hNyUq67nTSegexag0oatupc6Cjf0biUnc6b7DZiQPuwGOICW+6puyb5o4vieBaP4dXac xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjwfh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7628D10002A;
 Wed,  7 Oct 2020 17:35:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 690F82B8A27;
 Wed,  7 Oct 2020 17:35:15 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:15
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Subject: [PATCH 2/2] ASoC: stm32: dfsdm: add actual resolution trace
Date: Wed, 7 Oct 2020 17:34:59 +0200
Message-ID: <20201007153459.22155-3-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Add a trace to report actual resolution of audio samples.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++++
 drivers/iio/adc/stm32-dfsdm.h     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 5e10fb4f3704..b7e9ef1a6eec 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -293,6 +293,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
 					max >>= flo->rshift;
 				}
 				flo->max = (s32)max;
+				flo->bits = bits;
 
 				pr_debug("%s: fast %d, fosr %d, iosr %d, res 0x%llx/%d bits, rshift %d, lshift %d\n",
 					 __func__, fast, flo->fosr, flo->iosr,
@@ -476,6 +477,9 @@ static int stm32_dfsdm_channels_configure(struct iio_dev *indio_dev,
 	if (!flo->res)
 		return -EINVAL;
 
+	dev_dbg(&indio_dev->dev, "Samples actual resolution: %d bits",
+		min(flo->bits, (u32)DFSDM_DATA_RES - 1));
+
 	for_each_set_bit(bit, &adc->smask,
 			 sizeof(adc->smask) * BITS_PER_BYTE) {
 		chan = indio_dev->channels + bit;
diff --git a/drivers/iio/adc/stm32-dfsdm.h b/drivers/iio/adc/stm32-dfsdm.h
index 5dbdae4ed881..4afc1f528b78 100644
--- a/drivers/iio/adc/stm32-dfsdm.h
+++ b/drivers/iio/adc/stm32-dfsdm.h
@@ -249,6 +249,7 @@ enum stm32_dfsdm_sinc_order {
  * @rshift: output sample right shift (hardware shift)
  * @lshift: output sample left shift (software shift)
  * @res: output sample resolution
+ * @bits: output sample resolution in bits
  * @max: output sample maximum positive value
  */
 struct stm32_dfsdm_filter_osr {
@@ -257,6 +258,7 @@ struct stm32_dfsdm_filter_osr {
 	unsigned int rshift;
 	unsigned int lshift;
 	u64 res;
+	u32 bits;
 	s32 max;
 };
 
-- 
2.17.1

