Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7615493D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:31:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A43416B9;
	Thu,  6 Feb 2020 17:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A43416B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006699;
	bh=a5ZDlAVraBgkSJxnEcYW74gYeMGZi1BBxV3MwXoW93w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZqorzpgN/SLTHre8cqVVafa0y7ZKj3a5HLlfgqiywAlgSV2aFC0KCMRINnMI+idH
	 sZBjkpPJ4p5hsmc4xS+Z546pRXUWjLpJm+Oo9Nl2+POnAminEfn1d86pOeuoZAe3h9
	 gfGJi67MF9PeG3EmLLv9vPcXB8xoAY0d4ZtCfS0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61B1FF8027B;
	Thu,  6 Feb 2020 17:28:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4638BF80162; Thu,  6 Feb 2020 17:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 548CBF801DB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548CBF801DB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D04A5AEE2;
 Thu,  6 Feb 2020 16:28:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:28:01 +0100
Message-Id: <20200206162804.4734-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206162804.4734-1-tiwai@suse.de>
References: <20200206162804.4734-1-tiwai@suse.de>
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ALSA: hda/hdmi: Reduce hda_jack_tbl lookup
	at unsol event handling
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

Pass hda_jack_tbl object to hdmi_intrinsic_event() along with res from
hdmi_unsol_event() so that we can reduce the lookup of the same
hda_jack_tbl object again.

Minor code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5119a9ae3d8a..c65d16dea08c 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -779,21 +779,9 @@ static void jack_callback(struct hda_codec *codec,
 	check_presence_and_report(codec, jack->nid, jack->dev_id);
 }
 
-static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
+static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res,
+				 struct hda_jack_tbl *jack)
 {
-	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
-	struct hda_jack_tbl *jack;
-
-	if (codec->dp_mst) {
-		int dev_entry =
-			(res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
-
-		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
-	} else {
-		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, 0);
-	}
-	if (!jack)
-		return;
 	jack->jack_dirty = 1;
 
 	codec_dbg(codec,
@@ -853,7 +841,7 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
 	}
 
 	if (subtag == 0)
-		hdmi_intrinsic_event(codec, res);
+		hdmi_intrinsic_event(codec, res, jack);
 	else
 		hdmi_non_intrinsic_event(codec, res);
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
