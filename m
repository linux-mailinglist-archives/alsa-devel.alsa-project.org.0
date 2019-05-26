Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905392ADD5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 06:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C99E1759;
	Mon, 27 May 2019 06:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C99E1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558933199;
	bh=5sqNw2KAtvKpgW7XwUHxHG/SMUhDn6III/7Yvzw33Tw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMWOMqPPXtzWS6a8c/BMFUPHP5PkCgmF6WjXa1SFv1yfYTeapxDVFtCwfKcmeImUH
	 p56XcJZ0km131l5oxPuQ5BguGj3Tb6CQn4wlNlQeD9SWg055mhZ5L0kJKmgxgf7O5K
	 oZnpf/eENBI0pOrSasdXPGdy11z+21GFQSsLQfEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AD29F89728;
	Mon, 27 May 2019 06:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C682F896F7; Mon, 27 May 2019 06:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61EC0F896E4
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 06:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61EC0F896E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 21:57:28 -0700
X-ExtLoop1: 1
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 21:57:27 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 27 May 2019 00:58:34 +0800
Message-Id: <20190526165836.10867-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
References: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, libin.yang@intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
Subject: [alsa-devel] [PATCH 3/5] ALSA: hda: move polling_mode flag to
	struct hdac_bus
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

polling mode is a useful function in the get_response function. Move
polling_mode flag from struct azx to struct hdac_bus so people can
implement polling mode in their own get_response function without
adding a polling_mode flag in their local chip structure.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/hdaudio.h        |  3 +++
 sound/pci/hda/hda_controller.c | 12 ++++++------
 sound/pci/hda/hda_controller.h |  2 --
 sound/pci/hda/hda_intel.c      |  2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 45f944d57982..a4ab251d10b2 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -357,6 +357,9 @@ struct hdac_bus {
 	bool align_bdle_4k:1;		/* BDLE align 4K boundary */
 	bool reverse_assign:1;		/* assign devices in reverse order */
 	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
+	bool polling_mode:1;
+
+	int poll_count;
 
 	int bdl_pos_adj;		/* BDL position adjustment */
 
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 532e081f8b8a..53feaeef1553 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -806,11 +806,11 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 
 	for (loopcounter = 0;; loopcounter++) {
 		spin_lock_irq(&bus->reg_lock);
-		if (chip->polling_mode || do_poll)
+		if (bus->polling_mode || do_poll)
 			snd_hdac_bus_update_rirb(bus);
 		if (!bus->rirb.cmds[addr]) {
 			if (!do_poll)
-				chip->poll_count = 0;
+				bus->poll_count = 0;
 			if (res)
 				*res = bus->rirb.res[addr]; /* the last value */
 			spin_unlock_irq(&bus->reg_lock);
@@ -830,21 +830,21 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 	if (hbus->no_response_fallback)
 		return -EIO;
 
-	if (!chip->polling_mode && chip->poll_count < 2) {
+	if (!bus->polling_mode && bus->poll_count < 2) {
 		dev_dbg(chip->card->dev,
 			"azx_get_response timeout, polling the codec once: last cmd=0x%08x\n",
 			bus->last_cmd[addr]);
 		do_poll = 1;
-		chip->poll_count++;
+		bus->poll_count++;
 		goto again;
 	}
 
 
-	if (!chip->polling_mode) {
+	if (!bus->polling_mode) {
 		dev_warn(chip->card->dev,
 			 "azx_get_response timeout, switching to polling mode: last cmd=0x%08x\n",
 			 bus->last_cmd[addr]);
-		chip->polling_mode = 1;
+		bus->polling_mode = 1;
 		goto again;
 	}
 
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 7185ed574b41..8d886791cf0f 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -142,11 +142,9 @@ struct azx {
 
 	/* flags */
 	int bdl_pos_adj;
-	int poll_count;
 	unsigned int running:1;
 	unsigned int fallback_to_single_cmd:1;
 	unsigned int single_cmd:1;
-	unsigned int polling_mode:1;
 	unsigned int msi:1;
 	unsigned int probing:1; /* codec probing phase */
 	unsigned int snoop:1;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a3c190f2e17a..910dfd7e998c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1710,7 +1710,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* Workaround for a communication error on CFL (bko#199007) and CNL */
 	if (IS_CFL(pci) || IS_CNL(pci))
-		chip->polling_mode = 1;
+		azx_bus(chip)->polling_mode = 1;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
