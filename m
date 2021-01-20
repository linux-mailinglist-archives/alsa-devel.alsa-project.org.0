Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420882FDC1F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C1917B4;
	Wed, 20 Jan 2021 22:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C1917B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611179593;
	bh=Ggdl+GWhET9S15PnCflBg7ZffwCEes+Z/BLR2Ig07jQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLBBsDtf6f1brey/2PiNyTowtkohT6ZYJQF7hHRbdygH5rxesOHcJWm9+9q3yXyAY
	 5E+3mfxHnYOZEcDUeXhZK99PRWYK3iZ67KyT703rvmJQJGIgri7jsvltb3j4HU0O0/
	 35JTY/oocBwhCVcSDOSnr6LeXQ2pkj6B6yldBYDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C59BF804E0;
	Wed, 20 Jan 2021 22:50:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99A7BF804CB; Wed, 20 Jan 2021 22:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA96F804BD
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA96F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Kk5dMnSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611179415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7lzl9Lt2MjVC8UQX3UTaRWTMvWQodOhj9ejnhEdfCg=;
 b=Kk5dMnSkiNdGciESekGWjm/uzG2Oxb/VK1piiLgNoHacQGDzA3GDHnQzu9lhHoz+NNgpIs
 GvhOGGr2nbtXsZ8c9h+BWYVRM8hQ89qYGU31gSPpFUR/UUNeV6i7++yXCzgEDjq1gV/Ql4
 QuZXf0uef7Yxi+PQ7ReFnG9zIRzIaeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-b1p4fpiMOP2nSa52UgXqDA-1; Wed, 20 Jan 2021 16:50:13 -0500
X-MC-Unique: b1p4fpiMOP2nSa52UgXqDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CE8EE743;
 Wed, 20 Jan 2021 21:50:11 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79AF25D6AD;
 Wed, 20 Jan 2021 21:50:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Date: Wed, 20 Jan 2021 22:49:56 +0100
Message-Id: <20210120214957.140232-5-hdegoede@redhat.com>
In-Reply-To: <20210120214957.140232-1-hdegoede@redhat.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

