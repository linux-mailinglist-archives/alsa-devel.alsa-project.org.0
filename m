Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7D943EDC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 03:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6767931EA;
	Thu,  1 Aug 2024 03:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6767931EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722475645;
	bh=vTcLhZf2R8paXkJQUxSXklktGwb+rhfT7p4hKA16e8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RqZrPS8xAXgsRWXiSQziZgwCGQL3JjPCuM6/PVKa1QxU+su/a2v6b8ZPSEjjPlnja
	 puFxi40w3ndF5AoMSfozd357J+QIcrUn5s/JGeSm5gGLiZ6X+Cr1ilDASkqSgmA9jI
	 IuKpYOG8K72xenqWwxTO33k/A57YzpiN56gBTrjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D6AF8974A; Thu,  1 Aug 2024 03:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CA9F89744;
	Thu,  1 Aug 2024 03:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFDE7F80579; Thu,  1 Aug 2024 03:18:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1524BF805AD
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 03:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1524BF805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ks56lpWC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46VDbKPV019111;
	Thu, 1 Aug 2024 01:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyF8k4GY10EkPruZFkeC0IFO
	j0f++wkbH8Kw38rv/5Y=; b=ks56lpWCRDw/YSLlu+4C5CgN8QVzwMJE8Je07zcn
	CzJ3tB4aHbtkQNiuZjijD7jz7ZW320wQsA+v8Qhghs8p1xHL26a4w/fvJxvb6aGy
	EJZOnmvthxYfnTSE2vUIGhz/aUrUchVHIiEFjnwIew1dVzQRH4yN+J9RiZ1AsD6P
	msCZWzdHSZVcHJn0eENOV9IFqYlBtO2v7c7HaQJ/ulwKU+OUs8Qx60i9OyJb5n3a
	H2YemQ4G0ZNeqYp5GChqy1yC7JluWc0KDm0O5JKBDS3fbCwuqMdG/BBRCUhWk2cX
	U8Y5EiaAqvrIKt8NnDN/1PPhIPjo+rPKmwMMpxEsuvla9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msnecwxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:17:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4711HlIY026907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:17:47 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 18:17:47 -0700
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
Subject: [PATCH v24 22/34] ALSA: usb-audio: Save UAC sample size information
Date: Wed, 31 Jul 2024 18:17:18 -0700
Message-ID: <20240801011730.4797-23-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 2HEEDNKlPc9K3y5juODjuS5z-kZGc6XL
X-Proofpoint-ORIG-GUID: 2HEEDNKlPc9K3y5juODjuS5z-kZGc6XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010005
Message-ID-Hash: TREI6RQFDN3LBK4XKRWUKGIXTKY5LQG5
X-Message-ID-Hash: TREI6RQFDN3LBK4XKRWUKGIXTKY5LQG5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TREI6RQFDN3LBK4XKRWUKGIXTKY5LQG5/>
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
