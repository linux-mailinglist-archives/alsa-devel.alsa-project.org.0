Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925C11016F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 16:42:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8E71655;
	Tue,  3 Dec 2019 16:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8E71655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575387778;
	bh=ZVCCIxHL2GsOQbfRHk2od4GZuplVCUUSLIRxCGvZ/X8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DwvsE7ZWNYSdl7BRxgDycOO660bXP8SJc4oV+mKzJm+5T0dsRl9O6N4KPbmmFkW6s
	 zaJVJSV5qABSTeLgq4O/8W9wxERdtXXcUv+S+NErqzsJVmtI2UpvQf1OD2h1bW4OQK
	 0oI7jSt8FnY/rgMDkE75+ijVDV6YANpth7h+ZmQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16441F8015A;
	Tue,  3 Dec 2019 16:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC3DEF80227; Tue,  3 Dec 2019 16:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10724F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 16:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10724F800B4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7C5569BB8;
 Tue,  3 Dec 2019 15:41:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  3 Dec 2019 16:41:05 +0100
Message-Id: <20191203154105.30414-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: hdmi - Keep old slot assignment
	behavior for Intel platforms
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

The commit 609f5485344b ("ALSA: hda: hdmi - preserve non-MST PCM
routing for Intel platforms") tried to restore the old behavior wrt
assignment of the PCM slot for Intel platforms, but this didn't do it
right.  As found in the later discussion, even on non-MST, a positive
pipe id is passed, which is equivalent with dev_id on Intel.

This patch reverts the previous attempt and applies a simpler
workaround instead.  Actually, for Intel platforms, we can handle as
if per_pin->dev_id=0, assign the primary slot at the first try.  This
assures the compatible behavior with the previous versions regarding
the slot assignment.

Fixes: 609f5485344b ("ALSA: hda: hdmi - preserve non-MST PCM routing for Intel platforms")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index ed4e98a1057a..78647ee02339 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1348,21 +1348,18 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 	 * with the legacy static per_pin-pcm assignment that existed in the
 	 * days before DP-MST.
 	 *
+	 * Intel DP-MST prefers this legacy behavior for compatibility, too.
+	 *
 	 * per_pin of m!=0 prefers to get pcm=(num_nids + (m - 1)).
 	 */
 
-	if (per_pin->dev_id == 0) {
+	if (per_pin->dev_id == 0 || spec->intel_hsw_fixup) {
 		if (!test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
 			return per_pin->pin_nid_idx;
 	} else {
 		i = spec->num_nids + (per_pin->dev_id - 1);
 		if (i < spec->pcm_used && !(test_bit(i, &spec->pcm_bitmap)))
 			return i;
-
-		/* keep legacy assignment for dev_id>0 on Intel platforms */
-		if (spec->intel_hsw_fixup)
-			if (!test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
-				return per_pin->pin_nid_idx;
 	}
 
 	/* have a second try; check the area over num_nids */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
