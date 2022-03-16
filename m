Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0474DBFEF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ADE71908;
	Thu, 17 Mar 2022 08:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ADE71908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500638;
	bh=C/vVNBgOEB/ntr2rCnoyA3P03iIAtHlsxksudRb/fyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hhjva2cF756T0pIwxUkYnZYBcAlLBS5IJKu3I8YvWdes8yML46JD+GP0RqIhBr1Z5
	 nJfd3qR5ycazO9rMqo5H0KAsqxS8sBKCE6m1EcS6gY492TMz84eTzVQA7tIA/lBfML
	 YqNJMTZm+T8fP6iMoDXm+/UL/ieLyY3vPlR89gYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A62F805EB;
	Thu, 17 Mar 2022 07:55:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7517BF8019D; Wed, 16 Mar 2022 16:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1084FF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1084FF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="jyHht3XC"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6D7E3F625
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443352;
 bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jyHht3XCLNr8VV2B/uTpzBkSInAMbmI/OgaxwuNmMa3xzDLPvAgITmvgRbvbAXnCa
 CaP/7VEhfYJWX+DtRZdBZ64KUBKWE1vAwJSWpqXxFXw6lFdFjmd3CCKEZ3UUQ7mAqG
 LphkR5ZMxUp3ep/FzIqHqol6T1yalNIFlqJzB0xMos5H70hWwhe5VgAYXG8ATxB5w2
 o/vzY7Z3+bIQwQGI5Yer4V1vNAurqUcNpUCQqXpFYgbJpK1GhBM75dch+CId9Pr79a
 yopE++kbJngLbpOU/WNUH+pXUOwW8f1PAGwzsWGLd2vIw9d8IeX1cs9hWy/1Yza19r
 zu3mbXUZ8FsHQ==
Received: by mail-ej1-f72.google.com with SMTP id
 y5-20020a1709060a8500b006da9258a34cso1309409ejf.21
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
 b=59m6e+eB8LGRggMEQkAGq5SMErYawZB0IXyW6jCUhkNfUTy/p2esj1L8O13ykJjYNy
 bhsTlFRtGmOuaYKipQsey24WNsEy5FlgJjypDrKEAwIh5ppIM2UJbmWdsoXjZrNCXNMf
 3eDB57stXtz2zeFMwP/qTSt1RZhs/5zJrzjFZTwHjbwVsbpp2hu6pKGfReqQscJBqZ/+
 kaaoXBd01PUcFySaeKEURXtSl3znFkY53+a8yFRFBV14qbrFXgUN46liFYpFyx/SJyV7
 vS6jX5T7TjF98WvI2P3hgv55phIDPHGpAW4/Q7ko7jRGG90JmguHfHz0lONzLyZkUTYH
 NthA==
X-Gm-Message-State: AOAM531mxnrhZ6pPIbVyFoo2/9E4P5XIC0F7BUSEWqcGJrHF9pk1+aiE
 xWIotz13pASUnnqb1SmJXeQ1qK78dU9+evtMpHjr5GtAw3NcavRnPpvIu3xx+Kg5sQWY1oo8Uuo
 QhSUmq/CdDdaEXZayyYFmCGuKeslEmt02hreijC9D
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id
 d2-20020a5d6442000000b00203dff2866cmr272597wrw.465.1647443340522; 
 Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnOg2aSuuzk/AN13SVnFGjUvC/KtTXL980cTeRfOeIj0D4M/X0M0ZN717fC4+xLvcCtZ4GNg==
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id
 d2-20020a5d6442000000b00203dff2866cmr272574wrw.465.1647443340291; 
 Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 09/11] clk: imx: scu: Fix kfree() of static memory on
 setting driver_override
Date: Wed, 16 Mar 2022 16:08:01 +0100
Message-Id: <20220316150803.421897-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
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
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
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

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..4b2268b7d0d0 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk", strlen("imx-scu-clk"));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

