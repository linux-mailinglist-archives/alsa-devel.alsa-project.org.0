Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84C30BAEC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 10:29:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26A7B1764;
	Tue,  2 Feb 2021 10:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26A7B1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612258169;
	bh=PCa++kbWWWcJ806KpSMTQM8HOSmvGsr9GQoE8jmjVsg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t+mCYRwH1rPECXbOHHof/x/VAmm59RtHgDBTjyXBh+LL3ayLpamUNTAErSKHWvDb3
	 eARMuyvgxmL04jY0YablbDBAGOF0tHArSr9z72Crp8Vo85EKUB+UcYY5DZWTffmbac
	 i1VJxk4ivaS1kFIRFOde/f4NH82MhPJSui9lKGzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C8C4F801F7;
	Tue,  2 Feb 2021 10:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 927CBF80171; Tue,  2 Feb 2021 10:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC78F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 10:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC78F8013C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7931CB171
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 09:27:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Drop power save deny list entry for Clevo W65_67SB
Date: Tue,  2 Feb 2021 10:27:44 +0100
Message-Id: <20210202092744.20321-1-tiwai@suse.de>
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

As the runtime PM issue was addressed by the recent fix 4961167bf748
("ALSA: hda/via: Apply the workaround generically for Clevo machines")
for VIA codecs, we need no longer to keep the Clevo device off from
the power saving as default.  Drop the deny list entry accordingly.

Depends: 4961167bf748 ("ALSA: hda/via: Apply the workaround generically for Clevo machines")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5a50d3a46445..ef1f3aabc4a3 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2221,8 +2221,6 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1043, 0x8733, "Asus Prime X370-Pro", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
-	SND_PCI_QUIRK(0x1558, 0x6504, "Clevo W65_67SB", 0),
-	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1028, 0x0497, "Dell Precision T3600", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	/* Note the P55A-UD3 and Z87-D3HP share the subsys id for the HDA dev */
-- 
2.26.2

