Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A49715C6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 12:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24A0823;
	Mon,  9 Sep 2024 12:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24A0823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725879435;
	bh=SZKP8xg/qyZzQnZu6J7kE/Q1QRLNmUJGqGxHhrxB+wg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rpo2sk9nMIqrkgK+ppAYVSYG9Q1B5kmKIDidpBYQh0FhaSBp0jKR5Or1k9IyoYSsA
	 pk6SD8Q+1dOONoyZyIDYEUCP9+NBe3BJedBuNAhzlPIPjrdcSJwUHEPZWI+70EmVU/
	 P3UpVVysnwv/Ve1UMB59SMIv+Or/gpne7zNqDkN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1CFCF80527; Mon,  9 Sep 2024 12:56:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B100F805B2;
	Mon,  9 Sep 2024 12:56:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05319F801F5; Mon,  9 Sep 2024 12:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 737DCF800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 12:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737DCF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VieqZ832
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4899JpWi029477;
	Mon, 9 Sep 2024 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B74tMf/CUUzR3FTBRoD1ZT
	xOcnNObTJ8iLOoR7N3lnc=; b=VieqZ832dfbAdjYmo0cOvi2V28Ob0uw2BCQSWO
	AT3148mJ34iU69ns6bfOKAjAF/SNUZtIOwIMrGvM+3Gia2zo3aYC9NySmdvkuvfB
	zesbrA0Wo9Z8Tjl3062BQARSCKC4OggsSbnOINDlX9VSZr+XJXxc5BmASVB9mFw0
	DVA1X60gdiU5flqz1iwnISLJ/l2bCgvqDQJBqPskv2h44dFFhY5aKyiWAbhnhnRp
	vgObJgUt5Z/2HDqPluUhb8Z89AHIAO2tCCAdldKJhjmg7aHc/vMBIefbO4BVhow2
	AKoQstXWJ/Dv7+qxBzkFDGbCv6Vq+U+sYRywrL78JANfoZKg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpjjdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:56:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 489AuXQ4007051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:56:33 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:25 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 0/4] Add static channel mapping between soundwire master
 and slave
Date: Mon, 9 Sep 2024 16:25:43 +0530
Message-ID: <20240909105547.2691015-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: cHttXC1flPaM2E5vZPuw3jjaJlUBj-fV
X-Proofpoint-GUID: cHttXC1flPaM2E5vZPuw3jjaJlUBj-fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090087
Message-ID-Hash: NQ2PEL2FXXEX7YAFU2OLOYPTOCH7FKOO
X-Message-ID-Hash: NQ2PEL2FXXEX7YAFU2OLOYPTOCH7FKOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQ2PEL2FXXEX7YAFU2OLOYPTOCH7FKOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add static channel map support between soundwire master and slave.
This patch series will resolve channel mask mismatch between master and slave.

Scenario: wcd937x AMIC2 usecase

                          Master                 Slave (wcd937x)
                     +--------------+           +--------------+
                     |  +--------+  |           |  +--------+  |
         AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
         AMIC2 ----->|  |        |  |           |  |        |  |
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
         AMIC3 ----->|  +--------+  |           |  +--------+  |
                     |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
                     |  |        |  |           |  |        |  |<-----------AMIC3
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     |  +--------+  |           |  +--------+  |
 DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
                     |  |        |  |           |  |        |  |<-----------MBHC
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     |  +--------+  |           |  +--------+  |
 DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
                     |  |        |  |           |  |        |  |
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     +------------- +           +--------------+

For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
for Master required PORT1 with channel mask 2,

In existing design master and slave configured with same channel mask, it will fail
AMIC2 usecase.

The New design will help to configure channel mapping between master and slave from
device tree.

Mohammad Rafi Shaik (4):
  ASoC: dt-bindings: wcd938x-sdw: Add static channel mapping support
  soundwire: stream: Add set_master_channel_map() to set static channel
    mapping
  soundwire: qcom: Add static channel mapping support in soundwire
    master
  ASoC: codecs: wcd937x: Add static channel mapping support in
    wcd937x-sdw

 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 ++++++++++
 drivers/soundwire/qcom.c                      | 18 +++++++
 drivers/soundwire/stream.c                    | 16 ++++++
 include/linux/soundwire/sdw.h                 |  5 ++
 sound/soc/codecs/wcd937x-sdw.c                | 52 ++++++++++++++++---
 sound/soc/codecs/wcd937x.c                    | 12 ++++-
 sound/soc/codecs/wcd937x.h                    |  6 ++-
 7 files changed, 126 insertions(+), 11 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.25.1

