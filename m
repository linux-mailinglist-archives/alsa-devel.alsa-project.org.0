Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7692ADD6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 07:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470D71769;
	Mon, 27 May 2019 06:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470D71769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558933244;
	bh=1rTS4ENz5ENK4SUjJ6JxKVBD7E2XxH0JoLAaxhXhdrQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LC7cyhB19OIrml2QI4qgd5Ed1y7m+ug3kluatiA45LiRBGrpQ8KpcGDXpXlgwohvK
	 PWfFOE4CpztDhs5HEDcFuQ7KcbJj2+Y99lf7yO+lPvsiImUIOLNMb8g4yLdGNQKiOO
	 bPd95jDt+rAZ4onYLR+YU5YGVgNMnQrvQxszKUZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CC15F8972D;
	Mon, 27 May 2019 06:57:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A47F8072E; Mon, 27 May 2019 06:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE006F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 06:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE006F8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 21:57:27 -0700
X-ExtLoop1: 1
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 21:57:26 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 27 May 2019 00:58:33 +0800
Message-Id: <20190526165836.10867-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
References: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, libin.yang@intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
Subject: [alsa-devel] [PATCH 2/5] ALSA: hda: assign polling_mode after
	azx_bus_init
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We will move the polling_mode flag from struct azx to struct hdac_bus,
and the flag should be assigned after bus init.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a93468ffb85c..a3c190f2e17a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1701,10 +1701,6 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	else
 		chip->bdl_pos_adj = bdl_pos_adj[dev];
 
-	/* Workaround for a communication error on CFL (bko#199007) and CNL */
-	if (IS_CFL(pci) || IS_CNL(pci))
-		chip->polling_mode = 1;
-
 	err = azx_bus_init(chip, model[dev], &pci_hda_io_ops);
 	if (err < 0) {
 		kfree(hda);
@@ -1712,6 +1708,10 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		return err;
 	}
 
+	/* Workaround for a communication error on CFL (bko#199007) and CNL */
+	if (IS_CFL(pci) || IS_CNL(pci))
+		chip->polling_mode = 1;
+
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
 		chip->bus.needs_damn_long_delay = 1;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
