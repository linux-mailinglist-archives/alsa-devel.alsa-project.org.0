Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A78CFEED
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 13:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B38828;
	Mon, 27 May 2024 13:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B38828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716809338;
	bh=x3PCC0y6uaaeDTE8kkDcP+KwrqIGNwLnAeqUptXq5tk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ivKuSxb7iC2B/aDCTZ7CSSMUdeAyfT2LhqDYb3hbrJM86faSrhaPbZ8IIUg3u3FI5
	 pma/YRBm7JZD+DcwuHh5I+fXzMEXUAb2yWiiq1szg82asWsX9Kw9MmjDZQvpLhdKMm
	 HP5sPVu0b4IahboP9s1+5RWN9tLmHC4ze5RhFPVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FCCF8059F; Mon, 27 May 2024 13:28:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E10BFF80589;
	Mon, 27 May 2024 13:28:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A79F8051E; Mon, 27 May 2024 13:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ADD4F800AC
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 13:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ADD4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=niLM22zF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44RB5gDB010181;
	Mon, 27 May 2024 11:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/1ZklVoOrwSkd4lzSC4Lbu
	JU2W9DLkXEvjmiVexwaWA=; b=niLM22zFp8Oj13S/66UYFITWTVfq/Gy693KsJH
	8+TC+ijVNoeuw+Exh6CdBsL+c/v5RP2iefx5cZqJQtS+DuvngTGlAgOY4JaBoJed
	vjh8p9U97lxfooPBx15zEEYvHM+hE48072NwdPHI3Pt7QkbkGXa4xK89p9ARLOqY
	wNkbmzMe1z51GX+8zXwihRrG9pGT3M2CI73eXGcmIWrdFHSnCn/btNV6QXDGYlMi
	lkTC04W0YCr39LiurqEAbKwGmUawxhj/LTXISHBgHNeGjfxKABVcr1Lcz6imd9UA
	MHFEPw3ptq4c1T2nkiTw+DOh+hS+ANX3Qnv90tZKZ1szhIXQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pkjp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 11:20:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44RBKGX5030159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 11:20:16 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 27 May 2024 04:20:11 -0700
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
Subject: [RESEND v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Date: Mon, 27 May 2024 16:49:49 +0530
Message-ID: <20240527111956.444425-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fc-T6zG3bIrWgESAa0gINxkXbYu-Hsz3
X-Proofpoint-GUID: fc-T6zG3bIrWgESAa0gINxkXbYu-Hsz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_01,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=558 bulkscore=3
 suspectscore=0 clxscore=1015 lowpriorityscore=3 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270093
Message-ID-Hash: XBJTPZ6WY64HIFNQCJKICBLJO4EO5OES
X-Message-ID-Hash: XBJTPZ6WY64HIFNQCJKICBLJO4EO5OES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBJTPZ6WY64HIFNQCJKICBLJO4EO5OES/>
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


base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
-- 
2.25.1

