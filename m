Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBE4B48D9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D86C1724;
	Mon, 14 Feb 2022 11:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D86C1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644832912;
	bh=AYEF6zqG1jaylm9YFagMIJmI8aLYBimHrZi9t7ExMr4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UWVqaBHnJ1d1NeRlP8Ve7+cPoJYOov9LP6YoLxUBPzz9gnWANldktfOLaIZHt8AAS
	 YKkFkorid5uJ8ajEiBM3FOE6nPPM9hQTnOc6VQQ7QaCDv3r5wsh90OVLajSRV0i28j
	 wQZgURxmmlUt9j4M4Y4AK1z3qunRVKlpoDxpsSY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67413F8051A;
	Mon, 14 Feb 2022 11:00:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84985F80519; Mon, 14 Feb 2022 11:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB59F80511
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB59F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="arYjQNmO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="wXoK5F0J"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id F12BD210EA
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644832823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2PmXmU7a4nnZblj0SThLwA+kxvB3rPUy8KdvyAUE7kg=;
 b=arYjQNmO0NPBb4P0aj+9NNtq99Kznxs0zZXqwplcVmKZk+wa0LF/JMWpz1iv6YDhxMKqUQ
 zhAfTHrnQqeQrtGlBftXYYjW/G/45aIiRkiUhlbQ0m+thcTJQe38yGnh9L0QiRBNKBSO5b
 o18PIwGJUCpq77nrKsiz3Ysv21NgpDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644832823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2PmXmU7a4nnZblj0SThLwA+kxvB3rPUy8KdvyAUE7kg=;
 b=wXoK5F0JUnsJ4TUyoCRcZq3H8YFsOB5J/H7/dI4Zd3KBiVfJ+sGdOXR7lmur8fp6IKZaol
 hy+e/jjDORvDjhDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E891DA3B81;
 Mon, 14 Feb 2022 10:00:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda: Fix regression on forced probe mask option
Date: Mon, 14 Feb 2022 11:00:19 +0100
Message-Id: <20220214100020.8870-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The forced probe mask via probe_mask 0x100 bit doesn't work any longer
as expected since the bus init code was moved and it's clearing the
codec_mask value that was set beforehand.  This patch fixes the
long-time regression by moving the check_probe_mask() call.

Fixes: a41d122449be ("ALSA: hda - Embed bus into controller object")
Reported-by: dmummenschanz@web.de
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4b0338c4c543..18b795220b52 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1798,8 +1798,6 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	assign_position_fix(chip, check_position_fix(chip, position_fix[dev]));
 
-	check_probe_mask(chip, dev);
-
 	if (single_cmd < 0) /* allow fallback to single_cmd at errors */
 		chip->fallback_to_single_cmd = 1;
 	else /* explicitly set to single_cmd or not */
@@ -1825,6 +1823,8 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		chip->bus.core.needs_damn_long_delay = 1;
 	}
 
+	check_probe_mask(chip, dev);
+
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 	if (err < 0) {
 		dev_err(card->dev, "Error creating device [card]!\n");
-- 
2.31.1

