Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC506B178B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAFFD18CB;
	Thu,  9 Mar 2023 01:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAFFD18CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320393;
	bh=osJZjuWyacSnC4tVEI8mpa9ujNVpJes3MHwbIJke6yA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZ+ifQIcVHLCnWhkJjhNRwjzSdhdkwLAoMSkKVhsq7rNAREFNKbbak02FEnYSf7JQ
	 Ro0C3eUsCjYYPtzt6ARUmZvbMiofz4bqv7pv8eVH21DLYAejI0MmBOyOUOg9/MM6lF
	 lkDzmjNrAK79c6YsW0KJkxDQolqAV79KZlUxkTBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A15E5F80608;
	Thu,  9 Mar 2023 00:59:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25DCCF805C3; Thu,  9 Mar 2023 00:59:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 09C70F8055C
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09C70F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ESxYmXjI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328I8TW9006870;
	Wed, 8 Mar 2023 23:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=BRvk2kLNgan6ojfZTR0CbwIj105zOZeVc8bjIrsnSxQ=;
 b=ESxYmXjIimY90mMz1b9cKqB9G3pG2APNSiDvNC60LSC9OOxNEdcGiiFo4xAQMLnWf8pp
 8dWymqhCSPFscBy64WpECRKSnWv2MQr4aCyaFqljjsmslZNKh18hLXOHoM2MDdP8z0VV
 NDnCJ4ynMn09lmmOEEoDchUWC+jSJ/phvmTzsPzKagiW9O3kJJ0oQHNkHIlPPo57CK04
 PcPk6KOkUNAjt1nvocZ4d60yuBGXnIUpZF0BXzgb3RiSmS5u2YTSGR3aMTGND6fxqK45
 k7TM9B/2jo0KKdMZCMRl39KxZEPOSqA0K7sExKC1G+LzTVklsqIlNV9VvdAoUB0D8/2W QQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6ycb8rc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328NwD26011995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:13 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:13 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 28/28] sound: soc: soc-usb: Rediscover USB SND devices on
 USB port add
Date: Wed, 8 Mar 2023 15:57:51 -0800
Message-ID: <20230308235751.495-29-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6Xt0oWLi-UDbroR0pSOAm-5xvDT8uKZU
X-Proofpoint-ORIG-GUID: 6Xt0oWLi-UDbroR0pSOAm-5xvDT8uKZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: 37AATMIBNTPCCICE72K46IF6CJNF5NP3
X-Message-ID-Hash: 37AATMIBNTPCCICE72K46IF6CJNF5NP3
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37AATMIBNTPCCICE72K46IF6CJNF5NP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In case the USB backend device has not been initialized/probed, USB SND
device connections can still occur.  When the USB backend is eventually
made available, previous USB SND device connections are not communicated to
the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
callbacks for all USB SND devices connected.  This will allow for the USB
backend to be updated with the current set of devices available.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/soc-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 84dc6d0b2eab..a9413e3d18df 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -111,6 +111,8 @@ struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
 
+	snd_usb_rediscover_devices();
+
 	return usb;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
