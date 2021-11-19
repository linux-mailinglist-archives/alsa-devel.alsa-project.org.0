Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546734572F1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 17:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE208179A;
	Fri, 19 Nov 2021 17:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE208179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637339348;
	bh=1biKHNn9SLUEVhDUDAwD08+BGRvoCrzXn6noX9d/vIQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZCUqpm+qYuK0feVURtTJ30SJSxnQ09XMtFSAfJ6KclAbCez8bz3TorxcA9KEaxScV
	 N8UJm3NWj9RsXtoz3iCwBvAkDCtVLyP04dXx5gsOR0B46ePwXqpJtDABCxoFl/1rFY
	 XKxKoRbDTo9KTeALCg+LWxOUmrffXprBvcdp+zso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE4ACF8026D;
	Fri, 19 Nov 2021 17:27:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABA2DF80217; Fri, 19 Nov 2021 17:27:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EEDBF80115
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 17:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEDBF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vslxyBiK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MhzwYjrg"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DE6E021637;
 Fri, 19 Nov 2021 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637339256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8MSyxYoz2hixPwSDPR7/BRgTlGTvuCQyLmSqECX5/2c=;
 b=vslxyBiKXVFbvjgqPIjgvPrnypZglzYodiz45rOkT/9cAR6x6rl+ZHW/rUbKWyUF3K4OTJ
 hJRQUcNBgiaiFm/6hILQ3HoHLm43MdgIEqonLUoDaQvbuoh5fYI1MKc1rNq/p7/1p4dap0
 graMIm0RjqiCNOoMTVP6016bjuEFZyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637339256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8MSyxYoz2hixPwSDPR7/BRgTlGTvuCQyLmSqECX5/2c=;
 b=MhzwYjrgigtqwUL6zLdZaiy6wxArd4hLAU768m3dfp9ycGHy2baUWimTt/QbwX93qfKc9c
 Cvg+xTIbCxt4AvAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C59CFA3B85;
 Fri, 19 Nov 2021 16:27:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Remove redundant runtime PM calls
Date: Fri, 19 Nov 2021 17:27:30 +0100
Message-Id: <20211119162730.24423-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

The previous fix for more comprehensive runtime PM calls turned out to
be not good as hoped; a few calls including pm_runtime_enable() and
pm_runtime_disable() are rather utterly superfluous for PCI devices,
even triggering a kernel error message.  Better to drop those calls.

Note that the problem we wanted to solve with that commit seems
irrelevant with the fix itself; the original bug (a GPF at
azx_remove()) was likely a regression by the recent PCI core cleanup,
and the buggy PCI change has been already reverted.  So basically we
were scratching a wrong surface.  OTOH, making the runtime PM calls
symmetric for both probe and remove is more consistent, and maybe
that's a sensible outcome.

Fixes: 4f66a9ef37d3 ("ALSA: hda: intel: More comprehensive PM runtime setup for controller driver")
Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
Link: https://lore.kernel.org/r/d9d76980-966a-e031-70d1-3254ba5be5eb@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 45e85180048c..221afacbc7fd 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1349,8 +1349,6 @@ static void azx_free(struct azx *chip)
 
 	if (azx_has_pm_runtime(chip) && chip->running) {
 		pm_runtime_get_noresume(&pci->dev);
-		pm_runtime_disable(&pci->dev);
-		pm_runtime_set_suspended(&pci->dev);
 		pm_runtime_forbid(&pci->dev);
 		pm_runtime_dont_use_autosuspend(&pci->dev);
 	}
@@ -2328,8 +2326,6 @@ static int azx_probe_continue(struct azx *chip)
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
 		pm_runtime_allow(&pci->dev);
-		pm_runtime_set_active(&pci->dev);
-		pm_runtime_enable(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
 
-- 
2.31.1

