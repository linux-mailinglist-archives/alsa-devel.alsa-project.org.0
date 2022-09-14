Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103E5B912F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 01:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132F6191A;
	Thu, 15 Sep 2022 01:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132F6191A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663199391;
	bh=PLjfa6mFIhvsSe0EjnMbHlbKFrILI74f6WF+UXB7Umg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWPpOotBswgfq6hNHPaFfveI9rTxUuKSWvMbMroBZcnu4Awc0Hnz1C/BtTsfZjeV2
	 qm7ASTgN1Rd0VMhbCi+YLJImqm4cwmQnRvtXevG6FtUUcXLjEkO/z+jboY0qcw6zYW
	 RJc9/QjEF+PiMBW+r1fc/uAkcqIpuJbq4PHYEuk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD795F80548;
	Thu, 15 Sep 2022 01:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C374F80538; Thu, 15 Sep 2022 01:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E47FFF8014E
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 01:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E47FFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="S3dDoGqk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28ENJSMt005278;
 Wed, 14 Sep 2022 23:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=yg0spMiejcTYG8d4zCl6aPAnEHkA2Ku9fllCQp1TjB8=;
 b=S3dDoGqkPJ1tJfh0GKaZjh5DYWNVuGcZTmUXDLTn3M7uQ2P0ULLzxl+hiTI/jK48Y92+
 fLXdp4gNPP0iMMJOA/Ta2QuVDXXKG+k0FaAjjgKXXKa8/dhEPz+/ZOhk+Dib2TGA9Ra6
 z/gEI1fU3uw0Q01XUMgguY6fjgEyOHhsugTl0PWYFOGY5q1APPKR95iclZvQzSAbVSBh
 tAKUQU1jdC4eQdOwbunj4NB4zhxonIGmtqCeOKuH4TRrrOTj5UYyf6N+DF8WD6elkprC
 5CZqYdZWM177X8GSsS9KoUbwfukz0ZQpHalYh+bp8E167GHxQEvmSaQYZG4dFtcMGwnq lw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjy0gka0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:26 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28ENlPrl005432; 
 Wed, 14 Sep 2022 23:47:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jk8x6kknx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:25 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28ENlP8S005425;
 Wed, 14 Sep 2022 23:47:25 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 28ENlP11005424
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:25 +0000
Received: from quicinc.com (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 14 Sep
 2022 16:47:24 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kalle Valo
 <kvalo@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 3/4] slimbus: qcom-ngd-ctrl: Make QMI message rules const
Date: Wed, 14 Sep 2022 16:47:04 -0700
Message-ID: <20220914234705.28405-4-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220914234705.28405-1-quic_jjohnson@quicinc.com>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <20220914234705.28405-1-quic_jjohnson@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: s8SH1plZHAwhSImMgYJk1N1sKUhtWwtz
X-Proofpoint-GUID: s8SH1plZHAwhSImMgYJk1N1sKUhtWwtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140113
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Alex Elder <elder@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
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

Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
qmi_elem_info") allows QMI message encoding/decoding rules to be
const, so do that for qcom-ngd-ctrl.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0aa8408464ad..931ab6317467 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -220,7 +220,7 @@ struct slimbus_power_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
-static struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
+static const struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
 	{
 		.data_type  = QMI_UNSIGNED_4_BYTE,
 		.elem_len   = 1,
@@ -262,7 +262,7 @@ static struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
 	{
 		.data_type  = QMI_STRUCT,
 		.elem_len   = 1,
@@ -284,7 +284,7 @@ static struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
+static const struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
 	{
 		.data_type  = QMI_UNSIGNED_4_BYTE,
 		.elem_len   = 1,
@@ -324,7 +324,7 @@ static struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info slimbus_power_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info slimbus_power_resp_msg_v01_ei[] = {
 	{
 		.data_type  = QMI_STRUCT,
 		.elem_len   = 1,
-- 
2.37.0

