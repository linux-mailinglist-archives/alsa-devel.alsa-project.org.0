Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E045B6418
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 01:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E921672;
	Tue, 13 Sep 2022 01:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E921672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663025237;
	bh=QvPDqHzcdADJGOBpe0ztaLUOi4zZ+V2EYSj1VBXh8ZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqGfqQW5j/zMiG4Hg4I2Q6uh5DVeITCf0QRwwxTccg+d6MfYKSaOVARjcoib6iLNe
	 ObqjUMszrULzTxcILof49ldh3Fn9/J6S+vF0CjnIfwtp+NI4IAraCRQTZa+g6QK6M+
	 w9Tjc+ej0Ok9i7dsgHB2Rycv0E31S6GPIs0FvWeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C775F80528;
	Tue, 13 Sep 2022 01:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E557AF804FE; Tue, 13 Sep 2022 01:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C086FF8020D
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 01:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C086FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="dhjYegT8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CMxG3b016884;
 Mon, 12 Sep 2022 23:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=pXHl+RJ8Dop0MQ9HRBtP4WLjokxxuJynrB7HQhXEjvI=;
 b=dhjYegT8B+g4MhmHOFWg0dX8cguPhZT57lWRPI0VNSLEiSXNEAYAQOOHSaxbyvrWODb/
 tNjtN3mcawiWOHet4n7x1SfxjfHlse6MVNc39iUk0Ke1oEmkPrKl0N7CCPPSrTt28+u+
 a/HPF06T6kdoesPAYiVfEJ2ztPVoIKUGCqd9gb/tqVVYOgYaCLOl6B33kd21iQs17jRp
 HciipuxiQ0ZDujfLhiIpZVa3WljqpJqlIgUeq4xuzZTr/Z3/8wnlgDzmMG72TfJI1VRw
 r5c6OCzAhWqqoHigE3bqajV/5fMZwlsU8FJrVfDzHbtX+/2watxzAaTVFgh31Gp2/WBf Vg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk3gwjkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 23:25:43 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28CNPgkq022864; 
 Mon, 12 Sep 2022 23:25:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jh43seds3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 23:25:42 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CNPg3I022858;
 Mon, 12 Sep 2022 23:25:42 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 28CNPf3f022857
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 23:25:42 +0000
Received: from quicinc.com (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 16:25:41 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kalle Valo
 <kvalo@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH 1/4] net: ipa: Make QMI message rules const
Date: Mon, 12 Sep 2022 16:25:23 -0700
Message-ID: <20220912232526.27427-2-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MrNR_tpEdb_90j7A2J_hQbtCZXxANNHb
X-Proofpoint-GUID: MrNR_tpEdb_90j7A2J_hQbtCZXxANNHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_14,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120082
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Commit ff6d365898d ("soc: qcom: qmi: use const for struct
qmi_elem_info") allows QMI message encoding/decoding rules to be
const, so do that for IPA.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/ipa/ipa_qmi_msg.c | 20 ++++++++++----------
 drivers/net/ipa/ipa_qmi_msg.h | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
index 6838e8065072..c5a5dac284a9 100644
--- a/drivers/net/ipa/ipa_qmi_msg.c
+++ b/drivers/net/ipa/ipa_qmi_msg.c
@@ -9,7 +9,7 @@
 #include "ipa_qmi_msg.h"
 
 /* QMI message structure definition for struct ipa_indication_register_req */
-struct qmi_elem_info ipa_indication_register_req_ei[] = {
+const struct qmi_elem_info ipa_indication_register_req_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
@@ -116,7 +116,7 @@ struct qmi_elem_info ipa_indication_register_req_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_indication_register_rsp */
-struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
+const struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -134,7 +134,7 @@ struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_driver_init_complete_req */
-struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
+const struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_1_BYTE,
 		.elem_len	= 1,
@@ -151,7 +151,7 @@ struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_driver_init_complete_rsp */
-struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
+const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -169,7 +169,7 @@ struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_init_complete_ind */
-struct qmi_elem_info ipa_init_complete_ind_ei[] = {
+const struct qmi_elem_info ipa_init_complete_ind_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -187,7 +187,7 @@ struct qmi_elem_info ipa_init_complete_ind_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_mem_bounds */
-struct qmi_elem_info ipa_mem_bounds_ei[] = {
+const struct qmi_elem_info ipa_mem_bounds_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -208,7 +208,7 @@ struct qmi_elem_info ipa_mem_bounds_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_mem_array */
-struct qmi_elem_info ipa_mem_array_ei[] = {
+const struct qmi_elem_info ipa_mem_array_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -229,7 +229,7 @@ struct qmi_elem_info ipa_mem_array_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_mem_range */
-struct qmi_elem_info ipa_mem_range_ei[] = {
+const struct qmi_elem_info ipa_mem_range_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -250,7 +250,7 @@ struct qmi_elem_info ipa_mem_range_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_init_modem_driver_req */
-struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
+const struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
@@ -645,7 +645,7 @@ struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_init_modem_driver_rsp */
-struct qmi_elem_info ipa_init_modem_driver_rsp_ei[] = {
+const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
index 495e85abe50b..8dfac59ea0ed 100644
--- a/drivers/net/ipa/ipa_qmi_msg.h
+++ b/drivers/net/ipa/ipa_qmi_msg.h
@@ -242,15 +242,15 @@ struct ipa_init_modem_driver_rsp {
 };
 
 /* Message structure definitions defined in "ipa_qmi_msg.c" */
-extern struct qmi_elem_info ipa_indication_register_req_ei[];
-extern struct qmi_elem_info ipa_indication_register_rsp_ei[];
-extern struct qmi_elem_info ipa_driver_init_complete_req_ei[];
-extern struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
-extern struct qmi_elem_info ipa_init_complete_ind_ei[];
-extern struct qmi_elem_info ipa_mem_bounds_ei[];
-extern struct qmi_elem_info ipa_mem_array_ei[];
-extern struct qmi_elem_info ipa_mem_range_ei[];
-extern struct qmi_elem_info ipa_init_modem_driver_req_ei[];
-extern struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
+extern const struct qmi_elem_info ipa_indication_register_req_ei[];
+extern const struct qmi_elem_info ipa_indication_register_rsp_ei[];
+extern const struct qmi_elem_info ipa_driver_init_complete_req_ei[];
+extern const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
+extern const struct qmi_elem_info ipa_init_complete_ind_ei[];
+extern const struct qmi_elem_info ipa_mem_bounds_ei[];
+extern const struct qmi_elem_info ipa_mem_array_ei[];
+extern const struct qmi_elem_info ipa_mem_range_ei[];
+extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
+extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
 
 #endif /* !_IPA_QMI_MSG_H_ */
-- 
2.37.0

