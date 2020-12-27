Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 722602E32E6
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:19:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0246417AB;
	Sun, 27 Dec 2020 22:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0246417AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103957;
	bh=bW3QuxVMbBVZTTf3sFUPEi63Z6WzFeDrRv0L3WqzeCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRHVbXSrPP5ugx0E+TfCZPDYapFJGg60z+zjh4WS86gheLgYcd0L1kXz64kCoeDPB
	 LE0ogCDb2Wh89sa5mcvxrV8vOUU4DwN3LECG4nEiDp9RjGZpLs2n7bC4ntAoZdY/xS
	 9APqJsLogSrj1HeH4b7UT1yvGfpa9//T1hHu7y1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C13F80533;
	Sun, 27 Dec 2020 22:13:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95737F8051D; Sun, 27 Dec 2020 22:13:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 174D3F80517
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 174D3F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EJShejiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8KyNNaiBVLnhxo+0YNU2qQlWwmw2x62QlLhjDfhEhc=;
 b=EJShejiBJlycPaK77qUKm4gb2RQJ8K7n95YejQs1Q9N/SgyrEtfHt2hpM8eA9xWqDJ7ZkW
 +UANVXjnxpWfgNN9rB4PpCiX1r9MRpQKrKfiZgmrLEc2sg0INrftn8MN9/jotUx7vRrp2e
 OFS+ZBrG98fsRWygGkibeUMOZJpiMC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-V0sygp8ZNQO_ogqbRczvwQ-1; Sun, 27 Dec 2020 16:13:08 -0500
X-MC-Unique: V0sygp8ZNQO_ogqbRczvwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 076511800D42;
 Sun, 27 Dec 2020 21:13:07 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74B6762A23;
 Sun, 27 Dec 2020 21:13:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 12/14] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Date: Sun, 27 Dec 2020 22:12:30 +0100
Message-Id: <20201227211232.117801-13-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

Some Bay Trail systems:
1. Use a non CR version of the Bay Trail SoC
2. Contain at least 6 interrupt resources so that the
   platform_get_resource(pdev, IORESOURCE_IRQ, 5) check to workaround
   non CR systems which list their IPC IRQ at index 0 despite being
   non CR does not work
3. Despite 1. and 2. still have their IPC IRQ at index 0 rather then 5

Add a DMI quirk table to check for the few known models with this issue,
so that the right IPC IRQ index is used on these systems.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/common/soc-intel-quirks.h | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index b07df3059926..a93987ab7f4d 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -11,6 +11,7 @@
 
 #if IS_ENABLED(CONFIG_X86)
 
+#include <linux/dmi.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/iosf_mbi.h>
@@ -38,12 +39,36 @@ SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
 
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
+	/*
+	 * List of systems which:
+	 * 1. Use a non CR version of the Bay Trail SoC
+	 * 2. Contain at least 6 interrupt resources so that the
+	 *    platform_get_resource(pdev, IORESOURCE_IRQ, 5) check below
+	 *    succeeds
+	 * 3. Despite 1. and 2. still have their IPC IRQ at index 0 rather then 5
+	 *
+	 * This needs to be here so that it can be shared between the SST and
+	 * SOF drivers. We rely on the compiler to optimize this out in files
+	 * where soc_intel_is_byt_cr is not used.
+	 */
+	static const struct dmi_system_id force_bytcr_table[] = {
+		{	/* Lenovo Yoga Tablet 2 series */
+			.matches = {
+				DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+				DMI_MATCH(DMI_PRODUCT_FAMILY, "YOGATablet2"),
+			},
+		},
+		{}
+	};
 	struct device *dev = &pdev->dev;
 	int status = 0;
 
 	if (!soc_intel_is_byt())
 		return false;
 
+	if (dmi_check_system(force_bytcr_table))
+		return true;
+
 	if (iosf_mbi_available()) {
 		u32 bios_status;
 
-- 
2.28.0

