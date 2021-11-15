Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB644FFA1
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 09:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A772166B;
	Mon, 15 Nov 2021 09:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A772166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636963288;
	bh=enWHFgn7ZFNSDq/7KYYXtB3nyduNfBkZV4id68YXNDg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BWAqjXWp+6yAfsqxT9oGYJjAjM1YclhD7wKuLz7XvhDzPQb/9Bx5IK4wrouLZHBgq
	 VEqfcrfIsePNKw5BjduvStnZGAVykWOJzc1LdXTP+FBIvTFhqjzaCxo+sjhUf14JCD
	 hveWRRllvn0r6XTMkma4/uULSWTHp6mBSNPdH2JQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B58F8028B;
	Mon, 15 Nov 2021 09:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E118F801D5; Mon, 15 Nov 2021 09:00:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3801FF80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 08:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3801FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="CeukGf2Y"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Rk/2wkuk"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BDC471FD58;
 Mon, 15 Nov 2021 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636963185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AjkqD6FUjs75UbHn4e+gJ4O0NdBlwhF5LmbaNKBA7qM=;
 b=CeukGf2YcriZbUBMxo+XbPRuiWe9CQ9N3o+51Er5vSO1erj4ypnCmKaKC9StcE77p47rxK
 aFZz0BUXDE0t5+huvEuarTyuQvmp8qOsgQi4h+6BawFE9Acgs1AlvtWZOJR9gabdDa48vh
 wNUjRCIc+EdVLMWeVqQWTH/hx8vTA4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636963185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AjkqD6FUjs75UbHn4e+gJ4O0NdBlwhF5LmbaNKBA7qM=;
 b=Rk/2wkukjAeMrfNIGU/HmtrX11ya8JMPXuDqzhBT3WM7Y7k6LhLMV6L0Rj3uPzKifbJyBz
 z+B5LlqykbXhWnDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AD44CA3B8A;
 Mon, 15 Nov 2021 07:59:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel: More comprehensive PM runtime setup for
 controller driver
Date: Mon, 15 Nov 2021 08:59:44 +0100
Message-Id: <20211115075944.6972-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Currently we haven't explicitly enable and allow/forbid the runtime PM
at the probe and the remove phases of HD-audio controller driver, and
this was the reason of a GPF mentioned in the commit e81478bbe7a1
("ALSA: hda: fix general protection fault in azx_runtime_idle");
namely, even after the resources are released, the runtime PM might be
still invoked by the bound graphics driver during the remove of the
controller driver.  Although we've fixed it by clearing the drvdata
reference, it'd be also better to cover the runtime PM issue more
properly.

This patch adds a few more pm_runtime_*() calls at the probe and the
remove time for setting and cleaning up the runtime PM.  Particularly,
now more explicitly pm_runtime_enable() and _disable() get called as
well as pm_runtime_forbid() call at the remove callback, so that a
use-after-free should be avoided.

Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20211110210307.1172004-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index fe51163f2d82..45e85180048c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1347,8 +1347,14 @@ static void azx_free(struct azx *chip)
 	if (hda->freed)
 		return;
 
-	if (azx_has_pm_runtime(chip) && chip->running)
+	if (azx_has_pm_runtime(chip) && chip->running) {
 		pm_runtime_get_noresume(&pci->dev);
+		pm_runtime_disable(&pci->dev);
+		pm_runtime_set_suspended(&pci->dev);
+		pm_runtime_forbid(&pci->dev);
+		pm_runtime_dont_use_autosuspend(&pci->dev);
+	}
+
 	chip->running = 0;
 
 	azx_del_card_list(chip);
@@ -2322,6 +2328,8 @@ static int azx_probe_continue(struct azx *chip)
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
 		pm_runtime_allow(&pci->dev);
+		pm_runtime_set_active(&pci->dev);
+		pm_runtime_enable(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
 
-- 
2.31.1

