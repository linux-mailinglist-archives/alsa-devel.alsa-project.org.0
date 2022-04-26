Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB386510CF5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 01:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A92A17D1;
	Wed, 27 Apr 2022 01:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A92A17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651017563;
	bh=8buaCP5WAQdOwNeI5o7LDn1PP+ytMuRXjlhLzBrLdD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ts/FuILNuIL7lpLI37Jyc8FoWr4dWkpOvayYFqEkwJGZAZSzPGFssxBqiKxs8oJMi
	 xVCFUpkVHaiEJO2fOkkiyYDZsFqBGFuHQFYJT3mxUJAe/DGWnmQjfnHlmdplWKcIC8
	 lD+IHOtv8hjez7IglDsMEcHP3F+dgHKDK237CZ+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88777F80535;
	Wed, 27 Apr 2022 01:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C97FAF8052D; Wed, 27 Apr 2022 01:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72881F801D5
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 01:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72881F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QhoIrwaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651017403; x=1682553403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8buaCP5WAQdOwNeI5o7LDn1PP+ytMuRXjlhLzBrLdD8=;
 b=QhoIrwaS9hAwGiEqATrvSlr+zIU6qGD2BQ78r4MXiOj6K+suzAF6jeoN
 84z/wnrfscW2yRDKUFp9H2LC5dEt5DxnEUBEy59gceb4alh+KwXKd6Puk
 QQZ85nYxKPm5h3f+brSQuXbMk5mlSPBJEQlT5roNGf/35KJwfUAEryDj8
 5BeKkAPGP3QpLpYLRCewKnmrHCdXtMyGwaTr3cQay+yHD6K7VohC6r2+1
 AP70QBJD07Bs+7Yve7GX8rmq5Gd1yv2tGiTY6hItEFfHKFZfvVFhcynjs
 giKfLjwFD7lPVQdKCyDPNLfyw88Ue+pNxm7bxMV5ls7+SwCOTOSn9nuqz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290908858"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="290908858"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730515051"
Received: from htamura-mobl2.gar.corp.intel.com (HELO bard-pc.domain.name)
 ([10.252.185.30])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/5] soundwire: qcom: use pm_runtime_resume_and_get()
Date: Wed, 27 Apr 2022 07:56:23 +0800
Message-Id: <20220426235623.4253-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
References: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_noidle() pattern.

No functional changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/qcom.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c40c25f2d264..c244d31805cc 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -510,12 +510,11 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *swrm = dev_id;
 	int ret;
 
-	ret = pm_runtime_get_sync(swrm->dev);
+	ret = pm_runtime_resume_and_get(swrm->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(swrm->dev,
-				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
 				    __func__, ret);
-		pm_runtime_put_noidle(swrm->dev);
 		return ret;
 	}
 
@@ -1059,12 +1058,11 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	ret = pm_runtime_get_sync(ctrl->dev);
+	ret = pm_runtime_resume_and_get(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
 				    __func__, ret);
-		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
@@ -1253,12 +1251,11 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 	struct qcom_swrm_ctrl *swrm = s_file->private;
 	int reg, reg_val, ret;
 
-	ret = pm_runtime_get_sync(swrm->dev);
+	ret = pm_runtime_resume_and_get(swrm->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(swrm->dev,
-				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
 				    __func__, ret);
-		pm_runtime_put_noidle(swrm->dev);
 		return ret;
 	}
 
-- 
2.25.1

