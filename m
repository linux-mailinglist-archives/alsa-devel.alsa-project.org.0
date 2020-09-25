Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CD278EC6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ACDD18E3;
	Fri, 25 Sep 2020 18:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ACDD18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601051920;
	bh=RYQGin5uAJR7bU8GEwvchS+SF7GB1wo9XZwKDyxdVHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2n2fJCVBUaDEPb1bhx+FoPzVm4vFrJ3iS+voIoNIIi5AfnZAJykM53LdvyWX0/6n
	 bZlJU/6hCaSbFEEr0sXfPgWeHSgjxBkvO0hR7fOoL760DS7IUEJegDR+WoMNldM6Hk
	 ujFNUJKgipiw5mSrqdx3gxrNCvnxkanKHTkBU2Vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD8C0F802A2;
	Fri, 25 Sep 2020 18:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5404DF80254; Fri, 25 Sep 2020 18:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D36F801EC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D36F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zyX82bt+"
Received: by mail-wm1-x342.google.com with SMTP id w2so3678727wmi.1
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bpd0ex9vvY6SQ5en4jWq2M6OKTm6oUME3P+ZpZGPI6s=;
 b=zyX82bt+ytgyrk0f8RwzH58E0OfhMMqY4i9QNq2hlE+OzJ6A8byCHFixtWFxJji7ab
 9lHFpmIwEE2gEvUpODGZlnvcnITt98a0hj4+cHsCbUBOwDDIdy5dGUaZGKy0R5bC0Llg
 BNwqX3OJlS1wL/zTNpAl0icxs88BJJq/Li0k14roL19lJDDq4gOb1RZvJfytWg4vkOUw
 2mAmGK6NDbgLICCJ7AuO/Q/SO23Q4K8bk4Togq7ifTrtQ49tLHevh09d4J08vGU0akeR
 5YPZDCS/YBWOKGg2A5CoEKkiHUKl/RA6sHJUKGYLFojRFF0ZGSPX1D603DFAk/XiNgrG
 sv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bpd0ex9vvY6SQ5en4jWq2M6OKTm6oUME3P+ZpZGPI6s=;
 b=NjA6+EOWhPv8kFtX1O/pFA213at0QTn7zu6co+Ttt57T8NUi2AAEXzU9Eh7a+DtAWM
 cPPeoYOFq3GKyFFn8ZBjpOjxrjPB+6+bHUlQG+rPtsn/Dkbj6Ed69nCD1jWls+2Vd4Vc
 C6QKy3j0E2rnlMH4xsNQRTJ/YTRhYWEfXMx1M6rtqXVLl6/Hqnqbwcwc5QsDfE0A5tc8
 6Cce95EbpHe+ty36qQxxsBR+6cl3TF+KaFhKPx+lJRXly0HArfSVCK0q1FhcZRArYJLc
 ondl5+yEVLmHC6Iwy2tqI38ecAECKJ5/YrTM4/b8Taq+6ZfZbgL1erx/ZKQUzLKr1PNI
 IOLQ==
X-Gm-Message-State: AOAM533QyAKEkmh3J9Oy1H/5mwhchhtVIBrVAF1nfgSVSKE6m2x4+SHF
 010JHueJ0oEMIE2BkRZDzcv35Q==
X-Google-Smtp-Source: ABdhPJxCqksHMhJ5v/p3c6y2QZzOnEUWDGqb0X0nE9xPUfRvg+gK84eHkkl2RNzUwq5OiElLpfIAjg==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr4075058wmg.178.1601051756621; 
 Fri, 25 Sep 2020 09:35:56 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm3733883wro.18.2020.09.25.09.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:35:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: qdsp6: add ifdef CONFIG_OF around of_device_id
Date: Fri, 25 Sep 2020 17:35:51 +0100
Message-Id: <20200925163552.20717-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925163552.20717-1-srinivas.kandagatla@linaro.org>
References: <20200925163552.20717-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Add ifdef CONFIG_OF around of_device_id table to fix below
W=1 compile test warning with !CONFIG_OF:

sound/soc/qcom/qdsp6/q6afe-clocks.c:254:34: warning: unused variable
 'q6afe_clock_device_id' [-Wunused-const-variable]

Fix this warning for across all qdsp6 drivers.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6adm.c        | 2 ++
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 2 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c    | 2 ++
 sound/soc/qcom/qdsp6/q6afe.c        | 2 ++
 sound/soc/qcom/qdsp6/q6asm-dai.c    | 2 ++
 sound/soc/qcom/qdsp6/q6asm.c        | 3 +++
 sound/soc/qcom/qdsp6/q6core.c       | 2 ++
 sound/soc/qcom/qdsp6/q6routing.c    | 2 ++
 8 files changed, 17 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 2f3ea6beb066..72f29720398c 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -611,11 +611,13 @@ static int q6adm_remove(struct apr_device *adev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6adm_device_id[]  = {
 	{ .compatible = "qcom,q6adm" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6adm_device_id);
+#endif
 
 static struct apr_driver qcom_q6adm_driver = {
 	.probe = q6adm_probe,
diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index 2967f4546af5..25b409597d51 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -251,11 +251,13 @@ static int q6afe_clock_dev_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6afe_clock_device_id[] = {
 	{ .compatible = "qcom,q6afe-clocks" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6afe_clock_device_id);
+#endif
 
 static struct platform_driver q6afe_clock_platform_driver = {
 	.driver = {
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index d58b86a98114..4e1f101281e7 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1689,11 +1689,13 @@ static int q6afe_dai_dev_probe(struct platform_device *pdev)
 					  q6afe_dais, ARRAY_SIZE(q6afe_dais));
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6afe_dai_device_id[] = {
 	{ .compatible = "qcom,q6afe-dais" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6afe_dai_device_id);
+#endif
 
 static struct platform_driver q6afe_dai_platform_driver = {
 	.driver = {
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 688878a002a4..0ca1e4aae518 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1750,11 +1750,13 @@ static int q6afe_remove(struct apr_device *adev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6afe_device_id[]  = {
 	{ .compatible = "qcom,q6afe" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6afe_device_id);
+#endif
 
 static struct apr_driver qcom_q6afe_driver = {
 	.probe = q6afe_probe,
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a1dd31f306ce..c9ac9c1d26c4 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1334,11 +1334,13 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 					       pdata->dais, pdata->num_dais);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6asm_dai_device_id[] = {
 	{ .compatible = "qcom,q6asm-dais" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6asm_dai_device_id);
+#endif
 
 static struct platform_driver q6asm_dai_platform_driver = {
 	.driver = {
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index d745a02fcd5f..790abc135223 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1733,11 +1733,14 @@ static int q6asm_remove(struct apr_device *adev)
 
 	return 0;
 }
+
+#ifdef CONFIG_OF
 static const struct of_device_id q6asm_device_id[]  = {
 	{ .compatible = "qcom,q6asm" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6asm_device_id);
+#endif
 
 static struct apr_driver qcom_q6asm_driver = {
 	.probe = q6asm_probe,
diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index ae314a652efe..5358fefd4210 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -354,11 +354,13 @@ static int q6core_exit(struct apr_device *adev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6core_device_id[]  = {
 	{ .compatible = "qcom,q6core" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6core_device_id);
+#endif
 
 static struct apr_driver qcom_q6core_driver = {
 	.probe = q6core_probe,
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index b12539fae6ed..53185e26fea1 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1143,11 +1143,13 @@ static int q6pcm_routing_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id q6pcm_routing_device_id[] = {
 	{ .compatible = "qcom,q6adm-routing" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6pcm_routing_device_id);
+#endif
 
 static struct platform_driver q6pcm_routing_platform_driver = {
 	.driver = {
-- 
2.21.0

