Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF621F838
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E321678;
	Tue, 14 Jul 2020 19:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E321678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747915;
	bh=Nyu3VtqVNdvKbJ5ndD49mw0xhvfTtUzJSnPyWPWsUu8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuTnyv89+1WMzlkKWAPV69BzKia9BG3RDuIYVlVTnTajbroI9BOdNAy1SW6oWcZgc
	 ti7pkgC1IzgxjNPOOvTegdtA+ARdmMEWnCzRUl/vYUasSCVlU13Uv8IAq/q25KSUMZ
	 8Ewe+0JMV1BfrlTQza71NLH7TebhBrgH/74VdpnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EE4F802F9;
	Tue, 14 Jul 2020 19:27:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23AAF802EA; Tue, 14 Jul 2020 19:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAE0F8020C
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAE0F8020C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E2A0AD65
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ALSA: es1968: Replace the words white/blacklist
Date: Tue, 14 Jul 2020 19:26:26 +0200
Message-Id: <20200714172631.25371-6-tiwai@suse.de>
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index d26004b35a81..34332d008b27 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2631,7 +2631,7 @@ struct ess_device_list {
 	unsigned short vendor;	/* subsystem vendor id */
 };
 
-static const struct ess_device_list pm_whitelist[] = {
+static const struct ess_device_list pm_allowlist[] = {
 	{ TYPE_MAESTRO2E, 0x0e11 },	/* Compaq Armada */
 	{ TYPE_MAESTRO2E, 0x1028 },
 	{ TYPE_MAESTRO2E, 0x103c },
@@ -2642,7 +2642,7 @@ static const struct ess_device_list pm_whitelist[] = {
 	{ TYPE_MAESTRO2, 0x125d },	/* a PCI card, e.g. SF64-PCE2 */
 };
 
-static const struct ess_device_list mpu_blacklist[] = {
+static const struct ess_device_list mpu_denylist[] = {
 	{ TYPE_MAESTRO2, 0x125d },
 };
 
@@ -2724,12 +2724,12 @@ static int snd_es1968_create(struct snd_card *card,
 	pci_set_master(pci);
 
 	if (do_pm > 1) {
-		/* disable power-management if not on the whitelist */
+		/* disable power-management if not on the allowlist */
 		unsigned short vend;
 		pci_read_config_word(chip->pci, PCI_SUBSYSTEM_VENDOR_ID, &vend);
-		for (i = 0; i < (int)ARRAY_SIZE(pm_whitelist); i++) {
-			if (chip->type == pm_whitelist[i].type &&
-			    vend == pm_whitelist[i].vendor) {
+		for (i = 0; i < (int)ARRAY_SIZE(pm_allowlist); i++) {
+			if (chip->type == pm_allowlist[i].type &&
+			    vend == pm_allowlist[i].vendor) {
 				do_pm = 1;
 				break;
 			}
@@ -2848,12 +2848,12 @@ static int snd_es1968_probe(struct pci_dev *pci,
 	}
 
 	if (enable_mpu[dev] == 2) {
-		/* check the black list */
+		/* check the deny list */
 		unsigned short vend;
 		pci_read_config_word(chip->pci, PCI_SUBSYSTEM_VENDOR_ID, &vend);
-		for (i = 0; i < ARRAY_SIZE(mpu_blacklist); i++) {
-			if (chip->type == mpu_blacklist[i].type &&
-			    vend == mpu_blacklist[i].vendor) {
+		for (i = 0; i < ARRAY_SIZE(mpu_denylist); i++) {
+			if (chip->type == mpu_denylist[i].type &&
+			    vend == mpu_denylist[i].vendor) {
 				enable_mpu[dev] = 0;
 				break;
 			}
-- 
2.16.4

