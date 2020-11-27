Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17D2C6796
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 15:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD3D1854;
	Fri, 27 Nov 2020 15:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD3D1854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606486377;
	bh=yZBAnvNgSEdeyP4TuBzqLynEWSpnR84pnfAshNGPTSA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgX5iEwh6TUCiy/StdeD8hFFk8nk2p0f4fpmWPGV7OVV1hVE0Po7RQQCH6WvUuUiM
	 aeVrezWU5D5UYugz04jnqShdAj/GEMMICCLknV33cC+wyrnik3M/PEgmJLGAu4AnVT
	 YEHuXNww66LDKlGF0GXU/xdM29GHRzvALYyJwI4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5567BF80268;
	Fri, 27 Nov 2020 15:11:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A5EF8019D; Fri, 27 Nov 2020 15:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB74F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 15:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB74F800E0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FC8DAE64
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 14:11:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda/realtek: Fix bass speaker DAC assignment on
 Asus Zephyrus G14
Date: Fri, 27 Nov 2020 15:11:04 +0100
Message-Id: <20201127141104.11041-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127141104.11041-1-tiwai@suse.de>
References: <20201127141104.11041-1-tiwai@suse.de>
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

ASUS Zephyrus G14 has two speaker pins, and the auto-parser tries to
assign an individual DAC to each pin as much as possible.
Unfortunately the third DAC has no volume control unlike the two DACs,
and this resulted in the inconsistent speaker volumes.

As a workaround, wire both speaker pins to the same DAC by modifying
the existing quirk (ALC289_FIXUP_ASUS_GA401) applied to this device.
Since this quirk entry is chained by another, we need to avoid
applying the DAC assignment change for it.  Luckily, there is another
quirk entry (ALC289_FIXUP_ASUS_GA502) doing the very same thing, so we
can chain to the GA502 quirk instead.

Note that this patch uses a new flag of the generic parser,
obey_preferred_dacs, for enforcing the DACs.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210359
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fcd1fb18ece9..c7e8680a7190 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6027,6 +6027,21 @@ static void alc274_fixup_bind_dacs(struct hda_codec *codec,
 	codec->power_save_node = 0;
 }
 
+/* avoid DAC 0x06 for bass speaker 0x17; it has no volume control */
+static void alc289_fixup_asus_ga401(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action)
+{
+	static const hda_nid_t preferred_pairs[] = {
+		0x14, 0x02, 0x17, 0x02, 0x21, 0x03, 0
+	};
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->gen.preferred_dacs = preferred_pairs;
+		spec->gen.obey_preferred_dacs = 1;
+	}
+}
+
 /* The DAC of NID 0x3 will introduce click/pop noise on headphones, so invalidate it */
 static void alc285_fixup_invalidate_dacs(struct hda_codec *codec,
 			      const struct hda_fixup *fix, int action)
@@ -7600,11 +7615,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
 	[ALC289_FIXUP_ASUS_GA401] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x19, 0x03a11020 }, /* headset mic with jack detect */
-			{ }
-		},
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc289_fixup_asus_ga401,
+		.chained = true,
+		.chain_id = ALC289_FIXUP_ASUS_GA502,
 	},
 	[ALC289_FIXUP_ASUS_GA502] = {
 		.type = HDA_FIXUP_PINS,
@@ -7728,7 +7742,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC289_FIXUP_ASUS_GA401
+		.chain_id = ALC289_FIXUP_ASUS_GA502
 	},
 	[ALC274_FIXUP_HP_MIC] = {
 		.type = HDA_FIXUP_VERBS,
-- 
2.26.2

