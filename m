Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E04E4414
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 17:20:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A8A91730;
	Tue, 22 Mar 2022 17:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A8A91730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647966045;
	bh=d/WNYaTyBtEpb8ipjLKsFT9cK7ROzLs0/KzB8oSRYZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QXHcBVwdDi8NeDcNmcJXfkRaSMk8vRMYGvzoF0obfyRH6Nm9+LvW+DLE5wm40dnlD
	 kdOBgXY+fRh+lO3+pfFVAVY2lGXSgyHr5x8SE2UF9dGViww38V0vy+2x4yEfiRcc3h
	 Xz8NUX0/cEVoG7bODOiPQMRrfu54+b4FEC0tzcOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C82F800F5;
	Tue, 22 Mar 2022 17:19:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F3B3F8016C; Tue, 22 Mar 2022 17:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FB96F800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 17:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FB96F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Rrrunfgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647965973; x=1679501973;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=U7HtkD8e2y1BOHA9zy3SPJmEKe96PjQ8/7rxSr5oFsI=;
 b=Rrrunfgy5O5xwhh5PPnd7VJqDtBqREvNP08coUpTfRExtIHkZT48eLGR
 zY4rhp4e4nj77PjlHOoDYhWMqpPFiB3ezovlt8VGIlx4bFU+78IT0JBCF
 M0cTEhXPy0/kyDtEOS/P/PUHBhcJKyMjdEcRSlRs2c9yIgTLvogfxCPAN w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Mar 2022 09:19:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 09:19:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 22 Mar 2022 09:19:24 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 22 Mar 2022 09:19:18 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH] ASoC: codecs: Fix error handling in power domain init and
 exit handlers
Date: Tue, 22 Mar 2022 21:48:57 +0530
Message-ID: <1647965937-32203-1-git-send-email-quic_srivasam@quicinc.com>
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

Update error handling in power domain init and exit handlers, as existing handling
may cause issues in device remove function.
Use appropriate pm core api for power domain get and sync to avoid redundant code.

Fixes: 9e3d83c52844 ("ASoC: codecs: Add power domains support in digital macro codecs")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/lpass-macro-common.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6cede75..3c661fd 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -24,42 +24,45 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	l_pds->macro_pd = dev_pm_domain_attach_by_name(dev, "macro");
-	if (IS_ERR_OR_NULL(l_pds->macro_pd))
-		return NULL;
-
-	ret = pm_runtime_get_sync(l_pds->macro_pd);
-	if (ret < 0) {
-		pm_runtime_put_noidle(l_pds->macro_pd);
+	if (IS_ERR_OR_NULL(l_pds->macro_pd)) {
+		ret = PTR_ERR(l_pds->macro_pd);
 		goto macro_err;
 	}
 
+	ret = pm_runtime_resume_and_get(l_pds->macro_pd);
+	if (ret < 0)
+		goto macro_sync_err;
+
 	l_pds->dcodec_pd = dev_pm_domain_attach_by_name(dev, "dcodec");
-	if (IS_ERR_OR_NULL(l_pds->dcodec_pd))
+	if (IS_ERR_OR_NULL(l_pds->dcodec_pd)) {
+		ret = PTR_ERR(l_pds->dcodec_pd);
 		goto dcodec_err;
+	}
 
-	ret = pm_runtime_get_sync(l_pds->dcodec_pd);
-	if (ret < 0) {
-		pm_runtime_put_noidle(l_pds->dcodec_pd);
+	ret = pm_runtime_resume_and_get(l_pds->dcodec_pd);
+	if (ret < 0)
 		goto dcodec_sync_err;
-	}
 	return l_pds;
 
 dcodec_sync_err:
 	dev_pm_domain_detach(l_pds->dcodec_pd, false);
 dcodec_err:
 	pm_runtime_put(l_pds->macro_pd);
-macro_err:
+macro_sync_err:
 	dev_pm_domain_detach(l_pds->macro_pd, false);
+macro_err:
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_init);
 
 void lpass_macro_pds_exit(struct lpass_macro *pds)
 {
-	pm_runtime_put(pds->macro_pd);
-	dev_pm_domain_detach(pds->macro_pd, false);
-	pm_runtime_put(pds->dcodec_pd);
-	dev_pm_domain_detach(pds->dcodec_pd, false);
+	if (pds) {
+		pm_runtime_put(pds->macro_pd);
+		dev_pm_domain_detach(pds->macro_pd, false);
+		pm_runtime_put(pds->dcodec_pd);
+		dev_pm_domain_detach(pds->dcodec_pd, false);
+	}
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
-- 
2.7.4

