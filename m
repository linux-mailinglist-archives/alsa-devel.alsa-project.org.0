Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3D88DC9D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 12:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB042C03;
	Wed, 27 Mar 2024 12:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB042C03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711539266;
	bh=1uRX+LFK9ACG0P83mcxgeNcdbQe8Tg17DWd/NzG+6QY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LAOXXYQglPrWYKTMoQE6FlIigF0s0p14RgiNmBqL97j6yit6b4EUpnMABzSM+uoDg
	 Ih3TqXJ17+ce8Wwz3hotaKHdgMIDXrm2yZo7N3KuAXIVgqS1fDpN6QrIdAsH3daOiy
	 +k1sTsibxhzoE+ePK3AVb6qlKLEKdWvYtH8H5lHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C0BF805AD; Wed, 27 Mar 2024 12:33:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7039DF80587;
	Wed, 27 Mar 2024 12:33:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6435F8055C; Wed, 27 Mar 2024 12:33:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95863F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 12:33:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95863F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SwdyOGiG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42RARiEo016204;
	Wed, 27 Mar 2024 11:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=F8nnrAY
	YD24VYxXTCTznp7ojEShAiC4FxDB9phAZKrA=; b=SwdyOGiGjpGrrRg5xTePVQP
	arOWl7FDVcEQrI5tZbSJhpTH6ooS11h4OJXxLpA0NOZGn+qbiQX5f+ql3FcRo2A9
	G0liKhRQLiQDUrYGZFC0wUeQ8BY8BQx1Yrl4E53svPNkDm/OVgKbMfkC2LfFXFTo
	cRid0bvA5AW9TTeyddG6N3k1jNWQVd9IdKDuUYv4rQ+Jst7+yWJNMeCVkPDaHv46
	WRsN33HoQamduaLqFchrsQW3Otlfd9QXJFvl4P4eezZ14j1YcwdyDL+aE8dNpK4R
	2ZJBqNP+hoTcbvLZ8JeyWXAbc8Q9K7igVWYc7XIxMlv33+mspmsnRZKHKClupHQ=
	=
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x47811jny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 11:33:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 42RBXOLf016159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 11:33:24 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 27 Mar 2024 04:33:20 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <quic_rohkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 0/2] ASoC: qcom: add support for qcm6490 machine 
Date: Wed, 27 Mar 2024 17:02:26 +0530
Message-ID: <20240327113228.1706975-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: Z3lhqVGDh-Q4A-UDq2D14sWQ0erGGnnZ
X-Proofpoint-ORIG-GUID: Z3lhqVGDh-Q4A-UDq2D14sWQ0erGGnnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=976 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270078
Message-ID-Hash: HAE6WCLJKSUZ7JXUU2GE4PU4T4TW2Y25
X-Message-ID-Hash: HAE6WCLJKSUZ7JXUU2GE4PU4T4TW2Y25
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAE6WCLJKSUZ7JXUU2GE4PU4T4TW2Y25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support for QCM6490 SoC machine driver.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,qcm6490: Add qcm6490 snd qcs6490 sound card
  ASoC: qcom: qcm6490: Add machine driver for qcm6490

 .../bindings/sound/qcom,sm8250.yaml           |   2 +
 sound/soc/qcom/Kconfig                        |  13 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/qcm6490.c                      | 173 ++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 sound/soc/qcom/qcm6490.c

-- 
2.25.1

