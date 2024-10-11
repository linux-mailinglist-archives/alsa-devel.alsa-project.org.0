Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5B999682
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 02:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901F5EAB;
	Fri, 11 Oct 2024 02:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901F5EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728605566;
	bh=SEZVsSJ3a46E0oX5ZwE8La/80l4wQDAX2p6gKqh3ypQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qK1+5IeUt5LnTeEFixizP4e27iGQcV4bp5G28NQH57NJyffq58iULXG1tTyF9sFGq
	 PzB9xtzv0EiDDBv9iBxItXJxH9nMWjGmzBI3mymgK0EhNgiFfBNj/UX+fPP0hG4OiN
	 s+LVISmiQNYDiPmtnz5/+D70EDdoHQefDp1W9e7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7AABF805E4; Fri, 11 Oct 2024 02:09:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C67D6F80C18;
	Fri, 11 Oct 2024 02:09:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6608F80606; Fri, 11 Oct 2024 02:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BFCEF805AD
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 02:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BFCEF805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=l3DWKYbG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49AHCs2r024117;
	Fri, 11 Oct 2024 00:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bztHUYvMMxB9IN8zQZC689zDaxiSCm1Mj9EPEMEDNs=; b=l3DWKYbG/NxgTfNo
	nLbIJP3qi4kUDj8rHrMvHSbnbs62wQq4Cz5IrF1USmxb16wBf41QOfW5xD9YLCsG
	KfVkBB3dZjKsXiyPmWTIdIubwKqNdFSYc90tl+V13WxRGvFAjpsj8lTEMpP6Z1TN
	lQUHmeZx4f/zOL6/H72WQZe2mbGNcZyCOyfQhGnrnln1ukz8JI9oGrgScX9cimCa
	cB50UhllEjHyqa3KggJPuG5p8a2tKyTi+gIDvvxBGdWMhK9Q/fJp26/3WTLKAkAW
	lN7LAMEU4spBh9RKeP4Yk8kUZgBsrPVon6qwPwxwW6C/z0mo3Uq2pNh4DoBVW+2D
	XvhtOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhjdnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49B07703016308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:07 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:07 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 09/33] usb: dwc3: Specify maximum number of XHCI
 interrupters
Date: Thu, 10 Oct 2024 17:06:03 -0700
Message-ID: <20241011000650.2585600-19-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sePWqAy2vDvUYTbT6hhwObJbH6Xco2Bg
X-Proofpoint-ORIG-GUID: sePWqAy2vDvUYTbT6hhwObJbH6Xco2Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=883 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100159
Message-ID-Hash: MANOYOMUWAHFTMY7NWED46EIRHEDXDM3
X-Message-ID-Hash: MANOYOMUWAHFTMY7NWED46EIRHEDXDM3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MANOYOMUWAHFTMY7NWED46EIRHEDXDM3/>
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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 drivers/usb/dwc3/core.h |  2 ++
 drivers/usb/dwc3/host.c |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7ee61a89520b..f98d5d04f493 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1573,6 +1573,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
+	u16			num_hc_interrupters;
 	const char		*usb_psy_name;
 	int			ret;
 
@@ -1595,6 +1596,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	 */
 	tx_fifo_resize_max_num = 6;
 
+	/* default to a single XHCI interrupter */
+	num_hc_interrupters = 1;
+
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
@@ -1648,6 +1652,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				&tx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,tx-max-burst-prd",
 				&tx_max_burst_prd);
+	device_property_read_u16(dev, "num-hc-interrupters",
+				 &num_hc_interrupters);
+	/* DWC3 core allowed to have a max of 8 interrupters */
+	if (num_hc_interrupters > 8)
+		num_hc_interrupters = 8;
+
 	dwc->do_fifo_resize = device_property_read_bool(dev,
 							"tx-fifo-resize");
 	if (dwc->do_fifo_resize)
@@ -1736,6 +1746,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->imod_interval = 0;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
+
+	dwc->num_hc_interrupters = num_hc_interrupters;
 }
 
 /* check whether the core supports IMOD */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3781c736c1a1..95e6989d116e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1077,6 +1077,7 @@ struct dwc3_scratchpad_array {
  * @tx_max_burst_prd: max periodic ESS transmit burst size
  * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
  * @clear_stall_protocol: endpoint number that requires a delayed status phase
+ * @num_hc_interrupters: number of host controller interrupters
  * @hsphy_interface: "utmi" or "ulpi"
  * @connected: true when we're connected to a host, false otherwise
  * @softconnect: true when gadget connect is called, false when disconnect runs
@@ -1318,6 +1319,7 @@ struct dwc3 {
 	u8			tx_max_burst_prd;
 	u8			tx_fifo_resize_max_num;
 	u8			clear_stall_protocol;
+	u16			num_hc_interrupters;
 
 	const char		*hsphy_interface;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index a171b27a7845..d883cd7b1615 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -180,6 +180,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	props[prop_idx++] = PROPERTY_ENTRY_U16("num-hc-interrupters",
+					       dwc->num_hc_interrupters);
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
