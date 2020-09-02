Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94F25AFEB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1FA1884;
	Wed,  2 Sep 2020 17:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1FA1884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061659;
	bh=U9gOAGT3YL8pIHItkKBjwtPYesqO4zfUBdFryIDCXhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fg+alAEbHBg7jNNwkLX3ILU0bpZO62SxGxp3o2IkqEZyluyzzUgg/O52u2W66+lBH
	 MmkNWf3IMrzGNw1A6ye5ogvUUG69n/QBrBgsDGVGmLl9vrXy6NIrMXJjGQQpQ/quPo
	 s8dWpFZFapihAD7QuIOEaW1VojdGBEB95OjfDm3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7688F802EB;
	Wed,  2 Sep 2020 17:44:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08392F802EA; Wed,  2 Sep 2020 17:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC820F802E7
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC820F802E7
IronPort-SDR: vHoGZbDKxxHHeKaV8y4A0lgYivUyLsQZupevoFnqkQ9p/xhF7GZKyXBHEQMfbt2Purk40BT3F6
 8V0GncHI2dXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="136930679"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="136930679"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 08:44:07 -0700
IronPort-SDR: fzheGFqnE/MQrAwUwlqpRCr7Gy9sui2SY/mEDztB8zbL9fnAvtfzykqhaG/Zk6j7BTPUut5E/I
 mS92NaVPEiDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="502179033"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2020 08:44:05 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: use consistent HDAudio spelling in comments/docs
Date: Wed,  2 Sep 2020 18:42:50 +0300
Message-Id: <20200902154250.1440585-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We use HDaudio and HDAudio, pick one to make searches easier.
No functionality change

Also fix timestamping typo in documentation.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 Documentation/sound/designs/timestamping.rst |  2 +-
 sound/hda/intel-dsp-config.c                 | 10 +++++-----
 sound/x86/Kconfig                            |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/sound/designs/timestamping.rst b/Documentation/sound/designs/timestamping.rst
index 2b0fff503415..7c7ecf5dbc4b 100644
--- a/Documentation/sound/designs/timestamping.rst
+++ b/Documentation/sound/designs/timestamping.rst
@@ -143,7 +143,7 @@ timestamp shows when the information is put together by the driver
 before returning from the ``STATUS`` and ``STATUS_EXT`` ioctl. in most cases
 this driver_timestamp will be identical to the regular system tstamp.
 
-Examples of typestamping with HDaudio:
+Examples of timestamping with HDAudio:
 
 1. DMA timestamp, no compensation for DMA+analog delay
 ::
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 99aec7349167..1c5114dedda9 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -54,7 +54,7 @@ static const struct config_entry config_table[] = {
 #endif
 /*
  * Apollolake (Broxton-P)
- * the legacy HDaudio driver is used except on Up Squared (SOF) and
+ * the legacy HDAudio driver is used except on Up Squared (SOF) and
  * Chromebooks (SST)
  */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
@@ -89,7 +89,7 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 /*
- * Skylake and Kabylake use legacy HDaudio driver except for Google
+ * Skylake and Kabylake use legacy HDAudio driver except for Google
  * Chromebooks (SST)
  */
 
@@ -135,7 +135,7 @@ static const struct config_entry config_table[] = {
 #endif
 
 /*
- * Geminilake uses legacy HDaudio driver except for Google
+ * Geminilake uses legacy HDAudio driver except for Google
  * Chromebooks
  */
 /* Geminilake */
@@ -157,7 +157,7 @@ static const struct config_entry config_table[] = {
 
 /*
  * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake use legacy
- * HDaudio driver except for Google Chromebooks and when DMICs are
+ * HDAudio driver except for Google Chromebooks and when DMICs are
  * present. Two cases are required since Coreboot does not expose NHLT
  * tables.
  *
@@ -391,7 +391,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (pci->class == 0x040300)
 		return SND_INTEL_DSP_DRIVER_LEGACY;
 	if (pci->class != 0x040100 && pci->class != 0x040380) {
-		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
+		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDAudio legacy driver\n", pci->class);
 		return SND_INTEL_DSP_DRIVER_LEGACY;
 	}
 
diff --git a/sound/x86/Kconfig b/sound/x86/Kconfig
index 77777192f650..4ffcc5e623c2 100644
--- a/sound/x86/Kconfig
+++ b/sound/x86/Kconfig
@@ -9,7 +9,7 @@ menuconfig SND_X86
 if SND_X86
 
 config HDMI_LPE_AUDIO
-	tristate "HDMI audio without HDaudio on Intel Atom platforms"
+	tristate "HDMI audio without HDAudio on Intel Atom platforms"
 	depends on DRM_I915
 	select SND_PCM
 	help
-- 
2.27.0

