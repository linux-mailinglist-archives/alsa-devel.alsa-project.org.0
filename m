Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543B725B5CE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DB6171E;
	Wed,  2 Sep 2020 23:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DB6171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599081881;
	bh=ckK4oZ8dZJJTPZ1Z4416LfIocowK+L3r1RkecNluhEw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVB/FxETf+xZgi+PBVkpmsTb5HKKgxbyObxCtLCZnGocLtoddXc+qX16Ntokf2G7l
	 N2h0MFwh16u5mlgl1Qwv/etbmMppi3CXL7liw6XOCd4sKKoXBEBDjkx6xzEn4thBG/
	 TYqB+OPrOmA8xpzgV/HZKkWqow8akd1DIVdnado8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A285F802E2;
	Wed,  2 Sep 2020 23:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D94F800F3; Wed,  2 Sep 2020 23:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1056F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1056F800F3
IronPort-SDR: P+RHd1XZjLNr7RA/FKCqc5BGY7SwW/xl1oQV2Bgkr3bxRXT5y/l75jKE1Hl8ct8XcRY/A63Grt
 0PkisvmR82RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482847"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482847"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:21:58 -0700
IronPort-SDR: WT/RWF9GP4Wzgn5huYazDsZ4xLdMuz8CPnpP26L6GwgOtXtzax0nX0rXCP5Wt21QbLhWuZ0Lm5
 Xm5zVeSuS20w==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798264"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:21:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/18] ALSA: core: pcm: simplify locking for timers
Date: Wed,  2 Sep 2020 16:21:16 -0500
Message-Id: <20200902212133.30964-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix sparse warning:

sound/core/pcm.c:999:9: warning: context imbalance in
'snd_pcm_detach_substream' - different lock contexts for basic block

There's no real reason to test the same thing twice, and it's simpler
have linear sequences.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index b6d2331a82f7..be5714f1bb58 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -991,11 +991,13 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 		       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control)));
 	kfree(runtime->hw_constraints.rules);
 	/* Avoid concurrent access to runtime via PCM timer interface */
-	if (substream->timer)
+	if (substream->timer) {
 		spin_lock_irq(&substream->timer->lock);
-	substream->runtime = NULL;
-	if (substream->timer)
+		substream->runtime = NULL;
 		spin_unlock_irq(&substream->timer->lock);
+	} else {
+		substream->runtime = NULL;
+	}
 	kfree(runtime);
 	put_pid(substream->pid);
 	substream->pid = NULL;
-- 
2.25.1

