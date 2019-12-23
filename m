Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC573129B6E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 23:20:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FE0C1693;
	Mon, 23 Dec 2019 23:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FE0C1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577139610;
	bh=fOPkxCUStMJfWvN6M8ViNvEGfpKL7nHIv1wfc11xbOQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdXkv9DtgC2H3aepaG2uj288JqgHsK+h/zdmQ2ggrVfl17ueJ/AGE8HE0+nO3yF4L
	 dMnT+1ZjSoiXWrzLYh6h3WPxS31bCTXiC1tgkSfODHVS5s/1D0NF6A0d+G8hTus+wF
	 9JlPA6DEAFSrHW7Jlv9PG/AwIUIACaY+rAJrLgwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE1E4F80130;
	Mon, 23 Dec 2019 23:18:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B95F80130; Mon, 23 Dec 2019 23:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3574F80087
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 23:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3574F80087
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 695B7AF2B;
 Mon, 23 Dec 2019 22:18:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 23 Dec 2019 23:18:16 +0100
Message-Id: <20191223221816.32572-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Klaus Ethgen <Klaus@ethgen.ch>
Subject: [alsa-devel] [PATCH] ALSA: hda - Apply sync-write workaround to old
	Intel platforms, too
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

Klaus Ethgen reported occasional high CPU usages in his system that
seem caused by HD-audio driver.  The perf output revealed that it's
in the unsolicited event handling in the workqueue, and the problem
seems triggered by some communication stall between the controller and
the codec at the runtime or system resume.

Actually a similar phenomenon was seen in the past for other Intel
platforms, and we already applied the workaround to enforce sync-write
for CORB/RIRB verbs for Skylake and newer chipsets (commit
2756d9143aa5 "ALSA: hda - Fix intermittent CORB/RIRB stall on Intel
chips").  Fortunately, the same workaround is applicable to the old
chipset, and the experiment showed the positive effect.

Based on the experiment result, this patch enables the sync-write
workaround for all Intel chipsets.  The only reason I hesitated to
apply this workaround was about the possibly slightly higher CPU usage.
But if the lack of sync causes a much severer problem even for quite
old chip, we should think this would be necessary for all Intel chips.

Reported-by: Klaus Ethgen <Klaus@ethgen.ch>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20191223171833.GA17053@chua
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index f69c8de64bd6..5b92f290cbb0 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -282,12 +282,13 @@ enum {
 
 /* quirks for old Intel chipsets */
 #define AZX_DCAPS_INTEL_ICH \
-	(AZX_DCAPS_OLD_SSYNC | AZX_DCAPS_NO_ALIGN_BUFSIZE)
+	(AZX_DCAPS_OLD_SSYNC | AZX_DCAPS_NO_ALIGN_BUFSIZE |\
+	 AZX_DCAPS_SYNC_WRITE)
 
 /* quirks for Intel PCH */
 #define AZX_DCAPS_INTEL_PCH_BASE \
 	(AZX_DCAPS_NO_ALIGN_BUFSIZE | AZX_DCAPS_COUNT_LPIB_DELAY |\
-	 AZX_DCAPS_SNOOP_TYPE(SCH))
+	 AZX_DCAPS_SNOOP_TYPE(SCH) | AZX_DCAPS_SYNC_WRITE)
 
 /* PCH up to IVB; no runtime PM; bind with i915 gfx */
 #define AZX_DCAPS_INTEL_PCH_NOPM \
@@ -302,13 +303,13 @@ enum {
 #define AZX_DCAPS_INTEL_HASWELL \
 	(/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_COUNT_LPIB_DELAY |\
 	 AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\
-	 AZX_DCAPS_SNOOP_TYPE(SCH))
+	 AZX_DCAPS_SNOOP_TYPE(SCH) | AZX_DCAPS_SYNC_WRITE)
 
 /* Broadwell HDMI can't use position buffer reliably, force to use LPIB */
 #define AZX_DCAPS_INTEL_BROADWELL \
 	(/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_POSFIX_LPIB |\
 	 AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\
-	 AZX_DCAPS_SNOOP_TYPE(SCH))
+	 AZX_DCAPS_SNOOP_TYPE(SCH) | AZX_DCAPS_SYNC_WRITE)
 
 #define AZX_DCAPS_INTEL_BAYTRAIL \
 	(AZX_DCAPS_INTEL_PCH_BASE | AZX_DCAPS_I915_COMPONENT)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
