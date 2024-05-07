Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA48BED68
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 21:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE2582B;
	Tue,  7 May 2024 21:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE2582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715111984;
	bh=a8/syHhmbTvyTKDOBFgJawalQWWJ5S6yVpNHwdmavoI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ATcsHGthUgvTDqsk9FsBaYMCF19vpd2qwAPn6gtu0+3WR5BhRbwjhPWFItw5VA58i
	 djLeOWl3JKWYbALHq4B9gxrAXhwPIe5YjX/7ReJmGcU8Qs9EQPQjbUkc2f3F8plFZM
	 7dthkG1Qn7m82iN7mALcdgDewl3J3OFq7TvuxRzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A313AF80815; Tue,  7 May 2024 21:56:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D66C1F80808;
	Tue,  7 May 2024 21:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D1B4F80423; Tue,  7 May 2024 21:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69D60F8057B
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 21:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D60F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=G8huPZVT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 447Jp5vB006068;
	Tue, 7 May 2024 19:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=PZmsd5A/vteQo/baFqZC
	HC4C+EhWlDbGSUUnNaTJVoo=; b=G8huPZVTYQBWo9sRaoXBoT+7CO1whQEx442U
	xe1v07CkbEa+0RVwtiWevCbf8EbLDT0kiz1G/jb1ZQvR8To71ISWX+wStJl3ZETP
	uAOHKqyitDSMxy2K7/tjvx1Jx1KJQvmCY8vaMpz9vlZF/ZpxcWWtbjajjMuksEp7
	JbntqGWJTHY9SAfGDs/dVnvc7HWKv3W7SOT2Wnb5B+QqGwEkTMUi53+LieHuX16X
	7UywAjG4hGbTwJ/EIat9Bx7deQje1GPV0uSvTH10fmLyyThMsKBW4MCYmkcpO830
	GvppUZjifS1DrBY8NJ6hMoeoD5aS1sFN2ZfS+fwunbmA8t0GIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg4r5u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 447JpVgJ019778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:31 GMT
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
Subject: [PATCH v21 15/39] usb: dwc3: Specify maximum number of XHCI
 interrupters
Date: Tue, 7 May 2024 12:50:52 -0700
Message-ID: <20240507195116.9464-16-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 2pOzfwamKRt3YjKdbU2dB5xLAANVRbAh
X-Proofpoint-ORIG-GUID: 2pOzfwamKRt3YjKdbU2dB5xLAANVRbAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=956 clxscore=1015 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070138
Message-ID-Hash: KV5OJK4LBUZ7IYDL476BB2RWCOJ2UM2K
X-Message-ID-Hash: KV5OJK4LBUZ7IYDL476BB2RWCOJ2UM2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KV5OJK4LBUZ7IYDL476BB2RWCOJ2UM2K/>
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
index 719305ab86c0..51daddac88bb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1595,6 +1595,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
+	u16			num_hc_interrupters;
 	const char		*usb_psy_name;
 	int			ret;
 
@@ -1617,6 +1618,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	 */
 	tx_fifo_resize_max_num = 6;
 
+	/* default to a single XHCI interrupter */
+	num_hc_interrupters = 1;
+
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
 	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
@@ -1670,6 +1674,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
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
@@ -1758,6 +1768,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->imod_interval = 0;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
+
+	dwc->num_hc_interrupters = num_hc_interrupters;
 }
 
 /* check whether the core supports IMOD */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5cbc64883dbc..cf0d23d3f782 100644
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
index 0204787df81d..f774b843aabb 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -159,6 +159,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	props[prop_idx++] = PROPERTY_ENTRY_U16("num-hc-interrupters",
+						dwc->num_hc_interrupters);
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
