Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D588A1A6401
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DFB16E2;
	Mon, 13 Apr 2020 10:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DFB16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586766148;
	bh=HyL6vCZWX2PivplZUpF5Zp3SlbhvVUbDbpifguZwzPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qh5r1tq50meMtPvzaBrJKRIR1VzFmgzMaArMprclCAac680arFGUbqx6YfjaNiD9T
	 mB4hCFUgXPK36rwnScOaZ/vatD4sRhSAv0ITGuAIF2D0XRATiqPNiim7TZPv8/0Cqa
	 2v7+jiASzXZomMbDKQ4cleNv+dXhjH4bloNKdzJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C8AF8027C;
	Mon, 13 Apr 2020 10:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB458F8027C; Mon, 13 Apr 2020 10:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FDBAF80229
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDBAF80229
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82E6EACAD;
 Mon, 13 Apr 2020 08:20:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ALSA: hda: Honor PM disablement in PM freeze and
 thaw_noirq ops
Date: Mon, 13 Apr 2020 10:20:30 +0200
Message-Id: <20200413082034.25166-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200413082034.25166-1-tiwai@suse.de>
References: <20200413082034.25166-1-tiwai@suse.de>
Cc: Roy Spliet <nouveau@spliet.org>
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

freeze_noirq and thaw_noirq need to check the PM availability like
other PM ops.  There are cases where the device got disabled due to
the error, and the PM operation should be ignored for that.

Fixes: 3e6db33aaf1d ("ALSA: hda - Set SKL+ hda controller power at freeze() and thaw()")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a2e811375750..f41d8b7864c1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1071,6 +1071,8 @@ static int azx_freeze_noirq(struct device *dev)
 	struct azx *chip = card->private_data;
 	struct pci_dev *pci = to_pci_dev(dev);
 
+	if (!azx_is_pm_ready(card))
+		return 0;
 	if (chip->driver_type == AZX_DRIVER_SKL)
 		pci_set_power_state(pci, PCI_D3hot);
 
@@ -1083,6 +1085,8 @@ static int azx_thaw_noirq(struct device *dev)
 	struct azx *chip = card->private_data;
 	struct pci_dev *pci = to_pci_dev(dev);
 
+	if (!azx_is_pm_ready(card))
+		return 0;
 	if (chip->driver_type == AZX_DRIVER_SKL)
 		pci_set_power_state(pci, PCI_D0);
 
-- 
2.16.4

