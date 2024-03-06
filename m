Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0B877046
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:16:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7074E72;
	Sat,  9 Mar 2024 11:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7074E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979402;
	bh=CdamcnFSoH3i2sWATAhJWeRSwegUDWNNTTpSh2vn7NQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=od1vC2OrBGCnSD4jRcogOV3cUWMzwjePGB1kRW7y7lg2/lOX9C+xFOP7MWx8M+TgW
	 xxGn3H1yKYPBQzOm63407m1ig/cua4tFZDIzOAYbfacDOpP3KWUwRzIiXHoyy7eWH2
	 0FarXF6aW/bDLbS2UyGwp0ECFw+4Q6wnbyTocVBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5495FF80771; Sat,  9 Mar 2024 11:13:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CBEEF8076B;
	Sat,  9 Mar 2024 11:13:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 081E9F8024E; Wed,  6 Mar 2024 10:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4147F8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 10:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4147F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TQjayoYA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 426988q2002175;
	Wed, 6 Mar 2024 09:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=IXQktx4fldRoQpAzDTFi
	uBOW9vnYnZVPnipcv5l7YhI=; b=TQjayoYAVEUkhfOm5buyZD1hZYFBOlJcecIO
	HUH8DlLPc2rqv7eSFMDdScyCW4eKNpsCmClmrgXZ99CMXl72rIv93ELBIkA11FgI
	jUyEFI3jqRHz4EW+cGGu/0GU7+eWXcaDf1+CeiXFtMOAnvefO/MdoHhcItP8ioc5
	OdrF65Owh3MJXo4g6oVamIpRNkK+w3ogDL9OOpuWAdpBZA5zd4a5eDxAxAoe/mdm
	Ski0xtUkcErxHG3//DLui2z6LtidcL4bMAfYl5lUVXpWkdK5o4nnFlgpunrOfny8
	h1dC8BRiyFqQ1iuwkLdbpEUwtTu06qufPQrtFnzegv0pLUcZ6Q==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpkkarcbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 09:45:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 4269jDZc016031;
	Wed, 6 Mar 2024 09:45:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6kt39p-1;
	Wed, 06 Mar 2024 09:45:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4269jDA4016026;
	Wed, 6 Mar 2024 09:45:13 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com
 [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4269jDgY016025;
	Wed, 06 Mar 2024 09:45:13 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 7A1F55001D9; Wed,  6 Mar 2024 15:15:12 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] slimbus: stream: Add null pointer check to prevent crash
Date: Wed,  6 Mar 2024 15:15:07 +0530
Message-Id: <20240306094507.14270-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7mJj2T4xWfA-Sy2fCjU02MGjinONqC3d
X-Proofpoint-GUID: 7mJj2T4xWfA-Sy2fCjU02MGjinONqC3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_05,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=915 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060076
X-MailFrom: vdadhani@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H3YV44F5GXJR7DNU2525EVQURSB4FOKX
X-Message-ID-Hash: H3YV44F5GXJR7DNU2525EVQURSB4FOKX
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3YV44F5GXJR7DNU2525EVQURSB4FOKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We are facing crash due to null pointer dereference of stream
in slim_stream_disable(). there is a possible scenario where
client driver is calling slimbus stream APIs in incorrect
sequence and it might lead to null pointer access of the stream
in slimbus enable/disable/prepare/unprepare/free functions.

Fix this issue by adding null pointer check of the stream before
accessing in all stream API’s exposed to client.

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

