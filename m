Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B067612F5D4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA90179E;
	Fri,  3 Jan 2020 09:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA90179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041874;
	bh=GvXOzOsZdZL6hByjHC9/C3VV+N/eeJJtlRQf2rQ8NrM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7IoYuTEbEI/QjeMcSP4xYJ3Rvdya9u7ZaJ9ZdpwAvlJwumuwoyZsIuxKV5B+LGFz
	 B0GO/mBUvROL8GjRSckIwUw6cIaQUfwqstEdzNIWKaJ0IqcXGyh1HaIjjud5iwPTo6
	 Ds5YJPnPbvwtkqCHH5NfF5/I9Da9irbhu2jC3nQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4466F805AB;
	Fri,  3 Jan 2020 09:19:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1447F803E0; Fri,  3 Jan 2020 09:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66006F802F8
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66006F802F8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 892E0B28E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:14 +0100
Message-Id: <20200103081714.9560-59-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 58/58] ALSA: pci: Constify snd_pci_quirk tables
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The snd_pci_quirk tables are referred as read-only, hence they can be
declared as const gracefully.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c      | 2 +-
 sound/pci/ctxfi/ctatc.c | 4 ++--
 sound/pci/ens1370.c     | 8 ++++----
 sound/pci/intel8x0.c    | 6 +++---
 sound/pci/maestro3.c    | 8 ++++----
 sound/pci/nm256/nm256.c | 2 +-
 sound/pci/via82xx.c     | 2 +-
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index c3281fab365d..4a840734e7a7 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -282,7 +282,7 @@ static const struct pci_device_id snd_atiixp_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, snd_atiixp_ids);
 
-static struct snd_pci_quirk atiixp_quirks[] = {
+static const struct snd_pci_quirk atiixp_quirks[] = {
 	SND_PCI_QUIRK(0x105b, 0x0c81, "Foxconn RC4107MA-RS2", 0),
 	SND_PCI_QUIRK(0x15bd, 0x3100, "DFI RS482", 0),
 	{ } /* terminator */
diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 8d92154ac262..e56a230f6a9c 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -35,7 +35,7 @@
 			    | (0x10 << 16) \
 			    | ((IEC958_AES3_CON_FS_48000) << 24))
 
-static struct snd_pci_quirk subsys_20k1_list[] = {
+static const struct snd_pci_quirk subsys_20k1_list[] = {
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0022, "SB055x", CTSB055X),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x002f, "SB055x", CTSB055X),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0029, "SB073x", CTSB073X),
@@ -45,7 +45,7 @@ static struct snd_pci_quirk subsys_20k1_list[] = {
 	{ } /* terminator */
 };
 
-static struct snd_pci_quirk subsys_20k2_list[] = {
+static const struct snd_pci_quirk subsys_20k2_list[] = {
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB0760,
 		      "SB0760", CTSB0760),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB1270,
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 4f8202980b61..7ef9b7a1b2e6 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1562,7 +1562,7 @@ struct es1371_quirk {
 };
 
 static int es1371_quirk_lookup(struct ensoniq *ensoniq,
-				struct es1371_quirk *list)
+			       const struct es1371_quirk *list)
 {
 	while (list->vid != (unsigned short)PCI_ANY_ID) {
 		if (ensoniq->pci->vendor == list->vid &&
@@ -1583,7 +1583,7 @@ static struct es1371_quirk es1371_spdif_present[] = {
 	{ .vid = PCI_ANY_ID, .did = PCI_ANY_ID }
 };
 
-static struct snd_pci_quirk ens1373_line_quirk[] = {
+static const struct snd_pci_quirk ens1373_line_quirk[] = {
 	SND_PCI_QUIRK_ID(0x1274, 0x2000), /* GA-7DXR */
 	SND_PCI_QUIRK_ID(0x1458, 0xa000), /* GA-8IEXP */
 	{ } /* end */
@@ -1909,7 +1909,7 @@ static int snd_ensoniq_dev_free(struct snd_device *device)
 }
 
 #ifdef CHIP1371
-static struct snd_pci_quirk es1371_amplifier_hack[] = {
+static const struct snd_pci_quirk es1371_amplifier_hack[] = {
 	SND_PCI_QUIRK_ID(0x107b, 0x2150),	/* Gateway Solo 2150 */
 	SND_PCI_QUIRK_ID(0x13bd, 0x100c),	/* EV1938 on Mebius PC-MJ100V */
 	SND_PCI_QUIRK_ID(0x1102, 0x5938),	/* Targa Xtender300 */
@@ -1917,7 +1917,7 @@ static struct snd_pci_quirk es1371_amplifier_hack[] = {
 	{ } /* end */
 };
 
-static struct es1371_quirk es1371_ac97_reset_hack[] = {
+static const struct es1371_quirk es1371_ac97_reset_hack[] = {
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_CT5880, .rev = CT5880REV_CT5880_C },
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_CT5880, .rev = CT5880REV_CT5880_D },
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_CT5880, .rev = CT5880REV_CT5880_E },
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index de875ea8ecbe..5bdd25815fc7 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2328,7 +2328,7 @@ static void do_ali_reset(struct intel8x0 *chip)
 }
 
 #ifdef CONFIG_SND_AC97_POWER_SAVE
-static struct snd_pci_quirk ich_chip_reset_mode[] = {
+static const struct snd_pci_quirk ich_chip_reset_mode[] = {
 	SND_PCI_QUIRK(0x1014, 0x051f, "Thinkpad R32", 1),
 	{ } /* end */
 };
@@ -2774,7 +2774,7 @@ static void intel8x0_measure_ac97_clock(struct intel8x0 *chip)
 	snd_ac97_update_power(chip->ac97[0], AC97_PCM_FRONT_DAC_RATE, 0);
 }
 
-static struct snd_pci_quirk intel8x0_clock_list[] = {
+static const struct snd_pci_quirk intel8x0_clock_list[] = {
 	SND_PCI_QUIRK(0x0e11, 0x008a, "AD1885", 41000),
 	SND_PCI_QUIRK(0x1014, 0x0581, "AD1981B", 48000),
 	SND_PCI_QUIRK(0x1028, 0x00be, "AD1885", 44100),
@@ -3133,7 +3133,7 @@ static struct shortname_table {
 	{ 0, NULL },
 };
 
-static struct snd_pci_quirk spdif_aclink_defaults[] = {
+static const struct snd_pci_quirk spdif_aclink_defaults[] = {
 	SND_PCI_QUIRK(0x147b, 0x1c1a, "ASUS KN8", 1),
 	{ } /* end */
 };
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 89018d44d777..40232a278b1a 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -807,7 +807,7 @@ static const struct pci_device_id snd_m3_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, snd_m3_ids);
 
-static struct snd_pci_quirk m3_amp_quirk_list[] = {
+static const struct snd_pci_quirk m3_amp_quirk_list[] = {
 	SND_PCI_QUIRK(0x0E11, 0x0094, "Compaq Evo N600c", 0x0c),
 	SND_PCI_QUIRK(0x10f7, 0x833e, "Panasonic CF-28", 0x0d),
 	SND_PCI_QUIRK(0x10f7, 0x833d, "Panasonic CF-72", 0x0d),
@@ -816,7 +816,7 @@ static struct snd_pci_quirk m3_amp_quirk_list[] = {
 	{ } /* END */
 };
 
-static struct snd_pci_quirk m3_irda_quirk_list[] = {
+static const struct snd_pci_quirk m3_irda_quirk_list[] = {
 	SND_PCI_QUIRK(0x1028, 0x00b0, "Dell Inspiron 4000", 1),
 	SND_PCI_QUIRK(0x1028, 0x00a4, "Dell Inspiron 8000", 1),
 	SND_PCI_QUIRK(0x1028, 0x00e6, "Dell Inspiron 8100", 1),
@@ -824,7 +824,7 @@ static struct snd_pci_quirk m3_irda_quirk_list[] = {
 };
 
 /* hardware volume quirks */
-static struct snd_pci_quirk m3_hv_quirk_list[] = {
+static const struct snd_pci_quirk m3_hv_quirk_list[] = {
 	/* Allegro chips */
 	SND_PCI_QUIRK(0x0E11, 0x002E, NULL, HV_CTRL_ENABLE | HV_BUTTON_FROM_GD),
 	SND_PCI_QUIRK(0x0E11, 0x0094, NULL, HV_CTRL_ENABLE | HV_BUTTON_FROM_GD),
@@ -902,7 +902,7 @@ static struct snd_pci_quirk m3_hv_quirk_list[] = {
 };
 
 /* HP Omnibook quirks */
-static struct snd_pci_quirk m3_omnibook_quirk_list[] = {
+static const struct snd_pci_quirk m3_omnibook_quirk_list[] = {
 	SND_PCI_QUIRK_ID(0x103c, 0x0010), /* HP OmniBook 6000 */
 	SND_PCI_QUIRK_ID(0x103c, 0x0011), /* HP OmniBook 500 */
 	{ } /* END */
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 99228b93b3c6..25275a98e950 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1634,7 +1634,7 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 
 enum { NM_BLACKLISTED, NM_RESET_WORKAROUND, NM_RESET_WORKAROUND_2 };
 
-static struct snd_pci_quirk nm256_quirks[] = {
+static const struct snd_pci_quirk nm256_quirks[] = {
 	/* HP omnibook 4150 has cs4232 codec internally */
 	SND_PCI_QUIRK(0x103c, 0x0007, "HP omnibook 4150", NM_BLACKLISTED),
 	/* Reset workarounds to avoid lock-ups */
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index c8fb51885b6d..6c83ad3275f9 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2417,7 +2417,7 @@ static struct via823x_info via823x_cards[] = {
  * auto detection of DXS channel supports.
  */
 
-static struct snd_pci_quirk dxs_whitelist[] = {
+static const struct snd_pci_quirk dxs_whitelist[] = {
 	SND_PCI_QUIRK(0x1005, 0x4710, "Avance Logic Mobo", VIA_DXS_ENABLE),
 	SND_PCI_QUIRK(0x1019, 0x0996, "ESC Mobo", VIA_DXS_48K),
 	SND_PCI_QUIRK(0x1019, 0x0a81, "ECS K7VTA3 v8.0", VIA_DXS_NO_VRA),
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
