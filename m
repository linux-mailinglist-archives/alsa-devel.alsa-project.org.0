Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13478CEA9
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E9AE8F;
	Tue, 29 Aug 2023 23:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E9AE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343766;
	bh=8m3CZnp318W9Cdg2Zji2CdTaZ7vTqCwTs9XJbJCHHOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l3J+Pv7Mi0Z5b87F52w0O913AvbpY1oIYaBxeA8jsNdqCS99hFUG2i1DAqqAdG93J
	 FfqajXCj4fUFLSKgVaMiGXfE8vEDZlRo4w+YQcMPezMqmOUCWZM1Q/l124FFzSmSTK
	 2FzkOdNDkZL40y81uOPAKnVY01Rxll+Thxh/Qsz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F8EF805AE; Tue, 29 Aug 2023 23:09:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C9EF805A0;
	Tue, 29 Aug 2023 23:09:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B770F80640; Tue, 29 Aug 2023 23:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BA58F8057A
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA58F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EFEf506a
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKUgsI021675;
	Tue, 29 Aug 2023 21:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=v88cF5DfrmQ11xFFw1qondVS974WsoPZKgPh8eL+d3w=;
 b=EFEf506a2+MBAJotH9rquPoZjZkOHmbJK7ljiVut+4L8ankB9OlElMVEAlJKD554MG+c
 SroZMyhH3pgWiR2ntG6nC4utcP0v7ml3ysjt5N1KjgXw0DxjOJzeofPfUNtod9yJpk0A
 rGTAmH5+IL1OzFa4OyD6e3dJHvyIfXkNMk1qYlOaYMGLnbC00yOQKd3gfWITiNN0FSU8
 flBY34PaBWXOtZYF05+mwXjB8yhl4fwmwb1ZNM9/Ir43ODs3sF7Z0zOhFipHQIr0CjOh
 a2r919+9T3bKlM+dmCVR/FYpl26m4nTEGXcfjR6un7E//JQ5xlsJyY1uk7C3At66X1yU aQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssjvb0tyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:13 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL7Cto016195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:12 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v5 16/32] usb: host: xhci-plat: Set XHCI max interrupters if
 property is present
Date: Tue, 29 Aug 2023 14:06:41 -0700
Message-ID: <20230829210657.9904-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230829210657.9904-1-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7ohFPUkHH3r5vqI--Og9onTK_CsOYRvm
X-Proofpoint-GUID: 7ohFPUkHH3r5vqI--Og9onTK_CsOYRvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290182
Message-ID-Hash: 4QFXV6XKOV75ULFH52XEBPX2SH24HMVO
X-Message-ID-Hash: 4QFXV6XKOV75ULFH52XEBPX2SH24HMVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QFXV6XKOV75ULFH52XEBPX2SH24HMVO/>
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
index 28218c8f1837..d01318f89278 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -251,6 +251,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+		device_property_read_u16(tmpdev, "num-hc-interrupters",
+					 &xhci->max_interrupters);
 	}
 
 	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
