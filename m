Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4742408B43
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 14:45:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4EA1654;
	Mon, 13 Sep 2021 14:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4EA1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631537102;
	bh=XPoptLzVZXfTusuH5emFcquo/EpZ+re81OiCAtRLmuM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T9FpJ/jxgY3g6lLsH4AbVtg3e3Cp3tyb/Ege348KdEM/ktdDNHduZWaE/ykgQLgIr
	 2j4nyEru6LH5br6+5ST/JRtFH1YzLHj/L9QjKrwrn4R55vkw4dSz5j6tY4uMNX3Y5Y
	 WnjPcitNUDZxsU/0QMjJ4mBYugLLeJEGzIbEQWE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA44F80132;
	Mon, 13 Sep 2021 14:43:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C128BF8027C; Mon, 13 Sep 2021 14:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9586F80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 14:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9586F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iJM6Hfia"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="u3DYddmL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E8C8F21EA1
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631537011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EhpQcU7KRRNxxgRc7OTNU7DMEinAKyvxGoRvy9BVdgk=;
 b=iJM6HfiapXC9MUqp/UmGeGwzFX3g7m+THfz1/ohsBisbian1MXEcz3Kasgpv63HSZ+OfJV
 GoTD4OaOJm+hZOteu2jRme25ilq8sRXZKhHJkJorQOlrscX1cFlZo+Ce39NAItyKMVC5Ab
 2KUcRFYue/o3mvu+y5BnIR1z856xY3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631537011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EhpQcU7KRRNxxgRc7OTNU7DMEinAKyvxGoRvy9BVdgk=;
 b=u3DYddmLl4oBP//AMa1a7AuRZMRFvfd6jtSB60s9OfmLMJNyLKP+5ul0ufGdE86oHtmCxo
 EXcmx1Ph+saxHJCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E3B92A3B8E;
 Mon, 13 Sep 2021 12:43:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: hda: Drop workaround for a hang at shutdown
 again"
Date: Mon, 13 Sep 2021 14:43:30 +0200
Message-Id: <20210913124330.24530-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

This reverts commit 8fc8e903156f42c66245838441d03607e9067381.

It was expected that the fixes in HD-audio codec side would make the
workaround redundant, but unfortunately it doesn't seem sufficing.
Resurrect the workaround for now.

Fixes: 8fc8e903156f ("ALSA: hda: Drop workaround for a hang at shutdown again")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3aa432d814a2..47777439961c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -883,10 +883,11 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	return azx_get_pos_posbuf(chip, azx_dev);
 }
 
-static void azx_shutdown_chip(struct azx *chip)
+static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
 {
 	azx_stop_chip(chip);
-	azx_enter_link_reset(chip);
+	if (!skip_link_reset)
+		azx_enter_link_reset(chip);
 	azx_clear_irq_pending(chip);
 	display_power(chip, false);
 }
@@ -895,6 +896,11 @@ static void azx_shutdown_chip(struct azx *chip)
 static DEFINE_MUTEX(card_list_lock);
 static LIST_HEAD(card_list);
 
+static void azx_shutdown_chip(struct azx *chip)
+{
+	__azx_shutdown_chip(chip, false);
+}
+
 static void azx_add_card_list(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -2357,7 +2363,7 @@ static void azx_shutdown(struct pci_dev *pci)
 		return;
 	chip = card->private_data;
 	if (chip && chip->running)
-		azx_shutdown_chip(chip);
+		__azx_shutdown_chip(chip, true);
 }
 
 /* PCI IDs */
-- 
2.26.2

