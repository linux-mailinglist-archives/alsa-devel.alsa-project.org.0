Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01F877047
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2AC741;
	Sat,  9 Mar 2024 11:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2AC741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979413;
	bh=un6WSCrH0nwZRCvTfsywl316B66p1DBPStSLUvF7JXU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i+GZq+4I2qJnm+F3eqXHYWnDJsAnmbJRNNqs1wBo9ZDfXd5vzVfJ3hUiv40k7UmyJ
	 ayR712cibhU702xqe2sVlSsSnlEnQvchXz5OVNTzAEQ4eNx16pYri2XrXQWDaetQUW
	 kCJkUNsXEJPFoZXJC7b1AhOwgbeW4uD1xSM2V2gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83EFDF80815; Sat,  9 Mar 2024 11:13:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CCE6F807C3;
	Sat,  9 Mar 2024 11:13:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8585DF8024E; Wed,  6 Mar 2024 11:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D068AF8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 11:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D068AF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=JA8trjj6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4268ewkp028060;
	Wed, 6 Mar 2024 10:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=5TxhWqAJYi09
	OyiGMAl/JFGwe7rxA4G2XCalQeFYGwU=; b=JA8trjj6fAuoQ8I7X9XmYP/VcjEA
	QjMquurDrnzhKc6NG69xBfR0mCrDhLrdNRvTwFP0QUByqZiOBzH6Thin2NyRw+UI
	OtHC/eA6T011vev+Gf0uHAM/ho1UQahIWPrcNLPu5a2KOv6l3qk0C1ygLLiGUeVD
	wX4SWAtb2ijXde3LglpqRveSpDAV54MV9kPSgUpkrJNIx8C2ivGsqblJMoU7X1rC
	CWtpCAjnfpwEjjKzg6z1iylEQBo5GCXVC+7d7xTfLGYHvSaxhALPaLIFvCREyYU5
	AEnwJvcsYT8mi3xWv5WDPsuEX5tWI7Akijuj7ymiIXAD1ubBrRYdx5KTcQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpbav1eu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:54:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 426AsA4m018092;
	Wed, 6 Mar 2024 10:54:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6ktcbx-1;
	Wed, 06 Mar 2024 10:54:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 426AsAcU018078;
	Wed, 6 Mar 2024 10:54:10 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-c-shalma-hyd.qualcomm.com
 [10.213.108.128])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 426AsApF018077;
	Wed, 06 Mar 2024 10:54:10 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 2341845)
	id C4DE13E1F; Wed,  6 Mar 2024 16:24:08 +0530 (+0530)
From: Shalini Manjunatha <quic_c_shalma@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Raghu Bankapur <quic_rbankapu@quicinc.com>,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Shalini Manjunatha <quic_c_shalma@quicinc.com>,
        linux-kernel@vger.kernel.org
Cc: Krishna Jha <quic_kkishorj@quicinc.com>
Subject: [PATCH V0 0/1] ASoC: soc-compress: Fix and add missing DPCM locking
Date: Wed,  6 Mar 2024 16:23:19 +0530
Message-Id: <cover.1709720380.git.quic_c_shalma@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OD4E1X52YD1L7EZ0FIIHkkEBesBmaHjP
X-Proofpoint-ORIG-GUID: OD4E1X52YD1L7EZ0FIIHkkEBesBmaHjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_06,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=868 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060086
X-MailFrom: c_shalma@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KQ44WJ2IPKGZGYVTS4UI2DOF57253KQA
X-Message-ID-Hash: KQ44WJ2IPKGZGYVTS4UI2DOF57253KQA
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQ44WJ2IPKGZGYVTS4UI2DOF57253KQA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We find mising DPCM locking inside soc_compr_set_params_fe()
before calling dpcm_be_dai_hw_params() and dpcm_be_dai_prepare()
which cause lockdep assert for DPCM lock not held in
__soc_pcm_hw_params() and __soc_pcm_prepare() in above flow
when ever we play compress offload audio playback use case.

To fix this issue added DPCM lock and unlock in both places of
above code flow mentioned.

Shalini Manjunatha (1):
  ASoC: soc-compress: Fix and add DPCM locking

 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.7.4

