Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6194D7B44
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985C9189C;
	Mon, 14 Mar 2022 08:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985C9189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241701;
	bh=hDUEkEti21QWLOUXh8uIbAuSDqVDZrT2UDcBWNKQIzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXWLcPL7KgAX8TfIZLdn3q0AKov0kniVH8ZQxq0w5eUG2q9eGuSEWVT3aM16DarXm
	 ok2U4MA9d4hSFb4feyO9SKb7rfginur4N8M/6a5eaxypJWh/qN+49A1tL5/fgJGG2T
	 YiXfHl9nP9RnYTYDKHDG+2K288rtpCG/3UcgDimo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3499F805E9;
	Mon, 14 Mar 2022 07:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E094FF801D5; Sat, 12 Mar 2022 14:29:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACFEAF80095
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFEAF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="BcsfsdTG"
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 349ED3F60E
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091782;
 bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=BcsfsdTGa3fSV2VfmBtYMOghWZv8wZs1F5PalQVkohlgh6JeMsb8M2UUhVerFPwYg
 RP27svW0qyngsVIQYBb0iUMDmpA9r87r32CqqsgkntJer7zIHgwDTx9eyqFBaDUA+D
 2s3nCrx5xHcrUFxJ5KU60W/Ab6SQARMvNQzuOccUhThI/o5zhZyIOnui+Jcy2xtglt
 OP7dVnVjXIoi1c1BDHF0X9DeUvvtyuKIt1F5hN6EeleEizlcQtCqOudi5I5dlwJqDW
 rTN4XxsicoujntwjE9Cm7ghnlo50JW6hYafbLBg9wO48oxxeyQlar3pmlQSG+rfmVC
 Mg29tzSKKWSUw==
Received: by mail-lf1-f71.google.com with SMTP id
 i17-20020a056512007100b0044879482376so1135939lfo.20
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
 b=erkC1c6WiSzh5p9KbRwI0vrZxg3HLSYLxQ8+eb1LukYcOfVXWX9lMqmxYS1SpEvRYb
 se0uslNeWVnSEOfEru5ACkvRuBlyp1nUfYArnX6Kcq142F6sKs7os4DAGhtktSAiSUc9
 Qi+uTAbepsB5DNU0B9TKsebf2yxlGIkd2IXrr+MSozd+SoTSj3U7bDoG6RB5GWPBKGfS
 rI64h3fLLarYbkIS7b5L4fa5tWnKie8e82YIyN1qN97eg2Na68ZCWP5a8exi/gr8S7kl
 P2ifdHF8a7V1ykC9Wv8rwxAVSqT0lGuGlaiQfrYeP/0QbCvoFBhAI6UhzxBiuxkHR5XZ
 8Kqg==
X-Gm-Message-State: AOAM5325hU6vN/G7zk4WAtUrBPMH+58Bq/ldj9KrzmgNeROhgMvuh7Ad
 JR7SamrObwnpQDLTKfmrlBZ8kHdQRbNXCta6stHDhOC353aXIMwcKJL9pT+ypXmwnyNkMzK4Utn
 mD4TxU/XGjjnN8zEpBc8FqVn26+OLkYakqoFpD1nh
X-Received: by 2002:adf:f44d:0:b0:1f0:49bb:fead with SMTP id
 f13-20020adff44d000000b001f049bbfeadmr10583575wrp.586.1647091771127; 
 Sat, 12 Mar 2022 05:29:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5ufiLsjNXlLmSXpd1ewfKV/mq0TKGVtl9zvcWEFJmoAu7ZXtJo6A/7/mnNUpXOXLfNGXp5w==
X-Received: by 2002:adf:f44d:0:b0:1f0:49bb:fead with SMTP id
 f13-20020adff44d000000b001f049bbfeadmr10583570wrp.586.1647091770954; 
 Sat, 12 Mar 2022 05:29:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 09/11] clk: imx: scu: Fix kfree() of static memory on
 setting driver_override
Date: Sat, 12 Mar 2022 14:28:54 +0100
Message-Id: <20220312132856.65163-10-krzysztof.kozlowski@canonical.com>
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

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

