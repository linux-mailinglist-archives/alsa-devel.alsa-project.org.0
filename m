Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3B506B9E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 14:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E447118F0;
	Tue, 19 Apr 2022 13:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E447118F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369625;
	bh=VEmOpcjnL7XGeyl3v3Thbp/Rsyd+Xhm5CY+J0slY/88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VoHwxR+iDGSFMs2m8SNk/Emh+Rh9JcU5QZLk3hZvdaVEp+X9YeTmWVRAyX/jZrpL4
	 oImiEjUWTYLmD/g2+HnaJxsdBUUR+sHfKDFWxszahaWtB/PhX91+bVymV2MKX5pfY2
	 udZQyYHhyxKdhrIeUjkI8/uthIq6A/8hC4d77MYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 127E3F805CB;
	Tue, 19 Apr 2022 13:52:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E402BF804FD; Tue, 19 Apr 2022 13:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A5AF804F1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A5AF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zVkWhAv5"
Received: by mail-ej1-x62c.google.com with SMTP id t11so32219439eju.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za2ChgFa2MAb73hYI38RRAcoAzGnc/qyPQX8xgHdvQM=;
 b=zVkWhAv51DVC1p4aJpiAjPCoWQril/21gAKuMsm6z+0NXkTbr3mNaIqUaZFcjR39cY
 v4OMQBXlR/2rhpUCTx0VbESTsmsehL0V/OOEUkWQRkkVnA5m6023KnbBO9lJSa8rsIY2
 /tvt+ZeGz8iYq05ODrVkPfPZK8t74hDar82Awg+fciFFk2Qd2NRV/6z2dC+Ds9ob3PSI
 mNw5Vt41Pgcg5nBS6798wd5iqS4jiUWHQ3/NMJ/nlbxPJyi3xKd5m7ZfgU/xleQBIUs/
 ITljrACLgzODper1Rl5lTvuiSCAyj79YAn5Qn9t2W7PwalGl5eAtA378B8fj3iSS5XxU
 x/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za2ChgFa2MAb73hYI38RRAcoAzGnc/qyPQX8xgHdvQM=;
 b=R2oucu9ITBWBywX3/wxG1cgYsJxrMO53LKgRPOd8NJN24mj+35+DksMf325F+x6qkA
 UTPDBIONRnGsQBjZP/Giqm2lQHiS42CihoZAqr+1Usoc/9FuUkqK2lvwrfAHz/H103wL
 i/zQokRJz/HxlOTFjGppYaiLt5vAFv/3UB6ESLmvk0QukRmlB46ypYNbUIAU61CcM3Qp
 8pvh9ieoHujHqbrqnE3v0rRu0uV7xCvXjhQ2Pb6GkaZ01rl6qNvVS70pgehekmbtldNl
 RXYZUIRXitasAIOftIChPbzpYaMg7WG3FhSDh2Z0vT7dkq91pxvhmidPuSEbxCHdKSf8
 6XUg==
X-Gm-Message-State: AOAM533DHvichC9egNH5P8pBLj1LfRK/piwsU0ks2CmqADhxqRruFO2Z
 l+L+yQ6rQ3maI8PuVFca+ktEcA==
X-Google-Smtp-Source: ABdhPJykXBXYimpAeumTHTNdPOwvvfUNc2rfx1d0CpWSKysWkExiziY11QDQTp0Hk2gdb+t7K6B5eQ==
X-Received: by 2002:a17:907:2d0f:b0:6e8:b710:a68 with SMTP id
 gs15-20020a1709072d0f00b006e8b7100a68mr12790234ejc.510.1650368103349; 
 Tue, 19 Apr 2022 04:35:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:35:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 10/12] slimbus: qcom-ngd: Fix kfree() of static memory on
 setting driver_override
Date: Tue, 19 Apr 2022 13:34:33 +0200
Message-Id: <20220419113435.246203-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0f29a08b4c09..0aa8408464ad 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1434,6 +1434,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 	const struct of_device_id *match;
 	struct device_node *node;
 	u32 id;
+	int ret;
 
 	match = of_match_node(qcom_slim_ngd_dt_match, parent->of_node);
 	data = match->data;
@@ -1455,7 +1456,17 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+
+		ret = driver_set_override(&ngd->pdev->dev,
+					  &ngd->pdev->driver_override,
+					  QCOM_SLIM_NGD_DRV_NAME,
+					  strlen(QCOM_SLIM_NGD_DRV_NAME));
+		if (ret) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return ret;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

