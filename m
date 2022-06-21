Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C155318D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 14:01:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF47F224F;
	Tue, 21 Jun 2022 14:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF47F224F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655812914;
	bh=qjpYr7d65Vb1p/cOGKGYqrffPaKpQgRvaDvuTBMzq4o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FU06WA9IG7S4e84mM5pm0EznIlUc8fiqHY4NydliHCPFLTd/BmgYglQITcWzj8foR
	 L5vDGI46o6sTH6lNMqslnQ2GFzqL//QkU/WGqzc8PeXzpJTbBWPrKK3eEWvhuTHNnp
	 m3hMsARclGk4VPK5wV+SsRGqYwmPo1IpyIOldLAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 004E3F80253;
	Tue, 21 Jun 2022 14:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58D98F800CB; Tue, 21 Jun 2022 14:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E90AAF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 14:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E90AAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PMSnvb9P"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8nbDez45"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 264A921C62;
 Tue, 21 Jun 2022 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655812847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/QMsDJItj/GQBqWAiQh4CqtEy4N0BYINY9d85+5WldY=;
 b=PMSnvb9PA4jdzrcXcc1WuOnCpL4dXhOVJNegQVJThLthTuL097f3A5iRIHoORpOfWw94qp
 /O7JNDbtecd5iuvopR22RDSg2FvaShZfPFsBmIngybtTjUqS5Mt41pZDMSS0edDgrrFo7c
 0OL0aliENjEqp4jWj8RygvOXqHUhtVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655812847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/QMsDJItj/GQBqWAiQh4CqtEy4N0BYINY9d85+5WldY=;
 b=8nbDez45h9024SYgiRZbNkPLbp/nc/V5WsemTji4XPTRhTHnqRuPsq1bGK8aeRhRet/+su
 DPkYsrky+mYBEHAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 171B213638;
 Tue, 21 Jun 2022 12:00:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SdwwBe+ysWLRegAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 21 Jun 2022 12:00:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix discovery of i915 graphics PCI device
Date: Tue, 21 Jun 2022 14:00:44 +0200
Message-Id: <20220621120044.11573-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

It's been reported that the recent fix for skipping the
component-binding with D-GPU caused a regression on some systems; it
resulted in the completely missing component binding with i915 GPU.

The problem was the use of pci_get_class() function.  It matches with
the full PCI class bits, while we want to match only partially the PCI
base class bits.  So, when a system has an i915 graphics device with
the PCI class 0380, it won't hit because we're looking for only the
PCI class 0300.

This patch fixes i915_gfx_present() to look up each PCI device and
match with PCI base class explicitly instead of pci_get_class().

Fixes: c9db8a30d9f0 ("ALSA: hda/i915 - skip acomp init if no matching display")
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1200611
Link: https://lore.kernel.org/r/87bkunztec.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_i915.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 3f35972e1cf7..161a9711cd63 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -119,21 +119,18 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 /* check whether Intel graphics is present and reachable */
 static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
-	unsigned int class = PCI_BASE_CLASS_DISPLAY << 16;
 	struct pci_dev *display_dev = NULL;
-	bool match = false;
 
-	do {
-		display_dev = pci_get_class(class, display_dev);
-
-		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
+	for_each_pci_dev(display_dev) {
+		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
+		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
 		    connectivity_check(display_dev, hdac_pci)) {
 			pci_dev_put(display_dev);
-			match = true;
+			return true;
 		}
-	} while (!match && display_dev);
+	}
 
-	return match;
+	return false;
 }
 
 /**
-- 
2.35.3

