Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1594C55E2
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 13:46:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14DF0191E;
	Sat, 26 Feb 2022 13:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14DF0191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645879617;
	bh=/yNKhmRNOud/3AJssaJGVCgAeNNtufQnDCkRsBuTN8s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aILmz1h96cLO9xq+KB5e/JoUwhLOlpuVZn/dNOxj2zWA5rBIGCH7w9rVdYgm5EWcN
	 mM07f6byZmmCCU0Gluv7lHVPjYd77PPlPmPUfLLVaS8DukTarmwWMKyfZBVB0uU3iq
	 P1X+m+7MY75MMMOwEKnlZBlUzCdFFBLKSD7sp7fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58F3F80134;
	Sat, 26 Feb 2022 13:45:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A76F8012E; Sat, 26 Feb 2022 13:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45E96F800B6
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 13:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E96F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="lSuw7V5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645879545; x=1677415545;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4iZ92ymE7jSNJuadElFGgWcrZRahUwKuEPZoUCSBzrA=;
 b=lSuw7V5tm/8ZDvOcD4enDy2Y55odQGR7YvrsBnz1PvJZbGChWFn2z7o+
 WTVI+aEWVKRMNd6Eam3XtYcyXdHJUl/zPgbsvzy9UG3kX0DWW2zVnB3i7
 yePwzXlbO1eCh5+05H0iCVXzF5OblNNdFNks9JM7FIxfyCkJ1i7qWaaCv c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Feb 2022 04:45:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2022 04:45:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 04:45:39 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 04:45:33 -0800
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
Subject: [PATCH] "soundwire: qcom: revert wait for enumeration to be complete
 in probe"
Date: Sat, 26 Feb 2022 18:15:18 +0530
Message-ID: <1645879518-14658-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

Revert wait for enumeration from soundwire probe as it seems
unnecessary and device enumeration is anyway not happening here,
hence this api is blocking till it completes max wait time.
Also, as device enumeration event is dependent on wcd938x probe to be
completed, its of no use waiting here.
Waiting here increasing the boot time almost 4 seconds and impacting
other modules like touch screen.

Revert: commit 06dd96738d618 ("soundwire: qcom: wait for enumeration to be complete in probe")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 drivers/soundwire/qcom.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5481341..9eb31ba 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -133,7 +133,6 @@ struct qcom_swrm_ctrl {
 	struct dentry *debugfs;
 #endif
 	struct completion broadcast;
-	struct completion enumeration;
 	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
@@ -486,7 +485,6 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 		}
 	}
 
-	complete(&ctrl->enumeration);
 	return 0;
 }
 
@@ -1262,7 +1260,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
 	init_completion(&ctrl->broadcast);
-	init_completion(&ctrl->enumeration);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
@@ -1309,8 +1306,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
-	wait_for_completion_timeout(&ctrl->enumeration,
-				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
 		goto err_master_add;
-- 
2.7.4

