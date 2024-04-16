Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424298A6430
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 08:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D60A14DC;
	Tue, 16 Apr 2024 08:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D60A14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713249726;
	bh=M5Wa6crHEkD3a3VHlCsqpO4QfRC6Cok5qz9sFUaseHU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s/z16ODyfpGx+QYee21DJ9L/XAwVSvVARNnUM5rVv3kk7iTP2GF+eg1wYXSscHYTi
	 ESmuJc95Jkp17pJTT59xU7Sv7ePBmMH3scJist40sPVYb5M71HO53utsRGXi8jbHPG
	 n7h6xEEdSnseL9GsaRHT1BoP0FDWLhdpEgMdgmeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAE60F805AC; Tue, 16 Apr 2024 08:41:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F0C4F805AC;
	Tue, 16 Apr 2024 08:41:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91395F80423; Tue, 16 Apr 2024 08:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1E9FF80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 08:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E9FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KS0USu8F
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43G4MRN3016812;
	Tue, 16 Apr 2024 06:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=UeKcPO/
	ODOIZ1nq+8daZBpYFzGCc0viJZ7fkS9Zr3RQ=; b=KS0USu8F9pio3Gk/BNguhwh
	n/NduuOtIAxq1ogIj1deEo2iMs6LSDDHi+ZVF84Nlo/fd8q4KQFU524Xn1Ob8FlM
	TMdD3mKnfLDJZwmjgCcZyNQ1MCs/ZlegyLebrq44QQ6VjUw+ljFu7GFEdIxHPXRp
	5+xitfMZy4cv8wBzgSKnaA3iEIJOYkBhXPwWwgKZp6LtlFVqnkIpMkepUfaq+gZn
	k1vB2otheU1HbGirFjCxZHxO/iyGBwhQR9DDK3n4+2BwaKnsTbYDqDviFXxh3Mao
	jeAVKezIL48C8OuhKu8zZMdWpoH64HGQ2Z2mIAunL9TQN/1e/QMj2/QSj5GkUfw=
	=
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xhftw0n2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 06:36:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43G6aVf7027581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 06:36:31 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Apr 2024 23:36:27 -0700
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
Subject: [PATCH v2 0/8] ASoC: codecs: wcd937x: add wcd937x audio codec support
Date: Tue, 16 Apr 2024 12:05:52 +0530
Message-ID: <20240416063600.309747-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: T6emtMP2KZbr0mCYMBjhZWrN2laHjJYw
X-Proofpoint-ORIG-GUID: T6emtMP2KZbr0mCYMBjhZWrN2laHjJYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_04,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxlogscore=624 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404160039
Message-ID-Hash: MY2GBF2DRMIDB7WQAGRRZGZJFKRP2IYB
X-Message-ID-Hash: MY2GBF2DRMIDB7WQAGRRZGZJFKRP2IYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MY2GBF2DRMIDB7WQAGRRZGZJFKRP2IYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support for Qualcomm WCD937X codec.

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

Changes since v8:
 - Split the patch per driver for easier review as suggested by Krzysztof
 - Used devm_gpiod_get api to get reset gpio as suggested by Krzysztof

Prasad Kumpatla (8):
  ASoC: dt-bindings: wcd937x: add bindings for wcd937x
  ASoC: codecs: wcd937x: add wcd937x codec driver
  ASoC: dt-bindings: wcd937x-sdw: add bindings for wcd937x-sdw
  ASoC: codecs: wcd937x-sdw: add SoundWire driver
  ASoC: codecs: wcd937x: add basic controls
  ASoC: codecs: wcd937x: add playback dapm widgets
  ASoC: codecs: wcd937x: add capture dapm widgets
  ASoC: codecs: wcd937x: add audio routing and Kconfig

 .../bindings/sound/qcom,wcd937x-sdw.yaml      |   71 +
 .../bindings/sound/qcom,wcd937x.yaml          |  119 +
 sound/soc/codecs/Kconfig                      |   20 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd937x-sdw.c                | 1148 +++++++
 sound/soc/codecs/wcd937x.c                    | 3036 +++++++++++++++++
 sound/soc/codecs/wcd937x.h                    |  655 ++++
 7 files changed, 5056 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.c
 create mode 100644 sound/soc/codecs/wcd937x.h


base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
-- 
2.25.1

