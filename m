Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8A54CC004
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 15:32:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA5C51A28;
	Thu,  3 Mar 2022 15:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA5C51A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646317972;
	bh=Q18rGJACWsWo1MfpWF4blcB+OUgT9p2WLt8n9xZA+po=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9Q3OfWMspNSA7XYe7AZsaHF9fuyfHvBY/pBmsisagYvm1HlTbYzapu8FyXyAcdsp
	 1imDFXyvyRTWGAYoWz/VIYUMtPp6xr6gCyDy64BixLbvpyfFcI7YxPz0uW6/rf0utX
	 venUp5sPFubPfS9UZz60smi7QEqctTmQ3441ovts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A585DF80517;
	Thu,  3 Mar 2022 15:31:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C593AF80511; Thu,  3 Mar 2022 15:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B00FF80511
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 15:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B00FF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="jpdgsJiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646317882; x=1677853882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PuMfJqxLwUdCcyawAQUZQIj6eZLTzkXUCtrUa/98Il8=;
 b=jpdgsJiT0jiibI17vYiIxDJ6Wt6LIlWvGeiGQY8DpFvlt9EYV5wj7mtO
 hYTbw1xuk5wbxnTz2nwb2nJQ8iM/N/m38rmXucMzmf0i9BpnKmwcNWcO0
 mNsX+yr1dpPKjCBsSTjh8dutKdCbWD8W8JAqiEHazUstamyWLwVy9/BKt g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 03 Mar 2022 06:31:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:31:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:15 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:09 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <sanyog.r.kale@intel.com>, <vkoul@kernel.org>
Subject: [RESEND v7 1/2] soundwire: qcom: Add compatible name for v1.6.0
Date: Thu, 3 Mar 2022 20:00:50 +0530
Message-ID: <1646317851-14414-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update compatible string and master data information in soundwire driver
to support v1.6.0 in lpass sc7280 based platform.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 4337761..2d955ca 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1348,6 +1348,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
 	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
+	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_5_data },
 	{/* sentinel */},
 };
 
-- 
2.7.4

