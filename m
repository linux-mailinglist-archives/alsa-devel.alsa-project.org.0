Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4A894BD8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EA42BC9;
	Tue,  2 Apr 2024 08:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EA42BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040735;
	bh=+e1bLci2+S1wtwonBr0GglprXIyIVN25Nj4MKcFoSzM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SMEFVfxx68Y2wUYn4nS5Tc3oquxqpbUHlIXxVbczmEw+iz0fmfuQ5b6RwVEuQQLQf
	 hsDG+opPlYFiDSQDHrnpSx17AOhoIRBbt+YP8hmV0uEkxWWp/CO0De8ixPWBdYNTOj
	 kFpkbVD91oCgQTQquEqCT9XTpdsMZEwzgHLye3Jw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE6AF807A2; Tue,  2 Apr 2024 08:49:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C1EF80854;
	Tue,  2 Apr 2024 08:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E8CCF8025F; Wed, 27 Mar 2024 09:34:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC634F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 09:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC634F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lxAMyTdo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42R8NvKW021642;
	Wed, 27 Mar 2024 08:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=1UyOPhjrwvDWtFv0/b3/
	55B+b1d7TKnArQ2vtkFV23E=; b=lxAMyTdocswqbffjaR5p1YLVPPNVZDNNdSw2
	c/PjjQUy9CdVyCBpurIfC8Ds5av2PcqSBnjLJlgJd8WdwGeFcjPCTi1RzZ/Hs+3s
	i+xH5KDiW44Ud/OZ37/zDcEZpe8CB0J5YjKzvD++Qt2aS8IA+ilda1/7zKQSO8wX
	lKfUmwbQ2ehFT5t68zIIlJyDaCGpVuaZYC/Pf9f/YmBM12Mofli7CsiULTUMKflp
	EUXjaGuyV6TTRqKhKYW8WCq7AJmh8V9P9WoHXLm43tVa3JOtjJHUJOR1I65rufsq
	EbKvKQH6dqm9PTtfxHQYlNyNb+5hRLuCgHPlUbRYA25zvw2B7A==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x478394kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 08:32:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 42R8WIEE031578;
	Wed, 27 Mar 2024 08:32:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3x1r5m3mv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 27 Mar 2024 08:32:17 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42R8WHjj031572;
	Wed, 27 Mar 2024 08:32:17 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com
 [10.213.106.28])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 42R8WH5F031571;
	Wed, 27 Mar 2024 08:32:17 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 497335006A9; Wed, 27 Mar 2024 14:02:16 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for client
 functions
Date: Wed, 27 Mar 2024 14:02:14 +0530
Message-Id: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qnJx_78JeXJclkiP7BM7X7bTqfhdiOFX
X-Proofpoint-ORIG-GUID: qnJx_78JeXJclkiP7BM7X7bTqfhdiOFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_05,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270057
X-MailFrom: vdadhani@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BXMY7ISGC4ZOCF2J5RSKPWZSGV2RTHXL
X-Message-ID-Hash: BXMY7ISGC4ZOCF2J5RSKPWZSGV2RTHXL
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXMY7ISGC4ZOCF2J5RSKPWZSGV2RTHXL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a possible scenario where client driver is calling
slimbus stream APIs in incorrect sequence and it might lead to
invalid null access of the stream pointer in slimbus
enable/disable/prepare/unprepare/free function.

Fix this by checking validity of the stream before accessing in
all function API’s exposed to client.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..c5a436fd0952 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
 int slim_stream_prepare(struct slim_stream_runtime *rt,
 			struct slim_stream_config *cfg)
 {
-	struct slim_controller *ctrl = rt->dev->ctrl;
+	struct slim_controller *ctrl;
 	struct slim_port *port;
 	int num_ports, i, port_id, prrate;
 
+	if (!rt || !cfg) {
+		pr_err("%s: Stream or cfg is NULL, Check from client side\n", __func__);
+		return -EINVAL;
+	}
+
+	ctrl = rt->dev->ctrl;
 	if (rt->ports) {
 		dev_err(&rt->dev->dev, "Stream already Prepared\n");
 		return -EINVAL;
@@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime *stream)
 {
 	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
 				3, SLIM_LA_MANAGER, NULL);
-	struct slim_controller *ctrl = stream->dev->ctrl;
+	struct slim_controller *ctrl;
 	int ret, i;
 
+	if (!stream) {
+		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
+		return -EINVAL;
+	}
+
+	ctrl = stream->dev->ctrl;
 	if (ctrl->enable_stream) {
 		ret = ctrl->enable_stream(stream);
 		if (ret)
@@ -411,12 +423,18 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
 {
 	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
 				3, SLIM_LA_MANAGER, NULL);
-	struct slim_controller *ctrl = stream->dev->ctrl;
+	struct slim_controller *ctrl;
 	int ret, i;
 
+	if (!stream) {
+		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
+		return -EINVAL;
+	}
+
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
+	ctrl = stream->dev->ctrl;
 	if (ctrl->disable_stream)
 		ctrl->disable_stream(stream);
 
@@ -448,6 +466,11 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
 	int i;
 
+	if (!stream) {
+		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
+		return -EINVAL;
+	}
+
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
@@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
  */
 int slim_stream_free(struct slim_stream_runtime *stream)
 {
-	struct slim_device *sdev = stream->dev;
+	struct slim_device *sdev;
+
+	if (!stream) {
+		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
+		return -EINVAL;
+	}
 
+	sdev = stream->dev;
 	spin_lock(&sdev->stream_list_lock);
 	list_del(&stream->node);
 	spin_unlock(&sdev->stream_list_lock);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

