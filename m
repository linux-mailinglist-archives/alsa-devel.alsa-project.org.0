Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59C5AE3C4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A09847;
	Tue,  6 Sep 2022 11:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A09847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662455070;
	bh=m/+t7nrEVAJ8xR88xqnapges0ZxX7MYUkodY9zOtlQc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oj5MjioLqC3y82UIECTtbiGxc59aWnzmteSP7J9QDvKPPQ9NOklg4pEY828GI+iWV
	 /dyNIAlnX4VXpYrrzUhJ3NBZLcjjOKe/fnCs+ieEUsO3meMJvAy6qGtmHffNelMwP5
	 JCcP0EXn5SDL0zhxBWFhP59cgSo+OYUt6mjhyHw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2CCF8024C;
	Tue,  6 Sep 2022 11:03:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F667F80249; Tue,  6 Sep 2022 11:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA33FF800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 11:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA33FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="maPxheFN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="QJTw2TTG"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 537ED1F90F;
 Tue,  6 Sep 2022 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662455002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r7d0fKfiJeArL7MNk63DngGlpSHFTSFJFbpJTwfNdFA=;
 b=maPxheFNZYuQD3x5fhQSDsFZqvvGzQcjhXsBeGPbx0dyeju0TWoADIJTnpiIyf8327jbDa
 NjHGtiqpDHw4vLDgH7PJsT6M9sYKMCi3jZhDDCRx5tFNylPGJks05R4hZeDowyo7CoVZmk
 f9/XB+BsQ6Y3Tui5Iu3LYKikkJP5GPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662455002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r7d0fKfiJeArL7MNk63DngGlpSHFTSFJFbpJTwfNdFA=;
 b=QJTw2TTGWaqtTdgHt5bOFOAbS2L6AziT1uz0y/ssQsgB34Qmip2fuaB5Tcv87sDiOUd8WI
 Z2sLWlgJHrDYHVCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38B6C13A19;
 Tue,  6 Sep 2022 09:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EffkDNoMF2M0YQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 09:03:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Once again fix regression of page allocations with
 IOMMU
Date: Tue,  6 Sep 2022 11:03:19 +0200
Message-Id: <20220906090319.23358-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
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

The last fix for trying to recover the regression on AMD platforms,
unfortunately, leaded to yet another regression: it turned out that
IOMMUs don't like the usage of raw page allocations.

This is yet another attempt for addressing the log saga; at this time,
we re-use the existing buffer allocation mechanism with SG-pages
although we require only single pages.  The SG buffer allocation
itself was confirmed to work for stream buffers, so it's relatively
easy to adapt for other places.

The only problem is: although the HD-audio code is accessing the
address directly via dmab->address field, SG-pages don't set up it.
For the ease of adaption, we now set up the dmab->addr field from the
address of the first page as default, so that it can run with the
HD-audio driver code as-is without the excessive call of
snd_sgbuf_get_addr() multiple times; that's the only change in the
memalloc helper side.  The rest is nothing but a flip of the dma_type
field in the HD-audio side.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216112
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216363
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c     | 9 +++++++--
 sound/pci/hda/hda_intel.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index b665ac66ccbe..cfcd8eff4139 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -543,10 +543,13 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
 					    sg_dma_address(sgt->sgl));
 	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
-	if (p)
+	if (p) {
 		dmab->private_data = sgt;
-	else
+		/* store the first page address for convenience */
+		dmab->addr = snd_sgbuf_get_addr(dmab, 0);
+	} else {
 		dma_free_noncontiguous(dmab->dev.dev, size, sgt, dmab->dev.dir);
+	}
 	return p;
 }
 
@@ -780,6 +783,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	if (!p)
 		goto error;
 	dmab->private_data = sgbuf;
+	/* store the first page address for convenience */
+	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
 	return p;
 
  error:
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a77165bd92a9..b20694fd69de 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1817,7 +1817,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-- 
2.35.3

