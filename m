Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54588574D8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5278D14E2;
	Fri, 16 Feb 2024 05:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5278D14E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056403;
	bh=QoIq1/Y3tqfnRT9ZSM0JEP5WzhlhxSfZGEHEmY/RnkA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CuUPNbTx/0ysps3rIMKis/ZHzMC5bsn2YZys7uIHe3qoMdPLXxo+HKawz20gbioty
	 p4uxtOJwJSMPXXH/XvmePadOADre+SAI+6mtlok86DFbUZCxQ2qZVmvpoJ+0poYgGX
	 Kug2sbBQF1X3kvX76XWWIz70tIShzFuxiSaqMaNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399C7F80104; Fri, 16 Feb 2024 05:01:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 178ACF8971A;
	Fri, 16 Feb 2024 05:01:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C1EF80727; Fri, 16 Feb 2024 05:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97714F805A1
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97714F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=dxFvtoEr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G1ww1Z022230;
	Fri, 16 Feb 2024 03:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=9VDljZQ3jUXeOFYmjf0H
	IXwYuk3nLz8VzI9yifxpLd0=; b=dxFvtoErfE5U353kQlS8d46yO0koiAGZF0Of
	4eLrW9E8k1O7oP5z5NK6D8RF/XEux33EGVNiD81rQCKDDHBsS2XJPcy2c1uk+6/K
	k5ocSSdQCSWT2/htNLIudmsmSEEPb7u5qePVRfoYOq1B3ArpYxu8QBYVVXqYpYuY
	w9CPOeYBkzGDs2+hFA5p0jQBawP83Edo5qRu0QpcBh42LkckpqYeAZIUYgo7U3gj
	9uzOs0coVZ+Wfy3C9YI6/tHaI4lAU4N8hAvwgigaWXsUWT+r3iFgxZBt/CO6a1d6
	x9yfag4Sv81SPPYS3ME0hx2RP6VowvOIW7K7TAD/6AKR0P4CSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9bfs34n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xe88029654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:40 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:39 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v16 26/50] usb: dwc3: Specify maximum number of XHCI
 interrupters
Date: Thu, 15 Feb 2024 19:58:59 -0800
Message-ID: <20240216035923.23392-27-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240216035923.23392-1-quic_wcheng@quicinc.com>
References: <20240216035923.23392-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _w1o4MWRZCVNx51vCaIcsiIoK0lbXY6K
X-Proofpoint-GUID: _w1o4MWRZCVNx51vCaIcsiIoK0lbXY6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_02,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=900
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160030
Message-ID-Hash: 37FOGEYBWHNYA3TBSRECRJWHGQVIF3FD
X-Message-ID-Hash: 37FOGEYBWHNYA3TBSRECRJWHGQVIF3FD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37FOGEYBWHNYA3TBSRECRJWHGQVIF3FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for the DWC3 host driver to pass along XHCI property that defines
how many interrupters to allocate.  This is in relation for the number of
event rings that can be potentially used by other processors within the
system.

Change-Id: Iaea871b1fc55ee5fa4337458fb9d902653c70798
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 drivers/usb/dwc3/core.h |  2 ++
 drivers/usb/dwc3/host.c |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 3b68e8e45b8b..7ac02339458e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1485,6 +1485,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
+	u16			num_hc_interrupters;
 	const char		*usb_psy_name;
 	int			ret;
 
@@ -1507,6 +1508,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	 */
 	tx_fifo_resize_max_num = 6;
 
+	/* default to a single XHCI interrupter */
+	num_hc_interrupters = 1;
+
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
@@ -1558,6 +1562,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				&tx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,tx-max-burst-prd",
 				&tx_max_burst_prd);
+	device_property_read_u16(dev, "num-hc-interrupters",
+				&num_hc_interrupters);
+	/* DWC3 core allowed to have a max of 8 interrupters */
+	if (num_hc_interrupters > 8)
+		num_hc_interrupters = 8;
+
 	dwc->do_fifo_resize = device_property_read_bool(dev,
 							"tx-fifo-resize");
 	if (dwc->do_fifo_resize)
@@ -1649,6 +1659,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->imod_interval = 0;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
+
+	dwc->num_hc_interrupters = num_hc_interrupters;
 }
 
 /* check whether the core supports IMOD */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index df544ec730d2..a851ea0ea2c6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1068,6 +1068,7 @@ struct dwc3_scratchpad_array {
  * @tx_max_burst_prd: max periodic ESS transmit burst size
  * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
  * @clear_stall_protocol: endpoint number that requires a delayed status phase
+ * @num_hc_interrupters: number of host controller interrupters
  * @hsphy_interface: "utmi" or "ulpi"
  * @connected: true when we're connected to a host, false otherwise
  * @softconnect: true when gadget connect is called, false when disconnect runs
@@ -1305,6 +1306,7 @@ struct dwc3 {
 	u8			tx_max_burst_prd;
 	u8			tx_fifo_resize_max_num;
 	u8			clear_stall_protocol;
+	u16			num_hc_interrupters;
 
 	const char		*hsphy_interface;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index ae189b7a4f8b..940fdaf3bec9 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -160,6 +160,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	props[prop_idx++] = PROPERTY_ENTRY_U16("num-hc-interrupters",
+						dwc->num_hc_interrupters);
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
