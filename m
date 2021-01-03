Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42482E8C71
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jan 2021 15:00:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBF2166E;
	Sun,  3 Jan 2021 14:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBF2166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609682091;
	bh=V7rDKYCFcuZSgAl1YWdvMaci7rDCqi0C/xM+NOOsOs8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KpUDRlvmtJeTUQTiIbkZMSZ12WrueCrk9I0EWdf8SN9cCVIjA+3ByTcxajpGJ22DO
	 P8BN3SvAHDi3dfRCcS6D/1fUyBx2EBdZnUzHSCUdd5mxP+SZ0vinTlig+o16GQN13C
	 ot+sssgvevAPKWmaP8d8WEJ4ldizSg1Vx1kQSRA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A12F80271;
	Sun,  3 Jan 2021 14:53:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B2CDF80268; Sun,  3 Jan 2021 14:53:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F545F8014C;
 Sun,  3 Jan 2021 14:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F545F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VVuw7uHh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A2A52080D;
 Sun,  3 Jan 2021 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609681983;
 bh=V7rDKYCFcuZSgAl1YWdvMaci7rDCqi0C/xM+NOOsOs8=;
 h=From:To:Cc:Subject:Date:From;
 b=VVuw7uHhdIvgtoItbkQWTUChPwiOgzAgG4fHHoRtyAE+15/dCHKFuHWLe0roznUJn
 s5d0sSWRxv043pWfzTBDCH2VZU02AM1zSLkvuWNPRv+TiuNNay3FsN7IqPlwKY0cqW
 /ADlrVqTh/zmPTogXVEP8D85CmfUVMd6Yc7bMceOdaIU9OK7x1c0eMIDlGBWJdbRA3
 /uH/gC+mvPjhzFLoLxKIkdDLD545adVdgTH1EPbM8ug5YslUejWpJ8ycahCjMeDvrY
 Bvq+2s2DWJBprRJi43FyiObZBqd1J2n04cTu5FXmB4+7mZCZIw557GQTvcETS2eEJO
 LceL3fEdBEszA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
Date: Sun,  3 Jan 2021 14:52:32 +0100
Message-Id: <20210103135257.3611821-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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
 include/sound/intel-dsp-config.h | 17 -----------------
 sound/soc/sof/Kconfig            |  2 ++
 2 files changed, 2 insertions(+), 17 deletions(-)

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
-- 
2.29.2

