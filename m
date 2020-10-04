Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA022829E3
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 11:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63671889;
	Sun,  4 Oct 2020 11:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63671889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601804879;
	bh=m8Hd3NJVgy0pMuGVmMZDY1WUDPw0wzQS5u6ANWw3p6k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dyzDp20jN3CHL6FZnLZDf/C7kpC4hDK7q0RY2/vMwrkga5rfzUU8p3SXSWJV94fND
	 zjlkbJgN+6PM4LgtrXqWTF2zEsZV8S3whazkbYeqYQBJpHMKhhgt8lOkGyVudfKH4V
	 4wr/k1rXyOs3uy4/7NtDcycKAwa8yC8w3rrJXZVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D41F80121;
	Sun,  4 Oct 2020 11:46:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81C6CF80246; Sun,  4 Oct 2020 11:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1B86F80121
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 11:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1B86F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="aR3FJ1Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601804771; x=1633340771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m8Hd3NJVgy0pMuGVmMZDY1WUDPw0wzQS5u6ANWw3p6k=;
 b=aR3FJ1GhgSL+KZbRSGjRlFVXoDVYFUwtLphOQ60TLNxUTFU2WsjmWBvZ
 MtwtpXgwglcFuIxVoQSsWyP6RfiyAczMZxKbZV50qecT3sjVKyB/HDpIt
 QqFvoPy/FZfQBcM/pwNIHx1Z8NyE+K/OCn2lxyaxloEGc7AWdNfS65V9i
 71filzLjupULbNfYMzgqNz3xUaHp5xxF5dcJPifHxN/d6vArJD5fthgU5
 ESsPVIkpi8saeyY4orRODVqvV3eazuhyjfAL6/vge57Lexnb1dIg85ETL
 VPid2iaVKx6aZOz6wfBOE+rbhtmRGvDs1F5yGsd+ouQyiDNvM1sB0mDyl g==;
IronPort-SDR: Ik2gpo+OGZphdE0IP9Co0VaoMz8ulnXnpmzAm9+wH5hpWmcXkJJyW+NWj3YvbmAGVQ+NMWEapY
 oH+hp9+t6dBgRySAyhT4ujFmPxr5w3dSxj/GaixHcZ0xp8otntx1CoDVoJSZwMKTHNT58koK0V
 Zc23IMQpjoapQvKEl8bNqr7Iuwg/UjHn/uhEdIFh+FYfhVS8Y84c0I+T9znAHubKFTC9D5m9Ts
 5FzWQ8Mtaw/sBuZbJG1hBWpdl7K8JPAuQ3HXagH487ynDV+EAc/avw7zoTAbTtOaXBIaj47LQ/
 nOQ=
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="94131250"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2020 02:46:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 4 Oct 2020 02:46:05 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 4 Oct 2020 02:45:40 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mchp-spdifrx: convert to
 devm_platform_get_and_ioremap_resource
Date: Sun, 4 Oct 2020 12:45:05 +0300
Message-ID: <20201004094505.1041898-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, tiwai@suse.com, ludovic.desroches@microchip.com,
 broonie@kernel.org, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Use the helper function that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 6776d89d56df..726e4951d9a5 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -873,8 +873,7 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Map I/O registers. */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, mem);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.25.1

