Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80124C45B0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42C231B3E;
	Fri, 25 Feb 2022 14:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42C231B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794994;
	bh=2ja1xTe3J3d9H8PsjCyWFO8oCAQXf/SuLWTXEmVry3w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJwwaHVxxSps5ECDQQEY/9xUGqZ/QFmMefSO6MPpe60dmMgr4j5ddpAmsG/auhIqA
	 O6+HT1zqPLz2cJUkefjDF4UGp66QQ4qTDJiYIzZ17put+2wkLTsO7QNbxc0nDZ6b4/
	 1pSrnokQcFCp4H9UDrKRLh4zcX+MlDcQMcALAHkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CC1F8057A;
	Fri, 25 Feb 2022 14:11:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B565F80237; Wed, 23 Feb 2022 20:15:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF1F8F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1F8F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="tiNUIk3e"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E08CB3F33A
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643728;
 bh=WWBR/3RyyId0ctzqGYcSjorUZAyYEVp2bjQXWveQ/28=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=tiNUIk3eSaruxsUWAzCEF4Nw5NhVZ6b6k/dATi/hBJUT5Ljwr7grLR+84Hj1ueqK3
 gQJdjF74SaLaSn4VeGSFl+BAH9R65O01Q0I7RRTQkOyWy0OVx14bJyJ7c8PTde0C2m
 8EhAfSU49xqZ+GFReD9n0okzwG/CM07r5Psu6zwNZcpbrwuPYWYjzRlYy2h4po1FIV
 Y9jUV+BdIGrxNRw5l1dQX1yv2j8OpE9JFSgKqMrrgUx5gnVJnybCenUlPkB4jx0c23
 H3fQ5Dt1NYNSjpDIm8akz+5tlXhVGKs/2HtxbJPQhlc1dHZVSg7/PcFa7Xf6TOs58P
 ZhfqcqEPQQ8Xg==
Received: by mail-ej1-f69.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so7403158ejc.19
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWBR/3RyyId0ctzqGYcSjorUZAyYEVp2bjQXWveQ/28=;
 b=hoCP+Pufp4Sin60ov1dnB4rf2FU9g+CYZIVUTnaFYi2m+drYF6Th61aToguucEDKF/
 a1UKQOq+Id71vKsUIqDK9zg9dL95CvY0MJpDZuAS6DXVHEnJqXB//mMdoPMbzqrrPXtf
 +MURS98Odx0q2Bz6dVZ523XxFVqWmO+K1fEs7OJGZUcJqHrb6svvoJgEqE8ztoJ/YEUh
 Z4NWDkgXfvbmxaEaQLazgKLiB0zzHmgE6CR/eCORHi0woougd+lKI2pbPTxZBcbJpZs+
 kassZ4VuzDvW2i9B0xzQZ/2wa7Xs7TJ8bRg7NwFYZjHALRB1GQjfuRQ084cwsXJ3zi6r
 H44w==
X-Gm-Message-State: AOAM532DWgsPd3zf/Opl6ul6WrG53mItnip2XCylu9Hu0naRRpfhMFya
 460cO9yRh9q2VqLyqyGnOflos68TYsCEIng7IXRyrkiO6DZMm1RZlq/+QB4EEg+sJJWp/lzGItO
 M3GDTbq2G+jFk4YymeXQyk/hE7fIE4Xry4RhVHV8g
X-Received: by 2002:a05:6402:70d:b0:410:ba4d:736f with SMTP id
 w13-20020a056402070d00b00410ba4d736fmr891826edx.0.1645643727230; 
 Wed, 23 Feb 2022 11:15:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8vcySNYfbv43Pk2WXynTAOxXboVgUUSRQKZSxFWxW+kHULs5hedJTU2eFScz4UFZao2eyYQ==
X-Received: by 2002:a05:6402:70d:b0:410:ba4d:736f with SMTP id
 w13-20020a056402070d00b00410ba4d736fmr891811edx.0.1645643727044; 
 Wed, 23 Feb 2022 11:15:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id b3sm208368ejl.67.2022.02.23.11.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:15:26 -0800 (PST)
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
Subject: [PATCH v2 09/11] clk: imx: scu: fix kfree() of static memory on
 setting driver_override
Date: Wed, 23 Feb 2022 20:14:39 +0100
Message-Id: <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
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

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..15e1d670e51f 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk");
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

