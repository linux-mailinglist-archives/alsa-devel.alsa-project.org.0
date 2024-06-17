Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8990A2F7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 05:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C590868;
	Mon, 17 Jun 2024 05:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C590868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718596570;
	bh=+DEENcXMKXyiWZXETIGEWVoFCDj5PxY9bRACXwxWcyM=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ndhhxm5gmy/dhEQdyIpeSv1q/elEKwi7rGYglusY+5X+p2LLkBEmf6YnT+lfCnsNU
	 hj9fDorVrttqbTRX4/jn25zfuQSyp6wBfZtPwWHOxpsUGKn0IoTpkKV1AQxWZZhTyo
	 Nw/llrEKbuBNtQiXLrdZ0TYmOvLn88yinlAcB+TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84F03F80589; Mon, 17 Jun 2024 05:55:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CA1F805AE;
	Mon, 17 Jun 2024 05:55:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71669F8023A; Mon, 17 Jun 2024 05:53:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EE46F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 05:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE46F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hrPsjxyh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45GNjv9C027906;
	Mon, 17 Jun 2024 03:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HG6oEJg2/GeNLGbGBK0m7n
	b1SCOW0UJLipys6dM2UyA=; b=hrPsjxyhiDCBvrhyEC4QxJW2LhyKwED6zAzhgI
	4uh/NJOT5O4PBqOxPc1FMyguRyMV2YmGJXVZm0CCzDH9xZwqbTaDtW+nQRV8PRNn
	Vc8jCY23r0y/SmNc5Szi6qFKRV2hCUepS3+5ihFo1vj+yumRVavfhMXRIjBEMv6t
	y+5o7+k7y5+qKc9tIR3tp2mONwfmxqoGS9bEXMoRkEPe9JG8j9IfCtKvcpIdC52X
	CnXNYdiQUX//aheimnBIqPWHQrqNfATr2WphW5aWx7wo7GtInXJaTn79kkneUfqc
	AoC2HdOkgJoWd5WvElVfncE4o2lU+feEXiuWxLqoV0RPD9rQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3b72mkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 03:52:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45H3qS17022208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 03:52:28 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Jun
 2024 20:52:27 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 16 Jun 2024 20:52:26 -0700
Subject: [PATCH v2] ASoC: fsl: imx-pcm-fiq: add missing
 MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240616-md-arm-sound-soc-fsl-v2-1-228772e81a54@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPmyb2YC/4WOSw6DIBRFt2IY9zUC9ddR99E4QHjUlyi0oMbGu
 PeiG+jkJie5v41FDISR3bONBVwokncJxCVjulfuhUAmMRO5uOUlL2A0oMII0c/OJNVg4wC6aGr
 byUJi2bAUfQe0tJ61zzZxpyJCF5TT/VE2kJtXGFWcMBz2nuLkw/c8sfAj9Gdv4cChRlNJroXNK
 /n4zKTJ6av2I2v3ff8BxWTWQdkAAAA=
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
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7_hVxNreZFW5jF6KCta9oeKbC7ELmJx9
X-Proofpoint-ORIG-GUID: 7_hVxNreZFW5jF6KCta9oeKbC7ELmJx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_02,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170028
Message-ID-Hash: 3TXIBIQT7NZETR5HVTHT2MCC3LMWNJYN
X-Message-ID-Hash: 3TXIBIQT7NZETR5HVTHT2MCC3LMWNJYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TXIBIQT7NZETR5HVTHT2MCC3LMWNJYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Fixed spelling of Freescale
- Link to v1: https://lore.kernel.org/r/20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com
---
 sound/soc/fsl/imx-pcm-fiq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index 0d124002678e..3391430e4253 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -319,4 +319,5 @@ void imx_pcm_fiq_exit(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(imx_pcm_fiq_exit);
 
+MODULE_DESCRIPTION("Freescale i.MX PCM FIQ handler");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240615-md-arm-sound-soc-fsl-c598fb353e69

