Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4F431FDB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB801784;
	Mon, 18 Oct 2021 16:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB801784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634567744;
	bh=sxnuoeNnvSqL0a3ebXCyUNPexT34eKJmzDaYKMC48yc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+kqmjDEJ4mvvg89vEmDHjQmDtCm+EQq8oAP5ojIPNBuGr8YBCBhGNn2lB97+sYiq
	 wyobSAvi5FwmolozEZ9b7hKd0neWWm0iUsA585kb7IhanO1GBmVkK94S/7pkOh6YWt
	 NKNF/f78/1rOn9h+We27IInw+C3ELtVVM9T+/OtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C52F804B2;
	Mon, 18 Oct 2021 16:33:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84703F801DB; Mon, 18 Oct 2021 16:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA7B7F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA7B7F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UDBG279O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634567617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtOt2G1AbFPCyxAIQiN50xyT2qR4olmNXpVpaio5XjY=;
 b=UDBG279Ov8p/fq10VNQFYygtkOK1O8O0osIuBv2x9Bw01zslDCgDRpQJCoNjc0sM62JIaT
 sPgrYlMcWecrt2Y7HTSGHBDsyF+XBCBPRUD+Pu2RpHSR+dU7rSbqS9NRf43u9N73DifaV+
 nWKgiWlFZABCvjvC77NO3raF9e+jHkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-OiA0BEUJMDe5QDn69uqnBQ-1; Mon, 18 Oct 2021 10:33:34 -0400
X-MC-Unique: OiA0BEUJMDe5QDn69uqnBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2DD1EC1A1;
 Mon, 18 Oct 2021 14:33:31 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72473100E809;
 Mon, 18 Oct 2021 14:33:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a generic
 header
Date: Mon, 18 Oct 2021 16:33:22 +0200
Message-Id: <20211018143324.296961-2-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-input@vger.kernel.org
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

The soc_intel_is_foo() helpers from
sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
sound subsystem too.

Move these to include/linux/platform_data/x86/soc.h, so that
other code can use them too.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/soc.h     | 65 +++++++++++++++++++++++
 sound/soc/intel/common/soc-intel-quirks.h | 51 ++----------------
 2 files changed, 68 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/platform_data/x86/soc.h

diff --git a/include/linux/platform_data/x86/soc.h b/include/linux/platform_data/x86/soc.h
new file mode 100644
index 000000000000..8d710834e87a
--- /dev/null
+++ b/include/linux/platform_data/x86/soc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * soc.h - helpers for Intel SoC model detection
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ */
+
+#ifndef __PLATFORM_DATA_X86_SOC_H
+#define __PLATFORM_DATA_X86_SOC_H
+
+#if IS_ENABLED(CONFIG_X86)
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#define SOC_INTEL_IS_CPU(soc, type)				\
+static inline bool soc_intel_is_##soc(void)			\
+{								\
+	static const struct x86_cpu_id soc##_cpu_ids[] = {	\
+		X86_MATCH_INTEL_FAM6_MODEL(type, NULL),		\
+		{}						\
+	};							\
+	const struct x86_cpu_id *id;				\
+								\
+	id = x86_match_cpu(soc##_cpu_ids);			\
+	if (id)							\
+		return true;					\
+	return false;						\
+}
+
+SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
+SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
+SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
+SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
+SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
+
+#else /* IS_ENABLED(CONFIG_X86) */
+
+static inline bool soc_intel_is_byt(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_cht(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_apl(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_glk(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_cml(void)
+{
+	return false;
+}
+#endif /* IS_ENABLED(CONFIG_X86) */
+
+#endif /* __PLATFORM_DATA_X86_SOC_H */
diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index a93987ab7f4d..de4e550c5b34 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -9,34 +9,13 @@
 #ifndef _SND_SOC_INTEL_QUIRKS_H
 #define _SND_SOC_INTEL_QUIRKS_H
 
+#include <linux/platform_data/x86/soc.h>
+
 #if IS_ENABLED(CONFIG_X86)
 
 #include <linux/dmi.h>
-#include <asm/cpu_device_id.h>
-#include <asm/intel-family.h>
 #include <asm/iosf_mbi.h>
 
-#define SOC_INTEL_IS_CPU(soc, type)				\
-static inline bool soc_intel_is_##soc(void)			\
-{								\
-	static const struct x86_cpu_id soc##_cpu_ids[] = {	\
-		X86_MATCH_INTEL_FAM6_MODEL(type, NULL),		\
-		{}						\
-	};							\
-	const struct x86_cpu_id *id;				\
-								\
-	id = x86_match_cpu(soc##_cpu_ids);			\
-	if (id)							\
-		return true;					\
-	return false;						\
-}
-
-SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
-SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
-SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
-SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
-SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
-
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
 	/*
@@ -114,30 +93,6 @@ static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 	return false;
 }
 
-static inline bool soc_intel_is_byt(void)
-{
-	return false;
-}
-
-static inline bool soc_intel_is_cht(void)
-{
-	return false;
-}
-
-static inline bool soc_intel_is_apl(void)
-{
-	return false;
-}
-
-static inline bool soc_intel_is_glk(void)
-{
-	return false;
-}
-
-static inline bool soc_intel_is_cml(void)
-{
-	return false;
-}
 #endif
 
- #endif /* _SND_SOC_INTEL_QUIRKS_H */
+#endif /* _SND_SOC_INTEL_QUIRKS_H */
-- 
2.31.1

