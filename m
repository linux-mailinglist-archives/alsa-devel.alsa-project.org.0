Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E128B39D5
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 16:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC091211B;
	Fri, 26 Apr 2024 16:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC091211B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714141490;
	bh=dYh57E6ZQFNHZXIEQC6AnVwy5RS0Foaz8BUdG7uKogU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dueXlbWdtGyoV0E/nKgy5bcCM2ZSTSWQbvJQQst122E6w8LJ6VFiGu88/LNa8uDp8
	 5u/+NsiXRHRN0TXMfS30fqcUa8IuJ/XztLcTIXaZc/4010cUuc/x5yVMdrD9bMME8X
	 mKUl7t4Pr1QmQRa3YAsEl2LOSkmxUCGNrljsmK0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C7BF80609; Fri, 26 Apr 2024 16:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15134F80610;
	Fri, 26 Apr 2024 16:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A20E6F80423; Fri, 26 Apr 2024 14:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F6D8F8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 14:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6D8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Q/okE3gT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43QBdJgL011896;
	Fri, 26 Apr 2024 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=fHEAhtk
	w2wOoewJBYMs/2MEtu56/1mA6pRiADYx7uCk=; b=Q/okE3gTGMdnRj5Q6etX5yv
	OWmDLBFHKWmhfBMmRImGE0JvHEPulvsghahGPWjUWsA+D/2OVkjimZk8nQimLnIj
	r5gCIxXMlYlOWVzZZzPFJxs2a5qkE2DcKPfOAaK/1rvPmfR5SUwg1s4YPbyjpyIF
	oQGXbtucyrk5EFeCSkvjKD8lBEWoMOVFW4BdQIdM+ErOB8v7M6SH6W79cBZ/2Ybq
	L5Ot9ZqTtmdm5iFJOuafZNIlznc9IxKE+xkO+akwHdgMtQ8AkQA0UDh8WG420dpL
	GdtSn/03nM1cSMxqAgSF55Ko92TZR5BjMYhF7TJXnyzRDWC0ckG2b3GYNzHk8yg=
	=
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr3591t0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 12:25:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43QCPf37005147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 12:25:41 GMT
Received: from hu-kuruva-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 26 Apr 2024 05:25:35 -0700
From: Rajashekar kuruva <quic_kuruva@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Rajashekar kuruva <quic_kuruva@quicinc.com>
Subject: [PATCH] [RFC PATCH] ALSA: usb-audio: endpoint: Prevent NULL pointer
 deference in snd_usb_endpoint_close
Date: Fri, 26 Apr 2024 17:55:11 +0530
Message-ID: <20240426122511.547755-1-quic_kuruva@quicinc.com>
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
X-Proofpoint-GUID: 3qfEpPMRQq5Ur703ay_jX8btNchQt73f
X-Proofpoint-ORIG-GUID: 3qfEpPMRQq5Ur703ay_jX8btNchQt73f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=968
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260082
X-MailFrom: quic_kuruva@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GWCQ3RG4NO5H55QZT72J3Z5CXUEBTQRQ
X-Message-ID-Hash: GWCQ3RG4NO5H55QZT72J3Z5CXUEBTQRQ
X-Mailman-Approved-At: Fri, 26 Apr 2024 14:23:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWCQ3RG4NO5H55QZT72J3Z5CXUEBTQRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When multiple plug-in and plug-out events occur,
there is a risk of encountering a NULL pointer dereference
leading to a kernel panic during a headset use-case.
this issue arises in the snd_usb_endpoint_close function

To avoid check if ep->iface_ref is not null before decrementing
its opened count. If ep->iface_ref is null, we skip the decrement
and the subsequent logic.

Signed-off-by: Rajashekar kuruva <quic_kuruva@quicinc.com>
---
 sound/usb/endpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8f65349a06d3..0e3101b7e392 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -950,7 +950,7 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
 		      ep->ep_num, ep->opened);
 
-	if (!--ep->iface_ref->opened &&
+	if (ep->iface_ref && !--ep->iface_ref->opened &&
 		!(chip->quirk_flags & QUIRK_FLAG_IFACE_SKIP_CLOSE))
 		endpoint_set_interface(chip, ep, false);
 
-- 
2.25.1

