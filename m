Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56550142F52
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:10:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F5D1682;
	Mon, 20 Jan 2020 17:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F5D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536658;
	bh=zEXyISN/+aqXWum9hqy+2cmL1WTcr55+QdOjqACtTIc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iOcR69FZzirHV3XUX+KuqBsp9rv6iHs8ratxzbf7cKxzelx7Kta+RHLzp7DYgwOfC
	 3stcoQfrQ9dwbTQCPgWhhIb3XGi1Yf2hCu62q5ioqP/iRqvOMNtLTnNEXzhgWxq58r
	 HQUlDQt4jaQVBSD3Lsf3+EKWsn7jcBLxGUxOKwMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D62F8026F;
	Mon, 20 Jan 2020 17:08:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A90BEF80248; Mon, 20 Jan 2020 17:08:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FE3CF800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE3CF800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 08:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="220704899"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2020 08:08:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3F952525; Mon, 20 Jan 2020 18:08:13 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2020 18:08:01 +0200
Message-Id: <20200120160801.53089-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
References: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 9/9] ASoC: Intel: Switch DMI table match to
	a test of variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since we have a common x86 quirk that provides an exported variable,
use it instead of local DMI table match.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cht-match.c   | 33 ++-----------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index d0fb43c2b9f6..c35766125d5e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -5,31 +5,11 @@
  * Copyright (c) 2017, Intel Corporation.
  */
 
-#include <linux/dmi.h>
+#include <linux/platform_data/x86/machine.h>
+
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static unsigned long cht_machine_id;
-
-#define CHT_SURFACE_MACH 1
-
-static int cht_surface_quirk_cb(const struct dmi_system_id *id)
-{
-	cht_machine_id = CHT_SURFACE_MACH;
-	return 1;
-}
-
-static const struct dmi_system_id cht_table[] = {
-	{
-		.callback = cht_surface_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
-		},
-	},
-	{ }
-};
-
 static struct snd_soc_acpi_mach cht_surface_mach = {
 	.id = "10EC5640",
 	.drv_name = "cht-bsw-rt5645",
@@ -41,14 +21,7 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
 
 static struct snd_soc_acpi_mach *cht_quirk(void *arg)
 {
-	struct snd_soc_acpi_mach *mach = arg;
-
-	dmi_check_system(cht_table);
-
-	if (cht_machine_id == CHT_SURFACE_MACH)
-		return &cht_surface_mach;
-	else
-		return mach;
+	return x86_microsoft_surface_3_machine ? &cht_surface_mach : arg;
 }
 
 /* Cherryview-based platforms: CherryTrail and Braswell */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
