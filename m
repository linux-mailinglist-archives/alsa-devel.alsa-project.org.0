Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DF21F837
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3861660;
	Tue, 14 Jul 2020 19:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3861660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747895;
	bh=D0REilJIvYkv8uMwpViLKngqbCsMDGY10ukiMq+BdGE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ygj6dsCtjEOy8CyKftMk/Os+swT/SUhs2OxbmxSYH/q2gxmCP4QCDiZz0baIKYzIO
	 a2pbaoPcwxMmpUwMc38fJYSNQLfAL5ySnrTegtkXflzo0KvV7+1QByrf6XR2pwNsmp
	 HZOr+WJSqic9NlhLUXG13VRUDDx6xYujzkWJ5weo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38118F802EC;
	Tue, 14 Jul 2020 19:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2D2F802E1; Tue, 14 Jul 2020 19:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 172C1F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172C1F800E5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59FF0AD73
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ALSA: intel8x0: Replace the words white/blacklist
Date: Tue, 14 Jul 2020 19:26:28 +0200
Message-Id: <20200714172631.25371-8-tiwai@suse.de>
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

Correcting only comments, or error/module messages, no functional
changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 675bb0da00a0..3349e455a871 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -66,7 +66,7 @@ MODULE_PARM_DESC(index, "Index value for Intel i8x0 soundcard.");
 module_param(id, charp, 0444);
 MODULE_PARM_DESC(id, "ID string for Intel i8x0 soundcard.");
 module_param(ac97_clock, int, 0444);
-MODULE_PARM_DESC(ac97_clock, "AC'97 codec clock (0 = whitelist + auto-detect, 1 = force autodetect).");
+MODULE_PARM_DESC(ac97_clock, "AC'97 codec clock (0 = allowlist + auto-detect, 1 = force autodetect).");
 module_param(ac97_quirk, charp, 0444);
 MODULE_PARM_DESC(ac97_quirk, "AC'97 workaround for strange hardware.");
 module_param(buggy_semaphore, bool, 0444);
@@ -2792,7 +2792,7 @@ static int intel8x0_in_clock_list(struct intel8x0 *chip)
 	wl = snd_pci_quirk_lookup(pci, intel8x0_clock_list);
 	if (!wl)
 		return 0;
-	dev_info(chip->card->dev, "white list rate for %04x:%04x is %i\n",
+	dev_info(chip->card->dev, "allow list rate for %04x:%04x is %i\n",
 	       pci->subsystem_vendor, pci->subsystem_device, wl->value);
 	chip->ac97_bus->clock = wl->value;
 	return 1;
@@ -3138,7 +3138,7 @@ static const struct snd_pci_quirk spdif_aclink_defaults[] = {
 	{ } /* end */
 };
 
-/* look up white/black list for SPDIF over ac-link */
+/* look up allow/deny list for SPDIF over ac-link */
 static int check_default_spdif_aclink(struct pci_dev *pci)
 {
 	const struct snd_pci_quirk *w;
-- 
2.16.4

