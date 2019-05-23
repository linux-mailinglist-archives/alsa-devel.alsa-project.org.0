Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF928E07
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9827F166F;
	Fri, 24 May 2019 01:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9827F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558655190;
	bh=UlxcTP19UwuL1hNAyEPmbPIkPIKHsS2seMMwo1WPtu8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTduWvEFMOPq8S0g544Fu5v/X6YGEkruO8Xs3ewa1B6YoJ87tPRpIXji5DdaDWzsM
	 Gxhyc/qJDYofabE/am4HeqxmG6YaSS1Ph301fuhM7MMuuzERMCVIL72xmv7e8uiop2
	 vKJBCfUvanQ54UbTMS6zqtDavhYA5kcd3CNP3Pj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0CFF89747;
	Fri, 24 May 2019 01:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97246F89670; Fri, 24 May 2019 01:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 981BEF89670
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 981BEF89670
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:38 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:50 -0500
Message-Id: <20190523233951.31122-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 5/6] ALSA / hda: stop probe if DMICS are
	detected on Skylake+ platforms
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

The legacy HD-Audio driver cannot handle Skylake+ platforms with
digital microphones. For those platforms, the SOF driver needs to be
used.

Use the common intel-nhlt module to stop the probe when the DSP is
enabled and DMICs are exposed in the NHTL tables.

Note: This assumes that the BIOS information is correct, and
additional testing is required to see on which platforms the detection
is a false positive.

FIXME: I need to find what is the mirror of azx_create() to free all
the resources on exit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/Kconfig     |  1 +
 sound/pci/hda/hda_intel.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 4235907b7858..7b560c557b07 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -11,6 +11,7 @@ config SND_HDA_INTEL
 	tristate "HD Audio PCI"
 	depends on SND_PCI
 	select SND_HDA
+	select SND_SOC_INTEL_NHLT
 	help
 	  Say Y here to include support for Intel "High Definition
 	  Audio" (Azalia) and its compatible devices.
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0741eae23f10..e9f427d75a5d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -66,6 +66,7 @@
 #include <sound/hda_codec.h>
 #include "hda_controller.h"
 #include "hda_intel.h"
+#include "../../soc/intel/common/intel-nhlt.h"
 
 #define CREATE_TRACE_POINTS
 #include "hda_intel_trace.h"
@@ -2038,6 +2039,25 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
+static int azx_check_dmic(struct pci_dev *pci, struct azx *chip)
+{
+	struct nhlt_acpi_table *nhlt;
+	int ret = 0;
+
+	if (chip->driver_type == AZX_DRIVER_SKL &&
+	    pci->class != 0x040300) {
+		nhlt = intel_nhlt_init(&pci->dev);
+		if (nhlt) {
+			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt)) {
+				ret = -ENODEV;
+				dev_dbg(&pci->dev, "Digital mics found on Skylake+ platform, aborting probe\n");
+			}
+			intel_nhlt_free(nhlt);
+		}
+	}
+	return ret;
+}
+
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
@@ -2068,6 +2088,16 @@ static int azx_probe(struct pci_dev *pci,
 	card->private_data = chip;
 	hda = container_of(chip, struct hda_intel, chip);
 
+	/*
+	 * stop probe if digital microphones detected on Skylake+ platform
+	 * with the DSP enabled
+	 */
+	err = azx_check_dmic(pci, chip);
+	if (err < 0) {
+		/* FIXME: need to free everything allocated in azx_create */
+		goto out_free;
+	}
+
 	pci_set_drvdata(pci, card);
 
 	err = register_vga_switcheroo(chip);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
