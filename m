Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38D0431FD9
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA0F1783;
	Mon, 18 Oct 2021 16:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA0F1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634567725;
	bh=Eot1FHQw+NgbREt0r8Uh/KM9qXfmy/6r+cv5601ZCTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=de+vgrr2E0U3/PPbDuCOJCp6U5CEUt5zW5nB8tGtdanv+89GyJmev7yPnzjrsPfd5
	 QGXD3AAPDhdcqbfYQ+1rV+wcSBBTObFCSWcG6HQ/lHsz+Oux1S+vYull/i2Ey+LlS6
	 R6jYPzYnWf8PXy9f2YYb0tPtsXOgvWH648C78C24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 047F9F80300;
	Mon, 18 Oct 2021 16:33:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AABFFF80253; Mon, 18 Oct 2021 16:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F23FF80217
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F23FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gOSHNQJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634567618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUHl/wiNGmL1WcumGPQQzjf2AYhwqIpOf+nBqQEoFos=;
 b=gOSHNQJJnNA5tGKdiWPZQZu1YnObOCuO0vw0Rh5w+ge95IMB5PXHVZGs4Bt9+xq0LlSIuf
 aWoNSZ/3IwEGQxXnjE33aB7b94iiqDIA6KviPU8SWm0MJ6urunWkUOU4MZOX6QE8jBXKgR
 wKnGwuO475GyV77KLit3mAeAFI1/vAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-tbuaPWhaPt-Aq6-I7kK5xw-1; Mon, 18 Oct 2021 10:33:35 -0400
X-MC-Unique: tbuaPWhaPt-Aq6-I7kK5xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17A6810168D0;
 Mon, 18 Oct 2021 14:33:34 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAC2100EA05;
 Mon, 18 Oct 2021 14:33:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] platform/x86: intel_int0002_vgpio: Use the new
 soc_intel_is_byt/cht helpers
Date: Mon, 18 Oct 2021 16:33:23 +0200
Message-Id: <20211018143324.296961-3-hdegoede@redhat.com>
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

Use the new soc_intel_is_byt/cht helpers to clean things up a bit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int0002_vgpio.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 569342aa8926..617dbf98980e 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -34,13 +34,11 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
-#include <asm/cpu_device_id.h>
-#include <asm/intel-family.h>
-
 #define DRV_NAME			"INT0002 Virtual GPIO"
 
 /* For some reason the virtual GPIO pin tied to the GPE is numbered pin 2 */
@@ -151,12 +149,6 @@ static struct irq_chip int0002_irqchip = {
 	.irq_set_wake		= int0002_irq_set_wake,
 };
 
-static const struct x86_cpu_id int0002_cpu_ids[] = {
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, NULL),
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT, NULL),
-	{}
-};
-
 static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
 					unsigned long *valid_mask,
 					unsigned int ngpios)
@@ -167,15 +159,13 @@ static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
 static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct x86_cpu_id *cpu_id;
 	struct int0002_data *int0002;
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *chip;
 	int irq, ret;
 
 	/* Menlow has a different INT0002 device? <sigh> */
-	cpu_id = x86_match_cpu(int0002_cpu_ids);
-	if (!cpu_id)
+	if (!soc_intel_is_byt() && !soc_intel_is_cht())
 		return -ENODEV;
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.31.1

