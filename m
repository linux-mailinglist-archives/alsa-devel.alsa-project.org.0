Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1598CD4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 10:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA01D166F;
	Thu, 22 Aug 2019 10:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA01D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566461005;
	bh=VibVPAicDVUOAgg7uJ+o06w3G2VAJccJJOPGYo4+vzQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S5BPp/FOhf3dGVsU/sTPgQtyEihEDmesPPTMIaR+pmqOreusuSODG91KnioPQH9Qq
	 8hg+tptT3yaRsgX0TC4X/Uz83ytH0DZP0SAQEBWqnmVxPR0CIkNeoUW5M+l4qu/XVj
	 VKNAkPVqhwVVYimWtvtiHiXBncUbjOGbBjeyDxwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 665E7F805A1;
	Thu, 22 Aug 2019 10:01:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1556AF8036D; Thu, 22 Aug 2019 10:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A67F9F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 10:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67F9F80147
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4760AAC1C
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 08:00:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 10:00:41 +0200
Message-Id: <20190822080042.15772-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda/realtek - Check beep whitelist
	before assigning in all codecs
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

Some Realtek codec parsers didn't check the availability of PC beep.
Add has_cdefine_beep() check appropriately.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b6ae452a1d8f..19831521bd95 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2848,7 +2848,8 @@ static int patch_alc268(struct hda_codec *codec)
 		return err;
 
 	spec = codec->spec;
-	spec->gen.beep_nid = 0x01;
+	if (has_cdefine_beep(codec))
+		spec->gen.beep_nid = 0x01;
 
 	spec->shutup = alc_eapd_shutup;
 
@@ -8102,7 +8103,8 @@ static int patch_alc861(struct hda_codec *codec)
 		return err;
 
 	spec = codec->spec;
-	spec->gen.beep_nid = 0x23;
+	if (has_cdefine_beep(codec))
+		spec->gen.beep_nid = 0x23;
 
 #ifdef CONFIG_PM
 	spec->power_hook = alc_power_eapd;
@@ -8203,7 +8205,8 @@ static int patch_alc861vd(struct hda_codec *codec)
 		return err;
 
 	spec = codec->spec;
-	spec->gen.beep_nid = 0x23;
+	if (has_cdefine_beep(codec))
+		spec->gen.beep_nid = 0x23;
 
 	spec->shutup = alc_eapd_shutup;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
