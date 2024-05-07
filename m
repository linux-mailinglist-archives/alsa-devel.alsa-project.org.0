Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCA8BED75
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 22:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859DEDF8;
	Tue,  7 May 2024 22:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859DEDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715112044;
	bh=ltXX8jP7pn8uVpu5KSPpn79cIYm5HfBGTiCUp+UHg9k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d5AtO1JtoVpXWPHLcEfuEBCL8uTksbUyFzFIVtrmWxbz5oRxmCkW4e9ih/X0SjHw/
	 HJ6a8MMYrDGyQ3uRxpCvCI2/gOBebIRoUd+f91G1GygnVZz7pkOtQ5/uaSEs39ENTC
	 6OExE+4Z9xiZ35vWtRss1/olHBgAomYnwNd6PCak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2E47F8061C; Tue,  7 May 2024 21:56:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F47F80C77;
	Tue,  7 May 2024 21:56:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C06F80423; Tue,  7 May 2024 21:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67B9FF8057D
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 21:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B9FF8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hGs2ZB44
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 447JpY2e001074;
	Tue, 7 May 2024 19:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=AN6ZcvMWlqNjOXpEc6Fd
	iWAhkqYqJERCJ3muWeL5xeM=; b=hGs2ZB442V6gb2Ha5owN12aF4CU4DZFglYFL
	m19eUjTW9fukMhJfpJdjv75h0TitLZu9hWVD2HH+Vv9yfXeGHerJTFeHiZig6pLy
	5pNhITXNWma1EvUyGXZs0uT+J2d416yciYWyfFSYNYRsrFWTqVmQ+8Sez6TxDHGc
	eEPR3Xbyl6n4S7QZkI73MGBJOepmOG57nVQadcRiwFk7sAvf651mJxa+Q4ZRp2UB
	A9MPpNF+m8w9WohyDOA8w/6P+c815qfIkzv3yV0pvX4H7hDW8Q88pf4AtqwR8R0K
	dUja0Gto4xLQ9PPEQMZJLw4n+fQ2hW8kbnjJhbGk2y98RaoA1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspgg4np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 447JpWqt007186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:32 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:31 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 16/39] usb: host: xhci-plat: Set XHCI max interrupters if
 property is present
Date: Tue, 7 May 2024 12:50:53 -0700
Message-ID: <20240507195116.9464-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cTrXuICcTRJtH0-s2paja7c2I8JlY1-s
X-Proofpoint-ORIG-GUID: cTrXuICcTRJtH0-s2paja7c2I8JlY1-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070138
Message-ID-Hash: WGU6CI2Q573HYS7YUYAECK5W7W4LQFDG
X-Message-ID-Hash: WGU6CI2Q573HYS7YUYAECK5W7W4LQFDG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGU6CI2Q573HYS7YUYAECK5W7W4LQFDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some platforms may want to limit the number of XHCI interrupters allocated.
This is passed to xhci-plat as a device property.  Ensure that this is read
and the max_interrupters field is set.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3d071b875308..1c12cadc02a1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -258,6 +258,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+		device_property_read_u16(tmpdev, "num-hc-interrupters",
+					 &xhci->max_interrupters);
 	}
 
 	/*
