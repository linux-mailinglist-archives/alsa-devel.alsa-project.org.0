Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6864A8AD7A7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 00:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C80F50;
	Tue, 23 Apr 2024 00:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C80F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826277;
	bh=vTcLhZf2R8paXkJQUxSXklktGwb+rhfT7p4hKA16e8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sglXj2Y8IttB9JmQ67nsT+G3OiDQ8gn+4mu8vk/UE85gkFCNrxAXGH6cGof/Flavw
	 UeSx8YzLf0ru1P1AAvF4Xrnq6RzkKMaOsf9XuOaOzbSfl7UWyEqKMk0KwrkcyCU/cC
	 IAel/r+oqGtDR0jFlWOoRk4BgoghtclpSkLIYKvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28F2F80642; Tue, 23 Apr 2024 00:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9110BF80640;
	Tue, 23 Apr 2024 00:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8EACF802E8; Tue, 23 Apr 2024 00:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FAE3F80568
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAE3F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=JPzSKQbK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MMcPMk029262;
	Mon, 22 Apr 2024 22:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=uyF8k4GY10EkPruZFkeC
	0IFOj0f++wkbH8Kw38rv/5Y=; b=JPzSKQbKH+93u1ZWmi5lMXWh75v4cvRlpFW7
	+OmI3JDYFNudMkdFD1FxoHnbavy0ev4YwHT+6bVa9J9v0fWzxOfVXCQPK9yQVow0
	ebAqkzqKX4xAebscEFdrDHpEvVy++3fRsCBYJKVOp7jZBGjJWu5La83Lv6bMXmOx
	0uHQWOkoh2PmPaOu72dYSj562EPZrFRkQvAkvNENSQrfTE5m2VmmZIHq7lhhxD4l
	2jF6AVUxFUWyxkf2dDQDWyZY7bx930oRWy29eGVUSJ/YYRyipaPs0Sk1O5RmR8DB
	uV5/6CgyIp0VKVOD7xAvG8GmuXK6qRfOxUPc3VSVUJJCCTCtMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82hskg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnLIm003455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:21 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:20 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
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
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v19 16/41] ALSA: usb-audio: Save UAC sample size information
Date: Mon, 22 Apr 2024 15:48:41 -0700
Message-ID: <20240422224906.15868-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422224906.15868-1-quic_wcheng@quicinc.com>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a2xhA_1FQctqc7S3LNpgOrs8gad5QsBa
X-Proofpoint-ORIG-GUID: a2xhA_1FQctqc7S3LNpgOrs8gad5QsBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: 7MWOH65JTSXS2QDW6F35LRSMU2USTAOS
X-Message-ID-Hash: 7MWOH65JTSXS2QDW6F35LRSMU2USTAOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MWOH65JTSXS2QDW6F35LRSMU2USTAOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Within the UAC descriptor, there is information describing the size of a
sample (bSubframeSize/bSubslotSize) and the number of relevant bits
(bBitResolution).  Currently, fmt_bits carries only the bit resolution,
however, some offloading entities may also require the overall size of the
sample.  Save this information in a separate parameter, as depending on the
UAC format type, the sample size can not easily be decoded from other
exisiting parameters.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h   | 1 +
 sound/usb/format.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 2884912adc96..02e4ea898db5 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -15,6 +15,7 @@ struct audioformat {
 	unsigned int channels;		/* # channels */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int fmt_bits;		/* number of significant bits */
+	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
 	unsigned int frame_size;	/* samples per frame for non-audio */
 	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3b45d0ee7693..5fde543536a8 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -80,6 +80,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	}
 
 	fp->fmt_bits = sample_width;
+	fp->fmt_sz = sample_bytes;
 
 	if ((pcm_formats == 0) &&
 	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {
