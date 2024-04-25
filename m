Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7B8B1DB6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 11:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07750DF6;
	Thu, 25 Apr 2024 11:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07750DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714036859;
	bh=sTm+PpZ6Ap0xhC7BqDac2mgtIkGMWqrMZth1L9PQtPc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ol2cbdhM9bSD/jW9UV8lIDGNYQcYXPEHTRklaZaoBADH/KRugXZkc4KWJ9NC7uUmq
	 0XneghemBxvTEPtCGpVSU/bepmAhiIGo8lAOqXiBfhL1txtTtQ7uJ2iL03sDdUE3by
	 n+jNPQzD+7UKMwx8jkAqhLAFcZ8wB2ETy2MbJDsA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED6FF805AA; Thu, 25 Apr 2024 11:20:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CA3F805AA;
	Thu, 25 Apr 2024 11:20:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFEDAF80423; Thu, 25 Apr 2024 11:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32BDCF800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 11:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32BDCF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DbnQadNM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43P9Ihnf020018;
	Thu, 25 Apr 2024 09:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=TBTKZrt
	UVFKfLaVcB4puOBOrdyhWFnI8hrjDAzeTHZ0=; b=DbnQadNMxgJrSDqUYZRxzgM
	az+LVfmRiLuDfoG8zuKdpzOR/iQkvt2Lo1iDvhefabcYCt3Kec4VTgYD7S+7n4ql
	+PV/7Iruh4zyHhxMeVmvVqX9Fq/KSdR6itT6tuYM/RxY3I04pyCGmne9YML6GQVm
	vLl8dbap+gK1Tp/PRNJ0eHz6aajF2KfnULB4VPMTFOdKt352kP10YdS7yVK08eEl
	KELJ3bqHenSjLzcyIOlP90slBsWAViTA0qNM1Kd1P33p+IkwbDvVZ+flIY0wKmQv
	jYOhTYJD73YDjFQVXZ9QgNwjL1ZwJ82IwtE2wmD2OCbmyH389zIpnuJjKS0DK9Q=
	=
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenghk89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:20:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43P9K6KV032065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:20:06 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 02:20:01 -0700
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
CC: <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec support
Date: Thu, 25 Apr 2024 14:48:50 +0530
Message-ID: <20240425091857.2161088-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: 280RT4kbRjzCyZQpAd9oV2kETDLFx3SO
X-Proofpoint-ORIG-GUID: 280RT4kbRjzCyZQpAd9oV2kETDLFx3SO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=705 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250066
Message-ID-Hash: 6UQ26UXADAW3B7WC5ZJSXH5CTDZ32WK2
X-Message-ID-Hash: 6UQ26UXADAW3B7WC5ZJSXH5CTDZ32WK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UQ26UXADAW3B7WC5ZJSXH5CTDZ32WK2/>
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
  ASoC: codecs: wcd937x: add wcd937x codec driver
  ASoC: codecs: wcd937x-sdw: add SoundWire driver
  ASoC: codecs: wcd937x: add basic controls
  ASoC: codecs: wcd937x: add playback dapm widgets
  ASoC: codecs: wcd937x: add capture dapm widgets
  ASoC: codecs: wcd937x: add audio routing and Kconfig

 .../bindings/sound/qcom,wcd937x-sdw.yaml      |   78 +
 .../bindings/sound/qcom,wcd937x.yaml          |   58 +
 sound/soc/codecs/Kconfig                      |   20 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd937x-sdw.c                | 1147 +++++++
 sound/soc/codecs/wcd937x.c                    | 3036 +++++++++++++++++
 sound/soc/codecs/wcd937x.h                    |  653 ++++
 7 files changed, 4999 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.c
 create mode 100644 sound/soc/codecs/wcd937x.h


base-commit: 5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
-- 
2.25.1

