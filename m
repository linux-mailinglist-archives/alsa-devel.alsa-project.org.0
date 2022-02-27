Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D874C9F74
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E511B30;
	Wed,  2 Mar 2022 09:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E511B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210338;
	bh=1GmOTfZB1gRtjllzjStwO6FmizIx2RrWC9twggRF21Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHHLHKrl/UjaDwaCNSD2sXruNLswj9rh1I+RtgfYc7mmddFXS3dyDa0iADk7SORcN
	 WlSLKPbfSCCtMmMtRte35euD5n7Nohtz5Fk2F/IQilj+gIuFJiWazbP7PCyUkbt7Jm
	 d/l+5G4Ap/iVB8Kk2p7uTJStUXrXZzX57wNMcqdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B308F8056F;
	Wed,  2 Mar 2022 09:33:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59AADF80155; Sun, 27 Feb 2022 14:53:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39D26F80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D26F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="f+9ahMvV"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C18383F02B
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645970031;
 bh=Ittcal6Pd+WYY4FgdYnMj0oR0y7noG6anoPNpq8mwII=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=f+9ahMvVameVCdu+/MgahsyMnQ81znGRoh40ixCWlLjVeKl063mdm51LNJdyE1uRI
 Mb+XcnwOhen1JsVerLZ3tLzNvp1dSpFBre/jlmI+nG03Y/agyJ8Fix3q+ivDl5uJXH
 atNQsmEvVjK9kcfslvtJmDZAEChJsWuYSjmmw5c59YZ5v6ALLQPPHRfFeDqR2nHKfB
 K6/jRued9vnw+g8xzYD5aBCBQTt2qdmlUc8N2D0Rgu0+VkmWbye9JcyCuhL5lukP+E
 xgR4anmQQciD/2VeRl5t4G/QqcK9FI/kqDWcltbVLMFUEWLh6dk1mpLTXrEPa6Hf9h
 QeRHqzhe4LNug==
Received: by mail-ed1-f70.google.com with SMTP id
 j9-20020a056402238900b004128085d906so4190187eda.19
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ittcal6Pd+WYY4FgdYnMj0oR0y7noG6anoPNpq8mwII=;
 b=HTvF97d1vThr3yT2IdTuXGZvYAWUP1ChBsk9tw4Riz9KuLKJE6ks+76NagGnGaTskh
 POuVJ9CyBVtsdsaYb9Vlf7ugfGSe2zDEEXDigA7wLBRwYbe+MO4IyNeZSZQqCwesIdwG
 b2fBFe2CpV3ZaCYjs3XqY7NuU72eIWwfsypiTLBJ8KJuwCSe7OUTzlLUa9I0BaEtCGqw
 LgpImev4ENXSju2UbZfBXXcT9hnGre21u6vexTNt90RjpX8I2kSKxp7dFqTGBq7UKrFh
 Jk6J5axW6jVsyNxMcZyFgKFDGcdzl5qHzO0F7pumtBWHIcmwKXjdawX0rI2mUlANrS7E
 e6mg==
X-Gm-Message-State: AOAM533FEchraYRLsCBnL6nnAvmYzj9EFIhpggNvCtTVAXnjh8+cStb/
 2TeC02xopU/I/tCaFb01fGVcM5xqtH9Kohv7e4qz61mpM0JdFKdCfnR22qmRLqOU4TW1OvTKGaH
 QLiCyQWuM/vLWIoOlZsjEsdRFJOsvtMipnCtuF3va
X-Received: by 2002:a05:6402:42c6:b0:412:8cbc:8f3d with SMTP id
 i6-20020a05640242c600b004128cbc8f3dmr15364969edc.310.1645970020956; 
 Sun, 27 Feb 2022 05:53:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGCAqzYcYv+6/2reZV+SOww6e12ONBNi9SinPyNgz1D+wg9pi5uHfXVkGat4zViryxXKoTAQ==
X-Received: by 2002:a05:6402:42c6:b0:412:8cbc:8f3d with SMTP id
 i6-20020a05640242c600b004128cbc8f3dmr15364941edc.310.1645970020805; 
 Sun, 27 Feb 2022 05:53:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:53:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 10/11] slimbus: qcom-ngd: Fix kfree() of static memory on
 setting driver_override
Date: Sun, 27 Feb 2022 14:53:28 +0100
Message-Id: <20220227135329.145862-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..e5d9fdb81eb0 100644
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

