Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECA675283
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 11:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657B3309F;
	Fri, 20 Jan 2023 11:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657B3309F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674210771;
	bh=THisvZJgVYQ4tB9DK3NxyhVL0kCAjy1K/UELvhYJbFs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XduHga9KumuyLXyx5UlYNZR5zlAQpL+WWHbN3ErnELOSOCud8NgNG6km9ZR3SWPTw
	 FF7uZzU4DC/KKKGnUc3VUYRD8raFOYddPm+7EH+cXlOk6CwMvINa8nAkoFWo4iGZK8
	 c9SQe22BdTi4H3CegS245XGTrOhHH9rARDm/X9XM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195A3F800F0;
	Fri, 20 Jan 2023 11:31:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8A3F80495; Fri, 20 Jan 2023 11:31:53 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CDDAF80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 11:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CDDAF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=B8eM7hIl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KALh7O029812; Fri, 20 Jan 2023 10:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=HqVl55eMP54CCvgSUvd+AdMYneRph1zFpTAQnOc+rBU=;
 b=B8eM7hIlAJmNrpP9WhdPSauotV1zQC4A2wrcteO3vLgANb4DSykuq7XIl0Ua4ggtOmdf
 wTF3RqH9jVFK6VVakhtDgCAQzFLlFtwUD0roiWHWSI/MjaKGFwNb1uE0L7D9iJPBhV5g
 cmViOXfOvBjcCAVQ/7Urx2FfpFA34NteZE2nchdoBfRYoLrDWcz78lDJRlbbL5INQU1R
 T8YGCBAmxow/6nGQh4iLqZddLqaQj/AQhTpb+kiJ3ZcnXT90Hl1c3vbmTqoxS4DBdfmF
 a1/4i+ng3Ugmqo0ZNiYNluQOi+njb73iAa/LK4FSouvTramrgqHJ0fwM+BRLOOnUYX94 zg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n700yudme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:31:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30KAVidT006879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:31:44 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 20 Jan 2023 02:31:38 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <devicetree@vger.kernel.org>, <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2]  Update lpass dt-bindings
Date: Fri, 20 Jan 2023 16:01:23 +0530
Message-ID: <1674210685-19944-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uC_bARXGKZ9Mg1bXttACjrkqvjNUZQlw
X-Proofpoint-ORIG-GUID: uC_bARXGKZ9Mg1bXttACjrkqvjNUZQlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_06,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=836 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200099
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Update va-macro driver dt-bindings and add missing properties in sc7280 
machine driver dt-bindings.

Changes since v1:
    -- Remove sound-dai cells property patch.
    -- Update example in clock name change patch.
    -- Update commit message and add maxItems in platform proerty patch.

Srinivasa Rao Mandadapu (2):
  ASoC: qcom: dt-bindings: lpass-va-macro: Update clock name
  ASoC: dt-bindings: google,sc7280-herobrine: Add platform property

 .../devicetree/bindings/sound/google,sc7280-herobrine.yaml   | 12 ++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml       |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.7.4

