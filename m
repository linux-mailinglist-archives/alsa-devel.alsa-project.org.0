Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC28CFF38
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6803A1612;
	Tue,  8 Oct 2019 18:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6803A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553300;
	bh=ED5wG4vrMszgavs7MuR3EfN9VgTiZdx0odMfHRx40sQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GCfD50gIbB2OhdFcO+V0LM6aTS4pw+pEK210x7xLVkW/Xs96giPshvVQCjC6+VJpP
	 bsaoJm28rryQL5OLfZoBPYzKT57ElgkiTPy+Jt32sSYYmVY8m3z/cn3outLVAFIaps
	 VNPMbiGb6OK4uY/2AOCw01xasWjVpyBMhbG2JmQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B546F804CA;
	Tue,  8 Oct 2019 18:45:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7641F805FE; Tue,  8 Oct 2019 18:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 694DAF80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 694DAF80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338329"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:37 -0500
Message-Id: <20191008164443.1358-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/9] ASoC: SOF: acpi: add debug module param
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

Add debug parameter for snd-sof-acpi.

One of the usages for this debug parameter to disable pm_runtime,
which can be useful for platform bringup, or keep the parent device
active while enabling pm_runtime for child devices (e.g. with
SoundWire or MFD). This can also be useful to measure suspend-resume
latencies or child devices.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index ea7b8b895412..df318f50dd0b 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -29,6 +29,12 @@ static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
 
+static int sof_acpi_debug;
+module_param_named(sof_acpi_debug, sof_acpi_debug, int, 0444);
+MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
+
+#define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
 static const struct sof_dev_desc sof_acpi_haswell_desc = {
 	.machines = snd_soc_acpi_intel_haswell_machines,
@@ -121,6 +127,9 @@ static const struct dev_pm_ops sof_acpi_pm = {
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
+	if (sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME)
+		return;
+
 	/* allow runtime_pm */
 	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
@@ -221,7 +230,8 @@ static int sof_acpi_probe(struct platform_device *pdev)
 
 static int sof_acpi_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
+	if (!(sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME))
+		pm_runtime_disable(&pdev->dev);
 
 	/* call sof helper for DSP hardware remove */
 	snd_sof_device_remove(&pdev->dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
