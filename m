Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73D1306BF
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 09:13:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE071750;
	Sun,  5 Jan 2020 09:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE071750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578211995;
	bh=FGFABkngWJ00uZKtVmGlJ0q5rLUKxs/CjZJon3sLFd4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ESW3+0cbT2cbl7QtKyK7JCNk4qJUdqCuIuQN/lmiP8D4wvB7DpuGZroXBGw4uOJdH
	 dB3LuQP1IGk9Ll5lRlYGY2nP0G0z+FCLFZnuj55izdG1zVxU0AuuYCT4W19ZNtJs6K
	 S5Wqb7c9EMIe2IbYIslef1f+lKCJNQhu3WJUGTbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EEFF80172;
	Sun,  5 Jan 2020 09:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E624F8014A; Sun,  5 Jan 2020 09:11:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7EAEF8013F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 09:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7EAEF8013F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 415ECB1E5
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 08:11:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 09:11:19 +0100
Message-Id: <20200105081119.21396-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Apply mic mute LED quirk
	for Dell E7xx laptops, too
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

Dell E7xx laptops have also mic mute LED that is driven by the
dell-laptop platform driver.  Bind it with the capture control as
already done for other models.

A caveat is that the fixup hook for the mic mute LED has to be applied
at last, otherwise it results in the invalid override of the callback.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205529
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 40e30ea86663..03da83bcd6b9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5844,6 +5844,7 @@ enum {
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
 	ALC288_FIXUP_DISABLE_AAMIX,
+	ALC292_FIXUP_DELL_E7X_AAMIX,
 	ALC292_FIXUP_DELL_E7X,
 	ALC292_FIXUP_DISABLE_AAMIX,
 	ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK,
@@ -6536,12 +6537,19 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC293_FIXUP_DELL1_MIC_NO_PRESENCE
 	},
-	[ALC292_FIXUP_DELL_E7X] = {
+	[ALC292_FIXUP_DELL_E7X_AAMIX] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_dell_xps13,
 		.chained = true,
 		.chain_id = ALC292_FIXUP_DISABLE_AAMIX
 	},
+	[ALC292_FIXUP_DELL_E7X] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = snd_hda_gen_fixup_micmute_led,
+		/* micmute fixup must be applied at last */
+		.chained_before = true,
+		.chain_id = ALC292_FIXUP_DELL_E7X_AAMIX,
+	},
 	[ALC298_FIXUP_ALIENWARE_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
