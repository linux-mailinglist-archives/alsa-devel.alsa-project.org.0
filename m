Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7864DBFE7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B70D18ED;
	Thu, 17 Mar 2022 08:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B70D18ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500589;
	bh=QGBVmDhCU/zc1APf6ONvWWXrIA6lWoLe+K02lZL6a68=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C73/2QJbYvc0YtRraWdpScrHKNCIrKK2PYLIeyH3f/wduX0nRtqZCYA0WXGgxvz3I
	 cp4MPIDcvaz7l7PKfUI/N1x1uuzJYeAU9vnHDjjsHlbPnFpo8fAQ8GBQbfiuRxYXb4
	 nMeZmfA5Jf19A0DfnUg11R8yZqrNs3NfZNjsSF+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A13F805DF;
	Thu, 17 Mar 2022 07:55:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA745F80311; Wed, 16 Mar 2022 16:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85122F8019D
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:09:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85122F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="i2Xb9Mhz"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 308F03F5F4
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443344;
 bh=T7JLnH9mqiYxWSJ2Xi+hqpmFTONALX95DZP9Prs/CTQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=i2Xb9MhzTdE+lE9OaTOdm5lssR7LIHkhHZcQk+GxGLVjMfzP4q1EpOl3OmDLCn2Hs
 xU9kPLuL9sHGb7idnp2OtNcmSuB4xVMRzL3HzTHZdNW1ymEgq4viYGLlH0hz/iM2kF
 OUHlYcrpm53zPfWgiyUoaW6Zazou2yZE2B49ntkQLPLldE016K5wwGugtm6h2iFTWP
 IuRj79EG5Tb2kM6rxrh0JB9pk8XmeNKc7VUJQpofWCNT6Q3E+wN7lypAPutcjtoM2C
 vPsjUybK5SbgBJvpheJtVoNPys+5w99huk6JJGlK7Q5kLoDEsM/xD372DKnYJDkptG
 cyKm6ONJJSLhw==
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so655094wrg.20
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7JLnH9mqiYxWSJ2Xi+hqpmFTONALX95DZP9Prs/CTQ=;
 b=0277KsuhnSqcIDoAp38mByiXCSvc/yg+bmMtwcrvhY25YslX9kbz6K33LBMWr6ANcH
 mYApporDEYHfjOqicKB1tGPhfdGD2Fh5QqJYJGN+C+CNEbW3F51L7zIpdmd8pvwSEh9I
 UNEf4wBFPutDxrMNI4bBSza/cKtP16g7hJbMIrRCqF1hnH5D9u7LNqEmoQxdtQDxUGI7
 T1doGTaA/fFmv4xceAf93YwOPdxVgwRYg4eVGXn1KRURwHESy76oNmnmQaWags6sf76y
 ky+lU2YksbZprjicAh0YtIb9QxqphCXx0vlVvZPruNwvFo6R4huPuItsZVBKbKKNvngl
 NZaw==
X-Gm-Message-State: AOAM533mfz/ymB2n6Xwyl+5xyYqMTOJ6CQ6XXqMtqb5D52sEkJpHE0YB
 9ergPi9OmgAbx3qnKcgRjcseszA1+Bfl0BsqLkS4O//wiKl9s6vXzascff49ESWCbXpfrSxHz/j
 TWdvWYzEC+aUwoGDcd546eC0dw+LMqZ6DNzStLP0b
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id
 98-20020adf816b000000b002037faea245mr273633wrm.619.1647443343719; 
 Wed, 16 Mar 2022 08:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiZS5X9++Ir6ARAdY07waJfT3FXmo4jW7vzpJuptfIiZFzTOsJAweK7fuoToT0HCAq1Xxe+Q==
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id
 98-20020adf816b000000b002037faea245mr273589wrm.619.1647443343503; 
 Wed, 16 Mar 2022 08:09:03 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:09:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 10/11] slimbus: qcom-ngd: Fix kfree() of static memory on
 setting driver_override
Date: Wed, 16 Mar 2022 16:08:02 +0100
Message-Id: <20220316150803.421897-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-spi@vger.kernel.org,
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

