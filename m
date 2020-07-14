Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077421F840
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E05E41660;
	Tue, 14 Jul 2020 19:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E05E41660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747957;
	bh=dr2veUEKlDGnJA+n5Jkd8/jEfYXSs7OTg6RMGGk63gY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNhKY+RY/wg1H2gyWb6iBkbmIrFQLiSr4q/cr+LQeFsKBtLmBYierzy7ly26I7Yc2
	 jg6PR9vOCOV4/nMhOVjdcaDQYjgHo+JJuh1t9PmPRI+4+/8415lvnssZtJNJlg+csY
	 GeFPvsFUQTjN1JkssA7z1211KfNl6Gen5qmXIdjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C2CF802FB;
	Tue, 14 Jul 2020 19:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB51F802EA; Tue, 14 Jul 2020 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C73F8026A
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C73F8026A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BF09AD6B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ALSA: hda: Replace the words white/blacklist
Date: Tue, 14 Jul 2020 19:26:27 +0200
Message-Id: <20200714172631.25371-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
words "whitelist" and "blacklist" appropriately.

Only comment or variable renames, no functional changes.

Note that pm_blacklist module option is still kept as was, so that
users can still keep the old option.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c     | 26 +++++++++++++-------------
 sound/pci/hda/patch_realtek.c |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 59c87ab62b14..91054d8a9b38 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -180,7 +180,7 @@ MODULE_PARM_DESC(power_save, "Automatic power-saving timeout "
 
 static bool pm_blacklist = true;
 module_param(pm_blacklist, bool, 0644);
-MODULE_PARM_DESC(pm_blacklist, "Enable power-management blacklist");
+MODULE_PARM_DESC(pm_blacklist, "Enable power-management denylist");
 
 /* reset the HD-audio controller in power save mode.
  * this may give more power-saving, but will take longer time to
@@ -1506,7 +1506,7 @@ static bool check_hdmi_disabled(struct pci_dev *pci)
 #endif /* SUPPORT_VGA_SWITCHEROO */
 
 /*
- * white/black-listing for position_fix
+ * allow/deny-listing for position_fix
  */
 static const struct snd_pci_quirk position_fix_list[] = {
 	SND_PCI_QUIRK(0x1028, 0x01cc, "Dell D820", POS_FIX_LPIB),
@@ -1599,7 +1599,7 @@ static void assign_position_fix(struct azx *chip, int fix)
 }
 
 /*
- * black-lists for probe_mask
+ * deny-lists for probe_mask
  */
 static const struct snd_pci_quirk probe_mask_list[] = {
 	/* Thinkpad often breaks the controller communication when accessing
@@ -1647,9 +1647,9 @@ static void check_probe_mask(struct azx *chip, int dev)
 }
 
 /*
- * white/black-list for enable_msi
+ * allow/deny-list for enable_msi
  */
-static const struct snd_pci_quirk msi_black_list[] = {
+static const struct snd_pci_quirk msi_deny_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x2191, "HP", 0), /* AMD Hudson */
 	SND_PCI_QUIRK(0x103c, 0x2192, "HP", 0), /* AMD Hudson */
 	SND_PCI_QUIRK(0x103c, 0x21f7, "HP", 0), /* AMD Hudson */
@@ -1672,7 +1672,7 @@ static void check_msi(struct azx *chip)
 		return;
 	}
 	chip->msi = 1;	/* enable MSI as default */
-	q = snd_pci_quirk_lookup(chip->pci, msi_black_list);
+	q = snd_pci_quirk_lookup(chip->pci, msi_deny_list);
 	if (q) {
 		dev_info(chip->card->dev,
 			 "msi for device %04x:%04x set to %d\n",
@@ -2072,11 +2072,11 @@ static void pcm_mmap_prepare(struct snd_pcm_substream *substream,
 #endif
 }
 
-/* Blacklist for skipping the whole probe:
+/* Denylist for skipping the whole probe:
  * some HD-audio PCI entries are exposed without any codecs, and such devices
  * should be ignored from the beginning.
  */
-static const struct pci_device_id driver_blacklist[] = {
+static const struct pci_device_id driver_denylist[] = {
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith II / Strix */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creator */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
@@ -2099,8 +2099,8 @@ static int azx_probe(struct pci_dev *pci,
 	bool schedule_probe;
 	int err;
 
-	if (pci_match_id(driver_blacklist, pci)) {
-		dev_info(&pci->dev, "Skipping the blacklisted device\n");
+	if (pci_match_id(driver_denylist, pci)) {
+		dev_info(&pci->dev, "Skipping the device on the denylist\n");
 		return -ENODEV;
 	}
 
@@ -2190,7 +2190,7 @@ static int azx_probe(struct pci_dev *pci,
  * So we keep a list of devices where we disable powersaving as its known
  * to causes problems on these devices.
  */
-static const struct snd_pci_quirk power_save_blacklist[] = {
+static const struct snd_pci_quirk power_save_denylist[] = {
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1849, 0xc892, "Asrock B85M-ITX", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
@@ -2236,9 +2236,9 @@ static void set_default_power_save(struct azx *chip)
 	if (pm_blacklist) {
 		const struct snd_pci_quirk *q;
 
-		q = snd_pci_quirk_lookup(chip->pci, power_save_blacklist);
+		q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
 		if (q && val) {
-			dev_info(chip->card->dev, "device %04x:%04x is on the power_save blacklist, forcing power_save to 0\n",
+			dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
 				 q->subvendor, q->subdevice);
 			val = 0;
 		}
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3ce63643eaf9..600fe1fb8682 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1078,7 +1078,7 @@ static int set_beep_amp(struct alc_spec *spec, hda_nid_t nid,
 	return 0;
 }
 
-static const struct snd_pci_quirk beep_white_list[] = {
+static const struct snd_pci_quirk beep_allow_list[] = {
 	SND_PCI_QUIRK(0x1043, 0x103c, "ASUS", 1),
 	SND_PCI_QUIRK(0x1043, 0x115d, "ASUS", 1),
 	SND_PCI_QUIRK(0x1043, 0x829f, "ASUS", 1),
@@ -1088,7 +1088,7 @@ static const struct snd_pci_quirk beep_white_list[] = {
 	SND_PCI_QUIRK(0x1043, 0x834a, "EeePC", 1),
 	SND_PCI_QUIRK(0x1458, 0xa002, "GA-MA790X", 1),
 	SND_PCI_QUIRK(0x8086, 0xd613, "Intel", 1),
-	/* blacklist -- no beep available */
+	/* denylist -- no beep available */
 	SND_PCI_QUIRK(0x17aa, 0x309e, "Lenovo ThinkCentre M73", 0),
 	SND_PCI_QUIRK(0x17aa, 0x30a3, "Lenovo ThinkCentre M93", 0),
 	{}
@@ -1098,7 +1098,7 @@ static inline int has_cdefine_beep(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 	const struct snd_pci_quirk *q;
-	q = snd_pci_quirk_lookup(codec->bus->pci, beep_white_list);
+	q = snd_pci_quirk_lookup(codec->bus->pci, beep_allow_list);
 	if (q)
 		return q->value;
 	return spec->cdefine.enable_pcbeep;
-- 
2.16.4

