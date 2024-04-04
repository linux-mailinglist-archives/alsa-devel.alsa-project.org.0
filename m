Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B7C89838A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 10:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFA02C7E;
	Thu,  4 Apr 2024 10:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFA02C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712220901;
	bh=C0B534tETcSiSi2d2a5k3Mlzf8TIAyJoW2nw7gAaT4k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e4PxJ6DuIFp9TD147XIrWLFEvE7lqYJ0EpluPIXl5sYMzNavqaFoMR3Ar6M8AKGIa
	 /MVDp1o/b4MnXJi6b3KZ2CkiIm7mzl3k7oJBcAPz+x1B5lf+4fM/7O2KzRljjk1DsZ
	 4S8wZyDyzA/VEHvDf3eJ4JjtQnZK7dqkZhSK7fLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0598F80236; Thu,  4 Apr 2024 10:54:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A95CBF805F5;
	Thu,  4 Apr 2024 10:54:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB5FAF80238; Thu,  4 Apr 2024 10:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BD31F80130
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 10:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BD31F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Y4kT5zBv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4348T9K3031265;
	Thu, 4 Apr 2024 08:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=ySSQu01
	uxqxgU7lEYH4fWRZQEzBl+iPrmYmI64On0hY=; b=Y4kT5zBv661yKGkgyEKI4UD
	sZ3f3OJIkqRA3x5NMigGS3kcfmFRU+SA2mzEI88R7ut91CxvOwY+v1Vvp6Zo2JJK
	jd9Jjv/jn/e9IZYUpDVIDjo41zECnY4cVuSDe8MpbbfAAJBagyPLvux02DgDVIgD
	/V+by6UYgIvgN3UAClS+srT905dAMZIAfDEtPXdtxhcmmgfaA70ehqHC/AL7Kmb2
	CLbfZg4/ScC3LEeu0vDQBw+xYIVg+GOFi7NOGh0bVn8epRgcY+hvXbo80MEC46y2
	s353P0HJKg6UYqV1TH5F47+7SCXSu26zdUykObZ2IVVIaBJiTQxAQi8T0F5VdmQ=
	=
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x9ep3rymj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 08:47:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4348lOU5003300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Apr 2024 08:47:24 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 4 Apr 2024 01:47:19 -0700
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
        "Mohammad Rafi
 Shaik" <quic_mohs@quicinc.com>
Subject: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
Date: Thu, 4 Apr 2024 14:16:29 +0530
Message-ID: <20240404084631.417779-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: qEExjceD8F6__3ATV3Ifli7EUgQDJGFS
X-Proofpoint-GUID: qEExjceD8F6__3ATV3Ifli7EUgQDJGFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-04_04,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 mlxlogscore=662 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404040058
Message-ID-Hash: 3JVOTTTHDSBKYFHVNJUJJ6624LBMG6ZU
X-Message-ID-Hash: 3JVOTTTHDSBKYFHVNJUJJ6624LBMG6ZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JVOTTTHDSBKYFHVNJUJJ6624LBMG6ZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support for sound card on Qualcomm QCM6490 IDP and
QCS6490 RB3Gen2 boards.

Changes since v1:
	- Use existing sc8280xp machine driver instead of separate driver.
	- Modify qcs6490 compatible name as qcs6490-rb3gen2.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
  ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1

