Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE34C47D7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 15:46:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 781091B51;
	Fri, 25 Feb 2022 15:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 781091B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645800362;
	bh=BjD+45AIyWtSKp7iz+QdqB2GzFbZcMvDzi7ObqeYEC0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jToiEqtYEHEjq0z8P7P/hrW7t4q0isFeq8GP8khuOrmOQErqW1V7kIItAouAstlzn
	 7i6GOttTcwgRtzusXwSk8VLvAp5uI7y8iRHJtGgW+ZohuwRQg1qKifw985FUmu0hQg
	 FJzWmxCbS1Hc5C6Ci3jAv18blReL86/Af2go3KdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D84BEF80159;
	Fri, 25 Feb 2022 15:44:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C939F80132; Fri, 25 Feb 2022 15:44:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7252BF80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 15:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7252BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="OCJFJTb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645800285; x=1677336285;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=u4Jd9kNBAg8EIAfWuRUkFsMZH9ytNJSlFwtOXxXUdYg=;
 b=OCJFJTb9WHdtNee+kP3PRxqvrrg4ymvd1BuM8edtAMajU3RTTy9i4jAc
 +cWZtKa47XOcwlYspbrvfR0H1pjWjizmqQl5EiyuVjPUcI6xzzq2pVs0e
 UG6fvBOMsMXVUCwoBnNx0OvNCTjnb0Jd+KwhmYevMW4eaRjwswomT2wV/ 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Feb 2022 06:44:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:44:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 06:44:38 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 06:44:32 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <sanyog.r.kale@intel.com>
Subject: [PATCH v2] soundwire: qcom: remove redundant wait for completion
Date: Fri, 25 Feb 2022 20:14:17 +0530
Message-ID: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Remove wait_for_completion_timeout from soundwire probe as it seems
unnecessary and device enumeration is anyway not happening here,
hence this api is blocking till it completes max wait time.
Also, as device enumeration event is dependent on wcd938x probe to be
completed, its of no use waiting here.
Waiting here increasing the boot time almost 4 seconds and impacting
other modules like touch screen.

Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be complete in probe")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/soundwire/qcom.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5481341..9a32a24 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
-	wait_for_completion_timeout(&ctrl->enumeration,
-				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
 		goto err_master_add;
-- 
2.7.4

