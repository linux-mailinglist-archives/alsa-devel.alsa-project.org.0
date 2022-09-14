Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D33275B9121
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 01:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2576E18EC;
	Thu, 15 Sep 2022 01:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2576E18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663199312;
	bh=yQDqhzRXm/t82NQv/z4OIVxsnCVPZKFUOS4PplJKzwk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C97XuUjN0JIwWAod2o1n1Rx78NHuzMv8dQm2/NreEWJsxX3GLleTZRC/FAOUOZekd
	 iRBOl309B7el+pPrGdqTKAJHYq9EdAo5nhtJdlGzYh4QDqd3PJXmuE9X+ak23y4TIQ
	 K4zOvYkiXKTG/FN7jjqSMtBFH1HKY9agmtKIw3GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70915F800C0;
	Thu, 15 Sep 2022 01:47:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8973FF801D8; Thu, 15 Sep 2022 01:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E0BF800C0
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 01:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E0BF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="gzYq7UrD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28ENMMnK031977;
 Wed, 14 Sep 2022 23:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=iqLzBmzE5BTockw4Tp6odyPOa+19hELeK9FqxRjRgxc=;
 b=gzYq7UrDtsYVNJXHvQKuzqKmBR51ViQODhcB36JPDvdR3vC5dPmXr+mJEnO49JalqgSc
 ZfR7DPnagVhQh/Zqxr87W9hIotDoAohh5rDQebv+r0Vu4/xczZayK+hK1qKQ6R2yASxu
 IQ2kSNugyXR17cnQLFc1BhX/ZOltvWUQBiiATzpRuDgkzB/G9Wkz8JMo1l/yIZFo5vVp
 Ap+ovt3uSOi+8k+AMXCC7D53T0x6lXLg/uecDj8BqtJKn3oeZlj7dSnpiVIl382lzGW/
 k8qZt9v8AGjUfPXoop4SA9cXlD31Kaj7vukxB0xFSKkGC8It+QPs/OAyQUc8lL4On4DJ UQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjxys4ayq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:25 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28ENlOar030181; 
 Wed, 14 Sep 2022 23:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jjqbt76e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:24 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28ENlOjG030176;
 Wed, 14 Sep 2022 23:47:24 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 28ENlOE1030175
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 23:47:24 +0000
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
Subject: [PATCH v2 0/4] Make QMI message rules const
Date: Wed, 14 Sep 2022 16:47:01 -0700
Message-ID: <20220914234705.28405-1-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: arZCbROUhuHu0e98sanOCBuW30PwvKB4
X-Proofpoint-GUID: arZCbROUhuHu0e98sanOCBuW30PwvKB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_09,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 mlxlogscore=716 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140113
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

Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
qmi_elem_info") allows QMI message encoding/decoding rules to be
const. So now update the definitions in the various clients to take
advantage of this. Patches for ath10k and ath11k were previously sent
separately.

This series depends upon:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=ff6d365898d4d31bd557954c7fc53f38977b491c

This is in the for-next branch of:
git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

Hence this series is also based upon that tree/branch.

Changes in v2 (applied to all 4 patches in the series):
- Fixed the truncated hash ff6d365898d ==> ff6d365898d4
- Added RB tags

Jeff Johnson (4):
  net: ipa: Make QMI message rules const
  remoteproc: sysmon: Make QMI message rules const
  slimbus: qcom-ngd-ctrl: Make QMI message rules const
  soc: qcom: pdr: Make QMI message rules const

 drivers/net/ipa/ipa_qmi_msg.c    | 20 ++++++++++----------
 drivers/net/ipa/ipa_qmi_msg.h    | 20 ++++++++++----------
 drivers/remoteproc/qcom_sysmon.c |  8 ++++----
 drivers/slimbus/qcom-ngd-ctrl.c  |  8 ++++----
 drivers/soc/qcom/pdr_internal.h  | 20 ++++++++++----------
 5 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.37.0

