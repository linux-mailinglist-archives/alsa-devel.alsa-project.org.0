Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467401AF413
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 21:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45181657;
	Sat, 18 Apr 2020 21:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45181657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236912;
	bh=AP5fSImu5Kx/MIrtRWC/94G5zhnkhINWcbgNg/lsExk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TiSN7YoAjwbu/cUvhbvTxjqV7pZppeC0SLGSLoSbqVSy8VipikphiJ0CvVLNxCFnt
	 tNbodNZmB7676eQCbYlbn52UdjpaKrIhZaacJI7XGOaHcYTYXG8ydap6ik9wQPnGBM
	 dn/ttiYTPHbtpCMieSirfzHEVxud+udSl+M4+pyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7D8F8016F;
	Sat, 18 Apr 2020 21:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0763F8014E; Sat, 18 Apr 2020 21:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC697F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 21:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC697F80122
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E186AD72
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 19:06:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - Fix unexpected init_amp override
Date: Sat, 18 Apr 2020 21:06:39 +0200
Message-Id: <20200418190639.10082-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The commit 1c76aa5fb48d ("ALSA: hda/realtek - Allow skipping
spec->init_amp detection") changed the way to assign spec->init_amp
field that specifies the way to initialize the amp.  Along with the
change, the commit also replaced a few fixups that set spec->init_amp
in HDA_FIXUP_ACT_PROBE with HDA_FIXUP_ACT_PRE_PROBE.  This was rather
aligning to the other fixups, and not supposed to change the actual
behavior.

However, this change turned out to cause a regression on FSC S7020,
which hit exactly the above.  The reason was that there is still one
place that overrides spec->init_amp after HDA_FIXUP_ACT_PRE_PROBE
call, namely in alc_ssid_check().

This patch fixes the regression by adding the proper spec->init_amp
override check, i.e. verifying whether it's still ALC_INIT_UNDEFINED.

Fixes: 1c76aa5fb48d ("ALSA: hda/realtek - Allow skipping spec->init_amp detection")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207329
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dc5557d79c43..54e1c9c0a33f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -797,9 +797,11 @@ static void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
 {
 	if (!alc_subsystem_id(codec, ports)) {
 		struct alc_spec *spec = codec->spec;
-		codec_dbg(codec,
-			  "realtek: Enable default setup for auto mode as fallback\n");
-		spec->init_amp = ALC_INIT_DEFAULT;
+		if (spec->init_amp == ALC_INIT_UNDEFINED) {
+			codec_dbg(codec,
+				  "realtek: Enable default setup for auto mode as fallback\n");
+			spec->init_amp = ALC_INIT_DEFAULT;
+		}
 	}
 }
 
-- 
2.25.0

