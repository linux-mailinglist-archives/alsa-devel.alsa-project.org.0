Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D84BF96F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:30:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C91E18B0;
	Tue, 22 Feb 2022 14:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C91E18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645536625;
	bh=Ryv1QBksLIQKLZ3P58pGjf+rlBEznVp8QJtFu1VBg7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZX+Tq17hzygz6Rmj6Su1rsZpTp13RJcl5fzg8oy8owBbfLvFJlI6WYHURXo3GxAM
	 m8Mpg+lWNSv3cJtP1yK38Tp9UTTOPWIgaETC+Ikl+YiO/xOAVnppztHRKljpna+5SB
	 iFL7h1jM7a9hJBtV4gV6+fakTPa9HW9mNCDRGlxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C249CF80515;
	Tue, 22 Feb 2022 14:28:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90ED0F80311; Tue, 22 Feb 2022 14:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38663F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38663F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="dkYI8QB+"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F7CB4030C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645536525;
 bh=4gAKTfhEbiOa5VKlvnZrWEbzuOeUPflEFSiM68fpB+I=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dkYI8QB+a7ihANAbPp67FEFYSsTNU7f+rC+C/bV0S9rQ4WP5qUoFjkZa4gza16jvU
 cP0TSqxFDRjILd5ggExIYtRMR3Ql0+8HEwbIZ1ywFXs60RFnOJS02ZM4sR0QIKFWCs
 eaxREbZn9gis9Y/dy/BS2YQm1WOfa1Rvt0mtlUp2xc9gumju1UCnYQjVEXdLhaUrps
 d8RljRvvp068RxFSPE9gnoRvc00sjabOYqf+qhRBnYi2XoXnArV/RptJSxvv5UwyUF
 98BKEIIjI7tXBjKm1z25FqwmTkXCkWP+v7YQUB1TAS+4ikgvkrc3se3clYy4iPeTbU
 3RscVdDMUeM2g==
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402278d00b0041311e02a9bso2774194ede.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 05:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gAKTfhEbiOa5VKlvnZrWEbzuOeUPflEFSiM68fpB+I=;
 b=5hJWcXoxB05uTtV4GCiSnyQCa9kz6lzoATRc+yLYKvibmWDf+mYl6DoJRZY7goHU8D
 0ieF8+o7d30MAf0c3BTMFMZKiqHz4u2NZ4lFOQSh8WaVxghNPYaov/ijMauAEQ9owLNC
 18BG14aMzlytCDHRNMwoJw68iQr5vdVhMlCrLZlKnPPHWocUAwp34RP6FoGVRyF8nWPS
 exqfibj3+zCgVefiszNKGds52bjJFZ+H2IpNr/DLBS1d+xsmYLLo04GNM60jfpbjfakr
 v8d1POl1bnRF+eWiZFv8ZNJ04Jg2R1BQu+ubbw6/R6aPty2k1zBD7WxVzWdBq1U99Vr6
 Sirg==
X-Gm-Message-State: AOAM533s/1iZ7B7xZwAG3AuIen0Hiej48JtB83YXVJjgAtPXkavSzsWG
 uLVaPgXDG03qbmMCR478CCKRfns/Donl/Fp/p7D9W0/fEk3Hat/O6PwmsVMf6BQB6LSfOQ6mmoz
 HvfWjKfYBaj17OQAdXevHH9z1JX0og7+ZGajXu2wq
X-Received: by 2002:a05:6402:50d2:b0:413:1cd8:e08e with SMTP id
 h18-20020a05640250d200b004131cd8e08emr4730752edb.276.1645536524867; 
 Tue, 22 Feb 2022 05:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyk7fFQMdh++yZYYeqYdt0QvvL2iwrOb2soDeyOFOcCMFVM9JS2wL10Ee7DBznFmZmRSj/ibA==
X-Received: by 2002:a05:6402:50d2:b0:413:1cd8:e08e with SMTP id
 h18-20020a05640250d200b004131cd8e08emr4730720edb.276.1645536524647; 
 Tue, 22 Feb 2022 05:28:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:28:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFT PATCH 3/3] rpmsg: fix kfree() of const memory on setting
 driver_override
Date: Tue, 22 Feb 2022 14:27:07 +0100
Message-Id: <20220222132707.266883-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: stable@vger.kernel.org,
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

The driver_override field from rpmsg_device should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 950a7388f02b ("rpmsg: Turn name service into a stand alone driver")
Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rpmsg/rpmsg_internal.h | 12 ++++++++++--
 drivers/rpmsg/rpmsg_ns.c       | 13 +++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index b1245d3ed7c6..c21e73ffbf05 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -92,10 +92,18 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
  */
 static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
 {
+	int ret;
+
 	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+	rpdev->driver_override = kstrdup("rpmsg_chrdev", GFP_KERNEL);
+	if (!rpdev->driver_override)
+		return -ENOMEM;
+
+	ret = rpmsg_register_device(rpdev);
+	if (ret)
+		kfree(rpdev->driver_override);
 
-	return rpmsg_register_device(rpdev);
+	return ret;
 }
 
 #endif
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index 762ff1ae279f..7d0605307d23 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -20,12 +20,21 @@
  */
 int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
 {
+	int ret;
+
 	strcpy(rpdev->id.name, "rpmsg_ns");
-	rpdev->driver_override = "rpmsg_ns";
+	rpdev->driver_override = kstrdup("rpmsg_ns", GFP_KERNEL);
+	if (!rpdev->driver_override)
+		return -ENOMEM;
+
 	rpdev->src = RPMSG_NS_ADDR;
 	rpdev->dst = RPMSG_NS_ADDR;
 
-	return rpmsg_register_device(rpdev);
+	ret = rpmsg_register_device(rpdev);
+	if (ret)
+		kfree(rpdev->driver_override);
+
+	return ret;
 }
 EXPORT_SYMBOL(rpmsg_ns_register_device);
 
-- 
2.32.0

