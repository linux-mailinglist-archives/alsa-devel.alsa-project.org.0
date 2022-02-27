Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1474C9F6A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08CD1B2A;
	Wed,  2 Mar 2022 09:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08CD1B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210302;
	bh=hDUEkEti21QWLOUXh8uIbAuSDqVDZrT2UDcBWNKQIzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTVzLceamo4m/OFJ4lTJJzNy+eDEZ+1O1VYTfv3LujSAHTcKQO6fsYWywrwSzTzej
	 lkITAkHcWpZJKLelxR41xARQZJkkzbqU12KMHGaor0S1BFsBXEUyf/2V04soFFgUXZ
	 VYVfRRGO9IF6+jkjF+jVqkaUMlpY+TLEdbBrelhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8B3F80557;
	Wed,  2 Mar 2022 09:33:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621B5F80155; Sun, 27 Feb 2022 14:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37DBCF80128
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37DBCF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="UBqOlB4p"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BDD753F1D9
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645970029;
 bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=UBqOlB4pGy6X1cyLk3f2ac2tqaRq6vSwQyW6pAocGcLbhY0xzEJhLQ6sf0IFqGkOS
 +B7TwQg48HE1rlMavu9dbZPQNOGk1tlJlclv4+sekt9TMJp3w1UnF/m0gR8frhfRob
 QB5mQHqTozT2kyTZIo7fCRtrRJ2kZ9uFt18cnqwqCveLFF+S4ZRbi1rCNC3T0LzU0n
 cAyGCAwz1hXbCcAZMwo3klrHdq+3DjMS2fH6qPOz7WgS3EH2CUJryIbMwFsRXHO4Nh
 qdwu1VWotxurFPISSIRejwjJiZQy678hdO60qGQN4AaWdJb0jUfWFKbbu0B7vmRubL
 LOvOJY7uJSGNw==
Received: by mail-ed1-f70.google.com with SMTP id
 j9-20020a056402238900b004128085d906so4190154eda.19
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
 b=UyQ2/ZEFBIE1ygHSznuUM5fcsHOm0pdRscaSgF4xBl/pyWqTesYSByxFoSlQ0u7NWk
 LIcZipyTBUwVUe2Q7HyGxopNWC2Jx0GrZEQHgRNTdinCzYXH2BH54DIt9tobxXDMR2KL
 zEtSII3yeU+ClsyrazDqB9B2XMCykFkgTuHbq5V9DrwYgViPmklcWez3x16D64hn30Bl
 xzEd/nx8saErCNMvJY1DKHcwqBBxYidorgX6LU4Um9xa+zsUhftS/ClnsPjAN94YVlT8
 hxvE5cjpcdNpywfCsc6n9F8HjhqKH+vSjSjKkPfvMjDFSamBAGexHMNf88IKf4yPuaSY
 SpDw==
X-Gm-Message-State: AOAM531m86qECPjDF791y8INKDaCqC79ivPiO9RZABtV2FI4FxvP+BMK
 CLPPYCx3oqLr/EwZSYPa8FltNZSq9pXnRufGOxgizrO1S25SvIMgjIAHtKIdIk34ZiECgUIq/lu
 vAo2Gawu2TbHMB7X1NEVdGHu1xUyzlLpbhh+Sl8mL
X-Received: by 2002:a17:906:354f:b0:6b4:1449:2d03 with SMTP id
 s15-20020a170906354f00b006b414492d03mr13078905eja.197.1645970019289; 
 Sun, 27 Feb 2022 05:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLkm/ya1hWTxNWHY0owECzZBrknUNuVIsi2Y1TI9mIZSzwklvOz9AjjK7v7g0U5lSZuOzjqQ==
X-Received: by 2002:a17:906:354f:b0:6b4:1449:2d03 with SMTP id
 s15-20020a170906354f00b006b414492d03mr13078900eja.197.1645970019102; 
 Sun, 27 Feb 2022 05:53:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:53:38 -0800 (PST)
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
Subject: [PATCH v3 09/11] clk: imx: scu: Fix kfree() of static memory on
 setting driver_override
Date: Sun, 27 Feb 2022 14:53:27 +0100
Message-Id: <20220227135329.145862-3-krzysztof.kozlowski@canonical.com>
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

