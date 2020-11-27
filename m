Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E62C6795
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 15:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1841847;
	Fri, 27 Nov 2020 15:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1841847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606486369;
	bh=bYvebnYLTkhcj0vptQ2L/1lyUBY17MFMzDjiflawfBE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kY/BLEBkexZJRM8dG9PHkUNeIx5tmugD6QrgYI9UulSBmHaDR17cRtXM6ywZausZz
	 aSpq4B9lRtd43dK8l5//rLRGT3XdYkJKTm73PaiB6yJTopmDS4mHnJS3aWGE1LHreP
	 1aUWFM6vE/6VSq7/16QhPDoPilUe/Ba16xD6uCGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9429FF8015F;
	Fri, 27 Nov 2020 15:11:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED543F80218; Fri, 27 Nov 2020 15:11:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46358F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 15:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46358F800EA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC5E9AC23
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 14:11:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda/generic: Add option to enforce preferred_dacs
 pairs
Date: Fri, 27 Nov 2020 15:11:03 +0100
Message-Id: <20201127141104.11041-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The generic parser accepts the preferred_dacs[] pairs as a hint for
assigning a DAC to each pin, but this hint doesn't work always
effectively.  Currently it's merely a secondary choice after the trial
with the path index failed.  This made sometimes it difficult to
assign DACs without mimicking the connection list and/or the badness
table.

This patch adds a new flag, obey_preferred_dacs, that changes the
behavior of the parser.  As its name stands, the parser obeys the
given preferred_dacs[] pairs by skipping the path index matching and
giving a high penalty if no DAC is assigned by the pairs.  This mode
will help for assigning the fixed DACs forcibly from the codec
driver.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 12 ++++++++----
 sound/pci/hda/hda_generic.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index bbb17481159e..8060cc86dfea 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -1364,16 +1364,20 @@ static int try_assign_dacs(struct hda_codec *codec, int num_outs,
 		struct nid_path *path;
 		hda_nid_t pin = pins[i];
 
-		path = snd_hda_get_path_from_idx(codec, path_idx[i]);
-		if (path) {
-			badness += assign_out_path_ctls(codec, path);
-			continue;
+		if (!spec->obey_preferred_dacs) {
+			path = snd_hda_get_path_from_idx(codec, path_idx[i]);
+			if (path) {
+				badness += assign_out_path_ctls(codec, path);
+				continue;
+			}
 		}
 
 		dacs[i] = get_preferred_dac(codec, pin);
 		if (dacs[i]) {
 			if (is_dac_already_used(codec, dacs[i]))
 				badness += bad->shared_primary;
+		} else if (spec->obey_preferred_dacs) {
+			badness += BAD_NO_PRIMARY_DAC;
 		}
 
 		if (!dacs[i])
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index a43f0bb77dae..0886bc81f40b 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -237,6 +237,7 @@ struct hda_gen_spec {
 	unsigned int power_down_unused:1; /* power down unused widgets */
 	unsigned int dac_min_mute:1; /* minimal = mute for DACs */
 	unsigned int suppress_vmaster:1; /* don't create vmaster kctls */
+	unsigned int obey_preferred_dacs:1; /* obey preferred_dacs assignment */
 
 	/* other internal flags */
 	unsigned int no_analog:1; /* digital I/O only */
-- 
2.26.2

