Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2968D773F
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2024 19:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691DD846;
	Sun,  2 Jun 2024 19:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691DD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717347682;
	bh=k5EYfPHC/Lo/TNWeBjdx9+fS7FRH2k0S/Jzl9BF0st4=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qlnE6v8h/JO38ZmeCsO/0JKkT97sbIDH6dVhGlvlyd0vjKygONNDef4IEMo30SLhK
	 D/co/NMl6GZ81dfF2eXjEERKAhwfYqRNiQq4dEjqe/D4eIRsjwoS6DsbHmbtNo0MK9
	 t1XzOV9wzf4/YqxUIJG2TngEGz2OGDHIVSQs1cag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8216EF80578; Sun,  2 Jun 2024 19:00:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAB6F804B2;
	Sun,  2 Jun 2024 19:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BBD9F8025A; Sun,  2 Jun 2024 19:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83F4CF800FA
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 19:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F4CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=JuocYykB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 452GQRj5030510;
	Sun, 2 Jun 2024 17:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3V/muIh5raFrmw+q30bwPk
	XMh8vWT0odM2JbwBWGe8Q=; b=JuocYykB3bFoOcOQf0lz39Ejc8pUKcQnWe4OgU
	isXDFaYqKlPzo3Nyqf1/FCUngph7/hF1XQY7JeiwwkmdFajGEEyWqXyCoBpQHaBw
	Srpp0NC9ZN1+PHeWLAgN/zaYGNCjsT8G3vSCL5CfdKHaUk66+L9iD3Ozql3evJ5/
	Iyl5c4YQvvz+JqAWTLzv4FyRYv27tBfGO3MVh5YHemU3QSoHljxUvSHEffCE4ZKY
	ad3kRQOq/cNnxXCrEc6kULd1ywmQXtvxk1kuesI3Je/CKkRco0m4spMd6vX0Xb1m
	20c7Jr86RVfO3gFcLYEpQ9pef7JqkVTQYxOA6q7nqsJzUkUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dj9k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 17:00:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 452H0SE5011802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jun 2024 17:00:28 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 10:00:28 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 2 Jun 2024 10:00:27 -0700
Subject: [PATCH] ASoC: fsl: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240602-md-snd-fsl-imx-pcm-dma-v1-1-e7efc33c6bf3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACqlXGYC/x3MwQqDMAyA4VeRnBeopXrYq4wdahNnwHaSbFIQ3
 32dx+/w/wcYq7DBvTtAeReTd2nobx2kJZYXo1AzeOeDG53HTGiFcLYVJVfcUkbKEd3ofUiDo0A
 9tHhTnqVe48ezeYrGOGksafnvVinfijnahxXO8wdUKIBhhwAAAA==
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>
CC: <alsa-devel@alsa-project.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-sound@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6DUnu3tC95JK_a5FNoxTYQqixlWUhI41
X-Proofpoint-GUID: 6DUnu3tC95JK_a5FNoxTYQqixlWUhI41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406020147
Message-ID-Hash: JQTNPDW22BIH7ESSNI4Y7TFZ2DZEIWNP
X-Message-ID-Hash: JQTNPDW22BIH7ESSNI4Y7TFZ2DZEIWNP
X-MailFrom: quic_jjohnson@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQTNPDW22BIH7ESSNI4Y7TFZ2DZEIWNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 sound/soc/fsl/imx-pcm-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-pcm-dma.c b/sound/soc/fsl/imx-pcm-dma.c
index 14e94270911c..4fa208d6a032 100644
--- a/sound/soc/fsl/imx-pcm-dma.c
+++ b/sound/soc/fsl/imx-pcm-dma.c
@@ -50,4 +50,5 @@ int imx_pcm_dma_init(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(imx_pcm_dma_init);
 
+MODULE_DESCRIPTION("Freescale i.MX PCM DMA interface");
 MODULE_LICENSE("GPL");

---
base-commit: 83814698cf48ce3aadc5d88a3f577f04482ff92a
change-id: 20240602-md-snd-fsl-imx-pcm-dma-06224c50d4d1

