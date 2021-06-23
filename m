Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD43B1B83
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 15:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84B4E167B;
	Wed, 23 Jun 2021 15:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84B4E167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624456085;
	bh=fFpYU0x9+0yKkPRD602KT1wQRy50geJFXahCdFBUQiw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hmatJZWt9SHaonkSu9avPIeCUPnW+LeYDnXWZXu55vhEBCzfeaFEj7+s1dRTAioMj
	 H//PJvtMN8XyF7lgFWc1YxgRsEx+aPaqAVlMhaXqvQ8gTuzxnCrRCo5c87ZQRYFHJt
	 ayo9PeZJzjgrB4POJ58RkoY7LVeEq42WOKva+Rvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F33F80245;
	Wed, 23 Jun 2021 15:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F805F8016D; Wed, 23 Jun 2021 15:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9462F800E1
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 15:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9462F800E1
IronPort-SDR: Jl7Xqxmiu+CcTDF5gadOX4ugl6qmoU2zZjQ12rzvL00Ehhb6iSzfUBQ8MJQIpY03+j/VpFjNWQ
 IHhqq0EVm6tw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207200308"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207200308"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:46:07 -0700
IronPort-SDR: lc/6KHCN2Sbrc8eQqTIdKMvL2kU5TG4vhfg37NL00WwxvcCTImDx9ygKR34uR+qcgMlDUNPaDr
 6IeZmYJy+n/A==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="453039185"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:46:03 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] ALSA: hda: Release controller display power during
 shutdown/reboot
Date: Wed, 23 Jun 2021 16:46:00 +0300
Message-Id: <20210623134601.2128663-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Thomas Voegtle <tv@lio96.de>,
 alsa-devel@alsa-project.org
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

Make sure the HDA driver's display power reference is released during
shutdown/reboot.

During the shutdown/reboot sequence the pci device core calls the
pm_runtime_resume handler for all devices before calling the driver's
shutdown callback and so the HDA driver's runtime resume callback will
acquire a display power reference (on HSW/BDW). This triggers a power
reference held WARN on HSW/BDW in the i915 driver's subsequent shutdown
handler, which expects all display power references to be released by
that time.

Since the HDA controller is stopped in the shutdown handler in any case,
let's follow here the same sequence as the one during runtime suspend.
This will also reset the HDA link and drop the display power reference,
getting rid of the above WARN.

Tested on HSW.

v2:
- Fix the build for CONFIG_PM=n (Takashi)
- s/__azx_runtime_suspend/azx_shutdown_chip/

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3618
References: https://lore.kernel.org/lkml/cea1f9a-52e0-b83-593d-52997fe1aaf6@er-systems.de
Reported-and-tested-by: Thomas Voegtle <tv@lio96.de>
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 sound/pci/hda/hda_intel.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7f8f11536a3dc..f5ab0b682adcc 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -883,6 +883,14 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	return azx_get_pos_posbuf(chip, azx_dev);
 }
 
+static void azx_shutdown_chip(struct azx *chip)
+{
+	azx_stop_chip(chip);
+	azx_enter_link_reset(chip);
+	azx_clear_irq_pending(chip);
+	display_power(chip, false);
+}
+
 #ifdef CONFIG_PM
 static DEFINE_MUTEX(card_list_lock);
 static LIST_HEAD(card_list);
@@ -942,14 +950,6 @@ static bool azx_is_pm_ready(struct snd_card *card)
 	return true;
 }
 
-static void __azx_runtime_suspend(struct azx *chip)
-{
-	azx_stop_chip(chip);
-	azx_enter_link_reset(chip);
-	azx_clear_irq_pending(chip);
-	display_power(chip, false);
-}
-
 static void __azx_runtime_resume(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -1028,7 +1028,7 @@ static int azx_suspend(struct device *dev)
 
 	chip = card->private_data;
 	bus = azx_bus(chip);
-	__azx_runtime_suspend(chip);
+	azx_shutdown_chip(chip);
 	if (bus->irq >= 0) {
 		free_irq(bus->irq, chip);
 		bus->irq = -1;
@@ -1107,7 +1107,7 @@ static int azx_runtime_suspend(struct device *dev)
 	/* enable controller wake up event */
 	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) | STATESTS_INT_MASK);
 
-	__azx_runtime_suspend(chip);
+	azx_shutdown_chip(chip);
 	trace_azx_runtime_suspend(chip);
 	return 0;
 }
@@ -2383,7 +2383,7 @@ static void azx_shutdown(struct pci_dev *pci)
 		return;
 	chip = card->private_data;
 	if (chip && chip->running)
-		azx_stop_chip(chip);
+		azx_shutdown_chip(chip);
 }
 
 /* PCI IDs */
-- 
2.27.0

