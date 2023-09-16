Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5F7A2B82
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 02:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A899DF3;
	Sat, 16 Sep 2023 02:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A899DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694823188;
	bh=8m3CZnp318W9Cdg2Zji2CdTaZ7vTqCwTs9XJbJCHHOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YiOXUgdegIuAcFaqRZr4/pG+ks6NJDO16yulTtVvSvTZ8+lkPobChH07QOqL5jWd1
	 39fuMciUH0vZAEZ7nheHHUnZmTmb0OjAb/AM94juJqgh64VPIiCOYKTmHb4h52Hsv+
	 gwdN+gzXWI3zwChn/CbiH8tor5cFFGEbBgfRiAY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951E4F805D4; Sat, 16 Sep 2023 02:11:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC2CF805C8;
	Sat, 16 Sep 2023 02:11:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257A6F805BD; Sat, 16 Sep 2023 02:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E00AF80552
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 02:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E00AF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Y2cpoiBn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38G07TMO028755;
	Sat, 16 Sep 2023 00:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=v88cF5DfrmQ11xFFw1qondVS974WsoPZKgPh8eL+d3w=;
 b=Y2cpoiBntnj8Gwqqx8kGUEwHFqVrfsfdXt7uVf76SEkUy+I+n47tpTIhumkWdjcbS1BG
 vYv1ifesh2uMGda3QhzYA2xHvVK7HVhNWbkg4TYRjO1Aa940Er/WxNfLJFm3O0WMBZVK
 Ox1c2lcOp1+99LLraMTIXst3xrDjELKWBM1hqvznvieHd6G7IJPAcJHXEpXWTOhMdd/V
 7X/0jXUSqR/9YuW41VPcIlxVQ5uoYqmJAqjaKTh/78uu1bUmDX9x/vMQkwR8pYVyalwg
 eP8wWVwdf/6mWktZgCxeQYHam32lVadLfAmeqBq1wBiCJM9CVvMownE6FLa002Xmv3sR LA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4fwn2dhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G0Affn026019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:41 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 17:10:41 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v6 16/33] usb: host: xhci-plat: Set XHCI max interrupters if
 property is present
Date: Fri, 15 Sep 2023 17:10:09 -0700
Message-ID: <20230916001026.315-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230916001026.315-1-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u7CYdfjNEXxvi8Mk10jmLyklwLmfw9XL
X-Proofpoint-ORIG-GUID: u7CYdfjNEXxvi8Mk10jmLyklwLmfw9XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309160000
Message-ID-Hash: YSSZ3IXW5BK6F5R2L7AJIIFM6ZWCPGQK
X-Message-ID-Hash: YSSZ3IXW5BK6F5R2L7AJIIFM6ZWCPGQK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSSZ3IXW5BK6F5R2L7AJIIFM6ZWCPGQK/>
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
