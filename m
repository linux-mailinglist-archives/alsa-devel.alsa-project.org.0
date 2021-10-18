Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D454F431FDD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5E11776;
	Mon, 18 Oct 2021 16:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5E11776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634567768;
	bh=g5qEPyIFWu7WOOwwjsfZF4la3U6qCP6iFquaGNFOQqU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhCXHzraJOSRstXT8xcRt/405UlwkeyCQGg4emAZS4TlZJhAvhpqQICn2AzOZZawr
	 tZFMa8w33F8jTPgY/QLyXsE4dPmiZYDTuy/QZfkiN4Xr71Lm0uikzOXBeO0kV6rOUd
	 IDnhpGjLGgWUq/Tf+sXI/FQ/FNhqzTonL+t8JA6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0494EF804FA;
	Mon, 18 Oct 2021 16:33:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD30F802A9; Mon, 18 Oct 2021 16:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14966F80224
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14966F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HgwesVgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634567621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHKzH/wajaDyRcGRKJtdJRiyxCohYfbn/RZQ0IVry88=;
 b=HgwesVgWWbnkfrQeQ4pE+//sweBZ83azsU4p7gEs1Asssy9vFH6Eu0wu9NTu4R4Ke0KUzS
 YE7WPDm8orhVUK9/EPjXRKg5GRvoWlM3KwL9A4LR6C/bMPP03AEabdBsv4zHpWHTneSjPl
 8oqQkjNzMLVw2CTV3HdU9zQf/yvcboo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-nhARz-PKMzSzGCKpsEchYw-1; Mon, 18 Oct 2021 10:33:38 -0400
X-MC-Unique: nhARz-PKMzSzGCKpsEchYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33FB10168D0;
 Mon, 18 Oct 2021 14:33:36 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76EE4100E809;
 Mon, 18 Oct 2021 14:33:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] Input: axp20x-pek - Use new soc_intel_is_cht() helper
Date: Mon, 18 Oct 2021 16:33:24 +0200
Message-Id: <20211018143324.296961-4-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
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

Use the new soc_intel_is_cht() helper to find out if we are running
on a CHT device rather then checking the ACPI _HRV field.

This is more reliable (some CHT devices have been found where the _HRV
for the PMIC is 2 rather then 3) and leads to a nice cleanup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/axp20x-pek.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 9c6386b2af33..e09b1fae42e1 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/axp20x.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -255,41 +256,24 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-static bool axp20x_pek_should_register_input(struct axp20x_pek *axp20x_pek,
-					     struct platform_device *pdev)
+static bool axp20x_pek_should_register_input(struct axp20x_pek *axp20x_pek)
 {
-	unsigned long long hrv = 0;
-	acpi_status status;
-
 	if (IS_ENABLED(CONFIG_INPUT_SOC_BUTTON_ARRAY) &&
 	    axp20x_pek->axp20x->variant == AXP288_ID) {
-		status = acpi_evaluate_integer(ACPI_HANDLE(pdev->dev.parent),
-					       "_HRV", NULL, &hrv);
-		if (ACPI_FAILURE(status))
-			dev_err(&pdev->dev, "Failed to get PMIC hardware revision\n");
-
 		/*
 		 * On Cherry Trail platforms (hrv == 3), do not register the
 		 * input device if there is an "INTCFD9" or "ACPI0011" gpio
 		 * button ACPI device, as that handles the power button too,
 		 * and otherwise we end up reporting all presses twice.
 		 */
-		if (hrv == 3 && (acpi_dev_present("INTCFD9", NULL, -1) ||
+		if (soc_intel_is_cht() &&
+				(acpi_dev_present("INTCFD9", NULL, -1) ||
 				 acpi_dev_present("ACPI0011", NULL, -1)))
 			return false;
-
 	}
 
 	return true;
 }
-#else
-static bool axp20x_pek_should_register_input(struct axp20x_pek *axp20x_pek,
-					     struct platform_device *pdev)
-{
-	return true;
-}
-#endif
 
 static int axp20x_pek_probe(struct platform_device *pdev)
 {
@@ -321,7 +305,7 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 	axp20x_pek->irq_dbf = regmap_irq_get_virq(
 			axp20x_pek->axp20x->regmap_irqc, axp20x_pek->irq_dbf);
 
-	if (axp20x_pek_should_register_input(axp20x_pek, pdev)) {
+	if (axp20x_pek_should_register_input(axp20x_pek)) {
 		error = axp20x_pek_probe_input_device(axp20x_pek, pdev);
 		if (error)
 			return error;
-- 
2.31.1

