Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4691B877049
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:17:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5C214E3;
	Sat,  9 Mar 2024 11:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5C214E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979440;
	bh=BCOyQaski6VQlTYoUq01OxZVmiyxRSehT78bucUqV40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:List-Id:List-Archive:List-Help:List-Owner:List-Post:
	 List-Subscribe:List-Unsubscribe:From;
	b=vCYum0KdJA5Q0O8TXXLLmJgE8lS1lZCBWKUhJZn+UanG9E8+rOhAwp6Y0kZB9tv2Z
	 V0eEwn/nNK3AH1MROfoNrlNAMbYGHMjdAWR+EVU5oaFPf12OADCkchaZfhQAZkgkMt
	 abF/Rq9r3BXyA6bApD97l+z/MVA9cbrxvheBEFak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07AC6F8087C; Sat,  9 Mar 2024 11:13:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F90F8080B;
	Sat,  9 Mar 2024 11:13:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D88D8F8024E; Wed,  6 Mar 2024 11:54:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EBEC1F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 11:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEC1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=HJ2iGKjE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4266jsY7031466;
	Wed, 6 Mar 2024 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references; s=qcppdkim1; bh=6KdBFHDx0oq3RNnkz99R68M
	tuO2GPsYXR0khb5BCPBU=; b=HJ2iGKjE7vqFN/t3yQeTVV1zpbFhFWM/SOL8O3s
	M/lRtEzryqRPcRLROL5gySnSDq6oK95tBcoJEiVucPSox3wq4c/MOsGJe4Ez5a/F
	246khxrDbEPvzDrmJeCvOns3iRKAZd/91PeQ6j8XlcvC2DC+NShPoI0ktY9Git1t
	QG1nXWux7JmX0NyYNipeaLArekg3epZ+YnhMdOZqK42dmvc2i0D+XI8NdeFZ4LJa
	KS7/O7XW0N66gDq8V5F0OTa+fC6uGq143jan0fm7gGr/s6FyOwnzp7kMjsc8a2TR
	5LKOy1beW36SauBhn46RBqJAgk3Oj51VAmMmK6jbukoHyow==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpjy3rjha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:54:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 426AsAQK018102;
	Wed, 6 Mar 2024 10:54:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6ktcdx-1;
	Wed, 06 Mar 2024 10:54:22 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 426AsMYT018187;
	Wed, 6 Mar 2024 10:54:22 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-c-shalma-hyd.qualcomm.com
 [10.213.108.128])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 426AsMOh018186;
	Wed, 06 Mar 2024 10:54:22 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 2341845)
	id 007DC3E1F; Wed,  6 Mar 2024 16:24:20 +0530 (+0530)
From: Shalini Manjunatha <quic_c_shalma@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Raghu Bankapur <quic_rbankapu@quicinc.com>,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Shalini Manjunatha <quic_c_shalma@quicinc.com>,
        linux-kernel@vger.kernel.org
Cc: Krishna Jha <quic_kkishorj@quicinc.com>
Subject: [PATCH V0 1/1] ASoC: soc-compress: Fix and add DPCM locking
Date: Wed,  6 Mar 2024 16:23:20 +0530
Message-Id: 
 <d985beeafdd32316eb45f20811eb7926da7a796e.1709720380.git.quic_c_shalma@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1709720380.git.quic_c_shalma@quicinc.com>
References: <cover.1709720380.git.quic_c_shalma@quicinc.com>
In-Reply-To: <cover.1709720380.git.quic_c_shalma@quicinc.com>
References: <cover.1709720380.git.quic_c_shalma@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nenwcDJD0jq7Q5O_-5RFb3qGmO7txTkn
X-Proofpoint-ORIG-GUID: nenwcDJD0jq7Q5O_-5RFb3qGmO7txTkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_06,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=997
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060086
X-MailFrom: c_shalma@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OVGHU6LJC4ZWVWDTP7ST4BWPBE4LWZ6S
X-Message-ID-Hash: OVGHU6LJC4ZWVWDTP7ST4BWPBE4LWZ6S
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVGHU6LJC4ZWVWDTP7ST4BWPBE4LWZ6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We find mising DPCM locking inside soc_compr_set_params_fe
before calling dpcm_be_dai_hw_params() and dpcm_be_dai_prepare()
which cause lockdep assert for DPCM lock not held in
__soc_pcm_hw_params() and __soc_pcm_prepare()

Signed-off-by: Shalini Manjunatha <quic_c_shalma@quicinc.com>
---
 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index a38fee4..e692aa3 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -385,11 +385,15 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
+	snd_soc_dpcm_mutex_lock(fe);
 	ret = dpcm_be_dai_hw_params(fe, stream);
+	snd_soc_dpcm_mutex_unlock(fe);
 	if (ret < 0)
 		goto out;
 
+	snd_soc_dpcm_mutex_lock(fe);
 	ret = dpcm_be_dai_prepare(fe, stream);
+	snd_soc_dpcm_mutex_unlock(fe);
 	if (ret < 0)
 		goto out;
 
-- 
2.7.4

