Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665A4D7B40
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959A21883;
	Mon, 14 Mar 2022 08:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959A21883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241668;
	bh=yMKqS8W4+gVn/TltkMQGxHczFGqZ6AvntMdCRYqWfHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k2Ip1+bO18lUsCofHwyhz3tSatvL/laZ+2mkzmHv/+RMRrpEf0NOYZmHtMW7Ll2+n
	 U1BB/8ziK1AZtDXDtAFk1svQF90mwttgiHwFPOK+vHF3jCNLUpCzbBTwwsIXM7ntPW
	 fJD7FXMdKGk3JPIGQo1huI1aW2tGNHjhNLx2R2gM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 521DFF805E1;
	Mon, 14 Mar 2022 07:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B720DF80171; Sat, 12 Mar 2022 14:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACCFCF8025C
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCFCF8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="XbD4yeG8"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6400405B4
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091773;
 bh=wjZwot9f8/6VteNlj7+yTRpLXeLfeCZvZ3XmJn6m/ng=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=XbD4yeG8zEqpcOpeWAtk8ocxjWDyEhsopP2iX/RjPmzUYpOhcjay6H5J5v1tumuDR
 Uc7M3zX072fXEUPPvkdNEERkX64ZDZbmUZCThisLjuN5mTG2yvG6xNA1TsWOaHuuXP
 4RBzXQXiTvNt/9ken8ELipsrofW/zaHMgfmtdVx+G49aEvOyXc1MFTmrkkEi5rXu+8
 IJDOJiXMrPWRUJxU/G2KoclNxwh4CHzAyzKW1IE/LEZ8q8i3FKwdlDvPS6rd5H0ESe
 LvYLJ9uWegv3rWNYvCbWm1p4r0a1UuO/9xk3nKnjG0MxrU+ztkCQn2GNffSQuJeoRE
 OwM/6q8kuWFmQ==
Received: by mail-wm1-f71.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso6906795wmh.3
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjZwot9f8/6VteNlj7+yTRpLXeLfeCZvZ3XmJn6m/ng=;
 b=J0OmxFi/yFkaSrDCgdNBwtn2skr988+NhWEuejTldMtFBeZoEJl0clstuJJ39VP6yz
 JprnCk+2umEi/wt+SYUSq9jay+m2yBma18djVd/DG5OE8HqqdnGneihvtPgf7t/LJlDF
 x4VXQiH4tXHsxPUS1zjCxY0AuWClH5Xq9pUi/7q4E0w+lvE/pokIiH3WnqXE7uQaZqLk
 +Ag12JY9yLOFwtU8jsraX9D1LmujPyvwBqEFfDV0j/ZwJoH+oO3RicdApL0ZGyxN6WZE
 ifNC2DyPoFfdjqGQntP9xmE3NWqAhSht6sMkE2JL2nreUAABx1+Pvwx1XFgdZZ2y8BCL
 bgsg==
X-Gm-Message-State: AOAM533weviYLlv/3ksLVzShq5Fv++XWpB7Df/buwvxU3TyshJ/aqIG2
 NmPq36ixvMPwIdLZmpUzq45iHBTgpXQ+OE2R1kFPXWSPSUp6MKGL2IDZAfnTUUmq4e4xpISjFs3
 TaU4Bm+iTANBYok+wuDdsi2XejJZctgbZvlcB3ZSH
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr10364645wrb.514.1647091772815; 
 Sat, 12 Mar 2022 05:29:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyelFNDw+KjZ7SCVNW/uSQN6y5Cx82RSy4B7GdAXYbkw1fNE1IGPsgLOaQGJqZ3rrBpRaBuDg==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr10364629wrb.514.1647091772632; 
 Sat, 12 Mar 2022 05:29:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 10/11] slimbus: qcom-ngd: Fix kfree() of static memory on
 setting driver_override
Date: Sat, 12 Mar 2022 14:28:55 +0100
Message-Id: <20220312132856.65163-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 Shawn Guo <shawnguo@kernel.org>
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

