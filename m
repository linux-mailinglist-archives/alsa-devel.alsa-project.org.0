Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E425095066C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6902E2345;
	Tue, 13 Aug 2024 15:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6902E2345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555629;
	bh=IxBzL8jZcrNuPWO/7D8XwVLbEykT+21gC+FbHu5yEzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mye+LMDHcHtodculsUqpYuA8bS2aai5HrGfsAV9dxZXmK9q1rZTjo5VxBWfdrq2Rv
	 sX4kl189mwB3XB2oTzRU6idt8eQJXga02iTN1Vm6jyAQvrG8sYzwe6I4Bw7SpIoq/Q
	 DJvjR96xOVPbeIcGlscbhI9c3fwnS6RbILeUPhNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B455F80613; Tue, 13 Aug 2024 15:26:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B07BF80614;
	Tue, 13 Aug 2024 15:26:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7333CF8047C; Tue, 13 Aug 2024 15:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0DCBF8049C
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0DCBF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tqbAlE2w
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3685a5e7d3cso3371088f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554615; x=1724159415;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJOIZffdYgY6uiS66ZwE+qixLpFdnbV3QcaMFwjqIS8=;
        b=tqbAlE2wGeVM+TV8el3SUgPInuMhwgpdANf2Trh38juJK4bIvhPnvvUWzlrg85vUVe
         nQsOQyPCAM+kt944qBhtrVbhPHNDRj1jiLNnm9Gs/muMYujm/p3IA2UM45ZR3qabHWRM
         bXZRk2MZYCC1V6K/dBpUVFeVoLvAFom3hNvQCAaKi1TVE4bOloUuQ5EH5dQvPtFgbl0g
         nSistmfYBie/eGd/G+uabOTDDbI6jkRARPnonxjw6PdLiJBjFGhxbsDR/YxOjWX/E+bj
         Ogvls9fnz6/XoRpQ6sqrmN6Bl4++omPNuEz/clQfFJvvCvAIjmwa8GjIzFnxAfXgRQuz
         PROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554615; x=1724159415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJOIZffdYgY6uiS66ZwE+qixLpFdnbV3QcaMFwjqIS8=;
        b=mqcFXM4RZywbonjOg3Gz11zXdOYUWvFq7kPzg+fJlXqJaJyRiIqnZPkX0cnRqFrSDy
         U4T3BtuI7s5mrxBIraRX9kn5uOg+DsxGQQjXmLrJL2aJOTxp2E0ydJjL7tdED+CJnC7f
         nSD56D3c55fbmI5/5ug7vtsbrZhFBcusJzKANbNgOtjqGJ9eSelaY3iOz51GBI7evezx
         iXJqXbdyImJFYD1SI0pHO+mU6sSw9nOd6r5xPN/mcb2gItM3aSmKBMRHJ7WnLeRdlOmg
         tSMdw17357btiY46bt4YIWnJE6PC2QKTzQ+gf/pBShwXP9xvO6yfsF/gc34YzgxRr42W
         V69g==
X-Gm-Message-State: AOJu0Yz9jbWwkoAloTTKfg4/2Or2bZi8ofVZhCDEf1t4GD1CFX0feXjy
	AbYy9wb0hvgo8M8mmMWO7TSkTENJ2znQtiJyrm2ooi5J3IcWqfmvxj5eUUCWKfk=
X-Google-Smtp-Source: 
 AGHT+IH2fWoDkGNXR0eRrjdb6m7GxMgF+j9Va9DvtxfYZzZLGqKP3dmGXHQVk6zw5owlp+AcpM80rQ==
X-Received: by 2002:a5d:5f55:0:b0:35f:cd7:5ba1 with SMTP id
 ffacd0b85a97d-3716cd45ff1mr2848538f8f.60.1723554615211;
        Tue, 13 Aug 2024 06:10:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:51 +0200
Subject: [PATCH 5/6] soc: qcom: pbs: use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-5-cfb67323a95c@linaro.org>
References: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IxBzL8jZcrNuPWO/7D8XwVLbEykT+21gC+FbHu5yEzg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sjtqc3LW0OQNAOtQMO9+aLWWp94JHd3wNgK
 r/V4thgZHyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIwAKCRDBN2bmhouD
 1xhVD/0RgrZURCzpXb3YXvnPk6hKrlLP06DLbvCh62dHZC7woXTSyVi7a8IL4ASirn+Sb2K3X9q
 d3xyu3wLmnNLwCMt8/oAbK8OCelqtGjohE/HWKV+4w2dpHLI+BfdBlv9dXG07iWeDFGImCtYJaf
 FHZQD21L1VuhPv53cz2rAnF0t1rsVh8Py6TNfOTQ4Xe3Ko9WCYtqS68W5hzuNHs+bnFrKgARQYa
 xzPw8NoDX2Z7iXZSGQ4iEhM9W/HLPAeAlGPNnaqLkucx+mp/uNWmCIouUYtZJdwn8+kjSvH+/iW
 xSEn7wI2yxrAj9PeGCxbz50rnvkuj5xcnRKF30sJSYhm+O9VVq8b4CffXZH6D2FFjYkJfLLxtXX
 hELXzZnEaihOvGuY6FkBLWg0bpVeec/vgG93UtmE1/yArs+kyqtaPAkrcYk6TnJDZswr/Nry7jN
 QVZ0sMCg+uP/BVPmokjBVl3wvRKuF1qJ8q1hsKs6yYPKI04ow/NnPPEMBgFqEU2NZWd0MNlu2vX
 8l1HxlV4MpRquSCvz5L7/VG35i1kIOimX8/tLkip0PAlD/pOBGZPtargXrpTgyhy2l9KcCqU+hG
 tF9B7iEHl8akSUQtX2rairPy+sOwumSqE+jvjj8y11gFz27qtrNI7vLXop7r2tNleIoDP1IgACA
 wfFtE7W6uRM0Oqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 776QZUWNLQL27R2EQJYMH5M6P7BAZPN7
X-Message-ID-Hash: 776QZUWNLQL27R2EQJYMH5M6P7BAZPN7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/776QZUWNLQL27R2EQJYMH5M6P7BAZPN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom-pbs.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 6af49b5060e5..77a70d3d0d0b 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -148,11 +149,11 @@ EXPORT_SYMBOL_GPL(qcom_pbs_trigger_event);
  */
 struct pbs_dev *get_pbs_client_device(struct device *dev)
 {
-	struct device_node *pbs_dev_node;
 	struct platform_device *pdev;
 	struct pbs_dev *pbs;
 
-	pbs_dev_node = of_parse_phandle(dev->of_node, "qcom,pbs", 0);
+	struct device_node *pbs_dev_node __free(device_node) = of_parse_phandle(dev->of_node,
+										"qcom,pbs", 0);
 	if (!pbs_dev_node) {
 		dev_err(dev, "Missing qcom,pbs property\n");
 		return ERR_PTR(-ENODEV);
@@ -161,28 +162,23 @@ struct pbs_dev *get_pbs_client_device(struct device *dev)
 	pdev = of_find_device_by_node(pbs_dev_node);
 	if (!pdev) {
 		dev_err(dev, "Unable to find PBS dev_node\n");
-		pbs = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	pbs = platform_get_drvdata(pdev);
 	if (!pbs) {
 		dev_err(dev, "Cannot get pbs instance from %s\n", dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		pbs = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	pbs->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
 	if (!pbs->link) {
 		dev_err(&pdev->dev, "Failed to create device link to consumer %s\n", dev_name(dev));
 		platform_device_put(pdev);
-		pbs = ERR_PTR(-EINVAL);
-		goto out;
+		return ERR_PTR(-EINVAL);
 	}
 
-out:
-	of_node_put(pbs_dev_node);
 	return pbs;
 }
 EXPORT_SYMBOL_GPL(get_pbs_client_device);

-- 
2.43.0

