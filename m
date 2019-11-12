Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A39F92BB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 15:34:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264F11615;
	Tue, 12 Nov 2019 15:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264F11615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573569276;
	bh=aKPYSJd2ZU7k4oMr4JHVtFHrSQ+pSHOiYX7jQdBUIrI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LQg4Nv4kybtlbwzix2ROxJAzxSE10S7Jm5Bk6CI/u+JG37yvhSBu1YmE9f4Fx1Mx2
	 HAOOTXMjeih+AZndPm61l2quJ4uEtdcbxRLYqZiDkCpM3nY/XGTDr1Wa/N2EE1mR4L
	 GX7OY1/g3lFhloO82FIkZPu63hISvw92cFCMLyNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53100F8044C;
	Tue, 12 Nov 2019 15:32:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 528DCF80483; Tue, 12 Nov 2019 15:32:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D1EBF80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 15:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D1EBF80275
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D88EAEC2
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 14:32:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 12 Nov 2019 15:32:43 +0100
Message-Id: <20191112143243.22216-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: au88x0: Fix incorrect device pointer for
	preallocation
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

The code change in commit 6974f8ad4494 ("ALSA: pci: Avoid non-standard
macro usage") contained an incorrect conversion, which left the
invalid pointer passed to the allocator for au88x0 driver.  Fix it.

Fixes: 6974f8ad4494 ("ALSA: pci: Avoid non-standard macro usage")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 1012e8da29e7..a2dcf43beedf 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -637,7 +637,7 @@ static int snd_vortex_new_pcm(vortex_t *chip, int idx, int nr)
 	/* pre-allocation of Scatter-Gather buffers */
 	
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci_dev,
+					      &chip->pci_dev->dev,
 					      0x10000, 0x10000);
 
 	switch (VORTEX_PCM_TYPE(pcm)) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
