Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB5493DBC
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 16:54:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4859131C0;
	Wed, 19 Jan 2022 16:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4859131C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642607684;
	bh=kZZWPR0MKRoCAZHZcyy7NGEq+BuXCfhKLUHknjpRBek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TCotqWZiPhV7JX9wxjmdQC7EhOAINCEXzaqXhr8GEKk7duEFexvKUrdV9q2Ao4DyI
	 OmnBoo0kYvY0gdBjJ5XGCYz1CGqgV0lGBSEw+HWUGk0hzkklW61gRDpApNNUbzHzHK
	 Lh5yfFoWAFEA5jRJJ+252ZMxaJvSrLvY25WmRPeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5643F80517;
	Wed, 19 Jan 2022 16:53:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 421C8F8050F; Wed, 19 Jan 2022 16:53:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A5A2F80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 16:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5A2F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rRzoeejj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="BgjWbsWA"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2F2571F38E;
 Wed, 19 Jan 2022 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642607581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0w/YGeMw2rfUHyjWbkEW3G9jlT+1QxCIpQPum+ksxiU=;
 b=rRzoeejjDJykhS7+MOPtrFJeQSZeSHw/e910Ef51ZBsxMU485hMBn4tEbcnGsYiMfaqR7/
 HXSuW/wbF02Vt7ZrOv0QZ5tjt46Od7+ZLCsLupVfQzcRXz2rTuVPOUdNtH/xIqifdeNQ1a
 lXdkZkHW1VmVpcjxHSEyKr4dL1eKPow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642607581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0w/YGeMw2rfUHyjWbkEW3G9jlT+1QxCIpQPum+ksxiU=;
 b=BgjWbsWArQ0PEjQZyhroC8M9mxPfJF0OvM/yi6ReNVzZUsDQoyV9wbhczUla3vh1hJpPSQ
 N2pdLKVghsm8RPAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1C5E0A3B83;
 Wed, 19 Jan 2022 15:53:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: soc-pcm: Move debugfs removal out of spinlock
Date: Wed, 19 Jan 2022 16:52:49 +0100
Message-Id: <20220119155249.26754-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220119155249.26754-1-tiwai@suse.de>
References: <20220119155249.26754-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

The recent fix for DPCM locking also covered the loop in
dpcm_be_disconnect() with the FE stream lock.  This caused an
unexpected side effect, thought: calling debugfs_remove_recursive() in
the spinlock may lead to lockdep splats as the code there assumes the
SOFTIRQ-safe context.

For avoiding the problem, this patch changes the disconnection
procedure to two phases: at first, the matching entries are removed
from the linked list, then the resources are freed outside the lock.

Fixes: b7898396f4bb ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
Reported-and-tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-pcm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e8876e65c649..9a954680d492 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1268,6 +1268,7 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
+	LIST_HEAD(deleted_dpcms);
 
 	snd_soc_dpcm_mutex_assert_held(fe);
 
@@ -1287,13 +1288,18 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 		/* BEs still alive need new FE */
 		dpcm_be_reparent(fe, dpcm->be, stream);
 
-		dpcm_remove_debugfs_state(dpcm);
-
 		list_del(&dpcm->list_be);
+		list_move(&dpcm->list_fe, &deleted_dpcms);
+	}
+	snd_soc_dpcm_stream_unlock_irq(fe, stream);
+
+	while (!list_empty(&deleted_dpcms)) {
+		dpcm = list_first_entry(&deleted_dpcms, struct snd_soc_dpcm,
+					list_fe);
 		list_del(&dpcm->list_fe);
+		dpcm_remove_debugfs_state(dpcm);
 		kfree(dpcm);
 	}
-	snd_soc_dpcm_stream_unlock_irq(fe, stream);
 }
 
 /* get BE for DAI widget and stream */
-- 
2.31.1

