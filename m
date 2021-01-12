Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839042F3B87
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 21:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE35D1709;
	Tue, 12 Jan 2021 21:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE35D1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610483638;
	bh=/0rZ+dfpND1Yu6VMXcp+GJvrEb+3Tl5ZOFjKSaNslPw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eIZ5soIo52P2U/bw6p1oFq8Z3kEP+K2YP4nj/ZJhCycB11xrl6eAB2hpoeUnyfase
	 Foras4hhjekoKnUQU7QourjM1sw4x7oHilDp7XtfC6jbZH5HBsV3Xsz9vhjlG+T42f
	 I8ekFd+ywGT0Z3H7qt9LIe222sYkSC1GWbtbBY9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FE7CF804AA;
	Tue, 12 Jan 2021 21:33:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09CAF80279; Tue, 12 Jan 2021 21:33:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED6EF80475;
 Tue, 12 Jan 2021 21:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED6EF80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iq9c6nJJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F04472311F;
 Tue, 12 Jan 2021 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610483575;
 bh=/0rZ+dfpND1Yu6VMXcp+GJvrEb+3Tl5ZOFjKSaNslPw=;
 h=From:To:Cc:Subject:Date:From;
 b=iq9c6nJJXeqP3twGXrAAW9uoeo4UAnyzjLsz6oxUWktl5FZDycduPdfMe4pYQDKaZ
 hpJn+BY8jLjJd6gFEohcGS559XjIW0cwBVDZLSvYSeSo91kgDmy3OAHMHS2kawxkm4
 gfjVSsLXv0uDxJ71DLslVwHXYIjIuH5xSmx7E4lwEr3SUNLZfrVhCOT5o3IZ6LkHYu
 YpZRas7t5n6d46XCIfld8ZFb7C+BeFK1xf81Rp+lwruu6VZiCjzLszPJ84sqXokwl1
 UbgYZgIUcSury4yRsbUBlj0je3C4g72I7i0ADn+FtXaDMbrm3g8dDsJ6A8Krnp0PeO
 Cz50I4CaBxI9A==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] [v2] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
Date: Tue, 12 Jan 2021 21:32:17 +0100
Message-Id: <20210112203250.2576775-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rander Wang <rander.wang@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Arnd Bergmann <arnd@arndb.de>

The sof-pci-dev driver fails to link when built into the kernel
and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:

arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'

All other drivers using this interface already use a 'select
SND_INTEL_DSP_CONFIG' statement to force the it to be present, so it
seems reasonable to do the same here.

The stub implementation in the header makes the problem harder to find,
as it avoids the link error when SND_INTEL_DSP_CONFIG is completely
disabled, without any obvious upsides. Remove these stubs to make it
clearer that the driver is in fact needed here.

Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix various build issues in the first version, now passes
    all randconfig builds I tried
---
 include/sound/intel-dsp-config.h | 17 -----------------
 sound/soc/sof/Kconfig            |  2 ++
 sound/soc/sof/intel/Kconfig      |  4 ++--
 sound/soc/sof/intel/byt.c        |  2 +-
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
index d4609077c258..94667e870029 100644
--- a/include/sound/intel-dsp-config.h
+++ b/include/sound/intel-dsp-config.h
@@ -18,24 +18,7 @@ enum {
 	SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
 };
 
-#if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)
-
 int snd_intel_dsp_driver_probe(struct pci_dev *pci);
 int snd_intel_acpi_dsp_driver_probe(struct device *dev, const u8 acpi_hid[ACPI_ID_LEN]);
 
-#else
-
-static inline int snd_intel_dsp_driver_probe(struct pci_dev *pci)
-{
-	return SND_INTEL_DSP_DRIVER_ANY;
-}
-
-static inline
-int snd_intel_acpi_dsp_driver_probe(struct device *dev, const u8 acpi_hid[ACPI_ID_LEN])
-{
-	return SND_INTEL_DSP_DRIVER_ANY;
-}
-
-#endif
-
 #endif
diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 031dad5fc4c7..051fd3d27047 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -12,6 +12,7 @@ if SND_SOC_SOF_TOPLEVEL
 config SND_SOC_SOF_PCI
 	tristate "SOF PCI enumeration support"
 	depends on PCI
+	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
 	help
@@ -23,6 +24,7 @@ config SND_SOC_SOF_PCI
 config SND_SOC_SOF_ACPI
 	tristate "SOF ACPI enumeration support"
 	depends on ACPI || COMPILE_TEST
+	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
 	select IOSF_MBI if X86 && PCI
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index ff9266413a06..67365ce0d86d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -53,7 +53,7 @@ config SND_SOC_SOF_INTEL_COMMON
 if SND_SOC_SOF_ACPI
 
 config SND_SOC_SOF_BAYTRAIL
-	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+	tristate "SOF support for Baytrail, Braswell and Cherrytrail"
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	select SND_INTEL_DSP_CONFIG
 	help
@@ -70,7 +70,7 @@ config SND_SOC_SOF_BAYTRAIL
 	  If unsure select "N".
 
 config SND_SOC_SOF_BROADWELL
-	bool "SOF support for Broadwell"
+	tristate "SOF support for Broadwell"
 	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 65abcca94521..42dba3da1ca3 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -660,7 +660,7 @@ EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
 
 #endif /* CONFIG_SND_SOC_SOF_MERRIFIELD */
 
-#ifdef CONFIG_SND_SOC_SOF_BAYTRAIL
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
 {
 	/* Disable Interrupt from both sides */
-- 
2.29.2

