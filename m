Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE12FF9A7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 02:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E106C19FE;
	Fri, 22 Jan 2021 01:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E106C19FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611277218;
	bh=CLOGYWMOlsgqJ1zuqSK65JOm8WjbIrD0BD+/A/YKzDo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EG3ttxp+KD8kxPlUgZuGXDEg9wH+fKScrL1GNeipzth6i6UIGn7XlXb7Z2iUSN+Nk
	 Dub1ZvFj9kncTBNdYd91msiMeoXJFIrs+hq9R21ZvYic/90djGzPg15FpNvcSPPmlL
	 tAZ0dtVZTo+eJv9wBA5LVDiS43xECxHejhGljFUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B86F804D6;
	Fri, 22 Jan 2021 01:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE1CBF804BC; Fri, 22 Jan 2021 01:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E014F80255
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 01:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E014F80255
IronPort-SDR: 7IdPzX1WTUvRGLq3ZtKXPuIuqTQOuEFrSPjv/CYOq/pBuFGtYex0OZ+a5cDzZbpKHScqFqB1Z+
 nfB8cr9IEVzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264190805"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="264190805"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 16:57:42 -0800
IronPort-SDR: v+KqZdMhu8lfJWyMzBL0QM/aTH/5r5sKF9b0LAt3NJ3Sxyk2PtJ4j6ionH6jgwLIMf65d3UD66
 ITgLKO8qbyMg==
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="367126954"
Received: from seleedom-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.133.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 16:57:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
Date: Thu, 21 Jan 2021 18:57:25 -0600
Message-Id: <20210122005725.94163-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
References: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
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

The sof-pci-dev driver fails to link when built into the kernel
and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:

arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'

As a temporary fix, use IS_REACHABLE to prevent the problem from
happening. A more complete solution is to move this code to
Intel-specific parts, restructure the drivers and Kconfig as discussed
with Arnd Bergmann and Takashi Iwai.

Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 11 ++++++-----
 sound/soc/sof/sof-pci-dev.c  | 10 ++++++----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 2a369c2c6551..cc2e257087e4 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -131,12 +131,13 @@ static int sof_acpi_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
-		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
-		return -ENODEV;
+	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
+		ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+			dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
+			return -ENODEV;
+		}
 	}
-
 	dev_dbg(dev, "ACPI DSP detected");
 
 	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 7757463bd81a..388772f9c4d2 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -346,10 +346,12 @@ static int sof_pci_probe(struct pci_dev *pci,
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
 
-	ret = snd_intel_dsp_driver_probe(pci);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
-		dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
-		return -ENODEV;
+	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
+		ret = snd_intel_dsp_driver_probe(pci);
+		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+			dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
+			return -ENODEV;
+		}
 	}
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
-- 
2.25.1

