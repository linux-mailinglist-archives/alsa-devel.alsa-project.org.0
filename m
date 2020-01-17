Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09145141059
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 18:59:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B3417EE;
	Fri, 17 Jan 2020 18:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B3417EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579283956;
	bh=sWr48uJ5yYb4qJswdzQsrGBBErNdQpU79xPpawkNPwI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCNoXqFmsqBcoqHLu0No1eVhuTNx715Myaykuif4lT9ZEEhegEmRFVdtWbINqaVR4
	 oNO9IZo9YJp9L7o6S2p67wIuM6biCNgbpl0i7zQTsI0Y1o3bab0nEMrVTpOWc8KiXX
	 EimPLZ1fAu/IqUg96//oess5jovf+0MlvGozY8W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 341A1F8022B;
	Fri, 17 Jan 2020 18:56:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8DFF80228; Fri, 17 Jan 2020 18:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31386F8014B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 18:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31386F8014B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 09:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="243739495"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 17 Jan 2020 09:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 144BC1B4; Fri, 17 Jan 2020 19:56:27 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 linux-kernel@vger.kernel.org
Date: Fri, 17 Jan 2020 19:56:23 +0200
Message-Id: <20200117175626.56358-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH v1 5/8] x86/quirks: Add a DMI quirk for
	Microsoft Surface 3
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

Add a DMI quirk for Microsoft Surface 3 which will be utilized by few drivers.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/quirks.c                  | 16 ++++++++++++++++
 include/linux/platform_data/x86/machine.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/arch/x86/kernel/quirks.c b/arch/x86/kernel/quirks.c
index 447d4fba8516..9574ef7eaa66 100644
--- a/arch/x86/kernel/quirks.c
+++ b/arch/x86/kernel/quirks.c
@@ -673,6 +673,15 @@ static int apple_machine_cb(const struct dmi_system_id *id)
 	return 1;
 }
 
+bool x86_microsoft_surface_3_machine;
+EXPORT_SYMBOL(x86_microsoft_surface_3_machine);
+
+static int microsoft_surface_3_machine_cb(const struct dmi_system_id *id)
+{
+	x86_microsoft_surface_3_machine = true;
+	return 1;
+}
+
 static const struct dmi_system_id x86_machine_table[] = {
 	{
 		.ident = "x86 Apple Macintosh",
@@ -688,6 +697,13 @@ static const struct dmi_system_id x86_machine_table[] = {
 		},
 		.callback = apple_machine_cb,
 	},
+	{
+		.ident = "Microsoft Surface 3",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
+		},
+		.callback = microsoft_surface_3_machine_cb,
+	},
 	{}
 };
 
diff --git a/include/linux/platform_data/x86/machine.h b/include/linux/platform_data/x86/machine.h
index b1e7a560a046..9bdf5a06b490 100644
--- a/include/linux/platform_data/x86/machine.h
+++ b/include/linux/platform_data/x86/machine.h
@@ -8,8 +8,13 @@
  * x86_apple_machine - whether the machine is an x86 Apple Macintosh
  */
 extern bool x86_apple_machine;
+/**
+ * x86_microsoft_surface_3_machine - whether the machine is Microsoft Surface 3
+ */
+extern bool x86_microsoft_surface_3_machine;
 #else
 #define x86_apple_machine			false
+#define x86_microsoft_surface_3_machine		false
 #endif
 
 #endif	/* PLATFORM_DATA_X86_MACHINE_H */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
