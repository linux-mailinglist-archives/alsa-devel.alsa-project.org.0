Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12B29AA67
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 12:17:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2891690;
	Tue, 27 Oct 2020 12:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2891690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603797437;
	bh=Pi83sO8WKq7d99GP9+7KA4BR43gCmmSUdBwPwMqaXls=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2W3l1CWNr7jTJV5wUbx0ChjlfvQu0p2DUKYVExgHjVoCf6Pv+UrzaRetxLq8gK87
	 4faaQQjiIYp4MweT6cffUszOra+k+hAq7fqsWAwa6leXzTXoJB28AtgTxIK4tTAaNu
	 zozyTysfiMF6A1xIsh+Dg2OraAB84pfILmaYlMrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1353FF80086;
	Tue, 27 Oct 2020 12:15:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69301F8020D; Tue, 27 Oct 2020 12:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2476F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 12:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2476F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G2kdLdWg"
Received: by mail-wm1-x342.google.com with SMTP id a72so968983wme.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xbK4gaQOq/bUIpGKsNMyOlQPjutx0rk45ygjxEisbnA=;
 b=G2kdLdWgqqNpX0bHSEyClwKPVbiN9Z601TcVF7VcvFRhmiVDqZOmtqpHktu3xjNwAP
 XHVevvLEQN6Jt2NnsNo84o4wnVn2Pn4NxO/fDLFoeXvT5xkf2RGqmKUGh5q4K6h4hB1M
 96lC7xaRcuDWtmw2bKiyG/cpk9fPQ1Iu6QoQvE1MIET5pZb6qDXa5IKAomYqTs4Vi9WE
 QaeziN7lJuAhErao83OxwprCQkLRi/jH4F7d8ToTKJwggdzaqrIQpT+5TV+tU6V/Jhvy
 JGad2ozTs2IxBhz64xb+neNRrvFp0TTjK7/LWA1ukC1bT6ooiMEzLOzfloh8M11HzvPS
 4utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xbK4gaQOq/bUIpGKsNMyOlQPjutx0rk45ygjxEisbnA=;
 b=gncQ2NYJgl2DVmaduxRzxgo5jPqvD9Y+iiDagVP9XNGVC0RR8NdUVNan5Dao5aV1NQ
 zWehAyXKbiQFHvxwbGBay8BSb2svA56PqYnatciYd4nWc37ite9ZqguapI8lJwb2RyEe
 H18DsSmEgVe45olS8vJQkTgCk+hVun6RcVL3tYKFvSEMlXkbNKM/wijejkDHuQxRA9f7
 A0H6EOMbIKmiAs+XuPHbXflP0OhQXkjmWrbieelEe3J9Gxt8VVlGPxaK1GF32vY8ThfG
 +z40Dz2Rf0zxxYuftVM0AxbxNdEHoqS3Yzv67ErevXkAJVc2iu1UqU1rQtVAmj7u0jZe
 SoHg==
X-Gm-Message-State: AOAM531OChDc7S6I8NJMX6HeXThvgRo+ZHxeh6gdZ/RJdBBRNHz4ydMf
 qIVlBXjF8VfL/yvftO9dSHbyCA==
X-Google-Smtp-Source: ABdhPJwl1KRQS9vpklnvJ9uNX3G3YrMEoK/TYMxOg2TsH6GhK+eMJXROXcnfkF+Z4VlwIoXFqroUNQ==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2267889wmi.140.1603797335725; 
 Tue, 27 Oct 2020 04:15:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t62sm1495432wmf.22.2020.10.27.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:15:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: qcom: qdsp6: make use of devm_of_platform_populate
Date: Tue, 27 Oct 2020 11:15:26 +0000
Message-Id: <20201027111526.12326-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

make use of devm_of_platform_populate to remove some redundant code!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1: rebased on top of sound-next

 sound/soc/qcom/qdsp6/q6adm.c | 10 +---------
 sound/soc/qcom/qdsp6/q6afe.c | 10 +---------
 sound/soc/qcom/qdsp6/q6asm.c | 10 +---------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 72f29720398c..1855b805eba2 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -601,14 +601,7 @@ static int q6adm_probe(struct apr_device *adev)
 	INIT_LIST_HEAD(&adm->copps_list);
 	spin_lock_init(&adm->copps_list_lock);
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
-}
-
-static int q6adm_remove(struct apr_device *adev)
-{
-	of_platform_depopulate(&adev->dev);
-
-	return 0;
+	return devm_of_platform_populate(dev);
 }
 
 #ifdef CONFIG_OF
@@ -621,7 +614,6 @@ MODULE_DEVICE_TABLE(of, q6adm_device_id);
 
 static struct apr_driver qcom_q6adm_driver = {
 	.probe = q6adm_probe,
-	.remove = q6adm_remove,
 	.callback = q6adm_callback,
 	.driver = {
 		.name = "qcom-q6adm",
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 0ca1e4aae518..daa58b5f941e 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1740,14 +1740,7 @@ static int q6afe_probe(struct apr_device *adev)
 
 	dev_set_drvdata(dev, afe);
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
-}
-
-static int q6afe_remove(struct apr_device *adev)
-{
-	of_platform_depopulate(&adev->dev);
-
-	return 0;
+	return devm_of_platform_populate(dev);
 }
 
 #ifdef CONFIG_OF
@@ -1760,7 +1753,6 @@ MODULE_DEVICE_TABLE(of, q6afe_device_id);
 
 static struct apr_driver qcom_q6afe_driver = {
 	.probe = q6afe_probe,
-	.remove = q6afe_remove,
 	.callback = q6afe_callback,
 	.driver = {
 		.name = "qcom-q6afe",
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index c547c560cb24..a6618efe22f2 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1727,14 +1727,7 @@ static int q6asm_probe(struct apr_device *adev)
 	spin_lock_init(&q6asm->slock);
 	dev_set_drvdata(dev, q6asm);
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
-}
-
-static int q6asm_remove(struct apr_device *adev)
-{
-	of_platform_depopulate(&adev->dev);
-
-	return 0;
+	return devm_of_platform_populate(dev);
 }
 
 #ifdef CONFIG_OF
@@ -1747,7 +1740,6 @@ MODULE_DEVICE_TABLE(of, q6asm_device_id);
 
 static struct apr_driver qcom_q6asm_driver = {
 	.probe = q6asm_probe,
-	.remove = q6asm_remove,
 	.callback = q6asm_srvc_callback,
 	.driver = {
 		.name = "qcom-q6asm",
-- 
2.21.0

