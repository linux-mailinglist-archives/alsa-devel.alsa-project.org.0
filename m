Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5128C7110
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 06:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC7286F;
	Thu, 16 May 2024 06:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC7286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715834989;
	bh=rKb1FnHKC9Amc9w6z6C0ocjq1FaK38UWn7K4S6r0JSI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jLLRyau8bJy7gvxDvo+Gxk5CLmFAuiQT9NR0xn21F6t1cGu6koG3sV284nF4yqp/z
	 O0i19HTB20ZOPRnmz1zftuSJQK973Znyb9s7PY2ga8k9RUhdmNzVEQ9VLdKyfoezgH
	 S3K/HdC1QdgJbwbpjzjieaff7ZUB7nZRTQZm+dgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D40F8057E; Thu, 16 May 2024 06:49:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A8EF805AC;
	Thu, 16 May 2024 06:49:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C61EF8025F; Thu, 16 May 2024 06:49:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AA77AF800E9
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 06:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA77AF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=gtFPfdbe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44FKd7Hq021411;
	Thu, 16 May 2024 04:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=RVvq4ty
	21+Ug4pdDuE9A9epS8VqgV6gBoRj7qCDFhWo=; b=gtFPfdbe+m3T5qQ6qDS0JAI
	7Jzl5QTeAdVHNcUqh8L/X1DsRGyl3GfaLMu833EmitkybMA8sxOFEUNrKWYJa0z5
	MtwZAHavuyQc9yG4aAX7/vUj71oBCNIydyF3dHXsms4Q+c0DmcytyefuSEuyz6uV
	CYf/0fDaFRKXAXaDcA2LxSyWs96sYvfl4MbQqXu4dDMy7gXZWnZjdA2TPMcGNNeY
	8cwwd3rG68/ZZAqSzYkLkF4Qd1M4aDmDnagXvp9LLjVq/TgzJJfa4Dg8F7Tem2pu
	lmUgl5ShUTY7yrbizAxfTKPIflwOxFqQTH5UrxPLZg+kGgSUB6s9Mz6mj4avBiw=
	=
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbcrdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:48:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44G4mk1l011216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 04:48:46 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 21:48:41 -0700
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
Subject: [PATCH v4 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec support
Date: Thu, 16 May 2024 10:17:54 +0530
Message-ID: <20240516044801.1061838-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: eCR_dZOAirQE0jZVaJb8nIZmTbUPmmpR
X-Proofpoint-ORIG-GUID: eCR_dZOAirQE0jZVaJb8nIZmTbUPmmpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=621 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160031
Message-ID-Hash: 2C6ZAPCUIJX4UV6QRRXD33TDPN4RT4ZO
X-Message-ID-Hash: 2C6ZAPCUIJX4UV6QRRXD33TDPN4RT4ZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2C6ZAPCUIJX4UV6QRRXD33TDPN4RT4ZO/>
List-Archive: <>
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

 .../bindings/sound/qcom,wcd937x-sdw.yaml      |   95 +
 .../bindings/sound/qcom,wcd937x.yaml          |   80 +
 sound/soc/codecs/Kconfig                      |   20 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd937x-sdw.c                | 1174 +++++++
 sound/soc/codecs/wcd937x.c                    | 3040 +++++++++++++++++
 sound/soc/codecs/wcd937x.h                    |  653 ++++
 7 files changed, 5069 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.c
 create mode 100644 sound/soc/codecs/wcd937x.h


base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
-- 
2.25.1

