Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836558152B1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 22:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8BEE7D;
	Fri, 15 Dec 2023 22:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8BEE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702677439;
	bh=nhv3Qt3Khj7q5b6QwN8vT0dGoOhmRuXB7sMjaOkqcOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mc4UlhiwnL3maHydBwu49dnjaxaNoiVRVSqzDv+meoctP1+wXO3GrRnkkS0iEENLp
	 NopC9Gs1X+d8Q7hbN5Cakg77qK0Y3UcGot9b9kTFqIctrVLt8sTIxSvdWvRW+Cb09p
	 pYFAovqcXXOvOJJcjzh20tLzsvsBfOH+/qC74hw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC092F80C97; Fri, 15 Dec 2023 22:52:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95865F80C08;
	Fri, 15 Dec 2023 22:52:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D418F80557; Fri, 15 Dec 2023 22:51:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DD63F80571
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 22:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD63F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=kMcLcem+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFIX7hf018833;
	Fri, 15 Dec 2023 21:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=OZnLJhD2Y8SzgZtjERKN
	5XYH/06eB2NK8W1vp8cBCS4=; b=kMcLcem+YU5EiGTFbbMLM3GT7mupXOB2TwCr
	K3dFaxZASLLeI4hdItRLRLA/m2wqloJoA/dPFSuTT0M8gCVUPrLTO4IURElJk/lM
	+9hulsUP82oOYlGphK1hnbJdRjMZkWbXCONq4dFWf+3t3TAS35iJ1ACUiWTU/gA6
	/Uq4wLOlk+zhcArrLiaEMqSIYSLOrCYQ0zjDgrNvxpsTqGJ6aANdglSeGxNM3GRU
	19zedYQZiBIA2+ualOBYKvoUMHuKNPjrkC4ys19/BnEJt6uwMb/vEeyPWWn8jtTF
	f5ynwrxf7rOKv7Wr2ZTQxZknmnhJIzfEq4GaHEsbyb7IXDOWXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0m46hnga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFLoCqL031466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 13:50:12 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v10 22/41] ASoC: qcom: qdsp6: Ensure PCM format is supported
 by USB audio device
Date: Fri, 15 Dec 2023 13:49:36 -0800
Message-ID: <20231215214955.12110-23-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231215214955.12110-1-quic_wcheng@quicinc.com>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mYtFXlqVWAzebi8717A3tasWmYfHzdxe
X-Proofpoint-ORIG-GUID: mYtFXlqVWAzebi8717A3tasWmYfHzdxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150152
Message-ID-Hash: SJYG2LZUIQ5I63ILECRYEUMTXXONBWWM
X-Message-ID-Hash: SJYG2LZUIQ5I63ILECRYEUMTXXONBWWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJYG2LZUIQ5I63ILECRYEUMTXXONBWWM/>
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
 sound/soc/qcom/qdsp6/q6usb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index bb37f2c58cf4..a3893ec96fe6 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -46,7 +46,11 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
 {
-	return 0;
+	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+	int direction = substream->stream;
+
+	return snd_soc_usb_find_format(data->active_usb_chip_idx, params,
+					direction);
 }
 
 static const struct snd_soc_dai_ops q6usb_ops = {
