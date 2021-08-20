Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEA3F2E25
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 16:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902C81676;
	Fri, 20 Aug 2021 16:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902C81676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629470026;
	bh=hb1FteaiFjxj4Sh/v3Gpg/D8bjLwvAALDku63DLHdm4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9xUSh+HyG+z0m2wPSsvbWcgUmOqLXPVciCk+mIxTgrXx/16OnC4QREof54OIPwf0
	 E/hMFAGSCmH7ubgsLZ8l0KiybwYZNg2a1IwY38N0aE+WF/UYgJsT2LeHTvbDt4ezJ8
	 1DqnRQ4rVaoj1KFMpuGPOly5ZRzG6uDxMbc4pdRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20202F80259;
	Fri, 20 Aug 2021 16:32:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19557F80249; Fri, 20 Aug 2021 16:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADA90F800EC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 16:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA90F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zLW7tTdv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/l7q3CpQ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2CC731FE1C
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629469936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QDRgVCbD1a3ZlbdzEVPWKhSGGil4dGkYjGirqOoMBzs=;
 b=zLW7tTdvWXDGh6UTPeugMHXXiEscrKMQI5v2nZ0/LPADVn7lSCIxeH3X+xnlKTQUMOqKkZ
 pQXCpgqxKBkky9b04Y1XsFg/1ofGj6zT41PauEdEHeLCAuaNkOxpx8BDUp1ZjOpoVJfiCU
 7hQTp00xUrY49xGU/mG/DJ/o1o9giSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629469936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QDRgVCbD1a3ZlbdzEVPWKhSGGil4dGkYjGirqOoMBzs=;
 b=/l7q3CpQTMK/c+Ow/C3pOEDHrgL9RxqslNbQmcy2WCk9mhrm8AruKmywsARu9Ek895SfHG
 +fYrndQ6oTc3pWBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 25912A3B92;
 Fri, 20 Aug 2021 14:32:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Workaround for conflicting SSID on ASUS
 ROG Strix G17
Date: Fri, 20 Aug 2021 16:32:14 +0200
Message-Id: <20210820143214.3654-1-tiwai@suse.de>
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

ASUS ROG Strix G17 has the very same PCI and codec SSID (1043:103f) as
ASUS TX300, and unfortunately, the existing quirk for TX300 is broken
on ASUS ROG.  Actually the device works without the quirk, so we'll
need to clear the quirk before applying for this device.
Since ASUS ROG has a different codec (ALC294 - while TX300 has
ALC282), this patch adds a workaround for the device, just clearing
the codec->fixup_id by checking the codec vendor_id.

It's a bit ugly to add such a workaround there, but it seems to be the
simplest way.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214101
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7ad689f991e7..3d525b79b848 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9521,6 +9521,16 @@ static int patch_alc269(struct hda_codec *codec)
 
 	snd_hda_pick_fixup(codec, alc269_fixup_models,
 		       alc269_fixup_tbl, alc269_fixups);
+	/* FIXME: both TX300 and ROG Strix G17 have the same SSID, and
+	 * the quirk breaks the latter (bko#214101).
+	 * Clear the wrong entry.
+	 */
+	if (codec->fixup_id == ALC282_FIXUP_ASUS_TX300 &&
+	    codec->core.vendor_id == 0x10ec0294) {
+		codec_dbg(codec, "Clear wrong fixup for ASUS ROG Strix G17\n");
+		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
+	}
+
 	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
 	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
 	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
-- 
2.26.2

