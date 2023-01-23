Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81FE6778DA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 11:14:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D10740FB;
	Mon, 23 Jan 2023 11:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D10740FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674468889;
	bh=8CslkcSEphMryB2uz/LL023yLxHSTo9JACYEuoqFHaM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=r2oXx7y6Bgj2bygARBQfG/HzZJ4Lez9gSsCq5QWutAcZqPO751B/qS6eixhUgkM1M
	 lBfFIslv5RCXK+tzA9duFjHy3FnjqY0VCbCRzN/jgOlWqFNomhxTUBZqex/RN9APoP
	 QxPoMlfYI01QDyonuWEJG45DqCoQdceUO6PTHsRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A969BF804F3;
	Mon, 23 Jan 2023 11:13:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649DEF804C2; Mon, 23 Jan 2023 11:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46826F801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 11:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46826F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=OK6LpETJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30N7AcHS011874; Mon, 23 Jan 2023 10:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Pz/uSWU8RRFgeloSr/VELxSNKiGWuMyh4YQShX3kEss=;
 b=OK6LpETJHUTAl333CR4DGkCkZgR/8W7M7nyKK/zhItKrKfqVmF3uAOGlSqoyZpUc3/6Y
 4HpqpAjzzxH9qMHB0kSJ01DuEEvkeBsf+mkINu6eQuE9SX7qZtY6NNYjcUEtyPeTBmaz
 AAErCXd5/Ybj3ab8fKw3bO+EFAeToGqensCbJdvjw4yCaz3TIX1D+zxPRFFKQYbAOzt9
 Sl45QE0V49ZXwCbfON4s9yMDh8zlT8PAM2ah7BmY8E2n2JJ8oUfeTuzEX+u+BA3FdFeM
 JxpmBjDppBipe5gOZBoO51g5zeZwlAUv05XDyLT8ZWu1bKUNY0IPRm6J5HdlvUSD6PVJ 8g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89gtanqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NADfl3014385
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:41 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 02:13:35 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/2] Update lpass dt-bindings
Date: Mon, 23 Jan 2023 15:43:20 +0530
Message-ID: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IPGpIi0nV2YSX4YvslEXb0mFcpdG0CWK
X-Proofpoint-ORIG-GUID: IPGpIi0nV2YSX4YvslEXb0mFcpdG0CWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_05,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=833 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301230095
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

Changes since v2:
    -- Update commit message and example in "Add platform property" patch.
    -- Update commit message in "Update clock name" patch.
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

