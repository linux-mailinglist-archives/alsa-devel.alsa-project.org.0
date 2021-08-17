Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F23EE7E5
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 09:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5083F112;
	Tue, 17 Aug 2021 09:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5083F112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629187077;
	bh=4CNSKQPyrc/GhdfLXG4DuNr3rqE/me2ZuR22DO42X9g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C4uu7q1DKyU434ZKnbZCMf3V8KGd/brv8XHIrionAXoj8anZk2f9CsPXYD0c3HiS8
	 CMBKvzTQYiLkGUVcZyYbE3U6/QNRmSM3FI+qmO9M0X3Mvu0njNvJ5oAomBWU4UMtz7
	 oar8HDMNtXWwcvmbOdkYqwoO55UcFgZJbA2oTZyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B62F802C4;
	Tue, 17 Aug 2021 09:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 514A4F80272; Tue, 17 Aug 2021 09:56:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 638B0F80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 09:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638B0F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="XZ4DwTUs"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="vaSKyWfG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6AC0621B3E
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629186991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wxy/mn1E4MWTMN/XzVRReihRBV13gE9BSkdGPv/nvxM=;
 b=XZ4DwTUseQcLAGSUW8kVhYupk4XXMwfUKWr8JJJtK7j9/SStRhTNkLo+lujPo8CImRu9Aq
 HyEoNST5q3nRyP7hjQ+xkqduak4LlUSd23EQitUyUdg9SvzQA+TrzMPTCUPIEXGCnsVfAY
 H869sGpQpOhm7nIbWFNKdYpQVlKsKAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629186991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wxy/mn1E4MWTMN/XzVRReihRBV13gE9BSkdGPv/nvxM=;
 b=vaSKyWfGwVMbxKw/ZCvnDqm0oIempF1vVt6qMSvQHHFEQSyjgVo5CdKGM/Yul/0GX2Z3Be
 d4PHM5NwBoAQyVBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5A797A3B9C;
 Tue, 17 Aug 2021 07:56:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH for-5.15] ALSA: hda: Drop workaround for a hang at shutdown
 again
Date: Tue, 17 Aug 2021 09:56:30 +0200
Message-Id: <20210817075630.7115-1-tiwai@suse.de>
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

The commit 0165c4e19f6e ("ALSA: hda: Fix hang during shutdown due to
link reset") modified the shutdown callback of the HD-audio controller
for working around a hang.  Meanwhile, the actual culprit of the hang
was identified to be the leftover active codecs that may interfere
with the powered down controller somehow, but we took a minimal fix
approach for 5.14, and that was the commit above.

Now, since the codec drivers go runtime-suspend at shutdown for 5.15,
we can revert the change and make sure that the full runtime-suspend
is performed at shutdown of HD-audio controller again.  This patch
essentially reverts the commit above to restore the behavior.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 47777439961c..3aa432d814a2 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -883,11 +883,10 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	return azx_get_pos_posbuf(chip, azx_dev);
 }
 
-static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
+static void azx_shutdown_chip(struct azx *chip)
 {
 	azx_stop_chip(chip);
-	if (!skip_link_reset)
-		azx_enter_link_reset(chip);
+	azx_enter_link_reset(chip);
 	azx_clear_irq_pending(chip);
 	display_power(chip, false);
 }
@@ -896,11 +895,6 @@ static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
 static DEFINE_MUTEX(card_list_lock);
 static LIST_HEAD(card_list);
 
-static void azx_shutdown_chip(struct azx *chip)
-{
-	__azx_shutdown_chip(chip, false);
-}
-
 static void azx_add_card_list(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -2363,7 +2357,7 @@ static void azx_shutdown(struct pci_dev *pci)
 		return;
 	chip = card->private_data;
 	if (chip && chip->running)
-		__azx_shutdown_chip(chip, true);
+		azx_shutdown_chip(chip);
 }
 
 /* PCI IDs */
-- 
2.26.2

