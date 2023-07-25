Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6B7605D2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:40:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D890E8B;
	Tue, 25 Jul 2023 04:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D890E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252849;
	bh=HoBWBnezRc6T8hETDEiEksGLWLvXmZ5som5dGevk2XU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMeFpwtzA+Fsi8kT1qGFT+o/rL74DqNZKXyuJf3PIRR8pdOguYtTq/wPueCrSOO07
	 lWNVgKJI4sucEsv6EUslsXzYPwvMqsE+hSKWeK5HNr6FkaSDomBjUe/FTuB+jBzVSz
	 DvDc1fRqhXO8ynD+f13zwRQhD/k65aGoe31uwsV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A15BF80649; Tue, 25 Jul 2023 04:35:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C17F80641;
	Tue, 25 Jul 2023 04:35:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04BFBF80620; Tue, 25 Jul 2023 04:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90DDFF8055C
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DDFF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=c7/NAGi6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P1pb9q006545;
	Tue, 25 Jul 2023 02:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=S2raLwpzRmFfbrP8xkjx4wwRNfOGhRngk40RhC3UeSM=;
 b=c7/NAGi63uNYlBehKC38Y+YN8JNyMtuSB+xyX3zgtorBXKMBLKDIjPVHaDTTB+PHfUL8
 IXuTDLCi9rqS0R1qcN6UgMXeoMZxQt8ixJBUHVcJ1oX8G9NkMH2npg6FDVLdKqP7VB1i
 bMk2QIAQsPbAVhRzrasPLMaP/qIpx4ZPwQjMpWSF9VMiZP4pr1w2FXnzrZnUB/4p5A5K
 a4nAhr7pLy+hddw+/VRWUxn+D8Qf2kj9FVKLKfvejtTBYxipzGoj/3MBtan+yrMBakGA
 do/JEB8BS3S2kaMgIvMcgMMshMCgHaExucl3fmTgfahlv0s86ejSRMnkRsnXR4Sgdc0O DA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1sr71kfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:41 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YZAL012145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:36 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:34 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 09/32] ASoC: qdsp6: q6afe: Increase APR timeout
Date: Mon, 24 Jul 2023 19:33:53 -0700
Message-ID: <20230725023416.11205-10-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230725023416.11205-1-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lrqXkDObF_01M7WoykjsSwRYM3TS_ikf
X-Proofpoint-ORIG-GUID: lrqXkDObF_01M7WoykjsSwRYM3TS_ikf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=823 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250021
Message-ID-Hash: MR6CMRZACI5VWZBCKQTEDL7TSNECJNKC
X-Message-ID-Hash: MR6CMRZACI5VWZBCKQTEDL7TSNECJNKC
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MR6CMRZACI5VWZBCKQTEDL7TSNECJNKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For USB offloading situations, the AFE port start command will result in a
QMI handshake between the Q6DSP and the main processor.  Depending on if
the USB bus is suspended, this routine would require more time to complete,
as resuming the USB bus has some overhead associated with it.  Increase the
timeout to 3s to allow for sufficient time for the USB QMI stream enable
handshake to complete.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 43baf93f9c89..e9d5fa6b6b0d 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -365,7 +365,7 @@
 #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
 #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
 
-#define TIMEOUT_MS 1000
+#define TIMEOUT_MS 3000
 #define AFE_CMD_RESP_AVAIL	0
 #define AFE_CMD_RESP_NONE	1
 #define AFE_CLK_TOKEN		1024
