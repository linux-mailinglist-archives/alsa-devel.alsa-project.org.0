Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2732DADAB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 14:06:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E82017EF;
	Tue, 15 Dec 2020 14:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E82017EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608037564;
	bh=lGo5y0vCS0GduuErkAyjw00OmhG0ts9Bm/QSy4n1raQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tscXfFUtua0KpB5QXixgBb7Lau36fMnw9nXt3YrpNJg1cWMG0nk+CAhQZNSez2DEd
	 eyIdbt8cmW6fhxlKSsc5TN8AmFsKTb8+5XzXFyQsjfxrOLLHdbCrLjY36QJLfEx4fY
	 nbDHKh3B2qzjKWNcHr53uau1wfhIT7aF2wWLKjYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E220F80121;
	Tue, 15 Dec 2020 14:04:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A81F804AE; Tue, 15 Dec 2020 14:04:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4241F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 14:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4241F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vQkp89D5"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD4GFF053267;
 Tue, 15 Dec 2020 07:04:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608037456;
 bh=g5hfBmYSZ8Ze0r6Z6Oo1TRt7JEjW9VDWbA/XiqpERKQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vQkp89D5LJrJ6MreL1xb6UFgCsdWAbBV908vl1vaESMQ2BvHuzyXgtOKHxCuejkLH
 lQ17atqT5z9OHbhUwfT/kfyLYfLKqfZBbWOSJ5aC/DlHAf7ypy3VG7BmsgyG3210HH
 AqDEMQDzy65ZHeL2m3X9ThfINE1KokRczdKkJePA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD4Gqf035477
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 07:04:16 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:04:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:04:15 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD49vL024224;
 Tue, 15 Dec 2020 07:04:13 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <jarkko.nikula@bitmer.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Update email address for TI ASoC and twl4030
 codec drivers
Date: Tue, 15 Dec 2020 15:05:11 +0200
Message-ID: <20201215130512.8753-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tiwai@suse.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

My employment with TI is coming to an end, it is my intention to look after
the drivers I have worked with over the years.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6e7162241eb..a091f183b27f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12862,7 +12862,7 @@ F:	include/misc/ocxl*
 F:	include/uapi/misc/ocxl.h
 
 OMAP AUDIO SUPPORT
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 M:	Jarkko Nikula <jarkko.nikula@bitmer.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linux-omap@vger.kernel.org
@@ -17537,7 +17537,7 @@ F:	arch/xtensa/
 F:	drivers/irqchip/irq-xtensa-*
 
 TEXAS INSTRUMENTS ASoC DRIVERS
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	sound/soc/ti/
@@ -17847,7 +17847,7 @@ F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
 F:	drivers/nfc/trf7970a.c
 
 TI TWL4030 SERIES SOC CODEC DRIVER
-M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
+M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	sound/soc/codecs/twl4030*
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

