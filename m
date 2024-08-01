Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B1943EF1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 03:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAFE3318;
	Thu,  1 Aug 2024 03:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAFE3318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722475735;
	bh=zXJYxoowjLCGGs/moXG9k9H4KOG3qRzqvJSx6i1jyIo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rqm7atoxAxWMGU2y69c1I22dglN4eTF6nqwrASte/EfsFUshqgvsuo4Rns9iW17t7
	 3VRsi+Y9SJAIcI5tTF7S8BYT04z1VLx2fFiwxHPnXYsba+3ih05eEj0nHGEjREt5F8
	 4IOd8LywPtc1tz+533n3celu/7rABMwWnRSdrTWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE11FF897DE; Thu,  1 Aug 2024 03:21:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2647EF897D9;
	Thu,  1 Aug 2024 03:21:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459B7F80579; Thu,  1 Aug 2024 03:18:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E22BF805C2
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 03:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E22BF805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=QCrL/2X2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46VLAJRX006082;
	Thu, 1 Aug 2024 01:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YyrBOfLud+dH9tBesRDPfRK
	DGs1gz1i/U8ghzKbd2E=; b=QCrL/2X26/TttjkdVba8u7UWZ/eIR4QHx57yZWVN
	3izM0hmOOoYt+JBp8jlRlxHwJ+idRD1XSs7CU/F25tQM1jbdOT+LWuPiEk0xmIv0
	WNYaADRaL90O+c3HJNlEefLNfh4dAKifqG6c93VHYefyfKKu+fHq6y9onQ3+gzHZ
	5TZSq74wI6xQPxGXM31osGtYuosZgkT0SfVMrrrR+Om+neCWsLYDCzrIMAyCZY3q
	eM72P5L6wgG3qav83q2pAl/Wtd09MfIpQi9vL/1+YdOpEuUTXYl70yknjxKzGspk
	zEm3v7hqzifExoTj4h1l+kLHW2QSOhOgc/w78cScudErpg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq5278fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:17:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4711HpNI026929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:17:51 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 18:17:50 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v24 34/34] ASoC: qcom: qdsp6: Ensure PCM format is supported
 by USB audio device
Date: Wed, 31 Jul 2024 18:17:30 -0700
Message-ID: <20240801011730.4797-35-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240801011730.4797-1-quic_wcheng@quicinc.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9LmxEnlmigDKbRJHAXQqAhHAThcfJJS3
X-Proofpoint-ORIG-GUID: 9LmxEnlmigDKbRJHAXQqAhHAThcfJJS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010004
Message-ID-Hash: CR5C4VNT252BZUJFWRU2IRTQ3I66VDS3
X-Message-ID-Hash: CR5C4VNT252BZUJFWRU2IRTQ3I66VDS3
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CR5C4VNT252BZUJFWRU2IRTQ3I66VDS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check for if the PCM format is supported during the hw_params callback.  If
the profile is not supported then the userspace ALSA entity will receive an
error, and can take further action.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d8f1bb4ec497..9a3fb3cb32b2 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -52,6 +52,7 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int direction = substream->stream;
 	struct q6afe_port *q6usb_afe;
 	struct snd_soc_usb_device *sdev;
 	int ret;
@@ -63,6 +64,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	mutex_lock(&data->mutex);
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
 
+	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
+	if (ret < 0)
+		goto out;
+
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
 	if (IS_ERR(q6usb_afe))
 		goto out;
