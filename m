Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A612F5C5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C40F17DB;
	Fri,  3 Jan 2020 09:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C40F17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041795;
	bh=QHNUIAX46RafiW4ZgF3YSywxakT8CtrIoUmj0QKvCa8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNl0dyjEFEplFBgj/wUM56vwJm/Jbw/nXPMGd/8mDNkjmTz7M9LeAh1VA3vUIbtL2
	 SqkVKTswpO8kjrb4uoT0RdCGs9viT9y5pIkrFOzvYFBXRB3ubDSBRlE2MOg9zkdkqe
	 uJvxPLAWfQSxjRpSccX2Bl9msVnxU5hTaKN6JNGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABCCF80568;
	Fri,  3 Jan 2020 09:19:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2B3DF803E0; Fri,  3 Jan 2020 09:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61EF1F802EC
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61EF1F802EC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A27AB28D
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:13 +0100
Message-Id: <20200103081714.9560-58-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 57/58] ALSA: hda: Constify snd_pci_quirk tables
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
 sound/pci/hda/hda_intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4733268ec74e..bebc31024737 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1490,7 +1490,7 @@ static bool check_hdmi_disabled(struct pci_dev *pci)
 /*
  * white/black-listing for position_fix
  */
-static struct snd_pci_quirk position_fix_list[] = {
+static const struct snd_pci_quirk position_fix_list[] = {
 	SND_PCI_QUIRK(0x1028, 0x01cc, "Dell D820", POS_FIX_LPIB),
 	SND_PCI_QUIRK(0x1028, 0x01de, "Dell Precision 390", POS_FIX_LPIB),
 	SND_PCI_QUIRK(0x103c, 0x306d, "HP dv3", POS_FIX_LPIB),
@@ -1583,7 +1583,7 @@ static void assign_position_fix(struct azx *chip, int fix)
 /*
  * black-lists for probe_mask
  */
-static struct snd_pci_quirk probe_mask_list[] = {
+static const struct snd_pci_quirk probe_mask_list[] = {
 	/* Thinkpad often breaks the controller communication when accessing
 	 * to the non-working (or non-existing) modem codec slot.
 	 */
@@ -1631,7 +1631,7 @@ static void check_probe_mask(struct azx *chip, int dev)
 /*
  * white/black-list for enable_msi
  */
-static struct snd_pci_quirk msi_black_list[] = {
+static const struct snd_pci_quirk msi_black_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x2191, "HP", 0), /* AMD Hudson */
 	SND_PCI_QUIRK(0x103c, 0x2192, "HP", 0), /* AMD Hudson */
 	SND_PCI_QUIRK(0x103c, 0x21f7, "HP", 0), /* AMD Hudson */
@@ -2164,7 +2164,7 @@ static int azx_probe(struct pci_dev *pci,
  * So we keep a list of devices where we disable powersaving as its known
  * to causes problems on these devices.
  */
-static struct snd_pci_quirk power_save_blacklist[] = {
+static const struct snd_pci_quirk power_save_blacklist[] = {
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1849, 0xc892, "Asrock B85M-ITX", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
