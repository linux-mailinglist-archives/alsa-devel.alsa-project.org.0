Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A62112E5
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 247D61675;
	Wed,  1 Jul 2020 20:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 247D61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593628856;
	bh=Piu6h2Z5yl/IP86QhEHLfy2XSSRf8hSAPuiAs0TuoDQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eOeIgHtYqwqoBdHhVC6f6iU8G8TBq5nR1EkBwHNXGR6IE65pG3hW9J16bgUDJgGP0
	 ZAjeT9wafSlg3p6VaytwhRdl9r5Y7AUBPReEzSfPNYCcvzWFk3DXoWnxTnQ3p/5nS1
	 dZZw5AzTQEUdMFoxUwe0xzJQ/uqikGNXZXxanlhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47089F80217;
	Wed,  1 Jul 2020 20:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90660F80217; Wed,  1 Jul 2020 20:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BDAF800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BDAF800C1
IronPort-SDR: nnI9pSiT2lWU7yf85ceJ+7wTHBrie+VzY+STrNGStSjgduhqTFQBA3PHx9LxHj8+6Eok7J2tyD
 WF7jP47a/8zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145761409"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145761409"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:39:25 -0700
IronPort-SDR: TUnhfZdcXsJjR0IdzPP6Fl5EPBr9abmmhsURZfx2XgOfUfPZm3nejIINfsuBUdNvjZgO+joIl8
 00F714F9OxSg==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="425683059"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:39:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: sof-acpi-dev: fix 'defined but unused' warning
Date: Wed,  1 Jul 2020 13:39:13 -0500
Message-Id: <20200701183913.83455-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index c5eaaa978054..8aecc46b3647 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -35,7 +35,7 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
 #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.machines = snd_soc_acpi_intel_broadwell_machines,
 	.resindex_lpe_base = 0,
@@ -51,7 +51,7 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 
 /* BYTCR uses different IRQ index */
 static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
@@ -133,7 +133,7 @@ static int sof_acpi_probe(struct platform_device *pdev)
 	if (!desc)
 		return -ENODEV;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
 		desc = &sof_acpi_baytrailcr_desc;
 #endif
@@ -191,6 +191,7 @@ static int sof_acpi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id sof_acpi_match[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
@@ -202,6 +203,7 @@ static const struct acpi_device_id sof_acpi_match[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sof_acpi_match);
+#endif
 
 /* acpi_driver definition */
 static struct platform_driver snd_sof_acpi_driver = {

base-commit: a2b782d59c57cb6f673dbb4804ffc500336d7a54
-- 
2.25.1

