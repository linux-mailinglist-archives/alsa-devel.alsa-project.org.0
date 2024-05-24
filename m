Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8C8CE01D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 06:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97E56B76;
	Fri, 24 May 2024 05:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97E56B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716523208;
	bh=tCImr3eNuGCx3++HG06+FF6HfNx8UBkQ8vONEBmnqFw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JuyGPNJ8By/9/Mq7/4rHgFBqHxnFV5ttoMRp8srWfuPnxswwkjHQQUpRBWeLnkjDA
	 YZVICeahdbSIYbNpi7Cjz4hgZsnx5KOD5SBjNSSUDlQBX7XP2eGK1lm4WrCfmleE4W
	 l0sH8LAxtJFVN/0Yj5tFEAxn2x1he75YOA5ekAq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E3F9F805EF; Fri, 24 May 2024 05:59:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 567D5F805EF;
	Fri, 24 May 2024 05:59:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA7CDF8020D; Fri, 24 May 2024 05:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B30CDF80051
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 05:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B30CDF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=AQkuYC5j
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44NNPjke013266;
	Fri, 24 May 2024 03:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZAR/+EBIHXZGJe+mq0lrwc
	QHAnY1nldA39qM/Y3XeFY=; b=AQkuYC5ja9rNX6gpHm0fkb4Ipm+aXACAatm/6h
	caAiB/WQQrpoH0xZ5zo84wK4Rv6ye6/T+JNN5K4xHVCTl++IKj+hr2AJ7d5B2FIk
	0B0SeqsAMxGM8Df7ofePjHwBfxP1A579Mj8XfqDtAXNJEKniFc8t/zo+wWO/DPTi
	CnHlaqWm1J0J0sAW9rQmq0/SKxiv6604+oCo6RchdyRYrnJ1490ZaZg+44+ujqGf
	NpfAGaRX7br/lbh3nhZ393Qsylgp3DrflEGdEFfCLZQ8O0T4SUypkioV/ZDVvoq6
	4b5SRNXHG6mXNvJItGqOrPHHYCQlug30uCwQQMmCTNfhmmjw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8hs470-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:56:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44O3uF7B018545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:56:15 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 20:56:10 -0700
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
Subject: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec support
Date: Fri, 24 May 2024 09:25:28 +0530
Message-ID: <20240524035535.3119208-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L3st0f3sd4uXIkAkilpiBdlveYl6tFL7
X-Proofpoint-GUID: L3st0f3sd4uXIkAkilpiBdlveYl6tFL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=1 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 mlxlogscore=624 lowpriorityscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240025
Message-ID-Hash: JJXFZYPH6WZKLDPCJODEHWVBG2PG3P4V
X-Message-ID-Hash: JJXFZYPH6WZKLDPCJODEHWVBG2PG3P4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJXFZYPH6WZKLDPCJODEHWVBG2PG3P4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support for Qualcomm WCD9370/WCD9375 codec.

Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
6 DMICs and MBHC.

For codec driver to be functional it would need both tx and rx Soundwire devices
to be up and this is taken care by using device component framework and device-links
are used to ensure proper pm dependencies. Ex tx does not enter suspend
before rx or codec is suspended.

This patchset along with other SoundWire patches on the list
have been tested on QCM6490 IDP device.

Changes since v4:
 - Removed volatile/read-only registers from defaults list
 - Added wcd939x_volatile_register() with only volatile registers
 - Added a wcd939x_readable_register() with read-only and read-write registers, so cache does it's job
 - Fixed Spurious events for mixer controls and validated with mixer selftest tool
 - Used TLV instead of enum for ear_pa_gain mixer control
 - Used enum constraints instead of OneOf in dt-binding patch
 - Added vdd-px supply property as non optional in dt-binding patch
 - Reworked and done driver cleanup
 
Changes since v3:
 - Fixed dt binding check errors.
 - Added constraints on values in v4-0001 binding patch as suggested by Krzysztof
 - Change the patch sequence soundwire driver first then codec driver
 - Added missing .remove soundwire driver function
 - Reworked and done driver cleanup

Changes since v2:
 - Used common qcom,wcd93xx-common.yaml. removed duplicate properties.
 - Merged bindings patches "v2-0001" and "v2-0003" in single patch for easy review.
 - Fixed dt binding check errors.
 - Added missing "qcom,wcd9375-codec" in v3-0001 dt binding patch.
 - Added constraints on values in v3-0001 binding patch as suggested by Krzysztof
 - Fix the typo mistake in v2 cover letter
 
Changes since v1:
 - Split the patch per driver for easier review as suggested by Krzysztof
 - Used devm_gpiod_get api to get reset gpio as suggested by Krzysztof

Prasad Kumpatla (7):
  ASoC: dt-bindings: document wcd937x Audio Codec
  ASoC: codecs: wcd937x-sdw: add SoundWire driver
  ASoC: codecs: wcd937x: add wcd937x codec driver
  ASoC: codecs: wcd937x: add basic controls
  ASoC: codecs: wcd937x: add playback dapm widgets
  ASoC: codecs: wcd937x: add capture dapm widgets
  ASoC: codecs: wcd937x: add audio routing and Kconfig

 .../bindings/sound/qcom,wcd937x-sdw.yaml      |   91 +
 .../bindings/sound/qcom,wcd937x.yaml          |   82 +
 sound/soc/codecs/Kconfig                      |   20 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd937x-sdw.c                | 1139 +++++++
 sound/soc/codecs/wcd937x.c                    | 3029 +++++++++++++++++
 sound/soc/codecs/wcd937x.h                    |  653 ++++
 7 files changed, 5021 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.c
 create mode 100644 sound/soc/codecs/wcd937x.h


base-commit: 124cfbcd6d185d4f50be02d5f5afe61578916773
-- 
2.25.1

